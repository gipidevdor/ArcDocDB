;;;; C4: initial frozen command DATA only; no product/suite/driver LOAD or call.
(load "tools/evidence-storage.lisp")
(defpackage #:cbor.tag.final.reading (:use #:cl))
(in-package #:cbor.tag.final.reading)

(defun lines (string)
  (with-input-from-string (stream string)
    (loop for line = (read-line stream nil) while line
          collect (string-right-trim '(#\Return) line))))
(defun prefixp (prefix string)
  (and (<= (length prefix) (length string)) (string= prefix string :end2 (length prefix))))
(defun number-after (line label)
  (let ((position (search label line)))
    (assert position)
    (multiple-value-bind (value end)
        (parse-integer line :start (+ position (length label)) :junk-allowed t)
      (assert value) (values value end))))
(defun literal-descriptor (path)
  (let ((*read-eval* nil) (*readtable* (copy-readtable nil)) (*read-base* 10)
        (*read-suppress* nil) (eof (gensym)))
    (with-open-file (stream path :external-format :utf-8)
      (let ((form (read stream nil eof)))
        (assert (not (eq form eof))) (assert (eq eof (read stream nil eof))) form))))

(let* ((path "spikes/out/4000997959-command-5777-0/report.lisp")
       (self "spikes/out/cbor-tag-write-20261014/review/final-integration-reading.lisp")
       (self-sha (arcdocdb.evidence:file-sha256 self))
       (descriptor-sha (arcdocdb.evidence:file-sha256 path))
       (descriptor (literal-descriptor path))
       (payload (merge-pathnames (getf descriptor :payload) path))
       (payload-sha (arcdocdb.evidence:file-sha256 payload))
       (record (arcdocdb.evidence:read-evidence path))
       (before (getf record :source-blobs-before)) (after (getf record :source-blobs-after))
       (stdout (getf record :stdout)) (stderr (getf record :stderr)) (all (lines stdout))
       (ok (remove-if-not (lambda (line) (prefixp "ok    " line)) all))
       (nominal (remove-if-not (lambda (line) (prefixp "ok    TEST-" line)) ok))
       (smoke (set-difference ok nominal :test #'string=))
       (tag-ok (remove-if-not (lambda (line) (prefixp "ok    TEST-REQ-CBR-007-TAG-" line)) nominal))
       (expected
         (mapcar (lambda (suffix) (concatenate 'string "ok    TEST-REQ-CBR-007-TAG-" suffix))
                 '("U32-WORD-WIDTH-BOUNDARIES-AND-ALL-WIRE-SENTINELS"
                   "OPAQUE-SCALARS-UTF8-FLOATS-CONTAINERS-AND-PAIR-ORDER"
                   "CONCATENATION-NEXT-AND-EXACT-RETURN-ARITY"
                   "DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING"
                   "SOURCE-TYPE-RANGE-EMPTY-AND-BACKING-ARRAY-INTACT"
                   "HIGH-THEN-LOW-DOMAIN-PRECEDENCE-WITHOUT-U64"
                   "WORKSPACE-TYPE-AND-BOTH-KINDS-ALIASES"
                   "CONFIGURED-LIMITS-AND-ROOT-TWO-NODE-MINIMUM"
                   "ALL-PREFLIGHT-PHASE-PRECEDENCES"
                   "CAPACITY-ACTIVE-END-AND-COMPLETE-BYTE-BUDGET"
                   "OVERLAP-INCLUDING-ONLY-HEADER-AND-TOUCHING-BOUNDARIES"
                   "FULL-16MIB-WITH-ONE-AND-NINE-BYTE-HEADER-AND-OVER"
                   "ROOT-AND-CONTENT-NODE-RESIDUE-LONG-TAG-CHAINS-NO-FRAME"
                   "DEPTH-UNCHANGED-ZERO-SCALARS-AND-100-101-CONTAINERS"
                   "PARSER-FAILURES-ABSOLUTE-OFFSET-AND-COMPLETE-SINGLE-ITEM"
                   "EVERY-TRUNCATION-NONZERO-SOURCE-START-AND-EXACT-END"
                   "SCRATCH-REUSE-AFTER-PARSER-AND-PREFLIGHT-ERRORS"
                   "SCRATCH-CONTENT-ONLY-STATISTICS-AFTER-SUCCESS"
                   "FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS"
                   "TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-SOURCE")))
       (pins '(("src/codec/cbor-tag-input.lisp" "6dfad07035ac8040b2aec0a455c175ea15dfd9ad")
               ("src/codec/cbor-tag-write.lisp" "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b")
               ("tests/codec/cbor-tag-write-support.lisp" "15978d05251705387205d6468031a701ad95ec85")
               ("tests/codec/cbor-tag-write.lisp" "df97950ec8d24157bb6566c7995262f7beea7742")
               ("tests/codec/cbor-tag-write-threads.lisp" "def870295400af2c84ca00e7a9b5cd5b747ec315"))))
  (assert (and (eql 1 (getf descriptor :schema-version)) (eq :compressed-evidence (getf descriptor :kind))
               (eq :gzip (getf descriptor :codec)) (= 317 (arcdocdb.evidence:file-bytes path))
               (string= "4dd73de1fe445cad08737f2090081794963da9143e7173e91cb2d31d87e6f0b9" descriptor-sha)
               (= 153126 (getf descriptor :compressed-bytes) (arcdocdb.evidence:file-bytes payload))
               (= 1312918 (getf descriptor :uncompressed-bytes))
               (string= payload-sha (getf descriptor :compressed-sha256))))
  (assert (and (eql 1 (getf record :schema-version)) (eq :command-verification (getf record :kind))
               (eq :ok (getf record :status)) (eql 0 (getf record :exit-code))
               (eq :stable (getf record :source-consistency)) (equalp before after)
               (= 912 (length before) (length (remove-duplicates before :test #'string=
                                                        :key (lambda (row) (getf row :path)))))
               (string= "7fbd327f9b0a042bd053cd8aed98e3f105a6688c" (getf (getf record :environment) :commit))
               (string= "" (getf (getf record :environment) :working-tree))
               (= 45.121117d0 (getf record :wall-seconds))))
  (assert (equal '("make" "build" "lint" "trace" "links") (getf record :command)))
  (assert (null (set-exclusive-or smoke
                   '("ok    ARCDOCDB:*VERSION* è una stringa" "ok    package ARCDOCDB presente")
                   :test #'string=)))
  (dolist (pin pins)
    (let ((row (find (first pin) before :key (lambda (entry) (getf entry :path)) :test #'string=)))
      (assert row) (assert (string= (second pin) (getf row :git-blob)))))
  (assert (and (= 1442 (length ok) (length (remove-duplicates ok :test #'string=)))
               (= 1440 (length nominal)) (= 2 (length smoke))
               (= 20 (length tag-ok) (length (remove-duplicates tag-ok :test #'string=)))
               (null (set-exclusive-or tag-ok expected :test #'string=))))
  (assert (member "build e test: nessun avviso, tutti i controlli superati" all :test #'string=))
  (dolist (line '("224 file, 0 violazioni"
                  "121 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori"
                  "490 file, 3041 link controllati, 0 rotti"))
    (assert (member line all :test #'string=)))
  (assert (not (some (lambda (marker)
                      (or (search marker stdout :test #'char-equal) (search marker stderr :test #'char-equal)))
                    '("WARNING:" "STYLE-WARNING:" "Unhandled " "COMPILE-FILE-ERROR"))))
  (format t "INPUT descriptor317 bytes SHA~A; gzip153126 SHA~A; trusted-expanded1312918 SHA~A/EOF/READ-EVAL NIL.~%"
          descriptor-sha payload-sha (getf descriptor :uncompressed-sha256))
  (format t "COMMAND ~S~%OUTER schema1/COMMAND-VERIFICATION OK/exit0/STABLE wall~S HEAD~A clean; sources912 unique before=after; frozen5pins matched.~%"
          (getf record :command) (getf record :wall-seconds) (getf (getf record :environment) :commit))
  (format t "OUTPUT stdout~D chars stderr~D chars; diagnostic forbidden markers0, stderr optimization-note lines~D.~%"
          (length stdout) (length stderr)
          (count-if (lambda (line) (search "note:" line :test #'char-equal)) (lines stderr)))
  (format t "OK1442 unique = nominal1440 + smoke2; tag20 exact frozen functions.~%SMOKE ~S~%" smoke)
  (dolist (line tag-ok) (write-line line))
  (dolist (line all)
    (when (or (string= line "224 file, 0 violazioni")
              (string= line "121 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori")
              (string= line "490 file, 3041 link controllati, 0 rotti")) (write-line line)))
  (let ((fuzz "  CBOR tag fuzz: seed54414737, 1024 casi, 512 successi e 64 ciascuno capacita/byte/high/nodi/profondita/parse/source-range/empty.")
        (state #x54414737) (counts (make-array 9 :initial-element 0)))
    (assert (member fuzz all :test #'string=))
    (dotimes (iteration 1024)
      (setf state (logand #xffffffff (+ (* state 1664525) 1013904223)))
      (incf (aref counts (if (< (mod iteration 16) 8) 0 (- (mod iteration 16) 7)))))
    (assert (= state #xf8004b37)) (assert (equalp counts #(512 64 64 64 64 64 64 64 64)))
    (write-line fuzz)
    (format t "COLD LCG finalF8004B37 counts~S. Final state is asserted in frozen test, not printed in stdout.~%" counts))
  (let ((waves (remove-if-not (lambda (line) (prefixp "  CBOR tag: onda" line)) all)))
    (assert (= 2 (length waves)))
    (loop for line in waves for wave from 0
          do (assert (= wave (number-after line "onda")))
             (assert (search ", 2 worker riusati, 4096 composizioni, sink 66766848/97310720," line))
             (let ((overlap (number-after line "overlap ")) (rate (number-after line "tick (")))
               (assert (plusp overlap)) (assert (= 1000000 rate))
               (write-line line)
               (format t "WAVE~D observed overlap ~,6F seconds; individual start/finish intervals not printed.~%"
                       wave (/ overlap (float rate 1d0))))))
  (format t "ARITHMETIC planned calls: serial442+fuzz1024+parallel8192=9658; success144+512+8192=8848, rejection298+512=810. Not instrumented API counters.~%")
  (assert (string= descriptor-sha (arcdocdb.evidence:file-sha256 path)))
  (assert (string= payload-sha (arcdocdb.evidence:file-sha256 payload)))
  (assert (string= self-sha (arcdocdb.evidence:file-sha256 self)))
  (format t "FINAL descriptor/payload/reader stable; reader SHA~A. DATA only; no product or suite LOAD/EVAL/compile/call, no campaign rerun, no whole check/spike/evidence, authenticity/MC/DC/scaling qualification.~%" self-sha))
