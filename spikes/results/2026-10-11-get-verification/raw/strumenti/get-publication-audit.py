#!/usr/bin/env python3
"""Read-only, count-independent audit of the published GET campaign.

Reads Lisp records only through the repository's trusted evidence-storage.lisp.
Never LOADs campaign records, scripts, FASL or SB-COVER state. Default validates
published bytes and available originals; --require-sources also requires every
original and its complete source-group inventory. A preservation audit does
not change native statuses or qualify the product.
"""
import argparse
import gzip
import hashlib
import io
import json
import os
from pathlib import Path
import re
import stat
import subprocess
import sys
import tempfile

PLAIN_LIMIT = 1048576
GZIP_LIMIT = 8388608
EXPANDED_LIMIT = 134217728
CAMPAIGN = "spikes/results/2026-10-11-get-verification"


def fail(message):
    raise RuntimeError(message)


def leaf(value):
    if (not isinstance(value, str) or not value or value in (".", "..")
            or any(character in value for character in '/\\\x00*?[]')):
        fail(f"Invalid artifact LEAF: {value!r}")
    return value


def relative(value):
    if not isinstance(value, str) or not value or '\x00' in value:
        fail(f"Invalid relative path: {value!r}")
    path = Path(value)
    if path.is_absolute() or '..' in path.parts or '\\' in value:
        fail(f"Unsafe relative path: {value!r}")
    return path


def ancestors(path):
    for parent in path.parents:
        if parent.exists() and (parent.is_symlink() or not parent.is_dir()):
            fail(f"Unknown or symlink ancestor: {parent}")


def bytes_at(path, limit=EXPANDED_LIMIT):
    ancestors(path)
    before = path.lstat()
    if not stat.S_ISREG(before.st_mode) or before.st_size > limit:
        fail(f"Nonregular/symlink/over-budget file: {path}")
    data = path.read_bytes()
    after = path.lstat()
    if ((before.st_ino, before.st_size, before.st_mtime_ns)
            != (after.st_ino, after.st_size, after.st_mtime_ns)):
        fail(f"File changed while reading: {path}")
    return data


def sha(data):
    return hashlib.sha256(data).hexdigest()


def require_sha(value):
    if not isinstance(value, str) or not re.fullmatch(r'[0-9a-f]{64}', value):
        fail(f"Invalid SHA-256: {value!r}")
    return value


def expanded_gzip(data):
    digest = hashlib.sha256()
    size = 0
    with gzip.GzipFile(fileobj=io.BytesIO(data), mode='rb') as stream:
        while True:
            chunk = stream.read(min(1048576, EXPANDED_LIMIT + 1 - size))
            if not chunk:
                break
            size += len(chunk)
            if size > EXPANDED_LIMIT:
                fail("Gzip expansion exceeds the finite 128 MiB budget")
            digest.update(chunk)
    return size, digest.hexdigest()


def inventory(root):
    ancestors(root)
    if root.is_symlink() or not root.is_dir():
        fail(f"Missing or symlink directory: {root}")
    files = set()
    for path in root.rglob('*'):
        metadata = path.lstat()
        if stat.S_ISREG(metadata.st_mode):
            files.add(path.relative_to(root).as_posix())
        elif not stat.S_ISDIR(metadata.st_mode):
            fail(f"Unknown or symlink directory member: {path}")
    return files


def lisp_string(value):
    return '"' + str(value).replace('\\', '\\\\').replace('"', '\\"') + '"'


def read_records(workspace, paths):
    """Only trusted library code executes; evidence is passed to READ-EVIDENCE."""
    script = r'''
(require :asdf)
(load __STORAGE__)
(defun json-string (value)
  (write-char #\")
  (loop for ch across value do
    (case ch
      (#\" (write-string "\\\"")) (#\\ (write-string "\\\\"))
      (#\Newline (write-string "\\n")) (#\Return (write-string "\\r"))
      (#\Tab (write-string "\\t"))
      (t (if (< (char-code ch) 32)
             (format t "\\u~4,'0X" (char-code ch)) (write-char ch)))))
  (write-char #\"))
(defun proper-plist-p (value)
  (and (consp value) (listp value) (evenp (length value))
       (loop for tail on value by #'cddr always (keywordp (first tail)))))
(defun json-value (value)
  (cond ((null value) (write-string "null"))
        ((eq value t) (write-string "true"))
        ((stringp value) (json-string value))
        ((integerp value) (princ value))
        ((symbolp value) (json-string (string-downcase (symbol-name value))))
        ((proper-plist-p value)
         (write-char #\{)
         (loop for (key item) on value by #'cddr for first = t then nil do
           (unless first (write-char #\,))
           (json-string (string-downcase (symbol-name key)))
           (write-char #\:) (json-value item))
         (write-char #\}))
        ((listp value)
         (write-char #\[)
         (loop for item in value for first = t then nil do
           (unless first (write-char #\,)) (json-value item))
         (write-char #\]))
        (t (error "Unsupported audited field type."))))
(defun field (key value &optional first)
  (unless first (write-char #\,))
  (json-string key) (write-char #\:) (json-value value))
(dolist (name (uiop:command-line-arguments))
  (let* ((path (pathname name))
         (before (arcdocdb.evidence:file-sha256 path))
         (data (arcdocdb.evidence:read-evidence path :max-expanded-bytes 134217728))
         (schema (or (getf data :schema-version) (getf data :schema)))
         (descriptor nil) (expanded-size nil) (expanded-sha nil))
    (unless (eql schema 1) (error "Record ~A has no schema 1." name))
    (when (<= (arcdocdb.evidence:file-bytes path) 1048576)
      (let* ((size (arcdocdb.evidence:file-bytes path))
             (bytes (make-array size :element-type '(unsigned-byte 8))))
        (with-open-file (in path :element-type '(unsigned-byte 8))
          (unless (= size (read-sequence bytes in)) (error "Short metadata read.")))
        (when (arcdocdb.evidence::%descriptor-candidate-p bytes)
          (setf descriptor (arcdocdb.evidence::%read-plist bytes path))
          (arcdocdb.evidence::%validate-descriptor descriptor path 134217728))))
    (arcdocdb.evidence:call-with-evidence-bytes
     path (lambda (plain)
            (setf expanded-size (arcdocdb.evidence:file-bytes plain)
                  expanded-sha (arcdocdb.evidence:file-sha256 plain)))
     :max-expanded-bytes 134217728)
    (unless (string= before (arcdocdb.evidence:file-sha256 path))
      (error "Record changed during data audit: ~A" name))
    (write-char #\{) (field "path" name t)
    (field "schema" schema) (field "stored_sha256" before)
    (field "expanded_bytes" expanded-size) (field "expanded_sha256" expanded-sha)
    (field "source_blobs_equal"
           (when (or (getf data :source-blobs-before) (getf data :source-blobs-after))
             (if (equal (getf data :source-blobs-before) (getf data :source-blobs-after))
                 "true" "false")))
    (field "descriptor_payload" (getf descriptor :payload))
    (field "descriptor_compressed_bytes" (getf descriptor :compressed-bytes))
    (field "descriptor_compressed_sha256" (getf descriptor :compressed-sha256))
    (dolist (key '(:kind :status :scope :exit-code :source-consistency
                   :entries :associated-raw-files :files :copied-byte-equality :rows
                   :native-record-audits :consultation-references
                   :native-record :native-kind :native-status :native-exit-code
                   :native-source-consistency :native-expanded-bytes :native-expanded-sha256))
      (field (string-downcase (symbol-name key)) (getf data key)))
    (write-char #\}) (terpri)))
'''.replace('__STORAGE__', lisp_string(workspace / 'tools/evidence-storage.lisp'))
    own = Path(__file__).resolve().parent
    with tempfile.NamedTemporaryFile('w', suffix='.lisp', prefix='get-audit-data-',
                                     dir=own, delete=False) as stream:
        stream.write(script)
        name = stream.name
    try:
        result = subprocess.run(
            ['sbcl', '--dynamic-space-size', '2048', '--noinform', '--no-userinit',
             '--no-sysinit', '--disable-debugger', '--script', name]
            + [str(path) for path in paths], cwd=workspace, capture_output=True,
            text=True, timeout=180)
        if result.returncode:
            fail(f"Trusted data reader refused records ({result.returncode}): {result.stderr[-5000:]}")
        rows = [json.loads(line) for line in result.stdout.splitlines() if line.startswith('{')]
        if len(rows) != len(paths) or len({row['path'] for row in rows}) != len(paths):
            fail("Trusted data reader returned an incomplete or duplicate inventory")
        return {row['path']: row for row in rows}
    finally:
        os.unlink(name)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--workspace', type=Path, default=Path.cwd())
    parser.add_argument('--campaign', default=CAMPAIGN)
    parser.add_argument('--require-sources', action='store_true')
    args = parser.parse_args()
    workspace = args.workspace.resolve(strict=True)
    campaign = workspace / relative(args.campaign)
    if campaign != workspace / CAMPAIGN:
        fail(f"This audit owns only {workspace / CAMPAIGN}")
    files_before = inventory(campaign)
    published_hashes = {}
    for name in sorted(files_before):
        path = campaign / name
        data = bytes_at(path, GZIP_LIMIT if path.suffix == '.gz' else PLAIN_LIMIT)
        published_hashes[name] = sha(data)
        if path.suffix == '.gz':
            expanded_gzip(data)
    roots = [campaign / 'catalogo.lisp', campaign / 'audit-copia.lisp']
    root_records = read_records(workspace, roots)
    catalog = root_records[str(roots[0])]
    audit = root_records[str(roots[1])]
    if catalog['kind'] != 'evidence-catalog' or catalog['scope'] != 'get-verification':
        fail("Wrong catalog kind or scope")
    if (audit['kind'] != 'get-publication-byte-audit' or audit['status'] != 'ok'
            or audit['copied-byte-equality'] != 'checked'):
        fail("Wrong generated byte audit kind/status")
    artifacts = [leaf(entry['artifact']) for entry in catalog['entries'] or []]
    if len(artifacts) != len(set(artifacts)) or 'audit-copia.lisp' not in artifacts:
        fail("Catalog has duplicate artifacts or omits its byte audit")
    raw_rows = catalog['associated-raw-files'] or []
    raw_paths = [relative(row['file']).as_posix() for row in raw_rows]
    if len(raw_paths) != len(set(raw_paths)) or any(not name.startswith('raw/') for name in raw_paths):
        fail("Catalog raw inventory is duplicated or outside raw/")
    actual_raw = {name for name in files_before if name.startswith('raw/')}
    if set(raw_paths) != actual_raw:
        fail("Catalog raw inventory differs from the complete published raw tree")
    for row in raw_rows:
        path = campaign / relative(row['file'])
        data = bytes_at(path, GZIP_LIMIT if path.suffix == '.gz' else PLAIN_LIMIT)
        if len(data) != row['byte-count'] or sha(data) != require_sha(row['sha256']):
            fail(f"Raw catalog byte/hash mismatch: {path}")
    copies = audit['rows'] or []
    copied_paths = [relative(row['published']).as_posix() for row in copies]
    if audit['files'] != len(copies) or len(copied_paths) != len(set(copied_paths)):
        fail("Byte audit has wrong count or duplicate destinations")
    if {name for name in copied_paths if name.startswith('raw/')} != actual_raw:
        fail("Byte audit does not cover exactly every published raw file")
    available_sources = {}
    missing_sources = set()
    source_groups = {}
    source_group_members = {}
    for row in copies:
        destination = campaign / relative(row['published'])
        source_relative = relative(row['original'])
        source = workspace / source_relative
        data = bytes_at(destination, GZIP_LIMIT if destination.suffix == '.gz' else PLAIN_LIMIT)
        if len(data) != row['stored-bytes'] or sha(data) != require_sha(row['sha256']):
            fail(f"Copied bytes mismatch: {destination}")
        transformed = row.get('transformation')
        if transformed:
            if transformed != 'gzip-lossless' or destination.suffix != '.gz':
                fail(f"Unknown byte transformation: {destination}")
            expanded = expanded_gzip(data)
            if expanded != (row['expanded-bytes'], require_sha(row['expanded-sha256'])):
                fail(f"Lossless gzip manifest mismatch: {destination}")
            expected_source = expanded
        else:
            expected_source = (len(data), sha(data))
        if source.exists() or source.is_symlink():
            original = bytes_at(source)
            if (len(original), sha(original)) != expected_source:
                fail(f"Original source bytes differ: {source}")
            available_sources[source] = sha(original)
        else:
            missing_sources.add(source)
            if args.require_sources:
                fail(f"Required original source missing: {source}")
        published_relative = relative(row['published'])
        if published_relative.parts[0] == 'raw':
            if len(published_relative.parts) < 3:
                fail(f"Raw row lacks a group-relative file: {published_relative}")
            group = published_relative.parts[1]
            member = Path(*published_relative.parts[2:])
            if transformed:
                member = member.with_name(member.name[:-3])
            if source_relative.parts[-len(member.parts):] != member.parts:
                fail(f"Source-relative path changed in the byte mapping: {source}")
            root_parts = source_relative.parts[:-len(member.parts)]
            if not root_parts:
                fail(f"Raw group source cannot be workspace root: {source}")
            group_root = workspace.joinpath(*root_parts)
            if group in source_groups and source_groups[group] != group_root:
                fail(f"One raw group names different original directories: {group}")
            source_groups[group] = group_root
            source_group_members.setdefault(group, set()).add(member.as_posix())
    group_inventories = {}
    for group, source_root in source_groups.items():
        if source_root.exists():
            group_inventories[source_root] = inventory(source_root)
            if group_inventories[source_root] != source_group_members[group]:
                fail(f"Original group inventory differs from complete copied inventory: {group}")
        elif args.require_sources:
            fail(f"Required original group missing: {source_root}")
    native_audits = audit['native-record-audits'] or []
    native_artifacts = [leaf(row['artifact']) for row in native_audits]
    if len(native_artifacts) != len(set(native_artifacts)) or not set(native_artifacts) <= set(artifacts):
        fail("Native audit has duplicate or uncataloged artifacts")
    native_paths = [relative(row['native-record']).as_posix() for row in native_audits]
    if any(name not in actual_raw for name in native_paths):
        fail("Native record audit points outside the preserved raw inventory")
    record_paths = list(dict.fromkeys([campaign / artifact for artifact in artifacts]
                                     + [campaign / name for name in native_paths]))
    records = read_records(workspace, record_paths)
    wrappers = set()
    for row in native_audits:
        artifact = campaign / row['artifact']
        native_path = campaign / relative(row['native-record'])
        original = records[str(native_path)]
        alias = records[str(artifact)]
        if row['copied-native-data-equality'] != 'checked':
            fail(f"Unchecked native record: {native_path}")
        checks = {'kind': 'kind', 'status': 'status', 'exit-code': 'exit-code',
                  'source-consistency': 'source-consistency',
                  'expanded-bytes': 'expanded_bytes', 'expanded-sha256': 'expanded_sha256'}
        for audit_key, native_key in checks.items():
            if row[audit_key] != original[native_key]:
                fail(f"Native metadata/status changed ({audit_key}): {native_path}")
        if alias['kind'] == 'native-evidence-reference':
            wrappers.add(row['artifact'])
            if alias['native-record'] != row['native-record']:
                fail(f"Reference selects a different native record: {artifact}")
            for native_key in ('kind', 'status', 'exit-code', 'source-consistency'):
                if alias['native-' + native_key] != original[native_key]:
                    fail(f"Wrapper reclassified native {native_key}: {artifact}")
            if (alias['native-expanded-bytes'], alias['native-expanded-sha256']) != (
                    original['expanded_bytes'], original['expanded_sha256']):
                fail(f"Wrapper changed the native expanded bytes: {artifact}")
            if not original['descriptor_payload']:
                fail(f"Consultation wrapper points to a plain native record: {artifact}")
        elif bytes_at(artifact) != bytes_at(native_path):
            fail(f"Plain native alias is not an identical byte copy: {artifact}")
    references = audit['consultation-references'] or []
    reference_artifacts = [leaf(row['artifact']) for row in references]
    if len(reference_artifacts) != len(set(reference_artifacts)) or set(reference_artifacts) != wrappers:
        fail("Consultation-reference inventory differs from actual native wrappers")
    for row in references:
        if (row['kind'] != 'native-evidence-reference'
                or row['generated-reference-only'] is not True
                or row['native-record'] != records[str(campaign / row['artifact'])]['native-record']):
            fail("Consultation-reference declaration is inconsistent")
    registered_roots = set(artifacts) | {'catalogo.lisp'}
    all_record_metadata = {**root_records, **records}
    for path, metadata in all_record_metadata.items():
        payload = metadata['descriptor_payload']
        if payload:
            leaf(payload)
            payload_path = Path(path).parent / payload
            data = bytes_at(payload_path, GZIP_LIMIT)
            if ((len(data), sha(data)) != (metadata['descriptor_compressed_bytes'],
                                            metadata['descriptor_compressed_sha256'])):
                fail(f"Descriptor payload bytes/hash mismatch: {payload_path}")
            if Path(path).parent == campaign:
                registered_roots.add(payload)
    unregistered_roots = {name for name in files_before if '/' not in name
                          and name not in registered_roots and not name.endswith('.md')}
    if unregistered_roots:
        fail(f"Uncataloged root evidence files: {sorted(unregistered_roots)}")
    for source, expected_hash in available_sources.items():
        if sha(bytes_at(source)) != expected_hash:
            fail(f"Original changed during the independent audit: {source}")
    for source_root, before in group_inventories.items():
        if inventory(source_root) != before:
            fail(f"Original group inventory changed during audit: {source_root}")
    if inventory(campaign) != files_before:
        fail("Published file inventory changed during audit")
    for name, expected_hash in published_hashes.items():
        if sha(bytes_at(campaign / name)) != expected_hash:
            fail(f"Published bytes changed during audit: {name}")
    print(json.dumps({'status': 'ok', 'scope': 'get-publication-byte-audit',
                      'campaign': str(campaign), 'catalog_artifacts': len(artifacts),
                      'associated_raw_files': len(actual_raw), 'byte_copy_rows': len(copies),
                      'native_record_audits': len(native_audits), 'native_wrappers': len(wrappers),
                      'source_files_verified': len(available_sources),
                      'source_files_unavailable': len(missing_sources),
                      'complete_source_groups_verified': len(group_inventories),
                      'all_published_files': len(files_before),
                      'limits': ['preservation-only', 'native-statuses-unchanged',
                                 'no-evidence-load', 'no-qualification-claim']}, indent=2))


if __name__ == '__main__':
    try:
        main()
    except (RuntimeError, OSError, ValueError, KeyError, TypeError,
            subprocess.TimeoutExpired) as error:
        print(f'Independent publication audit refused: {error}', file=sys.stderr)
        sys.exit(1)
