;;;; C4: completed check-core and referenced child DATA only; no product or driver call.
(load "tools/evidence-storage.lisp")
(defpackage #:cbor.tag.integrated.reading (:use #:cl))
(in-package #:cbor.tag.integrated.reading)

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

(defun raw-data (string &key (start 0) eof-required)
  (let ((*read-eval* nil) (*readtable* (copy-readtable nil)) (*read-base* 10)
        (*read-suppress* nil) (eof (gensym)))
    (with-input-from-string (stream string :start start)
      (let ((form (read stream nil eof)))
        (assert (not (eq form eof)))
        (when eof-required (assert (eq eof (read stream nil eof)))) form))))
(defun text (path)
  (with-open-file (stream path :external-format :utf-8)
    (let ((string (make-string (file-length stream))))
      (subseq string 0 (read-sequence string stream)))))
(defun embedded-selftest (stdout marker)
  (let* ((begin (search marker stdout))
         (line-end (and begin (position #\Newline stdout :start begin)))
         (start (and line-end (search "(:" stdout :start2 line-end))))
    (assert start) (raw-data stdout :start start)))
(defun pin-path (path pins)
  (pushnew (cons (namestring (pathname path)) (arcdocdb.evidence:file-sha256 path)) pins :test #'equal)
  (when (string= "gz" (or (pathname-type path) "")) (error "Descriptor expected."))
  (unless (zerop (arcdocdb.evidence:file-bytes path))
    (let ((descriptor (literal-descriptor path)))
      (when (eq :compressed-evidence (getf descriptor :kind))
        (let ((payload (merge-pathnames (getf descriptor :payload) path)))
          (pushnew (cons (namestring payload) (arcdocdb.evidence:file-sha256 payload)) pins :test #'equal)))))
  pins)

(defun check-selftest (stdout path marker kind child-kind count sources pins)
  (let* ((metadata (embedded-selftest stdout marker))
         (fixture (arcdocdb.evidence:read-evidence path))
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
               (string= "3a985282de01545ab18241298d3c5bb62190520963df148e34c863a66030ce33" descriptor-sha)
               (= 155883 (getf descriptor :compressed-bytes) (arcdocdb.evidence:file-bytes payload))
               (= 1317223 (getf descriptor :uncompressed-bytes))
               (string= payload-sha (getf descriptor :compressed-sha256))))
  (assert (and (eql 1 (getf record :schema-version)) (eq :command-verification (getf record :kind))
               (eq :ok (getf record :status)) (eql 0 (getf record :exit-code))
               (eq :stable (getf record :source-consistency)) (equalp before after)
               (= 892 (length before) (length (remove-duplicates before :test #'string=
                                                        :key (lambda (row) (getf row :path)))))
               (string= "df37306ed0e97f1665fb9f59aca79842c49d96a5" (getf (getf record :environment) :commit))
               (string= "" (getf (getf record :environment) :working-tree))
               (= 314.315971d0 (getf record :wall-seconds))))
  (dolist (pin pins)
    (let ((row (find (first pin) before :key (lambda (entry) (getf entry :path)) :test #'string=)))
      (assert row) (assert (string= (second pin) (getf row :git-blob)))))
  (assert (and (= 1418 (length ok) (length (remove-duplicates ok :test #'string=)))
               (= 1412 (length nominal)) (= 2 (length smoke)) (= 4 (length linter))
               (= 20 (length tag-ok) (length (remove-duplicates tag-ok :test #'string=)))
               (null (set-exclusive-or tag-ok expected :test #'string=))))
  (assert (member "build e test: nessun avviso, tutti i controlli superati" all :test #'string=))
  (dolist (line '("214 file, 0 violazioni"
                  "121 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori"
                  "472 file, 2988 link controllati, 0 rotti"))
    (assert (member line all :test #'string=)))
  ;; Only compiler/build diagnostics precede the exact completion marker.
  ;; Later STDOUT intentionally serializes Unhandled from two negative fixture children.
  (let* ((complete (search "build e test: nessun avviso, tutti i controlli superati" stdout))
         (build-stdout (progn (assert complete) (subseq stdout 0 complete))))
    (assert (not (some (lambda (marker)
                        (or (search marker build-stdout :test #'char-equal)
                            (search marker stderr :test #'char-equal)))
                      '("WARNING:" "STYLE-WARNING:" "COMPILE-FILE-ERROR" "Unhandled ")))))
  (format t "INPUT descriptor317 bytes SHA~A; gzip155883 SHA~A; trusted-expanded1317223 SHA~A/EOF/READ-EVAL NIL.~%"
          descriptor-sha payload-sha (getf descriptor :uncompressed-sha256))
  (format t "COMMAND ~S~%OUTER schema1/COMMAND-VERIFICATION OK/exit0/STABLE wall~S HEAD~A clean; sources892 unique before=after; frozen5pins matched.~%"
          (getf record :command) (getf record :wall-seconds) (getf (getf record :environment) :commit))
  (format t "OUTPUT stdout~D chars stderr~D chars; warning/compile/Unhandled markers0 in compiler-build phase and main STDERR; stderr optimization-note lines~D.~%"
          (length stdout) (length stderr)
          (count-if (lambda (line) (search "note:" line :test #'char-equal)) (lines stderr)))
  (format t "OK1418 unique = nominal1412 + smoke2 + linter-selftest4; tag20 exact frozen functions.~%SMOKE ~S~%LINTER ~S~%" smoke linter)
  (dolist (line tag-ok) (write-line line))
  (dolist (line all)
    (when (or (string= line "214 file, 0 violazioni")
              (string= line "121 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori")
              (string= line "472 file, 2988 link controllati, 0 rotti")) (write-line line)))
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
  (let* ((start (search "(:STATUS :OK :CATALOGS" stdout))
         (evidence (progn (assert start) (raw-data stdout :start start))))
    (assert (and (eq :ok (getf evidence :status)) (= 102 (getf evidence :catalogs))
                 (= 3237 (getf evidence :artifact-references)) (= 28687 (getf evidence :stored-files))))
    (format t "EVIDENCE DATA statusOK catalogs102 references3237 stored-files28687; no archive rescan; limits~S.~%" (getf evidence :limits)))
  (let* ((start (search "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-PUBLICATION-TESTS" stdout))
         (publication (progn (assert start) (raw-data stdout :start start))))
    (assert (and (eql 1 (getf publication :schema-version)) (eq :evidence-publication-tests (getf publication :kind))
                 (eq :ok (getf publication :status)) (= 2 (getf publication :checks))
                 (= 2 (length (getf publication :cases)))))
    (loop for row in (getf publication :cases)
          for fixture in '("fuori-catalogo.lisp" "fuori-catalogo.gz")
          for bytes in '(1048577 8388929)
          do (assert (and (string= fixture (getf row :fixture)) (eql bytes (getf row :bytes))
                          (eq :ok (getf row :status)) (eql 1 (getf row :observed-exit-code))
                          (string= "" (getf row :stdout))
                          (search "Unhandled SIMPLE-ERROR" (getf row :stderr))))
             (format t "PUBLICATION negative ~A bytes~D: statusOK observed-exit1; expected Unhandled retained inside quoted DATA stderr.~%"
                     fixture bytes)))
  (let ((data-pins nil))
    (setf data-pins (check-selftest stdout "spikes/out/4000996874-snapshot-self-test-69641-0/report.lisp"
                                   "Snapshot: fixture processi conservate in " :snapshot-mutations :snapshot-mutation-child 10 21 data-pins))
    (setf data-pins (check-selftest stdout "spikes/out/4000996874-reader-self-test-69697-0/report.lisp"
                                   "Reader: fixture processi conservate in " :reader-mutations :reader-mutation-child 8 34 data-pins))
    (setf data-pins (check-spikes stdout record data-pins))
    (dolist (pin data-pins) (assert (string= (cdr pin) (arcdocdb.evidence:file-sha256 (car pin)))))
    (format t "REFERENCED metadata/raw/descriptor files~D SHA stable during DATA reading; not a source or archive SHA sweep.~%" (length data-pins)))
  (assert (string= descriptor-sha (arcdocdb.evidence:file-sha256 path)))
  (assert (string= payload-sha (arcdocdb.evidence:file-sha256 payload)))
  (assert (string= self-sha (arcdocdb.evidence:file-sha256 self)))
  (format t "FINAL descriptor/payload/reader stable; reader SHA~A. DATA only; no product/suite/driver LOAD/EVAL/compile/call or campaign rerun; recorded check/spike/evidence results, no authenticity/MC/DC/scaling/engine qualification.~%" self-sha))
