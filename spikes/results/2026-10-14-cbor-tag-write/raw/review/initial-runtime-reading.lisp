;;;; C4: solo DATA della prima build congelata; nessun prodotto o suite caricato.
(load "tools/evidence-storage.lisp")
(defpackage #:cbor.tag.initial.reading (:use #:cl))
(in-package #:cbor.tag.initial.reading)

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
(defun current-git-blob (path)
  (let ((process nil))
    (unwind-protect
         (progn
           (setf process (sb-ext:run-program "git" (list "hash-object" path)
                                            :search t :wait nil :output :stream :error :stream))
           (let ((result (read-line (sb-ext:process-output process) nil)))
             (assert (eq :eof (read-line (sb-ext:process-output process) nil :eof)))
             (assert (eq :eof (read-line (sb-ext:process-error process) nil :eof)))
             (sb-ext:process-wait process)
             (assert (and (eq :exited (sb-ext:process-status process))
                          (eql 0 (sb-ext:process-exit-code process))))
             (assert (and (stringp result) (= 40 (length result)))) result))
      (when process (sb-ext:process-close process)))))

(let* ((path "spikes/out/4000996656-command-60753-0/report.lisp")
       (self "spikes/out/cbor-tag-write-20261014/review/initial-runtime-reading.lisp")
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
               (string= "983e3c3a1652450f5fb8ad5fd43c54e82aa3bdcaf2aa8e59894d04204e64aa17" descriptor-sha)
               (= 149047 (getf descriptor :compressed-bytes) (arcdocdb.evidence:file-bytes payload))
               (= 1274223 (getf descriptor :uncompressed-bytes))
               (string= "43185e975389a26efc85c75d9d8a2a77db42642104c5e077a3d18d27aea26ede" payload-sha)
               (string= payload-sha (getf descriptor :compressed-sha256))
               (string= "07e10b78fa463a9c88284093d4a8d513d68ea7c13a33f9834e5a7e9a6615bcf5"
                        (getf descriptor :uncompressed-sha256))))
  (assert (and (eql 1 (getf record :schema-version)) (eq :command-verification (getf record :kind))
               (eq :ok (getf record :status)) (eql 0 (getf record :exit-code))
               (equal '("make" "build" "lint" "trace" "links") (getf record :command))
               (eq :stable (getf record :source-consistency)) (equalp before after)
               (= 892 (length before) (length (remove-duplicates before :test #'string=
                                                         :key (lambda (row) (getf row :path)))))
               (string= "df37306ed0e97f1665fb9f59aca79842c49d96a5" (getf (getf record :environment) :commit))
               (string= "" (getf (getf record :environment) :working-tree))
               (= 43.046935d0 (getf record :wall-seconds))))
  (dolist (pin pins)
    (dolist (snapshot (list before after))
      (let ((row (find (first pin) snapshot :key (lambda (entry) (getf entry :path)) :test #'string=)))
        (assert row) (assert (string= (second pin) (getf row :git-blob)))))
    (assert (string= (second pin) (current-git-blob (first pin)))))
  (assert (and (= 1414 (length ok) (length (remove-duplicates ok :test #'string=)))
               (= 1412 (length nominal)) (= 2 (length smoke))
               (null (set-exclusive-or smoke '("ok    ARCDOCDB:*VERSION* è una stringa"
                                               "ok    package ARCDOCDB presente") :test #'string=))
               (= 20 (length tag-ok) (length (remove-duplicates tag-ok :test #'string=)))
               (null (set-exclusive-or tag-ok expected :test #'string=))))
  (assert (member "build e test: nessun avviso, tutti i controlli superati" all :test #'string=))
  (dolist (line '("214 file, 0 violazioni"
                  "121 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori"
                  "471 file, 2988 link controllati, 0 rotti"))
    (assert (member line all :test #'string=)))
  (assert (not (some (lambda (marker)
                      (or (search marker stdout :test #'char-equal) (search marker stderr :test #'char-equal)))
                    '("WARNING:" "STYLE-WARNING:" "Unhandled " "COMPILE-FILE-ERROR"))))
  (format t "INPUT descriptor317 SHA~A; gzip149047 SHA~A; expanded1274223 SHA~A/EOF/READ-EVAL NIL.~%"
          descriptor-sha payload-sha (getf descriptor :uncompressed-sha256))
  (format t "COMMAND ~S~%OUTER schema1/COMMAND-VERIFICATION OK/exit0/STABLE wall~S HEAD~A clean; sources892 unique before=after; frozen5pins matched before/after/current.~%"
          (getf record :command) (getf record :wall-seconds) (getf (getf record :environment) :commit))
  (format t "OUTPUT stdout~D chars stderr~D chars; forbidden diagnostic markers0, stderr optimization-note lines~D.~%"
          (length stdout) (length stderr)
          (count-if (lambda (line) (search "note:" line :test #'char-equal)) (lines stderr)))
  (format t "OK1414 unique = nominal1412 + smoke2; tag20 exact frozen functions.~%SMOKE ~S~%" smoke)
  (dolist (line tag-ok) (write-line line))
  (dolist (line all)
    (when (member line '("214 file, 0 violazioni"
                        "121 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori"
                        "471 file, 2988 link controllati, 0 rotti") :test #'string=)
      (write-line line)))
  (let ((fuzz "  CBOR tag fuzz: seed54414737, 1024 casi, 512 successi e 64 ciascuno capacita/byte/high/nodi/profondita/parse/source-range/empty.")
        (state #x54414737) (counts (make-array 9 :initial-element 0)))
    (assert (member fuzz all :test #'string=))
    (dotimes (iteration 1024)
      (setf state (logand #xffffffff (+ (* state 1664525) 1013904223)))
      (incf (aref counts (if (< (mod iteration 16) 8) 0 (- (mod iteration 16) 7)))))
    (assert (= state #xf8004b37)) (assert (equalp counts #(512 64 64 64 64 64 64 64 64)))
    (write-line fuzz)
    (format t "COLD LCG finalF8004B37 counts~S. Final state asserted in frozen test, not printed in stdout.~%" counts))
  (let ((waves (remove-if-not (lambda (line) (prefixp "  CBOR tag: onda" line)) all)))
    (assert (= 2 (length waves)))
    (loop for line in waves for wave from 0
          do (assert (= wave (number-after line "onda")))
             (assert (search ", 2 worker riusati, 4096 composizioni, sink 66766848/97310720," line))
             (let ((overlap (number-after line "overlap ")) (rate (number-after line "tick (")))
               (assert (plusp overlap)) (assert (= 1000000 rate))
               (assert (= overlap (if (zerop wave) 2333 2329)))
               (write-line line)
               (format t "WAVE~D observed overlap ~,6F seconds; individual start/finish intervals not printed.~%"
                       wave (/ overlap (float rate 1d0))))))
  (let ((serial-accepted '(52 56 3 0 0 0 0 1 0 5 3 2 5 9 0 4 1 3))
        (serial-rejected '(52 56 0 15 18 14 5 17 14 20 5 4 5 11 16 44 2 0)))
    (assert (= 144 (reduce #'+ serial-accepted)))
    (assert (= 298 (reduce #'+ serial-rejected)))
    (assert (= 9658 (+ (reduce #'+ serial-accepted) (reduce #'+ serial-rejected) 1024 8192)))
    (assert (= 8848 (+ 144 512 8192))) (assert (= 810 (+ 298 512)))
    (format t "ARITHMETIC planned calls: serial442+fuzz1024+parallel8192=9658; accepted144+512+8192=8848; rejected298+512=810. Additional scanner checks116. Not instrumented API counters.~%"))
  (dolist (pin pins) (assert (string= (second pin) (current-git-blob (first pin)))))
  (assert (string= descriptor-sha (arcdocdb.evidence:file-sha256 path)))
  (assert (string= payload-sha (arcdocdb.evidence:file-sha256 payload)))
  (assert (string= self-sha (arcdocdb.evidence:file-sha256 self)))
  (format t "FINAL descriptor/payload/reader SHA and current5pins stable; reader SHA~A. DATA only; no product/suite/driver LOAD/EVAL/compile/call, no rerun, whole check/spike/evidence, heap, coverage, mutation or authenticity/MC/DC/scaling qualification.~%" self-sha))
