;;; OWNER: caller-facing cold operations; configuration and lexical paths admitted before any I/O.
;;; SHARED: no per-request or cross-Serie state; stopped source exclusion is scoped to each invocation.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-008 REQ-AFF-004
(declaim (ftype (function ((or string pathname) (or string pathname) b:octets b:octets
                          &key (:max-file-bytes t) (:max-segments t) (:max-records t) (:max-total-bytes t)
                               (:buffer-bytes t) (:observer (or null function)) (:backend (or null io:backend))) list)
                crea-backup-m1 ripristina-backup-m1 confronta-backup-m1))
(defun crea-backup-m1 (source destination archive series &key (max-file-bytes 268435456) (max-segments 64)
                       (max-records 65536) (max-total-bytes 17179869184) (buffer-bytes 1048576) observer backend)
  "Pre: stopped M1 source, trusted stable disjoint paths/ancestors, existing target parent, new target/.tmp.
Post: scoped canonical backup, full file CRCs and exact copy checks, exclusively published and flushed.
Publication point is directory rename, durable completion parent fsync; result only after cleanup.
Configuration rejected before I/O; BACKUP-ERROR preserves cause, cleanup and uncertain published/durable state.
No source mutation/recovery, replacement, retries or deletion. Not online/full-Archivio/authenticated backup."
  (let ((job (prepare-job archive series max-file-bytes max-segments max-records max-total-bytes buffer-bytes observer backend))
        (source (directory-path source)) (target (directory-path destination)))
    (disjoint-paths source target)
    (run-job job (lambda () (backup-operation job source target)))))

;;; REQ: REQ-AFF-014 REQ-AFF-008 REQ-AFF-004
(defun ripristina-backup-m1 (source destination archive series &key (max-file-bytes 268435456) (max-segments 64)
                            (max-records 65536) (max-total-bytes 17179869184) (buffer-bytes 1048576) observer backend)
  "Pre: immutable stopped M1 backup and trusted stable disjoint paths; destination/.tmp absent, parent exists.
Post: normal M1 canonical directory verified before exclusive rename and parent fsync, returned after cleanup.
Invalid backup rejected before target creation. Original source remains read-only, no repair or hidden retries.
Typed configuration errors or BACKUP-ERROR with original cause/cleanup and publication uncertainty."
  (let ((job (prepare-job archive series max-file-bytes max-segments max-records max-total-bytes buffer-bytes observer backend))
        (source (directory-path source)) (target (directory-path destination)))
    (disjoint-paths source target)
    (run-job job (lambda () (restore-operation job source target)))))

;;; REQ: REQ-AFF-014 REQ-AFF-010 REQ-AFF-008 REQ-AFF-004
(declaim (ftype (function ((or string pathname) b:octets b:octets
                          &key (:max-file-bytes t) (:max-segments t) (:max-records t) (:max-total-bytes t)
                               (:buffer-bytes t) (:observer (or null function)) (:backend (or null io:backend))) list)
                verifica-backup-m1))
(defun verifica-backup-m1 (source archive series &key (max-file-bytes 268435456) (max-segments 64)
                           (max-records 65536) (max-total-bytes 17179869184) (buffer-bytes 1048576) observer backend)
  "Pre: stable immutable stopped backup and caller identity/budgets. Post: complete manifest/inventory/CRC/canonical report.
No file or namespace mutation, runtime bootstrap or report before successful cleanup. Typed boundary failures."
  (let ((job (prepare-job archive series max-file-bytes max-segments max-records max-total-bytes buffer-bytes observer backend))
        (source (directory-path source)))
    (run-job job (lambda () (with-backup job source
                             (lambda (manifest canonical directory)
                               (declare (ignore directory)) (operation-report :verify manifest canonical)))))))

;;; REQ: REQ-AFF-014 REQ-AFF-010 REQ-AFF-008 REQ-AFF-004
(defun confronta-backup-m1 (source backup archive series &key (max-file-bytes 268435456) (max-segments 64)
                            (max-records 65536) (max-total-bytes 17179869184) (buffer-bytes 1048576) observer backend)
  "Pre: stopped stable canonical source and immutable backup, trusted disjoint paths. Post: exact canonical comparison.
Both independently verified first; IDENTICAL requires every byte, DIFFERENT is a normal outcome for changed data.
No writes or primary index; original verification errors remain typed, result only after cleanup."
  (let ((job (prepare-job archive series max-file-bytes max-segments max-records max-total-bytes buffer-bytes observer backend))
        (source (directory-path source)) (backup (directory-path backup)))
    (disjoint-paths source backup)
    (run-job job (lambda () (compare-operation job source backup)))))
