;;; OWNER: one serial M1 actor; immutable records, private fixed cache and paths.
;;; SHARED: none; the caller owns canonical commit and source lifetime.
;;; REQ: REQ-IDX-013 REQ-IDX-008 REQ-AFF-008
(defpackage #:arcdocdb.index.disk
  (:use #:cl)
  (:local-nicknames (#:b #:arcdocdb.binary) (#:io #:arcdocdb.io))
  (:import-from #:arcdocdb.binary #:octets #:index #:u32 #:u64)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation #:corruption-detected #:io-fault)
  (:export #:disk-index #:create-disk-index #:lookup-disk-index #:apply-disk-index #:relocate-disk-index
           #:verify-disk-index #:copy-disk-index #:visit-disk-index #:close-disk-index
           #:disk-index-count #:disk-index-key-bytes #:disk-index-root #:disk-index-height
           #:disk-index-charge #:disk-index-frontier #:disk-index-name #:disk-index-state
           #:reserve-disk-index #:disk-index-live-bytes #:disk-index-batch-limit))
