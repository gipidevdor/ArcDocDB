;;;; C4: initial frozen command DATA only; no product/suite/driver LOAD or call.
(load "tools/evidence-storage.lisp")
(defpackage #:cbor.map.initial.reading (:use #:cl))
(in-package #:cbor.map.initial.reading)

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

(let* ((path "spikes/out/4000985658-command-59509-0/report.lisp")
       (self "spikes/out/cbor-map-write-20261014/review/initial-runtime-reading.lisp")
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
       (map-ok (remove-if-not (lambda (line) (prefixp "ok    TEST-REQ-CBR-006-MAP-" line)) nominal))
       (expected
         (mapcar (lambda (suffix) (concatenate 'string "ok    TEST-REQ-CBR-006-MAP-" suffix))
                 '("EMPTY-SCALAR-PAIR-AND-TWO-LITERAL-PAIRS"
                   "PAIR-COUNT-WIDTH-BOUNDARIES-AND-MINIMAL-HEADER"
                   "NESTED-UTF8-FLOATS-OPAQUE-BYTES-AND-PRESERVED-PAIR-ORDER"
                   "CONCATENATION-NEXT-AND-REUSED-SPACE"
                   "DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING"
                   "SOURCE-TYPE-RANGE-AND-BACKING-ARRAY-INTACT"
                   "TABLE-TYPE-COUNT-DOMAINS-AND-HALF-LENGTH-BEFORE-MULTIPLICATION"
                   "WORKSPACE-TYPE-AND-ALL-SCRATCH-ALIASES-EVEN-EMPTY"
                   "CONFIGURED-LIMITS-AND-EMPTY-ROOT-MINIMUM"
                   "STRICT-ACTIVE-ENDS-LAST-AND-UNREAD-EVEN-OR-ODD-TAIL"
                   "ALL-PREFLIGHT-PHASE-PRECEDENCES"
                   "OVERLAP-ENTIRE-FOOTPRINT-TOUCHING-AND-EMPTY"
                   "FULL-BYTE-BUDGET-KEY-PLUS-VALUE-EXACT-16MIB-AND-OVER"
                   "ROOT-KEY-VALUE-TAG-NODES-AND-ZERO-RESIDUE-BEFORE-RESET"
                   "ROOT-DEPTH-SCALARS-TAGS-AND-99-100-CHILD-CONTAINERS"
                   "KEY-AND-VALUE-PARSER-ERRORS-ABSOLUTE-AND-LEFT-TO-RIGHT"
                   "REUSE-AFTER-VALUE-PARSER-AND-PREFLIGHT-ERRORS"
                   "SCRATCH-LAST-VALUE-AND-ZERO-PAIRS-NO-RESET"
                   "FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS"
                   "TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-INPUTS")))
       (pins '(("src/codec/cbor-map-input.lisp" "d7a593badeb6e6b71f28dc4e80c641b07189d0b8")
               ("src/codec/cbor-map-write.lisp" "22e814ea68e606c5bc58033c2a31e945303a9d65")
               ("tests/codec/cbor-map-write-support.lisp" "a389e51f2416437d608c4f7745b9680eca27bc60")
               ("tests/codec/cbor-map-write.lisp" "6ad0e9b5a48ba9c32c46d720f2f7f1821368d6c8")
               ("tests/codec/cbor-map-write-threads.lisp" "6a65b58ce236b92b33772e1861dbd8c1257bee13"))))
  (assert (and (eql 1 (getf descriptor :schema-version)) (eq :compressed-evidence (getf descriptor :kind))
               (eq :gzip (getf descriptor :codec)) (= 317 (arcdocdb.evidence:file-bytes path))
               (string= "379c3632670eecc48ce4ac41be66ff1991f50a408453d92b76730f64694eb543" descriptor-sha)
               (= 137522 (getf descriptor :compressed-bytes) (arcdocdb.evidence:file-bytes payload))
               (= 1100720 (getf descriptor :uncompressed-bytes))
               (string= payload-sha (getf descriptor :compressed-sha256))))
  (assert (and (eql 1 (getf record :schema-version)) (eq :command-verification (getf record :kind))
               (eq :ok (getf record :status)) (eql 0 (getf record :exit-code))
               (eq :stable (getf record :source-consistency)) (equalp before after)
               (= 860 (length before) (length (remove-duplicates before :test #'string=
                                                        :key (lambda (row) (getf row :path)))))
               (string= "15c458eff76896f3fc83ad7756ae922f64eb22d7" (getf (getf record :environment) :commit))
               (string= "" (getf (getf record :environment) :working-tree))
               (= 40.395196d0 (getf record :wall-seconds))))
  (dolist (pin pins)
    (let ((row (find (first pin) before :key (lambda (entry) (getf entry :path)) :test #'string=)))
      (assert row) (assert (string= (second pin) (getf row :git-blob)))))
  (assert (and (= 1286 (length ok) (length (remove-duplicates ok :test #'string=)))
               (= 1284 (length nominal)) (= 2 (length smoke))
               (= 20 (length map-ok) (length (remove-duplicates map-ok :test #'string=)))
               (null (set-exclusive-or map-ok expected :test #'string=))))
  (assert (member "build e test: nessun avviso, tutti i controlli superati" all :test #'string=))
  (dolist (line '("207 file, 0 violazioni"
                  "120 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori"
                  "440 file, 2914 link controllati, 0 rotti"))
    (assert (member line all :test #'string=)))
  (assert (not (some (lambda (marker)
                      (or (search marker stdout :test #'char-equal) (search marker stderr :test #'char-equal)))
                    '("WARNING:" "STYLE-WARNING:" "Unhandled " "COMPILE-FILE-ERROR"))))
  (format t "INPUT descriptor317 bytes SHA~A; gzip137522 SHA~A; trusted-expanded1100720 SHA~A/EOF/READ-EVAL NIL.~%"
          descriptor-sha payload-sha (getf descriptor :uncompressed-sha256))
  (format t "COMMAND ~S~%OUTER schema1/COMMAND-VERIFICATION OK/exit0/STABLE wall~S HEAD~A clean; sources860 unique before=after; frozen5pins matched.~%"
          (getf record :command) (getf record :wall-seconds) (getf (getf record :environment) :commit))
  (format t "OUTPUT stdout~D chars stderr~D chars; diagnostic forbidden markers0, stderr optimization-note lines~D.~%"
          (length stdout) (length stderr)
          (count-if (lambda (line) (search "note:" line :test #'char-equal)) (lines stderr)))
  (format t "OK1286 unique = nominal1284 + smoke2; map20 exact frozen functions.~%SMOKE ~S~%" smoke)
  (dolist (line map-ok) (write-line line))
  (dolist (line all)
    (when (or (string= line "207 file, 0 violazioni")
              (string= line "120 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori")
              (string= line "440 file, 2914 link controllati, 0 rotti")) (write-line line)))
  (let ((fuzz "  CBOR map fuzz: seed4D415035, 1024 casi, 512 successi e 64 ciascuno capacita/byte/entry/nodi/profondita/parse/source-range/count.")
        (state #x4d415035) (counts (make-array 9 :initial-element 0)))
    (assert (member fuzz all :test #'string=))
    (dotimes (iteration 1024)
      (setf state (logand #xffffffff (+ (* state 1664525) 1013904223)))
      (incf (aref counts (if (< (mod iteration 16) 8) 0 (- (mod iteration 16) 7)))))
    (assert (= state #x0d123435)) (assert (equalp counts #(512 64 64 64 64 64 64 64 64)))
    (write-line fuzz)
    (format t "COLD LCG final0D123435 counts~S. Final state is asserted in frozen test, not printed in stdout.~%" counts))
  (let ((waves (remove-if-not (lambda (line) (prefixp "  CBOR map: onda" line)) all)))
    (assert (= 2 (length waves)))
    (loop for line in waves for wave from 0
          do (assert (= wave (number-after line "onda")))
             (assert (search ", 2 worker riusati, 4096 composizioni, sink 54677504/77537280," line))
             (let ((overlap (number-after line "overlap ")) (rate (number-after line "tick (")))
               (assert (plusp overlap)) (assert (= 1000000 rate))
               (write-line line)
               (format t "WAVE~D observed overlap ~,6F seconds; individual start/finish intervals not printed.~%"
                       wave (/ overlap (float rate 1d0))))))
  (format t "ARITHMETIC planned calls: serial283+fuzz1024+parallel8192=9499; success84+512+8192=8788, rejection199+512=711. Not instrumented API counters.~%")
  (assert (string= descriptor-sha (arcdocdb.evidence:file-sha256 path)))
  (assert (string= payload-sha (arcdocdb.evidence:file-sha256 payload)))
  (assert (string= self-sha (arcdocdb.evidence:file-sha256 self)))
  (format t "FINAL descriptor/payload/reader stable; reader SHA~A. DATA only; no product or suite LOAD/EVAL/compile/call, no campaign rerun, no whole check/spike/evidence, authenticity/MC/DC/scaling qualification.~%" self-sha))
