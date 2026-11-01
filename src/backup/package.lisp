;;; OWNER: one offline caller owns buffers, capabilities and unpublished target namespace.
;;; SHARED: no engine state; only the existing read-only verified-session boundary.
;;; REQ: REQ-AFF-014 REQ-AFF-010 REQ-AFF-008
(defpackage #:arcdocdb.backup
  (:use #:cl)
  (:local-nicknames (#:b #:arcdocdb.binary) (#:io #:arcdocdb.io) (#:v #:arcdocdb.verify)
                   (#:mf #:arcdocdb.recovery.manifest))
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation #:corruption-detected #:unsupported-format)
  (:export #:crea-backup-m1 #:ripristina-backup-m1 #:verifica-backup-m1 #:confronta-backup-m1
           #:backup-error #:backup-primary #:backup-cleanup #:backup-stage #:backup-file
           #:backup-published #:backup-durable))
