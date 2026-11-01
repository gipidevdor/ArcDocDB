;;; OWNER: one offline caller owns the inspection and all borrowed capabilities.
;;; SHARED: no operational registry, engine admission, writer, or publication.
;;; REQ: REQ-AFF-010 REQ-AFF-008 REQ-REC-004
(defpackage #:arcdocdb.verify
  (:use #:cl)
  (:local-nicknames (#:b #:arcdocdb.binary) (#:io #:arcdocdb.io)
                   (#:c #:arcdocdb.control) (#:mf #:arcdocdb.recovery.manifest)
                   (#:ra #:arcdocdb.recovery.active) (#:rc #:arcdocdb.recovery.closed)
                   (#:rs #:arcdocdb.recovery.series) (#:da #:arcdocdb.recovery.archive)
                   (#:g #:arcdocdb.get)
                   (#:r #:arcdocdb.record) (#:f #:arcdocdb.storage.format))
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation #:corruption-detected #:unsupported-format)
  (:export #:verifica-storage-m1 #:call-with-verified-storage-m1 #:verification-error #:verification-primary
           #:verification-cleanup #:verification-stage #:verification-file
           #:verification-actions))
