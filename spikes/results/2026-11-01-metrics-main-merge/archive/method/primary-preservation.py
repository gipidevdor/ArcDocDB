"""Read local changes, refuse overlap, and verify all pre-existing bytes after ff."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys

PRIMARY = Path('/Users/gpicchiarelli/Documents/ArcDocDB')
SESSION = Path(__file__).resolve().parent

def git(*args):
    return subprocess.run(['git', '-C', str(PRIMARY), *args], check=True, stdout=subprocess.PIPE).stdout

def digest(path):
    if path.is_symlink():
        return {'kind': 'symlink', 'target': os.readlink(path)}
    if not path.exists():
        return {'kind': 'absent'}
    if not path.is_file():
        raise RuntimeError(f'Nonregular local change: {path}')
    h = hashlib.sha256()
    size = 0
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            size += len(block)
            h.update(block)
    return {'kind': 'regular', 'bytes': size, 'sha256': h.hexdigest()}

def save(name, data):
    with (SESSION / name).open('x') as stream:
        json.dump(data, stream, indent=2, sort_keys=True)
        stream.write('\n')

mode, target = sys.argv[1:]
if mode == 'before':
    head = git('rev-parse', 'HEAD').decode().strip()
    status = git('status', '--porcelain=v1', '-z', '--untracked-files=all').decode()
    paths = sorted(set(p for p in git('ls-files', '-m', '-o', '--exclude-standard', '-z').decode().split('\0') if p))
    changed = [p for p in git('diff', '--name-only', '-z', head, target).decode().split('\0') if p]
    overlaps = [(p, q) for p in paths for q in changed
                if p == q or p.startswith(q + '/') or q.startswith(p + '/')]
    if overlaps:
        raise RuntimeError(f'Local work overlaps the target: {overlaps}')
    rows = [{'path': p, **digest(PRIMARY / p)} for p in paths]
    save('primary-before.json', {'schema_version': 1, 'kind': 'primary-local-work-before',
         'head': head, 'target': target, 'status_z': status, 'files': rows,
         'target_overlap': False})
    print(json.dumps({'status': 'ok', 'local_files': len(rows), 'overlaps': 0}))
elif mode == 'after':
    before = json.loads((SESSION / 'primary-before.json').read_text())
    for row in before['files']:
        actual = {'path': row['path'], **digest(PRIMARY / row['path'])}
        if actual != row:
            raise RuntimeError(f'Local bytes changed: {row["path"]}')
    head = git('rev-parse', 'HEAD').decode().strip()
    if head != target:
        raise RuntimeError(f'Unexpected primary HEAD: {head}')
    save('primary-after-' + target[:12] + '.json', {'schema_version': 1,
         'kind': 'primary-local-work-preservation', 'status': 'ok',
         'head': head, 'original_head': before['head'],
         'preserved_files': len(before['files']), 'all_preexisting_bytes_unchanged': True})
    print(json.dumps({'status': 'ok', 'head': head, 'preserved_files': len(before['files'])}))
else:
    raise RuntimeError('Use before/after TARGET')
