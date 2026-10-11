#!/usr/bin/env python3
"""Conserve native GET campaign bytes from explicit JSON groups.

Default is a read-only preview. --apply publishes only the named campaign.

Example mapping:
{
  "workspace": "/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB",
  "output": "spikes/results/2026-10-11-get-verification",
  "date": "2026-10-11",
  "groups": [
    {"name": "core", "source": "spikes/out/<command-dir>",
     "records": {"report.lisp": "core.lisp", "conservazione.lisp": "core-conservazione.lisp"}},
    {"name": "mutazioni", "source": "spikes/out/<mutation-dir>",
     "records": {"report.lisp": "mutazioni.lisp"}},
    {"name": "copertura-get", "source": "spikes/out/<coverage-dir>",
     "compress": ["coverage-state.lisp"]}
  ],
  "extra_entries": ["metodo.lisp", "revisione.lisp", "risultati.lisp"]
}

Every source directory is copied completely to raw/<name>/, including source,
private FASL, runners, logs, and native descriptor/payload pairs. Descriptor
records receive an explicitly generated root reference, never a rewritten
native descriptor. Plain records <=1 MiB receive an identical LEAF copy.
Selected nonrecord files (e.g. SB-COVER state), and nonrecord files >1 MiB,
are stored as verified lossless deterministic gzip. No evidence is LOADed.
Native Lisp data is read by the repository's trusted evidence-storage reader.
"""
import argparse
import fnmatch
import gzip
import hashlib
import json
import os
from pathlib import Path
import shutil
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


def quote_lisp(value):
    return '"' + str(value).replace('\\', '\\\\').replace('"', '\\"') + '"'


def leaf(value):
    if not isinstance(value, str) or not value or value in (".", "..") or any(c in value for c in '/\\\x00*?[]'):
        fail(f"Not a LEAF: {value!r}")
    return value


def relpath(value):
    p = Path(value)
    if p.is_absolute() or not p.parts or '..' in p.parts or '\x00' in str(p):
        fail(f"Not a relative owned path: {value!r}")
    return p


def digest(data):
    return hashlib.sha256(data).hexdigest()


def real_ancestors(path):
    for parent in path.parents:
        if parent.exists() and (parent.is_symlink() or not parent.is_dir()):
            fail(f"Unknown or symlink ancestor refused: {parent}")


def file_bytes(path):
    real_ancestors(path)
    if path.is_symlink() or not stat.S_ISREG(path.stat().st_mode):
        fail(f"Not a regular nonsymlink source: {path}")
    before = path.stat()
    data = path.read_bytes()
    after = path.stat()
    if (before.st_ino, before.st_size, before.st_mtime_ns) != (after.st_ino, after.st_size, after.st_mtime_ns):
        fail(f"Source changed during reading: {path}")
    if len(data) > EXPANDED_LIMIT:
        fail(f"Source exceeds finite expanded budget: {path}")
    return data


def store(path, data, apply):
    real_ancestors(path)
    limit = GZIP_LIMIT if path.suffix == '.gz' else PLAIN_LIMIT
    if len(data) > limit:
        fail(f"Stored budget exceeded ({len(data)} > {limit}): {path}")
    if path.is_symlink():
        fail(f"Output symlink refused: {path}")
    if path.exists():
        if file_bytes(path) != data:
            fail(f"Refusing to replace different published bytes: {path}")
        return
    if apply:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open('xb') as stream:
            stream.write(data)
        if file_bytes(path) != data:
            fail(f"Stored bytes differ: {path}")


def native_metadata(workspace, paths):
    if not paths:
        return {}
    storage = workspace / 'tools/evidence-storage.lisp'
    # Only this trusted library is loaded; every evidence file is read as data.
    script = r'''
(require :asdf)
(load __STORAGE__)
(defun json-string (value)
  (write-char #\")
  (loop for ch across value do
    (case ch
      (#\" (write-string "\\\""))
      (#\\ (write-string "\\\\"))
      (#\Newline (write-string "\\n"))
      (#\Return (write-string "\\r"))
      (#\Tab (write-string "\\t"))
      (t (if (< (char-code ch) 32)
             (format t "\\u~4,'0X" (char-code ch)) (write-char ch)))))
  (write-char #\"))
(defun json-value (value)
  (cond ((null value) (write-string "null"))
        ((stringp value) (json-string value))
        ((numberp value) (princ value))
        ((symbolp value) (json-string (string-downcase (symbol-name value))))
        (t (error "Metadata type not supported."))))
(defun field (key value &optional first)
  (unless first (write-char #\,))
  (json-string key) (write-char #\:) (json-value value))
(dolist (name (uiop:command-line-arguments))
  (let* ((path (pathname name))
         (data (arcdocdb.evidence:read-evidence path :max-expanded-bytes 134217728))
         (schema (or (getf data :schema-version) (getf data :schema)))
         (descriptor nil) (expanded-size nil) (expanded-sha nil))
    (unless (eql schema 1) (error "Native record ~A has no schema 1." name))
    (when (<= (arcdocdb.evidence:file-bytes path) 1048576)
      (let* ((size (arcdocdb.evidence:file-bytes path))
             (bytes (make-array size :element-type '(unsigned-byte 8))))
        (with-open-file (in path :element-type '(unsigned-byte 8))
          (unless (= size (read-sequence bytes in)) (error "Short source read.")))
        (when (arcdocdb.evidence::%descriptor-candidate-p bytes)
          (setf descriptor (arcdocdb.evidence::%read-plist bytes path))
          (arcdocdb.evidence::%validate-descriptor descriptor path 134217728))))
    (arcdocdb.evidence:call-with-evidence-bytes
     path (lambda (plain)
            (setf expanded-size (arcdocdb.evidence:file-bytes plain)
                  expanded-sha (arcdocdb.evidence:file-sha256 plain)))
     :max-expanded-bytes 134217728)
    (write-char #\{)
    (field "path" name t)
    (field "schema" schema)
    (field "kind" (getf data :kind))
    (field "status" (getf data :status))
    (field "exit_code" (getf data :exit-code))
    (field "source_consistency" (getf data :source-consistency))
    (field "source_blobs_equal"
           (when (or (getf data :source-blobs-before) (getf data :source-blobs-after))
             (if (equal (getf data :source-blobs-before) (getf data :source-blobs-after))
                 "true" "false")))
    (field "expanded_bytes" expanded-size)
    (field "expanded_sha256" expanded-sha)
    (field "payload" (getf descriptor :payload))
    (field "compressed_bytes" (getf descriptor :compressed-bytes))
    (field "compressed_sha256" (getf descriptor :compressed-sha256))
    (write-char #\}) (terpri)))
'''.replace('__STORAGE__', quote_lisp(storage))
    with tempfile.NamedTemporaryFile('w', suffix='.lisp', prefix='get-native-data-',
                                     dir=workspace / 'spikes/out/get-publisher', delete=False) as scriptfile:
        scriptfile.write(script)
        scriptname = scriptfile.name
    try:
        result = subprocess.run(['sbcl', '--dynamic-space-size', '2048', '--noinform', '--no-userinit',
                                 '--no-sysinit', '--disable-debugger', '--script', scriptname]
                                + [str(p) for p in paths], cwd=workspace,
                                capture_output=True, text=True, timeout=180)
        if result.returncode != 0:
            fail(f"Trusted native data audit failed ({result.returncode}): {result.stderr[-5000:]}")
        rows = [json.loads(line) for line in result.stdout.splitlines() if line.startswith('{')]
        if len(rows) != len(paths):
            fail(f"Native audit returned {len(rows)} rows for {len(paths)} records.")
        return {row['path']: row for row in rows}
    finally:
        os.unlink(scriptname)


def gzip_lossless(data):
    payload = gzip.compress(data, compresslevel=9, mtime=0)
    if len(payload) > GZIP_LIMIT or gzip.decompress(payload) != data:
        fail("Finite gzip budget or byte equality check failed.")
    return payload


def native_reference(relative, metadata):
    def keyword(value):
        return ':' + value if value else 'nil'
    return ('(:schema-version 1 :kind :native-evidence-reference\n'
            f' :native-record {quote_lisp(relative)}\n'
            f' :native-kind {keyword(metadata["kind"])} :native-status {keyword(metadata["status"])}\n'
            f' :native-exit-code {metadata["exit_code"] if metadata["exit_code"] is not None else "nil"}\n'
            f' :native-source-consistency {keyword(metadata["source_consistency"])}\n'
            f' :native-expanded-bytes {metadata["expanded_bytes"]}\n'
            f' :native-expanded-sha256 {quote_lisp(metadata["expanded_sha256"])}\n'
            ' :limits (:generated-consultation-reference :original-descriptor-and-payload-preserved\n'
            '          :read-native-record-as-data :native-status-not-reclassified))\n').encode()


def descriptor(payload_leaf, original, payload):
    return (f'(:schema-version 1 :kind :compressed-evidence :codec :gzip\n'
            f' :payload {quote_lisp(leaf(payload_leaf))}\n'
            f' :uncompressed-bytes {len(original)} :uncompressed-sha256 {quote_lisp(digest(original))}\n'
            f' :compressed-bytes {len(payload)} :compressed-sha256 {quote_lisp(digest(payload))})\n').encode()


def generated_record(path, data, apply):
    real_ancestors(path)
    if path.name not in {'catalogo.lisp', 'audit-copia.lisp'}:
        fail(f"Only generated catalog and byte audit can be replaced: {path}")
    if path.is_symlink() or path.with_name(path.name + '.gz').is_symlink():
        fail(f"Generated output symlink refused: {path}")
    if len(data) <= PLAIN_LIMIT:
        # Catalog/audit are intentionally regenerated by this helper, and only
        # these two generated records may replace their previous derived bytes.
        if apply:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data)
        return [path]
    payload = gzip_lossless(data)
    desc = descriptor(path.name + '.gz', data, payload)
    if apply:
        path.with_name(path.name + '.gz').write_bytes(payload)
        path.write_bytes(desc)
    return [path, path.with_name(path.name + '.gz')]


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('mapping', type=Path)
    parser.add_argument('--apply', action='store_true', help='Publish after readonly planning and native validation.')
    args = parser.parse_args()
    plan = json.loads(args.mapping.read_text())
    workspace = Path(plan['workspace']).resolve(strict=True)
    output = workspace / relpath(plan.get('output', CAMPAIGN))
    if output != workspace / CAMPAIGN:
        fail(f"This helper owns only {workspace / CAMPAIGN}.")
    if output.is_symlink():
        fail("Campaign directory must not be a symlink.")
    date = plan.get('date', '2026-10-11')
    groups = []
    records = []
    seen_names = set()
    for item in plan['groups']:
        name = leaf(item['name'])
        if name in seen_names:
            fail(f"Duplicate raw group: {name}")
        seen_names.add(name)
        source = workspace / relpath(item['source'])
        real_ancestors(source)
        if source.is_symlink() or not source.is_dir():
            fail(f"Missing or symlink source group: {source}")
        if not source.resolve().is_relative_to(workspace):
            fail(f"Source directory escapes workspace: {source}")
        files = []
        for path in sorted(source.rglob('*')):
            if path.is_symlink():
                fail(f"Source group contains a symlink: {path}")
            if path.is_file():
                files.append((path, path.relative_to(source)))
            elif not path.is_dir():
                fail(f"Unknown nonregular group member refused: {path}")
        group_records = item.get('records', {})
        for source_name, artifact in group_records.items():
            path = source / relpath(source_name)
            if not path.is_file():
                fail(f"Missing named record: {path}")
            records.append((path, leaf(artifact), name, path.relative_to(source)))
        groups.append((name, source, files, item.get('compress', []), set(group_records)))
    artifacts = [r[1] for r in records] + [leaf(p) for p in plan.get('extra_entries', [])]
    if len(artifacts) != len(set(artifacts)):
        fail("Artifact LEAF names must be unique.")
    if set(artifacts) & {'catalogo.lisp', 'audit-copia.lisp'}:
        fail("catalogo.lisp and audit-copia.lisp are generated by this helper.")
    extra_paths = [output / entry for entry in plan.get('extra_entries', [])]
    for path in extra_paths:
        file_bytes(path)
    native_metadata(workspace, extra_paths)
    metadata = native_metadata(workspace, [r[0] for r in records])
    for source, _, _, _ in records:
        m = metadata[str(source)]
        if m['kind'] == 'command-verification' and not plan.get('allow_unstable_source', False):
            if m['source_consistency'] != 'stable' or m['source_blobs_equal'] != 'true':
                fail(f"Native command source is not stable: {source}")
    rows = []
    raw_hashes = []
    references = []
    source_snapshots = {}
    alias_paths = []
    raw_target_names = set()
    for name, source, files, compress_patterns, named_records in groups:
        for path, relative in files:
            data = file_bytes(path)
            source_snapshots[path] = digest(data)
            target = output / 'raw' / name / relative
            transformation = None
            if path.suffix == '.gz':
                if len(data) > GZIP_LIMIT:
                    fail(f"Native gzip exceeds payload budget: {path}")
            elif relative.as_posix() in named_records and len(data) > PLAIN_LIMIT:
                fail(f"Native record needs repository compaction before publication: {path}")
            elif len(data) > PLAIN_LIMIT or any(fnmatch.fnmatch(relative.as_posix(), p) for p in compress_patterns):
                data = gzip_lossless(data)
                target = target.with_name(target.name + '.gz')
                transformation = 'gzip-lossless'
            if target in raw_target_names:
                fail(f"Two source files select one published raw path: {target}")
            raw_target_names.add(target)
            store(target, data, args.apply)
            row = {'original': path.relative_to(workspace).as_posix(),
                   'published': target.relative_to(output).as_posix(),
                   'stored_bytes': len(data), 'sha256': digest(data)}
            if transformation:
                original = file_bytes(path)
                row.update(transformation=transformation, expanded_bytes=len(original), expanded_sha256=digest(original))
            rows.append(row)
            raw_hashes.append({'file': row['published'], 'byte_count': len(data), 'sha256': digest(data)})
    for source, artifact, name, relative in records:
        m = metadata[str(source)]
        target = output / artifact
        if m['payload']:
            native = (Path('raw') / name / relative).as_posix()
            store(target, native_reference(native, m), args.apply)
            references.append({'artifact': artifact, 'native_record': native, **{k: v for k, v in m.items() if k != 'path'}})
        else:
            data = file_bytes(source)
            if target in raw_target_names:
                fail(f"Two source files select one published raw path: {target}")
            raw_target_names.add(target)
            store(target, data, args.apply)
            rows.append({'original': source.relative_to(workspace).as_posix(), 'published': artifact,
                         'stored_bytes': len(data), 'sha256': digest(data)})
        alias_paths.append(target)
    if args.apply:
        for entry in plan.get('extra_entries', []):
            if not (output / entry).is_file():
                fail(f"Missing declared existing campaign record: {output / entry}")
        # Read every record alias, and every actual nested native descriptor, as
        # data. The native metadata/expanded digest must equal its source.
        copied_paths = [output / 'raw' / name / relative for _, _, name, relative in records]
        copied = native_metadata(workspace, copied_paths)
        for (source, _, _, _), copied_path in zip(records, copied_paths):
            before, after = metadata[str(source)], copied[str(copied_path)]
            for key in ('schema', 'kind', 'status', 'exit_code', 'source_consistency', 'source_blobs_equal', 'expanded_bytes', 'expanded_sha256', 'payload', 'compressed_bytes', 'compressed_sha256'):
                if before[key] != after[key]:
                    fail(f"Copied native record metadata changed ({key}): {copied_path}")
        native_metadata(workspace, alias_paths + [output / entry for entry in plan.get('extra_entries', [])])
    # Read the source records a second time in both preview/apply; native
    # descriptor payloads and data must remain exactly consistent with planning.
    current_metadata = native_metadata(workspace, [r[0] for r in records])
    if current_metadata != metadata:
        fail("Native source record metadata changed during publication.")
    # Detect changed or newly added files after publication; no guessed native
    # completion or status. Sources must be immutable during this operation.
    for path, original_hash in source_snapshots.items():
        if digest(file_bytes(path)) != original_hash:
            fail(f"Native file changed during publication: {path}")
    for _, source, files, _, _ in groups:
        for member in source.rglob('*'):
            if member.is_symlink() or not (member.is_file() or member.is_dir()):
                fail(f"Unknown or symlink group member appeared: {member}")
        if sorted(p for p in source.rglob('*') if p.is_file()) != [p for p, _ in files]:
            fail(f"Native group inventory changed during publication: {source}")
    audit = [f'(:schema-version 1 :kind :get-publication-byte-audit :date {quote_lisp(date)} :status :ok',
             f' :files {len(rows)} :copied-byte-equality :checked :rows (']
    for row in rows:
        text = (f' (:original {quote_lisp(row["original"])} :published {quote_lisp(row["published"])}'
                f' :stored-bytes {row["stored_bytes"]} :sha256 {quote_lisp(row["sha256"])}')
        if row.get('transformation'):
            text += (f' :transformation :gzip-lossless :expanded-bytes {row["expanded_bytes"]}'
                     f' :expanded-sha256 {quote_lisp(row["expanded_sha256"])}')
        audit.append(text + ')')
    audit.append(' ) :native-record-audits (')
    for source, artifact, name, relative in records:
        m = metadata[str(source)]
        audit.append(f' (:artifact {quote_lisp(artifact)} :native-record {quote_lisp((Path("raw") / name / relative).as_posix())}'
                     f' :kind {":" + m["kind"] if m["kind"] else "nil"}'
                     f' :status {":" + m["status"] if m["status"] else "nil"}'
                     f' :exit-code {m["exit_code"] if m["exit_code"] is not None else "nil"}'
                     f' :source-consistency {":" + m["source_consistency"] if m["source_consistency"] else "nil"}'
                     f' :expanded-bytes {m["expanded_bytes"]} :expanded-sha256 {quote_lisp(m["expanded_sha256"])}'
                     f' :copied-native-data-equality :checked)')
    audit.append(' ) :consultation-references (')
    for reference in references:
        audit.append(f' (:artifact {quote_lisp(reference["artifact"])} :kind :native-evidence-reference'
                     f' :native-record {quote_lisp(reference["native_record"])} :generated-reference-only t)')
    audit.append(' ) :limits (:byte-preservation-and-native-data-audit :no-native-status-reclassification\n'
                 '            :no-qualification-claim :read-eval-disabled :no-evidence-load))\n')
    audit_data = '\n'.join(audit).encode()
    catalog = [f'(:schema-version 1 :kind :evidence-catalog :date {quote_lisp(date)} :scope :get-verification',
               ' :entries (' + ' '.join(f'(:artifact {quote_lisp(a)})' for a in sorted(artifacts + ['audit-copia.lisp'])) + ')',
               ' :associated-raw-files (']
    for row in sorted(raw_hashes, key=lambda r: r['file']):
        catalog.append(f' (:file {quote_lisp(row["file"])} :byte-count {row["byte_count"]} :sha256 {quote_lisp(row["sha256"])})')
    catalog.append(' ))\n')
    catalog_data = '\n'.join(catalog).encode()
    generated_record(output / 'audit-copia.lisp', audit_data, args.apply)
    generated_record(output / 'catalogo.lisp', catalog_data, args.apply)
    if args.apply:
        native_metadata(workspace, [output / 'audit-copia.lisp', output / 'catalogo.lisp'])
        for row in raw_hashes:
            target = output / row['file']
            stored = file_bytes(target)
            if len(stored) != row['byte_count'] or digest(stored) != row['sha256']:
                fail(f"Associated raw manifest mismatch: {target}")
        # All files in this campaign obey the same checker size policy.
        for target in output.rglob('*'):
            if target.is_symlink():
                fail(f"Campaign contains a symlink: {target}")
            if target.is_file():
                limit = GZIP_LIMIT if target.suffix == '.gz' else PLAIN_LIMIT
                if target.stat().st_size > limit:
                    fail(f"Campaign file exceeds checker size policy: {target}")
    print(json.dumps({'mode': 'published' if args.apply else 'readonly-preview',
                      'output': str(output), 'groups': len(groups), 'native_records': len(records),
                      'byte_copy_rows': len(rows), 'associated_raw_files': len(raw_hashes),
                      'generated_consultation_references': len(references),
                      'audit_plain_bytes': len(audit_data), 'catalog_plain_bytes': len(catalog_data),
                      'native_observations': list(metadata.values())}, indent=2))


if __name__ == '__main__':
    try:
        main()
    except (RuntimeError, OSError, ValueError, subprocess.TimeoutExpired) as error:
        print(f'Publication refused: {error}', file=sys.stderr)
        sys.exit(1)
