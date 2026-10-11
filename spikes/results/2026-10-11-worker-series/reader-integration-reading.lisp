(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-AUXILIARY-FULLCHECK-READING :STATUS :COMPLETED
 :READER-REUSE
 (:PREVIOUS-FREEZE
  "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/"
  :ONLY-CHANGE :MASTER-RECORD-PATH :SYNTAX-PROBE :NOT-PERFORMED)
 :LIMITS
 (:AUXILIARY-EVIDENCE-READING :NOT-A-C4-GATE :SINGLE-FULLCHECK-ON-NEW-BASE
  :ORIGINAL-REPORTS-RETAINED)
 :SOURCES
 ((:PATH #A((44) BASE-CHAR . "spikes/out/worker-series-fullcheck-read.lisp") :BYTES 2638 :SHA256
   "159af7f4ae2348aa89facd27f5691f2dfb1c34e2e74029599fdeb28841df7921" :GIT-BLOB
   "3a339fc75f620a2111f3264424da487cc7b7107c" :TEXT "(load \"tools/evidence-storage.lisp\")
(require :asdf)

(defun write-raw-string (value leaf)
  (with-open-file (stream leaf :direction :output :if-exists :error
                               :external-format :utf-8)
    (when value (write-string value stream))))

(let* ((record-path \"spikes/out/4000710249-command-34111-0/report.lisp\")
       (record (arcdocdb.evidence:read-evidence record-path))
       (stderr (getf record :stderr))
       (stdout (getf record :stdout))
       (runs (sort (directory \"spikes/out/*-check-*/report.lisp\")
                   #'string< :key #'namestring)))
  (assert (eq (getf record :status) :ok))
  (assert (eq (getf record :source-consistency) :stable))
  (assert (eql (getf record :exit-code) 0))
  (assert (equal (getf record :source-blobs-before)
                 (getf record :source-blobs-after)))
  (write-raw-string stdout \"spikes/out/worker-series-fullcheck-stdout.txt\")
  (write-raw-string stderr \"spikes/out/worker-series-fullcheck-stderr.txt\")
  (with-open-file (stream \"spikes/out/worker-series-fullcheck-summary.lisp\"
                          :direction :output :if-exists :error)
    (let ((*print-readably* t))
      (write
       (list :command-record record-path
             :status (getf record :status)
             :source-consistency (getf record :source-consistency)
             :exit-code (getf record :exit-code)
             :wall-seconds (getf record :wall-seconds)
             :source-count (length (getf record :source-blobs-before))
             :raw-stdout-length (length stdout)
             :raw-stderr-length (length stderr)
             :raw-stderr stderr
             :spike-masters
             (loop for path in runs
                   for data = (arcdocdb.evidence:read-evidence path)
                   collect
                   (list :record (namestring path)
                         :status (getf data :status)
                         :mode (getf data :mode)
                         :runs
                         (loop for run in (getf data :runs)
                               collect
                               (list :id (getf run :id)
                                     :status (getf run :status)
                                     :source-consistency (getf run :source-consistency)
                                     :exit-code (getf run :exit-code)
                                     :stdout-length (length (getf run :stdout))
                                     :stderr-length (length (getf run :stderr))
                                     :stderr (getf run :stderr))))))
       :stream stream :pretty t)
      (terpri stream))))
")
  (:PATH
   #A((140) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/worker-series-fullcheck-read.lisp")
   :BYTES 2638 :SHA256 "a0161908e7c279f731e26df4f51f9f1a07391616b9136d451e6e964f984b3dd0" :GIT-BLOB
   "11e5f838d9b48267a57a873332d86ada05e4801f" :TEXT "(load \"tools/evidence-storage.lisp\")
(require :asdf)

(defun write-raw-string (value leaf)
  (with-open-file (stream leaf :direction :output :if-exists :error
                               :external-format :utf-8)
    (when value (write-string value stream))))

(let* ((record-path \"spikes/out/4000709286-command-15279-0/report.lisp\")
       (record (arcdocdb.evidence:read-evidence record-path))
       (stderr (getf record :stderr))
       (stdout (getf record :stdout))
       (runs (sort (directory \"spikes/out/*-check-*/report.lisp\")
                   #'string< :key #'namestring)))
  (assert (eq (getf record :status) :ok))
  (assert (eq (getf record :source-consistency) :stable))
  (assert (eql (getf record :exit-code) 0))
  (assert (equal (getf record :source-blobs-before)
                 (getf record :source-blobs-after)))
  (write-raw-string stdout \"spikes/out/worker-series-fullcheck-stdout.txt\")
  (write-raw-string stderr \"spikes/out/worker-series-fullcheck-stderr.txt\")
  (with-open-file (stream \"spikes/out/worker-series-fullcheck-summary.lisp\"
                          :direction :output :if-exists :error)
    (let ((*print-readably* t))
      (write
       (list :command-record record-path
             :status (getf record :status)
             :source-consistency (getf record :source-consistency)
             :exit-code (getf record :exit-code)
             :wall-seconds (getf record :wall-seconds)
             :source-count (length (getf record :source-blobs-before))
             :raw-stdout-length (length stdout)
             :raw-stderr-length (length stderr)
             :raw-stderr stderr
             :spike-masters
             (loop for path in runs
                   for data = (arcdocdb.evidence:read-evidence path)
                   collect
                   (list :record (namestring path)
                         :status (getf data :status)
                         :mode (getf data :mode)
                         :runs
                         (loop for run in (getf data :runs)
                               collect
                               (list :id (getf run :id)
                                     :status (getf run :status)
                                     :source-consistency (getf run :source-consistency)
                                     :exit-code (getf run :exit-code)
                                     :stdout-length (length (getf run :stdout))
                                     :stderr-length (length (getf run :stderr))
                                     :stderr (getf run :stderr))))))
       :stream stream :pretty t)
      (terpri stream))))
")
  (:PATH #A((52) BASE-CHAR . "spikes/out/worker-series-fullcheck-reader-output.txt") :BYTES 0
   :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH #A((45) BASE-CHAR . "spikes/out/worker-series-fullcheck-stdout.txt") :BYTES 216462 :SHA256
   "d207fc2c5c5c94976a56f2d27f823e3236a6730b33dbdb4f13afb7bee8d80853" :GIT-BLOB
   "311a4ce1fd4c095eaf0d4a139dc45225e16db60b" :TEXT
   "sbcl --noinform --no-userinit --non-interactive --load tools/build.lisp
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/package-tmpGHU3ALSV.fasl
; compilation finished in 0:00:00.002
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/package-tmpAAURSO1.fasl
; compilation finished in 0:00:00.001
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/conditions.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/conditions-tmp5GEXGEG5.fasl
; compilation finished in 0:00:00.004
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/binary.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/binary-tmpAR3FSGEY.fasl
; compilation finished in 0:00:00.011
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/crc32c.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/crc32c-tmpJAIDFZTC.fasl
; compilation finished in 0:00:00.012
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/record.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/record-tmp8V3J6PE9.fasl
; compilation finished in 0:00:00.122
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/batch.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/foundation/batch-tmp9V47YWQF.fasl
; compilation finished in 0:00:00.026
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/package-tmp9BN22RMA.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/arithmetic.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/arithmetic-tmp1CXFJSK9.fasl
; compilation finished in 0:00:00.007
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/blocks.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/blocks-tmpX4BRKI0R.fasl
; compilation finished in 0:00:00.025
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/hash64.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/hash64-tmpQ371UGST.fasl
; compilation finished in 0:00:00.040
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/package-tmp2OWI3Q7U.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/utf8.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/utf8-tmp9KKTJMYV.fasl
; compilation finished in 0:00:00.015
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-package-tmpJU0JWO19.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-header.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-header-tmpZX2WN8N4.fasl
; compilation finished in 0:00:00.012
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-float-minimal.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-float-minimal-tmpOU81XRV0.fasl
; compilation finished in 0:00:00.005
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-minimal.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-minimal-tmpY2ML9CFA.fasl
; compilation finished in 0:00:00.006
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-space.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-space-tmpX2JYJDQE.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-input.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-input-tmpOPCILR65.fasl
; compilation finished in 0:00:00.002
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-stack.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-stack-tmpRV9F8A9A.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-items.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-items-tmpK2ZAJT4I.fasl
; compilation finished in 0:00:00.012
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-tmpUX5S4ADN.fasl
; compilation finished in 0:00:00.014
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-minimal.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-minimal-tmp10401X32.fasl
; compilation finished in 0:00:00.004
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-write.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-write-tmpZ7CBRM0G.fasl
; compilation finished in 0:00:00.027
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/csn/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/csn/package-tmp9OZEQ0G2.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/csn/registry.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/csn/registry-tmpB2JTL1W9.fasl
; compilation finished in 0:00:00.040
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/package-tmpP3BI68WQ.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/types-tmpQDARA81Z.fasl
; compilation finished in 0:00:00.028
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/build.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/build-tmpYEMMM7SE.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/core.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/core-tmp73HU0RPK.fasl
; compilation finished in 0:00:00.008
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/read.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/read-tmpIO5N7K88.fasl
; compilation finished in 0:00:00.037
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/clock.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/clock-tmpCM21U60Z.fasl
; compilation finished in 0:00:00.008
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/write.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/write-tmp9DT7SEFG.fasl
; compilation finished in 0:00:00.024
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/package-tmp8065ESJT.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/queue.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/queue-tmp7S8Z6FGF.fasl
; compilation finished in 0:00:00.020
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/writer.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/writer-tmpSIT3QPKP.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/handoff.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/handoff-tmpE0PA0714.fasl
; compilation finished in 0:00:00.011
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/ready-types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/ready-types-tmpJRWHHVG0.fasl
; compilation finished in 0:00:00.022
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/ready.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/ready-tmp4WZVROCX.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/ready-recycle.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/ready-recycle-tmpA0I3UKX8.fasl
; compilation finished in 0:00:00.003
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-types-tmp267Y2N80.fasl
; compilation finished in 0:00:00.032
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-boundary.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-boundary-tmpOUPE5FSJ.fasl
; compilation finished in 0:00:00.005
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-claim.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-claim-tmpIGHCU6ZA.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-run.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-run-tmpBO0TUGLK.fasl
; compilation finished in 0:00:00.007
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/package-tmpIIXPIQNW.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/formats.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/formats-tmpOHM494YR.fasl
; compilation finished in 0:00:00.004
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/segment-header.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/segment-header-tmpOVFB07XF.fasl
; compilation finished in 0:00:00.037
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/log-header.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/log-header-tmpG6VFGMYP.fasl
; compilation finished in 0:00:00.029
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/compaction-scan.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/compaction-scan-tmp4QIPRMOF.fasl
; compilation finished in 0:00:00.013
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/control-payload.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/control-payload-tmpGW0QV22K.fasl
; compilation finished in 0:00:00.031
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/payload-record.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/payload-record-tmp2K9J0HSR.fasl
; compilation finished in 0:00:00.022
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/payload-write.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/storage/payload-write-tmpP44I4E0Y.fasl
; compilation finished in 0:00:00.042
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/package-tmp63LQ7EX6.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/types-tmp86F1A8FB.fasl
; compilation finished in 0:00:00.021
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/native.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/native-tmpH7D4HL98.fasl
; compilation finished in 0:00:00.018
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/lifecycle.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/lifecycle-tmpCDM7YXYI.fasl
; compilation finished in 0:00:00.024
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/transfer.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/transfer-tmpLM57P5P.fasl
; compilation finished in 0:00:00.015
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/flush.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/flush-tmpZE69DN33.fasl
; compilation finished in 0:00:00.002
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/package-tmpG8099TO3.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/types.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/types-tmpTASQCYAW.fasl
; compilation finished in 0:00:00.069
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/builder.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/builder-tmp35U57IV6.fasl
; compilation finished in 0:00:00.018
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/group.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/group-tmpTZOONXRW.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/executor.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/executor-tmpWN0UKDSV.fasl
; compilation finished in 0:00:00.011
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/csn.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/csn-tmpBF3HHBTQ.fasl
; compilation finished in 0:00:00.011
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/package-tmpGYUNPZCY.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/types-tmpD68Q8WCA.fasl
; compilation finished in 0:00:00.041
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/ownership.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/ownership-tmp7MK9KM9C.fasl
; compilation finished in 0:00:00.027
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/events.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/events-tmpJJ71X849.fasl
; compilation finished in 0:00:00.014
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/io-events.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/io-events-tmp1VUK6SR2.fasl
; compilation finished in 0:00:00.006
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/publication.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/publication-tmpR2FIHSUG.fasl
; compilation finished in 0:00:00.007
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/query.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/query-tmp8PYELRKX.fasl
; compilation finished in 0:00:00.008
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/retirement.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/retirement-tmpEHTOKYT0.fasl
; compilation finished in 0:00:00.006
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-package.lisp\" (written 11 OCT 2026 01:35:30 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-package-tmpS6U1VHI9.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-types.lisp\" (written 11 OCT 2026 01:38:17 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-types-tmpVTFK6ZJW.fasl
; compilation finished in 0:00:00.020
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-boundary.lisp\" (written 11 OCT 2026 01:48:03 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-boundary-tmp75WVSJEW.fasl
; compilation finished in 0:00:00.006
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-run.lisp\" (written 11 OCT 2026 01:48:03 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-run-tmpBU5UM3S4.fasl
; compilation finished in 0:00:00.010
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/package-tmpOBHVA3CD.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/types.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/types-tmpJ6ELVFLF.fasl
; compilation finished in 0:00:00.017
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/core.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/core-tmpULDB0RG.fasl
; compilation finished in 0:00:00.004
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/validation.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/validation-tmpUTZ0UUTE.fasl
; compilation finished in 0:00:00.018
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/read.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/read-tmpOOSRA8PZ.fasl
; compilation finished in 0:00:00.018
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/write.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/write-tmpDMIL0RVK.fasl
; compilation finished in 0:00:00.034
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/relocate.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/relocate-tmp8MR9IMIO.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-package-tmpJQDKAVAY.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-types-tmp3I8CEEQY.fasl
; compilation finished in 0:00:00.036
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-core.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-core-tmpA3RHFLWZ.fasl
; compilation finished in 0:00:00.006
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-build.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-build-tmpYZIB7VXO.fasl
; compilation finished in 0:00:00.034
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-probe.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-probe-tmpR8PK79V8.fasl
; compilation finished in 0:00:00.038
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-read.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-read-tmpN1ZVB1HZ.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-write.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-write-tmpZGRRPISB.fasl
; compilation finished in 0:00:00.021
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-relocate.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-relocate-tmpFNKDE5XP.fasl
; compilation finished in 0:00:00.021
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-arena.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-arena-tmpRJTU435C.fasl
; compilation finished in 0:00:00.011
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-directory.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-directory-tmpI9WG87JK.fasl
; compilation finished in 0:00:00.014
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-scan.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-scan-tmpYDE6I9E6.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-budget.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-budget-tmp319UV2V8.fasl
; compilation finished in 0:00:00.006
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-copy.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-copy-tmpLYQINFYS.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-tmpGA31XWNO.fasl
; compilation finished in 0:00:00.008
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/hash-seed.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/hash-seed-tmp5HT23M6C.fasl
; compilation finished in 0:00:00.003
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/hash-digests.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/hash-digests-tmpA60KLDKY.fasl
; compilation finished in 0:00:00.006
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/package-tmpD801X3GJ.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/types-tmpGOW1GC70.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-types.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-types-tmpPQ1X28TL.fasl
; compilation finished in 0:00:00.016
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-core.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-core-tmpE92ECU7O.fasl
; compilation finished in 0:00:00.016
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-csn.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-csn-tmp8S0II570.fasl
; compilation finished in 0:00:00.004
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-register.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-register-tmpJE88A12F.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-lifecycle.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-lifecycle-tmpA5FNLPLT.fasl
; compilation finished in 0:00:00.010
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-read.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-read-tmpHKCV9TP8.fasl
; compilation finished in 0:00:00.011
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/package-tmpZ18MA7XE.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/types-tmp6LQJ9T0C.fasl
; compilation finished in 0:00:00.027
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/core.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/core-tmpTX7OA81T.fasl
; compilation finished in 0:00:00.008
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/read.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/read-tmpWOTC3PB7.fasl
; compilation finished in 0:00:00.003
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/retire.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/retire-tmpHQE95SAC.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/reclaim.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/reclaim-tmpO87FP9NR.fasl
; compilation finished in 0:00:00.008
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/package-tmpP6A3E92I.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/types-tmpUSHT8RIL.fasl
; compilation finished in 0:00:00.014
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/core.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/core-tmp7YCPD44Y.fasl
; compilation finished in 0:00:00.005
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/task.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/task-tmpQXR7SNXD.fasl
; compilation finished in 0:00:00.016
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/package-tmp6FLI1OC3.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/types-tmpWBK8JTS9.fasl
; compilation finished in 0:00:00.025
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/build.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/build-tmpUVEUD2ZN.fasl
; compilation finished in 0:00:00.012
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/lifecycle.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/lifecycle-tmpOWNJOEU.fasl
; compilation finished in 0:00:00.018
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/lookup.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/lookup-tmpVT5BMTA5.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/target.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/target-tmpN3CFVWZF.fasl
; compilation finished in 0:00:00.008
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/segment.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/segment-tmpNK27C0R1.fasl
; compilation finished in 0:00:00.028
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/package-tmp3BPE71HR.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/scan.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/scan-tmp758YUXMV.fasl
; compilation finished in 0:00:00.041
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-package-tmpGMQXK1HK.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-types-tmp49Q238TW.fasl
; compilation finished in 0:00:00.007
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-sort.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-sort-tmpMXPMJ5KG.fasl
; compilation finished in 0:00:00.031
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-radix.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-radix-tmpB69313KI.fasl
; compilation finished in 0:00:00.021
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-build.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-build-tmp9ZT99EEA.fasl
; compilation finished in 0:00:00.044
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-query.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-query-tmpW045U8V2.fasl
; compilation finished in 0:00:00.009
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-package.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-package-tmp6XOIRI3N.fasl
; compilation finished in 0:00:00.000
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-types-tmp9ZHTLHSG.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-decode.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-decode-tmpRW73Q691.fasl
; compilation finished in 0:00:00.016
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-fold.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-fold-tmp4TM0ME1F.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-build.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-build-tmpU2IL9N4.fasl
; compilation finished in 0:00:00.041
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-query.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/manifest-query-tmpOPW41KDL.fasl
; compilation finished in 0:00:00.004
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/inventory-types.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/inventory-types-tmpIPVWLON2.fasl
; compilation finished in 0:00:00.024
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/inventory-build.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/inventory-build-tmpO0LCOIDS.fasl
; compilation finished in 0:00:00.033
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/inventory-query.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/inventory-query-tmpP264WQ6O.fasl
; compilation finished in 0:00:00.002
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/smoke.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/smoke-tmpESC43OCR.fasl
; compilation finished in 0:00:00.003
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/support.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/support-tmpWCAM54ZJ.fasl
; compilation finished in 0:00:00.093
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/hash64.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/hash64-tmpVTMW561L.fasl
; compilation finished in 0:00:00.041
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/guards.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/guards-tmpUNNGT9CF.fasl
; compilation finished in 0:00:00.002
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/threads-tmp4L3W83SU.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/foundation/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/foundation/support-tmpGE7QNNEE.fasl
; compilation finished in 0:00:00.027
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/foundation/binary.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/foundation/binary-tmp9B0UZGT4.fasl
; compilation finished in 0:00:00.012
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/foundation/record.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/foundation/record-tmpAJ5U325P.fasl
; compilation finished in 0:00:00.047
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/foundation/batch.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/foundation/batch-tmpAOF1CYAS.fasl
; compilation finished in 0:00:00.023
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/support-tmpIXCQTSHA.fasl
; compilation finished in 0:00:00.030
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/utf8.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/utf8-tmp5E6VIEMS.fasl
; compilation finished in 0:00:00.035
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/threads-tmpI0PODGVV.fasl
; compilation finished in 0:00:00.015
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-support-tmp1Z95I17K.fasl
; compilation finished in 0:00:00.023
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-header.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-header-tmpCFVK1AC1.fasl
; compilation finished in 0:00:00.024
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-threads-tmpHHRR8E8N.fasl
; compilation finished in 0:00:00.030
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-support-tmpWWJ02E3I.fasl
; compilation finished in 0:00:00.046
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-tmpONTOHUJ2.fasl
; compilation finished in 0:00:00.028
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-threads-tmpQT9APWMH.fasl
; compilation finished in 0:00:00.014
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-edges.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-edges-tmp6LYQXY0L.fasl
; compilation finished in 0:00:00.002
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-structure-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-structure-support-tmpNKVDR0J1.fasl
; compilation finished in 0:00:00.067
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-structure.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-structure-tmp6F83SDCV.fasl
; compilation finished in 0:00:00.042
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-structure-threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-structure-threads-tmpEJNPPMJY.fasl
; compilation finished in 0:00:00.017
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-scan-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-scan-support-tmp31RWPSX2.fasl
; compilation finished in 0:00:00.042
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-scan.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-scan-tmp1HKLMSTH.fasl
; compilation finished in 0:00:00.027
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-scan-threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-minimal-scan-threads-tmpEWG5XJ53.fasl
; compilation finished in 0:00:00.018
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-write-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-write-support-tmpXHL60MUV.fasl
; compilation finished in 0:00:00.016
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-write.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-write-tmpB7NPDQCW.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-write-threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-write-threads-tmpGZ70QILE.fasl
; compilation finished in 0:00:00.010
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-write-roundtrip.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/codec/cbor-write-roundtrip-tmpKYD38Q95.fasl
; compilation finished in 0:00:00.002
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/csn/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/csn/support-tmpV4YQ0HKA.fasl
; compilation finished in 0:00:00.041
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/csn/registry.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/csn/registry-tmpJXWE1HN2.fasl
; compilation finished in 0:00:00.041
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/csn/threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/csn/threads-tmpMNC5LX5B.fasl
; compilation finished in 0:00:00.028
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/mvcc/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/mvcc/support-tmp4RNSVVC1.fasl
; compilation finished in 0:00:00.057
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/mvcc/lifecycle.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/mvcc/lifecycle-tmpN626KU7B.fasl
; compilation finished in 0:00:00.128
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/mvcc/capture.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/mvcc/capture-tmpOO0K1B0C.fasl
; compilation finished in 0:00:00.033
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/epochs/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/epochs/support-tmpVFL7JAFK.fasl
; compilation finished in 0:00:00.033
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/epochs/lifecycle.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/epochs/lifecycle-tmpU45RTF.fasl
; compilation finished in 0:00:00.092
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/epochs/threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/epochs/threads-tmpZTS6G7ND.fasl
; compilation finished in 0:00:00.010
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/read/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/read/support-tmp5TNBATEG.fasl
; compilation finished in 0:00:00.033
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/read/lifecycle.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/read/lifecycle-tmpJL6JXW7Z.fasl
; compilation finished in 0:00:00.238
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/read/threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/read/threads-tmp5PQ00DH7.fasl
; compilation finished in 0:00:00.021
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/support-tmp5R1KP4O2.fasl
; compilation finished in 0:00:00.016
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/queue.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/queue-tmpXQDKKJYI.fasl
; compilation finished in 0:00:00.054
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/threads-tmpGJ3P31TF.fasl
; compilation finished in 0:00:00.035
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/handoff.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/handoff-tmpT2P2LFJI.fasl
; compilation finished in 0:00:00.155
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/ready.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/ready-tmpKOV75BS9.fasl
; compilation finished in 0:00:00.119
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/ready-recycle.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/ready-recycle-tmpP07HWIXP.fasl
; compilation finished in 0:00:00.067
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/worker.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/worker-tmpURW0SA3C.fasl
; compilation finished in 0:00:00.221
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/support-tmp627QKRZN.fasl
; compilation finished in 0:00:00.033
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/segment-header.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/segment-header-tmpK8OFNZFV.fasl
; compilation finished in 0:00:00.013
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/log-header.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/log-header-tmpRMCY5COB.fasl
; compilation finished in 0:00:00.076
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/compaction-scan.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/compaction-scan-tmp9TN1FOJ6.fasl
; compilation finished in 0:00:00.035
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/control-payload.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/storage/control-payload-tmpEID7NJG3.fasl
; compilation finished in 0:00:00.059
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/io/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/io/support-tmp8CJLVG9R.fasl
; compilation finished in 0:00:00.022
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/io/transfer.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/io/transfer-tmpZCJK45JG.fasl
; compilation finished in 0:00:00.034
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/io/native.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/io/native-tmpQC4TENAZ.fasl
; compilation finished in 0:00:00.029
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/support-tmp4HJFFDY3.fasl
; compilation finished in 0:00:00.068
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/scan.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/scan-tmp78H81ZL.fasl
; compilation finished in 0:00:00.054
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/corruption.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/corruption-tmp86K6JU7V.fasl
; compilation finished in 0:00:00.019
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/decisions-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/decisions-support-tmp2L6X9BVQ.fasl
; compilation finished in 0:00:00.047
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/decisions.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/decisions-tmpES5DCUFN.fasl
; compilation finished in 0:00:00.047
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/decisions-audit.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/decisions-audit-tmpDVKOEP6R.fasl
; compilation finished in 0:00:00.030
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/decisions-radix.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/decisions-radix-tmp4TWTKS75.fasl
; compilation finished in 0:00:00.111
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/manifest-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/manifest-support-tmpXSOQ2I78.fasl
; compilation finished in 0:00:00.079
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/manifest.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/manifest-tmpUA03GLW1.fasl
; compilation finished in 0:00:00.025
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/manifest-audit.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/manifest-audit-tmpO0OW34V4.fasl
; compilation finished in 0:00:00.037
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/inventory-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/inventory-support-tmpU8KQLETJ.fasl
; compilation finished in 0:00:00.025
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/inventory.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/recovery/inventory-tmpLBWGBOTB.fasl
; compilation finished in 0:00:00.061
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/support-tmpRX2XGI9U.fasl
; compilation finished in 0:00:00.020
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/builder.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/builder-tmpT2A3PQL9.fasl
; compilation finished in 0:00:00.015
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/group.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/group-tmpOVHYA3BO.fasl
; compilation finished in 0:00:00.016
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/fault.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/fault-tmpLT3TYWCE.fasl
; compilation finished in 0:00:00.020
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/native.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/native-tmp3YF2HENI.fasl
; compilation finished in 0:00:00.007
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/csn.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/csn-tmp9EEV8FN4.fasl
; compilation finished in 0:00:00.280
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/csn-threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/csn-threads-tmpDK25NJJO.fasl
; compilation finished in 0:00:00.025
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/support-tmpNMZ5RT9R.fasl
; compilation finished in 0:00:00.163
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/controller.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/controller-tmp8K51P1O1.fasl
; compilation finished in 0:00:00.092
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/boundaries.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/boundaries-tmpXAVJ8WEV.fasl
; compilation finished in 0:00:00.006
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/threads.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/threads-tmpOZHFIU2N.fasl
; compilation finished in 0:00:00.034
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/worker-bridge.lisp\" (written 11 OCT 2026 01:49:14 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/worker-bridge-tmpJD9SCIW3.fasl
; compilation finished in 0:00:00.099
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/slot-support.lisp\" (written 11 OCT 2026 02:23:35 PM):

; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/slot-support-tmpICVK4HSI.fasl
; compilation finished in 0:00:00.106
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/slots.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/slots-tmpA5CK3QHN.fasl
; compilation finished in 0:00:00.190
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/slot-threads.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/slot-threads-tmp5KE6HXAY.fasl
; compilation finished in 0:00:00.088
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary-support.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary-support-tmp5UBS1APN.fasl
; compilation finished in 0:00:00.092
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary-tmpSI9E4AQB.fasl
; compilation finished in 0:00:00.217
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary-threads.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary-threads-tmpID7X8UGC.fasl
; compilation finished in 0:00:00.067
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/rebuild.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/rebuild-tmpFYN8G5D1.fasl
; compilation finished in 0:00:00.180
; compiling file \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/hash-digests.lisp\" (written 11 OCT 2026 02:23:35 PM):


; wrote /var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/final-fasl/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/hash-digests-tmpG1VNK6NW.fasl
; compilation finished in 0:00:00.301
ok    package ARCDOCDB presente
ok    ARCDOCDB:*VERSION* è una stringa
ok    TEST-REQ-IDX-001-HASH-ORACLE-UPSTREAM-ANCHORS
ok    TEST-REQ-IDX-001-HASH-VECTORS
ok    TEST-REQ-IDX-001-HASH-SEED-HIGH
ok    TEST-REQ-IDX-001-HASH-LENGTH
ok    TEST-REQ-IDX-001-HASH-TAIL
ok    TEST-REQ-IDX-001-HASH-BLOCKS
ok    TEST-REQ-IDX-001-HASH-EMPTY-SPANS-AT-BUFFER-EDGES
ok    TEST-REQ-IDX-001-HASH-ALL-TAILS-AT-SPAN-CEILING
ok    TEST-REQ-IDX-001-HASH-BOUNDARIES-32-8-4-THROUGH-65K
ok    TEST-REQ-IDX-001-HASH-ALL-256-SINGLE-OCTETS
ok    TEST-REQ-IDX-001-HASH-ZERO-FF-ORDERED-AND-ASYMMETRIC-LANES
ok    TEST-REQ-IDX-001-HASH-OUTSIDE-SPAN-DIFFERS-AND-ALL-BYTES-STAY-UNCHANGED
ok    TEST-REQ-IDX-001-HASH-SEED-AND-CALL-HISTORY-HAVE-NO-STATE
  XXH64 corpus: seed 6483BEEF, 256 span finiti di 0..65535 byte.
ok    TEST-REQ-IDX-001-HASH-FINITE-CORPUS-FIXED-SEED-6483BEEF
ok    TEST-REQ-IDX-001-HASH-EVERY-BYTE-IN-SELECTED-SPANS-PARTICIPATES
ok    TEST-REQ-IDX-001-HASH-NAMED-PUBLIC-CALLER-WITH-T-ARGUMENTS
ok    TEST-REQ-IDX-001-HASH-INVALID-BUFFERS-AND-NONSIMPLE-ARRAYS
ok    TEST-REQ-IDX-001-HASH-INVALID-INDEX-TYPES-AND-NEGATIVE-INDICES
ok    TEST-REQ-IDX-001-HASH-INVALID-SEEDS-IN-EACH-HALF
ok    TEST-REQ-IDX-001-HASH-VALID-INDEX-TYPES-BUT-INVALID-BUFFER-RANGE
ok    TEST-REQ-IDX-001-HASH-SPAN-65536-AND-LARGER-REJECTED-WITHOUT-MUTATION
ok    TEST-REQ-IDX-001-HASH-VALIDATION-ARGUMENTS-RANGE-SPAN-PRECEDENCE
ok    TEST-REQ-IDX-001-HASH-ABSOLUTE-INDICES-MAY-EXCEED-SPAN-LIMIT
ok    TEST-REQ-IDX-001-HASH-U32-SIGN-BITS-AND-ASYMMETRIC-WORD-ORDER
  XXH64 heap: 64 finestre seriali, 16448 chiamate misurate, atteso 0 byte.
ok    TEST-REQ-IDX-001-HASH-ZERO-HEAP-IN-SERIAL-CALL-WINDOWS
ok    TEST-REQ-IDX-001-HASH-BLOCK-RELATIONAL-GUARDS
ok    TEST-REQ-IDX-001-HASH-TAIL-RELATIONAL-GUARDS
  XXH64 thread: quattro worker privati, 1220 risultati, ready/join limitati.
ok    TEST-REQ-IDX-001-HASH-FOUR-REAL-WORKERS-WITH-PRIVATE-INPUT-AND-BOUNDED-CLEANUP
28 test XXH64 superati.
ok    TEST-REQ-AFF-004-TYPED-ERRORS-RENDERING
ok    TEST-REQ-FOR-003-OUT-OF-LINE-READERS
ok    TEST-REQ-FOR-003-LITTLE-ENDIAN
ok    TEST-REQ-FOR-003-RANGES
ok    TEST-REQ-FOR-003-CRC-KNOWN-VECTORS
ok    TEST-REQ-FOR-003-CRC-DIFFERENTIAL-INCREMENTAL
ok    TEST-REQ-FOR-003-WORD-ENCODING-INDEPENDENT-ORACLE
ok    TEST-REQ-LIM-001-WORD-ENCODING-PREFLIGHT
ok    TEST-REQ-FOR-003-INDEPENDENT-ENCODING-ORACLE
ok    TEST-REQ-LIM-001-ROUNDTRIP-VERSIONS
ok    TEST-REQ-LIM-003-KEY-BOUNDARIES
ok    TEST-REQ-LIM-001-DOCUMENT-BOUNDARIES
ok    TEST-REQ-FOR-003-EVERY-BYTE-CORRUPTION
ok    TEST-REQ-FOR-003-EVERY-TRUNCATION
ok    TEST-REQ-FOR-003-VALID-CRC-INVALID-FIELDS
ok    TEST-REQ-LIM-001-PREFLIGHT-NO-PARTIAL-WRITE
ok    TEST-REQ-AFF-002-INDEX-IDENTITY
ok    TEST-REQ-FOR-004-PREPARED-OUTCOME
ok    TEST-REQ-FOR-003-CONTROL-RECORD-SHAPES
ok    TEST-REQ-LIM-001-SEMANTIC-BOUNDARIES
ok    TEST-REQ-FOR-004-OUTCOME-PROVENANCE-FIELDS
ok    TEST-REQ-FOR-004-U64-BOTH-WORDS
ok    TEST-REQ-FOR-003-SEALED-BATCHES
ok    TEST-REQ-FOR-003-BATCH-ALL-TRUNCATIONS
ok    TEST-REQ-FOR-003-BATCH-SEAL-SEMANTIC-CORRUPTION
ok    TEST-REQ-FOR-003-BATCH-STAMP-AND-TYPE
ok    TEST-REQ-LIM-003-BATCH-BUDGETS
ok    TEST-REQ-FOR-004-BATCH-TXID-INDEPENDENT-OF-SEAL-CSN
28 test delle fondazioni superati.
ok    TEST-REQ-AFF-004-UTF8-REFERENCE-IS-STRICT
ok    TEST-REQ-AFF-004-UTF8-EMPTY-ASCII-AND-DEFAULT-BUDGET
ok    TEST-REQ-AFF-004-UTF8-INVALID-RANGE-AND-BUFFER
ok    TEST-REQ-AFF-008-UTF8-INVALID-BUDGET
ok    TEST-REQ-AFF-008-UTF8-BYTE-BUDGET-PRECEDES-CONTENT
ok    TEST-REQ-AFF-004-UTF8-ALL-256-SINGLE-BYTE-INPUTS
  UTF-8 esaustivo: 65536 coppie, 18304 valide, 47232 rifiutate.
ok    TEST-REQ-AFF-004-UTF8-ALL-65536-TWO-BYTE-INPUTS
ok    TEST-REQ-AFF-004-UTF8-MANUAL-SCALAR-BOUNDARIES
ok    TEST-REQ-AFF-004-UTF8-NUL-BOM-NONCHARACTERS-AND-NO-NORMALIZATION
ok    TEST-REQ-AFF-004-UTF8-ILLEGAL-LEADING-OFFSET
ok    TEST-REQ-AFF-004-UTF8-TRUNCATION-BEFORE-CONTENT
ok    TEST-REQ-AFF-004-UTF8-CONTINUATION-OFFSET-AND-PRIORITY
ok    TEST-REQ-AFF-004-UTF8-SCALAR-RESTRICTIONS-AFTER-CONTINUATIONS
ok    TEST-REQ-AFF-004-UTF8-SEEDED-SCALAR-STREAM-AND-SLICES
  UTF-8 fuzz: seed 3629A11F, 4096 input di 3..8 byte, 234 validi, 3862 rifiutati.
ok    TEST-REQ-AFF-004-UTF8-DIFFERENTIAL-FUZZ-4096-INPUTS
ok    TEST-REQ-LIM-001-UTF8-EXACT-SIXTEEN-MIB-AND-OVER-BUDGET
  UTF-8 CPU: 2 worker, 83886080 byte, sink 16777216 ciascuno, overlap 260224 tick, 1000000 tick/s.
ok    TEST-REQ-CON-005-UTF8-TWO-PRIVATE-BUFFERS-AND-REAL-CPU-OVERLAP
17 test UTF-8 superati.
ok    TEST-REQ-AFF-004-CBOR-ALL-256-COMPLETE-LEADING-BYTES
ok    TEST-REQ-AFF-004-CBOR-ALL-256-ONE-BYTE-SPANS
ok    TEST-REQ-AFF-004-CBOR-ALL-256-EXTENDED-SIMPLE-VALUES
  CBOR BE: 65536 argomenti a 16 bit, compresi quelli non minimi.
ok    TEST-REQ-AFF-004-CBOR-ALL-65536-BIG-ENDIAN-TWO-BYTE-ARGUMENTS
ok    TEST-REQ-AFF-004-CBOR-IMMEDIATE-VALUES-WITHOUT-BODY-OR-TAG-CHILD
ok    TEST-REQ-AFF-004-CBOR-RAW-WIDTHS-PRESERVE-NONMINIMAL-ARGUMENTS
ok    TEST-REQ-AFF-004-CBOR-U64-EXTREMES-AND-ASYMMETRIC-WORDS
ok    TEST-REQ-AFF-004-CBOR-FLOATING-BITS-ZERO-SIGN-INFINITY-AND-NAN
ok    TEST-REQ-AFF-004-CBOR-INDEFINITE-AND-BREAK-ARE-CONTEXT-FREE-MARKERS
ok    TEST-REQ-AFF-004-CBOR-RESERVED-AND-ILLEGAL-INDEFINITE-PRECEDE-ARGUMENTS
ok    TEST-REQ-AFF-004-CBOR-EVERY-ARGUMENT-TRUNCATION-AND-DECLARED-END
ok    TEST-REQ-AFF-004-CBOR-SIMPLE-CHECK-FOLLOWS-COMPLETE-HEAD
ok    TEST-REQ-AFF-004-CBOR-INVALID-BUFFER-AND-RANGE-BEFORE-CONTENT
ok    TEST-REQ-AFF-004-CBOR-EMPTY-VALID-SPANS-HAVE-END-OFFSET
ok    TEST-REQ-AFF-004-CBOR-MISALIGNED-HEADS-IGNORE-TRAILING-BYTES
  CBOR fuzz: seed 8949A11F, 4096 span di 1..9 byte, 3437 validi, 659 rifiutati.
ok    TEST-REQ-AFF-004-CBOR-DIFFERENTIAL-FUZZ-4096-BOUNDED-SPANS
  CBOR CPU: 2 worker, 2097152 header, 18874368 byte, sink 2401919800705024/2231683637051392, overlap 36127 tick, 1000000 tick/s.
ok    TEST-REQ-CON-005-CBOR-TWO-PRIVATE-BUFFERS-AND-REAL-CPU-OVERLAP
17 test degli header CBOR superati.
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-ALL-LEADING-BYTES-AND-SHORT-SPANS
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-MAJOR-ZERO-TO-SIX-WIDTH-THRESHOLDS
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-ALL-EXTENDED-SIMPLE-VALUES
  CBOR minimo: 65536 half e 131072 espansioni esatte, inclusi NaN e segni.
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-ALL-HALF-AND-EXACT-EXPANSIONS
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-IEEE-ORACLE-KNOWN-VALUES
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-RFC-NUMERIC-VECTORS-AND-ADJACENT-VALUES
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-FINITE-NORMAL-SUBNORMAL-BOUNDARIES
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SIGN-ZERO-INFINITY-AND-NAN-PAYLOAD
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-EVERY-TRUNCATED-HEAD-BEFORE-PREFERENCE
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SYNTAX-BEFORE-NONMINIMAL
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-INVALID-BUFFER-RANGE-AND-EMPTY-SPAN
ok    TEST-REQ-LIM-002-CBOR-MINIMAL-HEADER-ONLY-AND-MISALIGNED-SENTINELS
  CBOR minimo fuzz: seed4D494E43, 4096word32+4096word64+4096span0..9, 11223 accettati/1065 rifiutati/84 nonminimi.
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-FINITE-DIFFERENTIAL-FUZZ-SEED-4D494E43
  CBOR minimo: 2worker, 524288header, 4718592byte, sink1406013828104192/5628138478764032, overlap tempo-reale 13719tick (1000000tick/s).
ok    TEST-REQ-CON-005-CBOR-MINIMAL-TWO-PRIVATE-WORKERS-REAL-WORK-INTERVALS
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-PUBLIC-SUBNORMAL-ALIGNMENT-PAIRS
15 test delle testate CBOR minime superati.
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-RFC-DEFINITE-VECTORS
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-RFC-INDEFINITE-VECTORS
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-GENERIC-PROFILE-PERMISSIONS
  CBOR structure AST: seed 7394B21D, 256 casi generati.
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-GENERATED-AST-CORPUS
  CBOR structure lead: 512 span, 41 validi/471 rifiutati.
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-ALL-LEADS-TWO-BYTE-SPANS
  CBOR structure fuzz: seed 49CBA017, 30 validi/4066 rifiutati.
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-SEEDED-FINITE-DIFFERENTIAL
ok    TEST-REQ-AFF-008-CBOR-STRUCTURE-TRUNCATION-AT-EVERY-BOUNDARY
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-EXACT-ROOT-AND-TRAILING-PRIORITY
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-BREAK-CONTEXT-AND-TAG-PRIORITY
ok    TEST-REQ-AFF-008-CBOR-STRUCTURE-TAGS-CHARGE-PARENT-ONCE
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-CHUNKS-SAME-TYPE-AND-HEADER-FIRST
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-VALID-UNICODE-AND-CHUNK-LOCALITY
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-INVALID-UNICODE-EXACT-OFFSETS
ok    TEST-REQ-AFF-008-CBOR-STRUCTURE-PAYLOAD-WIDTH-AND-HUGE-UNSIGNED-LENGTHS
ok    TEST-REQ-AFF-008-CBOR-STRUCTURE-CONTAINER-MINIMUM-REMAINING-BYTES
ok    TEST-REQ-AFF-008-CBOR-STRUCTURE-DEPTH-100-AND-MAP-KEYS
ok    TEST-REQ-AFF-008-CBOR-STRUCTURE-NODE-BOUNDARIES-CHUNKS-AND-BREAKS
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-HEADER-ERRORS-BEFORE-NODE-BUDGET
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-INVALID-RANGE-AND-TYPE-PRIORITY
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-WORKSPACE-ALIAS-AND-PREFLIGHT-IMMUTABILITY
ok    TEST-REQ-AFF-004-CBOR-STRUCTURE-LIMIT-CONFIGURATION-AND-ORDER
ok    TEST-REQ-AFF-008-CBOR-STRUCTURE-BYTE-BUDGET-AND-EXACT-16-MIB
ok    TEST-REQ-AFF-008-CBOR-STRUCTURE-REUSE-AFTER-RUNTIME-FAILURES
  CBOR structure CPU: 2 worker, 48 scansioni, 2359344 nodi, 5505168 byte, sink 4718784/3145920, overlap 82445 tick, 1000000 tick/s.
ok    TEST-REQ-CON-005-CBOR-STRUCTURE-TWO-PRIVATE-WORKSPACES-REAL-CPU-OVERLAP
24 test della struttura CBOR superati.
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-ALL-MAJOR-TYPES-AND-GENERIC-PERMISSIONS
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-INTEGER-AND-TAG-WIDTH-THRESHOLDS
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-STRING-AND-CONTAINER-WIDTH-THRESHOLDS
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-NONMINIMAL-WIDTHS-AT-EVERY-MAJOR
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-FLOATS-IN-ROOT-KEYS-VALUES-AND-TAGS
  CBOR struttura minima: 768 casi lead, 84 accettati/684 rifiutati.
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-ALL-LEADING-BYTES-COLD-REFERENCE
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-HEADER-SYNTAX-BEFORE-LOCAL-PREFERENCE
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-PREFERENCE-BEFORE-BUDGETS-AND-PAYLOAD
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-NESTED-PREFERENCE-NOT-ONLY-ROOT
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-OPAQUE-BYTES-AND-CONTROL-TEXT-ARE-NOT-HEADERS
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-UTF8-ABSOLUTE-OFFSETS-AND-WHOLE-PAYLOAD
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-COMPLETED-ROOT-PRECEDES-TRAILING-CONTENT
ok    TEST-REQ-AFF-008-CBOR-MINIMAL-SCAN-TAGS-COUNT-ONCE-IN-PARENT-AND-NODE-BOUNDS
ok    TEST-REQ-LIM-002-CBOR-MINIMAL-SCAN-DEPTH-100-101-AND-MAP-KEYS
ok    TEST-REQ-AFF-008-CBOR-MINIMAL-SCAN-HUGE-LENGTHS-AND-PARENT-ARITY-PRIORITY
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-INVALID-INPUT-PRIORITY-AND-COLD-IMMUTABILITY
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-WORKSPACE-ALIAS-AND-LIMIT-ORDER
ok    TEST-REQ-LIM-001-CBOR-MINIMAL-SCAN-EXACT-SIXTEEN-MIB-AND-OVER-BUDGET
ok    TEST-REQ-AFF-008-CBOR-MINIMAL-SCAN-RESET-AFTER-ERRORS-AND-ALTERNATING-MODES
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-MISALIGNMENT-DECLARED-SPAN-AND-TRUNCATIONS
  CBOR struttura minima: 512 AST e fuzz4096 seed53434d31, 41 validi/4055 rifiutati.
ok    TEST-REQ-AFF-004-CBOR-MINIMAL-SCAN-SEEDED-ASTS-AND-FINITE-DIFFERENTIAL-FUZZ
  CBOR minimal scan: 2 worker, 48 scansioni, sink 4718784/9437376, overlap tempo reale 100262 tick, 1000000 tick/s; nessuna inferenza su core/scaling.
ok    TEST-REQ-CON-005-CBOR-MINIMAL-SCAN-TWO-PRIVATE-WORKSPACES-REAL-TIME-OVERLAP
22 test della struttura CBOR minima superati.
ok    TEST-REQ-CBR-001-CBOR-WRITE-LITERAL-VECTORS-ALL-SEVEN-MAJOR-TYPES
ok    TEST-REQ-CBR-001-CBOR-WRITE-DIRECT-ARGUMENTS-ZERO-THROUGH-TWENTY-THREE
ok    TEST-REQ-CBR-001-CBOR-WRITE-ADJACENT-WIDTH-BOUNDARIES-AND-SPLIT-U64
  CBOR write: 65536 argomenti u16 x 7 major, 458752 confronti aritmetici freddi.
ok    TEST-REQ-CBR-001-CBOR-WRITE-ALL-U16-ARGUMENTS-FOR-EACH-MAJOR
ok    TEST-REQ-CBR-001-CBOR-WRITE-EVERY-INSUFFICIENT-CAPACITY-BEFORE-ANY-BYTE
ok    TEST-REQ-CBR-001-CBOR-WRITE-INVALID-RANGES-DOMINATE-ALL-OTHER-ERRORS
ok    TEST-REQ-CBR-001-CBOR-WRITE-REJECTS-NON-SIMPLE-OCTET-DESTINATIONS
ok    TEST-REQ-CBR-001-CBOR-WRITE-MAJOR-PRECEDES-HIGH-LOW-AND-CAPACITY
ok    TEST-REQ-CBR-001-CBOR-WRITE-HIGH-PRECEDES-LOW-AND-CAPACITY
ok    TEST-REQ-CBR-001-CBOR-WRITE-LOW-PRECEDES-CAPACITY
ok    TEST-REQ-CBR-001-CBOR-WRITE-EMPTY-VALID-SPANS-ARE-CAPACITY-ERRORS
ok    TEST-REQ-CBR-001-CBOR-WRITE-EXACT-CAPACITY-MISALIGNMENT-AND-EXTRA-SPAN
ok    TEST-REQ-CBR-001-CBOR-WRITE-HEADER-HAS-NO-DOCUMENT-OR-PAYLOAD-BUDGET
ok    TEST-REQ-CBR-001-CBOR-WRITE-REUSE-AND-CONSECUTIVE-HEADERS
  CBOR write fuzz: seed57524342, 4096 casi; dimensioni1/2/3/5/9 = 560/465/511/512/2048.
ok    TEST-REQ-CBR-001-CBOR-WRITE-DIFFERENTIAL-FUZZ-SEED-57524342
  CBOR write: 2 worker, 229376 header, sink 15466496/17006592, overlap tempo reale 6240 tick, 1000000 tick/s; nessuna inferenza su core/scaling.
ok    TEST-REQ-CBR-001-CBOR-WRITE-TWO-EXCLUSIVE-DESTINATIONS-REAL-TIME-OVERLAP
ok    TEST-REQ-CBR-001-CBOR-WRITE-MINIMAL-READER-ROUNDTRIP-SUPPLEMENT
17 test della scrittura degli header CBOR minimi superati.
ok    TEST-REQ-MVC-008-CSN-DEFAULT-CAPACITY-AND-VALID-BOUNDARIES
ok    TEST-REQ-AFF-008-CSN-INVALID-CONFIGURATION-EACH-FIELD
ok    TEST-REQ-MVC-008-CSN-RECOVERY-BASE-AND-FIRST-SUCCESSOR
ok    TEST-REQ-MVC-008-CSN-FULL-REFUSAL-CREDIT-AND-EVERY-SLOT-REUSED
ok    TEST-REQ-MVC-008-CSN-REVERSE-COMPLETION-AND-INTERIOR-GAP
ok    TEST-REQ-MVC-008-CSN-ADR0046-MODULO-RING-COUNTEREXAMPLE
ok    TEST-REQ-MVC-008-CSN-CARRY-U32-AND-HORIZON-BORROW
ok    TEST-REQ-MVC-008-CSN-CROSSES-SBCL-FIXNUM-BOUNDARY
ok    TEST-REQ-AFF-008-CSN-LAST-U64-AND-EXHAUSTION-DOES-NOT-WRAP
ok    TEST-REQ-AFF-004-CSN-INVALID-TOKEN-SHAPES-AND-ZERO
ok    TEST-REQ-AFF-004-CSN-EXACT-SLOT-HIGH-LOW-AND-REGISTRY-BINDING
ok    TEST-REQ-AFF-004-CSN-DOUBLE-RESOLUTION-AND-STALE-REUSED-SLOT
  CSN: K=2, 6 commit, 850 prefissi, 243 storie complete.
  CSN: K=3, 6 commit, 7310 prefissi, 2403 storie complete.
ok    TEST-REQ-MVC-008-CSN-EXHAUSTIVE-CAPACITY-2-3-THROUGH-SIX-COMMITS
  CSN seed #x46C5A71B: 2993 presi, 2987 risolti, 2085 pieni, 964 letture, 971 stale.
ok    TEST-REQ-MVC-008-CSN-DETERMINISTIC-TEN-THOUSAND-ACTIONS
ok    TEST-REQ-AFF-004-CSN-PRIVATE-FI-SHAPE-BEFORE-PUBLIC-MUTATION
ok    TEST-REQ-AFF-004-CSN-PRIVATE-FI-FRONTIERS-BEFORE-PUBLIC-MUTATION
ok    TEST-REQ-AFF-004-CSN-PRIVATE-FI-LIVE-COUNT-TOKEN-AND-RESIDUAL-SCAN
ok    TEST-REQ-CON-004-CSN-GUARD-MACRO-SINGLE-EVALUATION-VALUES-AND-CLEANUP
ok    TEST-REQ-CON-004-CSN-HELD-WORKER-GUARD-BUSY-AND-INDEPENDENT-REGISTRY
  CSN: 4 worker x 1000 assegnazioni, 5490 busy, 798 full, slot #(1315 1341 1344), H convergente.
ok    TEST-REQ-MVC-008-CSN-FOUR-REAL-WORKERS-ONE-THOUSAND-ASSIGNMENTS-EACH
20 test del registro CSN superati.
ok    TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-BOUNDARIES
ok    TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-TYPED-RANGE-REFUSALS
ok    TEST-REQ-MVC-005-SNAPSHOT-EMPTY-ARCHIVE-CSN-ZERO
ok    TEST-REQ-MVC-005-SNAPSHOT-CANONICAL-OUT-OF-ORDER-ACTIVATION
ok    TEST-REQ-MVC-005-SNAPSHOT-CARRY-U32-AND-BOXED-CSN
ok    TEST-REQ-MVC-007-SNAPSHOT-MAXIMUM-CSN-IS-NOT-ABSENCE
ok    TEST-REQ-MVC-007-SNAPSHOT-SAME-CSN-DISTINCT-GENERATIONS
ok    TEST-REQ-MVC-003-SNAPSHOT-MULTIPIN-RETENTION-BOUNDARIES
ok    TEST-REQ-MVC-007-SNAPSHOT-CONSERVATIVE-THRESHOLD-UNTIL-RECALCULATION
ok    TEST-REQ-AFF-008-SNAPSHOT-CAPACITY-REFUSES-BEFORE-MUTATION
ok    TEST-REQ-MVC-007-SNAPSHOT-PINNED-CONTEXT-REFUSES-BEFORE-MUTATION
ok    TEST-REQ-AFF-008-SNAPSHOT-DEADLINE-OVERFLOW-AND-EXACT-U64-BOUNDARY
ok    TEST-REQ-AFF-008-SNAPSHOT-PRIVATE-FI-GENERATION-EXHAUSTION
ok    TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-READER-DEADLINE-BEFORE-EXACT-AFTER
ok    TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-ACTIVATION-EXPIRY-REMOVES-PIN
ok    TEST-REQ-MVC-004-SNAPSHOT-WAIT-DEADLINE-BEFORE-EXACT-AFTER
ok    TEST-REQ-MVC-004-SNAPSHOT-LIFETIME-INCLUDES-INITIAL-WAIT
ok    TEST-REQ-AFF-008-SNAPSHOT-TIMER-BUDGET-REFUSALS-AND-EMPTY-SWEEP
ok    TEST-REQ-AFF-008-SNAPSHOT-TIMER-CIRCULAR-FAIRNESS-AND-MIXED-DEADLINES
ok    TEST-REQ-MVC-004-SNAPSHOT-TIMER-DISTINGUISHES-WAIT-AND-AGE
ok    TEST-REQ-MVC-007-SNAPSHOT-TERMINATION-IDEMPOTENT-ACTIVE-AND-WAITING
ok    TEST-REQ-MVC-007-SNAPSHOT-STALE-GENERATION-AFTER-CONTEXT-REUSE
ok    TEST-REQ-MVC-007-SNAPSHOT-STALE-CONTEXT-AFTER-SLOT-REUSE
ok    TEST-REQ-MVC-005-SNAPSHOT-PRIVATE-BUFFER-RANGE-AND-UNBOUND-IDENTITY
ok    TEST-REQ-AFF-004-SNAPSHOT-TERMINAL-INVALIDATION-PRESERVES-PINS
ok    TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-READER-CSN-STATE-AND-RANGE
ok    TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-COUNTER-GUARDS
ok    TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-RECALCULATION-INVARIANTS
ok    TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE
ok    TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION
ok    TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON
ok    TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN
ok    TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITH-PIN
ok    TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP
ok    TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY
ok    TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT
ok    TEST-REQ-MVC-007-SNAPSHOT-FAULT-BEFORE-PUBLISH
ok    TEST-REQ-MVC-007-SNAPSHOT-FAULT-DURING-PUBLISH
ok    TEST-REQ-MVC-007-SNAPSHOT-FAULT-AFTER-PUBLISH
ok    TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY
ok    TEST-REQ-CON-004-SNAPSHOT-HELD-MUTEX-READER-AND-OTHER-ARCHIVE
ok    TEST-REQ-CON-004-SNAPSHOT-RECURSIVE-GUARD-AND-NIL-BODY
ok    TEST-REQ-CON-004-SNAPSHOT-READER-WITH-CSN-MUTEX-HELD
43 test snapshot/CSN superati.
ok    TEST-REQ-AFF-008-EBR-VALID-CAPACITIES-AND-INITIAL-STATE
ok    TEST-REQ-AFF-008-EBR-WORKER-CAPACITY-REFUSALS
ok    TEST-REQ-AFF-008-EBR-RETIREMENT-CAPACITY-REFUSALS
ok    TEST-REQ-CMP-005-EBR-CANONICAL-CONTEXT-AND-WORKER-RANGE
ok    TEST-REQ-CMP-005-EBR-ENTER-EXIT
ok    TEST-REQ-CMP-005-EBR-NESTED-ENTRY-PRESERVES-PIN
ok    TEST-REQ-CMP-005-EBR-INACTIVE-EXIT-REFUSED
ok    TEST-REQ-CMP-005-EBR-INDEPENDENT-READERS
ok    TEST-REQ-CMP-005-EBR-OWNER-NONLOCAL-CLEANUP
ok    TEST-REQ-CMP-007-EBR-RESERVATION-RESOURCE-AND-CREDITS
ok    TEST-REQ-CMP-007-EBR-NULL-RESOURCE-PRESERVES-STATE
ok    TEST-REQ-CMP-007-EBR-DUPLICATE-RESOURCE-PRESERVES-STATE
ok    TEST-REQ-AFF-008-EBR-FULL-CAPACITY-PRESERVES-STATE
ok    TEST-REQ-CMP-007-EBR-CANCEL-IS-IDEMPOTENT
ok    TEST-REQ-CMP-007-EBR-PUBLISH-ADVANCES-ONCE
ok    TEST-REQ-CMP-007-EBR-PUBLISHED-RETIREMENT-CANNOT-CANCEL
ok    TEST-REQ-CMP-007-EBR-INVALID-TICKET-STATE-OPERATIONS
ok    TEST-REQ-CMP-007-EBR-STRICT-RECLAIM-THRESHOLD
ok    TEST-REQ-CMP-007-EBR-TWO-OLD-READERS-BLOCK-RECLAIM
ok    TEST-REQ-CMP-007-EBR-NEW-READER-DOES-NOT-BLOCK-OLD-RETIREMENT
ok    TEST-REQ-CMP-007-EBR-THRESHOLD-IS-MONOTONE
ok    TEST-REQ-CMP-007-EBR-RESOURCE-UNTIL-COMPLETION
ok    TEST-REQ-CMP-007-EBR-COMPLETION-IS-IDEMPOTENT
ok    TEST-REQ-CMP-007-EBR-STALE-GENERATION-PRESERVES-REUSE
ok    TEST-REQ-CMP-007-EBR-ZERO-AND-WRONG-GENERATION-PRESERVE-STATE
ok    TEST-REQ-AFF-008-EBR-GENERATION-MAXIMUM-WITHOUT-WRAP
ok    TEST-REQ-AFF-008-EBR-EPOCH-CREDIT-BEFORE-PUBLICATION
ok    TEST-REQ-AFF-008-EBR-CANCEL-RESTORES-EPOCH-CREDIT
ok    TEST-REQ-AFF-004-EBR-METADATA-INCOHERENCE-FAULTS
ok    TEST-REQ-AFF-004-EBR-COUNTER-INCOHERENCE-FAULTS
ok    TEST-REQ-AFF-004-EBR-FUTURE-READER-FAULTS
ok    TEST-REQ-AFF-004-EBR-READER-CLEANUP-AFTER-FAULT
ok    TEST-REQ-CMP-007-EBR-CLAIM-IS-EXCLUSIVE
ok    TEST-REQ-CMP-005-EBR-READER-FINISHES-WITH-MAINTENANCE-MUTEX-HELD
34 test epoche/reclaim superati.
ok    TEST-REQ-MVC-005-READ-CURRENT-BUFFER-UNTOUCHED
ok    TEST-REQ-MVC-005-READ-SNAPSHOT-CSN-ZERO-CARRY-BOXED
ok    TEST-REQ-MVC-004-READ-COMPLETION-KEEPS-SNAPSHOT
ok    TEST-REQ-MVC-004-READ-WAITING-REFUSAL-CLEANS-EPOCH
ok    TEST-REQ-MVC-004-READ-ENDED-BEGIN-CLEANS-EPOCH
ok    TEST-REQ-CON-004-READ-CURRENT-GENERATION-BEFORE-PIN
ok    TEST-REQ-CON-004-READ-SNAPSHOT-ZERO-GENERATION-BEFORE-PIN
ok    TEST-REQ-CON-004-READ-FOREIGN-SNAPSHOT-BEFORE-PIN
ok    TEST-REQ-CON-004-READ-ALREADY-ACTIVE-READER-REFUSAL
ok    TEST-REQ-CON-004-READ-NESTED-KEEPS-EXISTING-PIN
ok    TEST-REQ-MVC-005-READ-INACTIVE-BUFFER-REFUSAL
ok    TEST-REQ-MVC-005-READ-RESULT-RANGE-PRESERVES-BUFFER
ok    TEST-REQ-MVC-004-READ-FINAL-SNAPSHOT-CHECK
ok    TEST-REQ-CMP-007-READ-LOGICAL-EXPIRY-KEEPS-LIVE-EPOCH
ok    TEST-REQ-CON-004-READ-CLOCK-REGRESSION-RELEASES-PIN
ok    TEST-REQ-CMP-007-READ-ABANDON-RELEASES-PIN
ok    TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-GENERATION
ok    TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CSN
ok    TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-START
ok    TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CONFIRMED
ok    TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-SNAPSHOT
ok    TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-GENERATION
ok    TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-CSN
ok    TEST-REQ-AFF-004-READ-ACTIVE-SNAPSHOT-ZERO-GENERATION
ok    TEST-REQ-AFF-004-READ-ACTIVE-FOREIGN-BINDING
ok    TEST-REQ-AFF-004-READ-MISSING-EPOCH-FAULT
ok    TEST-REQ-AFF-004-READ-FAULTED-CONTEXT-STAYS-FAULTED
ok    TEST-REQ-AFF-004-READ-FINAL-CSN-CHANGED-FAULT
ok    TEST-REQ-CMP-007-READ-EXTERNAL-ERROR-THROW-CLEANUP
ok    TEST-REQ-CON-004-READ-TWO-WORKER-MIGRATION
30 test dei compiti di lettura superati.
ok    TEST-REQ-AFF-008-WRITER-CONFIGURATION
ok    TEST-REQ-AFF-008-WRITER-DEFAULTS-AND-CONFIGURATION-BOUNDARIES
ok    TEST-REQ-CON-001-WRITER-FIFO-RING-WRAP-AND-NIL
ok    TEST-REQ-AFF-008-WRITER-FULL-REFUSAL-RETAINS-PAYLOAD
ok    TEST-REQ-CON-004-WRITER-GUARD-BUSY-DOES-NOT-MUTATE
ok    TEST-REQ-CON-001-WRITER-TARGET-SUBRANGE-AND-EMPTY
ok    TEST-REQ-AFF-004-WRITER-INVALID-TARGET-PREFLIGHT
ok    TEST-REQ-AFF-004-WRITER-PRIVATE-RING-ALIAS-REFUSED
ok    TEST-REQ-CON-001-WRITER-LEASE-LIFECYCLE
ok    TEST-REQ-CON-001-WRITER-STALE-LEASE-SAME-THREAD
ok    TEST-REQ-AFF-008-WRITER-QUANTUM-IS-CUMULATIVE-PER-LEASE
ok    TEST-REQ-AFF-008-WRITER-GENERATION-DOES-NOT-WRAP
ok    TEST-REQ-CON-001-WRITER-SEEDED-LIST-ORACLE
ok    TEST-REQ-CON-001-WRITER-FOREIGN-THREAD-CANNOT-USE-LEASE
ok    TEST-REQ-CON-001-WRITER-CAS-HAS-ONE-OWNER
  CPU due Serie: 1048576 byte, overlap 33902 tick, unita 1000000 tick/s.
ok    TEST-REQ-CON-003-INDEPENDENT-SERIES-PROGRESS-AND-CPU-OVERLAP
  wave 0: 144 messaggi, 3 producer, 2 consumer, 5 worker riusati, drain aperto.
  wave 1: 144 messaggi, 3 producer, 2 consumer, 5 worker riusati, drain aperto.
  wave 2: 144 messaggi, 3 producer, 2 consumer, 5 worker riusati, drain aperto.
ok    TEST-REQ-CON-001-WRITER-REAL-PRODUCERS-CONSUMERS-AND-WORKER-REUSE
ok    TEST-REQ-AFF-008-HANDOFF-CONFIGURATION-AND-LIMITS
ok    TEST-REQ-CON-005-HANDOFF-SINGLE-OBLIGATION-AND-DUPLICATE-BEGIN
ok    TEST-REQ-CON-005-HANDOFF-ENQUEUE-BEFORE-AND-AFTER-EMPTY-RELEASE
ok    TEST-REQ-CON-004-HANDOFF-CUMULATIVE-QUANTUM-AND-SUCCESSIVE-SLICES
ok    TEST-REQ-AFF-008-HANDOFF-FULL-READY-AND-RUNNING-RETAIN-STATE
ok    TEST-REQ-CON-004-HANDOFF-BUSY-IDLE-AND-READY-PRESERVE-STATE
ok    TEST-REQ-CON-005-HANDOFF-BUSY-RELEASE-RETAINS-LEASE-FOR-RETRY
ok    TEST-REQ-CON-005-HANDOFF-EARLY-RELEASE-CONSERVES-ENTIRE-BACKLOG
ok    TEST-REQ-AFF-004-HANDOFF-LEASE-VALIDATION-AND-STALE-GENERATION
ok    TEST-REQ-AFF-004-HANDOFF-TARGET-PREFLIGHT-AND-PRIVATE-ALIAS
ok    TEST-REQ-AFF-008-HANDOFF-GENERATION-EXHAUSTION-PRESERVES-READY
ok    TEST-REQ-AFF-004-HANDOFF-REJECTS-INCONSISTENT-SCHEDULING-STATES
ok    TEST-REQ-AFF-004-HANDOFF-HELPERS-REQUIRE-CURRENT-THREAD-GUARD
ok    TEST-REQ-CON-001-HANDOFF-SEEDED-LIST-AND-SCHEDULING-ORACLE
ok    TEST-REQ-CON-001-HANDOFF-FOREIGN-THREAD-CANNOT-USE-LEASE
ok    TEST-REQ-CON-002-HANDOFF-TRANSFERS-SUCCESSIVE-SLICES-BETWEEN-REUSED-THREADS
  Handoff: 4 thread riusati, 6 ondate, 36 messaggi, 2 Serie indipendenti.
ok    TEST-REQ-CON-003-HANDOFF-REUSES-FOUR-WORKERS-ACROSS-INDEPENDENT-SERIES-WAVES
ok    TEST-REQ-AFF-008-READY-CONFIGURATION-AND-LIMITS
ok    TEST-REQ-AFF-004-READY-SHARD-AND-WRITER-PREFLIGHT
ok    TEST-REQ-CON-001-READY-PER-SHARD-FIFO-WRAP-AND-PRIVATE-OPAQUE-RING
ok    TEST-REQ-CON-004-READY-CURSOR-ROTATES-FIRST-CHOICE-AND-EMPTY-SCAN
ok    TEST-REQ-CON-001-READY-SEEDED-INDEPENDENT-LISTS-AND-CURSORS
ok    TEST-REQ-CON-005-READY-FULL-PRESERVES-SCHEDULING-OBLIGATION
ok    TEST-REQ-CON-005-READY-DEQUEUED-REFERENCE-SURVIVES-BEGIN-BUSY
ok    TEST-REQ-CON-004-READY-SKIPS-BUSY-HOME-AND-PRESERVES-LOCAL-RING
ok    TEST-REQ-CON-004-READY-BUSY-OBSERVATIONS-AND-SCAN-ORDER-ORACLE
ok    TEST-REQ-CON-005-READY-BUSY-PUBLICATION-RETAINS-OBLIGATION-AND-PAYLOAD
ok    TEST-REQ-AFF-004-READY-REJECTS-INVALID-PRIVATE-RING-SHAPES
ok    TEST-REQ-AFF-004-READY-REJECTS-INVALID-PRIVATE-PARTITION-ARRAYS
ok    TEST-REQ-AFF-004-READY-REJECTS-INCONSISTENT-OCCUPIED-AND-FREE-SLOTS
ok    TEST-REQ-AFF-004-READY-HELPERS-REJECT-MISSING-AND-FOREIGN-GUARD
ok    TEST-REQ-CON-005-READY-HANDOFF-BEFORE-AFTER-RELEASE-AND-NEXT-WAVE
  Ready: 4 thread riusati, 6 ondate, 36 payload, shard fermata e stealing.
ok    TEST-REQ-CON-003-READY-REUSED-WORKERS-LIVE-PRODUCERS-AND-INDEPENDENT-SHARDS
  Ready: 2 consumer riusati, 8 ondate, un riferimento estratto per ondata.
ok    TEST-REQ-CON-002-READY-COMPETING-CONSUMERS-TAKE-ONE-REFERENCE-PER-WAVE
ok    TEST-REQ-CON-001-RECYCLE-ROOM-PUBLISHES-AND-PRESERVES-FIFO
ok    TEST-REQ-CON-005-RECYCLE-CAPACITY-ONE-TRANSFERS-OLD-AND-KEEPS-NEW
ok    TEST-REQ-CON-001-RECYCLE-FULL-WRAP-PRESERVES-INDEPENDENT-LIST-ORDER
ok    TEST-REQ-CON-001-RECYCLE-SEEDED-OBLIGATIONS-AND-PAYLOADS-EXACTLY-ONCE
ok    TEST-REQ-CON-005-RECYCLE-ALL-CONSUMERS-RESCHEDULE-AFTER-PRODUCER-REFILLS-FULL
ok    TEST-REQ-CON-005-RECYCLE-BUSY-RETAINS-OBLIGATION-AND-BOTH-RING-SHAPES
ok    TEST-REQ-AFF-004-RECYCLE-SHARD-WRITER-PREFLIGHT-BEFORE-HELD-GUARD
ok    TEST-REQ-AFF-004-RECYCLE-PRIVATE-RING-AND-PARTITION-SHAPES-PRE-MUTATION
ok    TEST-REQ-AFF-004-RECYCLE-MALFORMED-FULL-HEAD-AND-FREE-TAIL-PRE-MUTATION
ok    TEST-REQ-AFF-004-RECYCLE-HELPER-REJECTS-MISSING-AND-FOREIGN-GUARD
ok    TEST-REQ-CON-001-RECYCLE-PRIVATE-OPAQUE-DUPLICATE-IS-OUTSIDE-HANDOFF-PROTOCOL
ok    TEST-REQ-CON-005-RECYCLE-HANDOFF-BEFORE-RELEASE-AND-NEW-WAVE-WITHOUT-CLEANUP
ok    TEST-REQ-CON-005-RECYCLE-RETURNED-OBLIGATION-SURVIVES-BEGIN-BUSY
  Recycle: 3 thread riusati, 8 ondate, 48 payload, ready FULL e busy bounded.
ok    TEST-REQ-CON-002-RECYCLE-TWO-COMPETING-CONSUMERS-AND-LIVE-PRODUCER-REUSED
ok    TEST-REQ-CON-003-RECYCLE-OTHER-SHARD-PROGRESSES-WHILE-FIRST-GUARD-IS-HELD
ok    TEST-REQ-CON-004-WORKER-FACTORY-PREFLIGHT-AND-EMPTY-CURSOR-ROTATION
ok    TEST-REQ-CON-001-WORKER-CLAIM-BATCH-ACK-AND-IDLE-RELEASE
ok    TEST-REQ-CON-005-WORKER-QUANTUM-YIELD-RESCHEDULE-AND-MONOTONE-TOKENS
ok    TEST-REQ-CON-005-WORKER-BATCH-DEBT-BLOCKS-MORE-POP-FINISH-AND-TRANSFER
ok    TEST-REQ-AFF-004-WORKER-CURRENT-TOKEN-REQUIRED-AND-STALE-ACK-KEEPS-DEBT
ok    TEST-REQ-AFF-004-WORKER-BUFFER-RANGE-AND-PRIVATE-ALIAS-PREFLIGHT
ok    TEST-REQ-CON-005-WORKER-BEGIN-BUSY-RETAINS-CLAIMED-REFERENCE
ok    TEST-REQ-CON-005-WORKER-POP-BUSY-RETAINS-LEASE-BUFFER-AND-GENERATION
ok    TEST-REQ-CON-005-WORKER-END-BUSY-IS-FINISHING-AND-BLOCKS-NEW-POP
ok    TEST-REQ-CON-004-WORKER-SCANNED-HOME-AND-FULL-RECYCLE-RETAINED-ON-BUSY
ok    TEST-REQ-CON-005-WORKER-TWO-CONTEXTS-FULL-REFILL-PRESERVES-ALL-OBLIGATIONS
ok    TEST-REQ-CON-005-WORKER-EMPTY-OBSERVATION-AND-NEW-WAVE-AFTER-IDLE
ok    TEST-REQ-CON-002-WORKER-FOREIGN-THREAD-REFUSES-ALL-SIX-PHASES
ok    TEST-REQ-AFF-008-WORKER-LOCAL-GENERATION-LIMIT-CAN-CEDE-INTO-FRESH-CONTEXT
ok    TEST-REQ-CON-002-WORKER-CEDE-ADOPT-VALIDATES-HOME-AND-SINGLE-CALLER-OBLIGATION
ok    TEST-REQ-CON-001-WORKER-SEEDED-INDEPENDENT-OBLIGATIONS-PAYLOADS-AND-BATCH-DEBT
ok    TEST-REQ-AFF-004-WORKER-PRIVATE-SHAPES-AND-PENDING-COUNT-INVARIANTS
ok    TEST-REQ-AFF-004-WORKER-PRIVATE-INDEX-CORRUPTION-POISONS-BEFORE-ADOPT
ok    TEST-REQ-AFF-008-WORKER-BOUNDARY-EXPANSION-VALUES-ONCE-AND-ERROR-IDENTITY
ok    TEST-REQ-AFF-008-WORKER-STALE-NOT-READY-REFERENCE-CANNOT-STEAL-NEW-WAVE
ok    TEST-REQ-AFF-008-WORKER-GENERATION-OVERFLOW-PRECEDES-EMPTY-AND-YIELD-POP
  Worker: 4 thread riusati, 6 ondate, 36 payload CRC, contesti owner-only.
ok    TEST-REQ-CON-003-WORKER-REUSED-OWNER-CONTEXTS-LIVE-PRODUCERS-AND-INDEPENDENT-SHARDS
  Worker: 2 consumer owner riusati, 8 ondate, un solo obbligo per ondata.
ok    TEST-REQ-CON-002-WORKER-COMPETING-OWNER-CONTEXTS-CLAIM-ONE-OBLIGATION-PER-WAVE
89 test delle code writer superati.
ok    TEST-REQ-FOR-002-SEGMENT-HEADER-INDEPENDENT-ORACLE
ok    TEST-REQ-FOR-001-SEGMENT-HEADER-ALL-TRUNCATIONS-AND-BIT-FLIPS
ok    TEST-REQ-FOR-002-SEGMENT-HEADER-CRC-VALID-INVALID-FIELDS
ok    TEST-REQ-AFF-002-SEGMENT-HEADER-IDENTITY
ok    TEST-REQ-FOR-002-SEGMENT-HEADER-PREFLIGHT-PRESERVES-BUFFER
ok    TEST-REQ-FOR-002-LOG-HEADER-INDEPENDENT-ORACLE
ok    TEST-REQ-FOR-002-LOG-HEADER-DEFAULT-VERSION-IS-TWO
ok    TEST-REQ-FOR-001-LOG-HEADER-ALL-TRUNCATIONS
ok    TEST-REQ-FOR-001-LOG-HEADER-ALL-BIT-FLIPS
ok    TEST-REQ-FOR-002-LOG-HEADER-EVERY-RESERVED-BYTE
ok    TEST-REQ-FOR-002-LOG-HEADER-EVERY-IDENTITY-BYTE
ok    TEST-REQ-FOR-002-LOG-HEADER-CRC-VALID-WRONG-MAGIC
ok    TEST-REQ-FOR-002-LOG-HEADER-UNKNOWN-VERSION-WITH-VALID-CRC
ok    TEST-REQ-FOR-001-LOG-HEADER-CRC-BEFORE-UNKNOWN-VERSION
ok    TEST-REQ-FOR-002-LOG-HEADER-ENCODER-PREFLIGHT-PRESERVES-BUFFER
ok    TEST-REQ-FOR-002-LOG-HEADER-READER-PREFLIGHT
ok    TEST-REQ-FOR-002-COMPACTION-EMPTY-HEADERS
ok    TEST-REQ-CMP-009-COMPACTION-RESOLVED-RECORDS-AND-COUNTS
ok    TEST-REQ-FOR-002-COMPACTION-VERSION-FROM-FILE
ok    TEST-REQ-FOR-003-COMPACTION-EVERY-CONTENT-TRUNCATION
ok    TEST-REQ-FOR-001-COMPACTION-EVERY-BIT-CORRUPTION
ok    TEST-REQ-FOR-002-COMPACTION-AUTHORITATIVE-IDENTITIES
ok    TEST-REQ-FOR-002-COMPACTION-HEADER-FIELDS-AND-VERSION
ok    TEST-REQ-CMP-009-COMPACTION-REJECTS-WRITER-ORIGIN
ok    TEST-REQ-CMP-009-COMPACTION-REJECTS-PREPARED-RECORDS
ok    TEST-REQ-CMP-009-COMPACTION-REJECTS-CONTROL-RECORDS
ok    TEST-REQ-FOR-003-COMPACTION-CRC-VALID-INVALID-TYPE-AND-FLAGS
ok    TEST-REQ-FOR-003-COMPACTION-CRC-VALID-INCONSISTENT-LENGTHS
ok    TEST-REQ-FOR-001-COMPACTION-IGNORES-PHYSICAL-TAIL
ok    TEST-REQ-AFF-008-COMPACTION-EXACT-AND-EXHAUSTED-BUDGETS
ok    TEST-REQ-AFF-008-COMPACTION-INVALID-ARGUMENTS
ok    TEST-REQ-FOR-003-EDIT-ENCODING-LAYOUT
ok    TEST-REQ-FOR-003-EDIT-TRUNCATION-COUNTS-AND-LENGTHS
ok    TEST-REQ-AFF-008-EDIT-BUDGET-BOUNDARIES
ok    TEST-REQ-TXM-001-DECISION-ENCODING-LAYOUT
ok    TEST-REQ-TXM-001-DECISION-TRUNCATION-AND-BUDGETS
ok    TEST-REQ-FOR-003-CONTROL-RECORD-BOTH-VERSIONS
ok    TEST-REQ-FOR-003-CONTROL-RECORD-INTEGRITY-BEFORE-COUNTS
ok    TEST-REQ-AFF-008-ENCODER-PREFLIGHT-NO-PARTIAL-WRITE
ok    TEST-REQ-AFF-008-EDIT-CUMULATIVE-BUDGET-AND-CORRUPT-HUGE-COUNTS
ok    TEST-REQ-AFF-008-ENCODER-OVERFLOW-AND-UNUSED-SECTIONS
ok    TEST-REQ-FOR-003-DECISION-RECORD-ALL-TRUNCATIONS-AND-BIT-FLIPS
ok    TEST-REQ-AFF-008-BYTE-BUDGET-BEFORE-CRC-SCAN
ok    TEST-REQ-AFF-008-INTERNAL-RANGE-GUARDS
44 test dei metadati storage superati.
ok    TEST-REQ-AFF-001-SHORT-APPEND-AND-GROUP-FLUSH
ok    TEST-REQ-STO-003-SHORT-PREAD-POSITIONAL-NO-STATE-WRITE
ok    TEST-REQ-AFF-001-WRITE-ERRORS-NEVER-RETRY
ok    TEST-REQ-AFF-001-FLUSH-ERROR-PRESERVES-DURABLE-FRONTIER
ok    TEST-REQ-AFF-002-READ-ERRORS-NO-RETRY-NO-SHARED-MUTATION
ok    TEST-REQ-AFF-008-INVALID-PROGRESS-AND-EOF
ok    TEST-REQ-AFF-008-PREFLIGHT-BUDGET-AND-ZERO-LENGTH
ok    TEST-REQ-AFF-001-CLOSE-ONCE-EVEN-EINTR
ok    TEST-REQ-AFF-001-DIRECTORY-FLUSH-DISPATCH-AND-INVALID-RETURN
ok    TEST-REQ-STO-003-OPEN-PREFLIGHT-AND-ERRORS
ok    TEST-REQ-AFF-001-DIRECTORY-FAILURE-AND-EMPTY-FILE-FLUSH
ok    TEST-REQ-AFF-001-INVALID-CLOSE-RESULT-AND-CLOSED-READER
ok    TEST-REQ-AFF-004-INVALID-PRIVATE-DESCRIPTOR-BEFORE-SYSCALL
ok    TEST-REQ-STO-003-NATIVE-APPEND-FLUSH-AND-CHECKED-RECORD
ok    TEST-REQ-STO-003-NATIVE-NO-FOLLOW-FILE-KINDS-AND-CLOEXEC
ok    TEST-REQ-STO-003-CONCURRENT-PREAD-DISTINCT-BUFFERS
ok    TEST-REQ-FOR-003-NATIVE-TWO-SEALED-BATCHES-ONE-FLUSH
ok    TEST-REQ-AFF-004-NATIVE-ERRNO-AND-CLEANUP-PROVENANCE
18 test I/O superati.
ok    TEST-REQ-FOR-003-VALID-LOG-ORACLE-AND-DETERMINISM
ok    TEST-REQ-FOR-003-EMPTY-LOG-AND-EMPTY-BATCHES
ok    TEST-REQ-AFF-009-EVERY-LOG-TRUNCATION
ok    TEST-REQ-AFF-009-FRONTIER-BOUNDARY-AND-FAILED-BATCH-START
ok    TEST-REQ-AFF-009-DAMAGED-WITNESS-BATCH-REMAINS-EVIDENCE
ok    TEST-REQ-AFF-009-INVALID-WITNESSES-ARE-IGNORED
ok    TEST-REQ-AFF-009-CORRUPT-LENGTH-CANNOT-HIDE-WITNESS
ok    TEST-REQ-AFF-009-BROKEN-HEADER-DOES-NOT-END-SEARCH
ok    TEST-REQ-AFF-009-WITNESS-AT-EVERY-ALIGNMENT
ok    TEST-REQ-AFF-009-NESTED-SEAL-AT-LAST-SEARCH-POSITION
ok    TEST-REQ-AFF-008-LOG-AND-BATCH-BUDGETS
ok    TEST-REQ-AFF-008-BATCH-BUDGET-CANNOT-CLASSIFY-UNCHECKED-TAIL
ok    TEST-REQ-AFF-008-SEARCH-BUDGET-COUNTS-POSITIONS
ok    TEST-REQ-AFF-008-EOF-IS-EXPLICIT-AND-COMPLETE
ok    TEST-REQ-AFF-008-INVALID-CONFIGURATION-IS-NEVER-TAIL
ok    TEST-REQ-AFF-009-U64-OFFSETS-AND-OVERFLOW
13504 mutazioni bit prima del testimone durevole verificate.
ok    TEST-REQ-AFF-009-EVERY-BIT-BEFORE-DURABLE-WITNESS
6752 mutazioni bit nel lotto finale senza testimone verificate.
ok    TEST-REQ-AFF-017-EVERY-BIT-IN-FINAL-UNWITNESSED-BATCH
ok    TEST-REQ-AFF-009-OVERLAPPING-SEAL-AFTER-NONCOVERING-FRONTIER
ok    TEST-REQ-TXM-005-DECISION-TABLE-ORDERED-UNORDERED-ORACLE
ok    TEST-REQ-TXM-005-SEEDED-HISTORIES-AND-PERMUTED-DUPLICATES
ok    TEST-REQ-TXM-001-ZERO-MAXIMUM-U64-AND-SHARED-CSN
ok    TEST-REQ-TXM-005-TABLE-OWNS-PARTICIPANT-COPIES
ok    TEST-REQ-TXM-001-PARTICIPANT-EXACT-BYTES-AND-QUERY-RANGES
ok    TEST-REQ-TXM-005-CONFLICTING-CSN-SET-OR-COUNT
ok    TEST-REQ-TXM-005-DUPLICATE-PARTICIPANTS-WITHIN-RECORD
ok    TEST-REQ-TXM-005-EVERY-CUT-KEEPS-ONLY-SEALED-DECISIONS
ok    TEST-REQ-TXM-005-PRESUMED-ABORT-AFTER-COMPLETE-TAIL-SEARCH
ok    TEST-REQ-TXM-005-SCANS-LATER-CORRUPTION-BEFORE-PAYLOAD-OR-BUDGET
ok    TEST-REQ-FOR-003-SEALED-INVALID-DECISION-PAYLOAD-IS-NOT-TAIL
ok    TEST-REQ-AFF-008-EMPTY-DECISIONS-ZERO-AND-LARGE-BUDGETS
ok    TEST-REQ-AFF-008-PHYSICAL-DUPLICATE-RECORD-BUDGETS
ok    TEST-REQ-AFF-008-INVALID-DECISION-BUDGETS-EVEN-EMPTY
ok    TEST-REQ-AFF-008-DECISION-SCANNER-BUDGETS-PROPAGATE
ok    TEST-REQ-AFF-008-DECISION-EOF-AND-VERSION-ERRORS
ok    TEST-REQ-TXM-005-HIGH-FILE-OFFSET-AND-CONFLICT-PROVENANCE
ok    TEST-REQ-TXM-005-FIRST-PHYSICAL-DECISION-CONFLICT-ACROSS-TXID-GROUPS
ok    TEST-REQ-TXM-001-PARTICIPANT-EVERY-BYTE-AND-EVERY-BIT
ok    TEST-REQ-FOR-003-SEALED-TRAILING-DECISION-PAYLOAD
ok    TEST-REQ-FOR-003-SHORT-DECISION-FRAME-REQUIRES-COVERING-WITNESS
ok    TEST-REQ-TXM-005-UNSEALED-SEMANTIC-ERRORS-AND-COVERING-WITNESS
ok    TEST-REQ-AFF-008-DECISION-BUDGET-OFFSETS-BEFORE-COALESCENCE
ok    TEST-REQ-TXM-005-PUBLIC-DEFAULT-BUDGETS-AND-EXPLICIT-VERSION
ok    TEST-REQ-TXM-001-MAXIMUM-U16-PARTICIPANT-COUNT
ok    TEST-REQ-TXM-005-RADIX-PARTICIPANT-CARDINALITIES-AND-PATTERNS
ok    TEST-REQ-TXM-001-RADIX-PARTICIPANT-EVERY-BYTE-AND-BIT
ok    TEST-REQ-TXM-005-RADIX-DUPLICATE-PARTICIPANT-OFFSET
ok    TEST-REQ-TXM-005-RADIX-PARTICIPANT-SHAPE-BEFORE-SORT
ok    TEST-REQ-TXM-005-RADIX-ENTRY-CARDINALITIES-PATTERNS-AND-STABILITY
ok    TEST-REQ-AFF-008-RADIX-ENTRY-65536-BUCKET-COUNTS
ok    TEST-REQ-TXM-001-RADIX-ENTRY-EVERY-TXID-BIT
ok    TEST-REQ-TXM-005-RADIX-ENTRY-SHAPE-BEFORE-SORT
ok    TEST-REQ-TXM-005-CONCURRENT-IMMUTABLE-TABLE-QUERIES
ok    TEST-REQ-AFF-008-RADIX-PREFIX-INVALID-TOTAL
ok    TEST-REQ-AFF-008-RADIX-ENTRY-INVALID-OBJECT-BEFORE-SLOT-ACCESS
ok    TEST-REQ-AFF-008-RADIX-INVALID-DIGIT-BEFORE-ACCESS
ok    TEST-REQ-AFF-008-RADIX-SCATTER-INVALID-ARRAYS
ok    TEST-REQ-AFF-008-RADIX-INVALID-FINAL-CURSORS
ok    TEST-REQ-AFF-008-RADIX-SCATTER-INVALID-CURSORS
ok    TEST-REQ-TXM-005-PUBLIC-PARTICIPANT-SORT-THRESHOLD-BOUNDARIES
ok    TEST-REQ-TXM-005-PUBLIC-ENTRY-SORT-THRESHOLD-BOUNDARIES
ok    TEST-REQ-TXM-005-PUBLIC-RADIX-FIRST-PHYSICAL-CONFLICT-ACROSS-GROUPS
ok    TEST-REQ-AFF-017-MANIFEST-HISTORIES-V1-V2-AND-BATCH-LAYOUTS
ok    TEST-REQ-FOR-003-MANIFEST-SNAPSHOT-SIZES-AND-PERMUTED-SECTIONS
ok    TEST-REQ-AFF-018-MANIFEST-IDEMPOTENT-CLOSURES-REMOVALS-AND-OUTCOMES
ok    TEST-REQ-FOR-003-MANIFEST-CONFLICTING-OUTCOME-AND-CLOSED-PROOF
ok    TEST-REQ-AFF-018-MANIFEST-SECTION-OVERLAP-IS-INVALID
ok    TEST-REQ-AFF-018-MANIFEST-INVALID-TRANSITIONS-NEVER-REACTIVATE
ok    TEST-REQ-FOR-003-MANIFEST-SNAPSHOT-REQUIRED-AND-VALID
ok    TEST-REQ-AFF-017-MANIFEST-EVERY-CUT-KEEPS-WHOLE-SEALED-PREFIX
ok    TEST-REQ-AFF-017-MANIFEST-OWNS-CLOSURE-AND-OUTCOME-COPIES
ok    TEST-REQ-FOR-003-MANIFEST-U64-BOUNDARIES-AND-ID-EXHAUSTION
ok    TEST-REQ-FOR-003-MANIFEST-DIRECT-API-DEFAULTS-AND-REQUIRED-OPTIONS
ok    TEST-REQ-AFF-018-MANIFEST-RESERVED-OLD-IDS-AND-UNCHANGED-ACTIVE
ok    TEST-REQ-AFF-008-MANIFEST-PHYSICAL-DUPLICATE-BUDGETS
ok    TEST-REQ-AFF-008-MANIFEST-ZERO-EMPTY-SECTIONS-AND-INVALID-BUDGETS
ok    TEST-REQ-FOR-003-MANIFEST-SEMANTIC-CORRUPTION-IN-SEALED-PREFIX
ok    TEST-REQ-AFF-009-MANIFEST-WITNESS-PRECEDES-SEMANTIC-ERRORS-AND-BUDGETS
ok    TEST-REQ-AFF-017-MANIFEST-UNSEALED-INVALID-TRANSITION-IS-EXCLUDED
ok    TEST-REQ-AFF-008-MANIFEST-SCANNER-AND-EOF-CONTRACTS
ok    TEST-REQ-AFF-018-MANIFEST-HIGH-FILE-OFFSET-AND-ERROR-PROVENANCE
ok    TEST-REQ-AFF-017-MANIFEST-FOUR-INDEPENDENT-SERIES-IN-PARALLEL
ok    TEST-REQ-REC-001-INVENTORY-ADR-ACTION-TABLE
ok    TEST-REQ-REC-001-INVENTORY-ZERO-CLOSED-AND-REMOVED
ok    TEST-REQ-REC-002-INVENTORY-MISSING-LIVE-AND-HEALTH-PRIORITY
ok    TEST-REQ-REC-002-INVENTORY-BOTH-NAMES-ALWAYS-CONSERVATIVE
ok    TEST-REQ-REC-001-INVENTORY-EXHAUSTIVE-SMALL-MODEL-AND-INPUT-ORDERS
ok    TEST-REQ-AFF-008-INVENTORY-DUPLICATES-AND-INVALID-ENTRIES
ok    TEST-REQ-AFF-008-INVENTORY-PHYSICAL-AND-LIVE-BUDGETS
ok    TEST-REQ-AFF-008-INVENTORY-BUDGET-COUNTS-LIVE-NOT-OUTPUT-ROWS
ok    TEST-REQ-AFF-008-INVENTORY-INVALID-ARGUMENTS-AND-QUERY-RANGE
ok    TEST-REQ-REC-001-INVENTORY-UNSIGNED-U64-ORDER-AND-EXACT-IDENTITIES
ok    TEST-REQ-REC-001-INVENTORY-MAXIMUM-U64-ACTIVE
ok    TEST-REQ-AFF-017-INVENTORY-PLAN-OWNS-DATA-AFTER-INPUT-REUSE
ok    TEST-REQ-AFF-017-INVENTORY-FOUR-PRIVATE-SERIES-AND-SHARED-PLAN
95 test recovery superati.
ok    TEST-REQ-WAL-005-CODEC-V1-V2-AND-HIGH-U64
ok    TEST-REQ-WAL-005-PRESERVE-PREPARED-OUTCOME-DECISION-TXID
ok    TEST-REQ-WAL-005-EMPTY-AND-SEAL-EXACT-CAPACITY
ok    TEST-REQ-AFF-008-BUILDER-PREFLIGHT-AND-SEALED-IMMUTABILITY
ok    TEST-REQ-WAL-002-TWO-LOTS-ONE-FLUSH-AND-REUSE
ok    TEST-REQ-AFF-008-GROUP-BUDGET-IDENTITY-AND-ORDER
ok    TEST-REQ-AFF-008-FILE-BUDGET-BEFORE-ANY-WRITE
ok    TEST-REQ-WAL-005-OFFSET-AND-DURABLE-WITNESS-BEFORE-WRITE
ok    TEST-REQ-WAL-003-CONTROL-LOG-NEVER-ASYNC
ok    TEST-REQ-AFF-008-CANCEL-UNSENT-GROUP-RELEASES-CAPACITY
ok    TEST-REQ-AFF-001-WRITE-FAILURE-STOPS-LOG-AND-ALL-BATCHES
ok    TEST-REQ-AFF-001-FLUSH-FAILURE-NEVER-ADVANCES-DURABILITY
ok    TEST-REQ-WAL-005-CRASH-AT-EVERY-WRITTEN-BYTE-V1-V2
ok    TEST-REQ-AFF-001-PRIVATE-OWNERSHIP-VIOLATION-STOPS-BEFORE-FLUSH
ok    TEST-REQ-WAL-002-SECOND-GROUP-REJECTED-UNTIL-FLUSH
ok    TEST-REQ-WAL-002-CONCURRENT-GROUPS-AT-MOST-ONE-WRITE
ok    TEST-REQ-WAL-002-CONCURRENT-FLUSH-AT-MOST-ONE-SYSCALL
ok    TEST-REQ-WAL-002-NATIVE-GROUP-AND-DURABLE-WITNESS-V1-V2
ok    TEST-REQ-AFF-009-SUBSEQUENT-BATCH-WITNESS-DETECTS-OLD-CORRUPTION
ok    TEST-REQ-MVC-008-WAL-CSN-FREE-ASSOCIATION-REJECTIONS
ok    TEST-REQ-MVC-008-WAL-CSN-LIMB-BOUNDARIES-V1-V2
ok    TEST-REQ-WAL-005-WAL-CSN-PREPARED-AND-ORDINARY-STAMPS
ok    TEST-REQ-WAL-005-WAL-CSN-MANUAL-API-REMAINS-UNBOUND
ok    TEST-REQ-MVC-008-WAL-CSN-EMPTY-AND-CONTROL-CONTENT-BEFORE-ASSIGNMENT
ok    TEST-REQ-MVC-008-WAL-CSN-LOG-LAYOUT-BEFORE-ASSIGNMENT
ok    TEST-REQ-AFF-008-WAL-CSN-OFFSETS-BEFORE-ASSIGNMENT
ok    TEST-REQ-AFF-004-WAL-CSN-PRIVATE-SHAPE-AND-SEAL-BUDGET-BEFORE-ASSIGNMENT
ok    TEST-REQ-AFF-001-WAL-CSN-FAULTED-LOG-BEFORE-ASSIGNMENT
ok    TEST-REQ-AFF-008-WAL-CSN-FULL-BUSY-AND-EXHAUSTED-BEFORE-ASSIGNMENT
ok    TEST-REQ-MVC-008-WAL-CSN-REPEAT-SEAL-BEFORE-ASSIGNMENT
ok    TEST-REQ-WAL-006-WAL-CSN-FULL-WRITE-AND-PUBLICATION-LEVELS
ok    TEST-REQ-WAL-006-WAL-CSN-ASYNC-BEFORE-FLUSH-CANNOT-REUSE
ok    TEST-REQ-MVC-008-WAL-CSN-DURABLE-BEFORE-PUBLICATION-AND-REUSE
ok    TEST-REQ-MVC-008-WAL-CSN-HORIZON-GAP-ACROSS-INDEPENDENT-LOGS
ok    TEST-REQ-MVC-008-WAL-CSN-BUSY-PUBLICATION-KEEPS-TOKEN
ok    TEST-REQ-MVC-008-WAL-CSN-DOUBLE-RESOLVER-AND-OWNED-REUSE
ok    TEST-REQ-MVC-008-WAL-CSN-STALE-EVENT-AFTER-REUSE
ok    TEST-REQ-MVC-008-WAL-CSN-WRONG-REGISTRY-AND-TOKEN-IDENTITY
ok    TEST-REQ-MVC-008-WAL-CSN-NONLIVE-REGISTRY-TOKEN
ok    TEST-REQ-WAL-006-WAL-CSN-HEALTHY-ANNULMENT-ALWAYS-REFUSED
ok    TEST-REQ-AFF-001-WAL-CSN-PARTIAL-WRITE-FAULT-ANNULMENT
ok    TEST-REQ-AFF-001-WAL-CSN-FLUSH-FAULT-BUSY-ANNULMENT
ok    TEST-REQ-AFF-001-WAL-CSN-LATER-LOG-FAULT-REJECTS-OLD-PUBLICATION
ok    TEST-REQ-MVC-008-WAL-CSN-BOUND-LOG-IDENTITY-BEFORE-OWNERSHIP
ok    TEST-REQ-AFF-004-WAL-CSN-INCOMPLETE-ASSOCIATION-BEFORE-RESOLUTION
ok    TEST-REQ-AFF-008-WAL-CSN-FILE-BUDGET-AND-AVAILABILITY-BEFORE-ASSIGNMENT
ok    TEST-REQ-AFF-004-WAL-CSN-INVALID-RECORD-OFFSET-RETAINS-OBLIGATION
  WAL/CSN: 4 Serie x 500 cicli, 1306 busy, 435 full, H convergente.
ok    TEST-REQ-MVC-008-FOUR-SERIES-SHARED-CSN-WAL-LIFECYCLE
48 test WAL superati.
ok    TEST-REQ-AFF-008-SERIES-DEFAULT-AND-CAPACITY-BOUNDARIES
ok    TEST-REQ-AFF-008-SERIES-INVALID-CONFIGURATION-PRESERVES-WAL
ok    TEST-REQ-CON-001-SERIES-LEASE-BUSY-STALE-AND-SINGLE-RELEASE
ok    TEST-REQ-WAL-005-SERIES-ADOPTS-SEALED-BEFORE-IO-AND-CAPTURES-TOKEN
ok    TEST-REQ-WAL-005-SERIES-REFUSES-OPEN-UNBOUND-AND-POST-DISPATCH-LOTS
ok    TEST-REQ-AFF-004-SERIES-REGISTRY-AND-LOG-BINDING-BEFORE-ADOPTION
ok    TEST-REQ-WAL-005-SERIES-OFFSET-GAP-AND-DUPLICATE-PRESERVE-OBLIGATION
ok    TEST-REQ-MVC-008-SERIES-CSN-STRICT-ORDER-EVEN-AT-CONTIGUOUS-OFFSETS
ok    TEST-REQ-WAL-006-SERIES-PLANNED-ROOT-EQ-AND-NIL-ARE-DISTINCT-PRECONDITIONS
ok    TEST-REQ-AFF-008-SERIES-FULL-KEEPS-SEALED-TOKEN-FOR-LATER-ADOPTION
ok    TEST-REQ-WAL-006-SERIES-PUBLICATION-FIFO-UNRESOLVED-AND-RETURNED-H
ok    TEST-REQ-WAL-006-SERIES-GROUP-STRONG-COVERAGE-BEFORE-ROOT-CAS
ok    TEST-REQ-WAL-006-SERIES-ASYNC-SEPARATE-PUBLICATION-AND-RETIREMENT-CURSORS
ok    TEST-REQ-AFF-004-SERIES-IO-BEGIN-ONCE-AND-WRITTEN-IS-NOT-COMPLETION
ok    TEST-REQ-WAL-005-SERIES-RETIREMENT-FIFO-RESOLVED-DURABLE-UNOWNED
ok    TEST-REQ-AFF-004-SERIES-FREE-AND-STALE-PREALLOCATED-EVENT-AFTER-WRAP
ok    TEST-REQ-AFF-004-SERIES-FOREIGN-EVENT-SAME-GENERATION-AND-CSN
ok    TEST-REQ-AFF-004-SERIES-FALSE-EVENT-AND-INVALID-GENERATION-BEFORE-MUTATION
ok    TEST-REQ-MVC-008-SERIES-BUSY-AFTER-CAS-KEEPS-ROOT-ONCE-AND-CAPTURED-TOKEN
ok    TEST-REQ-MVC-008-SERIES-HIGH-CSN-CARRY-AND-DELAYED-GLOBAL-HORIZON
ok    TEST-REQ-AFF-001-SERIES-KNOWN-WRITE-AND-FLUSH-FAULT-DRAIN-AND-ANNUL
ok    TEST-REQ-AFF-001-SERIES-TERMINAL-FAULT-AND-SCOPE-ONLY-UPGRADES
ok    TEST-REQ-AFF-001-SERIES-ANNUL-REQUIRES-LOCAL-FAULT-AND-GLOBAL-QUIESCENCE
ok    TEST-REQ-MVC-008-SERIES-ANNUL-FIFO-BUSY-PRESERVES-CAPTURED-OBLIGATION
ok    TEST-REQ-AFF-001-SERIES-ARCHIVE-FAULT-REFUSES-AUTOMATIC-ANNUL
ok    TEST-REQ-AFF-004-SERIES-CAPTURED-TOKEN-NEVER-RECONSTRUCTED-FROM-MUTATED-LOT
ok    TEST-REQ-AFF-004-SERIES-REGISTRY-INVARIANT-AFTER-ROOT-CAS-FAULTS-ARCHIVE
ok    TEST-REQ-AFF-001-SERIES-UNEXPECTED-ROOT-CAS-AND-NONLOCAL-EXIT-FAULT-ARCHIVE
ok    TEST-REQ-AFF-008-SERIES-LEASE-AND-EVENT-GENERATIONS-EXHAUST-WITHOUT-WRAP
ok    TEST-REQ-WAL-006-SERIES-INVALID-LEVEL-AND-PUBLICATION-REPLAY-PRESERVE-STATE
ok    TEST-REQ-WAL-006-SERIES-REJECTED-DISPATCH-WITHDRAWS-WITHOUT-IO-AND-H-CONVERGES
ok    TEST-REQ-AFF-004-SERIES-WITHDRAW-REFUSES-HEALTHY-OWNED-WRITTEN-STALE-AND-DOUBLE
ok    TEST-REQ-AFF-004-SERIES-WAL-PREFLIGHT-INVARIANTS-FAULT-BEFORE-ADOPTION-OR-RELEASE
ok    TEST-REQ-AFF-004-SERIES-UNCERTAIN-GETTER-FAULTS-ARCHIVE-BEFORE-AND-AFTER-CAS
ok    TEST-REQ-AFF-008-SERIES-RING-INVALID-CAPACITY-BEFORE-INDEXING
ok    TEST-REQ-CON-002-SERIES-RING-CURSORS-FAIL-SEPARATELY
ok    TEST-REQ-CON-002-SERIES-RING-COUNTS-FAIL-SEPARATELY
ok    TEST-REQ-MVC-008-SERIES-CSN-AFTER-EXPLICIT-TRUTH-PAIRS
ok    TEST-REQ-CON-001-SERIES-FOREIGN-THREAD-LEASE-AND-RELEASE-REACQUIRE-TRANSFER
ok    TEST-REQ-CON-002-SERIES-CAS-EIGHT-CONTENDERS-ONE-OWNER
  Serie: 4 controller x 64 lotti, K=3, 6 busy, 16 full, H convergente.
ok    TEST-REQ-CON-004-SERIES-FOUR-CONTROLLERS-SHARED-BOUNDED-CSN
ok    TEST-REQ-CON-002-SERIES-IMMUTABLE-ROOT-PARALLEL-READER-AFTER-HANDOFF
ok    TEST-REQ-WAL-006-SERIES-IO-FINISH-JOINED-BEFORE-DRAIN-AND-ANNUL
ok    TEST-REQ-CON-004-SERIES-HELD-CSN-GUARD-PUBLISH-NEVER-WAITS
ok    TEST-REQ-CON-001-WORKER-SERIE-DOUBLE-LEASE-FIFO-ACK-AND-IDLE
ok    TEST-REQ-CON-005-WORKER-SERIE-QUANTUM-ROTATION-MONOTONE-TRACT-AND-BATCH
ok    TEST-REQ-CON-005-WORKER-SERIE-FIRST-LEASE-BUSY-DOES-NOT-TOUCH-SERIE
ok    TEST-REQ-CON-005-WORKER-SERIE-SECOND-LEASE-BUSY-CLOSES-WITHOUT-POP
ok    TEST-REQ-CON-005-WORKER-SERIE-SECOND-LEASE-BUSY-AND-END-BUSY-KEEP-OBLIGATION
ok    TEST-REQ-CON-005-WORKER-SERIE-RELEASES-SERIE-BEFORE-BUSY-WRITER-END
ok    TEST-REQ-AFF-004-WORKER-SERIE-BATCH-DEBT-AND-STALE-ACK-RETAIN-BOTH-LEASES
ok    TEST-REQ-AFF-004-WORKER-SERIE-TRACT-TOKEN-REFUSED-BEFORE-POP-ACK-OR-CLOSE
ok    TEST-REQ-AFF-004-WORKER-SERIE-TARGET-SPAN-AND-ALIAS-REFUSALS-BEFORE-POP
ok    TEST-REQ-AFF-004-WORKER-SERIE-STATIC-BINDING-REFUSES-OTHER-CLAIMED-WRITER
ok    TEST-REQ-AFF-008-WORKER-SERIE-LOCAL-GENERATION-EXHAUSTION-PRECEDES-WRITER-BEGIN
ok    TEST-REQ-AFF-008-WORKER-SERIE-CONTROLLER-GENERATION-LIMIT-REQUIRES-EXPLICIT-CLOSE
ok    TEST-REQ-CON-002-WORKER-SERIE-FOREIGN-OWNER-IN-IDLE-ACTIVE-BATCH-AND-CLOSING
ok    TEST-REQ-AFF-008-WORKER-SERIE-RELEASE-FAULT-RETAINS-TWO-LEASES-AND-ORIGINAL-CONDITION
ok    TEST-REQ-AFF-008-WORKER-SERIE-ERROR-BETWEEN-RELEASES-PRESERVES-CONDITION-AND-WRITER
ok    TEST-REQ-AFF-004-WORKER-SERIE-STALE-CONTROLLER-LEASE-NEVER-POISONS-NEW-OWNER
ok    TEST-REQ-AFF-004-WORKER-SERIE-OWNED-FAULT-THREE-INDEPENDENT-TRUTH-PAIRS
ok    TEST-REQ-AFF-008-WORKER-SERIE-BOUNDARY-ONCE-VALUES-AND-EXACT-CONDITION
ok    TEST-REQ-AFF-008-WORKER-SERIE-PRESERVES-EARLIER-WORKER-FAULT-ON-RAW-BEGIN
ok    TEST-REQ-AFF-008-WORKER-SERIE-ACQUIRE-BOUNDARY-UNKNOWN-REASONS-NEVER-REMAIN-RECOVERABLE
ok    TEST-REQ-AFF-008-WORKER-SERIE-RELEASE-BOUNDARY-UNKNOWN-REASONS-RETAIN-BOTH-LEASES
ok    TEST-REQ-AFF-008-WORKER-SERIE-LOWER-WORKER-FAULT-CANNOT-MATCH-BENIGN-OUTER-TOKEN-REASON
ok    TEST-REQ-AFF-008-WORKER-SERIE-ZERO-ACTIVE-GENERATION-FAULTS-ONLY-OWNED-CONTROLLER
ok    TEST-REQ-WAL-006-WORKER-SERIE-FAULTED-CONTROLLER-STILL-DRAINS-FINISHED-IO
ok    TEST-REQ-CON-002-WORKER-SERIE-TWO-WRITERS-ONE-CONTROLLER-HAVE-ONE-ACTIVE-LEASE
ok    TEST-REQ-CON-002-WORKER-SERIE-INDEPENDENT-CONTROLLERS-ACTIVE-CONCURRENTLY
70 test del controller Serie superati.
ok    TEST-REQ-AFF-003-SLOT-DEFTEST-EXPANSION-REGISTERS-WITHOUT-RUNNING
ok    TEST-REQ-LIM-001-SLOT-V2-FORMAT-LIMITS-MATCH-ADR-0048
ok    TEST-REQ-IDX-001-SLOT-DEFAULT-BANK-ZEROED-FIXED-U64-LAYOUT
ok    TEST-REQ-AFF-008-SLOT-MAXIMUM-CAPACITY-AND-LAST-INDEX
ok    TEST-REQ-AFF-008-SLOT-NEGATIVE-CAPACITY-CONFIGURATION
ok    TEST-REQ-AFF-008-SLOT-ZERO-CAPACITY-CONFIGURATION
ok    TEST-REQ-AFF-008-SLOT-OVER-CAPACITY-CONFIGURATION
ok    TEST-REQ-AFF-008-SLOT-NEGATIVE-BUDGET-CONFIGURATION
ok    TEST-REQ-AFF-008-SLOT-ZERO-BUDGET-CONFIGURATION
ok    TEST-REQ-AFF-008-SLOT-PAYLOAD-BUDGET-EXACT-AND-ONE-BYTE-SHORT
ok    TEST-REQ-AFF-008-SLOT-RANGE-REFUSED-BY-EVERY-INDEXED-API
ok    TEST-REQ-IDX-001-SLOT-CSN-FULL-U64-BEYOND-FIXNUM
ok    TEST-REQ-IDX-003-SLOT-REPUBLISH-REMOVE-AND-REUSE-ISOLATES-NEIGHBORS
ok    TEST-REQ-IDX-006-SLOT-REMOVAL-CLEARS-EVERY-RETAINED-WORD
ok    TEST-REQ-LIM-001-SLOT-KEY-LENGTH-BOUNDARIES-1-255-256-65535
ok    TEST-REQ-LIM-001-SLOT-ZERO-KEY-LENGTH-REFUSED
ok    TEST-REQ-LIM-001-SLOT-KEY-RESERVED-BITS-REFUSED
ok    TEST-REQ-IDX-001-SLOT-KEY-LIVE-FLAG-REQUIRED
ok    TEST-REQ-LIM-001-SLOT-KEY-ARENA-END-AT-U32-EXCLUSIVE-LIMIT
ok    TEST-REQ-LIM-001-SLOT-KEY-ARENA-OVERFLOW-BY-ONE-REFUSED
ok    TEST-REQ-LIM-001-SLOT-RECORD-RESERVED-BITS-REFUSED
ok    TEST-REQ-LIM-001-SLOT-MINIMUM-RECORD-HEADER-PLUS-KEY-ACCEPTED
ok    TEST-REQ-LIM-001-SLOT-RECORD-SHORTER-THAN-HEADER-PLUS-KEY-REFUSED
ok    TEST-REQ-LIM-001-SLOT-EXACT-DOCUMENT-AND-RECORD-MAXIMA-ACCEPTED
ok    TEST-REQ-LIM-003-SLOT-DOCUMENT-OVERFLOW-BELOW-RECORD-MAXIMUM-REFUSED
ok    TEST-REQ-LIM-001-SLOT-RECORD-MAXIMUM-PLUS-ONE-REFUSED
ok    TEST-REQ-LIM-001-SLOT-RECORD-END-EXACT-SEGMENT-LIMIT-ACCEPTED
ok    TEST-REQ-LIM-001-SLOT-RECORD-END-OVERFLOW-BY-ONE-REFUSED
ok    TEST-REQ-IDX-003-SLOT-ZERO-CSN-LIVE-PAYLOAD-REFUSED
ok    TEST-REQ-IDX-003-SLOT-PRIMARY-END-MUST-BE-ZERO
ok    TEST-REQ-IDX-003-SLOT-RETAINED-EXCLUSIVE-INTERVAL-FULL-U64
ok    TEST-REQ-IDX-003-SLOT-RETAINED-ZERO-EQUAL-AND-EARLIER-END-REFUSED
ok    TEST-REQ-IDX-003-SLOT-RETAINED-U64-MAX-START-HAS-NO-VALID-END
ok    TEST-REQ-IDX-003-SLOT-EMPTY-PREDICATE-CHECKS-ALL-FIVE-FIELDS
ok    TEST-REQ-IDX-003-SLOT-INTERNAL-VALIDATION-EMPTY-LIVE-AND-MALFORMED
ok    TEST-REQ-IDX-005-SLOT-FREEZE-IDEMPOTENT-READABLE-AND-ALL-WRITERS-REFUSED
ok    TEST-REQ-AFF-004-SLOT-INVALIDATION-IDEMPOTENT-TERMINAL-AND-PRESERVES-DATA
ok    TEST-REQ-AFF-004-SLOT-FAULT-AFTER-FREEZE-KEEPS-BOTH-TERMINAL-STATES
ok    TEST-REQ-CON-004-SLOT-ODD-RETRY-LIMIT-PRESERVES-OUTPUT-AND-SKIPS-TRANSIENT-VALIDATION
ok    TEST-REQ-AFF-004-SLOT-READER-CORRUPT-SEQUENCE-THRESHOLD-AND-U64-MAX
ok    TEST-REQ-AFF-004-SLOT-WRITER-ODD-AND-THRESHOLD-SEQUENCES-FAULT
ok    TEST-REQ-AFF-008-SLOT-INITIAL-CREDIT-AND-ONE-PER-MUTATION
ok    TEST-REQ-AFF-008-SLOT-LAST-CREDIT-CONSUMED-WITHOUT-WRAP
ok    TEST-REQ-AFF-008-SLOT-EXHAUSTED-LIVE-PUBLISH-REMOVE-AND-RELOCATE-REFUSED
ok    TEST-REQ-AFF-008-SLOT-EXHAUSTED-EMPTY-REMOVAL-IS-IDEMPOTENT
ok    TEST-REQ-AFF-008-SLOT-EXHAUSTED-RELOCATION-NOOPS-NEED-NO-CREDIT
ok    TEST-REQ-AFF-004-SLOT-STABLE-CORRUPT-FIELDS-FAULT-READER-BEFORE-COPY
ok    TEST-REQ-AFF-004-SLOT-PARTIAL-EMPTY-FAULTS-READER-AND-WRITER
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-PRIMARY-AND-RETAINED-CHANGES-ONLY-LOCATION
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-STALE-CSN-DOES-NOT-OVERWRITE
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-STALE-LOCATION-DOES-NOT-OVERWRITE
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-STALE-KEY-METADATA-DOES-NOT-OVERWRITE
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-STALE-RECORD-LENGTH-DOES-NOT-OVERWRITE
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-STALE-RETAINED-END-DOES-NOT-OVERWRITE
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-CSN-CHANGE-REFUSED
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-KEY-CHANGE-REFUSED
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-RECORD-LENGTH-CHANGE-REFUSED
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-RETAINED-END-CHANGE-REFUSED
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-INVALID-EXPECTED-AND-REPLACEMENT-REFUSED
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-EMPTY-IS-A-NOOP
ok    TEST-REQ-IDX-004-SLOT-RELOCATION-EQUAL-LOCATION-NEVER-CONSUMES-CREDIT
ok    TEST-REQ-IDX-003-SLOT-PRIMARY-WRITER-THREE-READERS-CORRELATED-U64-SNAPSHOTS
ok    TEST-REQ-IDX-003-SLOT-RETAINED-WRITER-THREE-READERS-CORRELATED-FIVE-WORD-SNAPSHOTS
ok    TEST-REQ-IDX-006-SLOT-RETAINED-CONCURRENT-REMOVE-REPUBLISH-PRESERVES-EMPTY-OUTPUT
64 test degli slot indice v2 superati.
ok    TEST-REQ-AFF-003-PRIMARY-HARNESS-AND-EMPTY-ROOT
ok    TEST-REQ-IDX-001-PRIMARY-BINARY-COLLISIONS-AND-SPAN
ok    TEST-REQ-IDX-001-PRIMARY-FULL-GROUP-WRAP-AND-DELETED-NOT-EMPTY
ok    TEST-REQ-IDX-006-PRIMARY-DELETE-IDEMPOTENCE-AND-REUSE-NEW-FINGERPRINT
ok    TEST-REQ-IDX-001-PRIMARY-UPSERT-CSN-INCREASING-AND-KEY-STABLE
ok    TEST-REQ-IDX-005-PRIMARY-PREFIX-REFUSALS-BEFORE-MUTATION
ok    TEST-REQ-IDX-005-PRIMARY-OWNER-REFUSALS-PRESERVE-BOTH-DOMAINS
ok    TEST-REQ-IDX-005-PRIMARY-FROZEN-FRAGMENT-READABLE-NEVER-WRITABLE
ok    TEST-REQ-IDX-005-PRIMARY-ARENA-GROWTH-BUDGET-AND-OFFSETS
ok    TEST-REQ-LIM-003-PRIMARY-KEY-65535-AND-INVALID-LENGTHS
ok    TEST-REQ-IDX-001-PRIMARY-U64-CSN-THROUGH-MAXIMUM
ok    TEST-REQ-IDX-003-PRIMARY-EIGHT-COLLISION-SAMPLES-ONE-BUDGET
ok    TEST-REQ-IDX-003-PRIMARY-COLLISIONS-AND-ODD-RETRIES-SHARE-EIGHT
ok    TEST-REQ-CON-004-PRIMARY-OUTPUT-PRESERVED-MISS-AND-CONTEXT-REFUSALS
ok    TEST-REQ-IDX-005-PRIMARY-LOAD-SLOT-CREDIT-AND-REVISION-PREFLIGHT
ok    TEST-REQ-IDX-005-PRIMARY-MANUAL-REBUILD-COMPACTS-AND-PUBLISHES-CURRENT-ROOT
ok    TEST-REQ-IDX-005-PRIMARY-MANUAL-SPLIT-ROUTES-MSB-PREFIXES
ok    TEST-REQ-IDX-005-PRIMARY-SHALLOW-SPLIT-NO-DOUBLING-AND-UNRELATED-MUTABLE
ok    TEST-REQ-IDX-007-PRIMARY-STALE-PLAN-AFTER-SOURCE-UPDATE-NO-FREEZE
ok    TEST-REQ-IDX-007-PRIMARY-STALE-PLAN-AFTER-CANDIDATE-UPDATE-AND-ARENA-GROWTH
ok    TEST-REQ-IDX-007-PRIMARY-TWO-PLANS-OLD-ROOT-AND-CONSUMED-PLAN-REFUSED
ok    TEST-REQ-IDX-007-PRIMARY-DIRECTORY-CANDIDATES-AND-EXACT-BUDGET
ok    TEST-REQ-IDX-004-PRIMARY-RELOCATION-MESSAGE-SURVIVES-REBUILD-NOT-NEW-VERSION
ok    TEST-REQ-IDX-007-PRIMARY-ROOT-CHANGES-HIT-MISS-AND-COMMON-BUDGET
ok    TEST-REQ-IDX-007-PRIMARY-FINAL-CONFIRMATION-EXHAUSTED-NO-RESTART
ok    TEST-REQ-IDX-003-PRIMARY-WRITER-UPDATES-THREE-READERS-NO-TORN-PAYLOAD
ok    TEST-REQ-IDX-007-PRIMARY-MANUAL-REBUILDS-AND-ARENA-GROWTH-WITH-READERS
ok    TEST-REQ-IDX-005-REBUILD-ORIGINAL-SLOTS-AND-COMPACTED-OFFSETS
ok    TEST-REQ-IDX-005-REBUILD-SPLIT-VERIFIED
ok    TEST-REQ-IDX-005-REBUILD-U64-MAX-KEY-AND-RESET-SEQUENCE
ok    TEST-REQ-IDX-005-REBUILD-DELETION-COMPACTS-LIVE-BYTES
ok    TEST-REQ-IDX-005-REBUILD-EMPTY-FRAGMENT
ok    TEST-REQ-IDX-005-REBUILD-EMPTY-SPLIT
ok    TEST-REQ-IDX-005-REBUILD-SPLIT-ONE-EMPTY-CHILD
ok    TEST-REQ-AFF-008-REBUILD-TRANSIENT-BUDGET
ok    TEST-REQ-AFF-008-REBUILD-DIRECTORY-BUDGET-BEFORE-CANDIDATES
ok    TEST-REQ-AFF-008-REBUILD-FRAGMENT-BUDGET-CONDITIONS
ok    TEST-REQ-AFF-008-REBUILD-INVALID-SHAPE-AND-BUDGET
ok    TEST-REQ-AFF-008-REBUILD-DEPTH-EXHAUSTED-ONLY-FOR-SPLIT
ok    TEST-REQ-IDX-005-REBUILD-WRONG-DIGEST-FINGERPRINT
ok    TEST-REQ-IDX-005-REBUILD-WRONG-DIGEST-LOOKUP-GROUP
ok    TEST-REQ-IDX-005-REBUILD-WRONG-DIGEST-SOURCE-PREFIX
ok    TEST-REQ-IDX-005-REBUILD-PLAN-STALE-AFTER-SOURCE-UPDATE
ok    TEST-REQ-IDX-005-REBUILD-SECOND-CONSTRUCTION-STALES-FIRST-PLAN
ok    TEST-REQ-AFF-008-REBUILD-REVISION-EXHAUSTION-BEFORE-CANDIDATES
ok    TEST-REQ-AFF-008-REBUILD-GENERATION-EXHAUSTION-BEFORE-CANDIDATES
ok    TEST-REQ-IDX-005-REBUILD-CORRUPTED-COPY-LOCATION
ok    TEST-REQ-IDX-005-REBUILD-COPY-COMPARISON
ok    TEST-REQ-IDX-005-REBUILD-DUPLICATE-SOURCE-KEY
ok    TEST-REQ-IDX-005-REBUILD-SOURCE-CONTROL-CORRUPTION
ok    TEST-REQ-IDX-005-REBUILD-SOURCE-BANK-CORRUPTION-PROPAGATES
ok    TEST-REQ-IDX-005-REBUILD-PROBE-BANK-CORRUPTION-BEFORE-SLOT-SCAN
ok    TEST-REQ-IDX-005-REBUILD-SOURCE-ARENA-AND-LIVE-COUNT-CORRUPTION
ok    TEST-REQ-IDX-005-REBUILD-COPY-LOOKUP-FALSE-IS-TERMINAL
ok    TEST-REQ-IDX-005-REBUILD-COLD-ABORT-PRESERVES-SOURCE
ok    TEST-REQ-IDX-005-HASH-MAP-PHYSICAL-SLOTS
ok    TEST-REQ-IDX-005-HASH-MAP-NONLIVE-SENTINELS-AND-EXACT-COUNTS
ok    TEST-REQ-IDX-005-HASH-MAP-OUTPUT-ARITY-EMPTY-AND-UNCONFIGURED
ok    TEST-REQ-IDX-005-HASH-MAP-SEED-CONSTRUCTOR-AND-IMMUTABILITY
ok    TEST-REQ-IDX-005-HASH-MAP-OUTPUT-TYPES-PREFLIGHT
ok    TEST-REQ-IDX-005-HASH-MAP-OUTPUT-LENGTHS-PREFLIGHT
ok    TEST-REQ-IDX-005-HASH-MAP-OUTPUT-ALIAS-PREFLIGHT
ok    TEST-REQ-IDX-005-HASH-MAP-INVALID-SEED-TYPES-PREFLIGHT
ok    TEST-REQ-IDX-005-HASH-MAP-SEED-MISMATCH
ok    TEST-REQ-IDX-005-HASH-MAP-STALE-SOURCE
ok    TEST-REQ-IDX-005-HASH-MAP-BUILDING-SOURCE
ok    TEST-REQ-IDX-005-HASH-MAP-FOREIGN-SOURCE
ok    TEST-REQ-IDX-005-HASH-MAP-CANONICAL-ROOT-AND-BANK-GUARDS
ok    TEST-REQ-IDX-005-HASH-MAP-CORRUPT-BANK-FAULTS-IMMEDIATELY
ok    TEST-REQ-IDX-005-HASH-MAP-CORRUPT-ARENA-AND-LIVE-COUNT
ok    TEST-REQ-IDX-005-HASH-MAP-MISSING-ROOT-FAULTS
ok    TEST-REQ-IDX-005-HASH-MAP-INTERNAL-DIGEST-FAULTS
ok    TEST-REQ-IDX-001-HASH-KERNEL-FAULT-PROPAGATES-OWNER
73 test dell'indice primario superati.
build e test: nessun avviso, tutti i controlli superati
sbcl --script tools/lint.lisp src
141 file, 0 violazioni
sbcl --script tools/lint.lisp --self-test
ok    bad.lisp: COD-02 COD-03 COD-12 COD-20 COD-22 COD-34 COD-43 COD-50
ok    good.lisp: nessuna violazione
ok    keyword-barrier.lisp: nessuna violazione
ok    qualified-reader.lisp: COD-34
sbcl --noinform --no-userinit --no-sysinit --script tools/snapshot-mutation.lisp --self-test
Snapshot: fixture processi conservate in /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/report.lisp
(:SOURCE-CONSISTENCY :STABLE :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tools/snapshot-mutation.lisp\" :MD5
   #A((32) BASE-CHAR . \"a7b8fcfc2283e1a5fbf23e82ce6184da\")))
 :PROCESS-FIXTURES
 #A((171) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/report.lisp\")
 :EXPECTED-SUITE
 (\"TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-BOUNDARIES\"
  \"TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-TYPED-RANGE-REFUSALS\"
  \"TEST-REQ-MVC-005-SNAPSHOT-EMPTY-ARCHIVE-CSN-ZERO\"
  \"TEST-REQ-MVC-005-SNAPSHOT-CANONICAL-OUT-OF-ORDER-ACTIVATION\"
  \"TEST-REQ-MVC-005-SNAPSHOT-CARRY-U32-AND-BOXED-CSN\"
  \"TEST-REQ-MVC-007-SNAPSHOT-MAXIMUM-CSN-IS-NOT-ABSENCE\"
  \"TEST-REQ-MVC-007-SNAPSHOT-SAME-CSN-DISTINCT-GENERATIONS\"
  \"TEST-REQ-MVC-003-SNAPSHOT-MULTIPIN-RETENTION-BOUNDARIES\"
  \"TEST-REQ-MVC-007-SNAPSHOT-CONSERVATIVE-THRESHOLD-UNTIL-RECALCULATION\"
  \"TEST-REQ-AFF-008-SNAPSHOT-CAPACITY-REFUSES-BEFORE-MUTATION\"
  \"TEST-REQ-MVC-007-SNAPSHOT-PINNED-CONTEXT-REFUSES-BEFORE-MUTATION\"
  \"TEST-REQ-AFF-008-SNAPSHOT-DEADLINE-OVERFLOW-AND-EXACT-U64-BOUNDARY\"
  \"TEST-REQ-AFF-008-SNAPSHOT-PRIVATE-FI-GENERATION-EXHAUSTION\"
  \"TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-READER-DEADLINE-BEFORE-EXACT-AFTER\"
  \"TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-ACTIVATION-EXPIRY-REMOVES-PIN\"
  \"TEST-REQ-MVC-004-SNAPSHOT-WAIT-DEADLINE-BEFORE-EXACT-AFTER\"
  \"TEST-REQ-MVC-004-SNAPSHOT-LIFETIME-INCLUDES-INITIAL-WAIT\"
  \"TEST-REQ-AFF-008-SNAPSHOT-TIMER-BUDGET-REFUSALS-AND-EMPTY-SWEEP\"
  \"TEST-REQ-AFF-008-SNAPSHOT-TIMER-CIRCULAR-FAIRNESS-AND-MIXED-DEADLINES\"
  \"TEST-REQ-MVC-004-SNAPSHOT-TIMER-DISTINGUISHES-WAIT-AND-AGE\"
  \"TEST-REQ-MVC-007-SNAPSHOT-TERMINATION-IDEMPOTENT-ACTIVE-AND-WAITING\"
  \"TEST-REQ-MVC-007-SNAPSHOT-STALE-GENERATION-AFTER-CONTEXT-REUSE\"
  \"TEST-REQ-MVC-007-SNAPSHOT-STALE-CONTEXT-AFTER-SLOT-REUSE\"
  \"TEST-REQ-MVC-005-SNAPSHOT-PRIVATE-BUFFER-RANGE-AND-UNBOUND-IDENTITY\"
  \"TEST-REQ-AFF-004-SNAPSHOT-TERMINAL-INVALIDATION-PRESERVES-PINS\"
  \"TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-READER-CSN-STATE-AND-RANGE\"
  \"TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-COUNTER-GUARDS\"
  \"TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-RECALCULATION-INVARIANTS\"
  \"TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE\"
  \"TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION\"
  \"TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON\"
  \"TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN\"
  \"TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITH-PIN\"
  \"TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP\"
  \"TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY\"
  \"TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT\"
  \"TEST-REQ-MVC-007-SNAPSHOT-FAULT-BEFORE-PUBLISH\"
  \"TEST-REQ-MVC-007-SNAPSHOT-FAULT-DURING-PUBLISH\"
  \"TEST-REQ-MVC-007-SNAPSHOT-FAULT-AFTER-PUBLISH\"
  \"TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY\"
  \"TEST-REQ-CON-004-SNAPSHOT-HELD-MUTEX-READER-AND-OTHER-ARCHIVE\"
  \"TEST-REQ-CON-004-SNAPSHOT-RECURSIVE-GUARD-AND-NIL-BODY\"
  \"TEST-REQ-CON-004-SNAPSHOT-READER-WITH-CSN-MUTEX-HELD\")
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tools/snapshot-mutation.lisp\" :MD5
   #A((32) BASE-CHAR . \"a7b8fcfc2283e1a5fbf23e82ce6184da\")))
 :SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATIONS :STATUS :OK :WORKER-ERRORS 0
 :BASELINE NIL :MUTANTS NIL :TARGETS
 ((:NAME \"omit-announcement\" :FILE \"src/mvcc/snapshots-register.lisp\" :TEST
   \"TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE\" :BEFORE
   \"(setf (aref words 1) (min previous announcement))\" :AFTER
   \"(setf (aref words 1) previous)\")
  (:NAME \"keep-busy-announcement\" :FILE \"src/mvcc/snapshots-register.lisp\"
   :TEST \"TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN\" :BEFORE
   \"(setf (aref words 1) previous)\" :AFTER
   \"(setf (aref words 1) (min previous announcement))\")
  (:NAME \"omit-h0-h1-guard\" :FILE \"src/mvcc/snapshots-register.lisp\" :TEST
   \"TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION\" :BEFORE
   \"(unless (<= announcement horizon csn)\" :AFTER \"(unless (<= horizon csn)\")
  (:NAME \"omit-h1-csn-guard\" :FILE \"src/mvcc/snapshots-register.lisp\" :TEST
   \"TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON\" :BEFORE
   \"(unless (<= announcement horizon csn)\" :AFTER
   \"(unless (<= announcement horizon)\")
  (:NAME \"ready-strictly-greater\" :FILE \"src/mvcc/snapshots-register.lisp\"
   :TEST \"TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY\"
   :BEFORE \"(ready (>= horizon csn))\" :AFTER \"(ready (> horizon csn))\")
  (:NAME \"omit-registration-fail-stop\" :FILE \"src/mvcc/snapshots-register.lisp\"
   :TEST \"TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT\" :BEFORE
   \"(values generation csn ready))))
      (unless complete (invalida-registro-snapshot registry)))))\"
   :AFTER \"(values generation csn ready))))
      (unless complete nil))))\")
  (:NAME \"omit-csn-fault-propagation\" :FILE \"src/mvcc/snapshots-csn.lisp\" :TEST
   \"TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY\" :BEFORE
   \"(invariant-violation (condition)
      (invalida-registro-snapshot registry)
      (error condition))))\"
   :AFTER \"(invariant-violation (condition)
      (error condition))))\")
  (:NAME \"publish-zero-identity\" :FILE \"src/mvcc/snapshots-register.lisp\" :TEST
   \"TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY\" :BEFORE
   \"(setf (aref word 0) generation)\" :AFTER \"(setf (aref word 0) 0)\")
  (:NAME \"retain-at-equal-threshold\" :FILE \"src/mvcc/snapshots-read.lisp\" :TEST
   \"TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY\" :BEFORE
   \"(< (soglia-snapshot registry) new-csn)\" :AFTER
   \"(<= (soglia-snapshot registry) new-csn)\")
  (:NAME \"swallow-other-resource\" :FILE \"src/mvcc/snapshots-csn.lisp\" :TEST
   \"TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP\" :BEFORE
   \"(unless (eq (error-reason condition) :csn-busy) (error condition))\" :AFTER
   \"(when (eq (error-reason condition) :csn-busy) (error condition))\"))
 :SELF-TEST
 (:STATUS :OK :UNIQUE-TARGETS 10 :READ-EVAL-DISABLED T
  :ONLY-NAMED-RUNTIME-DETECTION T)
 :LIMITS
 (:TEN-TARGETED-MUTANTS :WHOLE-MVCC-SUITE-BASELINE :NAMED-RUNTIME-TEST-KILL
  :MINIMAL-PRODUCT-COPY :VERIFIED-BASELINE-SNAPSHOT :PRIVATE-FASL
  :RAW-LOGS-AND-RUNNER-RETAINED :SIGNAL-TIMEOUT-COMPILATION-NOT-KILL
  :NO-C1-MCDC-OR-ENGINE-QUALIFICATION))
sbcl --noinform --no-userinit --no-sysinit --script tools/reader-mutation.lisp --self-test
Reader: fixture processi conservate in /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/report.lisp
(:SOURCE-CONSISTENCY :STABLE :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tools/reader-mutation.lisp\" :MD5
   #A((32) BASE-CHAR . \"33d0497fb4508ecdab4cb562bc9ccba6\")))
 :PROCESS-FIXTURES
 #A((169) BASE-CHAR
    . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/report.lisp\")
 :EXPECTED-SUITE
 (\"TEST-REQ-AFF-008-EBR-VALID-CAPACITIES-AND-INITIAL-STATE\"
  \"TEST-REQ-AFF-008-EBR-WORKER-CAPACITY-REFUSALS\"
  \"TEST-REQ-AFF-008-EBR-RETIREMENT-CAPACITY-REFUSALS\"
  \"TEST-REQ-CMP-005-EBR-CANONICAL-CONTEXT-AND-WORKER-RANGE\"
  \"TEST-REQ-CMP-005-EBR-ENTER-EXIT\"
  \"TEST-REQ-CMP-005-EBR-NESTED-ENTRY-PRESERVES-PIN\"
  \"TEST-REQ-CMP-005-EBR-INACTIVE-EXIT-REFUSED\"
  \"TEST-REQ-CMP-005-EBR-INDEPENDENT-READERS\"
  \"TEST-REQ-CMP-005-EBR-OWNER-NONLOCAL-CLEANUP\"
  \"TEST-REQ-CMP-007-EBR-RESERVATION-RESOURCE-AND-CREDITS\"
  \"TEST-REQ-CMP-007-EBR-NULL-RESOURCE-PRESERVES-STATE\"
  \"TEST-REQ-CMP-007-EBR-DUPLICATE-RESOURCE-PRESERVES-STATE\"
  \"TEST-REQ-AFF-008-EBR-FULL-CAPACITY-PRESERVES-STATE\"
  \"TEST-REQ-CMP-007-EBR-CANCEL-IS-IDEMPOTENT\"
  \"TEST-REQ-CMP-007-EBR-PUBLISH-ADVANCES-ONCE\"
  \"TEST-REQ-CMP-007-EBR-PUBLISHED-RETIREMENT-CANNOT-CANCEL\"
  \"TEST-REQ-CMP-007-EBR-INVALID-TICKET-STATE-OPERATIONS\"
  \"TEST-REQ-CMP-007-EBR-STRICT-RECLAIM-THRESHOLD\"
  \"TEST-REQ-CMP-007-EBR-TWO-OLD-READERS-BLOCK-RECLAIM\"
  \"TEST-REQ-CMP-007-EBR-NEW-READER-DOES-NOT-BLOCK-OLD-RETIREMENT\"
  \"TEST-REQ-CMP-007-EBR-THRESHOLD-IS-MONOTONE\"
  \"TEST-REQ-CMP-007-EBR-RESOURCE-UNTIL-COMPLETION\"
  \"TEST-REQ-CMP-007-EBR-COMPLETION-IS-IDEMPOTENT\"
  \"TEST-REQ-CMP-007-EBR-STALE-GENERATION-PRESERVES-REUSE\"
  \"TEST-REQ-CMP-007-EBR-ZERO-AND-WRONG-GENERATION-PRESERVE-STATE\"
  \"TEST-REQ-AFF-008-EBR-GENERATION-MAXIMUM-WITHOUT-WRAP\"
  \"TEST-REQ-AFF-008-EBR-EPOCH-CREDIT-BEFORE-PUBLICATION\"
  \"TEST-REQ-AFF-008-EBR-CANCEL-RESTORES-EPOCH-CREDIT\"
  \"TEST-REQ-AFF-004-EBR-METADATA-INCOHERENCE-FAULTS\"
  \"TEST-REQ-AFF-004-EBR-COUNTER-INCOHERENCE-FAULTS\"
  \"TEST-REQ-AFF-004-EBR-FUTURE-READER-FAULTS\"
  \"TEST-REQ-AFF-004-EBR-READER-CLEANUP-AFTER-FAULT\"
  \"TEST-REQ-CMP-007-EBR-CLAIM-IS-EXCLUSIVE\"
  \"TEST-REQ-CMP-005-EBR-READER-FINISHES-WITH-MAINTENANCE-MUTEX-HELD\"
  \"TEST-REQ-MVC-005-READ-CURRENT-BUFFER-UNTOUCHED\"
  \"TEST-REQ-MVC-005-READ-SNAPSHOT-CSN-ZERO-CARRY-BOXED\"
  \"TEST-REQ-MVC-004-READ-COMPLETION-KEEPS-SNAPSHOT\"
  \"TEST-REQ-MVC-004-READ-WAITING-REFUSAL-CLEANS-EPOCH\"
  \"TEST-REQ-MVC-004-READ-ENDED-BEGIN-CLEANS-EPOCH\"
  \"TEST-REQ-CON-004-READ-CURRENT-GENERATION-BEFORE-PIN\"
  \"TEST-REQ-CON-004-READ-SNAPSHOT-ZERO-GENERATION-BEFORE-PIN\"
  \"TEST-REQ-CON-004-READ-FOREIGN-SNAPSHOT-BEFORE-PIN\"
  \"TEST-REQ-CON-004-READ-ALREADY-ACTIVE-READER-REFUSAL\"
  \"TEST-REQ-CON-004-READ-NESTED-KEEPS-EXISTING-PIN\"
  \"TEST-REQ-MVC-005-READ-INACTIVE-BUFFER-REFUSAL\"
  \"TEST-REQ-MVC-005-READ-RESULT-RANGE-PRESERVES-BUFFER\"
  \"TEST-REQ-MVC-004-READ-FINAL-SNAPSHOT-CHECK\"
  \"TEST-REQ-CMP-007-READ-LOGICAL-EXPIRY-KEEPS-LIVE-EPOCH\"
  \"TEST-REQ-CON-004-READ-CLOCK-REGRESSION-RELEASES-PIN\"
  \"TEST-REQ-CMP-007-READ-ABANDON-RELEASES-PIN\"
  \"TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-GENERATION\"
  \"TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CSN\"
  \"TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-START\"
  \"TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CONFIRMED\"
  \"TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-SNAPSHOT\"
  \"TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-GENERATION\"
  \"TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-CSN\"
  \"TEST-REQ-AFF-004-READ-ACTIVE-SNAPSHOT-ZERO-GENERATION\"
  \"TEST-REQ-AFF-004-READ-ACTIVE-FOREIGN-BINDING\"
  \"TEST-REQ-AFF-004-READ-MISSING-EPOCH-FAULT\"
  \"TEST-REQ-AFF-004-READ-FAULTED-CONTEXT-STAYS-FAULTED\"
  \"TEST-REQ-AFF-004-READ-FINAL-CSN-CHANGED-FAULT\"
  \"TEST-REQ-CMP-007-READ-EXTERNAL-ERROR-THROW-CLEANUP\"
  \"TEST-REQ-CON-004-READ-TWO-WORKER-MIGRATION\")
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tools/reader-mutation.lisp\" :MD5
   #A((32) BASE-CHAR . \"33d0497fb4508ecdab4cb562bc9ccba6\")))
 :SCHEMA-VERSION 1 :KIND :READER-MUTATIONS :STATUS :OK :WORKER-ERRORS 0
 :BASELINE NIL :MUTANTS NIL :TARGETS
 ((:NAME \"reclaim-at-equal-threshold\" :FILE \"src/epochs/reclaim.lisp\" :TEST
   \"TEST-REQ-CMP-007-EBR-STRICT-RECLAIM-THRESHOLD\" :BEFORE
   \"(when (< epoch (aref (registro-epoche-words registry) +word-threshold+))\"
   :AFTER
   \"(when (<= epoch (aref (registro-epoche-words registry) +word-threshold+))\")
  (:NAME \"allow-old-retirement-generation\" :FILE \"src/epochs/core.lisp\" :TEST
   \"TEST-REQ-CMP-007-EBR-STALE-GENERATION-PRESERVES-REUSE\" :BEFORE
   \"(= expected-generation (aref (registro-epoche-generations registry) slot))\"
   :AFTER
   \"(<= expected-generation (aref (registro-epoche-generations registry) slot))\")
  (:NAME \"claim-stays-retired\" :FILE \"src/epochs/reclaim.lisp\" :TEST
   \"TEST-REQ-CMP-007-EBR-CLAIM-IS-EXCLUSIVE\" :BEFORE
   \"(setf (aref (registro-epoche-states registry) slot) +retirement-claimed+)\"
   :AFTER
   \"(setf (aref (registro-epoche-states registry) slot) +retirement-retired+)\")
  (:NAME \"omit-abandon-cleanup\" :FILE \"src/read/task.lisp\" :TEST
   \"TEST-REQ-CMP-007-READ-ABANDON-RELEASES-PIN\" :BEFORE
   \"((:entering :active :faulted) (libera-contesto-lettura context))\" :AFTER
   \"((:entering :active :faulted) nil)\")
  (:NAME \"omit-final-snapshot-check\" :FILE \"src/read/task.lisp\" :TEST
   \"TEST-REQ-MVC-004-READ-FINAL-SNAPSHOT-CHECK\" :BEFORE \"(when snapshot
           (verifica-snapshot-in-buffer snapshot (aref words +word-generation+)
                                        now words +word-confirmed-csn+)
           (unless (= (aref words +word-snapshot-csn+) (aref words +word-confirmed-csn+))
             (guasto-contesto-lettura context :read-snapshot-csn-changed)))\"
   :AFTER \"(when snapshot nil)\")
  (:NAME \"overwrite-current-buffer\" :FILE \"src/read/task.lisp\" :TEST
   \"TEST-REQ-MVC-005-READ-CURRENT-BUFFER-UNTOUCHED\" :BEFORE \"        t)
      nil))\"
   :AFTER \"        t)
      (progn (setf (aref destination index) 0) nil)))\")
  (:NAME \"restore-faulted-as-idle\" :FILE \"src/read/core.lisp\" :TEST
   \"TEST-REQ-AFF-004-READ-FAULTED-CONTEXT-STAYS-FAULTED\" :BEFORE
   \"(unless faulted (setf (contesto-lettura-state context) :idle))\" :AFTER
   \"(when (or faulted (eq (contesto-lettura-state context) :faulted))
      (setf (contesto-lettura-state context) :idle))\")
  (:NAME \"reverse-clock-regression\" :FILE \"src/read/task.lisp\" :TEST
   \"TEST-REQ-CON-004-READ-CLOCK-REGRESSION-RELEASES-PIN\" :BEFORE
   \"(when (< now (aref words +word-start-time+))\" :AFTER
   \"(when (> now (aref words +word-start-time+))\"))
 :SELF-TEST
 (:STATUS :OK :UNIQUE-TARGETS 8 :READ-EVAL-DISABLED T
  :ONLY-NAMED-RUNTIME-DETECTION T)
 :LIMITS
 (:EIGHT-TARGETED-MUTANTS :WHOLE-EPOCHS-THEN-READ-SUITE-BASELINE
  :NAMED-RUNTIME-TEST-KILL :SELECTED-TEST-MUTANT-RUN :MINIMAL-PRODUCT-COPY
  :VERIFIED-BASELINE-READER :PRIVATE-FASL :RAW-LOGS-AND-RUNNER-RETAINED
  :SIGNAL-TIMEOUT-COMPILATION-NOT-KILL :NO-C1-MCDC-OR-ENGINE-QUALIFICATION))
sbcl --script tools/check-trace.lisp
115 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori
sbcl --script tools/check-links.lisp .
295 file, 2415 link controllati, 0 rotti
sbcl --noinform --no-userinit --no-sysinit --script tools/check-evidence-storage.lisp
(:SCHEMA-VERSION 1 :KIND :EVIDENCE-STORAGE-TESTS :STATUS :OK :CHECKS 123 :CASES ((:NAME :PUBLIC-API :STATUS :OK :CHECKS 5) (:NAME :PLAIN-MARKER-BUDGET :STATUS :OK :CHECKS 2) (:NAME :TINY-EXPANDED-BUDGET :STATUS :OK :CHECKS 3) (:NAME :PLAIN-AND-COMPRESSED-EQUIVALENT :STATUS :OK :CHECKS 9) (:NAME :PLAIN-ORIGINAL-BYTES :STATUS :OK :CHECKS 7) (:NAME :COMPRESSED-ORIGINAL-BYTES :STATUS :OK :CHECKS 7) (:NAME :COMPRESSED-CALLBACK-ERROR-CLEANUP :STATUS :OK :CHECKS 7) (:NAME :CALLBACK-PRESERVES-INPUT-FILES :STATUS :OK :CHECKS 3) (:NAME :FOREIGN-PACKAGE-FIXTURE :STATUS :OK :CHECKS 1) (:NAME :LEGACY-PLAIN-BYTE-CALLBACK :STATUS :OK :CHECKS 7) (:NAME :LEGACY-COMPRESSED-BYTE-CALLBACK :STATUS :OK :CHECKS 7) (:NAME :LEGACY-CALLBACK-ERROR-CLEANUP :STATUS :OK :CHECKS 7) (:NAME :MISSING-PAYLOAD-FIELD :STATUS :OK :CHECKS 2) (:NAME :MISSING-PAYLOAD-FILE :STATUS :OK :CHECKS 2) (:NAME :PARENT-PATH-ESCAPE :STATUS :OK :CHECKS 2) (:NAME :BACKSLASH-PATH-ESCAPE :STATUS :OK :CHECKS 2) (:NAME :ABSOLUTE-PATH-ESCAPE :STATUS :OK :CHECKS 2) (:NAME :SYMLINK-FIXTURE :STATUS :OK :CHECKS 1) (:NAME :SYMLINK-PATH-ESCAPE :STATUS :OK :CHECKS 2) (:NAME :UNCOMPRESSED-SHA256 :STATUS :OK :CHECKS 2) (:NAME :COMPRESSED-SHA256 :STATUS :OK :CHECKS 2) (:NAME :UNCOMPRESSED-BYTES-SHORT :STATUS :OK :CHECKS 2) (:NAME :UNCOMPRESSED-BYTES-LONG :STATUS :OK :CHECKS 2) (:NAME :COMPRESSED-BYTES-SHORT :STATUS :OK :CHECKS 2) (:NAME :COMPRESSED-BYTES-LONG :STATUS :OK :CHECKS 2) (:NAME :TAMPERED-COMPRESSED-BYTES :STATUS :OK :CHECKS 2) (:NAME :TAMPERED-ORIGINAL-BYTES :STATUS :OK :CHECKS 2) (:NAME :TRUNCATED-GZIP :STATUS :OK :CHECKS 2) (:NAME :PLAIN-MULTIPLE-FORMS :STATUS :OK :CHECKS 2) (:NAME :COMPRESSED-MULTIPLE-FORMS :STATUS :OK :CHECKS 2) (:NAME :PLAIN-READ-EVAL-LEADING :STATUS :OK :CHECKS 3) (:NAME :COMPRESSED-READ-EVAL-LEADING :STATUS :OK :CHECKS 3) (:NAME :PLAIN-READ-EVAL-TRAILING :STATUS :OK :CHECKS 3) (:NAME :COMPRESSED-READ-EVAL-TRAILING :STATUS :OK :CHECKS 3) (:NAME :NESTED-DESCRIPTOR :STATUS :OK :CHECKS 2) (:NAME :RECURSIVE-DESCRIPTOR-CHAIN :STATUS :OK :CHECKS 2) (:NAME :EXPANDED-BUDGET-TOO-SMALL :STATUS :OK :CHECKS 2) (:NAME :EXPANDED-BUDGET-UNDERDECLARED :STATUS :OK :CHECKS 2) (:NAME :CALLBACK-EXPANDED-BUDGET-TOO-SMALL :STATUS :OK :CHECKS 2) (:NAME :FIXTURE-CLEANUP :STATUS :OK :CHECKS 1)))
sbcl --noinform --no-userinit --no-sysinit --script tools/check-evidence-publication.lisp
(:SCHEMA-VERSION 1 :KIND :EVIDENCE-PUBLICATION-TESTS :STATUS :OK :CHECKS 2
 :CASES
 ((:FIXTURE \"fuori-catalogo.lisp\" :BYTES 1048577 :STATUS :OK
   :OBSERVED-EXIT-CODE 1 :STDOUT \"\" :STDERR
   \"Unhandled SIMPLE-ERROR in thread #<SB-THREAD:THREAD tid=259 \\\"main thread\\\" RUNNING
                                    {80086A04B3}>:
  Artefatto /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/results/.budget-test-34865/fuori-catalogo.lisp: 1048577 byte, limite 1048576. Eseguire make compact-evidence.

Backtrace for: #<SB-THREAD:THREAD tid=259 \\\"main thread\\\" RUNNING {80086A04B3}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \\\"Artefatto ~A: ~D byte, limite ~D. Eseguire make compact-evidence.\\\" {8006B66393}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK *INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \\\"Artefatto ~A: ~D byte, limite ~D. Eseguire make compact-evidence.\\\" {8006B66393}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \\\"Artefatto ~A: ~D byte, limite ~D. Eseguire make compact-evidence.\\\" {8006B66393}>)
3: (ERROR \\\"Artefatto ~A: ~D byte, limite ~D. Eseguire make compact-evidence.\\\" #P\\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/results/.budget-test-34865/fuori-catalogo.lisp\\\" 1048577 1048576)
4: ((LABELS WALK :IN VERIFICA-DIMENSIONI) #P\\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/results/.budget-test-34865/\\\")
5: ((LABELS WALK :IN VERIFICA-DIMENSIONI) #P\\\"spikes/results/\\\")
6: (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\")
7: ((LAMBDA NIL :IN \\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/check-evidence.lisp\\\"))
8: (UIOP/FILESYSTEM:CALL-WITH-CURRENT-DIRECTORY #P\\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../\\\" #<FUNCTION (LAMBDA NIL :IN \\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/check-evidence.lisp\\\") {800536561B}>)
9: (SB-INT:SIMPLE-EVAL-IN-LEXENV (UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY ((MERGE-PATHNAMES \\\"../\\\" (UIOP/PATHNAME:PATHNAME-DIRECTORY-PATHNAME *LOAD-TRUENAME*))) (LET ((CATALOGHI 0) (RECORD 0)) (MULTIPLE-VALUE-BIND (FILES BYTES) (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\") (DOLIST (PATH #) (LET* # # # #)) (UNLESS (PLUSP CATALOGHI) (ERROR # :PATH \\\"Nessun catalogo.\\\")) (WRITE (LIST :STATUS :OK :CATALOGS CATALOGHI :ARTIFACT-REFERENCES RECORD :STORED-FILES FILES :STORED-BYTES BYTES :LIMITS ...)) (TERPRI)))) #<NULL-LEXENV>)
10: (EVAL-TLF (UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY ((MERGE-PATHNAMES \\\"../\\\" (UIOP/PATHNAME:PATHNAME-DIRECTORY-PATHNAME *LOAD-TRUENAME*))) (LET ((CATALOGHI 0) (RECORD 0)) (MULTIPLE-VALUE-BIND (FILES BYTES) (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\") (DOLIST (PATH #) (LET* # # # #)) (UNLESS (PLUSP CATALOGHI) (ERROR # :PATH \\\"Nessun catalogo.\\\")) (WRITE (LIST :STATUS :OK :CATALOGS CATALOGHI :ARTIFACT-REFERENCES RECORD :STORED-FILES FILES :STORED-BYTES BYTES :LIMITS ...)) (TERPRI)))) 7 NIL)
11: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY ((MERGE-PATHNAMES \\\"../\\\" (UIOP/PATHNAME:PATHNAME-DIRECTORY-PATHNAME *LOAD-TRUENAME*))) (LET ((CATALOGHI 0) (RECORD 0)) (MULTIPLE-VALUE-BIND (FILES BYTES) (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\") (DOLIST (PATH #) (LET* # # # #)) (UNLESS (PLUSP CATALOGHI) (ERROR # :PATH \\\"Nessun catalogo.\\\")) (WRITE (LIST :STATUS :OK :CATALOGS CATALOGHI :ARTIFACT-REFERENCES RECORD :STORED-FILES FILES :STORED-BYTES BYTES :LIMITS ...)) (TERPRI)))) 7)
12: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY ((MERGE-PATHNAMES \\\"../\\\" (UIOP/PATHNAME:PATHNAME-DIRECTORY-PATHNAME *LOAD-TRUENAME*))) (LET ((CATALOGHI 0) (RECORD 0)) (MULTIPLE-VALUE-BIND (FILES BYTES) (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\") (DOLIST (PATH #) (LET* # # # #)) (UNLESS (PLUSP CATALOGHI) (ERROR # :PATH \\\"Nessun catalogo.\\\")) (WRITE (LIST :STATUS :OK :CATALOGS CATALOGHI :ARTIFACT-REFERENCES RECORD :STORED-FILES FILES :STORED-BYTES BYTES :LIMITS ...)) (TERPRI)))) :CURRENT-INDEX 7)
13: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {1073F0F1B}> #<SB-C::SOURCE-INFO {8008680423}> SB-C::INPUT-ERROR-IN-LOAD)
14: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> :VERBOSE NIL :PRINT NIL :CONTEXT \\\"loading\\\")
15: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> NIL)
16: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1073F09EB}> #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> NIL #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}>)
17: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> NIL)
18: (LOAD #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
19: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}>)
20: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
21: ((FLET \\\"WITHOUT-INTERRUPTS-BODY-\\\" :IN SB-IMPL::PROCESS-SCRIPT))
22: (SB-IMPL::PROCESS-SCRIPT \\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\")
23: (SB-IMPL::TOPLEVEL-INIT)
24: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
25: ((FLET \\\"WITHOUT-INTERRUPTS-BODY-3\\\" :IN SB-IMPL::START-LISP))
26: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
\")
  (:FIXTURE \"fuori-catalogo.gz\" :BYTES 8388609 :STATUS :OK :OBSERVED-EXIT-CODE
   1 :STDOUT \"\" :STDERR
   \"Unhandled SIMPLE-ERROR in thread #<SB-THREAD:THREAD tid=259 \\\"main thread\\\" RUNNING
                                    {80086A04B3}>:
  Artefatto /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/results/.budget-test-34865/fuori-catalogo.gz: 8388609 byte, limite 8388608. Eseguire make compact-evidence.

Backtrace for: #<SB-THREAD:THREAD tid=259 \\\"main thread\\\" RUNNING {80086A04B3}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \\\"Artefatto ~A: ~D byte, limite ~D. Eseguire make compact-evidence.\\\" {8006B66393}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK *INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \\\"Artefatto ~A: ~D byte, limite ~D. Eseguire make compact-evidence.\\\" {8006B66393}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \\\"Artefatto ~A: ~D byte, limite ~D. Eseguire make compact-evidence.\\\" {8006B66393}>)
3: (ERROR \\\"Artefatto ~A: ~D byte, limite ~D. Eseguire make compact-evidence.\\\" #P\\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/results/.budget-test-34865/fuori-catalogo.gz\\\" 8388609 8388608)
4: ((LABELS WALK :IN VERIFICA-DIMENSIONI) #P\\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/results/.budget-test-34865/\\\")
5: ((LABELS WALK :IN VERIFICA-DIMENSIONI) #P\\\"spikes/results/\\\")
6: (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\")
7: ((LAMBDA NIL :IN \\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/check-evidence.lisp\\\"))
8: (UIOP/FILESYSTEM:CALL-WITH-CURRENT-DIRECTORY #P\\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../\\\" #<FUNCTION (LAMBDA NIL :IN \\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/check-evidence.lisp\\\") {800536561B}>)
9: (SB-INT:SIMPLE-EVAL-IN-LEXENV (UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY ((MERGE-PATHNAMES \\\"../\\\" (UIOP/PATHNAME:PATHNAME-DIRECTORY-PATHNAME *LOAD-TRUENAME*))) (LET ((CATALOGHI 0) (RECORD 0)) (MULTIPLE-VALUE-BIND (FILES BYTES) (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\") (DOLIST (PATH #) (LET* # # # #)) (UNLESS (PLUSP CATALOGHI) (ERROR # :PATH \\\"Nessun catalogo.\\\")) (WRITE (LIST :STATUS :OK :CATALOGS CATALOGHI :ARTIFACT-REFERENCES RECORD :STORED-FILES FILES :STORED-BYTES BYTES :LIMITS ...)) (TERPRI)))) #<NULL-LEXENV>)
10: (EVAL-TLF (UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY ((MERGE-PATHNAMES \\\"../\\\" (UIOP/PATHNAME:PATHNAME-DIRECTORY-PATHNAME *LOAD-TRUENAME*))) (LET ((CATALOGHI 0) (RECORD 0)) (MULTIPLE-VALUE-BIND (FILES BYTES) (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\") (DOLIST (PATH #) (LET* # # # #)) (UNLESS (PLUSP CATALOGHI) (ERROR # :PATH \\\"Nessun catalogo.\\\")) (WRITE (LIST :STATUS :OK :CATALOGS CATALOGHI :ARTIFACT-REFERENCES RECORD :STORED-FILES FILES :STORED-BYTES BYTES :LIMITS ...)) (TERPRI)))) 7 NIL)
11: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY ((MERGE-PATHNAMES \\\"../\\\" (UIOP/PATHNAME:PATHNAME-DIRECTORY-PATHNAME *LOAD-TRUENAME*))) (LET ((CATALOGHI 0) (RECORD 0)) (MULTIPLE-VALUE-BIND (FILES BYTES) (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\") (DOLIST (PATH #) (LET* # # # #)) (UNLESS (PLUSP CATALOGHI) (ERROR # :PATH \\\"Nessun catalogo.\\\")) (WRITE (LIST :STATUS :OK :CATALOGS CATALOGHI :ARTIFACT-REFERENCES RECORD :STORED-FILES FILES :STORED-BYTES BYTES :LIMITS ...)) (TERPRI)))) 7)
12: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY ((MERGE-PATHNAMES \\\"../\\\" (UIOP/PATHNAME:PATHNAME-DIRECTORY-PATHNAME *LOAD-TRUENAME*))) (LET ((CATALOGHI 0) (RECORD 0)) (MULTIPLE-VALUE-BIND (FILES BYTES) (VERIFICA-DIMENSIONI #P\\\"spikes/results/\\\") (DOLIST (PATH #) (LET* # # # #)) (UNLESS (PLUSP CATALOGHI) (ERROR # :PATH \\\"Nessun catalogo.\\\")) (WRITE (LIST :STATUS :OK :CATALOGS CATALOGHI :ARTIFACT-REFERENCES RECORD :STORED-FILES FILES :STORED-BYTES BYTES :LIMITS ...)) (TERPRI)))) :CURRENT-INDEX 7)
13: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {105260F1B}> #<SB-C::SOURCE-INFO {8008680423}> SB-C::INPUT-ERROR-IN-LOAD)
14: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> :VERBOSE NIL :PRINT NIL :CONTEXT \\\"loading\\\")
15: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> NIL)
16: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1052609EB}> #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> NIL #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}>)
17: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> NIL)
18: (LOAD #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
19: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \\\"file /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\" {8008680043}>)
20: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
21: ((FLET \\\"WITHOUT-INTERRUPTS-BODY-\\\" :IN SB-IMPL::PROCESS-SCRIPT))
22: (SB-IMPL::PROCESS-SCRIPT \\\"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/../tools/check-evidence.lisp\\\")
23: (SB-IMPL::TOPLEVEL-INIT)
24: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
25: ((FLET \\\"WITHOUT-INTERRUPTS-BODY-3\\\" :IN SB-IMPL::START-LISP))
26: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
\")))
sbcl --noinform --no-userinit --no-sysinit --script tools/check-evidence-normalize.lisp
(:SCHEMA-VERSION 1 :KIND :NORMALIZER-COMPRESSION-TESTS :STATUS :OK :CHECKS 6
 :CASES
 ((:COMMAND
   (\"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\" \"--noinform\"
    \"--no-userinit\" \"--no-sysinit\" \"--script\"
    \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/normalize-spike-report.lisp\"
    \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/normalize-evidence-GSU5BH/source.lisp\"
    \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/normalize-evidence-GSU5BH/normalized-0.lisp\")
   :STDOUT \"\" :STDERR \"\" :EXIT-CODE 0 :RESULT
   (:SCHEMA-VERSION 1 :KIND :LEGACY-IMPORT :SOURCE-REPORT
    \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/normalize-evidence-GSU5BH/source.lisp\"
    :ENVIRONMENT (:CPU \"fixture\") :MODE \"--check\" :METADATA-POLICY
    :PRESERVED-WITHOUT-INFERRED-FIELDS :STATUS :IMPORTED :RUNS
    ((:STATUS :PASS :RESULT (:STATUS :PASS :N 1) :ID \"SPK-fixture\" :STDOUT
      \"(:status :pass :n 1)\"))))
  (:COMMAND
   (\"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\" \"--noinform\"
    \"--no-userinit\" \"--no-sysinit\" \"--script\"
    \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/normalize-spike-report.lisp\"
    \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/normalize-evidence-GSU5BH/compressed.lisp\"
    \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/normalize-evidence-GSU5BH/normalized-1.lisp\")
   :STDOUT \"\" :STDERR \"\" :EXIT-CODE 0 :RESULT
   (:SCHEMA-VERSION 1 :KIND :LEGACY-IMPORT :SOURCE-REPORT
    \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/normalize-evidence-GSU5BH/compressed.lisp\"
    :ENVIRONMENT (:CPU \"fixture\") :MODE \"--check\" :METADATA-POLICY
    :PRESERVED-WITHOUT-INFERRED-FIELDS :STATUS :IMPORTED :RUNS
    ((:STATUS :PASS :RESULT (:STATUS :PASS :N 1) :ID \"SPK-fixture\" :STDOUT
      \"(:status :pass :n 1)\"))))))
sbcl --dynamic-space-size 2048 --noinform --no-userinit --no-sysinit --script tools/check-evidence.lisp
(:STATUS :OK :CATALOGS 61 :ARTIFACT-REFERENCES 2099 :STORED-FILES 7864
 :STORED-BYTES 287593697 :LIMITS
 (:STRUCTURE-PRESENCE-SIZE-AND-COMPRESSED-INTEGRITY
  :NO-RESULT-REINTERPRETATION))
sbcl --noinform --no-userinit --script tools/run-spikes.lisp --check
10 spike completati; risultati: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710392-check-37003-0/
")
  (:PATH #A((45) BASE-CHAR . "spikes/out/worker-series-fullcheck-stderr.txt") :BYTES 352065 :SHA256
   "48e3f9e5a698ab57b9f66374da4615ef219e76679214bc86f9e3e22b3c06c876" :GIT-BLOB
   "4f2a3d9b6fa216cc3d4d7c554cd48ab4c71aa251" :TEXT "
; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/arithmetic.lisp
; in: DEFUN READ64
;     (DEFUN ARCDOCDB.HASH64::READ64 (ARCDOCDB.HASH64::BUFFER POSITION)
;       \"Pre: otto byte nello span verificato. Post: parola LE nativa nel codice inline.
;   Non restituita attraverso il confine pubblico; nessuna modifica del buffer.\"
;       (LOGIOR (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER POSITION)
;               (ASH
;                (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER (+ POSITION 4))
;                32)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::READ64
;         (ARCDOCDB.HASH64::BUFFER POSITION)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: otto byte nello span verificato. Post: parola LE nativa nel codice inline.
; Non restituita attraverso il confine pubblico; nessuna modifica del buffer.\"
;       (BLOCK ARCDOCDB.HASH64::READ64
;         (LOGIOR (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER POSITION)
;                 (ASH (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER #) 32))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN ROTATE64
;     (DEFUN ARCDOCDB.HASH64::ROTATE64 (ARCDOCDB.HASH64::VALUE COUNT)
;       \"Pre: u64 e rotazione tra 1 e 63. Post: rotazione circolare modulo 2^64.
;   Helper inline; i chiamanti fissano COUNT a una costante dell'algoritmo.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (LOGIOR (ASH ARCDOCDB.HASH64::VALUE COUNT)
;                       (ASH ARCDOCDB.HASH64::VALUE (- COUNT 64)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::ROTATE64
;         (ARCDOCDB.HASH64::VALUE COUNT)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: u64 e rotazione tra 1 e 63. Post: rotazione circolare modulo 2^64.
; Helper inline; i chiamanti fissano COUNT a una costante dell'algoritmo.\"
;       (BLOCK ARCDOCDB.HASH64::ROTATE64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (LOGIOR (ASH ARCDOCDB.HASH64::VALUE COUNT)
;                         (ASH ARCDOCDB.HASH64::VALUE #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN ROUND64
;     (DEFUN ARCDOCDB.HASH64::ROUND64
;            (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       \"Pre: due u64. Post: round XXH64 modulo 2^64, puro e inline.
;   Overflow modulari intenzionali; nessun valore u64 attraversa la API pubblica.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (*
;                (ARCDOCDB.HASH64::ROTATE64 (LOGAND ARCDOCDB.HASH64::+MASK64+ #)
;                 31)
;                ARCDOCDB.HASH64::+PRIME1+)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::ROUND64
;         (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: due u64. Post: round XXH64 modulo 2^64, puro e inline.
; Overflow modulari intenzionali; nessun valore u64 attraversa la API pubblica.\"
;       (BLOCK ARCDOCDB.HASH64::ROUND64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (* (ARCDOCDB.HASH64::ROTATE64 # 31)
;                    ARCDOCDB.HASH64::+PRIME1+))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN MERGE64
;     (DEFUN ARCDOCDB.HASH64::MERGE64
;            (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       \"Pre: accumulatori u64. Post: convergenza XXH64 modulo 2^64, pura e inline.
;   Non segnala condizioni su argomenti conformi; non possiede risorse.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (+
;                (* (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR #)
;                   ARCDOCDB.HASH64::+PRIME1+)
;                ARCDOCDB.HASH64::+PRIME4+)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::MERGE64
;         (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: accumulatori u64. Post: convergenza XXH64 modulo 2^64, pura e inline.
; Non segnala condizioni su argomenti conformi; non possiede risorse.\"
;       (BLOCK ARCDOCDB.HASH64::MERGE64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (+ (* # ARCDOCDB.HASH64::+PRIME1+) ARCDOCDB.HASH64::+PRIME4+))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN AVALANCHE64
;     (DEFUN ARCDOCDB.HASH64::AVALANCHE64 (ARCDOCDB.HASH64::VALUE)
;       \"Pre: u64. Post: diffusione finale XXH64 modulo 2^64, pura e inline.
;   Non segnala condizioni su argomenti conformi; nessun risultato boxed pubblico.\"
;       (LET ((ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::VALUE))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;         (SETF ARCDOCDB.HASH64::ACCUMULATOR (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;         (SETF ARCDOCDB.HASH64::ACCUMULATOR (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;         (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR
;                 (ASH ARCDOCDB.HASH64::ACCUMULATOR -32))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::AVALANCHE64
;         (ARCDOCDB.HASH64::VALUE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: u64. Post: diffusione finale XXH64 modulo 2^64, pura e inline.
; Non segnala condizioni su argomenti conformi; nessun risultato boxed pubblico.\"
;       (BLOCK ARCDOCDB.HASH64::AVALANCHE64
;         (LET ((ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::VALUE))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #)
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #)
;           (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR
;                   (ASH ARCDOCDB.HASH64::ACCUMULATOR -32)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/blocks.lisp
; in: DEFUN HASH-BLOCKS
;     (= POSITION (+ ARCDOCDB.HASH64::START (* 32 (ASH ARCDOCDB.HASH64::SIZE -5))))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (DEFUN ARCDOCDB.HASH64::HASH-BLOCKS
;            (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE
;             ARCDOCDB.HASH64::SEED)
;       #<(SIMPLE-ARRAY CHARACTER
;          (264)) Pre: span verificato, SIZE>=32, seme u64. Post: digest dei blocchi completi da 32 byte.
;   Al massimo floor(65535/32) iterazioni; helper inline, input immutato, nessuna risorsa.
;   INVARIANT-VIOLATION :hash... {800774A7FF}>
;       (UNLESS
;           (AND (>= ARCDOCDB.HASH64::SIZE 32)
;                (<= (+ ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE)
;                    (LENGTH ARCDOCDB.HASH64::BUFFER)))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                :HASH-BLOCK-SPAN))
;       (LET ((ARCDOCDB.HASH64::V1 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (ARCDOCDB.HASH64::V2 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::SEED)
;             (ARCDOCDB.HASH64::V4 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (POSITION ARCDOCDB.HASH64::START))
;         (DECLARE
;          (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::V1 ARCDOCDB.HASH64::V2
;           ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::V4)
;          (TYPE ARCDOCDB.BINARY:INDEX POSITION))
;         (DOTIMES (ARCDOCDB.HASH64::I (ASH ARCDOCDB.HASH64::SIZE -5))
;           (SETF ARCDOCDB.HASH64::V1 #
;                 ARCDOCDB.HASH64::V2 #
;                 ARCDOCDB.HASH64::V3 #
;                 ARCDOCDB.HASH64::V4 #)
;           (INCF POSITION 32))
;         (UNLESS (= POSITION (+ ARCDOCDB.HASH64::START #))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-BLOCK-PROGRESS))
;         (LET ((ARCDOCDB.HASH64::ACCUMULATOR #))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #
;                 ARCDOCDB.HASH64::ACCUMULATOR #
;                 ARCDOCDB.HASH64::ACCUMULATOR #)
;           (ARCDOCDB.HASH64::MERGE64 ARCDOCDB.HASH64::ACCUMULATOR
;                                     ARCDOCDB.HASH64::V4))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::HASH-BLOCKS
;         (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE
;          ARCDOCDB.HASH64::SEED)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          264) Pre: span verificato, SIZE>=32, seme u64. Post: digest dei blocchi completi da 32 byte.
; Al massimo floor(65535/32) iterazioni; helper inline, input immutato, nessuna risorsa.
; INVARIANT-VIOLATION :hash... {800774DA3F}>
;       (BLOCK ARCDOCDB.HASH64::HASH-BLOCKS
;         (UNLESS (AND (>= ARCDOCDB.HASH64::SIZE 32) (<= # #))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-BLOCK-SPAN))
;         (LET ((ARCDOCDB.HASH64::V1 #)
;               (ARCDOCDB.HASH64::V2 #)
;               (ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::SEED)
;               (ARCDOCDB.HASH64::V4 #)
;               (POSITION ARCDOCDB.HASH64::START))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::V1 ARCDOCDB.HASH64::V2
;             ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::V4)
;            (TYPE ARCDOCDB.BINARY:INDEX POSITION))
;           (DOTIMES (ARCDOCDB.HASH64::I #) (SETF #) (INCF POSITION 32))
;           (UNLESS (= POSITION #)
;             (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                    :HASH-BLOCK-PROGRESS))
;           (LET (#)
;             (DECLARE #)
;             (SETF #)
;             (ARCDOCDB.HASH64::MERGE64 ARCDOCDB.HASH64::ACCUMULATOR
;                                       ARCDOCDB.HASH64::V4)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN HASH-TAIL
;     (DEFUN ARCDOCDB.HASH64::HASH-TAIL
;            (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;             ARCDOCDB.HASH64::ACCUMULATOR)
;       #<(SIMPLE-ARRAY CHARACTER
;          (252)) Pre: span residuo verificato, da 0 a 31 byte; accumulatore include lunghezza totale.
;   Post: coda XXH64, pura e inline. Al massimo tre lane da 8, una da 4 e tre byte.
;   INVARIANT-VIOLATION :hash-tail-span... {8007CDDB9F}>
;       (UNLESS
;           (AND
;            (<= ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;                (LENGTH ARCDOCDB.HASH64::BUFFER))
;            (<= (- ARCDOCDB.HASH64::END ARCDOCDB.HASH64::START) 31))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :HASH-TAIL-SPAN))
;       (LET ((POSITION ARCDOCDB.HASH64::START)
;             (ARCDOCDB.HASH64::VALUE ARCDOCDB.HASH64::ACCUMULATOR))
;         (DECLARE (TYPE ARCDOCDB.BINARY:INDEX POSITION)
;                  (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::VALUE))
;         (DOTIMES (ARCDOCDB.HASH64::I (ASH # -3))
;           (SETF ARCDOCDB.HASH64::VALUE #
;                 ARCDOCDB.HASH64::VALUE #)
;           (INCF POSITION 8))
;         (WHEN (<= 4 (- ARCDOCDB.HASH64::END POSITION))
;           (SETF ARCDOCDB.HASH64::VALUE #
;                 ARCDOCDB.HASH64::VALUE #)
;           (INCF POSITION 4))
;         (LOOP ARCDOCDB.HASH64::WHILE (< POSITION ARCDOCDB.HASH64::END)
;               DO (SETF ARCDOCDB.HASH64::VALUE #
;                        ARCDOCDB.HASH64::VALUE #) (INCF POSITION))
;         (UNLESS (= POSITION ARCDOCDB.HASH64::END)
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-TAIL-PROGRESS))
;         ARCDOCDB.HASH64::VALUE))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::HASH-TAIL
;         (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;          ARCDOCDB.HASH64::ACCUMULATOR)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          252) Pre: span residuo verificato, da 0 a 31 byte; accumulatore include lunghezza totale.
; Post: coda XXH64, pura e inline. Al massimo tre lane da 8, una da 4 e tre byte.
; INVARIANT-VIOLATION :hash-tail-span... {8007CDE24F}>
;       (BLOCK ARCDOCDB.HASH64::HASH-TAIL
;         (UNLESS
;             (AND (<= ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END #) (<= # 31))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-TAIL-SPAN))
;         (LET ((POSITION ARCDOCDB.HASH64::START)
;               (ARCDOCDB.HASH64::VALUE ARCDOCDB.HASH64::ACCUMULATOR))
;           (DECLARE (TYPE ARCDOCDB.BINARY:INDEX POSITION)
;                    (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::VALUE))
;           (DOTIMES (ARCDOCDB.HASH64::I #) (SETF #) (INCF POSITION 8))
;           (WHEN (<= 4 #) (SETF #) (INCF POSITION 4))
;           (LOOP ARCDOCDB.HASH64::WHILE (< POSITION ARCDOCDB.HASH64::END)
;                 DO (SETF #) (INCF POSITION))
;           (UNLESS (= POSITION ARCDOCDB.HASH64::END)
;             (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                    :HASH-TAIL-PROGRESS))
;           ARCDOCDB.HASH64::VALUE)))
; 
; note: doing unsigned word to integer coercion (cost 20) from VALUE to \"<return value>\"

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/hash/hash64.lisp
; in: DEFUN XXH64
;     (ARCDOCDB.HASH64::HASH-BLOCKS ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START
;                                   ARCDOCDB.HASH64::SIZE ARCDOCDB.HASH64::SEED)
; --> BLOCK LET UNLESS IF = 
; ==>
;   1
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/utf8.lisp
; in: DEFUN VERIFICA-UTF8
;     (LOOP ARCDOCDB.UTF8::REPEAT ARCDOCDB.UTF8::SPAN
;           DO (WHEN (= ARCDOCDB.UTF8::CURSOR ARCDOCDB.UTF8::LIMIT)
;                (RETURN)) (SETF ARCDOCDB.UTF8::CURSOR
;                                  (ARCDOCDB.UTF8::VERIFICA-CARATTERE-UTF8
;                                   ARCDOCDB.UTF8::BYTES ARCDOCDB.UTF8::CURSOR
;                                   ARCDOCDB.UTF8::LIMIT)) (INCF COUNT) (UNLESS
;                                                                           (<=
;                                                                            COUNT
;                                                                            (-
;                                                                             ARCDOCDB.UTF8::CURSOR
;                                                                             ARCDOCDB.UTF8::BEGIN))
;                                                                         (ERROR
;                                                                          'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION
;                                                                          :REASON
;                                                                          :UTF8-COUNT
;                                                                          :OFFSET
;                                                                          ARCDOCDB.UTF8::CURSOR)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-header.lisp
; in: DEFUN LEGGI-INDEFINITO-HEADER-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MAJOR :OFFSET
;            ARCDOCDB.CBOR::START)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-float-minimal.lisp
; in: DEFUN BINARY32-ACCORCIABILE-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT32-FIELDS)
; 
; note: deleting unreachable code

; in: DEFUN BINARY64-ALLINEATO-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT64-SHIFT)
; 
; note: deleting unreachable code

; in: DEFUN BINARY64-ACCORCIABILE-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT64-FIELDS)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-minimal.lisp
; in: DEFUN ARGOMENTO-MINIMO-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MINIMAL-AI)
; 
; note: deleting unreachable code

; in: DEFUN FLOAT-ACCORCIABILE-HEADER-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MINIMAL-AI)
; 
; note: deleting unreachable code

; in: DEFUN LEGGI-HEADER-CBOR-MINIMO
;     (< ARCDOCDB.CBOR::START ARCDOCDB.CBOR::NEXT)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a T, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-space.lisp
; in: DEFUN CREA-SPAZIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-WORKSPACE-CAPACITY)
; 
; note: deleting unreachable code

; in: DEFUN AZZERA-SPAZIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-WORKSPACE-CAPACITY)
; 
; note: deleting unreachable code
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-input.lisp
; in: DEFUN CHECK-INPUT-STRUTTURA-CBOR
;     (> ARCDOCDB.CBOR::SPAN ARCDOCDB.CBOR::MAX-BYTES)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The second argument is a T, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan-stack.lisp
; in: DEFUN TIPO-FRAME-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-STACK-TOP)
; 
; note: deleting unreachable code

; in: DEFUN INIZIA-FIGLIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-CHILD-KIND)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/codec/cbor-scan.lisp
; in: DEFUN VERIFICA-STRUTTURA-CBOR-INTERNA
;     (LOOP ARCDOCDB.CBOR::REPEAT ARCDOCDB.CBOR::SPAN
;           DO (WHEN
;                  (ARCDOCDB.CBOR::SVUOTA-FRAME-CBOR ARCDOCDB.CBOR::SCRATCH
;                                                    ARCDOCDB.CBOR::LIMIT)
;                (RETURN)) (ARCDOCDB.CBOR::PASSO-STRUTTURA-CBOR
;                           ARCDOCDB.CBOR::BYTES ARCDOCDB.CBOR::SCRATCH
;                           ARCDOCDB.CBOR::LIMIT ARCDOCDB.CBOR::NODE-LIMIT
;                           ARCDOCDB.CBOR::DEPTH-LIMIT ARCDOCDB.CBOR::MINIMAL))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/csn/registry.lisp
; in: DEFUN %CHECK-TOKEN-CSN
;     (=
;      (AREF (ARCDOCDB.CSN::REGISTRO-CSN-HIGHS ARCDOCDB.CSN::REGISTRY)
;            ARCDOCDB.CSN::SLOT)
;      ARCDOCDB.CSN::HIGH)
; 
; note: unable to open code because: The operands might not be the same type.

;     (=
;      (AREF (ARCDOCDB.CSN::REGISTRO-CSN-LOWS ARCDOCDB.CSN::REGISTRY)
;            ARCDOCDB.CSN::SLOT)
;      ARCDOCDB.CSN::LOW)
; 
; note: unable to open code because: The operands might not be the same type.

; in: DEFUN %FRONTIERA-RISOLTA-CSN
;     (INCF COUNT)
; ==>
;   (+ 1 COUNT)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/cache/build.lisp
; in: DEFUN POTENZA-DUE-CACHE-P
;     (PLUSP NUMBER)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.

;     (1- NUMBER)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (LOGAND NUMBER (1- NUMBER))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; in: DEFUN PAYLOAD-CLASSE-CACHE
;     (* ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::+CACHE-WAYS+
;        (+ ARCDOCDB.CACHE::SIZE 29))
; 
; note: forced to do full call
;       unable to do inline ASH (cost 1) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline ASH (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ ARCDOCDB.CACHE::SIZE 29)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (* ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::+CACHE-WAYS+
;        (+ ARCDOCDB.CACHE::SIZE 29))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8)), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8)), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       etc.

;     (+
;      (* ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::+CACHE-WAYS+
;         (+ ARCDOCDB.CACHE::SIZE 29))
;      ARCDOCDB.CACHE::SETS
;      (* 8 (MIN ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES)))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (MIN ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (* 8 (MIN ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES))
; 
; note: forced to do full call
;       unable to do inline ASH (cost 1) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline ASH (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+
;      (* ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::+CACHE-WAYS+
;         (+ ARCDOCDB.CACHE::SIZE 29))
;      ARCDOCDB.CACHE::SETS
;      (* 8 (MIN ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES)))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8)), not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8)), not a (UNSIGNED-BYTE
;                                                                                      64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFUN PREFLIGHT-CACHE
;     (INCF ARCDOCDB.CACHE::ACTIVE)
; ==>
;   (+ 1 ARCDOCDB.CACHE::ACTIVE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (+ 8
;        (ARCDOCDB.CACHE::PAYLOAD-CLASSE-CACHE ARCDOCDB.CACHE::SIZE
;         ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.CACHE::PAYLOAD
;           (+ 8
;              (ARCDOCDB.CACHE::PAYLOAD-CLASSE-CACHE ARCDOCDB.CACHE::SIZE
;               ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES)))
; ==>
;   (+
;    (+ 8
;       (ARCDOCDB.CACHE::PAYLOAD-CLASSE-CACHE ARCDOCDB.CACHE::SIZE
;        ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES))
;    ARCDOCDB.CACHE::PAYLOAD)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (<= ARCDOCDB.CACHE::PAYLOAD ARCDOCDB.CACHE::BUDGET)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/handoff.lisp
; in: DEFUN %CHECK-PROGRAMMABILE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WRITER-SCHEDULING)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/ready.lisp
; in: DEFUN PRELEVA-WRITER-PRONTO
;     (1+ ARCDOCDB.EXECUTION::CURSOR)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                               (INTEGER 35184372088832
;                                4611686018427387903)), not a RATIONAL.

;     (MOD (1+ ARCDOCDB.EXECUTION::CURSOR) ARCDOCDB.EXECUTION::SIZE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a RATIONAL.

;     (1+ ARCDOCDB.EXECUTION::CURSOR)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                               (INTEGER 35184372088832
;                                4611686018427387903)), not a RATIONAL.

;     (MOD (1+ ARCDOCDB.EXECUTION::CURSOR) ARCDOCDB.EXECUTION::SIZE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a RATIONAL.

;     (1+ ARCDOCDB.EXECUTION::CURSOR)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                                   (INTEGER 35184372088832 4611686018427387903)), not a FIXNUM.
;       The result is a (VALUES
;                        (OR FLOAT (RATIONAL 1 35184372088832)
;                            (INTEGER 35184372088833 4611686018427387904))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                                   (INTEGER 35184372088832 4611686018427387903)), not a (UNSIGNED-BYTE
;                                                                                         64).
;       The result is a (VALUES
;                        (OR FLOAT (RATIONAL 1 35184372088832)
;                            (INTEGER 35184372088833 4611686018427387904))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                                   (INTEGER 35184372088832 4611686018427387903)), not a FIXNUM.
;       The result is a (VALUES
;                        (OR FLOAT (RATIONAL 1 35184372088832)
;                            (INTEGER 35184372088833 4611686018427387904))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                                   (INTEGER 35184372088832 4611686018427387903)), not a (UNSIGNED-BYTE
;                                                                                         64).
;       The result is a (VALUES
;                        (OR FLOAT (RATIONAL 1 35184372088832)
;                            (INTEGER 35184372088833 4611686018427387904))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :READY-QUEUE-INVARIANT)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-claim.lisp
; in: DEFUN PRENDI-WRITER-WORKER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-STATE)
; 
; note: deleting unreachable code

; in: DEFUN RICIRCOLA-WORKER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-STATE)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/execution/worker-run.lisp
; in: DEFUN PRELEVA-LAVORI-WORKER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-STATE)
; 
; note: deleting unreachable code

; in: DEFUN %CONCLUDI-WORKER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-STATE)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/native.lisp
; in: SB-ALIEN:DEFINE-ALIEN-ROUTINE (\"pread\" %PREAD)
;     (DEFINE-ALIEN-ROUTINE (\"pread\" ARCDOCDB.IO::%PREAD) LONG
;                           (ARCDOCDB.IO::FD INT)
;                           (ARCDOCDB.IO::BUFFER SYSTEM-AREA-POINTER)
;                           (COUNT UNSIGNED-LONG) (ARCDOCDB.IO::OFFSET LONG))
; --> DEFUN PROGN SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::%PREAD
;         (ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT ARCDOCDB.IO::OFFSET)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.IO::%PREAD
;         (WITH-ALIEN ((#:%PREAD # :EXTERN \"pread\"))
;           (VALUES
;            (ALIEN-FUNCALL #:%PREAD ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT
;                           ARCDOCDB.IO::OFFSET)))))
; 
; note: doing signed word to integer coercion (cost 20) to \"<return value>\"

; in: SB-ALIEN:DEFINE-ALIEN-ROUTINE (\"write\" %WRITE)
;     (DEFINE-ALIEN-ROUTINE (\"write\" ARCDOCDB.IO::%WRITE) LONG
;                           (ARCDOCDB.IO::FD INT)
;                           (ARCDOCDB.IO::BUFFER SYSTEM-AREA-POINTER)
;                           (COUNT UNSIGNED-LONG))
; --> DEFUN PROGN SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::%WRITE
;         (ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.IO::%WRITE
;         (WITH-ALIEN ((#:%WRITE # :EXTERN \"write\"))
;           (VALUES
;            (ALIEN-FUNCALL #:%WRITE ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER
;                           COUNT)))))
; 
; note: doing signed word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN NATIVE-OPEN
;     (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI)
; 
; note: deleting unreachable code

;     (DEFUN ARCDOCDB.IO::NATIVE-OPEN (ARCDOCDB.IO::NAME ARCDOCDB.IO::MODE)
;       \"Pre: nome non vuoto/NUL-free. Post: FD CLOEXEC/NOFOLLOW e modo richiesto.
;   SYSCALL-ERROR esplicito; ABI non 64 bit UNSUPPORTED-FORMAT, senza apertura.\"
;       (UNLESS (= SB-VM:N-WORD-BITS 64)
;         (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI))
;       (LET ((ARCDOCDB.IO::FD (SB-POSIX:OPEN ARCDOCDB.IO::NAME # 384)))
;         (HANDLER-CASE
;          (LET (#)
;            (UNLESS # #)
;            ARCDOCDB.IO::FD)
;          (SB-POSIX:SYSCALL-ERROR (ARCDOCDB.IO::C)
;                                  (ARCDOCDB.IO::CLEANUP-OPEN ARCDOCDB.IO::FD
;                                   :IO-SYSCALL #))
;          (ARCDOCDB.CONDITIONS:IO-FAULT (ARCDOCDB.IO::C)
;           (ARCDOCDB.IO::CLEANUP-OPEN ARCDOCDB.IO::FD # #)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::NATIVE-OPEN
;         (ARCDOCDB.IO::NAME ARCDOCDB.IO::MODE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: nome non vuoto/NUL-free. Post: FD CLOEXEC/NOFOLLOW e modo richiesto.
; SYSCALL-ERROR esplicito; ABI non 64 bit UNSUPPORTED-FORMAT, senza apertura.\"
;       (BLOCK ARCDOCDB.IO::NATIVE-OPEN
;         (UNLESS (= SB-VM:N-WORD-BITS 64)
;           (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI))
;         (LET ((ARCDOCDB.IO::FD #))
;           (HANDLER-CASE
;            (LET #
;              #
;              ARCDOCDB.IO::FD)
;            (SB-POSIX:SYSCALL-ERROR # #) (ARCDOCDB.CONDITIONS:IO-FAULT # #)))))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (UNSIGNED-BYTE 31) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (UNSIGNED-BYTE 31) &OPTIONAL).

;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :IO-OPEN-MODE)
; 
; note: deleting unreachable code

;     (SB-POSIX:S-ISREG ARCDOCDB.IO::KIND)
; --> BLOCK LET ALIEN-FUNCALL 
; ==>
;   1
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (SB-POSIX:S-ISDIR ARCDOCDB.IO::KIND)
; --> BLOCK LET ALIEN-FUNCALL 
; ==>
;   1
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; in: DEFUN NATIVE-READ
;     (LET ((ARCDOCDB.IO::N
;            (ARCDOCDB.IO::%PREAD ARCDOCDB.IO::FD
;             (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT ARCDOCDB.IO::OFFSET)))
;       (WHEN (= ARCDOCDB.IO::N -1)
;         (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME
;                'ARCDOCDB.IO::PREAD))
;       ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

; in: DEFUN NATIVE-WRITE
;     (LET ((ARCDOCDB.IO::N
;            (ARCDOCDB.IO::%WRITE ARCDOCDB.IO::FD
;             (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT)))
;       (WHEN (= ARCDOCDB.IO::N -1)
;         (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME 'WRITE))
;       ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/lifecycle.lisp
; in: DEFUN NOME-FILE
;     (PATHNAME ARCDOCDB.IO::PATH)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR STRING PATHNAME), not a PATHNAME.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR STRING PATHNAME), not a STRING.

;     (LENGTH ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (FIND #\\Nul ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a (OR CONS VECTOR
;                                SB-KERNEL:EXTENDED-SEQUENCE), not a (OR LIST
;                                                                        VECTOR).

;     (FIND-IF (LAMBDA (ARCDOCDB.IO::C) (CHAR/= ARCDOCDB.IO::C #\\/))
;              ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a (OR CONS VECTOR
;                                SB-KERNEL:EXTENDED-SEQUENCE), not a (OR LIST
;                                                                        VECTOR).

;     (STRING-RIGHT-TRIM \"/\" ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a STRING, not a SIMPLE-STRING.

;     (LENGTH ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR CONS VECTOR
;                               SB-KERNEL:EXTENDED-SEQUENCE), not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR CONS VECTOR
;                               SB-KERNEL:EXTENDED-SEQUENCE), not a VECTOR.

;     (STRING= ARCDOCDB.IO::NAME \".tmp\" :START1 (- (LENGTH ARCDOCDB.IO::NAME) 4))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a STRING, not a (SIMPLE-ARRAY CHARACTER (*)).

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/io/transfer.lisp
; in: DEFUN LEGGI-ESATTO
;     (LOOP ARCDOCDB.IO::REPEAT
;           COUNT
;           ARCDOCDB.IO::UNTIL (= ARCDOCDB.IO::DONE COUNT)
;           DO (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;                     (ARCDOCDB.IO::N
;                      (IF ARCDOCDB.IO:BACKEND
;                          #
;                          #)))
;                (INCF ARCDOCDB.IO::DONE
;                      (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;                       ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE))))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;            (ARCDOCDB.IO::N
;             (IF ARCDOCDB.IO:BACKEND
;                 (FUNCALL # # ARCDOCDB.IO::BUFFER # ARCDOCDB.IO::REMAINING #)
;                 (ARCDOCDB.IO::NATIVE-READ # ARCDOCDB.IO::BUFFER #
;                                           ARCDOCDB.IO::REMAINING #))))
;       (INCF ARCDOCDB.IO::DONE
;             (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;              ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE)))
; 
; note: doing signed word to integer coercion (cost 20) to REMAINING

;     (ARCDOCDB.IO::NATIVE-READ (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE)
;                               ARCDOCDB.IO::BUFFER
;                               (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE)
;                               ARCDOCDB.IO::REMAINING
;                               (+ ARCDOCDB.IO::OFFSET ARCDOCDB.IO::DONE))
; --> BLOCK SB-SYS:WITH-PINNED-OBJECTS LET 
; ==>
;   (LET ((ARCDOCDB.IO::N
;          (ARCDOCDB.IO::%PREAD ARCDOCDB.IO::FD
;                               (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT
;                               ARCDOCDB.IO::OFFSET)))
;     (WHEN (= ARCDOCDB.IO::N -1)
;       (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME
;              'ARCDOCDB.IO::PREAD))
;     ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

;     (INCF ARCDOCDB.IO::DONE
;           (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;            ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE))
; 
; note: doing signed word to integer coercion (cost 20) to DONE

;     (FUNCALL (ARCDOCDB.IO::BACKEND-READER ARCDOCDB.IO:BACKEND)
;              (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE) ARCDOCDB.IO::BUFFER
;              (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE) ARCDOCDB.IO::REMAINING
;              (+ ARCDOCDB.IO::OFFSET ARCDOCDB.IO::DONE))
; 
; note: doing unsigned word to integer coercion (cost 20)
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN APPEND-ESATTO
;     (LOOP ARCDOCDB.IO::REPEAT
;           COUNT
;           ARCDOCDB.IO::UNTIL (= ARCDOCDB.IO::DONE COUNT)
;           DO (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;                     (ARCDOCDB.IO::N
;                      (IF ARCDOCDB.IO:BACKEND
;                          #
;                          #))
;                     (ARCDOCDB.IO::PROGRESS
;                      (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;                       ARCDOCDB.IO::REMAINING :WRITE ARCDOCDB.IO::DONE)))
;                (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
;                (INCF (ARCDOCDB.IO::FILE-WRITTEN ARCDOCDB.IO::FILE)
;                      ARCDOCDB.IO::PROGRESS)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;            (ARCDOCDB.IO::N
;             (IF ARCDOCDB.IO:BACKEND
;                 (FUNCALL # # ARCDOCDB.IO::BUFFER # ARCDOCDB.IO::REMAINING)
;                 (ARCDOCDB.IO::NATIVE-WRITE # ARCDOCDB.IO::BUFFER #
;                                            ARCDOCDB.IO::REMAINING)))
;            (ARCDOCDB.IO::PROGRESS
;             (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;              ARCDOCDB.IO::REMAINING :WRITE ARCDOCDB.IO::DONE)))
;       (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
;       (INCF (ARCDOCDB.IO::FILE-WRITTEN ARCDOCDB.IO::FILE) ARCDOCDB.IO::PROGRESS))
; 
; note: doing signed word to integer coercion (cost 20) to REMAINING

;     (ARCDOCDB.IO::NATIVE-WRITE (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE)
;                                ARCDOCDB.IO::BUFFER
;                                (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE)
;                                ARCDOCDB.IO::REMAINING)
; --> BLOCK SB-SYS:WITH-PINNED-OBJECTS LET 
; ==>
;   (LET ((ARCDOCDB.IO::N
;          (ARCDOCDB.IO::%WRITE ARCDOCDB.IO::FD
;                               (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT)))
;     (WHEN (= ARCDOCDB.IO::N -1)
;       (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME 'WRITE))
;     ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

;     (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
; 
; note: doing signed word to integer coercion (cost 20) to DONE

;     (FUNCALL (ARCDOCDB.IO::BACKEND-WRITER ARCDOCDB.IO:BACKEND)
;              (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE) ARCDOCDB.IO::BUFFER
;              (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE) ARCDOCDB.IO::REMAINING)
; 
; note: doing unsigned word to integer coercion (cost 20)

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/types.lisp
; in: DEFSTRUCT LOG-IO
;     (ARCDOCDB.WAL::FILE-ID 0 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.WAL::LOG-IO-FILE-ID
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.WAL::LOG-IO-FILE-ID
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.WAL:LOG-IO SB-KERNEL:INSTANCE) 3))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFSTRUCT LOTTO
;     (ARCDOCDB.WAL::FILE-ID 0 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.WAL::LOTTO-FILE-ID
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.WAL::LOTTO-FILE-ID
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.WAL:LOTTO SB-KERNEL:INSTANCE) 2))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/group.lisp
; in: DEFUN VERIFICA-IDENTITA-LOTTO
;     (= (ARCDOCDB.WAL::LOTTO-START ARCDOCDB.WAL:LOTTO)
;        (+ (ARCDOCDB.WAL::GRUPPO-START ARCDOCDB.WAL::GROUP)
;           (ARCDOCDB.WAL::GRUPPO-BYTES ARCDOCDB.WAL::GROUP)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/executor.lisp
; in: DEFUN SCRIVI-GRUPPO
;     (= ARCDOCDB.WAL::END
;        (+ (ARCDOCDB.WAL::LOTTO-START ARCDOCDB.WAL:LOTTO)
;           (ARCDOCDB.WAL::LOTTO-USED ARCDOCDB.WAL:LOTTO)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; in: DEFUN SINCRONIZZA-GRUPPO
;     (= ARCDOCDB.WAL::END
;        (+ (ARCDOCDB.WAL::GRUPPO-START ARCDOCDB.WAL::GROUP)
;           (ARCDOCDB.WAL::GRUPPO-BYTES ARCDOCDB.WAL::GROUP)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/wal/csn.lisp
; in: DEFUN VERIFICA-FILE-CSN
;     (LET* ((ARCDOCDB.WAL::FILE (ARCDOCDB.WAL::LOG-IO-FILE LOG))
;            (ARCDOCDB.WAL::WRITTEN
;             (ARCDOCDB.IO:POSIZIONE-SCRITTA ARCDOCDB.WAL::FILE))
;            (ARCDOCDB.WAL::SIZE
;             (+ (ARCDOCDB.WAL::LOTTO-USED ARCDOCDB.WAL:LOTTO)
;                ARCDOCDB.WAL::+SEAL-TOTAL+)))
;       (UNLESS (<= ARCDOCDB.WAL::WRITTEN ARCDOCDB.WAL::FILE-START)
;         (ERROR 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :REASON
;                :LOTTO-WRITTEN-OFFSET))
;       (ARCDOCDB.IO:VERIFICA-CAPIENZA-APPEND ARCDOCDB.WAL::FILE
;                                             (+
;                                              (- ARCDOCDB.WAL::FILE-START
;                                                 ARCDOCDB.WAL::WRITTEN)
;                                              ARCDOCDB.WAL::SIZE)
;                                             ARCDOCDB.WAL::SIZE)
;       (UNLESS
;           (<= ARCDOCDB.WAL::DURABLE
;               (ARCDOCDB.IO:POSIZIONE-DUREVOLE ARCDOCDB.WAL::FILE))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :REASON
;                :LOTTO-FUTURE-DURABLE)))
; 
; note: doing signed word to integer coercion (cost 20) to SIZE

;     (ARCDOCDB.IO:VERIFICA-CAPIENZA-APPEND ARCDOCDB.WAL::FILE
;                                           (+
;                                            (- ARCDOCDB.WAL::FILE-START
;                                               ARCDOCDB.WAL::WRITTEN)
;                                            ARCDOCDB.WAL::SIZE)
;                                           ARCDOCDB.WAL::SIZE)
; 
; note: doing unsigned word to integer coercion (cost 20)

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/ownership.lisp
; in: DEFUN %MARK-FAULT
;     (SETF (ARCDOCDB.SERIES::CONTROLLORE-SERIE-STATE ARCDOCDB.SERIES::CONTROLLER)
;             :ARCHIVE-FAULTED)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/events.lisp
; in: DEFUN %CHECK-LOTTO-RELEASE
;     (ARCDOCDB.SERIES::%SERIE-INVARIANT ARCDOCDB.SERIES::CONTROLLER
;                                        :SERIE-RELEASE-KIND)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/query.lisp
; in: DEFUN AMBITO-FAULT-SERIE
;     (ARCDOCDB.SERIES::%SERIE-INVARIANT ARCDOCDB.SERIES::CONTROLLER :SERIE-HEALTH)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/types.lisp
; in: DEFUN CREA-BANCO-SLOT
;     (PLUSP ARCDOCDB.INDEX.SLOTS::BUDGET-BYTES)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/read.lisp
; in: DEFUN LEGGI-SLOT-V2
;     (ARCDOCDB.INDEX.SLOTS::GUASTO-SLOT ARCDOCDB.INDEX.SLOTS::BANK
;                                        :INDEX-SLOT-READ-STATE)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-core.lisp
; in: DEFUN ESIGI-CHIAVE
;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-probe.lisp
; in: DEFUN SONDA-GRUPPO
;     (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-OWNER
;      ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-read.lisp
; in: DEFUN LEGGI-INDICE-PRIMARIO
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-write.lisp
; in: DEFUN PREPARA-CHIAVE-WRITER
;     (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
; 
; note: forced to do +/UNSIGNED-SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (INTEGER -9223372036854775807
;                                 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743103)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a (INTEGER -9223372036854775807
;                                 9223372036854775807), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743103)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (> (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
;        (LENGTH
;         (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-ARENA
;          ARCDOCDB.INDEX.PRIMARY::FRAGMENT)))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743103), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743103), not a (UNSIGNED-BYTE
;                                                                                          64).
;       etc.

;     (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
; 
; note: forced to do */SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -4294967296)
;                            (INTEGER 0 0)
;                            (INTEGER 4294967296 39614081257132168792477007872))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -4294967296)
;                            (INTEGER 0 0)
;                            (INTEGER 4294967296 39614081257132168792477007872))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (LOGIOR ARCDOCDB.INDEX.PRIMARY::OFFSET (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
;             (ASH 1 48))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (OR
;                                 (INTEGER -39614081257132168792477007872
;                                  -4294967296)
;                                 (INTEGER 0 0)
;                                 (INTEGER 4294967296
;                                  39614081257132168792477007872)), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -39614081257132168792477007872
;                         39614081257132168796771975167)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The second argument is a (OR
;                                 (INTEGER -39614081257132168792477007872
;                                  -4294967296)
;                                 (INTEGER 0 0)
;                                 (INTEGER 4294967296
;                                  39614081257132168792477007872)), not a (UNSIGNED-BYTE
;                                                                          64).
;       The result is a (VALUES
;                        (INTEGER -39614081257132168792477007872
;                         39614081257132168796771975167)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -39614081257132168792477007872
;                                39614081257132168796771975167), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -1)
;                            (INTEGER 281474976710656
;                             39614081257132168796771975167))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (INTEGER -39614081257132168792477007872
;                                39614081257132168796771975167), not a (UNSIGNED-BYTE
;                                                                       64).
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -1)
;                            (INTEGER 281474976710656
;                             39614081257132168796771975167))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of */SIGNED=>S128

;     (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of +/UNSIGNED-SIGNED=>S128

; in: DEFUN PUBBLICA-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFUN RIMUOVI-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-relocate.lisp
; in: DEFUN RILOCA-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-arena.lisp
; in: DEFUN PAYLOAD-ROOT
;     (INCF ARCDOCDB.INDEX.PRIMARY::SUM
;           (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;            ARCDOCDB.INDEX.PRIMARY::FRAGMENT))
; ==>
;   (+
;    (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;    ARCDOCDB.INDEX.PRIMARY::SUM)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (INTEGER * 4611686018427387903), not a FIXNUM.
;       The result is a (VALUES (INTEGER * 9223372036854775806) &OPTIONAL), not a (VALUES
;                                                                                  FIXNUM
;                                                                                  &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The second argument is a (INTEGER * 4611686018427387903), not a (UNSIGNED-BYTE
;                                                                        64).
;       The result is a (VALUES (INTEGER * 9223372036854775806) &OPTIONAL), not a (VALUES
;                                                                                  (UNSIGNED-BYTE
;                                                                                   64)
;                                                                                  &OPTIONAL).
;       etc.

;     (> ARCDOCDB.INDEX.PRIMARY::SUM MOST-POSITIVE-FIXNUM)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER * 9223372036854775806), not a FIXNUM.

; in: DEFUN ESTENDI-ARENA-INDICE
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;        (IF ARCDOCDB.INDEX.PRIMARY::BUILDING
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;             ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;            0)
;        ARCDOCDB.INDEX.PRIMARY::NEW-SIZE)
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775808 9223372036854775806), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743102)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775808 9223372036854775806), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743102)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (>
;      (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;         (IF ARCDOCDB.INDEX.PRIMARY::BUILDING
;             (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;              ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;             0)
;         ARCDOCDB.INDEX.PRIMARY::NEW-SIZE)
;      ARCDOCDB.INDEX.PRIMARY::TRANSIENT-BUDGET-BYTES)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743102), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743102), not a (UNSIGNED-BYTE
;                                                                                          64).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/primary-directory.lisp
; in: DEFUN VERIFICA-PIANO-DIRECTORY
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;        ARCDOCDB.INDEX.PRIMARY::BYTES
;        (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;        (IF SECOND
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;            0))
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -4611686018427387896 4611686027017322495), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775800 9223372045444710398)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -4611686018427387896 4611686027017322495), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775800 9223372045444710398)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do +/S128+SIGNED=>S128 (cost 11)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775800 9223372045444710398), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -13835058055282163704 13835058063872098301)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775800 9223372045444710398), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -13835058055282163704 13835058063872098301)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (>
;      (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;         ARCDOCDB.INDEX.PRIMARY::BYTES
;         (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;         (IF SECOND
;             (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;             0))
;      ARCDOCDB.INDEX.PRIMARY::TRANSIENT-BUDGET)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -13835058055282163704
;                                13835058063872098301), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -13835058055282163704
;                                13835058063872098301), not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;        ARCDOCDB.INDEX.PRIMARY::BYTES
;        (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;        (IF SECOND
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;            0))
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of +/S128+SIGNED=>S128

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-scan.lisp
; in: DEFUN MISURA-RICOSTRUZIONE
;     (INCF ARCDOCDB.INDEX.PRIMARY::LIVE)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY::LIVE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF SECOND ARCDOCDB.INDEX.PRIMARY::SIZE)
; ==>
;   (+ ARCDOCDB.INDEX.PRIMARY::SIZE SECOND)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (INCF FIRST ARCDOCDB.INDEX.PRIMARY::SIZE)
; ==>
;   (+ ARCDOCDB.INDEX.PRIMARY::SIZE FIRST)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild-budget.lisp
; in: DEFUN BUDGET-RICOSTRUZIONE
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;        DIRECTORY ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST
;        (IF ARCDOCDB.INDEX.PRIMARY::SPLIT
;            (+ ARCDOCDB.INDEX.PRIMARY::SLOTS SECOND)
;            0))
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -4611686018427387240 4611686035609944063), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775144 9223372054037331966)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -4611686018427387240 4611686035609944063), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775144 9223372054037331966)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do +/S128+SIGNED=>S128 (cost 11)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775144 9223372054037331966), not a FIXNUM.
;       The second argument is a (INTEGER -4611686018427387248
;                                 4611686018430074879), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -13835058055282162392 13835058072467406845)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775144 9223372054037331966), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a (INTEGER -4611686018427387248
;                                 4611686018430074879), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -13835058055282162392 13835058072467406845)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (> ARCDOCDB.INDEX.PRIMARY::PAYLOAD ARCDOCDB.INDEX.PRIMARY::BUDGET)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -13835058055282162392
;                                13835058072467406845), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -13835058055282162392
;                                13835058072467406845), not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (LET* ((ARCDOCDB.INDEX.PRIMARY::DEPTH
;             (MAX
;              (ARCDOCDB.INDEX.PRIMARY::ROOT-INDICE-DEPTH
;               ARCDOCDB.INDEX.PRIMARY::ROOT)
;              (+ # #)))
;            (DIRECTORY (* 8 (ASH 1 ARCDOCDB.INDEX.PRIMARY::DEPTH)))
;            (ARCDOCDB.INDEX.PRIMARY::SLOTS
;             (* 41
;                (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-CAPACITY
;                 ARCDOCDB.INDEX.PRIMARY::INDEX)))
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD
;             (+
;              (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;              DIRECTORY ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST
;              (IF ARCDOCDB.INDEX.PRIMARY::SPLIT
;                  #
;                  0))))
;       (WHEN
;           (> DIRECTORY
;              (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-DIRECTORY-BUDGET
;               ARCDOCDB.INDEX.PRIMARY::INDEX))
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-DIRECTORY-MEMORY-BUDGET))
;       (WHEN
;           (OR
;            (> (+ ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST)
;               (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-FRAGMENT-BUDGET
;                ARCDOCDB.INDEX.PRIMARY::INDEX))
;            (AND ARCDOCDB.INDEX.PRIMARY::SPLIT (> # #)))
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-FRAGMENT-MEMORY-BUDGET))
;       (WHEN (> ARCDOCDB.INDEX.PRIMARY::PAYLOAD ARCDOCDB.INDEX.PRIMARY::BUDGET)
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-DIRECTORY-TRANSIENT-BUDGET))
;       (ARCDOCDB.INDEX.PRIMARY::CREDITO-RICOSTRUZIONE
;        ARCDOCDB.INDEX.PRIMARY::INDEX ARCDOCDB.INDEX.PRIMARY::ROOT
;        ARCDOCDB.INDEX.PRIMARY::SOURCE)
;       (VALUES ARCDOCDB.INDEX.PRIMARY::DEPTH ARCDOCDB.INDEX.PRIMARY::PAYLOAD))
; 
; note: doing signed 128 to integer coercion (cost 30) to PAYLOAD

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/rebuild.lisp
; in: DEFUN RICOSTRUISCI-FRAMMENTO-INDICE
;     (ASH 1 ARCDOCDB.INDEX.PRIMARY::GLOBAL)
; 
; note: forced to do full call
;       unable to do inline ASH (cost 2) because:
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline ASH (cost 3) because:
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/index/hash-digests.lisp
; in: DEFUN CALCOLA-DIGESTS-FRAMMENTO
;     (= ARCDOCDB.INDEX.PRIMARY::EXPECTED-HIGH ARCDOCDB.INDEX.PRIMARY::SEED-HIGH)
; 
; note: unable to open code because: The operands might not be the same type.

;     (= ARCDOCDB.INDEX.PRIMARY::EXPECTED-LOW ARCDOCDB.INDEX.PRIMARY::SEED-LOW)
; 
; note: unable to open code because: The operands might not be the same type.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-types.lisp
; in: DEFSTRUCT REGISTRO-SNAPSHOT
;     (ARCDOCDB.MVCC::LIFETIME 1 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-LIFETIME
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-LIFETIME
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.MVCC:REGISTRO-SNAPSHOT
;                               SB-KERNEL:INSTANCE)
;                          2))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

;     (ARCDOCDB.MVCC::WAIT 1 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WAIT
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WAIT
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.MVCC:REGISTRO-SNAPSHOT
;                               SB-KERNEL:INSTANCE)
;                          3))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN CREA-REGISTRO-SNAPSHOT
;     (<= 1 ARCDOCDB.MVCC::WAIT-TICKS ARCDOCDB.MVCC::LIFETIME-TICKS
;         ARCDOCDB.MVCC::+MAX-CSN+)
; 
; note: forced to do <-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-core.lisp
; in: DEFUN RICALCOLA-SOGLIA-SNAPSHOT
;     (INCF COUNT)
; ==>
;   (+ 1 COUNT)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-csn.lisp
; in: DEFUN FRONTIERE-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT (ARCDOCDB.MVCC::REGISTRY)
;       #<(SIMPLE-ARRAY CHARACTER
;          (287)) Pre: mutex snapshot posseduto, registro sano dell'Archivio. Post: H e ultimo CSN coerenti.
;   RESOURCE-EXHAUSTED :CSN-BUSY senza attesa. Guasto CSN invalida gli snapshot e rilancia la condizione.
;   Convers... {800554C14F}>
;       (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;       (HANDLER-CASE
;        (MULTIPLE-VALUE-BIND
;            (ARCDOCDB.MVCC::LAST-HIGH ARCDOCDB.MVCC::LAST-LOW
;             ARCDOCDB.MVCC::HORIZON-HIGH ARCDOCDB.MVCC::HORIZON-LOW)
;            (ARCDOCDB.CSN:LEGGI-FRONTIERE-CSN
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-CSNS ARCDOCDB.MVCC::REGISTRY))
;          (DECLARE
;           (TYPE ARCDOCDB.BINARY:U32 ARCDOCDB.MVCC::LAST-HIGH
;            ARCDOCDB.MVCC::LAST-LOW ARCDOCDB.MVCC::HORIZON-HIGH
;            ARCDOCDB.MVCC::HORIZON-LOW))
;          (LET (# #)
;            (DECLARE #)
;            (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;            (WHEN # #)
;            (VALUES ARCDOCDB.MVCC::HORIZON LAST)))
;        (ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION (CONDITION)
;         (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;         (ERROR CONDITION))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT
;         (ARCDOCDB.MVCC::REGISTRY)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          287) Pre: mutex snapshot posseduto, registro sano dell'Archivio. Post: H e ultimo CSN coerenti.
; RESOURCE-EXHAUSTED :CSN-BUSY senza attesa. Guasto CSN invalida gli snapshot e rilancia la condizione.
; Convers... {800554D98F}>
;       (BLOCK ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (HANDLER-CASE
;          (MULTIPLE-VALUE-BIND
;              (ARCDOCDB.MVCC::LAST-HIGH ARCDOCDB.MVCC::LAST-LOW
;               ARCDOCDB.MVCC::HORIZON-HIGH ARCDOCDB.MVCC::HORIZON-LOW)
;              (ARCDOCDB.CSN:LEGGI-FRONTIERE-CSN #)
;            (DECLARE #)
;            (LET #
;              #
;              #
;              #
;              #))
;          (ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION (CONDITION)
;           (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;           (ERROR CONDITION)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from HORIZON to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) from LAST to \"<return value>\"

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-register.lisp
; in: DEFUN REGISTRA-SNAPSHOT-SOTTO-MUTEX
;     (LET* ((ARCDOCDB.MVCC::REGISTRY
;             (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-REGISTRY ARCDOCDB.MVCC::CONTEXT))
;            (ARCDOCDB.MVCC::SLOT
;             (ARCDOCDB.MVCC::PREPARA-REGISTRAZIONE-SNAPSHOT ARCDOCDB.MVCC::CONTEXT
;              ARCDOCDB.MVCC::NOW))
;            (ARCDOCDB.MVCC::WORDS
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY))
;            (ARCDOCDB.MVCC::GENERATION (1+ (AREF ARCDOCDB.MVCC::WORDS 0)))
;            (ARCDOCDB.MVCC::ANNOUNCEMENT
;             (ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT ARCDOCDB.MVCC::REGISTRY))
;            (ARCDOCDB.MVCC::PREVIOUS (AREF ARCDOCDB.MVCC::WORDS 1))
;            (ARCDOCDB.MVCC::COMPLETE NIL))
;       (DECLARE
;        (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::GENERATION
;         ARCDOCDB.MVCC::ANNOUNCEMENT ARCDOCDB.MVCC::PREVIOUS))
;       (UNWIND-PROTECT
;           (PROGN
;            (SETF # #)
;            (SB-THREAD:BARRIER (:MEMORY))
;            (MULTIPLE-VALUE-BIND
;                (ARCDOCDB.MVCC::CAPTURED ARCDOCDB.MVCC::HORIZON
;                 ARCDOCDB.MVCC::CSN)
;                (ARCDOCDB.MVCC::TENTA-CATTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;              (DECLARE #)
;              (UNLESS ARCDOCDB.MVCC::CAPTURED # # # # # #)
;              (UNLESS # #)
;              (LET #
;                #
;                #
;                #)))
;         (UNLESS ARCDOCDB.MVCC::COMPLETE
;           (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY))))
; 
; note: doing unsigned word to integer coercion (cost 20) to GENERATION

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-lifecycle.lisp
; in: DEFUN ATTIVA-SNAPSHOT
;     (ARCDOCDB.MVCC::ORIZZONTE-SNAPSHOT-RAGGIUNTO-P ARCDOCDB.MVCC::REGISTRY
;                                                    (AREF
;                                                     (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-CSNS-ARRAY
;                                                      ARCDOCDB.MVCC::REGISTRY)
;                                                     ARCDOCDB.MVCC::SLOT))
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN SCADI-SNAPSHOT
;     (INCF ARCDOCDB.MVCC::EXPIRED)
; ==>
;   (+ 1 ARCDOCDB.MVCC::EXPIRED)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/mvcc/snapshots-read.lisp
; in: DEFUN VERIFICA-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;            (ARCDOCDB.MVCC::CONTEXT ARCDOCDB.MVCC::EXPECTED-GENERATION
;             ARCDOCDB.MVCC::NOW)
;       #<(SIMPLE-ARRAY CHARACTER
;          (269)) Pre: generazione originale, NOW fresco e base monotona comune; epoca già acquisita.
;   Post: CSN solo se attivo e non scaduto; chiamare PRIMA e DOPO la ricerca, anche sul miss.
;   Identità cambiata/fine/sca... {800687DB2F}>
;       (LET* ((ARCDOCDB.MVCC::REGISTRY
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-REGISTRY ARCDOCDB.MVCC::CONTEXT))
;              (ARCDOCDB.MVCC::WORD
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-WORD ARCDOCDB.MVCC::CONTEXT))
;              (ARCDOCDB.MVCC::CONTEXT-GENERATION
;               (SB-THREAD:BARRIER #
;                 #))
;              (ARCDOCDB.MVCC::SLOT
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-SLOT ARCDOCDB.MVCC::CONTEXT)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CONTEXT-GENERATION))
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (UNLESS
;             (AND (PLUSP ARCDOCDB.MVCC::EXPECTED-GENERATION)
;                  (= ARCDOCDB.MVCC::CONTEXT-GENERATION
;                     ARCDOCDB.MVCC::EXPECTED-GENERATION))
;           (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                  :SNAPSHOT-STALE-IDENTITY))
;         (UNLESS (< ARCDOCDB.MVCC::SLOT (LENGTH #))
;           (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;            :SNAPSHOT-SLOT-RANGE))
;         (UNLESS
;             (= ARCDOCDB.MVCC::EXPECTED-GENERATION
;                (SB-THREAD:BARRIER #
;                  #))
;           (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                  :SNAPSHOT-STALE-IDENTITY))
;         (LET ((ARCDOCDB.MVCC::CSN #)
;               (ARCDOCDB.MVCC::CONTEXT-CSN #)
;               (ARCDOCDB.MVCC::STATE #)
;               (ARCDOCDB.MVCC::DEADLINE #)
;               (ARCDOCDB.MVCC::WAIT-DEADLINE #))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CSN
;             ARCDOCDB.MVCC::CONTEXT-CSN ARCDOCDB.MVCC::DEADLINE
;             ARCDOCDB.MVCC::WAIT-DEADLINE))
;           (SB-THREAD:BARRIER (:READ))
;           (UNLESS (AND # #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           (UNLESS (= ARCDOCDB.MVCC::CSN ARCDOCDB.MVCC::CONTEXT-CSN)
;             (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;              :SNAPSHOT-CSN-IDENTITY))
;           (COND (# # ARCDOCDB.MVCC::CSN) (# # #) (# #) (T #)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;         (ARCDOCDB.MVCC::CONTEXT ARCDOCDB.MVCC::EXPECTED-GENERATION
;          ARCDOCDB.MVCC::NOW)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-ARRAY CHARACTER
;          (269)) Pre: generazione originale, NOW fresco e base monotona comune; epoca già acquisita.
; Post: CSN solo se attivo e non scaduto; chiamare PRIMA e DOPO la ricerca, anche sul miss.
; Identità cambiata/fine/sca... {800687DB2F}>
;       (BLOCK ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;         (LET* ((ARCDOCDB.MVCC::REGISTRY #)
;                (ARCDOCDB.MVCC::WORD #)
;                (ARCDOCDB.MVCC::CONTEXT-GENERATION #)
;                (ARCDOCDB.MVCC::SLOT #))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CONTEXT-GENERATION))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           (UNLESS (AND # #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (UNLESS (< ARCDOCDB.MVCC::SLOT #)
;             (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;              :SNAPSHOT-SLOT-RANGE))
;           (UNLESS (= ARCDOCDB.MVCC::EXPECTED-GENERATION #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (LET (# # # # #)
;             (DECLARE #)
;             (SB-THREAD:BARRIER #)
;             (UNLESS # #)
;             (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;             (UNLESS # #)
;             (COND # # # #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from CSN to \"<return value>\"

; in: DEFUN SOGLIA-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC:SOGLIA-SNAPSHOT (ARCDOCDB.MVCC::REGISTRY)
;       \"Pre: registro sano. Post: soglia acquire, conservativa; MAX-U64 se nessuno la abbassa.
;   È un limite logico, non autorizza da sola il reclaim di un segmento referenziato da EBR.\"
;       (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;       (LET ((ARCDOCDB.MVCC::THRESHOLD
;              (SB-THREAD:BARRIER #
;                #)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::THRESHOLD))
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         ARCDOCDB.MVCC::THRESHOLD))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC:SOGLIA-SNAPSHOT
;         (ARCDOCDB.MVCC::REGISTRY)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: registro sano. Post: soglia acquire, conservativa; MAX-U64 se nessuno la abbassa.
; È un limite logico, non autorizza da sola il reclaim di un segmento referenziato da EBR.\"
;       (BLOCK ARCDOCDB.MVCC:SOGLIA-SNAPSHOT
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (LET ((ARCDOCDB.MVCC::THRESHOLD #))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::THRESHOLD))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           ARCDOCDB.MVCC::THRESHOLD)))
; 
; note: doing unsigned word to integer coercion (cost 20) from THRESHOLD to \"<return value>\"

; in: DEFUN LEGGI-REGISTRO-SNAPSHOT
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-MUTEX
;                             ARCDOCDB.MVCC::REGISTRY)
;                            :WAIT-P NIL)
;       (SETF ARCDOCDB.MVCC::ACQUIRED T)
;       (ARCDOCDB.MVCC::VERIFICA-CONTATORI-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;       (VALUES (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-COUNT ARCDOCDB.MVCC::REGISTRY)
;               (AREF
;                (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;                1)
;               (AREF
;                (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;                0)))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL (SETF ARCDOCDB.MVCC::ACQUIRED T)
;    (ARCDOCDB.MVCC::VERIFICA-CONTATORI-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;    (VALUES (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-COUNT ARCDOCDB.MVCC::REGISTRY)
;            (AREF
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY) 1)
;            (AREF
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;             0)))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/retire.lisp
; in: DEFUN PRENOTA-RITIRO
;     (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED ARCDOCDB.EPOCHS::REGISTRY)
;        (- ARCDOCDB.EPOCHS::+MAX-EPOCA+ ARCDOCDB.EPOCHS::EPOCH))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET* ((ARCDOCDB.EPOCHS::WORDS
;               (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY))
;              (ARCDOCDB.EPOCHS::CAPACITY (LENGTH #))
;              (LAST
;               (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-GENERATION+))
;              (ARCDOCDB.EPOCHS::EPOCH
;               (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 LAST ARCDOCDB.EPOCHS::EPOCH))
;         (WHEN
;             (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;                ARCDOCDB.EPOCHS::CAPACITY)
;           (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                  :RETIREMENT-CAPACITY))
;         (WHEN (OR (= LAST ARCDOCDB.EPOCHS::+MAX-EPOCA+) (= # #))
;           (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                  :RETIREMENT-SEQUENCE-EXHAUSTED))
;         (LET ((ARCDOCDB.EPOCHS::SLOT #)
;               (ARCDOCDB.EPOCHS::GENERATION #)
;               (ARCDOCDB.EPOCHS::COMPLETE NIL))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.EPOCHS::GENERATION))
;           (UNWIND-PROTECT (PROGN # # # # #)
;             (UNLESS ARCDOCDB.EPOCHS::COMPLETE #)))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET* ((ARCDOCDB.EPOCHS::WORDS
;            (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY))
;           (ARCDOCDB.EPOCHS::CAPACITY (LENGTH #))
;           (LAST
;            (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-GENERATION+))
;           (ARCDOCDB.EPOCHS::EPOCH
;            (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)))
;      (DECLARE (TYPE ARCDOCDB.BINARY:U64 LAST ARCDOCDB.EPOCHS::EPOCH))
;      (WHEN
;          (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;             ARCDOCDB.EPOCHS::CAPACITY)
;        (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;               :RETIREMENT-CAPACITY))
;      (WHEN (OR (= LAST ARCDOCDB.EPOCHS::+MAX-EPOCA+) (= # #))
;        (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;               :RETIREMENT-SEQUENCE-EXHAUSTED))
;      (LET ((ARCDOCDB.EPOCHS::SLOT #)
;            (ARCDOCDB.EPOCHS::GENERATION #)
;            (ARCDOCDB.EPOCHS::COMPLETE NIL))
;        (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.EPOCHS::GENERATION))
;        (UNWIND-PROTECT (PROGN # # # # #)
;          (UNLESS ARCDOCDB.EPOCHS::COMPLETE #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from GENERATION to \"<return value>\"

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/epochs/reclaim.lisp
; in: DEFUN AGGIORNA-SOGLIA-RECLAIM
;     (MAX (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;          ARCDOCDB.EPOCHS::MINIMUM)
; 
; note: doing unsigned word to integer coercion (cost 20) from MINIMUM to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN LEGGI-RITIRO
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET* ((ARCDOCDB.EPOCHS::SLOT
;               (ARCDOCDB.EPOCHS::ESIGI-IDENTITA-RITIRO ARCDOCDB.EPOCHS::TICKET
;                                                       ARCDOCDB.EPOCHS::EXPECTED-GENERATION))
;              (ARCDOCDB.EPOCHS::STATE (AREF # ARCDOCDB.EPOCHS::SLOT)))
;         (VALUES
;          (COND (# :RESERVED) (# :RETIRED) (# :CLAIMED) (# :CANCELLED)
;                (# :COMPLETED) (T #))
;          (AREF
;           (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-EPOCHS ARCDOCDB.EPOCHS::REGISTRY)
;           ARCDOCDB.EPOCHS::SLOT))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET* ((ARCDOCDB.EPOCHS::SLOT
;            (ARCDOCDB.EPOCHS::ESIGI-IDENTITA-RITIRO ARCDOCDB.EPOCHS::TICKET
;                                                    ARCDOCDB.EPOCHS::EXPECTED-GENERATION))
;           (ARCDOCDB.EPOCHS::STATE (AREF # ARCDOCDB.EPOCHS::SLOT)))
;      (VALUES
;       (COND (# :RESERVED) (# :RETIRED) (# :CLAIMED) (# :CANCELLED)
;             (# :COMPLETED) (T #))
;       (AREF (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-EPOCHS ARCDOCDB.EPOCHS::REGISTRY)
;             ARCDOCDB.EPOCHS::SLOT))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN LEGGI-REGISTRO-EPOCHE
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET ((ARCDOCDB.EPOCHS::WORDS
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY)))
;         (VALUES (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)
;                 (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;                 (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT
;                  ARCDOCDB.EPOCHS::REGISTRY)
;                 (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED
;                  ARCDOCDB.EPOCHS::REGISTRY))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET ((ARCDOCDB.EPOCHS::WORDS
;           (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY)))
;      (VALUES (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)
;              (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED
;               ARCDOCDB.EPOCHS::REGISTRY))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/read/task.lisp
; in: DEFUN ABBANDONA-LETTURA
;     (ARCDOCDB.READ::GUASTO-CONTESTO-LETTURA ARCDOCDB.READ::CONTEXT
;                                             :READ-CONTEXT-STATE)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/lookup.lisp
; in: DEFUN SCEGLI-CANDIDATO-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-PRIMARY-RESULT)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/target.lisp
; in: DEFUN SONDA-CACHE-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-RESULT)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/get/segment.lisp
; in: DEFUN INSERISCI-CACHE-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-INSERTION)
; 
; note: deleting unreachable code

; in: DEFUN LEGGI-RECORD-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-RESULT)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-radix.lisp
; in: DEFUN RADIX-ENTRY-STARTS
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :DECISION-RADIX-COUNT)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/decisions-query.lisp
; in: DEFUN PARTICIPANT-PRESENT-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :DECISION-PARTICIPANT-ORDER)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/recovery/inventory-build.lisp
; in: DEFUN INVENTORY-PRESENCE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-FORM)
; 
; note: deleting unreachable code

; in: DEFUN SINGLE-FILE-ACTION
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-STATE)
; 
; note: deleting unreachable code

; in: DEFUN INVENTORY-ENTRY
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-PRESENCE)
; 
; note: deleting unreachable code

; in: DEFUN ENTRY-SEVERITY
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-STATE)
; 
; note: deleting unreachable code
; 
; compilation unit finished
;   printed 169 notes

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/hash/support.lisp
; in: DEFUN RUN
;     (LENGTH ARCDOCDB.HASH64.TESTS::*TESTS*)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (FUNCALL ARCDOCDB.HASH64.TESTS::TEST)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   TEST is not known to be a function

; in: DEFUN HASH-COLD-VALUES
;     (FUNCALL (ARCDOCDB.HASH64.TESTS::HASH-ENTRY-POINT)
;              ARCDOCDB.HASH64.TESTS::BUFFER ARCDOCDB.HASH64.TESTS::START
;              ARCDOCDB.HASH64.TESTS::END ARCDOCDB.HASH64.TESTS::SEED-HIGH
;              ARCDOCDB.HASH64.TESTS::SEED-LOW)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   callable expression is not known to be a function

; in: DEFUN HASH-CHECK-VALUES
;     (LENGTH ARCDOCDB.HASH64.TESTS::ACTUAL)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

; in: DEFUN HASH-SNAPSHOT
;     (ARRAY-ELEMENT-TYPE ARCDOCDB.HASH64.TESTS::OBJECT)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a ARRAY, not a SIMPLE-ARRAY.

;     (ROW-MAJOR-AREF ARCDOCDB.HASH64.TESTS::OBJECT ARCDOCDB.HASH64.TESTS::I)
; 
; note: unable to
;   avoid runtime dispatch on array element type
; because:
;   Upgraded element type of array is not known at compile time.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a ARRAY, not a SIMPLE-ARRAY.

;     (AREF ARCDOCDB.HASH64.TESTS::CELLS ARCDOCDB.HASH64.TESTS::I)
; --> FUNCALL 
; ==>
;   1
; 
; note: unable to
;   optimize
; because:
;   Upgraded element type of array is not known at compile time.
; 
; note: unable to
;   avoid runtime dispatch on array element type
; because:
;   Upgraded element type of array is not known at compile time.

; in: DEFUN HASH-REJECT
;     (FUNCALL ARCDOCDB.HASH64.TESTS::CALLER ARCDOCDB.HASH64.TESTS::BUFFER
;              ARCDOCDB.HASH64.TESTS::START ARCDOCDB.HASH64.TESTS::END
;              ARCDOCDB.HASH64.TESTS::SEED-HIGH ARCDOCDB.HASH64.TESTS::SEED-LOW)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   CALLER is not known to be a function

; in: DEFUN HASH-FIXTURE
;     (LENGTH ARCDOCDB.HASH64.TESTS::CONTENTS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (+ ARCDOCDB.HASH64.TESTS::PREFIX (LENGTH ARCDOCDB.HASH64.TESTS::CONTENTS))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (+ ARCDOCDB.HASH64.TESTS::END ARCDOCDB.HASH64.TESTS::SUFFIX)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (REPLACE ARCDOCDB.HASH64.TESTS::BUFFER ARCDOCDB.HASH64.TESTS::CONTENTS
;              :START1 ARCDOCDB.HASH64.TESTS::PREFIX)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a SEQUENCE, not a (OR NULL (SIMPLE-ARRAY * (*))).
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a SEQUENCE, not a LIST.

;     (+ ARCDOCDB.HASH64.TESTS::PREFIX (LENGTH ARCDOCDB.HASH64.TESTS::CONTENTS))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (+ ARCDOCDB.HASH64.TESTS::END ARCDOCDB.HASH64.TESTS::SUFFIX)
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a SINGLE-FLOAT.
;       The second argument is a T, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

; in: DEFUN HASH-CORPUS-BYTES
;     (MAKE-ARRAY ARCDOCDB.HASH64.TESTS::SIZE :ELEMENT-TYPE '(UNSIGNED-BYTE 8))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR LIST (UNSIGNED-BYTE 45)), not a (OR INTEGER
;                                                                   (CONS INTEGER
;                                                                         NULL)).

;     (* ARCDOCDB.HASH64.TESTS::STATE 1664525)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (+ (* ARCDOCDB.HASH64.TESTS::STATE 1664525) 1013904223)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (MOD (+ (* ARCDOCDB.HASH64.TESTS::STATE 1664525) 1013904223) 4294967296)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.
; 
; note: unable to
;   convert division by 2^k to shift
; due to type uncertainty:
;   The first argument is a REAL, not a INTEGER.

;     (FLOOR ARCDOCDB.HASH64.TESTS::STATE 16777216)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0 (4294967296))), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0 (4294967296))), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 0 (4294967296))), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 0 (4294967296))), not a RATIONAL.
; 
; note: unable to
;   convert division by 2^k to shift
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 0 (4294967296))), not a INTEGER.

;     (* ARCDOCDB.HASH64.TESTS::STATE 1664525)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ (* ARCDOCDB.HASH64.TESTS::STATE 1664525) 1013904223)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

; in: DEFUN HASH-U64-MOD
;     (MOD INTEGER 18446744073709551616)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.
; 
; note: unable to
;   convert division by 2^k to shift
; due to type uncertainty:
;   The first argument is a REAL, not a INTEGER.

; in: DEFUN HASH-REFERENCE-ROTATE
;     (- 64 COUNT)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a NUMBER, not a RATIONAL.

;     (EXPT 2 (- 64 COUNT))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a NUMBER, not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a NUMBER, not a UNSIGNED-BYTE.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a NUMBER, not a INTEGER.

;     (MOD ARCDOCDB.HASH64.TESTS::WORD ARCDOCDB.HASH64.TESTS::FACTOR)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a SINGLE-FLOAT.
;   The second argument is a (OR (FLOAT 0.0) RATIONAL), not a (OR SINGLE-FLOAT
;                                                                 INTEGER).
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a DOUBLE-FLOAT.
;   The second argument is a (OR (FLOAT 0.0) RATIONAL), not a (OR FLOAT INTEGER).
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a INTEGER.
;   The second argument is a (OR (FLOAT 0.0) RATIONAL), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a RATIONAL.
;   The second argument is a (OR (FLOAT 0.0) RATIONAL), not a RATIONAL.

;     (EXPT 2 COUNT)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a NUMBER, not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a NUMBER, not a UNSIGNED-BYTE.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a NUMBER, not a INTEGER.

;     (FLOOR ARCDOCDB.HASH64.TESTS::WORD ARCDOCDB.HASH64.TESTS::FACTOR)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a SINGLE-FLOAT.
;   The second argument is a (OR (FLOAT 0.0) RATIONAL), not a (OR SINGLE-FLOAT
;                                                                 INTEGER).
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a DOUBLE-FLOAT.
;   The second argument is a (OR (FLOAT 0.0) RATIONAL), not a (OR FLOAT INTEGER).
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a INTEGER.
;   The second argument is a (OR (FLOAT 0.0) RATIONAL), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a RATIONAL.
;   The second argument is a (OR (FLOAT 0.0) RATIONAL), not a RATIONAL.

;     (+
;      (* (MOD ARCDOCDB.HASH64.TESTS::WORD ARCDOCDB.HASH64.TESTS::FACTOR)
;         (EXPT 2 COUNT))
;      (FLOOR ARCDOCDB.HASH64.TESTS::WORD ARCDOCDB.HASH64.TESTS::FACTOR))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD INTEGER)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (- 64 COUNT)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (* (MOD ARCDOCDB.HASH64.TESTS::WORD ARCDOCDB.HASH64.TESTS::FACTOR)
;        (EXPT 2 COUNT))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The second argument is a (OR COMPLEX (FLOAT 0.0) RATIONAL), not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The second argument is a (OR COMPLEX (FLOAT 0.0) RATIONAL), not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+
;      (* (MOD ARCDOCDB.HASH64.TESTS::WORD ARCDOCDB.HASH64.TESTS::FACTOR)
;         (EXPT 2 COUNT))
;      (FLOOR ARCDOCDB.HASH64.TESTS::WORD ARCDOCDB.HASH64.TESTS::FACTOR))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

; in: DEFUN HASH-REFERENCE-LANE
;     (+ ARCDOCDB.HASH64.TESTS::START ARCDOCDB.HASH64.TESTS::I)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (AREF ARCDOCDB.HASH64.TESTS::BUFFER
;           (+ ARCDOCDB.HASH64.TESTS::START ARCDOCDB.HASH64.TESTS::I))
; 
; note: unable to
;   avoid runtime dispatch on array element type
; because:
;   Upgraded element type of array is not known at compile time.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a VECTOR, not a SIMPLE-ARRAY.

;     (LOOP ARCDOCDB.HASH64.TESTS::FOR ARCDOCDB.HASH64.TESTS::I ARCDOCDB.HASH64.TESTS::BELOW ARCDOCDB.HASH64.TESTS::WIDTH
;           ARCDOCDB.HASH64.TESTS::SUM (*
;                                       (AREF ARCDOCDB.HASH64.TESTS::BUFFER
;                                             (+ ARCDOCDB.HASH64.TESTS::START
;                                                ARCDOCDB.HASH64.TESTS::I))
;                                       (EXPT 256 ARCDOCDB.HASH64.TESTS::I)))
; --> LET SB-LOOP::WITH-SUM-COUNT LET TAGBODY SETQ THE 
; ==>
;   (+ #:SUM1
;      (*
;       (AREF ARCDOCDB.HASH64.TESTS::BUFFER
;             (+ ARCDOCDB.HASH64.TESTS::START ARCDOCDB.HASH64.TESTS::I))
;       (EXPT 256 ARCDOCDB.HASH64.TESTS::I)))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (+ ARCDOCDB.HASH64.TESTS::START ARCDOCDB.HASH64.TESTS::I)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (EXPT 256 ARCDOCDB.HASH64.TESTS::I)
; 
; note: forced to do full call
;       unable to do inline ASH (cost 1) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER 0 0) (INTEGER 8)) &OPTIONAL), not a (VALUES
;                                                                                 FIXNUM
;                                                                                 &OPTIONAL).
;       unable to do inline ASH (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER 0 0) (INTEGER 8)) &OPTIONAL), not a (VALUES
;                                                                                 FIXNUM
;                                                                                 &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline ASH (cost 2) because:
;       The second argument is a (OR (INTEGER 0 0) (INTEGER 8)), not a (UNSIGNED-BYTE
;                                                                       64).
;       The result is a (VALUES (OR (INTEGER 1 1) (INTEGER 256)) &OPTIONAL), not a (VALUES
;                                                                                   FIXNUM
;                                                                                   &OPTIONAL).
;       unable to do inline ASH (cost 3) because:
;       The second argument is a (OR (INTEGER 0 0) (INTEGER 8)), not a (UNSIGNED-BYTE
;                                                                       64).
;       The result is a (VALUES (OR (INTEGER 1 1) (INTEGER 256)) &OPTIONAL), not a (VALUES
;                                                                                   (UNSIGNED-BYTE
;                                                                                    64)
;                                                                                   &OPTIONAL).
;       etc.

;     (*
;      (AREF ARCDOCDB.HASH64.TESTS::BUFFER
;            (+ ARCDOCDB.HASH64.TESTS::START ARCDOCDB.HASH64.TESTS::I))
;      (EXPT 256 ARCDOCDB.HASH64.TESTS::I))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a (OR (INTEGER 1 1) (INTEGER 256)), not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a (OR (INTEGER 1 1) (INTEGER 256)), not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (LOOP ARCDOCDB.HASH64.TESTS::FOR ARCDOCDB.HASH64.TESTS::I ARCDOCDB.HASH64.TESTS::BELOW ARCDOCDB.HASH64.TESTS::WIDTH
;           ARCDOCDB.HASH64.TESTS::SUM (*
;                                       (AREF ARCDOCDB.HASH64.TESTS::BUFFER
;                                             (+ ARCDOCDB.HASH64.TESTS::START
;                                                ARCDOCDB.HASH64.TESTS::I))
;                                       (EXPT 256 ARCDOCDB.HASH64.TESTS::I)))
; --> LET SB-LOOP::WITH-SUM-COUNT LET TAGBODY SETQ THE 
; ==>
;   (+ #:SUM1
;      (*
;       (AREF ARCDOCDB.HASH64.TESTS::BUFFER
;             (+ ARCDOCDB.HASH64.TESTS::START ARCDOCDB.HASH64.TESTS::I))
;       (EXPT 256 ARCDOCDB.HASH64.TESTS::I)))
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

; --> LET SB-LOOP::WITH-SUM-COUNT LET TAGBODY SB-LOOP::LOOP-DESETQ SETQ THE 1+ 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFUN HASH-REFERENCE
;     (* ARCDOCDB.HASH64.TESTS::SEED-HIGH 4294967296)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (+ (* ARCDOCDB.HASH64.TESTS::SEED-HIGH 4294967296)
;        ARCDOCDB.HASH64.TESTS::SEED-LOW)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (- ARCDOCDB.HASH64.TESTS::END ARCDOCDB.HASH64.TESTS::START)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (< ARCDOCDB.HASH64.TESTS::SIZE 32)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P5)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P1
;        ARCDOCDB.HASH64.TESTS::P2)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P2)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (- ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P1)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (+ POSITION 32)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (<= (+ POSITION 32) ARCDOCDB.HASH64.TESTS::END)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
;   The second argument is a REAL, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
;   The second argument is a REAL, not a RATIONAL.

;     (INCF POSITION 32)
; ==>
;   (+ 32 POSITION)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.

;     (+ POSITION (* ARCDOCDB.HASH64.TESTS::LANE 8))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.

;     (LOOP ARCDOCDB.HASH64.TESTS::FOR ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::ACROSS ARCDOCDB.HASH64.TESTS::LANES
;           ARCDOCDB.HASH64.TESTS::FOR ARCDOCDB.HASH64.TESTS::ROTATION ARCDOCDB.HASH64.TESTS::IN '(1
;                                                                                                  7
;                                                                                                  12
;                                                                                                  18)
;           ARCDOCDB.HASH64.TESTS::SUM (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;                                       ARCDOCDB.HASH64.TESTS::LANE
;                                       ARCDOCDB.HASH64.TESTS::ROTATION))
; --> LET MULTIPLE-VALUE-BIND MULTIPLE-VALUE-CALL FUNCTION MULTIPLE-VALUE-PROG1 
; --> PROGN LET LET SB-LOOP::WITH-SUM-COUNT LET TAGBODY SETQ THE 
; ==>
;   (+ #:SUM10
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE ARCDOCDB.HASH64.TESTS::LANE
;       ARCDOCDB.HASH64.TESTS::ROTATION))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (+ ARCDOCDB.HASH64.TESTS::ACCUMULATOR ARCDOCDB.HASH64.TESTS::SIZE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a RATIONAL.
;   The second argument is a REAL, not a RATIONAL.

;     (+ POSITION 8)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (<= (+ POSITION 8) ARCDOCDB.HASH64.TESTS::END)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
;   The second argument is a REAL, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
;   The second argument is a REAL, not a RATIONAL.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0
;                (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-LANE
;                 ARCDOCDB.HASH64.TESTS::BUFFER POSITION 8)))
;       27)
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (+
;      (*
;       (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;        (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;                (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0 #))
;        27)
;       ARCDOCDB.HASH64.TESTS::P1)
;      ARCDOCDB.HASH64.TESTS::P4)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (INCF POSITION 8)
; ==>
;   (+ 8 POSITION)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.

;     (+ POSITION 4)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.

;     (<= (+ POSITION 4) ARCDOCDB.HASH64.TESTS::END)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
;   The second argument is a REAL, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
;   The second argument is a REAL, not a RATIONAL.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-LANE ARCDOCDB.HASH64.TESTS::BUFFER
;       POSITION 4)
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;                (* # ARCDOCDB.HASH64.TESTS::P1)))
;       23)
;      ARCDOCDB.HASH64.TESTS::P2)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (+
;      (*
;       (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;        (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;                (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD #))
;        23)
;       ARCDOCDB.HASH64.TESTS::P2)
;      ARCDOCDB.HASH64.TESTS::P3)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (INCF POSITION 4)
; ==>
;   (+ 4 POSITION)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.

;     (< POSITION ARCDOCDB.HASH64.TESTS::END)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
;   The second argument is a REAL, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
;   The second argument is a REAL, not a RATIONAL.

;     (AREF ARCDOCDB.HASH64.TESTS::BUFFER POSITION)
; 
; note: unable to
;   avoid runtime dispatch on array element type
; because:
;   Upgraded element type of array is not known at compile time.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a VECTOR, not a SIMPLE-ARRAY.

;     (* (AREF ARCDOCDB.HASH64.TESTS::BUFFER POSITION) ARCDOCDB.HASH64.TESTS::P5)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;                (* # ARCDOCDB.HASH64.TESTS::P5)))
;       11)
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR (EXPT 2 33))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a RATIONAL.
; 
; note: unable to
;   convert division by 2^k to shift
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a INTEGER.

;     (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR (EXPT 2 29))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a RATIONAL.
; 
; note: unable to
;   convert division by 2^k to shift
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a INTEGER.

;     (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR 4294967296)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a RATIONAL.
; 
; note: unable to
;   convert division by 2^k to shift
; due to type uncertainty:
;   The first argument is a (OR FLOAT
;                               (RATIONAL 0
;                                         (18446744073709551616))), not a INTEGER.

;     (* ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::P2)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (+ ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;        (* ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::P2))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;       (+ ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;          (* ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::P2))
;       31)
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (* ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::P2)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (+ ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;        (* ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::P2))
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;       (+ ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;          (* ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::P2))
;       31)
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (*
;       (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;        (+ ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;           (* ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::P2))
;        31)
;       ARCDOCDB.HASH64.TESTS::P1))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (*
;      (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;              (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0 ARCDOCDB.HASH64.TESTS::LANE))
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: forced to do */UNSIGNED=>INTEGER (cost 20)
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 11400714785074694791
;                             210306067897629490586067351327586137465))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).

;     (+
;      (*
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0 ARCDOCDB.HASH64.TESTS::LANE))
;       ARCDOCDB.HASH64.TESTS::P1)
;      ARCDOCDB.HASH64.TESTS::P4)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR (INTEGER 0 0)
;                                   (INTEGER 11400714785074694791
;                                    210306067897629490586067351327586137465)), not a (UNSIGNED-BYTE
;                                                                                      64).
;       The result is a (VALUES
;                        (OR (INTEGER 9650029242287828579 9650029242287828579)
;                            (INTEGER 21050744027362523370
;                             210306067897629490595717380569873966044))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (+
;       (*
;        (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;                (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0 ARCDOCDB.HASH64.TESTS::LANE))
;        ARCDOCDB.HASH64.TESTS::P1)
;       ARCDOCDB.HASH64.TESTS::P4))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (* ARCDOCDB.HASH64.TESTS::SEED-HIGH 4294967296)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ (* ARCDOCDB.HASH64.TESTS::SEED-HIGH 4294967296)
;        ARCDOCDB.HASH64.TESTS::SEED-LOW)
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a SINGLE-FLOAT.
;       The second argument is a T, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (- ARCDOCDB.HASH64.TESTS::END ARCDOCDB.HASH64.TESTS::START)
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a T, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (< ARCDOCDB.HASH64.TESTS::SIZE 32)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P1
;        ARCDOCDB.HASH64.TESTS::P2)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P1
;         ARCDOCDB.HASH64.TESTS::P2))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P2)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P2))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (- ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P1)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (- ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P1))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ POSITION 32)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (<= (+ POSITION 32) ARCDOCDB.HASH64.TESTS::END)
; 
; note: forced to do full call
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a NUMBER, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a NUMBER, not a DOUBLE-FLOAT.
;       The second argument is a NUMBER, not a DOUBLE-FLOAT.

;     (+ POSITION (* ARCDOCDB.HASH64.TESTS::LANE 8))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a REAL, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF POSITION 32)
; ==>
;   (+ 32 POSITION)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a REAL, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (LOOP ARCDOCDB.HASH64.TESTS::FOR ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::ACROSS ARCDOCDB.HASH64.TESTS::LANES
;           ARCDOCDB.HASH64.TESTS::FOR ARCDOCDB.HASH64.TESTS::ROTATION ARCDOCDB.HASH64.TESTS::IN '(1
;                                                                                                  7
;                                                                                                  12
;                                                                                                  18)
;           ARCDOCDB.HASH64.TESTS::SUM (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;                                       ARCDOCDB.HASH64.TESTS::LANE
;                                       ARCDOCDB.HASH64.TESTS::ROTATION))
; --> LET MULTIPLE-VALUE-BIND MULTIPLE-VALUE-CALL FUNCTION MULTIPLE-VALUE-PROG1 
; --> PROGN LET LET SB-LOOP::WITH-SUM-COUNT LET TAGBODY SETQ THE 
; ==>
;   (+ #:SUM10
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE ARCDOCDB.HASH64.TESTS::LANE
;       ARCDOCDB.HASH64.TESTS::ROTATION))
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (LOOP ARCDOCDB.HASH64.TESTS::FOR ARCDOCDB.HASH64.TESTS::LANE ARCDOCDB.HASH64.TESTS::ACROSS ARCDOCDB.HASH64.TESTS::LANES
;            ARCDOCDB.HASH64.TESTS::FOR ARCDOCDB.HASH64.TESTS::ROTATION ARCDOCDB.HASH64.TESTS::IN '(1
;                                                                                                   7
;                                                                                                   12
;                                                                                                   18)
;            ARCDOCDB.HASH64.TESTS::SUM (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;                                        ARCDOCDB.HASH64.TESTS::LANE
;                                        ARCDOCDB.HASH64.TESTS::ROTATION)))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P5)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (+ ARCDOCDB.HASH64.TESTS::SEED ARCDOCDB.HASH64.TESTS::P5))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ ARCDOCDB.HASH64.TESTS::ACCUMULATOR ARCDOCDB.HASH64.TESTS::SIZE)
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 (18446744073709551616))), not a SINGLE-FLOAT.
;       The second argument is a REAL, not a SINGLE-FLOAT.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                              &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 (18446744073709551616))), not a FIXNUM.
;       The second argument is a REAL, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (+ ARCDOCDB.HASH64.TESTS::ACCUMULATOR ARCDOCDB.HASH64.TESTS::SIZE))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ POSITION 8)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (<= (+ POSITION 8) ARCDOCDB.HASH64.TESTS::END)
; 
; note: forced to do full call
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a NUMBER, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a NUMBER, not a DOUBLE-FLOAT.
;       The second argument is a NUMBER, not a DOUBLE-FLOAT.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0
;                (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-LANE
;                 ARCDOCDB.HASH64.TESTS::BUFFER POSITION 8)))
;       27)
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (+
;      (*
;       (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;        (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;                (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0 #))
;        27)
;       ARCDOCDB.HASH64.TESTS::P1)
;      ARCDOCDB.HASH64.TESTS::P4)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (+
;       (*
;        (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;         (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR #) 27)
;        ARCDOCDB.HASH64.TESTS::P1)
;       ARCDOCDB.HASH64.TESTS::P4))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (INCF POSITION 8)
; ==>
;   (+ 8 POSITION)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a REAL, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (+ POSITION 4)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a REAL, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (<= (+ POSITION 4) ARCDOCDB.HASH64.TESTS::END)
; 
; note: forced to do full call
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a REAL, not a SINGLE-FLOAT.
;       The second argument is a REAL, not a SINGLE-FLOAT.
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a REAL, not a DOUBLE-FLOAT.
;       The second argument is a REAL, not a DOUBLE-FLOAT.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-LANE ARCDOCDB.HASH64.TESTS::BUFFER
;       POSITION 4)
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (*
;       (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-LANE ARCDOCDB.HASH64.TESTS::BUFFER
;        POSITION 4)
;       ARCDOCDB.HASH64.TESTS::P1))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;                (* # ARCDOCDB.HASH64.TESTS::P1)))
;       23)
;      ARCDOCDB.HASH64.TESTS::P2)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (+
;      (*
;       (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;        (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;                (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD #))
;        23)
;       ARCDOCDB.HASH64.TESTS::P2)
;      ARCDOCDB.HASH64.TESTS::P3)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (+
;       (*
;        (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;         (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR #) 23)
;        ARCDOCDB.HASH64.TESTS::P2)
;       ARCDOCDB.HASH64.TESTS::P3))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (INCF POSITION 4)
; ==>
;   (+ 4 POSITION)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a REAL, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (< POSITION ARCDOCDB.HASH64.TESTS::END)
; 
; note: forced to do full call
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a REAL, not a SINGLE-FLOAT.
;       The second argument is a REAL, not a SINGLE-FLOAT.
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a REAL, not a DOUBLE-FLOAT.
;       The second argument is a REAL, not a DOUBLE-FLOAT.
;       etc.

;     (* (AREF ARCDOCDB.HASH64.TESTS::BUFFER POSITION) ARCDOCDB.HASH64.TESTS::P5)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (* (AREF ARCDOCDB.HASH64.TESTS::BUFFER POSITION) ARCDOCDB.HASH64.TESTS::P5))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (*
;      (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;                (* # ARCDOCDB.HASH64.TESTS::P5)))
;       11)
;      ARCDOCDB.HASH64.TESTS::P1)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (*
;       (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;        (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;                (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD #))
;        11)
;       ARCDOCDB.HASH64.TESTS::P1))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;             (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR (EXPT 2 33)))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 (18446744073709551616))), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 (18446744073709551616))), not a (UNSIGNED-BYTE
;                                                                                      64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (*
;      (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;              (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR (EXPT 2 33)))
;      ARCDOCDB.HASH64.TESTS::P2)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (OR (INTEGER * -14029467366897019727) (INTEGER 0 0)
;                            (INTEGER 14029467366897019727))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (*
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR (EXPT 2 33)))
;       ARCDOCDB.HASH64.TESTS::P2))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;             (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR (EXPT 2 29)))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 (18446744073709551616))), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 (18446744073709551616))), not a (UNSIGNED-BYTE
;                                                                                      64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (*
;      (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;              (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR (EXPT 2 29)))
;      ARCDOCDB.HASH64.TESTS::P3)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER * -1609587929392839161) (INTEGER 0 0)
;                            (INTEGER 1609587929392839161))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER * -1609587929392839161) (INTEGER 0 0)
;                            (INTEGER 1609587929392839161))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;      (*
;       (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;               (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR (EXPT 2 29)))
;       ARCDOCDB.HASH64.TESTS::P3))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a RATIONAL, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a RATIONAL, not a (UNSIGNED-BYTE 64).
;       etc.

;     (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;             (FLOOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR 4294967296))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 (18446744073709551616))), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 (18446744073709551616))), not a (UNSIGNED-BYTE
;                                                                                      64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (MOD ARCDOCDB.HASH64.TESTS::ACCUMULATOR 4294967296)
; 
; note: forced to do LOGAND-WORD-MASK/INTEGER-UNSIGNED-C (cost 10)
;       unable to do inline fixnum arithmetic (cost 1) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       etc.

;     (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;      (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;              (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0
;               (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-LANE
;                ARCDOCDB.HASH64.TESTS::BUFFER POSITION 8)))
;      27)
; 
; note: doing unsigned word to integer coercion (cost 20)

;     (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;      (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;              (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;               (* (AREF ARCDOCDB.HASH64.TESTS::BUFFER POSITION)
;                  ARCDOCDB.HASH64.TESTS::P5)))
;      11)
; 
; note: doing unsigned word to integer coercion (cost 20)

;     (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-ROTATE
;      (LOGXOR ARCDOCDB.HASH64.TESTS::ACCUMULATOR
;              (ARCDOCDB.HASH64.TESTS::HASH-U64-MOD
;               (*
;                (ARCDOCDB.HASH64.TESTS::HASH-REFERENCE-LANE
;                 ARCDOCDB.HASH64.TESTS::BUFFER POSITION 4)
;                ARCDOCDB.HASH64.TESTS::P1)))
;      23)
; 
; note: doing unsigned word to integer coercion (cost 20)

;     (ARCDOCDB.HASH64.TESTS::ROUND-LANE 0 ARCDOCDB.HASH64.TESTS::LANE)
; 
; note: doing unsigned word to integer coercion (cost 20)
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN HASH-CHECK-OFFSET-MATRIX
;     (LENGTH ARCDOCDB.HASH64.TESTS::CONTENTS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (INCF ARCDOCDB.HASH64.TESTS::CASES)
; ==>
;   (+ 1 ARCDOCDB.HASH64.TESTS::CASES)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/read/lifecycle.lisp
; in: DEFTEST TEST-REQ-CMP-007-READ-EXTERNAL-ERROR-THROW-CLEANUP
;     (SETF ARCDOCDB.READ.TESTS::AUTHORIZED T)
; 
; note: deleting unreachable code
; 
; note: deleting unreachable code
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/execution/handoff.lisp
; in: DEFTEST TEST-REQ-CON-001-HANDOFF-SEEDED-LIST-AND-SCHEDULING-ORACLE
;     (ERROR \"Operazione dell'oracolo inattesa.\")
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/wal/csn.lisp
; in: DEFUN WAL-CSN-OPEN
;     (ERROR \"Tipo inatteso nella fixture WAL/CSN.\")
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/slots.lisp
; in:
;      DEFTEST TEST-REQ-AFF-004-SLOT-WRITER-ODD-AND-THRESHOLD-SEQUENCES-FAULT
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :SLOT-TEST-OPERATION)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/slot-threads.lisp
; in: DEFUN SLOT-OBSERVE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :SLOT-TEST-READ-STATUS)
; 
; note: deleting unreachable code

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary-support.lisp
; in: DEFUN RUN
;     (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::*TESTS*)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (FUNCALL ARCDOCDB.INDEX.PRIMARY.TESTS::TEST)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   TEST is not known to be a function

; in: DEFUN PRIMARY-PAYLOAD
;     (ASH (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY) 32)
; 
; note: forced to do */SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 4294967296 151115727451824351870976))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 4294967296 151115727451824351870976))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (LOGIOR ARCDOCDB.INDEX.PRIMARY.TESTS::OFFSET
;             (ASH (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY) 32) (ASH 1 48))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (OR (INTEGER 0 0)
;                                    (INTEGER 4294967296
;                                     151115727451824351870976)), not a FIXNUM.
;       The result is a (VALUES (UNSIGNED-BYTE 77) &OPTIONAL), not a (VALUES
;                                                                     FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The second argument is a (OR (INTEGER 0 0)
;                                    (INTEGER 4294967296
;                                     151115727451824351870976)), not a (UNSIGNED-BYTE
;                                                                        64).
;       The result is a (VALUES (UNSIGNED-BYTE 77) &OPTIONAL), not a (VALUES
;                                                                     (UNSIGNED-BYTE
;                                                                      64)
;                                                                     &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 77), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER 281474976710656 151115727451828646838271)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (UNSIGNED-BYTE 77), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER 281474976710656 151115727451828646838271)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (+ ARCDOCDB.RECORD:+HEADER-BYTES+ (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY)
;        ARCDOCDB.INDEX.PRIMARY.TESTS::EXTRA)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (ASH (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY) 32)
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of */SIGNED=>S128

; in: DEFUN PRIMARY-CURRENT
;     (ARCDOCDB.INDEX.PRIMARY:FRAMMENTO-CORRENTE-INDICE
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGH)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:FRAMMENTO-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:FRAMMENTO-INDICE &OPTIONAL).

; in: DEFUN PRIMARY-READ
;     (ARCDOCDB.INDEX.PRIMARY:LEGGI-INDICE-PRIMARIO
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::KEY 0
;      (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGH ARCDOCDB.INDEX.PRIMARY.TESTS::LOW
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-READER
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-OUTPUT
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (MEMBER :RETRY-LIMIT :ABSENT :LIVE) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (MEMBER :RETRY-LIMIT :ABSENT :LIVE) &OPTIONAL).

; in: DEFUN PRIMARY-DELETE
;     (ARCDOCDB.INDEX.PRIMARY:RIMUOVI-CHIAVE-INDICE
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-CURRENT
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGH)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::KEY 0
;      (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGH ARCDOCDB.INDEX.PRIMARY.TESTS::LOW
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-WRITER
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in: DEFUN PRIMARY-REFUSAL
;     (TYPEP CONDITION TYPE)
; 
; note: unable to optimize because: can't open-code test of non-constant type

; in: DEFUN PRIMARY-CANDIDATE
;     (ARCDOCDB.INDEX.PRIMARY:CREA-FRAMMENTO-INDICE
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      :DEPTH ARCDOCDB.INDEX.PRIMARY.TESTS::DEPTH :PREFIX
;      ARCDOCDB.INDEX.PRIMARY.TESTS::PREFIX :ARENA-BYTES
;      ARCDOCDB.INDEX.PRIMARY.TESTS::ARENA-BYTES)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:FRAMMENTO-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:FRAMMENTO-INDICE &OPTIONAL).

; in: DEFUN PRIMARY-COPY-LIVE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;      (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE 0)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGH ARCDOCDB.INDEX.PRIMARY.TESTS::LOW
;      :FRAGMENT ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE :SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN PRIMARY-ROOT-BYTES
;     (+ (* 8 (LENGTH DIRECTORY))
;        (LOOP ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT ARCDOCDB.INDEX.PRIMARY.TESTS::IN ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENTS
;              ARCDOCDB.INDEX.PRIMARY.TESTS::SUM (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FRAGMENT-BYTES
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT)))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a NUMBER, not a RATIONAL.

;     (LOOP ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT ARCDOCDB.INDEX.PRIMARY.TESTS::IN ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENTS
;           ARCDOCDB.INDEX.PRIMARY.TESTS::SUM (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FRAGMENT-BYTES
;                                              ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT))
; --> LET SB-LOOP::WITH-SUM-COUNT LET TAGBODY SETQ THE 
; ==>
;   (+ #:SUM1
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FRAGMENT-BYTES
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (+ (* 8 (LENGTH DIRECTORY))
;        (LOOP ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT ARCDOCDB.INDEX.PRIMARY.TESTS::IN ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENTS
;              ARCDOCDB.INDEX.PRIMARY.TESTS::SUM (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FRAGMENT-BYTES
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT)))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (LOOP ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT ARCDOCDB.INDEX.PRIMARY.TESTS::IN ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENTS
;           ARCDOCDB.INDEX.PRIMARY.TESTS::SUM (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FRAGMENT-BYTES
;                                              ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT))
; --> LET SB-LOOP::WITH-SUM-COUNT LET TAGBODY SETQ THE 
; ==>
;   (+ #:SUM1
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FRAGMENT-BYTES
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

; in: DEFUN PRIMARY-PLAN-BUDGET
;     (+
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-ROOT-BYTES
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FRAGMENT-BYTES FIRST)
;      (IF SECOND
;          (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FRAGMENT-BYTES SECOND)
;          0)
;      (* 8 (ASH 1 ARCDOCDB.INDEX.PRIMARY.TESTS::DEPTH)))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFUN PRIMARY-PLAN
;     (ARCDOCDB.INDEX.PRIMARY:PREPARA-DIRECTORY-INDICE
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE FIRST
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PLAN-BUDGET
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE FIRST SECOND)
;      SECOND)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &OPTIONAL).

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary.lisp
; in: DEFTEST TEST-REQ-AFF-003-PRIMARY-HARNESS-AND-EMPTY-ROOT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-KEY 0) 0 0 :ABSENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in: DEFTEST TEST-REQ-IDX-001-PRIMARY-BINARY-COLLISIONS-AND-SPAN
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-CHECK-PAYLOAD
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-OUTPUT
;       ARCDOCDB.INDEX.PRIMARY.TESTS::F)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::PAYLOAD 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (LOOP ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::KEY ARCDOCDB.INDEX.PRIMARY.TESTS::IN ARCDOCDB.INDEX.PRIMARY.TESTS::KEYS
;           ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::CSN ARCDOCDB.INDEX.PRIMARY.TESTS::FROM 1
;           ARCDOCDB.INDEX.PRIMARY.TESTS::COLLECT (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;                                                  0 5))
; --> LET LET SB-LOOP::WITH-LOOP-LIST-COLLECTION-HEAD LET* TAGBODY 
; --> SB-LOOP::LOOP-DESETQ SETQ THE 1+ 
; ==>
;   1
; 
; note: forced to do +/UNSIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1 18446744073709551615), not a FIXNUM.
;       The result is a (VALUES (INTEGER 2 18446744073709551616) &OPTIONAL), not a (VALUES
;                                                                                   FIXNUM
;                                                                                   &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The result is a (VALUES (INTEGER 2 18446744073709551616) &OPTIONAL), not a (VALUES
;                                                                                   (UNSIGNED-BYTE
;                                                                                    64)
;                                                                                   &OPTIONAL).
;       etc.

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;                                                0 5)
; 
; note: doing signed 128 to integer coercion (cost 30) from CSN to #:G21

;     (LOOP ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::KEY ARCDOCDB.INDEX.PRIMARY.TESTS::IN ARCDOCDB.INDEX.PRIMARY.TESTS::KEYS
;           ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::CSN ARCDOCDB.INDEX.PRIMARY.TESTS::FROM 1
;           ARCDOCDB.INDEX.PRIMARY.TESTS::COLLECT (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;                                                  0 5))
; --> LET LET SB-LOOP::WITH-LOOP-LIST-COLLECTION-HEAD LET* TAGBODY 
; --> SB-LOOP::LOOP-DESETQ SETQ THE 1+ 
; ==>
;   1
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first argument of MOVE

; in:
;      DEFTEST TEST-REQ-IDX-001-PRIMARY-FULL-GROUP-WRAP-AND-DELETED-NOT-EMPTY
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-KEY 99) 0
;      (+ ARCDOCDB.INDEX.PRIMARY.TESTS::GROUP-LOW 31) :ABSENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in:
;      DEFTEST TEST-REQ-IDX-006-PRIMARY-DELETE-IDEMPOTENCE-AND-REUSE-NEW-FINGERPRINT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::B 0
;                                                 7
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::EXPECTED-B
;                                                 2)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in:
;      DEFTEST TEST-REQ-IDX-001-PRIMARY-UPSERT-CSN-INCREASING-AND-KEY-STABLE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;                                                0 1)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                 0 1
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::EXPECTED
;                                                 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-PRIMARY-PREFIX-REFUSALS-BEFORE-MUTATION
;     (ARCDOCDB.INDEX.PRIMARY:RIMUOVI-CHIAVE-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::KEY 0 1 2147483648 5
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-WRITER
;       ARCDOCDB.INDEX.PRIMARY.TESTS::F))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::KEY 2147483647
;      5 :ABSENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                1 2147483648 5 :FRAGMENT
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in:
;      DEFTEST TEST-REQ-IDX-005-PRIMARY-OWNER-REFUSALS-PRESERVE-BOTH-DOMAINS
;     (ARCDOCDB.INDEX.PRIMARY:ESTENDI-ARENA-INDICE
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;       ARCDOCDB.INDEX.PRIMARY.TESTS::F)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::FOREIGN 512
;      ARCDOCDB.INDEX.PRIMARY.TESTS::+PRIMARY-TEST-BUDGET+)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                1 0 8 :FRAGMENT
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::FOREIGN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in:
;      DEFTEST TEST-REQ-IDX-005-PRIMARY-FROZEN-FRAGMENT-READABLE-NEVER-WRITABLE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                2 0 7 :FRAGMENT
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY:ESTENDI-ARENA-INDICE
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;       ARCDOCDB.INDEX.PRIMARY.TESTS::F)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT 512
;      ARCDOCDB.INDEX.PRIMARY.TESTS::+PRIMARY-TEST-BUDGET+)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:ESTENDI-ARENA-INDICE
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;          ARCDOCDB.INDEX.PRIMARY.TESTS::F)
;         ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT 512
;         ARCDOCDB.INDEX.PRIMARY.TESTS::+PRIMARY-TEST-BUDGET+))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :INDEX-SLOT-FROZEN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in: DEFTEST TEST-REQ-IDX-005-PRIMARY-ARENA-GROWTH-BUDGET-AND-OFFSETS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::B 2
;                                                0 2)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY:ESTENDI-ARENA-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT 8
;      (1- ARCDOCDB.INDEX.PRIMARY.TESTS::BUDGET))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (ARCDOCDB.INDEX.PRIMARY:ESTENDI-ARENA-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT 4
;      ARCDOCDB.INDEX.PRIMARY.TESTS::BUDGET)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (1- ARCDOCDB.INDEX.PRIMARY.TESTS::BUDGET)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (+
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-ROOT-BYTES
;       ARCDOCDB.INDEX.PRIMARY.TESTS::F)
;      8)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-LIM-003-PRIMARY-KEY-65535-AND-INVALID-LENGTHS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-READ ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::BAD
;                                                 0 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (MEMBER :RETRY-LIMIT :ABSENT :LIVE) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (MEMBER :RETRY-LIMIT :ABSENT :LIVE) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-KEY
;                                                 1)
;                                                2 0 1 :SOURCE
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::WRONG)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                   (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-KEY
;                                                    1)
;                                                   2 0 1 :SOURCE
;                                                   ARCDOCDB.INDEX.PRIMARY.TESTS::WRONG))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-SOURCE-KEY-LENGTH)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in: DEFTEST TEST-REQ-IDX-001-PRIMARY-U64-CSN-THROUGH-MAXIMUM
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                18446744073709551615 0 127)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                1 0 127)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                   ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                   1 0 127))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-CSN-NOT-INCREASING)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in:
;      DEFTEST TEST-REQ-IDX-003-PRIMARY-COLLISIONS-AND-ODD-RETRIES-SHARE-EIGHT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                 0 9
;                                                 (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PAYLOAD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                  8))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FI-SEQUENCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT 3 (1+ SEQUENCE))
; 
; note: doing unsigned word to integer coercion (cost 20)

;     (ZEROP
;      (ARCDOCDB.INDEX.PRIMARY::CONTESTO-INDICE-REMAINING
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-READER
;        ARCDOCDB.INDEX.PRIMARY.TESTS::F)))
; 
; note: doing unsigned word to integer coercion (cost 20)

;     (UNWIND-PROTECT
;         (PROGN
;          (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FI-SEQUENCE
;           ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT 3 (1+ SEQUENCE))
;          (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;           ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::KEY 0 9
;           :RETRY-LIMIT)
;          (ARCDOCDB.FOUNDATION.TESTS::IS
;           (ZEROP (ARCDOCDB.INDEX.PRIMARY::CONTESTO-INDICE-REMAINING #))))
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FI-SEQUENCE
;        ARCDOCDB.INDEX.PRIMARY.TESTS::FRAGMENT 3 SEQUENCE))
; --> BLOCK LOCALLY 
; ==>
;   (#:CLEANUP-FUN-2)
; 
; note: doing unsigned word to integer coercion (cost 20)

; in:
;      DEFTEST TEST-REQ-CON-004-PRIMARY-OUTPUT-PRESERVED-MISS-AND-CONTEXT-REFUSALS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                 0 1
;                                                 (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PAYLOAD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                  1))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in:
;      DEFTEST TEST-REQ-IDX-005-PRIMARY-LOAD-SLOT-CREDIT-AND-REVISION-PREFLIGHT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-KEY
;                                                 14)
;                                                15 0 14)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                21 0 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-DELETE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                   ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                   0 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                21 0 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                 0 0
;                                                 (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PAYLOAD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                  20)
;                                                 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in:
;      DEFTEST TEST-REQ-IDX-005-PRIMARY-MANUAL-REBUILD-COMPACTS-AND-PUBLISHES-CURRENT-ROOT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::A 4
;                                                0 1 :FRAGMENT
;                                                ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                   ARCDOCDB.INDEX.PRIMARY.TESTS::A
;                                                   4 0 1 :FRAGMENT
;                                                   ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-FRAGMENT-RETIRED)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in:
;      DEFTEST TEST-REQ-IDX-007-PRIMARY-STALE-PLAN-AFTER-SOURCE-UPDATE-NO-FREEZE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                 0 1
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::EXPECTED
;                                                 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::PLAN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in:
;      DEFTEST TEST-REQ-IDX-007-PRIMARY-STALE-PLAN-AFTER-CANDIDATE-UPDATE-AND-ARENA-GROWTH
;     (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::PLAN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in:
;      DEFTEST TEST-REQ-IDX-007-PRIMARY-TWO-PLANS-OLD-ROOT-AND-CONSUMED-PLAN-REFUSED
;     (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::PLAN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PLAN ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::B)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::A
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PLAN
;         ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::B))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-DIRECTORY-SOURCE)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in:
;      DEFTEST TEST-REQ-IDX-007-PRIMARY-DIRECTORY-CANDIDATES-AND-EXACT-BUDGET
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PLAN ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::RIGHT
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::LEFT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PLAN ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::FOREIGN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PLAN ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY:PREPARA-DIRECTORY-INDICE
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;       ARCDOCDB.INDEX.PRIMARY.TESTS::F)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::LEFT
;      (1- ARCDOCDB.INDEX.PRIMARY.TESTS::BUDGET)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::RIGHT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PLAN ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::LEFT
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::RIGHT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &OPTIONAL).
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY:PUBBLICAZIONE-INDICE &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PLAN
;         ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::LEFT ARCDOCDB.INDEX.PRIMARY.TESTS::RIGHT))
;      'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :PRIMARY-DIRECTORY-MEMORY-BUDGET)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (1- ARCDOCDB.INDEX.PRIMARY.TESTS::BUDGET)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in:
;      DEFTEST TEST-REQ-IDX-004-PRIMARY-RELOCATION-MESSAGE-SURVIVES-REBUILD-NOT-NEW-VERSION
;     (ARCDOCDB.INDEX.PRIMARY:RILOCA-CHIAVE-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::LOOKUP 0
;      (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::LOOKUP) 0 1
;      ARCDOCDB.INDEX.PRIMARY.TESTS::ORIGINAL ARCDOCDB.INDEX.PRIMARY.TESTS::COPY
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-WRITER
;       ARCDOCDB.INDEX.PRIMARY.TESTS::F))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY.TESTS::RELOCATE ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;         ARCDOCDB.INDEX.PRIMARY.TESTS::EXPECTED
;         ARCDOCDB.INDEX.PRIMARY.TESTS::BAD))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-RELOCATION-CONTENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in:
;      DEFTEST TEST-REQ-IDX-007-PRIMARY-ROOT-CHANGES-HIT-MISS-AND-COMMON-BUDGET
;     (>= ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT 0)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (= ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT -1)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::SWAPS)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::SWAPS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in:
;      DEFTEST TEST-REQ-IDX-007-PRIMARY-FINAL-CONFIRMATION-EXHAUSTED-NO-RESTART
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-KEY 7) 0 4 :RETRY-LIMIT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (>= ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT 0)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/primary-threads.lisp
; in: DEFUN PRIMARY-DEADLINE
;     (* ARCDOCDB.INDEX.PRIMARY.TESTS::SECONDS INTERNAL-TIME-UNITS-PER-SECOND)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER * -1000000) (INTEGER 0 0)
;                            (INTEGER 1000000))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER * -1000000) (INTEGER 0 0)
;                            (INTEGER 1000000))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ (GET-INTERNAL-REAL-TIME)
;        (* ARCDOCDB.INDEX.PRIMARY.TESTS::SECONDS INTERNAL-TIME-UNITS-PER-SECOND))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (OR (INTEGER * -1000000) (INTEGER 0 0)
;                                    (INTEGER 1000000)), not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a (OR (INTEGER * -1000000) (INTEGER 0 0)
;                                    (INTEGER 1000000)), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFUN PRIMARY-SECONDS-LEFT
;     (- ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE (GET-INTERNAL-REAL-TIME))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (PLUSP ARCDOCDB.INDEX.PRIMARY.TESTS::REMAINING)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.

;     (/ ARCDOCDB.INDEX.PRIMARY.TESTS::REMAINING
;        (FLOAT INTERNAL-TIME-UNITS-PER-SECOND 1.0d0))
; 
; note: forced to do full call
;       unable to do inline float coercion (cost 5) because:
;       The first argument is a (INTEGER 4611686018427387904), not a (UNSIGNED-BYTE
;                                                                     64).
;       unable to do inline float coercion (cost 5) because:
;       The first argument is a (INTEGER 4611686018427387904), not a (SIGNED-BYTE
;                                                                     64).

;     (DEFUN ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;            (ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       \"Pre: deadline del test. Post: secondi residui positivi; errore tipizzato all'esaurimento.\"
;       (LET ((ARCDOCDB.INDEX.PRIMARY.TESTS::REMAINING
;              (- ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE #)))
;         (UNLESS (PLUSP ARCDOCDB.INDEX.PRIMARY.TESTS::REMAINING)
;           (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                  :PRIMARY-TEST-TIMEOUT))
;         (/ ARCDOCDB.INDEX.PRIMARY.TESTS::REMAINING
;            (FLOAT INTERNAL-TIME-UNITS-PER-SECOND 1.0d0))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: deadline del test. Post: secondi residui positivi; errore tipizzato all'esaurimento.\"
;       (BLOCK ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;         (LET ((ARCDOCDB.INDEX.PRIMARY.TESTS::REMAINING #))
;           (UNLESS (PLUSP ARCDOCDB.INDEX.PRIMARY.TESTS::REMAINING)
;             (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                    :PRIMARY-TEST-TIMEOUT))
;           (/ ARCDOCDB.INDEX.PRIMARY.TESTS::REMAINING
;              (FLOAT INTERNAL-TIME-UNITS-PER-SECOND 1.0d0)))))
; 
; note: doing float to pointer coercion (cost 13) to \"<return value>\"

; in: DEFUN PRIMARY-WORKER
;     (DEFUN ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-WORKER
;            (ARCDOCDB.INDEX.PRIMARY.TESTS::NAME
;             ARCDOCDB.INDEX.PRIMARY.TESTS::THUNK)
;       \"Confine worker: un errore e il risultato registrato del thread, rilanciato dal runner al join.\"
;       (SB-THREAD:MAKE-THREAD
;        (LAMBDA ()
;          (HANDLER-CASE (FUNCALL ARCDOCDB.INDEX.PRIMARY.TESTS::THUNK)
;                        (ERROR # CONDITION)))
;        :NAME ARCDOCDB.INDEX.PRIMARY.TESTS::NAME))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-WORKER
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::NAME ARCDOCDB.INDEX.PRIMARY.TESTS::THUNK)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Confine worker: un errore e il risultato registrato del thread, rilanciato dal runner al join.\"
;       (BLOCK ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-WORKER
;         (SB-THREAD:MAKE-THREAD (LAMBDA () (HANDLER-CASE # #)) :NAME
;                                ARCDOCDB.INDEX.PRIMARY.TESTS::NAME)))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES SB-THREAD:THREAD &REST T).
; It allows an unknown number of values, consider using
; (VALUES SB-THREAD:THREAD &OPTIONAL).

; in: DEFUN PRIMARY-THREAD-PAYLOAD
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PAYLOAD
;      ARCDOCDB.INDEX.PRIMARY.TESTS::KEY ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;      :LOCATION
;      (+ (ASH ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 32)
;         (* ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 128))
;      :EXTRA (1+ (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 64)))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ASH ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 32)
; 
; note: forced to do */UNSIGNED=>INTEGER (cost 20)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 64), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 4294967296 79228162514264337589248983040))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 64), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 4294967296 79228162514264337589248983040))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (* ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 128)
; 
; note: forced to do */UNSIGNED=>INTEGER (cost 20)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 64), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0) (INTEGER 128 2361183241434822606720))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 64), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0) (INTEGER 128 2361183241434822606720))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ (ASH ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 32)
;        (* ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 128))
; 
; note: forced to do +/S128=>S128 (cost 12)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER 0 0)
;                                   (INTEGER 4294967296
;                                    79228162514264337589248983040)), not a FIXNUM.
;       The second argument is a (OR (INTEGER 0 0)
;                                    (INTEGER 128 2361183241434822606720)), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 128 79228164875447579024071589760))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR (INTEGER 0 0)
;                                   (INTEGER 4294967296
;                                    79228162514264337589248983040)), not a (UNSIGNED-BYTE
;                                                                            64).
;       The second argument is a (OR (INTEGER 0 0)
;                                    (INTEGER 128 2361183241434822606720)), not a (UNSIGNED-BYTE
;                                                                                  64).
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 128 79228164875447579024071589760))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: doing integer to untagged 128 coercion (cost 40), for:
;       the first argument of +/S128=>S128
; 
; note: doing integer to untagged 128 coercion (cost 40), for:
;       the second argument of +/S128=>S128

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PAYLOAD
;      ARCDOCDB.INDEX.PRIMARY.TESTS::KEY ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;      :LOCATION
;      (+ (ASH ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 32)
;         (* ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 128))
;      :EXTRA (1+ (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 64)))
; 
; note: doing signed 128 to integer coercion (cost 30) to #:G20

; in: DEFUN PRIMARY-OBSERVE-UPDATE
;     (ASH ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 32)
; 
; note: forced to do */UNSIGNED=>INTEGER (cost 20)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 64), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 4294967296 79228162514264337589248983040))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 64), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 4294967296 79228162514264337589248983040))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (* ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 128)
; 
; note: forced to do */UNSIGNED=>INTEGER (cost 20)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 64), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0) (INTEGER 128 2361183241434822606720))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (UNSIGNED-BYTE 64), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0) (INTEGER 128 2361183241434822606720))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ (ASH ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 32)
;        (* ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 128))
; 
; note: forced to do +/S128=>S128 (cost 12)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER 0 0)
;                                   (INTEGER 4294967296
;                                    79228162514264337589248983040)), not a FIXNUM.
;       The second argument is a (OR (INTEGER 0 0)
;                                    (INTEGER 128 2361183241434822606720)), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 128 79228164875447579024071589760))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR (INTEGER 0 0)
;                                   (INTEGER 4294967296
;                                    79228162514264337589248983040)), not a (UNSIGNED-BYTE
;                                                                            64).
;       The second argument is a (OR (INTEGER 0 0)
;                                    (INTEGER 128 2361183241434822606720)), not a (UNSIGNED-BYTE
;                                                                                  64).
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 128 79228164875447579024071589760))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (ASH (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY) 32)
; 
; note: forced to do */SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 4294967296 151115727451824351870976))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0)
;                            (INTEGER 4294967296 151115727451824351870976))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (LOGIOR (ASH (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY) 32) (ASH 1 48))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER 0 0)
;                                   (INTEGER 4294967296 151115727451824351870976)), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER 281474976710656 151115727451828646838271)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (OR (INTEGER 0 0)
;                                   (INTEGER 4294967296 151115727451824351870976)), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The result is a (VALUES
;                        (INTEGER 281474976710656 151115727451828646838271)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (+ (ASH ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 32)
;        (* ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 128))
; 
; note: doing integer to untagged 128 coercion (cost 40), for:
;       the first argument of +/S128=>S128
; 
; note: doing integer to untagged 128 coercion (cost 40), for:
;       the second argument of +/S128=>S128

;     (= (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::OUTPUT 1)
;        (+ (ASH ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 32)
;           (* ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 128)))
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first argument of UNSIGNED-BYTE-64-P
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first argument of MOVE

;     (ASH (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY) 32)
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of */SIGNED=>S128

;     (= (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::OUTPUT 3)
;        (+ ARCDOCDB.RECORD:+HEADER-BYTES+
;           (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::KEY) 1
;           (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 64)))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the second argument of IF-EQ

; in: DEFUN PRIMARY-UPDATE-READER
;     (DOTIMES
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION
;          ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (MULTIPLE-VALUE-BIND
;           (ARCDOCDB.INDEX.PRIMARY.TESTS::CSN ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE)
;           (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-OBSERVE-UPDATE
;            ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;            ARCDOCDB.INDEX.PRIMARY.TESTS::CONTEXT
;            ARCDOCDB.INDEX.PRIMARY.TESTS::OUTPUT
;            ARCDOCDB.INDEX.PRIMARY.TESTS::PREVIOUS
;            ARCDOCDB.INDEX.PRIMARY.TESTS::MAXIMUM)
;         (SETF ARCDOCDB.INDEX.PRIMARY.TESTS::PREVIOUS
;                 ARCDOCDB.INDEX.PRIMARY.TESTS::CSN)
;         (IF ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE
;             (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::HITS)
;             (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::RETRIES)))
;       (WHEN (ZEROP (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 16))
;         (SB-THREAD:THREAD-YIELD)))
; --> BLOCK LET TAGBODY UNLESS IF >= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::RETRIES)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::RETRIES)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::HITS)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::HITS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES (INTEGER 2) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 2) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 16)
; 
; note: forced to do LOGAND-WORD-MASK/INTEGER-UNSIGNED-C (cost 10)
;       unable to do inline fixnum arithmetic (cost 1) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       etc.

;     (DOTIMES
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION
;          ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (MULTIPLE-VALUE-BIND
;           (ARCDOCDB.INDEX.PRIMARY.TESTS::CSN ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE)
;           (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-OBSERVE-UPDATE
;            ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;            ARCDOCDB.INDEX.PRIMARY.TESTS::CONTEXT
;            ARCDOCDB.INDEX.PRIMARY.TESTS::OUTPUT
;            ARCDOCDB.INDEX.PRIMARY.TESTS::PREVIOUS
;            ARCDOCDB.INDEX.PRIMARY.TESTS::MAXIMUM)
;         (SETF ARCDOCDB.INDEX.PRIMARY.TESTS::PREVIOUS
;                 ARCDOCDB.INDEX.PRIMARY.TESTS::CSN)
;         (IF ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE
;             (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::HITS)
;             (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::RETRIES)))
;       (WHEN (ZEROP (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 16))
;         (SB-THREAD:THREAD-YIELD)))
; --> BLOCK LET TAGBODY PSETQ PROGN SETQ THE 1+ 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (1+ ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (+ ARCDOCDB.INDEX.PRIMARY.TESTS::HITS ARCDOCDB.INDEX.PRIMARY.TESTS::RETRIES)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (= (1+ ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
;        (+ ARCDOCDB.INDEX.PRIMARY.TESTS::HITS
;           ARCDOCDB.INDEX.PRIMARY.TESTS::RETRIES))
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a INTEGER, not a (SIGNED-BYTE 64).
;       The second argument is a (INTEGER 1), not a (SIGNED-BYTE 64).

; in: DEFUN PRIMARY-UPDATE-WRITER
;     (DOTIMES
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION
;          ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (LET* ((ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;               (+ ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 2))
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PAYLOAD
;               (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-THREAD-PAYLOAD
;                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                ARCDOCDB.INDEX.PRIMARY.TESTS::CSN)))
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT
;          ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;          ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 0 3 :SOURCE
;          ARCDOCDB.INDEX.PRIMARY.TESTS::PAYLOAD))
;       (WHEN (ZEROP (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 8))
;         (SB-THREAD:THREAD-YIELD)))
; --> BLOCK LET TAGBODY UNLESS IF >= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (MOD 18446744073709551615), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (LET* ((ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;             (+ ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 2))
;            (ARCDOCDB.INDEX.PRIMARY.TESTS::PAYLOAD
;             (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-THREAD-PAYLOAD
;              ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;              ARCDOCDB.INDEX.PRIMARY.TESTS::CSN)))
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;        ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 0 3 :SOURCE
;        ARCDOCDB.INDEX.PRIMARY.TESTS::PAYLOAD))
; 
; note: doing unsigned word to integer coercion (cost 20) to CSN

;     (DOTIMES
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION
;          ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (LET* ((ARCDOCDB.INDEX.PRIMARY.TESTS::CSN
;               (+ ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 2))
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PAYLOAD
;               (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-THREAD-PAYLOAD
;                ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                ARCDOCDB.INDEX.PRIMARY.TESTS::CSN)))
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-PUT
;          ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;          ARCDOCDB.INDEX.PRIMARY.TESTS::CSN 0 3 :SOURCE
;          ARCDOCDB.INDEX.PRIMARY.TESTS::PAYLOAD))
;       (WHEN (ZEROP (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 8))
;         (SB-THREAD:THREAD-YIELD)))
; --> BLOCK LET TAGBODY UNLESS IF >= 
; ==>
;   ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION
; 
; note: doing unsigned word to integer coercion (cost 20) from ITERATION

; in:
;      DEFTEST TEST-REQ-IDX-003-PRIMARY-WRITER-UPDATES-THREE-READERS-NO-TORN-PAYLOAD
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-UPDATE-WRITER
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;      ARCDOCDB.INDEX.PRIMARY.TESTS::START ARCDOCDB.INDEX.PRIMARY.TESTS::FINISHED
;      ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE ARCDOCDB.INDEX.PRIMARY.TESTS::UPDATES
;      ARCDOCDB.INDEX.PRIMARY.TESTS::READERS)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL LIST &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL LIST).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-UPDATE-READER
;      ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;      ARCDOCDB.INDEX.PRIMARY.TESTS::READY ARCDOCDB.INDEX.PRIMARY.TESTS::START
;      ARCDOCDB.INDEX.PRIMARY.TESTS::FINISHED
;      ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS
;      (1+ ARCDOCDB.INDEX.PRIMARY.TESTS::UPDATES))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL LIST &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL LIST).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                 0 3
;                                                 (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-THREAD-PAYLOAD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                  (1+
;                                                   ARCDOCDB.INDEX.PRIMARY.TESTS::UPDATES))
;                                                 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFUN PRIMARY-ROOT-READER
;     (DOTIMES
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION
;          ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-OBSERVE-ROOT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;        ARCDOCDB.INDEX.PRIMARY.TESTS::MISSING
;        ARCDOCDB.INDEX.PRIMARY.TESTS::CONTEXT ARCDOCDB.INDEX.PRIMARY.TESTS::OUTPUT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::EXPECTED)
;       (WHEN (ZEROP (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 16))
;         (SB-THREAD:THREAD-YIELD)))
; --> BLOCK LET TAGBODY UNLESS IF >= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 16)
; 
; note: forced to do LOGAND-WORD-MASK/INTEGER-UNSIGNED-C (cost 10)
;       unable to do inline fixnum arithmetic (cost 1) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       etc.

;     (DOTIMES
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION
;          ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-OBSERVE-ROOT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;        ARCDOCDB.INDEX.PRIMARY.TESTS::MISSING
;        ARCDOCDB.INDEX.PRIMARY.TESTS::CONTEXT ARCDOCDB.INDEX.PRIMARY.TESTS::OUTPUT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::EXPECTED)
;       (WHEN (ZEROP (MOD ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATION 16))
;         (SB-THREAD:THREAD-YIELD)))
; --> BLOCK LET TAGBODY PSETQ PROGN SETQ THE 1+ 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFUN PRIMARY-REBUILD-WRITER
;     (DOTIMES
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::WAVE ARCDOCDB.INDEX.PRIMARY.TESTS::WAVES)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (LET* ((ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;               (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-CURRENT
;                ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE))
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::NEW-SIZE
;               (+ 512 ARCDOCDB.INDEX.PRIMARY.TESTS::WAVE))
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-CANDIDATE
;                ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE 0 0 4)))
;         (ARCDOCDB.FOUNDATION.TESTS::IS
;          (NULL
;           (ARCDOCDB.INDEX.PRIMARY:ESTENDI-ARENA-INDICE #
;                                                        ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;                                                        ARCDOCDB.INDEX.PRIMARY.TESTS::NEW-SIZE
;                                                        #)))
;         (IF (EVENP ARCDOCDB.INDEX.PRIMARY.TESTS::WAVE)
;             (PROGN
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-COPY-LIVE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::B 0 2)
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-COPY-LIVE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::A 0 1))
;             (PROGN
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-COPY-LIVE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::A 0 1)
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-COPY-LIVE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::B 0 2)))
;         (ARCDOCDB.FOUNDATION.TESTS::IS
;          (NULL (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE #)))
;         (ARCDOCDB.FOUNDATION.TESTS::IS
;          (EQ :FROZEN (ARCDOCDB.INDEX.SLOTS::BANCO-SLOT-STATE #))))
;       (SB-THREAD:THREAD-YIELD))
; --> BLOCK LET TAGBODY UNLESS IF >= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ 512 ARCDOCDB.INDEX.PRIMARY.TESTS::WAVE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 512) &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 512) &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (+
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-ROOT-BYTES
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::NEW-SIZE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a (INTEGER 512), not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a (INTEGER 512), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (DOTIMES
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::WAVE ARCDOCDB.INDEX.PRIMARY.TESTS::WAVES)
;       (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-SECONDS-LEFT
;        ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE)
;       (LET* ((ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;               (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-CURRENT
;                ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE))
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::NEW-SIZE
;               (+ 512 ARCDOCDB.INDEX.PRIMARY.TESTS::WAVE))
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-CANDIDATE
;                ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE 0 0 4)))
;         (ARCDOCDB.FOUNDATION.TESTS::IS
;          (NULL
;           (ARCDOCDB.INDEX.PRIMARY:ESTENDI-ARENA-INDICE #
;                                                        ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;                                                        ARCDOCDB.INDEX.PRIMARY.TESTS::NEW-SIZE
;                                                        #)))
;         (IF (EVENP ARCDOCDB.INDEX.PRIMARY.TESTS::WAVE)
;             (PROGN
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-COPY-LIVE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::B 0 2)
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-COPY-LIVE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::A 0 1))
;             (PROGN
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-COPY-LIVE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::A 0 1)
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-COPY-LIVE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::CANDIDATE
;               ARCDOCDB.INDEX.PRIMARY.TESTS::B 0 2)))
;         (ARCDOCDB.FOUNDATION.TESTS::IS
;          (NULL (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE #)))
;         (ARCDOCDB.FOUNDATION.TESTS::IS
;          (EQ :FROZEN (ARCDOCDB.INDEX.SLOTS::BANCO-SLOT-STATE #))))
;       (SB-THREAD:THREAD-YIELD))
; --> BLOCK LET TAGBODY PSETQ PROGN SETQ THE 1+ 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in:
;      DEFTEST TEST-REQ-IDX-007-PRIMARY-MANUAL-REBUILDS-AND-ARENA-GROWTH-WITH-READERS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REBUILD-WRITER
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::A
;      ARCDOCDB.INDEX.PRIMARY.TESTS::B ARCDOCDB.INDEX.PRIMARY.TESTS::START
;      ARCDOCDB.INDEX.PRIMARY.TESTS::FINISHED
;      ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE ARCDOCDB.INDEX.PRIMARY.TESTS::WAVES
;      ARCDOCDB.INDEX.PRIMARY.TESTS::READERS)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL LIST &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL LIST).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-ROOT-READER
;      ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::A
;      ARCDOCDB.INDEX.PRIMARY.TESTS::MISSING ARCDOCDB.INDEX.PRIMARY.TESTS::EXPECTED
;      ARCDOCDB.INDEX.PRIMARY.TESTS::READY ARCDOCDB.INDEX.PRIMARY.TESTS::START
;      ARCDOCDB.INDEX.PRIMARY.TESTS::FINISHED
;      ARCDOCDB.INDEX.PRIMARY.TESTS::DEADLINE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::ITERATIONS)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL LIST &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL LIST).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::DEAD 0 0
;      :ABSENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/rebuild.lisp
; in: DEFUN REBUILD-BUDGET
;     (+
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-ROOT-BYTES
;       ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;      (* 8 (EXPT 2 ARCDOCDB.INDEX.PRIMARY.TESTS::GLOBAL))
;      ARCDOCDB.INDEX.PRIMARY.TESTS::SLOTS
;      (MAX 1 ARCDOCDB.INDEX.PRIMARY.TESTS::FIRST-BYTES)
;      (IF ARCDOCDB.INDEX.PRIMARY.TESTS::SPLIT
;          (+ ARCDOCDB.INDEX.PRIMARY.TESTS::SLOTS
;             (MAX 1 ARCDOCDB.INDEX.PRIMARY.TESTS::SECOND-BYTES))
;          0))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a (OR (INTEGER 0 0)
;                                    (INTEGER 657 4611686018430074879)), not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: doing signed word to integer coercion (cost 20)

; in: DEFUN REBUILD-ERROR
;     (TYPEP CONDITION TYPE)
; 
; note: unable to optimize because: can't open-code test of non-constant type

; in: DEFUN REBUILD-REFUSAL
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:RICOSTRUISCI-FRAMMENTO-INDICE
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;          ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;         ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;         ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS ARCDOCDB.INDEX.PRIMARY.TESTS::BUDGET
;         :SPLIT-P ARCDOCDB.INDEX.PRIMARY.TESTS::SPLIT))
;      TYPE ARCDOCDB.INDEX.PRIMARY.TESTS::REASON)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (APPLY ARCDOCDB.INDEX.PRIMARY.TESTS::ORIGINAL
;            ARCDOCDB.INDEX.PRIMARY.TESTS::ARGUMENTS)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   ORIGINAL is not known to be a function

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFUN REBUILD-PLAN
;     (+ (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::BEFORE)
;        (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-LIVE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (=
;      (+ (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::BEFORE)
;         (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-LIVE
;          ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE))
;      (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-REVISION
;       ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (+ (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::BEFORE)
;        (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-LIVE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (LIST
;      (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-CAPACITY
;       ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX)
;      (+ ARCDOCDB.INDEX.PRIMARY.TESTS::FIRST-BYTES
;         ARCDOCDB.INDEX.PRIMARY.TESTS::SECOND-BYTES)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::REFERENCES
;      ARCDOCDB.INDEX.PRIMARY.TESTS::BUDGET)
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the second argument of LIST

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-SPLIT-VERIFIED
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::D
;                                                 1073741824 9
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::PD
;                                                 1)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-EMPTY-FRAGMENT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-KEY 1) 0 1 :ABSENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-EMPTY-SPLIT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-KEY 2) 2147483648 2 :ABSENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-SPLIT-ONE-EMPTY-CHILD
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::KEY 0 2055
;      :ABSENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in: DEFTEST TEST-REQ-AFF-008-REBUILD-TRANSIENT-BUDGET
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-PUBLISH
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::PLAN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (1- ARCDOCDB.INDEX.PRIMARY.TESTS::EXACT)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-AFF-008-REBUILD-DEPTH-EXHAUSTED-ONLY-FOR-SPLIT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-PUBLISH
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-PLAN ARCDOCDB.INDEX.PRIMARY.TESTS::F
;       ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;       ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS NIL 0 0 1))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-WRONG-DIGEST-FINGERPRINT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS 10000
;      NIL 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-REBUILD-DIGEST)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-WRONG-DIGEST-LOOKUP-GROUP
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS 10000
;      NIL 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-REBUILD-DIGEST)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-WRONG-DIGEST-SOURCE-PREFIX
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS 10000
;      NIL 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-FRAGMENT-PREFIX)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-PLAN-STALE-AFTER-SOURCE-UPDATE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                 0 7
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::UPDATED
;                                                 0)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::PLAN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in:
;      DEFTEST TEST-REQ-IDX-005-REBUILD-SECOND-CONSTRUCTION-STALES-FIRST-PLAN
;     (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE SECOND)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-CURRENT
;       ARCDOCDB.INDEX.PRIMARY.TESTS::F)
;      (LAMBDA () (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE SECOND))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-DIRECTORY-STALE-PLAN)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

;     (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE FIRST)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-CORRUPTED-COPY-LOCATION
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-ERROR
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:RICOSTRUISCI-FRAMMENTO-INDICE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS
;         10000))
;      'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :PRIMARY-REBUILD-COPY-MISMATCH)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-ERROR
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:RICOSTRUISCI-FRAMMENTO-INDICE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS
;         10000))
;      'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :PRIMARY-INDEX-FAULTED)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (APPLY ARCDOCDB.INDEX.PRIMARY.TESTS::ORIGINAL
;            ARCDOCDB.INDEX.PRIMARY.TESTS::ARGUMENTS)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   ORIGINAL is not known to be a function

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::INJECTED)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::INJECTED)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFUN REBUILD-SOURCE-FAULT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-ERROR
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:RICOSTRUISCI-FRAMMENTO-INDICE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS
;         10000))
;      'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION
;      ARCDOCDB.INDEX.PRIMARY.TESTS::REASON)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (APPLY ARCDOCDB.INDEX.PRIMARY.TESTS::ORIGINAL
;            ARCDOCDB.INDEX.PRIMARY.TESTS::ARGUMENTS)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   ORIGINAL is not known to be a function

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-DUPLICATE-SOURCE-KEY
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS 10000
;      NIL 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-REBUILD-DIGEST)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in:
;      DEFTEST TEST-REQ-IDX-005-REBUILD-PROBE-BANK-CORRUPTION-BEFORE-SLOT-SCAN
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-SOURCE-FAULT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS
;      :INDEX-SLOT-INCONSISTENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-COPY-LOOKUP-FALSE-IS-TERMINAL
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-ERROR
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:RICOSTRUISCI-FRAMMENTO-INDICE
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;          ARCDOCDB.INDEX.PRIMARY.TESTS::F)
;         ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;         ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS 10000))
;      'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :PRIMARY-REBUILD-COPY-MISMATCH)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-SOURCE-UNCHANGED
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::BEFORE)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (APPLY ARCDOCDB.INDEX.PRIMARY.TESTS::ORIGINAL
;            ARCDOCDB.INDEX.PRIMARY.TESTS::ARGUMENTS)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   ORIGINAL is not known to be a function

; in: DEFTEST TEST-REQ-IDX-005-REBUILD-COLD-ABORT-PRESERVES-SOURCE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::REBUILD-ERROR
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:RICOSTRUISCI-FRAMMENTO-INDICE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS
;         10000))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :REBUILD-TEST-COLD-ABORT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (ARCDOCDB.INDEX.PRIMARY:PUBBLICA-DIRECTORY-INDICE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::PREVIOUS)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (+ (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::BEFORE)
;        (IF ARCDOCDB.INDEX.PRIMARY.TESTS::AFTER-COPY
;            1
;            0))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (=
;      (+ (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::BEFORE)
;         (IF ARCDOCDB.INDEX.PRIMARY.TESTS::AFTER-COPY
;             1
;             0))
;      (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-REVISION
;       ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (APPLY ARCDOCDB.INDEX.PRIMARY.TESTS::ORIGINAL
;            ARCDOCDB.INDEX.PRIMARY.TESTS::ARGUMENTS)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   ORIGINAL is not known to be a function

;     (+ (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::BEFORE)
;        (IF ARCDOCDB.INDEX.PRIMARY.TESTS::AFTER-COPY
;            1
;            0))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

; file: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/index/hash-digests.lisp
; in: DEFUN HASH-MAP-PHYSICAL-SLOTS
;     (AREF (FOURTH ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY) 0)
; 
; note: unable to
;   avoid runtime dispatch on array element type
; because:
;   Upgraded element type of array is not known at compile time.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a VECTOR, not a SIMPLE-ARRAY.

;     (=
;      (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::WORDS
;            ARCDOCDB.INDEX.PRIMARY.TESTS::BASE)
;      (AREF (FOURTH ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY) 0))
; 
; note: unable to open code because: The operands might not be the same type.

;     (LOGAND (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY) 127)
; 
; note: forced to do LOGAND-WORD-MASK/INTEGER-UNSIGNED-C (cost 10)
;       unable to do inline fixnum arithmetic (cost 1) because:
;       The first argument is a T, not a FIXNUM.
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       etc.

;     (=
;      (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::WORDS
;            ARCDOCDB.INDEX.PRIMARY.TESTS::BASE)
;      (AREF (FOURTH ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY) 0))
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN HASH-MAP-IMAGE-EQUAL
;     (EVERY #'EQ (FOURTH ARCDOCDB.INDEX.PRIMARY.TESTS::BEFORE)
;            (FOURTH ARCDOCDB.INDEX.PRIMARY.TESTS::AFTER))
; 
; note: unable to open code because: can't determine sequence argument type

; in: DEFUN HASH-MAP-WITH-SPIES
;     (APPLY ARCDOCDB.INDEX.PRIMARY.TESTS::ORIGINAL
;            ARCDOCDB.INDEX.PRIMARY.TESTS::ARGUMENTS)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   ORIGINAL is not known to be a function

; in: DEFUN HASH-MAP-ERROR
;     (TYPEP CONDITION TYPE)
; 
; note: unable to optimize because: can't open-code test of non-constant type

; in: DEFUN HASH-MAP-OUTPUT-IMAGE
;     (ROW-MAJOR-AREF ARCDOCDB.INDEX.PRIMARY.TESTS::VALUE
;                     ARCDOCDB.INDEX.PRIMARY.TESTS::I)
; 
; note: unable to
;   avoid runtime dispatch on array element type
; because:
;   Upgraded element type of array is not known at compile time.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a ARRAY, not a SIMPLE-ARRAY.

; in: DEFUN HASH-MAP-PREFLIGHT-REFUSAL
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-ERROR
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:CALCOLA-DIGESTS-FRAMMENTO
;         (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE-INDEX
;          ARCDOCDB.INDEX.PRIMARY.TESTS::FIXTURE)
;         ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;         ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS
;         ARCDOCDB.INDEX.PRIMARY.TESTS::SEED-HIGH
;         ARCDOCDB.INDEX.PRIMARY.TESTS::SEED-LOW))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT ARCDOCDB.INDEX.PRIMARY.TESTS::REASON)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFUN HASH-MAP-CALCULATE
;     (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (=
;      (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;            ARCDOCDB.INDEX.PRIMARY.TESTS::SLOT)
;      (IF ARCDOCDB.INDEX.PRIMARY.TESTS::RECORD
;          (SECOND (FOURTH ARCDOCDB.INDEX.PRIMARY.TESTS::RECORD))
;          (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::H
;                ARCDOCDB.INDEX.PRIMARY.TESTS::SLOT)))
; 
; note: unable to open code because: The operands might not be the same type.

;     (=
;      (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS ARCDOCDB.INDEX.PRIMARY.TESTS::SLOT)
;      (IF ARCDOCDB.INDEX.PRIMARY.TESTS::RECORD
;          (THIRD (FOURTH ARCDOCDB.INDEX.PRIMARY.TESTS::RECORD))
;          (AREF ARCDOCDB.INDEX.PRIMARY.TESTS::L
;                ARCDOCDB.INDEX.PRIMARY.TESTS::SLOT)))
; 
; note: unable to open code because: The operands might not be the same type.

;     (= ARCDOCDB.INDEX.PRIMARY.TESTS::SEEN
;        (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::ARGUMENTS))
; 
; note: unable to open code because: The operands might not be the same type.

;     (+ (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::CURRENT)
;        (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::CURRENT))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (= (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::CURRENT)
;        (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::ARGUMENTS))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to open code because: The operands might not be the same type.
; 
; note: forced to do full call
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a T, not a SINGLE-FLOAT.
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a T, not a DOUBLE-FLOAT.
;       The second argument is a T, not a DOUBLE-FLOAT.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::VERIFIED)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::VERIFIED)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (+ (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::CURRENT)
;        (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::CURRENT))
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a T, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::HASHED)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::HASHED)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::SEEN)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::SEEN)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (= ARCDOCDB.INDEX.PRIMARY.TESTS::HASHED
;        ARCDOCDB.INDEX.PRIMARY.TESTS::VERIFIED
;        (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::RECORDS))
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a UNSIGNED-BYTE, not a (SIGNED-BYTE 64).
;       The second argument is a UNSIGNED-BYTE, not a (SIGNED-BYTE 64).

; in: DEFUN HASH-MAP-REBUILD
;     (= (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT)
;        (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (= (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT)
;        (REDUCE #'+ ARCDOCDB.INDEX.PRIMARY.TESTS::RECORDS :KEY #'THIRD
;                :INITIAL-VALUE 0))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to open code because: The operands might not be the same type.
; 
; note: forced to do full call
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a T, not a DOUBLE-FLOAT.
;       The second argument is a NUMBER, not a DOUBLE-FLOAT.

; in: DEFUN HASH-MAP-ENTRIES
;     (= (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::SPEC)
;        (IF (LOGBITP 11 (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::DIGEST))
;            16
;            0))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (= (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::SPEC)
;        (IF (LOGBITP 31 (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::DIGEST))
;            1
;            0))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

; in: DEFUN HASH-MAP-FAULT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-ERROR
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY:CALCOLA-DIGESTS-FRAMMENTO
;         ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;         ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS
;         (OR
;          (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-SEED-HIGH
;           ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX)
;          0)
;         (OR
;          (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-SEED-LOW
;           ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX)
;          0)))
;      'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION
;      ARCDOCDB.INDEX.PRIMARY.TESTS::REASON)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::CALLS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-PHYSICAL-SLOTS
;     (PLUSP (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::RECORD))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (/= (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;         (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
;   The second argument is a NUMBER, not a RATIONAL.
; 
; note: unable to open code because: The operands might not be the same type.

;     (= 4 ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (= 20 ARCDOCDB.INDEX.PRIMARY.TESTS::BYTES)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE
;           (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT))
; ==>
;   (+ (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::BYTES
;           (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT))
; ==>
;   (+ (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::BYTES)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (/= ARCDOCDB.INDEX.PRIMARY.TESTS::ORDINAL
;         (FIRST
;          (FIND ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY
;                ARCDOCDB.INDEX.PRIMARY.TESTS::RECORDS :KEY #'FOURTH :TEST #'EQ)))
; 
; note: unable to open code because: The operands might not be the same type.

;     (PLUSP (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::RECORD))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a T, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       etc.

;     (= ARCDOCDB.INDEX.PRIMARY.TESTS::PREFIX
;        (ASH (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY) -31))
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a UNSIGNED-BYTE, not a (SIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (SIGNED-BYTE 64).

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE
;           (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT))
; ==>
;   (+ (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE)
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::BYTES
;           (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT))
; ==>
;   (+ (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::RESULT)
;      ARCDOCDB.INDEX.PRIMARY.TESTS::BYTES)
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (DOTIMES (ARCDOCDB.INDEX.PRIMARY.TESTS::PREFIX 2)
;       (LET* ((ARCDOCDB.INDEX.PRIMARY.TESTS::CHILD
;               (AREF DIRECTORY ARCDOCDB.INDEX.PRIMARY.TESTS::PREFIX))
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::SUBSET
;               (REMOVE-IF-NOT # ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRIES))
;              (ARCDOCDB.INDEX.PRIMARY.TESTS::CHILD-RECORDS
;               (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-PHYSICAL-SLOTS
;                ARCDOCDB.INDEX.PRIMARY.TESTS::CHILD
;                ARCDOCDB.INDEX.PRIMARY.TESTS::SUBSET)))
;         (ARCDOCDB.FOUNDATION.TESTS::IS
;          (= ARCDOCDB.INDEX.PRIMARY.TESTS::PREFIX
;             (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-PREFIX
;              ARCDOCDB.INDEX.PRIMARY.TESTS::CHILD)))
;         (ARCDOCDB.FOUNDATION.TESTS::IS
;          (= 2 (LENGTH ARCDOCDB.INDEX.PRIMARY.TESTS::CHILD-RECORDS)))
;         (MULTIPLE-VALUE-BIND
;             (ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;              ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS)
;             (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-ARRAYS 32)
;           (LET (#)
;             (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::LIVE #)
;             (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::BYTES #)))))
; --> BLOCK LET TAGBODY PSETQ PROGN SETQ THE 1+ 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (/= (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;         (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: forced to do full call
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a T, not a SINGLE-FLOAT.
;       unable to do inline float comparison (cost 3) because:
;       The first argument is a T, not a DOUBLE-FLOAT.
;       The second argument is a T, not a DOUBLE-FLOAT.

;     (LOOP ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY ARCDOCDB.INDEX.PRIMARY.TESTS::IN ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRIES
;           ARCDOCDB.INDEX.PRIMARY.TESTS::FOR ARCDOCDB.INDEX.PRIMARY.TESTS::ORDINAL ARCDOCDB.INDEX.PRIMARY.TESTS::FROM 0
;           ARCDOCDB.INDEX.PRIMARY.TESTS::THEREIS (/=
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ORDINAL
;                                                  (FIRST
;                                                   (FIND
;                                                    ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY
;                                                    ARCDOCDB.INDEX.PRIMARY.TESTS::RECORDS
;                                                    :KEY #'FOURTH :TEST #'EQ))))
; --> LET LET LET TAGBODY SB-LOOP::LOOP-DESETQ SETQ THE 1+ 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in:
;      DEFTEST TEST-REQ-IDX-005-HASH-MAP-NONLIVE-SENTINELS-AND-EXACT-COUNTS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-NO-OUTPUT
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::DEAD)
;      (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::DEAD)
;      (THIRD ARCDOCDB.INDEX.PRIMARY.TESTS::DEAD) :ABSENT)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL BOOLEAN &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL BOOLEAN).

; in:
;      DEFTEST TEST-REQ-IDX-005-HASH-MAP-OUTPUT-ARITY-EMPTY-AND-UNCONFIGURED
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::KEY
;                                                 0 7
;                                                 ARCDOCDB.INDEX.PRIMARY.TESTS::PAYLOAD)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-SEED-CONSTRUCTOR-AND-IMMUTABILITY
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-FIXTURE
;      (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::PAIR)
;      (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::PAIR))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE &REST T).
; It allows an unknown number of values, consider using
; (VALUES ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-FIXTURE &OPTIONAL).

;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-ERROR
;      (LAMBDA ()
;        (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-FIXTURE
;         (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::PAIR)
;         (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::PAIR)))
;      'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :PRIMARY-HASH-SEED-CONFIGURATION)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

;     (= (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::PAIR)
;        (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-SEED-HIGH
;         ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (= (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::PAIR)
;        (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-SEED-LOW
;         ARCDOCDB.INDEX.PRIMARY.TESTS::INDEX))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (APPLY ARCDOCDB.INDEX.PRIMARY.TESTS::ORIGINAL
;            ARCDOCDB.INDEX.PRIMARY.TESTS::ARGS)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   ORIGINAL is not known to be a function

;     (INCF ARCDOCDB.INDEX.PRIMARY.TESTS::FACTORIES)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY.TESTS::FACTORIES)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-OUTPUT-TYPES-PREFLIGHT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 (FIRST
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (SECOND
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (THIRD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (FOURTH
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-OUTPUT-ALIAS-PREFLIGHT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-PREFLIGHT-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::F ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::ALIAS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS 0 0
;      :PRIMARY-HASH-ARRAYS)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-INVALID-SEED-TYPES-PREFLIGHT
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-PREFLIGHT-REFUSAL
;      ARCDOCDB.INDEX.PRIMARY.TESTS::RAW ARCDOCDB.INDEX.PRIMARY.TESTS::RAW-SOURCE
;      ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS -1 0
;      :PRIMARY-HASH-SEED)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-SEED-MISMATCH
;     (LOGXOR 1 (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::SEED))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (LOGXOR 1 (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::SEED))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (LOGXOR 1 (FIRST ARCDOCDB.INDEX.PRIMARY.TESTS::SEED))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (LOGXOR 1 (SECOND ARCDOCDB.INDEX.PRIMARY.TESTS::SEED))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-STALE-SOURCE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 (FIRST
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (SECOND
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (THIRD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (FOURTH
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-BUILDING-SOURCE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 (FIRST
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (SECOND
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (THIRD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (FOURTH
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-FOREIGN-SOURCE
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::PRIMARY-LIVE ARCDOCDB.INDEX.PRIMARY.TESTS::F
;                                                 (FIRST
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (SECOND
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (THIRD
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY)
;                                                 (FOURTH
;                                                  ARCDOCDB.INDEX.PRIMARY.TESTS::ENTRY))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (SIMPLE-ARRAY (UNSIGNED-BYTE 64) (5)) &OPTIONAL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-CORRUPT-BANK-FAULTS-IMMEDIATELY
;     (* ARCDOCDB.INDEX.PRIMARY.TESTS::SLOT 5)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-MISSING-ROOT-FAULTS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-FAULT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;      ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS :PRIMARY-INDEX-MISSING-ROOT T)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).

; in: DEFTEST TEST-REQ-IDX-005-HASH-MAP-INTERNAL-DIGEST-FAULTS
;     (ARCDOCDB.INDEX.PRIMARY.TESTS::HASH-MAP-FAULT ARCDOCDB.INDEX.PRIMARY.TESTS::F
;      ARCDOCDB.INDEX.PRIMARY.TESTS::SOURCE ARCDOCDB.INDEX.PRIMARY.TESTS::HIGHS
;      ARCDOCDB.INDEX.PRIMARY.TESTS::LOWS :PRIMARY-HASH-SOURCE-DIGEST)
; 
; note: Type assertion too complex to check efficiently:
; (VALUES &OPTIONAL NULL &REST T).
; It allows an unknown number of values, consider using
; (VALUES &OPTIONAL NULL).
; 
; compilation unit finished
;   printed 496 notes
SPK-01 --check
SPK-02 --check
SPK-03 --check
SPK-04 --check
SPK-05 --check
SPK-06 --check
SPK-07 --check
SPK-08 --check
SPK-09 --check
SPK-10 --check
")
  (:PATH #A((47) BASE-CHAR . "spikes/out/worker-series-fullcheck-verified.txt") :BYTES 421 :SHA256
   "21b6a2dace2a44ecb3a0b7a9af5c639a0c8567c04876bef71fef733a12d60e2c" :GIT-BLOB
   "2201c9955fe5f8baab62faa7fee5aa7a0b1cd77c" :TEXT
   "MASTER :OK :STABLE 0 sources=641 wall=175.572866d0 stdout=216461 stderr=352059
SPK-01 :OK :STABLE 0 stderr=0
SPK-02 :OK :STABLE 0 stderr=0
SPK-03 :OK :STABLE 0 stderr=0
SPK-04 :OK :STABLE 0 stderr=0
SPK-05 :OK :STABLE 0 stderr=0
SPK-06 :OK :STABLE 0 stderr=0
SPK-07 :PASS :STABLE 0 stderr=0
SPK-08 :OK :STABLE 0 stderr=0
SPK-09 :OK :STABLE 0 stderr=0
SPK-10 :OK :STABLE 0 stderr=0
CONSERVAZIONE :OK 0
CONSERVAZIONE :OK 0
")
  (:PATH #A((45) BASE-CHAR . "spikes/out/worker-series-fullcheck-output.txt") :BYTES 390 :SHA256
   "3a3c8d210b5e833db9a233fa506cfb765611aec74bc52c27d1bc8b7c2cc778c7" :GIT-BLOB
   "17914fc5fe583a816f71e7ddb75368d53a839998" :TEXT
   "sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- /Applications/Xcode.app/Contents/Developer/usr/bin/make check-core
:OK: /Applications/Xcode.app/Contents/Developer/usr/bin/make check-core; record: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710249-command-34111-0/report.lisp
")))
