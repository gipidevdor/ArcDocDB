(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "core-R1-outer" :RECORD-PATH "raw/core-R1-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((290) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-R1-inner" :RECORD-PATH "raw/core-R1-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-R2-outer" :RECORD-PATH "raw/core-R2-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((290) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-R2-inner" :RECORD-PATH "raw/core-R2-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-R3-outer" :RECORD-PATH "raw/core-R3-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((290) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-R3-inner" :RECORD-PATH "raw/core-R3-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "counter-947" :RECORD-PATH "raw/counter-947/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((18) BASE-CHAR . "--disable-debugger") #A((8) BASE-CHAR . "--script")
    #A((55) BASE-CHAR
       . "spikes/out/active-recovery-audit-tools/count-tests.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((76) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "94719b40461c8722d1a6069fb29e63faf1eee40c"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "counter-b92" :RECORD-PATH "raw/counter-b92/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((18) BASE-CHAR . "--disable-debugger") #A((8) BASE-CHAR . "--script")
    #A((55) BASE-CHAR
       . "spikes/out/active-recovery-audit-tools/count-tests.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((76) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "b92c1a25619279f1d4e1244fc970b3829c0ecca4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "syntax-947" :RECORD-PATH "raw/syntax-947/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((18) BASE-CHAR . "--disable-debugger") #A((6) BASE-CHAR . "--eval")
    #A((19) BASE-CHAR . "(require :sb-posix)") #A((6) BASE-CHAR . "--eval")
    #A((3771) BASE-CHAR
       . "(progn (let ((package (or (find-package \"ARCDOCDB.CONDITIONS\") (make-package \"ARCDOCDB.CONDITIONS\" :use nil)))) (dolist (name (list \"ARCDOCDB-ERROR\" \"CORRUPTION-DETECTED\" \"ERROR-OFFSET\" \"ERROR-REASON\" \"INVALID-ARGUMENT\" \"IO-FAULT\" \"RESOURCE-EXHAUSTED\")) (export (intern name package) package))) (let ((package (or (find-package \"ARCDOCDB.RECOVERY.MANIFEST\") (make-package \"ARCDOCDB.RECOVERY.MANIFEST\" :use nil)))) (dolist (name (list \"PROSSIMO-ID-SEGMENTO\" \"SEGMENTO-ATTIVO\" \"TROVA-ESITO-CHIUSURA\" \"TROVA-SEGMENTO\")) (export (intern name package) package))) (let ((package (or (find-package \"ARCDOCDB.RECOVERY.SCAN\") (make-package \"ARCDOCDB.RECOVERY.SCAN\" :use nil)))) (dolist (name (list \"CORRUPTION-DURABLE-OFFSET\" \"CORRUPTION-FIRST-REASON\" \"CORRUPTION-PREFIX-END\" \"CORRUPTION-WITNESS-OFFSET\" \"LOG-CORRUPTION\")) (export (intern name package) package))) (let ((package (or (find-package \"ARCDOCDB.STORAGE.FORMAT\") (make-package \"ARCDOCDB.STORAGE.FORMAT\" :use nil)))) (dolist (name (list \"VERIFICA-HEADER-LOG\")) (export (intern name package) package))) (let ((package (or (find-package \"C\") (make-package \"C\" :use nil)))) (dolist (name (list \"CONTROL-PUBBLICATO\" \"CREA-CHECKPOINT-CONTROL\" \"FRONTIERE-CONTROL-RECUPERATO\" \"LEGGI-CONTROL-RECUPERATO\" \"MANIFEST-CONTROL-PUBBLICATO\" \"MANIFEST-CONTROL-RECUPERATO\" \"STATO-PUBBLICAZIONE-CONTROL\")) (export (intern name package) package))) (let ((package (or (find-package \"CT\") (make-package \"CT\" :use nil)))) (dolist (name (list \"CONTROL-CRC\" \"CONTROL-PACK\" \"CONTROL-REFERENCE-CHECKPOINT\" \"CONTROL-REFERENCE-HEADER\" \"CRR-CAT\" \"CRR-UUID\" \"NATIVE-ABSENT\" \"NATIVE-ACTIVE\" \"NATIVE-BOUNDED\" \"NATIVE-CAPTURE-PRODUCT-ERROR\" \"NATIVE-CHECKPOINT-BYTES\" \"NATIVE-CHECKPOINT-INPUT\" \"NATIVE-CHECKPOINT-PREPARED\" \"NATIVE-FIXTURE-BACKEND\" \"NATIVE-FIXTURE-OBSERVER\" \"NATIVE-FIXTURE-ROOT\" \"NATIVE-IDENTITY\" \"NATIVE-LEAF\" \"NATIVE-OBSERVER-CALLS\" \"NATIVE-OBSERVER-DIRECTORY-FAILURE\" \"NATIVE-OPEN\" \"NATIVE-PATH-IDENTITY\" \"NATIVE-PREPARE-PLAN\" \"NATIVE-READ-BYTES\" \"NATIVE-RESET-CALLS\" \"NATIVE-SECONDS-LEFT\" \"NATIVE-VIEW\" \"RP-DATA-OBSERVATIONS\" \"RP-OBSERVATIONS\" \"RP-PAYLOAD\" \"RP-PREVIOUS-PAYLOAD\" \"RP-READ\" \"RP-RUN\" \"RP-SEED\" \"ZEROS\")) (export (intern name package) package))) (let ((package (or (find-package \"D\") (make-package \"D\" :use nil)))) (dolist (name (list \"RICOSTRUISCI-DECISIONI\")) (export (intern name package) package))) (let ((package (or (find-package \"G\") (make-package \"G\" :use nil)))) (dolist (name (list \"SEGMENTO-GET\" \"VISTA-GET-SERIE-IDENTITY\")) (export (intern name package) package))) (let ((package (or (find-package \"IO\") (make-package \"IO\" :use nil)))) (dolist (name (list \"CHIUDI\" \"DURABLE-FLUSH\" \"FILE-BACKEND\" \"STATO-FILE\")) (export (intern name package) package))) (let ((package (or (find-package \"RA\") (make-package \"RA\" :use nil)))) (dolist (name (list \"ACTIVE-RECUPERATO\" \"ESITO-CHIUSURA-ACTIVE\" \"FRONTIERE-ACTIVE-RECUPERATO\" \"LEGGI-ACTIVE-RECUPERATO\" \"LUNGHEZZA-CHIUSURA-ACTIVE\" \"PUBBLICA-CONTROL-DA-ACTIVE\" \"SCRIVI-CHIUSURA-ACTIVE\" \"SEGMENTO-ACTIVE-RECUPERATO\" \"STATISTICHE-ACTIVE-RECUPERATO\")) (export (intern name package) package))) (let ((package (or (find-package \"RT\") (make-package \"RT\" :use nil)))) (dolist (name (list \"DECISION-LOG-FIXTURE\" \"PARTICIPANT-ID\" \"REFERENCE-CRC\" \"REFERENCE-RECORD\")) (export (intern name package) package))) (with-standard-io-syntax (let ((*read-eval* nil) (eof (gensym))) (dolist (path (list \"tests/recovery-active/support.lisp\" \"tests/recovery-active/semantics.lisp\" \"tests/recovery-active/guards.lisp\" \"tests/recovery-active/publication.lisp\")) (with-open-file (stream path) (loop with count = 0 for form = (read stream nil eof) until (eq eof form) do (incf count) finally (format t \"READ PASS ~A: ~D forms, EOF, READ-EVAL NIL; no source forms evaluated.~%\" path count)))))))")
    #A((6) BASE-CHAR . "--quit"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-semantic-b92" :RECORD-PATH "raw/full-semantic-b92/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-tools/audit-F2.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((75) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "b92c1a25619279f1d4e1244fc970b3829c0ecca4")
    #A((14) BASE-CHAR . "--expect-tests") #A((4) BASE-CHAR . "1555")
    #A((6) BASE-CHAR . "--core")
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073651-command-78980-0/report.lisp")
    #A((12) BASE-CHAR . "--outer-core")
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073647-command-78833-0/report.lisp")
    #A((10) BASE-CHAR . "--fasl-dir")
    #A((111) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/")
    #A((8) BASE-CHAR . "--reader")
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-reader-self-test-83562-0/report.lisp")
    #A((10) BASE-CHAR . "--snapshot")
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-snapshot-self-test-83479-0/report.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "names-initial-reader-failure" :RECORD-PATH
   "raw/names-initial-reader-failure/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((17) BASE-CHAR . "--non-interactive") #A((6) BASE-CHAR . "--load")
    #A((27) BASE-CHAR . "tools/evidence-storage.lisp")
    #A((6) BASE-CHAR . "--eval")
    #A((1841) BASE-CHAR
       . "(let* ((counter-path \"spikes/out/active-recovery-count-runtime/count-b92c1a2.lisp\") (core-path \"spikes/out/4001073651-command-78980-0/report.lisp\") (counter (arcdocdb.evidence:read-evidence counter-path)) (core (arcdocdb.evidence:read-evidence core-path)) (row (find \"ARCDOCDB.RECOVERY.ACTIVE.TESTS\" (getf counter :suites) :test (function string=) :key (lambda (item) (getf item :package)))) (names (getf row :test-names))) (assert (and (eq :ok (getf counter :status)) (equal \"b92c1a25619279f1d4e1244fc970b3829c0ecca4\" (getf counter :commit)) (eq :ok (getf core :status)) (eql 0 (getf core :exit-code)) (eq :stable (getf core :source-consistency)) (= 27 (length names)))) (labels ((observed (text) (loop for line in (uiop:split-string text :separator (string #\\Newline)) when (and (uiop:string-prefix-p \"ok    \" line) (search \"ACTIVE-RECOVERY\" line)) collect (string-trim (list #\\Space #\\Tab #\\Return) (subseq line 6)))) (synthetic (items) (format nil \"~{ok    ~A~%~}\" items))) (assert (equal names (observed (synthetic names)))) (assert (not (equal names (observed (synthetic (rest names)))))) (assert (not (equal names (observed (synthetic (reverse names)))))) (assert (not (equal names (observed (synthetic (append names (list (first names))))))))) (let ((actual (observed (getf core :stdout)))) (assert (equal names actual)) (assert (search (getf row :native-line) (getf core :stdout))) (write (list :schema-version 1 :kind :recovery-active-native-names-audit :status :ok :commit (getf counter :commit) :counter counter-path :counter-sha256 (arcdocdb.evidence:file-sha256 counter-path) :core core-path :count (length actual) :ordered-native-test-names actual :positive-and-negative-fixtures 4 :limits (list :read-eval-disabled :one-form-and-eof :no-evidence-load :no-product-execution :no-c1-or-performance-claim)) :pretty t) (terpri))))"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "names-b92-qualified" :RECORD-PATH
   "raw/names-b92-qualified/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((54) BASE-CHAR
       . "spikes/out/active-recovery-name-tools/names-audit.lisp")
    #A((59) BASE-CHAR
       . "spikes/out/active-recovery-count-runtime/count-b92c1a2.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001073651-command-78980-0/report.lisp")
    #A((40) BASE-CHAR . "b92c1a25619279f1d4e1244fc970b3829c0ecca4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-plan/README.md.txt")
   :BYTES 3907 :SHA256
   "d9c3673c533686756b0d9d67374bf5af7d3a41a3c2464396c6092116fd75c7fd")
  (:PATH "archive-audit-contract.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-plan/archive-audit-contract.lisp")
   :BYTES 1705 :SHA256
   "ee1fc661ae25a79fdc014835d69ebeecd00b48f658d41f494d9e81065b490912")
  (:PATH "batch-sha-source.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-tools/batch-sha.lisp")
   :BYTES 5787 :SHA256
   "130f428551e1aa17a946c2614db5dc14adf9ae35309ec2b21c3be5b2d59be1da")
  (:PATH "byte-auditor-source.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-tools/audit-batch.lisp")
   :BYTES 26411 :SHA256
   "d17564b38f51cd54e7ae86241c82c0eaa81a41bc9a29ecc70a6f937d59d59173")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-plan/manifest.lisp")
   :BYTES 6565 :SHA256
   "a43bfcefe93ce05320e5d9d8b6bd8405e319b6d3ddd04bbe33578b2fcdb0d2d9")
  (:PATH "collection-source.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-execution-R1/collector-batch.lisp")
   :BYTES 24309 :SHA256
   "e6b2cdecbe1bf1602109161b07c7ce51c6716323238dea10e8f9cb7a96a4facf")
  (:PATH "collector-source.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-tools/collector-batch.lisp")
   :BYTES 24309 :SHA256
   "e6b2cdecbe1bf1602109161b07c7ce51c6716323238dea10e8f9cb7a96a4facf")
  (:PATH "counter-source.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-audit-tools/count-tests.lisp")
   :BYTES 14296 :SHA256
   "1cb93fc4901faefaa66fdfe4207f012f51f683f8ab622ec5a25a92aa4512541e")
  (:PATH "names-auditor-source.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-name-tools/names-audit.lisp")
   :BYTES 3105 :SHA256
   "457c94fb93c43270a9f031fc14d4ad97677400ba21e624e9cbd3fb1ca8da4ffc")
  (:PATH "raw/SPK-01-whole-cache/check-lettura-buffer.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-01-primary-index/out/check-lettura-buffer.fasl")
   :BYTES 112368 :SHA256
   "454a15f968a4eea22f45f20772d6edb307062b26b5a90739346f22d7113bab3d")
  (:PATH "raw/SPK-01-whole-cache/core.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-01-primary-index/out/core.fasl")
   :BYTES 158728 :SHA256
   "93ea46d0a83da535882a225511615625b07c99742d3a142fce9392ad335922f8")
  (:PATH "raw/SPK-01-whole-cache/lettura-buffer.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-01-primary-index/out/lettura-buffer.fasl")
   :BYTES 8183 :SHA256
   "621dcf0e55f94312ea13773087fdbdc99a5d529067c1a24877a35430a36afe73")
  (:PATH "raw/SPK-02-whole-cache/core.fasl" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-02-gc/out/core.fasl")
   :BYTES 110750 :SHA256
   "c86a8b86edc37bfa9f54ccbb1e5d5b894d07b0b94ba72940e0770b6770a51fa2")
  (:PATH "raw/SPK-03-whole-cache/core.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-03-group-commit/out/core.fasl")
   :BYTES 102620 :SHA256
   "012ddad681479f59696c9476daaccac4b63c19544e7b815e669fe69abe9c5ae7")
  (:PATH "raw/SPK-04-whole-cache/6995/core.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-04-writer-pool/out/6995/core.fasl")
   :BYTES 7332 :SHA256
   "d154d73c95a00095807453c91d054401ba4e9729928413757c22ccff6b2dbf64")
  (:PATH "raw/SPK-04-whole-cache/6995/parcheggi.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-04-writer-pool/out/6995/parcheggi.fasl")
   :BYTES 86750 :SHA256
   "1ff6f494746070bfa44f4c29a6c3e2f42ec2a5ec421b72522497cdf81e0bffe8")
  (:PATH "raw/SPK-04-whole-cache/6995/pool.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-04-writer-pool/out/6995/pool.fasl")
   :BYTES 96550 :SHA256
   "7f5597f153e194195a6ab4253183e9992a8a2a18f44dfe9288339ad85e6d15f2")
  (:PATH "raw/SPK-05-whole-cache/7095/core.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-05-segment-read/out/7095/core.fasl")
   :BYTES 68001 :SHA256
   "235f18ac35adbad79b03517b3f0d2b1efc7810719922c55fbbe4813b80c77071")
  (:PATH "raw/SPK-05-whole-cache/7095/io.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-05-segment-read/out/7095/io.fasl")
   :BYTES 62203 :SHA256
   "3f5cde61d9c1061371cf6c0899e2d6f429976c6a9ae8c9ec85cf34a0e1254c9d")
  (:PATH "raw/SPK-05-whole-cache/7095/record.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-05-segment-read/out/7095/record.fasl")
   :BYTES 24830 :SHA256
   "e67dfcad607a13602f90f1afc826a415494322043d6de1181839ed120acdbdd7")
  (:PATH "raw/SPK-06-whole-cache/7231/controllore.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/7231/controllore.fasl")
   :BYTES 66815 :SHA256
   "16c31c1ab65fcfc902dd36c3a69893b2f7956899afdc0443b9e31b944c442d16")
  (:PATH "raw/SPK-06-whole-cache/7231/core.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/7231/core.fasl")
   :BYTES 3307 :SHA256
   "255f7f41cf7c9367f5b4e5da3742d64d05db7c9892af7984ff55726d79e32227")
  (:PATH "raw/SPK-06-whole-cache/7231/interferenza.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/7231/interferenza.fasl")
   :BYTES 102522 :SHA256
   "adc782b9fdaa4ac0257429c4c8083b9b640a4647941bb9f2aabde9bb3df9d530")
  (:PATH "raw/SPK-06-whole-cache/7231/spk05-io.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/7231/spk05-io.fasl")
   :BYTES 62367 :SHA256
   "e4b0d97c8c72cbce5240c59c2a25091ece19dfea5c01c48d7cfd66f9f5662c6f")
  (:PATH "raw/SPK-06-whole-cache/7231/spk05-record.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/7231/spk05-record.fasl")
   :BYTES 24883 :SHA256
   "f836ef4c686c8bbcdd4e822fdb62c31cd9423cb0554e1a034364f51ea003dc26")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/byte-crash.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/byte-crash.fasl")
   :BYTES 114118 :SHA256
   "e58f8f792b231efc636c92016560eb307c0cc00616151f178692ade527eb25e5")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/compaction.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/compaction.fasl")
   :BYTES 86792 :SHA256
   "b4a8e86865f3e686b9482eac73794ddd3663e1ed6eccc8f067ed70e194d223ed")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/core.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/core.fasl")
   :BYTES 64589 :SHA256
   "25a93aff5712134b36139c42108176c24b8e79f33ec188e1f681847af95f180c")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/foundation-batch.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/foundation-batch.fasl")
   :BYTES 9742 :SHA256
   "af9af1e7e8f15f4960c486356030f512878f83e3d964b193426293d73a2a130d")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/foundation-binary.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/foundation-binary.fasl")
   :BYTES 9148 :SHA256
   "97906bafa4f40b3283d8830140e4f2703f6cdb2181d90a54a894859167493387")
  (:PATH
   "raw/SPK-07-whole-cache/suite-4001074097-7381/foundation-conditions.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/foundation-conditions.fasl")
   :BYTES 6449 :SHA256
   "f09b1ab861939dcb9fec8f2bc4c38107336bb93a16aa5233844cade67059d5fd")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/foundation-crc32c.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/foundation-crc32c.fasl")
   :BYTES 4324 :SHA256
   "0d373a6ab9cfcebaa91d62f5e41f0fe2e87e1c941a2b2d577617dc11b8454d7f")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/foundation-package.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/foundation-package.fasl")
   :BYTES 2155 :SHA256
   "561cbf3a0a0059409d8e08749294d5075c34dc9e0705fd31ff51954af81cfb21")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/foundation-record.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/foundation-record.fasl")
   :BYTES 36534 :SHA256
   "96b19479969c460f5579a7619d7145a837f48473392a2f4c96fa13c9a4783884")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/memoria.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/memoria.fasl")
   :BYTES 17429 :SHA256
   "2f47122b3ed203b06a6432b79815c8a6e4951ba79faf6791aada24bcb321a682")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/pubblicazione.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/pubblicazione.fasl")
   :BYTES 86647 :SHA256
   "8cb608a08016e32f937953032765f15c8fd64c431cefe4736aa0ab32fe31af64")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/root-package.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/root-package.fasl")
   :BYTES 1478 :SHA256
   "b7341c75925889fa29e994dd85e21db0c741f5209b9b990cdbf99009bd678d30")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/scadenza.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/scadenza.fasl")
   :BYTES 85858 :SHA256
   "855d6dc244773378543d38d705f1e15b7dd44ef8d3212617e802b1f4791319a0")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/seqlock-readers.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/seqlock-readers.fasl")
   :BYTES 79359 :SHA256
   "e563c269ea91ddd63fef0c758aa1b80cab7030beee283db38fb52150738bba4b")
  (:PATH "raw/SPK-07-whole-cache/suite-4001074097-7381/suite.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4001074097-7381/suite.fasl")
   :BYTES 3886 :SHA256
   "cdcc12554555340cacee3c5739b2eb98742a4b1680730a6ee4b5a6e973e54378")
  (:PATH "raw/SPK-08-whole-cache/process-4001074114-8058/bitmap.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001074114-8058/bitmap.fasl")
   :BYTES 23582 :SHA256
   "8a65911849177eee0279cedbd99888af56474fe441320d0d641534926ad4ccdf")
  (:PATH "raw/SPK-08-whole-cache/process-4001074114-8058/core-bitmap.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001074114-8058/core-bitmap.fasl")
   :BYTES 13302 :SHA256
   "2c11f6e0ba2ec714016425a4e7cdaeba592e5b6b4e21038ea286a4ef31f220aa")
  (:PATH "raw/SPK-08-whole-cache/process-4001074114-8058/impronte.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001074114-8058/impronte.fasl")
   :BYTES 68397 :SHA256
   "2b75c2b8dae21fee90584c93b355c7e0654703f9682f2d47511d7c302a7ce10f")
  (:PATH "raw/SPK-08-whole-cache/process-4001074114-8058/simd.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-08-generated-code/out/process-4001074114-8058/simd.fasl")
   :BYTES 20626 :SHA256
   "2f2922c5746813bf79575b67ee549c41282076d6fad8768d082163f16e262b50")
  (:PATH "raw/SPK-09-whole-cache/core.fasl" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-09-integrity/out/core.fasl")
   :BYTES 115033 :SHA256
   "05ade57f79b4d7d25baee2b9ed830f62f85c60f63cd38579b0b05beb5add25a7")
  (:PATH "raw/SPK-10-whole-cache/cbor.fasl" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/cbor.fasl")
   :BYTES 83965 :SHA256
   "19711d8125b1450866590ee7dd897a826818314de34e9f27e3615c8f9ba4a7ca")
  (:PATH "raw/SPK-10-whole-cache/codec.fasl" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/codec.fasl")
   :BYTES 81684 :SHA256
   "6af0b946d27522c7fc5b3ef0d042637350113be4f97fc5854b6a4127246a0709")
  (:PATH "raw/SPK-10-whole-cache/core.fasl" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/core.fasl")
   :BYTES 15842 :SHA256
   "55c56025175ebffc8c826294305c1ed301ed3aea49e1d6da69bf1d693a957bc7")
  (:PATH "raw/SPK-10-whole-cache/crc.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/crc.fasl")
   :BYTES 115074 :SHA256
   "b2fe16f9908176576441262aab81bf2ef83186088abacf35f1c6b1f107d8451e")
  (:PATH "raw/SPK-10-whole-cache/indice.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/indice.fasl")
   :BYTES 154903 :SHA256
   "4aa3ff8461f90044225b0f06c4b30eb4dc5d22cd6b312caf404d8323bc7759f1")
  (:PATH "raw/SPK-10-whole-cache/migrazione.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/migrazione.fasl")
   :BYTES 81717 :SHA256
   "8087dbdd2d788b40f9e5667f030d9bc98d7d8ea3e6463fda4066ea16340b5a9d")
  (:PATH "raw/core-R1-inner/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073363-command-61212-0/conservazione.lisp")
   :BYTES 1784 :SHA256
   "8fb8deb1c59ff42fa105f580560ccb0cb6b5df0d3498ce778caf55cde02997aa")
  (:PATH "raw/core-R1-inner/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073363-command-61212-0/report.lisp")
   :BYTES 317 :SHA256
   "5aa4589aa35026537888315094afe894bc8427c39ecf97cd9a736797849732a0")
  (:PATH "raw/core-R1-inner/report.lisp.gz" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073363-command-61212-0/report.lisp.gz")
   :BYTES 130886 :SHA256
   "3f97b2b234102f5e7cf1c1326ef7fee0e04515d10b07d261f05033bc40a879e6")
  (:PATH "raw/core-R1-outer/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073360-command-61120-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "738761bddcad2402c4a6973d3cff209dd5e10e6fdb2465217d33cf3913219394")
  (:PATH "raw/core-R1-outer/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073360-command-61120-0/report.lisp")
   :BYTES 192836 :SHA256
   "5af4a0644cddfb5281cf3d7571bc6ee4d0c606de290ae977d6efa4a70972e160")
  (:PATH "raw/core-R1-whole-cache/src/active/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/active/package.fasl")
   :BYTES 1598 :SHA256
   "60d7564dbd859cb394cd54fb0cdbc1767c36a98e5d65ccfe174bb13b9b807c6e")
  (:PATH "raw/core-R1-whole-cache/src/active/preflight.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/active/preflight.fasl")
   :BYTES 4808 :SHA256
   "e21a067c7045645cb307a2f37930fd9e8f00affd3053f43288abf111cd2c2e06")
  (:PATH "raw/core-R1-whole-cache/src/active/prepare.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/active/prepare.fasl")
   :BYTES 5570 :SHA256
   "d1b5b0ae665df434b3e7d2af39dc6449fcb80526d2bec8be656c5efe62938208")
  (:PATH "raw/core-R1-whole-cache/src/active/source.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/active/source.fasl")
   :BYTES 5224 :SHA256
   "e0768abfa7b8d4128d61ba6291f132f61c66c347da948448e88fe0fa9710c8f9")
  (:PATH "raw/core-R1-whole-cache/src/active/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/active/types.fasl")
   :BYTES 5985 :SHA256
   "ed41f096c664b276f2d049c191c8afda27bd7a44c6eebcb109e3e898ab0c6c02")
  (:PATH "raw/core-R1-whole-cache/src/cache/build.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/cache/build.fasl")
   :BYTES 8859 :SHA256
   "6b6eed4c507d058caebd2e1c08372687ac2a2ea0c8f9213939d6478948b8f58b")
  (:PATH "raw/core-R1-whole-cache/src/cache/clock.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/cache/clock.fasl")
   :BYTES 4900 :SHA256
   "b1c2909cba0b3a97b2ebf540eae2798f1aaee4d19ccbea08b4dcbbf58a830166")
  (:PATH "raw/core-R1-whole-cache/src/cache/core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/cache/core.fasl")
   :BYTES 7275 :SHA256
   "e137e1f4b82d307945cdd9a0225f0b1a1db53a8621338b25ca1c21a996ae0060")
  (:PATH "raw/core-R1-whole-cache/src/cache/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/cache/package.fasl")
   :BYTES 1182 :SHA256
   "70e1d3155187f6290310bb025dcc5d5a71107b42b7e27070dae45bab5c6ecd26")
  (:PATH "raw/core-R1-whole-cache/src/cache/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/cache/read.fasl")
   :BYTES 11973 :SHA256
   "cf8a72170a3ce21e77ad484fb55d6bb7ad3669c3efea58e4f89721fa7149cb2f")
  (:PATH "raw/core-R1-whole-cache/src/cache/types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/cache/types.fasl")
   :BYTES 18000 :SHA256
   "4ce69a13163a0dfee45bfc1cd609044aba53d06afadee21ea39d36ecfb92b70d")
  (:PATH "raw/core-R1-whole-cache/src/cache/write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/cache/write.fasl")
   :BYTES 9839 :SHA256
   "30c5c23c823efcf5a386623ccb8da95bb0ebb5183c16042ceda14ac93652e9a4")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-array-input.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-array-input.fasl")
   :BYTES 9988 :SHA256
   "9d082bdf873885edbcb380cb9eb8a5eacf701a6ac7b07d6627c5d12dec04ee3c")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-array-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-array-write.fasl")
   :BYTES 8702 :SHA256
   "e96ad3ec5903fa6dfdf881a3f9922e9008bfa9c85c067cdbd7466fc27fba4aba")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 4242 :SHA256
   "fa359e69b73f858ad579a38e0a13c65dfcc84f7c92f1664e398d0fe9c8ef2f71")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 5060 :SHA256
   "a72ae2e014ae0c58640ea5051ecc9795b5c58350b666e67dd3134c7bff43bf5f")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-float-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-float-write.fasl")
   :BYTES 6810 :SHA256
   "646c2414f4447c08d110effceefb7742e7d424a84f1596b2d31fac363140cde7")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-header.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-header.fasl")
   :BYTES 7392 :SHA256
   "22d16986af72912b595933f3c6960127de8a8c61b0ec80dd683f2b76c51385b7")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-map-input.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-map-input.fasl")
   :BYTES 10479 :SHA256
   "181bebc2c748cd7952dd7ba5320cce3fe6629e55cba114e72122948a771f2283")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-map-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-map-write.fasl")
   :BYTES 8790 :SHA256
   "f6e844861d9699e6068f77a2de152b2bad606755c000910d063573d9ec291623")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-minimal.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-minimal.fasl")
   :BYTES 5480 :SHA256
   "8c368a9dfd7bc23cfceb15a01d5e164fe87d081e0eb3f125c1d0508d981ef1b9")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-package.fasl")
   :BYTES 1262 :SHA256
   "2683419097804256e16960a1ee474e3319626d57da3233018b7d317590ce6605")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 3465 :SHA256
   "d9075b73529ebdbfcc09c650d2b290cc0961c7ca7eb37f3a07c9541ae0d9baae")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 10671 :SHA256
   "335dc67ace5e4dfb4825999c244da7ccd8c528c8f4a0ec596e270c1c95a8bba3")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 2941 :SHA256
   "e38df189204830198f9758312be3e18591bcd468dfffe9d9c67dca3481ba87d4")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 8030 :SHA256
   "d727c2ded958c07948a8e80f2eb28c1c4e43715ccc03c5d4939ea0917ccbcd85")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-scan.fasl")
   :BYTES 8491 :SHA256
   "d13c9ffeb963819ab7f9fd18dec4fbaa4cacc870e55dbadc905b3cbd1ca35c2a")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 3956 :SHA256
   "a5d05e78900b746860c548e1ee6ff74c8f10e8992430ceaaee01c8295ad95385")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-space.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-space.fasl")
   :BYTES 11645 :SHA256
   "fced72f3564db2ca4b9bb5389e7371c22f5b989b8aba4fe6705604796582c2bb")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-string-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-string-write.fasl")
   :BYTES 9770 :SHA256
   "39c3c3186b8ac5923a824af2b15d309b9098a375314f38d15d1185dd38916998")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-tag-input.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-tag-input.fasl")
   :BYTES 7031 :SHA256
   "2da7cedfe76fd4127911cbd2ceb92f36d2058b3c939a210bfb1440cb65c78929")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-tag-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-tag-write.fasl")
   :BYTES 6374 :SHA256
   "f431c61a66a424583b997fd953af006269047dd1fc7785cb4da99ed0e6c60124")
  (:PATH "raw/core-R1-whole-cache/src/codec/cbor-write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/cbor-write.fasl")
   :BYTES 6935 :SHA256
   "4afdb8f1df60bf1b8390ccf74aeb07e17fab3e44fe619a054c42e8d035397e56")
  (:PATH "raw/core-R1-whole-cache/src/codec/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/package.fasl")
   :BYTES 951 :SHA256
   "4bee1701f65018605151f8e581c85cc489725aa80b1db283ec57ab9ef03811f2")
  (:PATH "raw/core-R1-whole-cache/src/codec/utf8.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/codec/utf8.fasl")
   :BYTES 8348 :SHA256
   "f053d1098a418bfc152ce3751a92f7cece8edd9769fed829bf1ef850b60e397e")
  (:PATH "raw/core-R1-whole-cache/src/control/build.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/build.fasl")
   :BYTES 8215 :SHA256
   "24cbcb8260ba6097cb171a1c0164a997eddfce69e7d7f837d23af3a54d157208")
  (:PATH "raw/core-R1-whole-cache/src/control/dependency.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/dependency.fasl")
   :BYTES 4004 :SHA256
   "6abe56656de1c325f98646c1c0654a9ed26fd15c10264119acb86e23a717bdd9")
  (:PATH "raw/core-R1-whole-cache/src/control/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/package.fasl")
   :BYTES 2274 :SHA256
   "c8f4e17e8e8e7150a4a5dcad5d260527cd116e9cbfa53ff4a2ac4a1941cdea0e")
  (:PATH "raw/core-R1-whole-cache/src/control/preflight.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/preflight.fasl")
   :BYTES 5187 :SHA256
   "ee9fa32e1c494e5a6ad04cab5b1af2811ea663b9502c71faade006683030be4b")
  (:PATH "raw/core-R1-whole-cache/src/control/prepare.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/prepare.fasl")
   :BYTES 5568 :SHA256
   "b7e59db61bac2442b4eb80c60a9116c42bef294fa61d0f2e5ae7b0e42ee22ffe")
  (:PATH "raw/core-R1-whole-cache/src/control/publication-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/publication-read.fasl")
   :BYTES 4071 :SHA256
   "f279b07e351564fb64cb51504d177e197d4817ef780a9161fcd15fb9f952c40f")
  (:PATH "raw/core-R1-whole-cache/src/control/publication.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/publication.fasl")
   :BYTES 6080 :SHA256
   "bfe958b3f15f5b3652159b1723de32353fcd46a22049ccb068c8c8d4a279ebec")
  (:PATH "raw/core-R1-whole-cache/src/control/recovery-publication.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/recovery-publication.fasl")
   :BYTES 2906 :SHA256
   "5cf78e177eb08efcd94304fb9b314cfdd84dcf330904fd8eb78d756aeb7ccc83")
  (:PATH "raw/core-R1-whole-cache/src/control/recovery-read.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/recovery-read.fasl")
   :BYTES 8815 :SHA256
   "4c6777d060ebd91e9eb903abeeac2f39eee47277b09c58fa2c20866adb0d13c1")
  (:PATH "raw/core-R1-whole-cache/src/control/recovery-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/recovery-types.fasl")
   :BYTES 9710 :SHA256
   "7d7fa6e12f368d679aeda97ea2718ca0076ce1d79164d2cf50edd4e98ebaea8b")
  (:PATH "raw/core-R1-whole-cache/src/control/transfer.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/transfer.fasl")
   :BYTES 4892 :SHA256
   "5917895294d70b7d3ba9b34b972419c7df44789e37e22f57a687a3ad43961e64")
  (:PATH "raw/core-R1-whole-cache/src/control/types.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/control/types.fasl")
   :BYTES 21480 :SHA256
   "ed5805fd871a1f5d2e78310951c40b8b3ed4e5cdf794a598fcce3e52d5863fe5")
  (:PATH "raw/core-R1-whole-cache/src/csn/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/csn/package.fasl")
   :BYTES 984 :SHA256
   "6afc40851961832bca02140ab9aa28849386f3ee1b161535ad551bd04a3c5123")
  (:PATH "raw/core-R1-whole-cache/src/csn/registry.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/csn/registry.fasl")
   :BYTES 29111 :SHA256
   "983c4831e4cd501d3d8e29abc2dfbb1634c437c18f81aacaa7a7a5470b2c45ee")
  (:PATH "raw/core-R1-whole-cache/src/dispatch/begin.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/dispatch/begin.fasl")
   :BYTES 2531 :SHA256
   "f0041561b97fdbc84a41be0750e532d758117dec7f073a742f0b4fbf1174aecd")
  (:PATH "raw/core-R1-whole-cache/src/dispatch/build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/dispatch/build.fasl")
   :BYTES 2251 :SHA256
   "692db4230bf4f46b02f5cd0698e7d1a60f8452fe085bfb2a6d65d1a52ba6e1b5")
  (:PATH "raw/core-R1-whole-cache/src/dispatch/claim.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/dispatch/claim.fasl")
   :BYTES 3551 :SHA256
   "97bdc0bd40bbb5f51dd280fe60132051b78a66533b21525d61d67834ef665adb")
  (:PATH "raw/core-R1-whole-cache/src/dispatch/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/dispatch/package.fasl")
   :BYTES 1076 :SHA256
   "79f9a3f6bb93aff4ff58af61ccc09673dc4a158142273d29b7162c1357d28361")
  (:PATH "raw/core-R1-whole-cache/src/dispatch/recycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/dispatch/recycle.fasl")
   :BYTES 3639 :SHA256
   "248d23f2eebd664e37304bbdf30c714a33742002fb4c014c4fc497c9d31b9c9c")
  (:PATH "raw/core-R1-whole-cache/src/dispatch/types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/dispatch/types.fasl")
   :BYTES 5583 :SHA256
   "47007c46b6fff0f7155d737992eb0867423208b7245e9d21b888243729cbd133")
  (:PATH "raw/core-R1-whole-cache/src/epochs/core.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/epochs/core.fasl")
   :BYTES 9466 :SHA256
   "f02a28774a962610f83a38c3cedb4e41499c7dd7a848f5ab657ebd839cfce051")
  (:PATH "raw/core-R1-whole-cache/src/epochs/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/epochs/package.fasl")
   :BYTES 1209 :SHA256
   "6836c2901ed911da5501c011755f4ae7795cd99c1a056d966cca615f1e069cc3")
  (:PATH "raw/core-R1-whole-cache/src/epochs/read.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/epochs/read.fasl")
   :BYTES 5305 :SHA256
   "55252db3a16336573b576d50d48b3137bc5b2176c03d5804d3a5165cd7d41705")
  (:PATH "raw/core-R1-whole-cache/src/epochs/reclaim.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/epochs/reclaim.fasl")
   :BYTES 10815 :SHA256
   "264d69eac476dfe17fa66a73d846a100763e9f785557f8acd021c77cea462861")
  (:PATH "raw/core-R1-whole-cache/src/epochs/retire.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/epochs/retire.fasl")
   :BYTES 9424 :SHA256
   "be88dc52dd5d61c73eaa5f34f816eea8881a1f82d1e29e634ac71183337f62e8")
  (:PATH "raw/core-R1-whole-cache/src/epochs/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/epochs/types.fasl")
   :BYTES 24030 :SHA256
   "789cb943339f14dc96f1e64425900ed533d54635d6de07a3923b0ddd6159aafe")
  (:PATH "raw/core-R1-whole-cache/src/execution/handoff.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/handoff.fasl")
   :BYTES 15939 :SHA256
   "1095d019c08bf2041fb7d1c254d7d70dd751c245e2a2ce0ee1d529605f8a4569")
  (:PATH "raw/core-R1-whole-cache/src/execution/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/package.fasl")
   :BYTES 1620 :SHA256
   "dd0ff03d075e6568e1cac74ff054dcdc419b0f1d1ac296ddf6f60ead50a137fb")
  (:PATH "raw/core-R1-whole-cache/src/execution/queue.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/queue.fasl")
   :BYTES 17794 :SHA256
   "bae17dd6acb4edac712a47dcf58b5b6aa47f9083135d3b532c5c00eb23fed291")
  (:PATH "raw/core-R1-whole-cache/src/execution/ready-recycle.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/ready-recycle.fasl")
   :BYTES 5179 :SHA256
   "5882e9d7b6b477f45af4e1702c1a7a58894f8a0db448152d7317bd7bfb5d7b9f")
  (:PATH "raw/core-R1-whole-cache/src/execution/ready-types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/ready-types.fasl")
   :BYTES 14971 :SHA256
   "e9ac3b71d8fc6b09c8823e9e4c4ae13449062e593b482d3bc5e21a89bf244014")
  (:PATH "raw/core-R1-whole-cache/src/execution/ready.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/ready.fasl")
   :BYTES 9717 :SHA256
   "e2ba7aaaa6d21bd8c4bec2bf55a60dbac2d46cebe3f664ea818c97732578d532")
  (:PATH "raw/core-R1-whole-cache/src/execution/worker-boundary.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/worker-boundary.fasl")
   :BYTES 6435 :SHA256
   "ccef410429b2455834abe0617b7d3ad3a70682939d136de6543a72fdea1ea75c")
  (:PATH "raw/core-R1-whole-cache/src/execution/worker-claim.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/worker-claim.fasl")
   :BYTES 12445 :SHA256
   "1cca2f960c74a1ff755f6b7819616a98aad21cfbe4461dc3bff13c756f288c3c")
  (:PATH "raw/core-R1-whole-cache/src/execution/worker-run.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/worker-run.fasl")
   :BYTES 9039 :SHA256
   "59104c979cf3a23754758dce80e40cfadf4d01cebe12b041a60389d4ef50a32a")
  (:PATH "raw/core-R1-whole-cache/src/execution/worker-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/worker-types.fasl")
   :BYTES 22095 :SHA256
   "e07c7e94606dfcf6da731f1665d50e606735481afe74c425e2aa1e9b8aefbcbc")
  (:PATH "raw/core-R1-whole-cache/src/execution/writer.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/execution/writer.fasl")
   :BYTES 8982 :SHA256
   "ad7a57284c6fd2f5eb62e3a630af485def1a0b9ee1185734387f87381ec9b47c")
  (:PATH "raw/core-R1-whole-cache/src/foundation/batch.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/foundation/batch.fasl")
   :BYTES 9681 :SHA256
   "1a440e28c6e7e65386f189d305031e7191ce4e0768698a24f666ed8043f0d0a0")
  (:PATH "raw/core-R1-whole-cache/src/foundation/binary.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/foundation/binary.fasl")
   :BYTES 9087 :SHA256
   "e29152b5138f79c74d18375c57a0b22ac236777fce74a44d13b3ac8ae1ecbdc7")
  (:PATH "raw/core-R1-whole-cache/src/foundation/conditions.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/foundation/conditions.fasl")
   :BYTES 6281 :SHA256
   "f42961011bc39377672864694ff72f09460184d0d2fe75b91de11b4b26162ef5")
  (:PATH "raw/core-R1-whole-cache/src/foundation/crc32c.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/foundation/crc32c.fasl")
   :BYTES 4263 :SHA256
   "dd015d21ae96df3d6514e37f739d45757a2d3de864fc4273c8f91f40afa9e7ac")
  (:PATH "raw/core-R1-whole-cache/src/foundation/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/foundation/package.fasl")
   :BYTES 2094 :SHA256
   "11f203856bc1e718790d4a92406c4027ef684d0f20fec4dfceb35f597f61fefe")
  (:PATH "raw/core-R1-whole-cache/src/foundation/record.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/foundation/record.fasl")
   :BYTES 36370 :SHA256
   "854fbf57a1319c51ce8afaeac8d50ea94406d0d2327e69d7a7ecaa4f69c1f660")
  (:PATH "raw/core-R1-whole-cache/src/get-directory/build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-directory/build.fasl")
   :BYTES 6196 :SHA256
   "7f1dc3f65e5963fa468888eaa4dd0606e187b50aaadc3a6cf53485047e68620a")
  (:PATH "raw/core-R1-whole-cache/src/get-directory/package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-directory/package.fasl")
   :BYTES 2181 :SHA256
   "9d09e5c548774384460fac69ce07887e1f5d065ad4a012e30bd36ce668526f4d")
  (:PATH "raw/core-R1-whole-cache/src/get-directory/read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-directory/read.fasl")
   :BYTES 7292 :SHA256
   "344770854de25746af6839aa62f6ddbe3394750213fbe6deaaf2c664a3a97301")
  (:PATH "raw/core-R1-whole-cache/src/get-directory/sources-read.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-directory/sources-read.fasl")
   :BYTES 8243 :SHA256
   "213a058a92e9a4f9b94acd80c18a7e56493751b2834498e116380b6e2d5c0621")
  (:PATH "raw/core-R1-whole-cache/src/get-directory/sources-types.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-directory/sources-types.fasl")
   :BYTES 12646 :SHA256
   "ed0aa2ce113dd905c53722745277d774389d257ea084fe1e3326dd9ae4d47d62")
  (:PATH "raw/core-R1-whole-cache/src/get-directory/types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-directory/types.fasl")
   :BYTES 7029 :SHA256
   "5ff44e54af75a5f728fc934b3bedb9e1bca1c8aca95f783a099a02ba85d35c27")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/active-build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/active-build.fasl")
   :BYTES 13965 :SHA256
   "7a1114ced8705c324074a0ea4a3183f98880339b7359f28acc7aa383b3042736")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/active-directory.fasl")
   :BYTES 6977 :SHA256
   "44a0990fde85e7ee6f88c1dda22831c83d325c7d5bb054bbead989bd6f37f3e0")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/active-init.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/active-init.fasl")
   :BYTES 3947 :SHA256
   "0cf53d63505d57d681db68d475f5965557f6c8ded613bfb9f47d9a1234b96cd7")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 9017 :SHA256
   "b281af6aeb0e1a851a2f29ecb243c7b802fae0b8e554c7aa84dcd8273e6719df")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/active-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/active-read.fasl")
   :BYTES 6887 :SHA256
   "c8146f7e2565ffbcd228f2668fd24e0482f1d524b4258322de07eacb2b2e9c13")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/active-scan.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/active-scan.fasl")
   :BYTES 8231 :SHA256
   "8b37cc5700c45a3a2fa4ad14e790451bb48030efa919e383210198ad97b57876")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/active-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/active-types.fasl")
   :BYTES 17331 :SHA256
   "8f1526b0a5a24955732411ce006d63514ce9a7c59e437e2e00810e754a354099")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/build.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/build.fasl")
   :BYTES 10760 :SHA256
   "db2bf9d40c97eeaa4419ee399f9b430731ed099fa675e42d3074dd382eeafcd4")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/package.fasl")
   :BYTES 2677 :SHA256
   "d7fb0ef6a300df96b1b8754660e8153f532905197b2746a32bc3d5fceca089e9")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/read.fasl")
   :BYTES 10523 :SHA256
   "57827fc106c1352778d8077b99980b96dc7743547d55c27a11c0654a6b9b3c39")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/rows.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/rows.fasl")
   :BYTES 5870 :SHA256
   "2738b8d168dd74c91b83d9d9b1f3e2a5850e65355c88c17845bfb4a929e8c5da")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/scan.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/scan.fasl")
   :BYTES 10748 :SHA256
   "31e69cf4d8655c433319dc218e50449b93360a905ba112c6f390154bc7146f13")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/sort.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/sort.fasl")
   :BYTES 9395 :SHA256
   "e8cd1a418589754977d2235ac0bd941f2c47f85661fe82d4e77a16ec8ffef257")
  (:PATH "raw/core-R1-whole-cache/src/get-resolver/types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get-resolver/types.fasl")
   :BYTES 7442 :SHA256
   "f55951300906a06147f0075c8e74f176b5c303713979697f39ab25486420421f")
  (:PATH "raw/core-R1-whole-cache/src/get/build.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get/build.fasl")
   :BYTES 6750 :SHA256
   "98349bbac1d269d68fc7516344b154a9f2bfa89e705609511ed81b97ef496897")
  (:PATH "raw/core-R1-whole-cache/src/get/lifecycle.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get/lifecycle.fasl")
   :BYTES 8691 :SHA256
   "0c88c5ee082c047afc79f44e29f862f5dd5e761031d3fe168e7ce3fe757241fb")
  (:PATH "raw/core-R1-whole-cache/src/get/lookup.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get/lookup.fasl")
   :BYTES 11211 :SHA256
   "4834c1da166e65789d4d5dd219c83edad83c9432a0c83cd9acd9285d27d5c7eb")
  (:PATH "raw/core-R1-whole-cache/src/get/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get/package.fasl")
   :BYTES 2174 :SHA256
   "122d27494f293aa84906ac3660fb3ad3f6c9bb1bd86a9ecc9d4cf3045f1843d0")
  (:PATH "raw/core-R1-whole-cache/src/get/segment.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get/segment.fasl")
   :BYTES 10571 :SHA256
   "e891b4bf99a82b08d9cf253ef2ce1ff0c2b9022e0fe32b3b7ed4cdfb517f4f07")
  (:PATH "raw/core-R1-whole-cache/src/get/target.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get/target.fasl")
   :BYTES 7816 :SHA256
   "d4857011a4485f6a8cf9dc89ddf570f875ba53d0ba1aeb31ed577665a9d32136")
  (:PATH "raw/core-R1-whole-cache/src/get/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/get/types.fasl")
   :BYTES 30924 :SHA256
   "5baeaf49ee6b0b7890955bfa48782614e35b85917c0f01cd9fab78a6216caef1")
  (:PATH "raw/core-R1-whole-cache/src/hash/arithmetic.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/hash/arithmetic.fasl")
   :BYTES 7692 :SHA256
   "8de0fcb4dbd9afc88e526f3f6c84a2684d3bebad27e8488b30a3fda3af3836a0")
  (:PATH "raw/core-R1-whole-cache/src/hash/blocks.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/hash/blocks.fasl")
   :BYTES 8303 :SHA256
   "43e693ad137ba2c20e42a5e1733e1430623cc26f1800bd01c6772ccf3f5c901c")
  (:PATH "raw/core-R1-whole-cache/src/hash/hash64.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/hash/hash64.fasl")
   :BYTES 6652 :SHA256
   "b79c47d0a0546c24fa410e31b4da21c334e52c29122c65366c6c2188ee55df16")
  (:PATH "raw/core-R1-whole-cache/src/hash/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/hash/package.fasl")
   :BYTES 959 :SHA256
   "6df49c968445000c89c7a9fc172b8667779bc4cd6f79e4ae36c3f966cd65bef1")
  (:PATH "raw/core-R1-whole-cache/src/index/core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/core.fasl")
   :BYTES 6195 :SHA256
   "a6f6b48677337512a876e906151915fad0a9462b23649e48e2b7cfbe37fbc9ca")
  (:PATH "raw/core-R1-whole-cache/src/index/hash-digests.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/hash-digests.fasl")
   :BYTES 6112 :SHA256
   "797a5ab4361bb5855f7bc4e4d10ef870e57cb134c4050caea9acf23b05f29391")
  (:PATH "raw/core-R1-whole-cache/src/index/hash-seed.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/hash-seed.fasl")
   :BYTES 5144 :SHA256
   "3f37085c0e27720e0682aabb1694125f087823fb0921a7ad0551d237f2dda88c")
  (:PATH "raw/core-R1-whole-cache/src/index/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/package.fasl")
   :BYTES 1154 :SHA256
   "b56da341dd36b798ebd6b7e7093d5f85638f6a170085127f6c32fea9706cf18c")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-arena.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-arena.fasl")
   :BYTES 6834 :SHA256
   "361681141cf6620b82ec560ed3eb1cec56374074af0b58df6483002c37545221")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-build.fasl")
   :BYTES 10607 :SHA256
   "ed925149181dff158f392543cbf02fecc2300cffab9d9ded7e05d9bd8ebc0210")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-core.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-core.fasl")
   :BYTES 8760 :SHA256
   "00bedf2f597b015d5df632f554f026fb3b9caad2f7018cb214a4ba94f00e8d2f")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-directory.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-directory.fasl")
   :BYTES 14244 :SHA256
   "a09b23cf9febf5e07708493c35d636fb2bb5a55aea1196d83e5be6ef51385028")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-package.fasl")
   :BYTES 1729 :SHA256
   "1cb61cf69823cb571136628f0a4f45599ae1241e4e84b3c2bfb0af13c793be01")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-probe.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-probe.fasl")
   :BYTES 13350 :SHA256
   "d9eb6176f7099f7ead3d584ce15b869e1cf5b509017d6c9637bd6b1cb9b6dccb")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-read.fasl")
   :BYTES 7553 :SHA256
   "e34a85fcfd208df0056916c8f6031b966d382c46548877eae96e2e2f32c854c4")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-relocate.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-relocate.fasl")
   :BYTES 9181 :SHA256
   "9456059c823676432a91897dfd5bceb635d044108438a84c62c8fe6ff7d09d01")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-types.fasl")
   :BYTES 36228 :SHA256
   "49638800b7864110a77ffcd49908f07dd1da93297cc10498ab1f7928c97b1c33")
  (:PATH "raw/core-R1-whole-cache/src/index/primary-write.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/primary-write.fasl")
   :BYTES 15743 :SHA256
   "46a012a264f4cf2c158b7cf79ca9bb7d124f62e92c8c12b4cb32770a5afef6c6")
  (:PATH "raw/core-R1-whole-cache/src/index/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/read.fasl")
   :BYTES 7208 :SHA256
   "89c1d44795031550cebf3bc4944cc567631df88201946c8ddeb7d281210bc5b0")
  (:PATH "raw/core-R1-whole-cache/src/index/rebuild-budget.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/rebuild-budget.fasl")
   :BYTES 6574 :SHA256
   "55d2924a23d3c57f91cb3a2ed7c849322a75b4dfc291f5bb43e66e0e3c21f97f")
  (:PATH "raw/core-R1-whole-cache/src/index/rebuild-copy.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/rebuild-copy.fasl")
   :BYTES 8117 :SHA256
   "6917c7c4c7f2a117f1a6ab75b3605fd6595b687ab5837c73835f7e0afbd9fd53")
  (:PATH "raw/core-R1-whole-cache/src/index/rebuild-scan.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/rebuild-scan.fasl")
   :BYTES 12587 :SHA256
   "3f065eac415a885fa2f87c0e782ae779d9095aa218a46c5a02e8eaf141fbd19b")
  (:PATH "raw/core-R1-whole-cache/src/index/rebuild.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/rebuild.fasl")
   :BYTES 4527 :SHA256
   "3d5cd46eeee9112df7a96d11221093ed98e06013aaf149bb36aeb7c6a042dc1b")
  (:PATH "raw/core-R1-whole-cache/src/index/relocate.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/relocate.fasl")
   :BYTES 6695 :SHA256
   "641fb40b78281bd93711fcb8c0741f02ea598f146108219637633d10be43bd39")
  (:PATH "raw/core-R1-whole-cache/src/index/types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/types.fasl")
   :BYTES 9949 :SHA256
   "2dfc8f2de96bebfe8915cfe7748e587945802c9ea42fd3e58dad3a903047ad36")
  (:PATH "raw/core-R1-whole-cache/src/index/validation.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/validation.fasl")
   :BYTES 9618 :SHA256
   "9dd268982dec0a7ed80890da12cc53f23f1255e705934e2d52423183b10e39ee")
  (:PATH "raw/core-R1-whole-cache/src/index/write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/index/write.fasl")
   :BYTES 12528 :SHA256
   "93a977b64093f5a78765c2d36a3ca1ce9b13dc8f2d1b4747a3f199026c03cc13")
  (:PATH "raw/core-R1-whole-cache/src/io/flush.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/flush.fasl")
   :BYTES 4626 :SHA256
   "25f3dda411cfe581750ce0d96002365553c6f119851f1a87e84a8721f6b8fe53")
  (:PATH "raw/core-R1-whole-cache/src/io/identity-types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/identity-types.fasl")
   :BYTES 4480 :SHA256
   "7a5677e1408375509bd83c623ccd3c2586854ed6607740b483dc712c30b036c6")
  (:PATH "raw/core-R1-whole-cache/src/io/identity.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/identity.fasl")
   :BYTES 7752 :SHA256
   "872e77bdfe9a4ea5d2b4a5efb8f41236b2c2e1ec39f6d811ac753ad862b03efb")
  (:PATH "raw/core-R1-whole-cache/src/io/lifecycle.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/lifecycle.fasl")
   :BYTES 10869 :SHA256
   "5e08a0b4c8671564ab772dee88f73f55e3b9ea6c3984240e14b8b9a6c763e9f8")
  (:PATH "raw/core-R1-whole-cache/src/io/namespace.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/namespace.fasl")
   :BYTES 11397 :SHA256
   "0f7029dc7775784b0164c1523e33c6a342e2f16ba4268e0c335981424e95645f")
  (:PATH "raw/core-R1-whole-cache/src/io/native-namespace.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/native-namespace.fasl")
   :BYTES 17954 :SHA256
   "786a3093604ce6984544d7272952fbea8a62548e9057868bab52fe2403d5a267")
  (:PATH "raw/core-R1-whole-cache/src/io/native.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/native.fasl")
   :BYTES 22514 :SHA256
   "18f96bc833e1705129c42ba71078e9ee8f7cdde0ea432887d16e7abc99451469")
  (:PATH "raw/core-R1-whole-cache/src/io/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/package.fasl")
   :BYTES 1383 :SHA256
   "398f28b586efbe21c4a470e7f25fbc58445f155cefdc739c39fcfab56835cd60")
  (:PATH "raw/core-R1-whole-cache/src/io/rename.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/rename.fasl")
   :BYTES 10588 :SHA256
   "45592a4f5b08b00d0b6cdb06df632fbdd6d6ff417849076d67d6d86174ca9408")
  (:PATH "raw/core-R1-whole-cache/src/io/transfer.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/transfer.fasl")
   :BYTES 16327 :SHA256
   "bf6d0b592cb401d28a6963b820f40cd347ebd9f6b995b822be0cb5e564076a3a")
  (:PATH "raw/core-R1-whole-cache/src/io/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/io/types.fasl")
   :BYTES 24346 :SHA256
   "0691e23f98166dfedb7a0666be57bcf33a208c9d7aa52ba8a4a2c6fdd475fbe5")
  (:PATH "raw/core-R1-whole-cache/src/mvcc/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/mvcc/package.fasl")
   :BYTES 1322 :SHA256
   "1a67c50a7a448acb46eae90b979c24277a32137380fcad0bf45d1c95a08c83a6")
  (:PATH "raw/core-R1-whole-cache/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 11955 :SHA256
   "cacc0c45b4e10268b1d94c418c2e33d6dab71270ffc13c0cec2357ed30236fb6")
  (:PATH "raw/core-R1-whole-cache/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 6281 :SHA256
   "4f249856e05093d3b83282f003cd2ddd54f708c00ff1230dca75000446c1d571")
  (:PATH "raw/core-R1-whole-cache/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 10492 :SHA256
   "5bf235a9c6f2f99553319df43bbcd74d03edf6b92e5d77101930474b1b37b201")
  (:PATH "raw/core-R1-whole-cache/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 13716 :SHA256
   "910a87ffbaf45bb8864dbbd4ef61e1bf4945aad1e32acfdc220671085b70cee2")
  (:PATH "raw/core-R1-whole-cache/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 10026 :SHA256
   "987df68c9a9b78117bb82e7fe1db6d5ab346965f210f774efefd5753b844706f")
  (:PATH "raw/core-R1-whole-cache/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 21792 :SHA256
   "84f16ea0b012984a1f694e4a5d6ae431b498fa16271502bd160e3bc8de47fcb6")
  (:PATH "raw/core-R1-whole-cache/src/mvcc/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/mvcc/types.fasl")
   :BYTES 1406 :SHA256
   "a93421111d6c5666c130dce9de7c98dd7d8d6034dda823ed6b785acb40eb5744")
  (:PATH "raw/core-R1-whole-cache/src/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/package.fasl")
   :BYTES 1418 :SHA256
   "e1aa9ddabe3f4f5d5c23beab00cf9de5c092734c553e363074df230810906551")
  (:PATH "raw/core-R1-whole-cache/src/read/core.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/read/core.fasl")
   :BYTES 6252 :SHA256
   "c302911a5087aca2d89793f3d644fcdd7d7b4e3986ae0012be043353d72cf358")
  (:PATH "raw/core-R1-whole-cache/src/read/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/read/package.fasl")
   :BYTES 1214 :SHA256
   "678dc71e0b301475cb15400c8ade7d997a648e04e4d0d850e9be783b45d684d5")
  (:PATH "raw/core-R1-whole-cache/src/read/task.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/read/task.fasl")
   :BYTES 14118 :SHA256
   "ac1d9fdaa1ec4fa7f4093fc8cb9183e2fe9958e095e898386525e80afed183b7")
  (:PATH "raw/core-R1-whole-cache/src/read/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/read/types.fasl")
   :BYTES 9790 :SHA256
   "64a1375b04587c089856620d3c564f53b280e70ce521de6fb6aaaa318ffee833")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/build.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/build.fasl")
   :BYTES 7775 :SHA256
   "dd196c22e502c8d0e995c297eeb96f130572219ca2789bc08b31dc5463bba6c3")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/closure.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/closure.fasl")
   :BYTES 5274 :SHA256
   "d2b655afb4b3e555eafd5841260082646666c79cfa68d7abad878bf5eb6f0bfc")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/frames.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/frames.fasl")
   :BYTES 8947 :SHA256
   "91579f2ce2823a253780e9a144c97ea5c0a01076e6cda36bfb8d497b5984cbe3")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/package.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/package.fasl")
   :BYTES 1967 :SHA256
   "3e4ebecc0aad20cffee42f5973385559991f96c20b99381517a952f1fe8adefe")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/publication.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/publication.fasl")
   :BYTES 4402 :SHA256
   "b90fb17f5a110a25f897961ee6bb7920df41564417c488156a6d0034b86b9d55")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/query.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/query.fasl")
   :BYTES 5374 :SHA256
   "ccc15d305c4e0b4fa877d08e347191a41568c1e482d7d5537a047e82afa50e03")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/read.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/read.fasl")
   :BYTES 5663 :SHA256
   "6dc09e8bceea96bb87b5f4ba3e834c6c32a3d83f961f954db76668011e228888")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/resolve.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/resolve.fasl")
   :BYTES 7630 :SHA256
   "7949f7a8f92f18a1f5d8c4fc2012b6b862ab53b6f86a89caf6f01c061c6c559f")
  (:PATH "raw/core-R1-whole-cache/src/recovery-active/types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery-active/types.fasl")
   :BYTES 18468 :SHA256
   "9c35e5692c97472de291b728a658bb1029f1c7bad020f9bfc103685193f7006e")
  (:PATH "raw/core-R1-whole-cache/src/recovery/decisions-build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/decisions-build.fasl")
   :BYTES 17741 :SHA256
   "3256ccc5907a2d2f111f9235cea84b679324c568d7c81cf072911b5848c9c146")
  (:PATH "raw/core-R1-whole-cache/src/recovery/decisions-package.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/decisions-package.fasl")
   :BYTES 1313 :SHA256
   "5ddb29bb8d0538a6d37652c1a25afde2d8209a7339a930f7c2c2976a37305f49")
  (:PATH "raw/core-R1-whole-cache/src/recovery/decisions-query.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/decisions-query.fasl")
   :BYTES 7494 :SHA256
   "654f3aded7c0b3da34d63254ecd29573abbfbc3a5bd27d1a5f08167eb74274ed")
  (:PATH "raw/core-R1-whole-cache/src/recovery/decisions-radix.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/decisions-radix.fasl")
   :BYTES 14802 :SHA256
   "8167696656a9a5eb5d205eb2d03496f6ab2221ff8be6bfc6aae2dcabeeba2052")
  (:PATH "raw/core-R1-whole-cache/src/recovery/decisions-sort.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/decisions-sort.fasl")
   :BYTES 14195 :SHA256
   "2f9e6ef721012636562b0c716a8e56f9a59bb78a11ed64139dc055e096ed96db")
  (:PATH "raw/core-R1-whole-cache/src/recovery/decisions-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/decisions-types.fasl")
   :BYTES 11092 :SHA256
   "783067dcec700d2cf060d5f4a9002d7ffc89b53d512c7a14457b3985ef828ab5")
  (:PATH "raw/core-R1-whole-cache/src/recovery/inventory-build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/inventory-build.fasl")
   :BYTES 14484 :SHA256
   "dcd0a5bf5185d63363bae0a677738fd0b3637ff9bef796e52ef1257a59a83943")
  (:PATH "raw/core-R1-whole-cache/src/recovery/inventory-query.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/inventory-query.fasl")
   :BYTES 3831 :SHA256
   "2e63fe43a50ab041b290624fe3a5ee42f514fc20efc81ce4cdb26a8bde795de8")
  (:PATH "raw/core-R1-whole-cache/src/recovery/inventory-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/inventory-types.fasl")
   :BYTES 14879 :SHA256
   "d385445b0803b004eaac0b966cf11fa18377404e85c62dedf8d744e058a48b72")
  (:PATH "raw/core-R1-whole-cache/src/recovery/manifest-build.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/manifest-build.fasl")
   :BYTES 15478 :SHA256
   "69eea9c3189b2611265142cb9f9b52c9a81b5f771160e2408c6c889883bbbaa3")
  (:PATH "raw/core-R1-whole-cache/src/recovery/manifest-decode.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/manifest-decode.fasl")
   :BYTES 10766 :SHA256
   "6d54c187662d6f9b561b9dc7ac14a622fa201c8faf1c8a6e6fca3c344d71b186")
  (:PATH "raw/core-R1-whole-cache/src/recovery/manifest-fold.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/manifest-fold.fasl")
   :BYTES 14563 :SHA256
   "e2a9e5e059b5c23a24ec75802f514ea319323c4f440f88ad7561c2c30ceaaf74")
  (:PATH "raw/core-R1-whole-cache/src/recovery/manifest-package.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/manifest-package.fasl")
   :BYTES 1782 :SHA256
   "a41b44ed56da3e7294ab061ebc8561fe30f64028d14357ae70a5dcf4cb06f0a1")
  (:PATH "raw/core-R1-whole-cache/src/recovery/manifest-query.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/manifest-query.fasl")
   :BYTES 6823 :SHA256
   "dce9122a8c59a3cd2f5b4becb76ab4548cd73e53724cff58434ce8abcae6bfd3")
  (:PATH "raw/core-R1-whole-cache/src/recovery/manifest-transition.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/manifest-transition.fasl")
   :BYTES 6644 :SHA256
   "78fbf4c5b1096aaf1f465473b5b7cb7547c54bc716e6205b883a5f1b94cc940a")
  (:PATH "raw/core-R1-whole-cache/src/recovery/manifest-types.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/manifest-types.fasl")
   :BYTES 30432 :SHA256
   "9b60ef265f463108d4df712b04a0d140f37d3955cdef444ef74a0edf152ba804")
  (:PATH "raw/core-R1-whole-cache/src/recovery/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/package.fasl")
   :BYTES 1356 :SHA256
   "4f01b23b7e348e3f1f51b44baaa71497b625f639d74175b1b18edbf1d675e4a7")
  (:PATH "raw/core-R1-whole-cache/src/recovery/scan.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/recovery/scan.fasl")
   :BYTES 25465 :SHA256
   "3303aef63a6ca0b7c866c5c7010698cce348068a22971c5dd2021913d3d27530")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/build.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/build.fasl")
   :BYTES 4117 :SHA256
   "c7cbcad3f88cb9126fbe910298bca1522d77fb7a08f11bb9368a8ec7f47b3bee")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/lifecycle-build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/lifecycle-build.fasl")
   :BYTES 6622 :SHA256
   "a4e7f3ca81933fb65f248597252bb8aeb7dae570e4084c764ad14a72cfc1f911")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/lifecycle-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/lifecycle-read.fasl")
   :BYTES 4505 :SHA256
   "1e0c1c31991db1850fdc8a427907359399983fffc05e2ddcfe4f64802f3476c4")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/lifecycle-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/lifecycle-types.fasl")
   :BYTES 13351 :SHA256
   "53472a89e950d8bd49c11ce0de5e2740c79144e53d6cdff69040a59eb8b87ce4")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/lifecycle-update.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/lifecycle-update.fasl")
   :BYTES 5742 :SHA256
   "a3637d761d5021c84afca7d0c2eb2c4aea1f07b80428ce64ac2edcca0782e8f0")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/lifecycle-worker.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/lifecycle-worker.fasl")
   :BYTES 3574 :SHA256
   "ce0d676f13513772448dd89fa2a2a05260d43434daa7f8aa7e633bf8ec57c0a5")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/package.fasl")
   :BYTES 1158 :SHA256
   "a0b32e1b227a9d81369bf28ca9de53528e4d7ed45ac5fa2a96391ab9c965e09a")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/policy.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/policy.fasl")
   :BYTES 4430 :SHA256
   "c7fb7f3e6a6c6cd0af02345797660531557d48a0fa8d5899e5cc602e7f54669e")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/pool-claim.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/pool-claim.fasl")
   :BYTES 2745 :SHA256
   "8383a0824bf1d240a3520dca518258687f60354384e8517fa707298f94790848")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/read.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/read.fasl")
   :BYTES 3347 :SHA256
   "68eca62656fb4f4d7de93891c5e392bed61fb12a645f5230b5936b4d24e20dbc")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/types.fasl")
   :BYTES 16622 :SHA256
   "fd519505a236ee3a35b6cb9397d94ba62166c1a9ab10c5d7c6a62a29722f0d56")
  (:PATH "raw/core-R1-whole-cache/src/scheduler/update.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/scheduler/update.fasl")
   :BYTES 4748 :SHA256
   "f118b7f2e4266bafca38345cf1e1d35b20309c4e0d9eba600568da81d41289d7")
  (:PATH "raw/core-R1-whole-cache/src/series/events.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/events.fasl")
   :BYTES 17576 :SHA256
   "928aab2ef48b3361c872a7b6457f52b94d2c715f21fd68ce4ba48fd706effdde")
  (:PATH "raw/core-R1-whole-cache/src/series/io-events.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/io-events.fasl")
   :BYTES 8406 :SHA256
   "2b1007cf5ba6a4e420ee4905857c8e8a2d71bbe6db108b2c3c276de43082d952")
  (:PATH "raw/core-R1-whole-cache/src/series/ownership.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/ownership.fasl")
   :BYTES 13676 :SHA256
   "88ece17b3e86b674932fee8fad821ab52a7ad0ff8fc643f2e1d2cf10bfd31014")
  (:PATH "raw/core-R1-whole-cache/src/series/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/package.fasl")
   :BYTES 1763 :SHA256
   "6ae7b7a48a6644d8b8e38d766d6303c05df833aab5725ce2793a08f12bc00ce9")
  (:PATH "raw/core-R1-whole-cache/src/series/publication.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/publication.fasl")
   :BYTES 14476 :SHA256
   "f6217a679f024ff43abcf31384a98d95de5ccbc2f6024f8f523b8c7633cf15af")
  (:PATH "raw/core-R1-whole-cache/src/series/query.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/query.fasl")
   :BYTES 6512 :SHA256
   "931991fec48d03ff878338560f234cdde5cded7935e06aae563390bae711ba2f")
  (:PATH "raw/core-R1-whole-cache/src/series/retirement.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/retirement.fasl")
   :BYTES 8228 :SHA256
   "6300b41d81701cf09566e1d495dada423c6b6a769dff4b7bcf7675ab2c3c8b4e")
  (:PATH "raw/core-R1-whole-cache/src/series/routing-build.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/routing-build.fasl")
   :BYTES 6431 :SHA256
   "9c24ddbbae8158f7c0c227f5771620506fd0c283472196fc5cd80f659e1b3ebc")
  (:PATH "raw/core-R1-whole-cache/src/series/routing-select.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/routing-select.fasl")
   :BYTES 6889 :SHA256
   "04d843f6135d6b67a808c34658f8c21c21a8215729be7167ecda4d5aef3dc215")
  (:PATH "raw/core-R1-whole-cache/src/series/routing-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/routing-types.fasl")
   :BYTES 9288 :SHA256
   "edd93c4ac74b84fe0ac0619076a2505923dd0c55851484c715f968d8f9fe7e6d")
  (:PATH "raw/core-R1-whole-cache/src/series/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/types.fasl")
   :BYTES 34027 :SHA256
   "d6aeba15dd13339e89bd2567dd531a8c4c12b66c26284f537f5057ac04b213f6")
  (:PATH "raw/core-R1-whole-cache/src/series/worker-boundary.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/worker-boundary.fasl")
   :BYTES 7864 :SHA256
   "2f377f83d86dc81300339c893c0a48df1a0ed2c4971b4497d54f957e149df1e9")
  (:PATH "raw/core-R1-whole-cache/src/series/worker-package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/worker-package.fasl")
   :BYTES 1605 :SHA256
   "e22996df38aa23cd46b14685dbfe3884b1de37151d9ddfd35609be69a1ec194c")
  (:PATH "raw/core-R1-whole-cache/src/series/worker-run.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/worker-run.fasl")
   :BYTES 15276 :SHA256
   "de2150dfe47496abb5810305f08143735aec270e793c8a577d65e020db99def8")
  (:PATH "raw/core-R1-whole-cache/src/series/worker-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/series/worker-types.fasl")
   :BYTES 17282 :SHA256
   "79700f65d85f34562b8c8044456930173794715a1cc3c1a3c571db06a44cd7b8")
  (:PATH "raw/core-R1-whole-cache/src/storage/compaction-scan.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/storage/compaction-scan.fasl")
   :BYTES 8302 :SHA256
   "f1f87c3ae201de7ff0661f85d3a8fb6c6bef9fc24eb018172fb74acacbb36493")
  (:PATH "raw/core-R1-whole-cache/src/storage/control-payload.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/storage/control-payload.fasl")
   :BYTES 12148 :SHA256
   "acee2c937210aa4427c3a4bfdd0b5ee95e89100775f27a3fba9f3e38a8fd0c9a")
  (:PATH "raw/core-R1-whole-cache/src/storage/formats.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/storage/formats.fasl")
   :BYTES 8600 :SHA256
   "de8d85277e412edd8861766f047e5a18bc922b0d079ceff51925668c1cb67601")
  (:PATH "raw/core-R1-whole-cache/src/storage/log-header.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/storage/log-header.fasl")
   :BYTES 7988 :SHA256
   "3a6e677a6a892b14865f00481bdfbe007a5240b16adca6451bbd8278e7fc7310")
  (:PATH "raw/core-R1-whole-cache/src/storage/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/storage/package.fasl")
   :BYTES 1514 :SHA256
   "fd3de00e525a8c2a1490acd55c60013566f4e953daee7b7fd478c55d757c876a")
  (:PATH "raw/core-R1-whole-cache/src/storage/payload-record.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/storage/payload-record.fasl")
   :BYTES 6765 :SHA256
   "ea1046f7ebb7ce35ed2b2dfb95aae313f9c751ab720312b89ec56576f4adab5b")
  (:PATH "raw/core-R1-whole-cache/src/storage/payload-write.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/storage/payload-write.fasl")
   :BYTES 9565 :SHA256
   "00e072a52537f39777cb276a2394d96d3de656e091f1071a6244e3c8da9935c7")
  (:PATH "raw/core-R1-whole-cache/src/storage/segment-header.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/storage/segment-header.fasl")
   :BYTES 10328 :SHA256
   "9f503f692d17ef46c747947149b800efcfe0d10c857967c4628e261a4debffaf")
  (:PATH "raw/core-R1-whole-cache/src/wal/builder.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/wal/builder.fasl")
   :BYTES 14611 :SHA256
   "ff41e7df7b2d83528efc7b0c4d62ad1576839a4c3656fc0a5d1efb1c64f6433e")
  (:PATH "raw/core-R1-whole-cache/src/wal/csn.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/wal/csn.fasl")
   :BYTES 16451 :SHA256
   "17162ffe19639c831e9f39b7c225a77d58deab74b8aa07b9cfab165042c7c972")
  (:PATH "raw/core-R1-whole-cache/src/wal/executor.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/wal/executor.fasl")
   :BYTES 13818 :SHA256
   "9570c80261bcf73d82545d718d9bc186fb51933c607587522329a40301ce9fa5")
  (:PATH "raw/core-R1-whole-cache/src/wal/group.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/wal/group.fasl")
   :BYTES 11046 :SHA256
   "2db9dd8d8c6ade367aa3338416aa5b4de8ee2cc75f0279604e6d82b06f9676b4")
  (:PATH "raw/core-R1-whole-cache/src/wal/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/wal/package.fasl")
   :BYTES 2139 :SHA256
   "95f73585ec5a8dc507c30e97ecdf26afd8f8c0bb959e9ede163b9382b4782c28")
  (:PATH "raw/core-R1-whole-cache/src/wal/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/src/wal/types.fasl")
   :BYTES 38905 :SHA256
   "a6e8e782b353c861fba2c712a564f65f910e2e3a7aa729182bbc5d81edf6c69d")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-array-write-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-array-write-support.fasl")
   :BYTES 22696 :SHA256
   "e35aaf50ac48cff291fdcbac59f408d63d72757bc4afee359287d7049798b851")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-array-write-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-array-write-threads.fasl")
   :BYTES 11048 :SHA256
   "0851ef3e66ea73ed8ef123623b0c6819d7450894a66b60b4cb97d6f2c674601c")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-array-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-array-write.fasl")
   :BYTES 36683 :SHA256
   "fee6198cef7b301319db2d334e01dcb66ee6379737eccc78f62f2ba917b49aa3")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 30420 :SHA256
   "493689cc66ee3a744b63221035cb01d4ac4619c57cab5f1cc67c24a8811d895e")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 10560 :SHA256
   "df25374f19aec5335e9ad6cb721f18f3c3c30f7ae32464a8790f4855de26f52f")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 40133 :SHA256
   "0eba32fc98011cb92ca405fb731072b584c60f4e8b2753c78ef42906e8162902")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-header.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-header.fasl")
   :BYTES 22725 :SHA256
   "47fdca53f9372ede7da887a457f4f85c0b8ab3b35fae9fc7f6ebf73fc749fce5")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-map-write-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-map-write-support.fasl")
   :BYTES 23704 :SHA256
   "dbb367775bbf125f01b0124294c26353ed924991f786bcadb12426dbc3319223")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-map-write-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-map-write-threads.fasl")
   :BYTES 11026 :SHA256
   "f88213668c3ce394ff5c71edc94804fa08ff70720c1dfee5a9dbbed1277e9461")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-map-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-map-write.fasl")
   :BYTES 38952 :SHA256
   "33ad323b219290808dbb425670685bc1251caa0afa8e17e7aaef0d8d7dd00cc3")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 3153 :SHA256
   "48907ecf957d182f379b918a6eb6500ca30038ea72f511c8c25c41eb680c500e")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 30244 :SHA256
   "f428955c885beaa72fba0d0c664b8c7b421785a8c86f8be146629a9f24366e11")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 12095 :SHA256
   "b7ef9236845c3b61a98a8f6a91f2691f37dbd34441eb202b35a60e1f2b0a0439")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 33537 :SHA256
   "15a84029e7555c0b69d8293ea603604a259c314a3a892c7d52209c7b6fc2f806")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-minimal-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 23909 :SHA256
   "c3c7b304fef5a10a3ff020061e8731dee38b36b7612e1b2a3d6e5b2b7874c200")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-minimal-threads.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 9957 :SHA256
   "2e92d7857d0c6d828ab91aa5a55d98f407f15e62c7477fbbeb9916c949189bd8")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 24433 :SHA256
   "2efa5886cfdeb8bf70e087a3dbbbdc729d256118e6efcc0ddfe51d5c9e91a658")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 16663 :SHA256
   "075bd432eda2463916247f9c30f4815f17510e9c6bd0477ab72c33fc90c05a99")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 10501 :SHA256
   "5b316780226dc319069d0edb61c53bc916d3a0ad013866547e2fbcd7d73af509")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 23637 :SHA256
   "bdd2f09be61a14cef91525d6efa739c835a9af7443da62f24c2b3b6d1fe51b88")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 19602 :SHA256
   "b3b0fa1c4332b1b4ff9c7403d23bfe82b59de288031b2b41ac305b7fe226534c")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 10437 :SHA256
   "8d445ac4238dfba369a21901cba63419044c603ccf1aedb4616d060147434f24")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 28858 :SHA256
   "88980cf14f5c450d5719e417c8f4f007ee431ba7e4a75f75ea5f585b44f8e76e")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 34960 :SHA256
   "10a1265c8ae3ed2da51944dfeb6aac5dfe4a726cb896440a4648c6a226d8f50f")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 11832 :SHA256
   "dc8b1b1eed9d3852be77a26efdb84a0126d004dde607cb3039fd76b522c18d48")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-structure.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-structure.fasl")
   :BYTES 41695 :SHA256
   "a8bbf35d696cd554418f7ed9f1fc56d5118498bc51343204cacc1b9a22a67aaf")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-support.fasl")
   :BYTES 18151 :SHA256
   "3302ca551a325cb977770ed2d70a1872945d0263151253942126f9ce265b5d73")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-tag-write-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-tag-write-support.fasl")
   :BYTES 22748 :SHA256
   "fdeac4911fbd77ae15f99151ef9de1b7c38aadd4a9a4721fddb0ee1e100598ec")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-tag-write-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-tag-write-threads.fasl")
   :BYTES 10786 :SHA256
   "a6fac4e847124aeba547b0840e97fa972ce3eb159ff2848c0a8d65fa3b9fc7fd")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-tag-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-tag-write.fasl")
   :BYTES 34841 :SHA256
   "c84462ec77ed6dd7441932d57ffbc91121a0323510b0903e457c3f638c3d097c")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-threads.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-threads.fasl")
   :BYTES 10405 :SHA256
   "6e60da3a8f6b68fe1cf388c2473dd71158bab9b36798a04a5a5fe75930b3a6ca")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-write-roundtrip.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 2572 :SHA256
   "a2c960aa5d055e07a26427fd9071c72db21e19ff32b00e8cf6af2c7f9418908f")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 14028 :SHA256
   "48b205e09cefe407925d99a92f4d6a945c16ea16ce5457a6a687c4be2b5d8ac9")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 10559 :SHA256
   "e46f8c518b0da9411b2b683ca85a7d5073559c9c619e276733fe65cda6701ba9")
  (:PATH "raw/core-R1-whole-cache/tests/codec/cbor-write.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/cbor-write.fasl")
   :BYTES 19810 :SHA256
   "b6b0644261113b728240c91fc80b8b2cbe1f6ba9b8510ce0f2d55c60438ded58")
  (:PATH "raw/core-R1-whole-cache/tests/codec/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/support.fasl")
   :BYTES 17745 :SHA256
   "f747df11c26022ae2fef10aaa670f947cc30f65bc56a66f4b6d58e17b065daa9")
  (:PATH "raw/core-R1-whole-cache/tests/codec/threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/threads.fasl")
   :BYTES 9429 :SHA256
   "8b1073b8607ad26d56a7c46cf8b0fa0ac09b59d823be94f65b3bc135068f9317")
  (:PATH "raw/core-R1-whole-cache/tests/codec/utf8.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/codec/utf8.fasl")
   :BYTES 25388 :SHA256
   "3f04e65fd0405ba382fe0105fa30ee537dae6f1dcdff3e74ccd60c03023b073c")
  (:PATH "raw/core-R1-whole-cache/tests/control/native.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/control/native.fasl")
   :BYTES 151862 :SHA256
   "66476578269414fa944fdfaee6a4c42794c0deb268c7012204c19e0c2af9d142")
  (:PATH "raw/core-R1-whole-cache/tests/control/publication.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/control/publication.fasl")
   :BYTES 258144 :SHA256
   "d4f542f9222c0299986df2a25c470c46df222e5b03b327b6b91c02f4d211b6f4")
  (:PATH "raw/core-R1-whole-cache/tests/control/recovery-publication.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/control/recovery-publication.fasl")
   :BYTES 96693 :SHA256
   "1b205d094ffdfe8581f006a777f847c1a7456ab25e99c78ad01a2f16c721ff48")
  (:PATH "raw/core-R1-whole-cache/tests/control/recovery-read.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/control/recovery-read.fasl")
   :BYTES 144700 :SHA256
   "fc7d61b0acd192e2cdf61c3aff0c6380e4116a54e13a4055a4b20d0e103e92e1")
  (:PATH "raw/core-R1-whole-cache/tests/control/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/control/support.fasl")
   :BYTES 3966 :SHA256
   "5786b2921b3b317ee590b214e44c3a8c356e8e8a252c51ac2ab571e928eba806")
  (:PATH "raw/core-R1-whole-cache/tests/csn/registry.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/csn/registry.fasl")
   :BYTES 50847 :SHA256
   "b24c8208a01a1b1acad294dbe74238e94705926e81c8f0414a85fd6d28ad0b47")
  (:PATH "raw/core-R1-whole-cache/tests/csn/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/csn/support.fasl")
   :BYTES 40008 :SHA256
   "1715fd450ba32f876558fd16fb766fd36b70af4a750787b7786851ec49630d9b")
  (:PATH "raw/core-R1-whole-cache/tests/csn/threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/csn/threads.fasl")
   :BYTES 22688 :SHA256
   "b863317e5183c09ce3ad437a1f373496aa6257b86e2b15d0632187c24d49a8d4")
  (:PATH "raw/core-R1-whole-cache/tests/epochs/lifecycle.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/epochs/lifecycle.fasl")
   :BYTES 74001 :SHA256
   "81d08d485a7835068744cabd66b107dec3bf3290e1ae2b80e5589aff18bf185c")
  (:PATH "raw/core-R1-whole-cache/tests/epochs/support.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/epochs/support.fasl")
   :BYTES 35879 :SHA256
   "c772be62402bff44e81448b401d1ed3db2f289219a6d966c4910cec93295ca97")
  (:PATH "raw/core-R1-whole-cache/tests/epochs/threads.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/epochs/threads.fasl")
   :BYTES 10436 :SHA256
   "8d4ad6b04d72840dd2cd95219f46e12875df404dfc0ee55580b4f1f5a0195242")
  (:PATH "raw/core-R1-whole-cache/tests/execution/handoff.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/execution/handoff.fasl")
   :BYTES 90800 :SHA256
   "bb6c8eefec9266cb897ce380b88460f5a7ae1f902099d729006311661119bd65")
  (:PATH "raw/core-R1-whole-cache/tests/execution/queue.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/execution/queue.fasl")
   :BYTES 40351 :SHA256
   "609f406e5b785aaa57bb0b61224a6d5d231d6d9e97541dbe3af25abff42a8e7d")
  (:PATH "raw/core-R1-whole-cache/tests/execution/ready-recycle.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/execution/ready-recycle.fasl")
   :BYTES 67068 :SHA256
   "9a3c91271434152a6145d0d5581f2d617b0591bcd53eca7b5f5b0e63a225ac0a")
  (:PATH "raw/core-R1-whole-cache/tests/execution/ready.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/execution/ready.fasl")
   :BYTES 82284 :SHA256
   "e81602be49699070b81edaee1f8a1134169b502cf1b53e04f395eb69774bfc0e")
  (:PATH "raw/core-R1-whole-cache/tests/execution/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/execution/support.fasl")
   :BYTES 16072 :SHA256
   "95bea0fd9b194958276bcfda3ca6739559853a8412319a198da210d7b4626da0")
  (:PATH "raw/core-R1-whole-cache/tests/execution/threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/execution/threads.fasl")
   :BYTES 32792 :SHA256
   "bd6a978bb778ab2846edac8fa53983048e813d4d08acedd866b45f46309aa6fb")
  (:PATH "raw/core-R1-whole-cache/tests/execution/worker.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/execution/worker.fasl")
   :BYTES 158284 :SHA256
   "604a2c3ad05e423234a4d9d46d81b6ce9c0ab3b4e396a5fb7f4f4594983f30ed")
  (:PATH "raw/core-R1-whole-cache/tests/foundation/batch.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/foundation/batch.fasl")
   :BYTES 19007 :SHA256
   "09273bc570dcd6cacd4cb6425a73b284127b7f88b1209c09138fa6e02476f411")
  (:PATH "raw/core-R1-whole-cache/tests/foundation/binary.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/foundation/binary.fasl")
   :BYTES 15575 :SHA256
   "16630695022ce579c11e7db540d9f05b0a778b5785f0fad0c0b3c7d401a567cc")
  (:PATH "raw/core-R1-whole-cache/tests/foundation/record.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/foundation/record.fasl")
   :BYTES 59130 :SHA256
   "425f39d8c83a6a9548645647018c4ea75a781d8d99d2d39c38116cc9c1f75942")
  (:PATH "raw/core-R1-whole-cache/tests/foundation/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/foundation/support.fasl")
   :BYTES 10289 :SHA256
   "720c23c12e229a9fa00f0814d1391c4bbb78055819e63a90ce165eab877952ce")
  (:PATH "raw/core-R1-whole-cache/tests/get-active/construction.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-active/construction.fasl")
   :BYTES 80711 :SHA256
   "95d599c1f7d1db3b48b982e54e0e6a19cafe79e5e62c012e65b8ccd2f6fd3f43")
  (:PATH "raw/core-R1-whole-cache/tests/get-active/directory.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-active/directory.fasl")
   :BYTES 29473 :SHA256
   "7e24f7a56b48eb95339f5830ad1120d4d5b5f5f5c0b76d8afe6d31abb4fa0336")
  (:PATH "raw/core-R1-whole-cache/tests/get-active/preflight.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-active/preflight.fasl")
   :BYTES 72404 :SHA256
   "2d51ee3461b36c2483997051c3e3962c98e2b0db1caa24634479186e50913986")
  (:PATH "raw/core-R1-whole-cache/tests/get-active/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-active/read.fasl")
   :BYTES 110779 :SHA256
   "72fbb7afffdfbd90a4282cbc8df91474795b7c99f3c628f0979dc2bc5a6842d2")
  (:PATH "raw/core-R1-whole-cache/tests/get-active/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-active/support.fasl")
   :BYTES 179848 :SHA256
   "28087e1705a0930b515fdd388c3dc61335886864a30405e28a09684320de57d4")
  (:PATH "raw/core-R1-whole-cache/tests/get-directory/construction.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-directory/construction.fasl")
   :BYTES 40555 :SHA256
   "38ec0355d3949999c1c52d400ba231836bc2a092f07b98291519ee6ab9aa2adf")
  (:PATH "raw/core-R1-whole-cache/tests/get-directory/lifetime-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-directory/lifetime-support.fasl")
   :BYTES 26866 :SHA256
   "eafbb8d44fb4771ecb8ca1f336c36c85d6870e5aae207ec337efa7ea77ad4b09")
  (:PATH "raw/core-R1-whole-cache/tests/get-directory/lifetime.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-directory/lifetime.fasl")
   :BYTES 69132 :SHA256
   "f80cbba6c8ec51aaba244fc58adda96e2767b256472e10ce29daa58597462c20")
  (:PATH "raw/core-R1-whole-cache/tests/get-directory/read.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-directory/read.fasl")
   :BYTES 65633 :SHA256
   "c7f92c13509e5d5c577a741b65445da959f3e52c10be42f59c25d13b03690007")
  (:PATH "raw/core-R1-whole-cache/tests/get-directory/series-read.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-directory/series-read.fasl")
   :BYTES 243998 :SHA256
   "8d2608038a69454fc3238d6b59846e654b624911199370435cf047cbb1874051")
  (:PATH "raw/core-R1-whole-cache/tests/get-directory/series-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-directory/series-support.fasl")
   :BYTES 116833 :SHA256
   "f4dd05d35f30a3f1ce7017e9ff08c730380d17566f6155eed23ca67d2ae525e7")
  (:PATH "raw/core-R1-whole-cache/tests/get-directory/support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-directory/support.fasl")
   :BYTES 133883 :SHA256
   "453a77e8e98ef62e91143ee1dd3ded1c93bf3c4529f9b6d756bf21654a08441a")
  (:PATH "raw/core-R1-whole-cache/tests/get-directory/threads.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-directory/threads.fasl")
   :BYTES 15456 :SHA256
   "7930f16994968abda74326a714b6fb1d5ff3b86999e517da0e0a0e0ae3eb6d2f")
  (:PATH "raw/core-R1-whole-cache/tests/get-performance/guards.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-performance/guards.fasl")
   :BYTES 19333 :SHA256
   "6eed1badc7143569e3737ce6621ee16d94d3aa3ad6b973a50d39e7098c4baa13")
  (:PATH "raw/core-R1-whole-cache/tests/get-performance/paths.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-performance/paths.fasl")
   :BYTES 15884 :SHA256
   "05d34ebd7e3721f7510e13962524b8370984cd649e7f5b422cc25f1aa52c8f9e")
  (:PATH "raw/core-R1-whole-cache/tests/get-performance/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-performance/support.fasl")
   :BYTES 114338 :SHA256
   "19669b472ff3da44df671ab8c94a0207850ace60a0bd09b36cbf2f36df1c3d26")
  (:PATH "raw/core-R1-whole-cache/tests/get-performance/threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-performance/threads.fasl")
   :BYTES 10498 :SHA256
   "fd335c19ae695cc015c07048ab6ea413fd282b22fcdbc17970efb52789e30831")
  (:PATH "raw/core-R1-whole-cache/tests/get-resolver/construction.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-resolver/construction.fasl")
   :BYTES 56497 :SHA256
   "5bd097d9d292ae5e787fa0bc3e619492f19c7d6bff27d0d948c25036247f61d2")
  (:PATH "raw/core-R1-whole-cache/tests/get-resolver/read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-resolver/read.fasl")
   :BYTES 122930 :SHA256
   "756eeeddedb9a7ca54bb86a6f7ab773b769fd702c0b77128863e5ac93df359cd")
  (:PATH "raw/core-R1-whole-cache/tests/get-resolver/sort.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-resolver/sort.fasl")
   :BYTES 31291 :SHA256
   "8dc1c1e8e1ea0073bb418ccf4d3f0a9767e8b499d386d1a1cf6d8139a9d06ffd")
  (:PATH "raw/core-R1-whole-cache/tests/get-resolver/support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get-resolver/support.fasl")
   :BYTES 130408 :SHA256
   "4322295e9b11b10a2032ea3b37662dbd1003a4c30d07b23c3cf5ce9339b8d099")
  (:PATH "raw/core-R1-whole-cache/tests/get/lifecycle.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get/lifecycle.fasl")
   :BYTES 86083 :SHA256
   "a8b659208685786c8b5e5e81e66a8d05114951a0e993df4efaa241f61de77bb3")
  (:PATH "raw/core-R1-whole-cache/tests/get/segment.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get/segment.fasl")
   :BYTES 64584 :SHA256
   "f64a01a0f60612c493434e8a46af490e6841bacbf1b9f2e26357286f61e9c6b9")
  (:PATH "raw/core-R1-whole-cache/tests/get/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/get/support.fasl")
   :BYTES 56083 :SHA256
   "b0afeaa830e899aafcaf291185c859639422d359ad4101fcfcae8cbff45e09fd")
  (:PATH "raw/core-R1-whole-cache/tests/hash/guards.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/hash/guards.fasl")
   :BYTES 4823 :SHA256
   "9e898a1c68aca8e10bade5666a007e873e2166e7d611b6dd2db0a6d2533f49d0")
  (:PATH "raw/core-R1-whole-cache/tests/hash/hash64.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/hash/hash64.fasl")
   :BYTES 37250 :SHA256
   "e1ce2d2e531e85a072c73579d2c1985a725a0a4bc238f1aafa4f96ef68dbcd73")
  (:PATH "raw/core-R1-whole-cache/tests/hash/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/hash/support.fasl")
   :BYTES 46861 :SHA256
   "4118a696edcf919f1991965060abc6627be3aeeae008245e390b89f928263b02")
  (:PATH "raw/core-R1-whole-cache/tests/hash/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/hash/threads.fasl")
   :BYTES 14686 :SHA256
   "0c47f69c28fa76f67e7c5d51175a912793dc4fc28832e70ae939d5de923a8ef7")
  (:PATH "raw/core-R1-whole-cache/tests/io/flush-failure.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/io/flush-failure.fasl")
   :BYTES 34590 :SHA256
   "dddd974b531c4a19f91d5bf2f6610d78d8b58069000e501de3fc81f6e61e0f4e")
  (:PATH "raw/core-R1-whole-cache/tests/io/native.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/io/native.fasl")
   :BYTES 34334 :SHA256
   "bea926d98dd373f0077d1df20ce85b5cbaeb083c024dbe6cd05be2b8d8e0d893")
  (:PATH "raw/core-R1-whole-cache/tests/io/rename-native.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/io/rename-native.fasl")
   :BYTES 126308 :SHA256
   "fd27a17b9479995960cbfb60d48dd8eb028c8bcc8c4406525387b3c10a1a9814")
  (:PATH "raw/core-R1-whole-cache/tests/io/rename.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/io/rename.fasl")
   :BYTES 110064 :SHA256
   "bb168d73ad257f8b9a51e6870dd2194630c355ec1da93ebd4f9ba4006623d39e")
  (:PATH "raw/core-R1-whole-cache/tests/io/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/io/support.fasl")
   :BYTES 16082 :SHA256
   "12aac7a1c7cd28a5580f1514fbc1e15abd4b57f3974d14833b39db2b6789ddb2")
  (:PATH "raw/core-R1-whole-cache/tests/io/transfer-failure.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/io/transfer-failure.fasl")
   :BYTES 25960 :SHA256
   "403239f89cdba46a48ca727cba77dc1e12046bfec1e3f16e65aa927d18f0a43d")
  (:PATH "raw/core-R1-whole-cache/tests/io/transfer.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/io/transfer.fasl")
   :BYTES 53187 :SHA256
   "32be9ef25786e23bc3939bd8f2e342b7fd941ce6e903ebab2ce0b5f8045ec392")
  (:PATH "raw/core-R1-whole-cache/tests/mvcc/capture.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/mvcc/capture.fasl")
   :BYTES 48575 :SHA256
   "24a7bf3fc4fdf025f04536914e7eea0390157c439a418b3a01fda22120515e78")
  (:PATH "raw/core-R1-whole-cache/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 89157 :SHA256
   "07131636a3e18b055f01c5815cd05256dae866e20a6e8d290edc3067fa85892c")
  (:PATH "raw/core-R1-whole-cache/tests/mvcc/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/mvcc/support.fasl")
   :BYTES 38358 :SHA256
   "66be4595886ccd98abfc8d9d65a995254576afe7a0922786f4396ef845ceaee2")
  (:PATH "raw/core-R1-whole-cache/tests/read/lifecycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/read/lifecycle.fasl")
   :BYTES 122302 :SHA256
   "90320b2afa38a69e0973311a7b4e867ff3c18373ef434fd95847bf2b697d4b54")
  (:PATH "raw/core-R1-whole-cache/tests/read/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/read/support.fasl")
   :BYTES 20936 :SHA256
   "4543691b60a93be6988a1dc52c7865fab812cf2c2234a84ccfcad7f19743e103")
  (:PATH "raw/core-R1-whole-cache/tests/read/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/read/threads.fasl")
   :BYTES 16898 :SHA256
   "d4cc854d461987b697ba0426033eb9abe5919d9c38823dbde3fa5e1e5aa546ca")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/corruption.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/corruption.fasl")
   :BYTES 13106 :SHA256
   "e5d0b769b14c6f25b9d8bc2bb0f16d180fe2a1b6f390fd0bb32df212824d4186")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 34022 :SHA256
   "68a9fef35efbb113e904454d1b4931515fe25ba6d6527e37d8bca460d2362d70")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 69392 :SHA256
   "7868e9a9641f9b3ac0b20ffdef2505a5729cf495553a5cb2fda8b6bf711eeed0")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/decisions-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/decisions-support.fasl")
   :BYTES 16632 :SHA256
   "ec46a7b2ae8d021c4bc024f5b9340dcc2b9d025dd5f02165e7ddc3a524095d8f")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/decisions.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/decisions.fasl")
   :BYTES 57607 :SHA256
   "7e6edde25f169820b60ed5b8d0e4c9b55dd22bc6c2e50e0bcd7f7cc7ec0dba31")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/inventory-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/inventory-support.fasl")
   :BYTES 20603 :SHA256
   "4a4eea740f9912172011d06e0cadc950d89885f52aa0bdcdbcd1ddaf0a232639")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/inventory.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/inventory.fasl")
   :BYTES 37721 :SHA256
   "37a8739d757f6ba72f79f96d3cdfd5ffe9520a6388b73ba747ab2a49e238935f")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 47979 :SHA256
   "fdd2b11da9cb3d81e379cd22fbc894a1fe44ab91a06f7b4a6ddf390996c26bf0")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/manifest-support.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/manifest-support.fasl")
   :BYTES 24117 :SHA256
   "618f78c32c39ab196bcd94be9c27d4c50e98483008bf731062ae2f89525c2551")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/manifest-transition.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/manifest-transition.fasl")
   :BYTES 63037 :SHA256
   "745050e35a010f849c8526a05ebce47b37ec32a2bc28cfbb5c186c07bf6f9ca0")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/manifest.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/manifest.fasl")
   :BYTES 33944 :SHA256
   "eba85844ae216ed8f06e5f822b8c85c1b125ef692bbff62cdf6647b301fdcbf9")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/scan.fasl")
   :BYTES 52960 :SHA256
   "6628e5076c95f5e61636ddefd9fcde6cce1c871f6d4d4e78663e400f827af65e")
  (:PATH "raw/core-R1-whole-cache/tests/recovery/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/recovery/support.fasl")
   :BYTES 17920 :SHA256
   "322f16ea90a5f57a2ba963be4706d283592a640d2c60ea8fa80312436513a163")
  (:PATH "raw/core-R1-whole-cache/tests/scheduler/controller.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/scheduler/controller.fasl")
   :BYTES 48551 :SHA256
   "bbb494f72f7350549fdaa1abfdd6e75956f156b7d0df4ce3538ca72669b2e93b")
  (:PATH "raw/core-R1-whole-cache/tests/scheduler/dispatch.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/scheduler/dispatch.fasl")
   :BYTES 64711 :SHA256
   "c7c1014335b125b41edf3e43fbfd97e7d67afbb394ebe25e21408a11d5b3f4d5")
  (:PATH "raw/core-R1-whole-cache/tests/scheduler/lifecycle.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/scheduler/lifecycle.fasl")
   :BYTES 96610 :SHA256
   "d2fd642e9471d2dbbb6045f8028aa62ffa4c0ec2394e2c64beb36db4a3bf21ee")
  (:PATH "raw/core-R1-whole-cache/tests/scheduler/pool-begin.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/scheduler/pool-begin.fasl")
   :BYTES 59530 :SHA256
   "f900a789e3c38b8d8bea036cdb2d31bb332be2f9913cf24f9c5563ddec0949ec")
  (:PATH "raw/core-R1-whole-cache/tests/scheduler/pool-claim.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/scheduler/pool-claim.fasl")
   :BYTES 42928 :SHA256
   "e20c0a1e691bc11b7b07ebbd4b6be056f5fd9b4f7133e564e81afa25f00dfa6f")
  (:PATH "raw/core-R1-whole-cache/tests/scheduler/pool-recycle.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/scheduler/pool-recycle.fasl")
   :BYTES 52638 :SHA256
   "73a9ca525368e05a9facd61ee4bc6d7220e8221be41535bfbd0b9efc812d575d")
  (:PATH "raw/core-R1-whole-cache/tests/scheduler/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/scheduler/support.fasl")
   :BYTES 10748 :SHA256
   "21add841f0d4bbc347490512f68faa906d9b1846ee0ffe4ab760a1eacd238a22")
  (:PATH "raw/core-R1-whole-cache/tests/smoke.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/smoke.fasl")
   :BYTES 3302 :SHA256
   "2ae8a94fe1db0b587166de7f560164b1fbae61e719e78804ac79b51f11a0d5c5")
  (:PATH "raw/core-R1-whole-cache/tests/storage/compaction-scan.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/storage/compaction-scan.fasl")
   :BYTES 35516 :SHA256
   "6f669bd175ff6a11b1b24c5e42a6ff68a27e6df6f045873f0037f48a631a8e3e")
  (:PATH "raw/core-R1-whole-cache/tests/storage/control-payload.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/storage/control-payload.fasl")
   :BYTES 59369 :SHA256
   "cb49bf687efad89f07ce37bcb58730ce26c1352f45d5902a848b483deee31474")
  (:PATH "raw/core-R1-whole-cache/tests/storage/log-header.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/storage/log-header.fasl")
   :BYTES 36655 :SHA256
   "d13e03610849ef306e9a801b865fb78b6f96b6871e7755e81a9f202130f32194")
  (:PATH "raw/core-R1-whole-cache/tests/storage/segment-header.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/storage/segment-header.fasl")
   :BYTES 18234 :SHA256
   "af56d7c5856e9a38766efd8d49cb83f13f682766adfc53f979eb4f76c27140ca")
  (:PATH "raw/core-R1-whole-cache/tests/storage/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R1-fasl/tests/storage/support.fasl")
   :BYTES 13736 :SHA256
   "1a1e5c6d6b8d5e75c19a7fec2f1aa37947c8a8e3e0df37380d6b5416d47847be")
  (:PATH "raw/core-R2-inner/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073535-command-71009-0/conservazione.lisp")
   :BYTES 1784 :SHA256
   "e4a169c97ec15b212239338bb6ac4bc1d6cd466486e399b8486043ba3def6012")
  (:PATH "raw/core-R2-inner/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073535-command-71009-0/report.lisp")
   :BYTES 317 :SHA256
   "6a622ac6f738cb83cad7f95a25e9129795a08b5ce8aa47177ac32066629b735b")
  (:PATH "raw/core-R2-inner/report.lisp.gz" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073535-command-71009-0/report.lisp.gz")
   :BYTES 132595 :SHA256
   "b1cea78577e8bbc9dc7e621267347cb24f15c2072e6133c1ebf15d4ae3aca8c7")
  (:PATH "raw/core-R2-outer/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073533-command-70908-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "5344f0cccb11a7f39a4f63b5c98c75e114be1ac8f522d6afed9d97592b52863c")
  (:PATH "raw/core-R2-outer/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073533-command-70908-0/report.lisp")
   :BYTES 192836 :SHA256
   "55530e4b2a631db9df511da9eca64a44f1bc8f6070675b8de10e50f01420fc3b")
  (:PATH "raw/core-R2-whole-cache/src/active/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/active/package.fasl")
   :BYTES 1598 :SHA256
   "60d7564dbd859cb394cd54fb0cdbc1767c36a98e5d65ccfe174bb13b9b807c6e")
  (:PATH "raw/core-R2-whole-cache/src/active/preflight.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/active/preflight.fasl")
   :BYTES 4808 :SHA256
   "e21a067c7045645cb307a2f37930fd9e8f00affd3053f43288abf111cd2c2e06")
  (:PATH "raw/core-R2-whole-cache/src/active/prepare.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/active/prepare.fasl")
   :BYTES 5570 :SHA256
   "d1b5b0ae665df434b3e7d2af39dc6449fcb80526d2bec8be656c5efe62938208")
  (:PATH "raw/core-R2-whole-cache/src/active/source.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/active/source.fasl")
   :BYTES 5224 :SHA256
   "e0768abfa7b8d4128d61ba6291f132f61c66c347da948448e88fe0fa9710c8f9")
  (:PATH "raw/core-R2-whole-cache/src/active/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/active/types.fasl")
   :BYTES 5985 :SHA256
   "ed41f096c664b276f2d049c191c8afda27bd7a44c6eebcb109e3e898ab0c6c02")
  (:PATH "raw/core-R2-whole-cache/src/cache/build.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/cache/build.fasl")
   :BYTES 8859 :SHA256
   "6b6eed4c507d058caebd2e1c08372687ac2a2ea0c8f9213939d6478948b8f58b")
  (:PATH "raw/core-R2-whole-cache/src/cache/clock.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/cache/clock.fasl")
   :BYTES 4900 :SHA256
   "b1c2909cba0b3a97b2ebf540eae2798f1aaee4d19ccbea08b4dcbbf58a830166")
  (:PATH "raw/core-R2-whole-cache/src/cache/core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/cache/core.fasl")
   :BYTES 7275 :SHA256
   "e137e1f4b82d307945cdd9a0225f0b1a1db53a8621338b25ca1c21a996ae0060")
  (:PATH "raw/core-R2-whole-cache/src/cache/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/cache/package.fasl")
   :BYTES 1182 :SHA256
   "70e1d3155187f6290310bb025dcc5d5a71107b42b7e27070dae45bab5c6ecd26")
  (:PATH "raw/core-R2-whole-cache/src/cache/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/cache/read.fasl")
   :BYTES 11973 :SHA256
   "cf8a72170a3ce21e77ad484fb55d6bb7ad3669c3efea58e4f89721fa7149cb2f")
  (:PATH "raw/core-R2-whole-cache/src/cache/types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/cache/types.fasl")
   :BYTES 18000 :SHA256
   "4ce69a13163a0dfee45bfc1cd609044aba53d06afadee21ea39d36ecfb92b70d")
  (:PATH "raw/core-R2-whole-cache/src/cache/write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/cache/write.fasl")
   :BYTES 9839 :SHA256
   "30c5c23c823efcf5a386623ccb8da95bb0ebb5183c16042ceda14ac93652e9a4")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-array-input.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-array-input.fasl")
   :BYTES 9988 :SHA256
   "9d082bdf873885edbcb380cb9eb8a5eacf701a6ac7b07d6627c5d12dec04ee3c")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-array-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-array-write.fasl")
   :BYTES 8702 :SHA256
   "e96ad3ec5903fa6dfdf881a3f9922e9008bfa9c85c067cdbd7466fc27fba4aba")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 4242 :SHA256
   "fa359e69b73f858ad579a38e0a13c65dfcc84f7c92f1664e398d0fe9c8ef2f71")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 5060 :SHA256
   "a72ae2e014ae0c58640ea5051ecc9795b5c58350b666e67dd3134c7bff43bf5f")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-float-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-float-write.fasl")
   :BYTES 6810 :SHA256
   "646c2414f4447c08d110effceefb7742e7d424a84f1596b2d31fac363140cde7")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-header.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-header.fasl")
   :BYTES 7392 :SHA256
   "22d16986af72912b595933f3c6960127de8a8c61b0ec80dd683f2b76c51385b7")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-map-input.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-map-input.fasl")
   :BYTES 10479 :SHA256
   "181bebc2c748cd7952dd7ba5320cce3fe6629e55cba114e72122948a771f2283")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-map-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-map-write.fasl")
   :BYTES 8790 :SHA256
   "f6e844861d9699e6068f77a2de152b2bad606755c000910d063573d9ec291623")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-minimal.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-minimal.fasl")
   :BYTES 5480 :SHA256
   "8c368a9dfd7bc23cfceb15a01d5e164fe87d081e0eb3f125c1d0508d981ef1b9")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-package.fasl")
   :BYTES 1262 :SHA256
   "2683419097804256e16960a1ee474e3319626d57da3233018b7d317590ce6605")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 3465 :SHA256
   "d9075b73529ebdbfcc09c650d2b290cc0961c7ca7eb37f3a07c9541ae0d9baae")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 10671 :SHA256
   "335dc67ace5e4dfb4825999c244da7ccd8c528c8f4a0ec596e270c1c95a8bba3")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 2941 :SHA256
   "e38df189204830198f9758312be3e18591bcd468dfffe9d9c67dca3481ba87d4")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 8030 :SHA256
   "d727c2ded958c07948a8e80f2eb28c1c4e43715ccc03c5d4939ea0917ccbcd85")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-scan.fasl")
   :BYTES 8491 :SHA256
   "d13c9ffeb963819ab7f9fd18dec4fbaa4cacc870e55dbadc905b3cbd1ca35c2a")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 3956 :SHA256
   "a5d05e78900b746860c548e1ee6ff74c8f10e8992430ceaaee01c8295ad95385")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-space.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-space.fasl")
   :BYTES 11645 :SHA256
   "fced72f3564db2ca4b9bb5389e7371c22f5b989b8aba4fe6705604796582c2bb")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-string-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-string-write.fasl")
   :BYTES 9770 :SHA256
   "39c3c3186b8ac5923a824af2b15d309b9098a375314f38d15d1185dd38916998")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-tag-input.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-tag-input.fasl")
   :BYTES 7031 :SHA256
   "2da7cedfe76fd4127911cbd2ceb92f36d2058b3c939a210bfb1440cb65c78929")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-tag-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-tag-write.fasl")
   :BYTES 6374 :SHA256
   "f431c61a66a424583b997fd953af006269047dd1fc7785cb4da99ed0e6c60124")
  (:PATH "raw/core-R2-whole-cache/src/codec/cbor-write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/cbor-write.fasl")
   :BYTES 6935 :SHA256
   "4afdb8f1df60bf1b8390ccf74aeb07e17fab3e44fe619a054c42e8d035397e56")
  (:PATH "raw/core-R2-whole-cache/src/codec/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/package.fasl")
   :BYTES 951 :SHA256
   "4bee1701f65018605151f8e581c85cc489725aa80b1db283ec57ab9ef03811f2")
  (:PATH "raw/core-R2-whole-cache/src/codec/utf8.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/codec/utf8.fasl")
   :BYTES 8348 :SHA256
   "f053d1098a418bfc152ce3751a92f7cece8edd9769fed829bf1ef850b60e397e")
  (:PATH "raw/core-R2-whole-cache/src/control/build.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/build.fasl")
   :BYTES 8215 :SHA256
   "24cbcb8260ba6097cb171a1c0164a997eddfce69e7d7f837d23af3a54d157208")
  (:PATH "raw/core-R2-whole-cache/src/control/dependency.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/dependency.fasl")
   :BYTES 4004 :SHA256
   "6abe56656de1c325f98646c1c0654a9ed26fd15c10264119acb86e23a717bdd9")
  (:PATH "raw/core-R2-whole-cache/src/control/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/package.fasl")
   :BYTES 2274 :SHA256
   "c8f4e17e8e8e7150a4a5dcad5d260527cd116e9cbfa53ff4a2ac4a1941cdea0e")
  (:PATH "raw/core-R2-whole-cache/src/control/preflight.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/preflight.fasl")
   :BYTES 5187 :SHA256
   "ee9fa32e1c494e5a6ad04cab5b1af2811ea663b9502c71faade006683030be4b")
  (:PATH "raw/core-R2-whole-cache/src/control/prepare.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/prepare.fasl")
   :BYTES 5568 :SHA256
   "b7e59db61bac2442b4eb80c60a9116c42bef294fa61d0f2e5ae7b0e42ee22ffe")
  (:PATH "raw/core-R2-whole-cache/src/control/publication-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/publication-read.fasl")
   :BYTES 4071 :SHA256
   "f279b07e351564fb64cb51504d177e197d4817ef780a9161fcd15fb9f952c40f")
  (:PATH "raw/core-R2-whole-cache/src/control/publication.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/publication.fasl")
   :BYTES 6080 :SHA256
   "bfe958b3f15f5b3652159b1723de32353fcd46a22049ccb068c8c8d4a279ebec")
  (:PATH "raw/core-R2-whole-cache/src/control/recovery-publication.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/recovery-publication.fasl")
   :BYTES 2906 :SHA256
   "5cf78e177eb08efcd94304fb9b314cfdd84dcf330904fd8eb78d756aeb7ccc83")
  (:PATH "raw/core-R2-whole-cache/src/control/recovery-read.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/recovery-read.fasl")
   :BYTES 8815 :SHA256
   "4c6777d060ebd91e9eb903abeeac2f39eee47277b09c58fa2c20866adb0d13c1")
  (:PATH "raw/core-R2-whole-cache/src/control/recovery-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/recovery-types.fasl")
   :BYTES 9710 :SHA256
   "7d7fa6e12f368d679aeda97ea2718ca0076ce1d79164d2cf50edd4e98ebaea8b")
  (:PATH "raw/core-R2-whole-cache/src/control/transfer.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/transfer.fasl")
   :BYTES 4892 :SHA256
   "5917895294d70b7d3ba9b34b972419c7df44789e37e22f57a687a3ad43961e64")
  (:PATH "raw/core-R2-whole-cache/src/control/types.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/control/types.fasl")
   :BYTES 21480 :SHA256
   "ed5805fd871a1f5d2e78310951c40b8b3ed4e5cdf794a598fcce3e52d5863fe5")
  (:PATH "raw/core-R2-whole-cache/src/csn/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/csn/package.fasl")
   :BYTES 984 :SHA256
   "6afc40851961832bca02140ab9aa28849386f3ee1b161535ad551bd04a3c5123")
  (:PATH "raw/core-R2-whole-cache/src/csn/registry.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/csn/registry.fasl")
   :BYTES 29111 :SHA256
   "983c4831e4cd501d3d8e29abc2dfbb1634c437c18f81aacaa7a7a5470b2c45ee")
  (:PATH "raw/core-R2-whole-cache/src/dispatch/begin.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/dispatch/begin.fasl")
   :BYTES 2531 :SHA256
   "f0041561b97fdbc84a41be0750e532d758117dec7f073a742f0b4fbf1174aecd")
  (:PATH "raw/core-R2-whole-cache/src/dispatch/build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/dispatch/build.fasl")
   :BYTES 2251 :SHA256
   "692db4230bf4f46b02f5cd0698e7d1a60f8452fe085bfb2a6d65d1a52ba6e1b5")
  (:PATH "raw/core-R2-whole-cache/src/dispatch/claim.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/dispatch/claim.fasl")
   :BYTES 3551 :SHA256
   "97bdc0bd40bbb5f51dd280fe60132051b78a66533b21525d61d67834ef665adb")
  (:PATH "raw/core-R2-whole-cache/src/dispatch/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/dispatch/package.fasl")
   :BYTES 1076 :SHA256
   "79f9a3f6bb93aff4ff58af61ccc09673dc4a158142273d29b7162c1357d28361")
  (:PATH "raw/core-R2-whole-cache/src/dispatch/recycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/dispatch/recycle.fasl")
   :BYTES 3639 :SHA256
   "248d23f2eebd664e37304bbdf30c714a33742002fb4c014c4fc497c9d31b9c9c")
  (:PATH "raw/core-R2-whole-cache/src/dispatch/types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/dispatch/types.fasl")
   :BYTES 5583 :SHA256
   "47007c46b6fff0f7155d737992eb0867423208b7245e9d21b888243729cbd133")
  (:PATH "raw/core-R2-whole-cache/src/epochs/core.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/epochs/core.fasl")
   :BYTES 9466 :SHA256
   "f02a28774a962610f83a38c3cedb4e41499c7dd7a848f5ab657ebd839cfce051")
  (:PATH "raw/core-R2-whole-cache/src/epochs/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/epochs/package.fasl")
   :BYTES 1209 :SHA256
   "6836c2901ed911da5501c011755f4ae7795cd99c1a056d966cca615f1e069cc3")
  (:PATH "raw/core-R2-whole-cache/src/epochs/read.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/epochs/read.fasl")
   :BYTES 5305 :SHA256
   "55252db3a16336573b576d50d48b3137bc5b2176c03d5804d3a5165cd7d41705")
  (:PATH "raw/core-R2-whole-cache/src/epochs/reclaim.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/epochs/reclaim.fasl")
   :BYTES 10815 :SHA256
   "264d69eac476dfe17fa66a73d846a100763e9f785557f8acd021c77cea462861")
  (:PATH "raw/core-R2-whole-cache/src/epochs/retire.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/epochs/retire.fasl")
   :BYTES 9424 :SHA256
   "be88dc52dd5d61c73eaa5f34f816eea8881a1f82d1e29e634ac71183337f62e8")
  (:PATH "raw/core-R2-whole-cache/src/epochs/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/epochs/types.fasl")
   :BYTES 24030 :SHA256
   "789cb943339f14dc96f1e64425900ed533d54635d6de07a3923b0ddd6159aafe")
  (:PATH "raw/core-R2-whole-cache/src/execution/handoff.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/handoff.fasl")
   :BYTES 15939 :SHA256
   "1095d019c08bf2041fb7d1c254d7d70dd751c245e2a2ce0ee1d529605f8a4569")
  (:PATH "raw/core-R2-whole-cache/src/execution/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/package.fasl")
   :BYTES 1620 :SHA256
   "dd0ff03d075e6568e1cac74ff054dcdc419b0f1d1ac296ddf6f60ead50a137fb")
  (:PATH "raw/core-R2-whole-cache/src/execution/queue.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/queue.fasl")
   :BYTES 17794 :SHA256
   "bae17dd6acb4edac712a47dcf58b5b6aa47f9083135d3b532c5c00eb23fed291")
  (:PATH "raw/core-R2-whole-cache/src/execution/ready-recycle.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/ready-recycle.fasl")
   :BYTES 5179 :SHA256
   "5882e9d7b6b477f45af4e1702c1a7a58894f8a0db448152d7317bd7bfb5d7b9f")
  (:PATH "raw/core-R2-whole-cache/src/execution/ready-types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/ready-types.fasl")
   :BYTES 14971 :SHA256
   "e9ac3b71d8fc6b09c8823e9e4c4ae13449062e593b482d3bc5e21a89bf244014")
  (:PATH "raw/core-R2-whole-cache/src/execution/ready.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/ready.fasl")
   :BYTES 9717 :SHA256
   "e2ba7aaaa6d21bd8c4bec2bf55a60dbac2d46cebe3f664ea818c97732578d532")
  (:PATH "raw/core-R2-whole-cache/src/execution/worker-boundary.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/worker-boundary.fasl")
   :BYTES 6435 :SHA256
   "ccef410429b2455834abe0617b7d3ad3a70682939d136de6543a72fdea1ea75c")
  (:PATH "raw/core-R2-whole-cache/src/execution/worker-claim.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/worker-claim.fasl")
   :BYTES 12445 :SHA256
   "1cca2f960c74a1ff755f6b7819616a98aad21cfbe4461dc3bff13c756f288c3c")
  (:PATH "raw/core-R2-whole-cache/src/execution/worker-run.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/worker-run.fasl")
   :BYTES 9039 :SHA256
   "59104c979cf3a23754758dce80e40cfadf4d01cebe12b041a60389d4ef50a32a")
  (:PATH "raw/core-R2-whole-cache/src/execution/worker-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/worker-types.fasl")
   :BYTES 22095 :SHA256
   "e07c7e94606dfcf6da731f1665d50e606735481afe74c425e2aa1e9b8aefbcbc")
  (:PATH "raw/core-R2-whole-cache/src/execution/writer.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/execution/writer.fasl")
   :BYTES 8982 :SHA256
   "ad7a57284c6fd2f5eb62e3a630af485def1a0b9ee1185734387f87381ec9b47c")
  (:PATH "raw/core-R2-whole-cache/src/foundation/batch.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/foundation/batch.fasl")
   :BYTES 9681 :SHA256
   "1a440e28c6e7e65386f189d305031e7191ce4e0768698a24f666ed8043f0d0a0")
  (:PATH "raw/core-R2-whole-cache/src/foundation/binary.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/foundation/binary.fasl")
   :BYTES 9087 :SHA256
   "e29152b5138f79c74d18375c57a0b22ac236777fce74a44d13b3ac8ae1ecbdc7")
  (:PATH "raw/core-R2-whole-cache/src/foundation/conditions.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/foundation/conditions.fasl")
   :BYTES 6281 :SHA256
   "f42961011bc39377672864694ff72f09460184d0d2fe75b91de11b4b26162ef5")
  (:PATH "raw/core-R2-whole-cache/src/foundation/crc32c.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/foundation/crc32c.fasl")
   :BYTES 4263 :SHA256
   "dd015d21ae96df3d6514e37f739d45757a2d3de864fc4273c8f91f40afa9e7ac")
  (:PATH "raw/core-R2-whole-cache/src/foundation/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/foundation/package.fasl")
   :BYTES 2094 :SHA256
   "11f203856bc1e718790d4a92406c4027ef684d0f20fec4dfceb35f597f61fefe")
  (:PATH "raw/core-R2-whole-cache/src/foundation/record.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/foundation/record.fasl")
   :BYTES 36370 :SHA256
   "854fbf57a1319c51ce8afaeac8d50ea94406d0d2327e69d7a7ecaa4f69c1f660")
  (:PATH "raw/core-R2-whole-cache/src/get-directory/build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-directory/build.fasl")
   :BYTES 6196 :SHA256
   "7f1dc3f65e5963fa468888eaa4dd0606e187b50aaadc3a6cf53485047e68620a")
  (:PATH "raw/core-R2-whole-cache/src/get-directory/package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-directory/package.fasl")
   :BYTES 2181 :SHA256
   "9d09e5c548774384460fac69ce07887e1f5d065ad4a012e30bd36ce668526f4d")
  (:PATH "raw/core-R2-whole-cache/src/get-directory/read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-directory/read.fasl")
   :BYTES 7292 :SHA256
   "344770854de25746af6839aa62f6ddbe3394750213fbe6deaaf2c664a3a97301")
  (:PATH "raw/core-R2-whole-cache/src/get-directory/sources-read.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-directory/sources-read.fasl")
   :BYTES 8243 :SHA256
   "213a058a92e9a4f9b94acd80c18a7e56493751b2834498e116380b6e2d5c0621")
  (:PATH "raw/core-R2-whole-cache/src/get-directory/sources-types.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-directory/sources-types.fasl")
   :BYTES 12646 :SHA256
   "ed0aa2ce113dd905c53722745277d774389d257ea084fe1e3326dd9ae4d47d62")
  (:PATH "raw/core-R2-whole-cache/src/get-directory/types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-directory/types.fasl")
   :BYTES 7029 :SHA256
   "5ff44e54af75a5f728fc934b3bedb9e1bca1c8aca95f783a099a02ba85d35c27")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/active-build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/active-build.fasl")
   :BYTES 13965 :SHA256
   "7a1114ced8705c324074a0ea4a3183f98880339b7359f28acc7aa383b3042736")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/active-directory.fasl")
   :BYTES 6977 :SHA256
   "44a0990fde85e7ee6f88c1dda22831c83d325c7d5bb054bbead989bd6f37f3e0")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/active-init.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/active-init.fasl")
   :BYTES 3947 :SHA256
   "0cf53d63505d57d681db68d475f5965557f6c8ded613bfb9f47d9a1234b96cd7")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 9017 :SHA256
   "b281af6aeb0e1a851a2f29ecb243c7b802fae0b8e554c7aa84dcd8273e6719df")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/active-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/active-read.fasl")
   :BYTES 6887 :SHA256
   "c8146f7e2565ffbcd228f2668fd24e0482f1d524b4258322de07eacb2b2e9c13")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/active-scan.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/active-scan.fasl")
   :BYTES 8231 :SHA256
   "8b37cc5700c45a3a2fa4ad14e790451bb48030efa919e383210198ad97b57876")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/active-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/active-types.fasl")
   :BYTES 17331 :SHA256
   "8f1526b0a5a24955732411ce006d63514ce9a7c59e437e2e00810e754a354099")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/build.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/build.fasl")
   :BYTES 10760 :SHA256
   "db2bf9d40c97eeaa4419ee399f9b430731ed099fa675e42d3074dd382eeafcd4")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/package.fasl")
   :BYTES 2677 :SHA256
   "d7fb0ef6a300df96b1b8754660e8153f532905197b2746a32bc3d5fceca089e9")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/read.fasl")
   :BYTES 10523 :SHA256
   "57827fc106c1352778d8077b99980b96dc7743547d55c27a11c0654a6b9b3c39")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/rows.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/rows.fasl")
   :BYTES 5870 :SHA256
   "2738b8d168dd74c91b83d9d9b1f3e2a5850e65355c88c17845bfb4a929e8c5da")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/scan.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/scan.fasl")
   :BYTES 10748 :SHA256
   "31e69cf4d8655c433319dc218e50449b93360a905ba112c6f390154bc7146f13")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/sort.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/sort.fasl")
   :BYTES 9395 :SHA256
   "e8cd1a418589754977d2235ac0bd941f2c47f85661fe82d4e77a16ec8ffef257")
  (:PATH "raw/core-R2-whole-cache/src/get-resolver/types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get-resolver/types.fasl")
   :BYTES 7442 :SHA256
   "f55951300906a06147f0075c8e74f176b5c303713979697f39ab25486420421f")
  (:PATH "raw/core-R2-whole-cache/src/get/build.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get/build.fasl")
   :BYTES 6750 :SHA256
   "98349bbac1d269d68fc7516344b154a9f2bfa89e705609511ed81b97ef496897")
  (:PATH "raw/core-R2-whole-cache/src/get/lifecycle.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get/lifecycle.fasl")
   :BYTES 8691 :SHA256
   "0c88c5ee082c047afc79f44e29f862f5dd5e761031d3fe168e7ce3fe757241fb")
  (:PATH "raw/core-R2-whole-cache/src/get/lookup.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get/lookup.fasl")
   :BYTES 11211 :SHA256
   "4834c1da166e65789d4d5dd219c83edad83c9432a0c83cd9acd9285d27d5c7eb")
  (:PATH "raw/core-R2-whole-cache/src/get/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get/package.fasl")
   :BYTES 2174 :SHA256
   "122d27494f293aa84906ac3660fb3ad3f6c9bb1bd86a9ecc9d4cf3045f1843d0")
  (:PATH "raw/core-R2-whole-cache/src/get/segment.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get/segment.fasl")
   :BYTES 10571 :SHA256
   "e891b4bf99a82b08d9cf253ef2ce1ff0c2b9022e0fe32b3b7ed4cdfb517f4f07")
  (:PATH "raw/core-R2-whole-cache/src/get/target.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get/target.fasl")
   :BYTES 7816 :SHA256
   "d4857011a4485f6a8cf9dc89ddf570f875ba53d0ba1aeb31ed577665a9d32136")
  (:PATH "raw/core-R2-whole-cache/src/get/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/get/types.fasl")
   :BYTES 30924 :SHA256
   "5baeaf49ee6b0b7890955bfa48782614e35b85917c0f01cd9fab78a6216caef1")
  (:PATH "raw/core-R2-whole-cache/src/hash/arithmetic.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/hash/arithmetic.fasl")
   :BYTES 7692 :SHA256
   "8de0fcb4dbd9afc88e526f3f6c84a2684d3bebad27e8488b30a3fda3af3836a0")
  (:PATH "raw/core-R2-whole-cache/src/hash/blocks.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/hash/blocks.fasl")
   :BYTES 8303 :SHA256
   "43e693ad137ba2c20e42a5e1733e1430623cc26f1800bd01c6772ccf3f5c901c")
  (:PATH "raw/core-R2-whole-cache/src/hash/hash64.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/hash/hash64.fasl")
   :BYTES 6652 :SHA256
   "b79c47d0a0546c24fa410e31b4da21c334e52c29122c65366c6c2188ee55df16")
  (:PATH "raw/core-R2-whole-cache/src/hash/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/hash/package.fasl")
   :BYTES 959 :SHA256
   "6df49c968445000c89c7a9fc172b8667779bc4cd6f79e4ae36c3f966cd65bef1")
  (:PATH "raw/core-R2-whole-cache/src/index/core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/core.fasl")
   :BYTES 6195 :SHA256
   "a6f6b48677337512a876e906151915fad0a9462b23649e48e2b7cfbe37fbc9ca")
  (:PATH "raw/core-R2-whole-cache/src/index/hash-digests.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/hash-digests.fasl")
   :BYTES 6112 :SHA256
   "797a5ab4361bb5855f7bc4e4d10ef870e57cb134c4050caea9acf23b05f29391")
  (:PATH "raw/core-R2-whole-cache/src/index/hash-seed.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/hash-seed.fasl")
   :BYTES 5144 :SHA256
   "3f37085c0e27720e0682aabb1694125f087823fb0921a7ad0551d237f2dda88c")
  (:PATH "raw/core-R2-whole-cache/src/index/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/package.fasl")
   :BYTES 1154 :SHA256
   "b56da341dd36b798ebd6b7e7093d5f85638f6a170085127f6c32fea9706cf18c")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-arena.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-arena.fasl")
   :BYTES 6834 :SHA256
   "361681141cf6620b82ec560ed3eb1cec56374074af0b58df6483002c37545221")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-build.fasl")
   :BYTES 10607 :SHA256
   "ed925149181dff158f392543cbf02fecc2300cffab9d9ded7e05d9bd8ebc0210")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-core.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-core.fasl")
   :BYTES 8760 :SHA256
   "00bedf2f597b015d5df632f554f026fb3b9caad2f7018cb214a4ba94f00e8d2f")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-directory.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-directory.fasl")
   :BYTES 14244 :SHA256
   "a09b23cf9febf5e07708493c35d636fb2bb5a55aea1196d83e5be6ef51385028")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-package.fasl")
   :BYTES 1729 :SHA256
   "1cb61cf69823cb571136628f0a4f45599ae1241e4e84b3c2bfb0af13c793be01")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-probe.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-probe.fasl")
   :BYTES 13350 :SHA256
   "d9eb6176f7099f7ead3d584ce15b869e1cf5b509017d6c9637bd6b1cb9b6dccb")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-read.fasl")
   :BYTES 7553 :SHA256
   "e34a85fcfd208df0056916c8f6031b966d382c46548877eae96e2e2f32c854c4")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-relocate.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-relocate.fasl")
   :BYTES 9181 :SHA256
   "9456059c823676432a91897dfd5bceb635d044108438a84c62c8fe6ff7d09d01")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-types.fasl")
   :BYTES 36228 :SHA256
   "49638800b7864110a77ffcd49908f07dd1da93297cc10498ab1f7928c97b1c33")
  (:PATH "raw/core-R2-whole-cache/src/index/primary-write.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/primary-write.fasl")
   :BYTES 15743 :SHA256
   "46a012a264f4cf2c158b7cf79ca9bb7d124f62e92c8c12b4cb32770a5afef6c6")
  (:PATH "raw/core-R2-whole-cache/src/index/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/read.fasl")
   :BYTES 7208 :SHA256
   "89c1d44795031550cebf3bc4944cc567631df88201946c8ddeb7d281210bc5b0")
  (:PATH "raw/core-R2-whole-cache/src/index/rebuild-budget.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/rebuild-budget.fasl")
   :BYTES 6574 :SHA256
   "55d2924a23d3c57f91cb3a2ed7c849322a75b4dfc291f5bb43e66e0e3c21f97f")
  (:PATH "raw/core-R2-whole-cache/src/index/rebuild-copy.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/rebuild-copy.fasl")
   :BYTES 8117 :SHA256
   "6917c7c4c7f2a117f1a6ab75b3605fd6595b687ab5837c73835f7e0afbd9fd53")
  (:PATH "raw/core-R2-whole-cache/src/index/rebuild-scan.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/rebuild-scan.fasl")
   :BYTES 12587 :SHA256
   "3f065eac415a885fa2f87c0e782ae779d9095aa218a46c5a02e8eaf141fbd19b")
  (:PATH "raw/core-R2-whole-cache/src/index/rebuild.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/rebuild.fasl")
   :BYTES 4527 :SHA256
   "3d5cd46eeee9112df7a96d11221093ed98e06013aaf149bb36aeb7c6a042dc1b")
  (:PATH "raw/core-R2-whole-cache/src/index/relocate.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/relocate.fasl")
   :BYTES 6695 :SHA256
   "641fb40b78281bd93711fcb8c0741f02ea598f146108219637633d10be43bd39")
  (:PATH "raw/core-R2-whole-cache/src/index/types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/types.fasl")
   :BYTES 9949 :SHA256
   "2dfc8f2de96bebfe8915cfe7748e587945802c9ea42fd3e58dad3a903047ad36")
  (:PATH "raw/core-R2-whole-cache/src/index/validation.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/validation.fasl")
   :BYTES 9618 :SHA256
   "9dd268982dec0a7ed80890da12cc53f23f1255e705934e2d52423183b10e39ee")
  (:PATH "raw/core-R2-whole-cache/src/index/write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/index/write.fasl")
   :BYTES 12528 :SHA256
   "93a977b64093f5a78765c2d36a3ca1ce9b13dc8f2d1b4747a3f199026c03cc13")
  (:PATH "raw/core-R2-whole-cache/src/io/flush.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/flush.fasl")
   :BYTES 4626 :SHA256
   "25f3dda411cfe581750ce0d96002365553c6f119851f1a87e84a8721f6b8fe53")
  (:PATH "raw/core-R2-whole-cache/src/io/identity-types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/identity-types.fasl")
   :BYTES 4480 :SHA256
   "7a5677e1408375509bd83c623ccd3c2586854ed6607740b483dc712c30b036c6")
  (:PATH "raw/core-R2-whole-cache/src/io/identity.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/identity.fasl")
   :BYTES 7752 :SHA256
   "872e77bdfe9a4ea5d2b4a5efb8f41236b2c2e1ec39f6d811ac753ad862b03efb")
  (:PATH "raw/core-R2-whole-cache/src/io/lifecycle.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/lifecycle.fasl")
   :BYTES 10869 :SHA256
   "5e08a0b4c8671564ab772dee88f73f55e3b9ea6c3984240e14b8b9a6c763e9f8")
  (:PATH "raw/core-R2-whole-cache/src/io/namespace.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/namespace.fasl")
   :BYTES 11397 :SHA256
   "0f7029dc7775784b0164c1523e33c6a342e2f16ba4268e0c335981424e95645f")
  (:PATH "raw/core-R2-whole-cache/src/io/native-namespace.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/native-namespace.fasl")
   :BYTES 17954 :SHA256
   "786a3093604ce6984544d7272952fbea8a62548e9057868bab52fe2403d5a267")
  (:PATH "raw/core-R2-whole-cache/src/io/native.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/native.fasl")
   :BYTES 22514 :SHA256
   "18f96bc833e1705129c42ba71078e9ee8f7cdde0ea432887d16e7abc99451469")
  (:PATH "raw/core-R2-whole-cache/src/io/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/package.fasl")
   :BYTES 1383 :SHA256
   "398f28b586efbe21c4a470e7f25fbc58445f155cefdc739c39fcfab56835cd60")
  (:PATH "raw/core-R2-whole-cache/src/io/rename.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/rename.fasl")
   :BYTES 10588 :SHA256
   "45592a4f5b08b00d0b6cdb06df632fbdd6d6ff417849076d67d6d86174ca9408")
  (:PATH "raw/core-R2-whole-cache/src/io/transfer.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/transfer.fasl")
   :BYTES 16327 :SHA256
   "bf6d0b592cb401d28a6963b820f40cd347ebd9f6b995b822be0cb5e564076a3a")
  (:PATH "raw/core-R2-whole-cache/src/io/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/io/types.fasl")
   :BYTES 24346 :SHA256
   "0691e23f98166dfedb7a0666be57bcf33a208c9d7aa52ba8a4a2c6fdd475fbe5")
  (:PATH "raw/core-R2-whole-cache/src/mvcc/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/mvcc/package.fasl")
   :BYTES 1322 :SHA256
   "1a67c50a7a448acb46eae90b979c24277a32137380fcad0bf45d1c95a08c83a6")
  (:PATH "raw/core-R2-whole-cache/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 11955 :SHA256
   "cacc0c45b4e10268b1d94c418c2e33d6dab71270ffc13c0cec2357ed30236fb6")
  (:PATH "raw/core-R2-whole-cache/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 6281 :SHA256
   "4f249856e05093d3b83282f003cd2ddd54f708c00ff1230dca75000446c1d571")
  (:PATH "raw/core-R2-whole-cache/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 10492 :SHA256
   "5bf235a9c6f2f99553319df43bbcd74d03edf6b92e5d77101930474b1b37b201")
  (:PATH "raw/core-R2-whole-cache/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 13716 :SHA256
   "910a87ffbaf45bb8864dbbd4ef61e1bf4945aad1e32acfdc220671085b70cee2")
  (:PATH "raw/core-R2-whole-cache/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 10026 :SHA256
   "987df68c9a9b78117bb82e7fe1db6d5ab346965f210f774efefd5753b844706f")
  (:PATH "raw/core-R2-whole-cache/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 21792 :SHA256
   "84f16ea0b012984a1f694e4a5d6ae431b498fa16271502bd160e3bc8de47fcb6")
  (:PATH "raw/core-R2-whole-cache/src/mvcc/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/mvcc/types.fasl")
   :BYTES 1406 :SHA256
   "a93421111d6c5666c130dce9de7c98dd7d8d6034dda823ed6b785acb40eb5744")
  (:PATH "raw/core-R2-whole-cache/src/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/package.fasl")
   :BYTES 1418 :SHA256
   "e1aa9ddabe3f4f5d5c23beab00cf9de5c092734c553e363074df230810906551")
  (:PATH "raw/core-R2-whole-cache/src/read/core.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/read/core.fasl")
   :BYTES 6252 :SHA256
   "c302911a5087aca2d89793f3d644fcdd7d7b4e3986ae0012be043353d72cf358")
  (:PATH "raw/core-R2-whole-cache/src/read/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/read/package.fasl")
   :BYTES 1214 :SHA256
   "678dc71e0b301475cb15400c8ade7d997a648e04e4d0d850e9be783b45d684d5")
  (:PATH "raw/core-R2-whole-cache/src/read/task.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/read/task.fasl")
   :BYTES 14118 :SHA256
   "ac1d9fdaa1ec4fa7f4093fc8cb9183e2fe9958e095e898386525e80afed183b7")
  (:PATH "raw/core-R2-whole-cache/src/read/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/read/types.fasl")
   :BYTES 9790 :SHA256
   "64a1375b04587c089856620d3c564f53b280e70ce521de6fb6aaaa318ffee833")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/build.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/build.fasl")
   :BYTES 7775 :SHA256
   "dd196c22e502c8d0e995c297eeb96f130572219ca2789bc08b31dc5463bba6c3")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/closure.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/closure.fasl")
   :BYTES 5274 :SHA256
   "d2b655afb4b3e555eafd5841260082646666c79cfa68d7abad878bf5eb6f0bfc")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/frames.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/frames.fasl")
   :BYTES 8947 :SHA256
   "91579f2ce2823a253780e9a144c97ea5c0a01076e6cda36bfb8d497b5984cbe3")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/package.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/package.fasl")
   :BYTES 1967 :SHA256
   "3e4ebecc0aad20cffee42f5973385559991f96c20b99381517a952f1fe8adefe")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/publication.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/publication.fasl")
   :BYTES 4402 :SHA256
   "b90fb17f5a110a25f897961ee6bb7920df41564417c488156a6d0034b86b9d55")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/query.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/query.fasl")
   :BYTES 5374 :SHA256
   "ccc15d305c4e0b4fa877d08e347191a41568c1e482d7d5537a047e82afa50e03")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/read.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/read.fasl")
   :BYTES 5663 :SHA256
   "6dc09e8bceea96bb87b5f4ba3e834c6c32a3d83f961f954db76668011e228888")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/resolve.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/resolve.fasl")
   :BYTES 7630 :SHA256
   "7949f7a8f92f18a1f5d8c4fc2012b6b862ab53b6f86a89caf6f01c061c6c559f")
  (:PATH "raw/core-R2-whole-cache/src/recovery-active/types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery-active/types.fasl")
   :BYTES 18468 :SHA256
   "9c35e5692c97472de291b728a658bb1029f1c7bad020f9bfc103685193f7006e")
  (:PATH "raw/core-R2-whole-cache/src/recovery/decisions-build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/decisions-build.fasl")
   :BYTES 17741 :SHA256
   "3256ccc5907a2d2f111f9235cea84b679324c568d7c81cf072911b5848c9c146")
  (:PATH "raw/core-R2-whole-cache/src/recovery/decisions-package.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/decisions-package.fasl")
   :BYTES 1313 :SHA256
   "5ddb29bb8d0538a6d37652c1a25afde2d8209a7339a930f7c2c2976a37305f49")
  (:PATH "raw/core-R2-whole-cache/src/recovery/decisions-query.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/decisions-query.fasl")
   :BYTES 7494 :SHA256
   "654f3aded7c0b3da34d63254ecd29573abbfbc3a5bd27d1a5f08167eb74274ed")
  (:PATH "raw/core-R2-whole-cache/src/recovery/decisions-radix.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/decisions-radix.fasl")
   :BYTES 14802 :SHA256
   "8167696656a9a5eb5d205eb2d03496f6ab2221ff8be6bfc6aae2dcabeeba2052")
  (:PATH "raw/core-R2-whole-cache/src/recovery/decisions-sort.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/decisions-sort.fasl")
   :BYTES 14195 :SHA256
   "2f9e6ef721012636562b0c716a8e56f9a59bb78a11ed64139dc055e096ed96db")
  (:PATH "raw/core-R2-whole-cache/src/recovery/decisions-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/decisions-types.fasl")
   :BYTES 11092 :SHA256
   "783067dcec700d2cf060d5f4a9002d7ffc89b53d512c7a14457b3985ef828ab5")
  (:PATH "raw/core-R2-whole-cache/src/recovery/inventory-build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/inventory-build.fasl")
   :BYTES 14484 :SHA256
   "dcd0a5bf5185d63363bae0a677738fd0b3637ff9bef796e52ef1257a59a83943")
  (:PATH "raw/core-R2-whole-cache/src/recovery/inventory-query.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/inventory-query.fasl")
   :BYTES 3831 :SHA256
   "2e63fe43a50ab041b290624fe3a5ee42f514fc20efc81ce4cdb26a8bde795de8")
  (:PATH "raw/core-R2-whole-cache/src/recovery/inventory-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/inventory-types.fasl")
   :BYTES 14879 :SHA256
   "d385445b0803b004eaac0b966cf11fa18377404e85c62dedf8d744e058a48b72")
  (:PATH "raw/core-R2-whole-cache/src/recovery/manifest-build.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/manifest-build.fasl")
   :BYTES 15478 :SHA256
   "69eea9c3189b2611265142cb9f9b52c9a81b5f771160e2408c6c889883bbbaa3")
  (:PATH "raw/core-R2-whole-cache/src/recovery/manifest-decode.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/manifest-decode.fasl")
   :BYTES 10766 :SHA256
   "6d54c187662d6f9b561b9dc7ac14a622fa201c8faf1c8a6e6fca3c344d71b186")
  (:PATH "raw/core-R2-whole-cache/src/recovery/manifest-fold.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/manifest-fold.fasl")
   :BYTES 14563 :SHA256
   "e2a9e5e059b5c23a24ec75802f514ea319323c4f440f88ad7561c2c30ceaaf74")
  (:PATH "raw/core-R2-whole-cache/src/recovery/manifest-package.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/manifest-package.fasl")
   :BYTES 1782 :SHA256
   "a41b44ed56da3e7294ab061ebc8561fe30f64028d14357ae70a5dcf4cb06f0a1")
  (:PATH "raw/core-R2-whole-cache/src/recovery/manifest-query.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/manifest-query.fasl")
   :BYTES 6823 :SHA256
   "dce9122a8c59a3cd2f5b4becb76ab4548cd73e53724cff58434ce8abcae6bfd3")
  (:PATH "raw/core-R2-whole-cache/src/recovery/manifest-transition.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/manifest-transition.fasl")
   :BYTES 6644 :SHA256
   "78fbf4c5b1096aaf1f465473b5b7cb7547c54bc716e6205b883a5f1b94cc940a")
  (:PATH "raw/core-R2-whole-cache/src/recovery/manifest-types.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/manifest-types.fasl")
   :BYTES 30432 :SHA256
   "9b60ef265f463108d4df712b04a0d140f37d3955cdef444ef74a0edf152ba804")
  (:PATH "raw/core-R2-whole-cache/src/recovery/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/package.fasl")
   :BYTES 1356 :SHA256
   "4f01b23b7e348e3f1f51b44baaa71497b625f639d74175b1b18edbf1d675e4a7")
  (:PATH "raw/core-R2-whole-cache/src/recovery/scan.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/recovery/scan.fasl")
   :BYTES 25465 :SHA256
   "3303aef63a6ca0b7c866c5c7010698cce348068a22971c5dd2021913d3d27530")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/build.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/build.fasl")
   :BYTES 4117 :SHA256
   "c7cbcad3f88cb9126fbe910298bca1522d77fb7a08f11bb9368a8ec7f47b3bee")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/lifecycle-build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/lifecycle-build.fasl")
   :BYTES 6622 :SHA256
   "a4e7f3ca81933fb65f248597252bb8aeb7dae570e4084c764ad14a72cfc1f911")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/lifecycle-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/lifecycle-read.fasl")
   :BYTES 4505 :SHA256
   "1e0c1c31991db1850fdc8a427907359399983fffc05e2ddcfe4f64802f3476c4")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/lifecycle-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/lifecycle-types.fasl")
   :BYTES 13351 :SHA256
   "53472a89e950d8bd49c11ce0de5e2740c79144e53d6cdff69040a59eb8b87ce4")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/lifecycle-update.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/lifecycle-update.fasl")
   :BYTES 5742 :SHA256
   "a3637d761d5021c84afca7d0c2eb2c4aea1f07b80428ce64ac2edcca0782e8f0")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/lifecycle-worker.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/lifecycle-worker.fasl")
   :BYTES 3574 :SHA256
   "ce0d676f13513772448dd89fa2a2a05260d43434daa7f8aa7e633bf8ec57c0a5")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/package.fasl")
   :BYTES 1158 :SHA256
   "a0b32e1b227a9d81369bf28ca9de53528e4d7ed45ac5fa2a96391ab9c965e09a")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/policy.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/policy.fasl")
   :BYTES 4430 :SHA256
   "c7fb7f3e6a6c6cd0af02345797660531557d48a0fa8d5899e5cc602e7f54669e")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/pool-claim.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/pool-claim.fasl")
   :BYTES 2745 :SHA256
   "8383a0824bf1d240a3520dca518258687f60354384e8517fa707298f94790848")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/read.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/read.fasl")
   :BYTES 3347 :SHA256
   "68eca62656fb4f4d7de93891c5e392bed61fb12a645f5230b5936b4d24e20dbc")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/types.fasl")
   :BYTES 16622 :SHA256
   "fd519505a236ee3a35b6cb9397d94ba62166c1a9ab10c5d7c6a62a29722f0d56")
  (:PATH "raw/core-R2-whole-cache/src/scheduler/update.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/scheduler/update.fasl")
   :BYTES 4748 :SHA256
   "f118b7f2e4266bafca38345cf1e1d35b20309c4e0d9eba600568da81d41289d7")
  (:PATH "raw/core-R2-whole-cache/src/series/events.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/events.fasl")
   :BYTES 17576 :SHA256
   "928aab2ef48b3361c872a7b6457f52b94d2c715f21fd68ce4ba48fd706effdde")
  (:PATH "raw/core-R2-whole-cache/src/series/io-events.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/io-events.fasl")
   :BYTES 8406 :SHA256
   "2b1007cf5ba6a4e420ee4905857c8e8a2d71bbe6db108b2c3c276de43082d952")
  (:PATH "raw/core-R2-whole-cache/src/series/ownership.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/ownership.fasl")
   :BYTES 13676 :SHA256
   "88ece17b3e86b674932fee8fad821ab52a7ad0ff8fc643f2e1d2cf10bfd31014")
  (:PATH "raw/core-R2-whole-cache/src/series/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/package.fasl")
   :BYTES 1763 :SHA256
   "6ae7b7a48a6644d8b8e38d766d6303c05df833aab5725ce2793a08f12bc00ce9")
  (:PATH "raw/core-R2-whole-cache/src/series/publication.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/publication.fasl")
   :BYTES 14476 :SHA256
   "f6217a679f024ff43abcf31384a98d95de5ccbc2f6024f8f523b8c7633cf15af")
  (:PATH "raw/core-R2-whole-cache/src/series/query.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/query.fasl")
   :BYTES 6512 :SHA256
   "931991fec48d03ff878338560f234cdde5cded7935e06aae563390bae711ba2f")
  (:PATH "raw/core-R2-whole-cache/src/series/retirement.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/retirement.fasl")
   :BYTES 8228 :SHA256
   "6300b41d81701cf09566e1d495dada423c6b6a769dff4b7bcf7675ab2c3c8b4e")
  (:PATH "raw/core-R2-whole-cache/src/series/routing-build.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/routing-build.fasl")
   :BYTES 6431 :SHA256
   "9c24ddbbae8158f7c0c227f5771620506fd0c283472196fc5cd80f659e1b3ebc")
  (:PATH "raw/core-R2-whole-cache/src/series/routing-select.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/routing-select.fasl")
   :BYTES 6889 :SHA256
   "04d843f6135d6b67a808c34658f8c21c21a8215729be7167ecda4d5aef3dc215")
  (:PATH "raw/core-R2-whole-cache/src/series/routing-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/routing-types.fasl")
   :BYTES 9288 :SHA256
   "edd93c4ac74b84fe0ac0619076a2505923dd0c55851484c715f968d8f9fe7e6d")
  (:PATH "raw/core-R2-whole-cache/src/series/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/types.fasl")
   :BYTES 34027 :SHA256
   "d6aeba15dd13339e89bd2567dd531a8c4c12b66c26284f537f5057ac04b213f6")
  (:PATH "raw/core-R2-whole-cache/src/series/worker-boundary.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/worker-boundary.fasl")
   :BYTES 7864 :SHA256
   "2f377f83d86dc81300339c893c0a48df1a0ed2c4971b4497d54f957e149df1e9")
  (:PATH "raw/core-R2-whole-cache/src/series/worker-package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/worker-package.fasl")
   :BYTES 1605 :SHA256
   "e22996df38aa23cd46b14685dbfe3884b1de37151d9ddfd35609be69a1ec194c")
  (:PATH "raw/core-R2-whole-cache/src/series/worker-run.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/worker-run.fasl")
   :BYTES 15276 :SHA256
   "de2150dfe47496abb5810305f08143735aec270e793c8a577d65e020db99def8")
  (:PATH "raw/core-R2-whole-cache/src/series/worker-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/series/worker-types.fasl")
   :BYTES 17282 :SHA256
   "79700f65d85f34562b8c8044456930173794715a1cc3c1a3c571db06a44cd7b8")
  (:PATH "raw/core-R2-whole-cache/src/storage/compaction-scan.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/storage/compaction-scan.fasl")
   :BYTES 8302 :SHA256
   "f1f87c3ae201de7ff0661f85d3a8fb6c6bef9fc24eb018172fb74acacbb36493")
  (:PATH "raw/core-R2-whole-cache/src/storage/control-payload.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/storage/control-payload.fasl")
   :BYTES 12148 :SHA256
   "acee2c937210aa4427c3a4bfdd0b5ee95e89100775f27a3fba9f3e38a8fd0c9a")
  (:PATH "raw/core-R2-whole-cache/src/storage/formats.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/storage/formats.fasl")
   :BYTES 8600 :SHA256
   "de8d85277e412edd8861766f047e5a18bc922b0d079ceff51925668c1cb67601")
  (:PATH "raw/core-R2-whole-cache/src/storage/log-header.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/storage/log-header.fasl")
   :BYTES 7988 :SHA256
   "3a6e677a6a892b14865f00481bdfbe007a5240b16adca6451bbd8278e7fc7310")
  (:PATH "raw/core-R2-whole-cache/src/storage/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/storage/package.fasl")
   :BYTES 1514 :SHA256
   "fd3de00e525a8c2a1490acd55c60013566f4e953daee7b7fd478c55d757c876a")
  (:PATH "raw/core-R2-whole-cache/src/storage/payload-record.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/storage/payload-record.fasl")
   :BYTES 6765 :SHA256
   "ea1046f7ebb7ce35ed2b2dfb95aae313f9c751ab720312b89ec56576f4adab5b")
  (:PATH "raw/core-R2-whole-cache/src/storage/payload-write.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/storage/payload-write.fasl")
   :BYTES 9565 :SHA256
   "00e072a52537f39777cb276a2394d96d3de656e091f1071a6244e3c8da9935c7")
  (:PATH "raw/core-R2-whole-cache/src/storage/segment-header.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/storage/segment-header.fasl")
   :BYTES 10328 :SHA256
   "9f503f692d17ef46c747947149b800efcfe0d10c857967c4628e261a4debffaf")
  (:PATH "raw/core-R2-whole-cache/src/wal/builder.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/wal/builder.fasl")
   :BYTES 14611 :SHA256
   "ff41e7df7b2d83528efc7b0c4d62ad1576839a4c3656fc0a5d1efb1c64f6433e")
  (:PATH "raw/core-R2-whole-cache/src/wal/csn.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/wal/csn.fasl")
   :BYTES 16451 :SHA256
   "17162ffe19639c831e9f39b7c225a77d58deab74b8aa07b9cfab165042c7c972")
  (:PATH "raw/core-R2-whole-cache/src/wal/executor.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/wal/executor.fasl")
   :BYTES 13818 :SHA256
   "9570c80261bcf73d82545d718d9bc186fb51933c607587522329a40301ce9fa5")
  (:PATH "raw/core-R2-whole-cache/src/wal/group.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/wal/group.fasl")
   :BYTES 11046 :SHA256
   "2db9dd8d8c6ade367aa3338416aa5b4de8ee2cc75f0279604e6d82b06f9676b4")
  (:PATH "raw/core-R2-whole-cache/src/wal/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/wal/package.fasl")
   :BYTES 2139 :SHA256
   "95f73585ec5a8dc507c30e97ecdf26afd8f8c0bb959e9ede163b9382b4782c28")
  (:PATH "raw/core-R2-whole-cache/src/wal/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/src/wal/types.fasl")
   :BYTES 38905 :SHA256
   "a6e8e782b353c861fba2c712a564f65f910e2e3a7aa729182bbc5d81edf6c69d")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-array-write-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-array-write-support.fasl")
   :BYTES 22696 :SHA256
   "e35aaf50ac48cff291fdcbac59f408d63d72757bc4afee359287d7049798b851")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-array-write-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-array-write-threads.fasl")
   :BYTES 11048 :SHA256
   "0851ef3e66ea73ed8ef123623b0c6819d7450894a66b60b4cb97d6f2c674601c")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-array-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-array-write.fasl")
   :BYTES 36683 :SHA256
   "fee6198cef7b301319db2d334e01dcb66ee6379737eccc78f62f2ba917b49aa3")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 30420 :SHA256
   "493689cc66ee3a744b63221035cb01d4ac4619c57cab5f1cc67c24a8811d895e")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 10560 :SHA256
   "df25374f19aec5335e9ad6cb721f18f3c3c30f7ae32464a8790f4855de26f52f")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 40133 :SHA256
   "0eba32fc98011cb92ca405fb731072b584c60f4e8b2753c78ef42906e8162902")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-header.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-header.fasl")
   :BYTES 22725 :SHA256
   "47fdca53f9372ede7da887a457f4f85c0b8ab3b35fae9fc7f6ebf73fc749fce5")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-map-write-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-map-write-support.fasl")
   :BYTES 23704 :SHA256
   "dbb367775bbf125f01b0124294c26353ed924991f786bcadb12426dbc3319223")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-map-write-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-map-write-threads.fasl")
   :BYTES 11026 :SHA256
   "f88213668c3ce394ff5c71edc94804fa08ff70720c1dfee5a9dbbed1277e9461")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-map-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-map-write.fasl")
   :BYTES 38952 :SHA256
   "33ad323b219290808dbb425670685bc1251caa0afa8e17e7aaef0d8d7dd00cc3")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 3153 :SHA256
   "48907ecf957d182f379b918a6eb6500ca30038ea72f511c8c25c41eb680c500e")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 30244 :SHA256
   "f428955c885beaa72fba0d0c664b8c7b421785a8c86f8be146629a9f24366e11")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 12095 :SHA256
   "b7ef9236845c3b61a98a8f6a91f2691f37dbd34441eb202b35a60e1f2b0a0439")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 33537 :SHA256
   "15a84029e7555c0b69d8293ea603604a259c314a3a892c7d52209c7b6fc2f806")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-minimal-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 23909 :SHA256
   "c3c7b304fef5a10a3ff020061e8731dee38b36b7612e1b2a3d6e5b2b7874c200")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-minimal-threads.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 9957 :SHA256
   "2e92d7857d0c6d828ab91aa5a55d98f407f15e62c7477fbbeb9916c949189bd8")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 24433 :SHA256
   "2efa5886cfdeb8bf70e087a3dbbbdc729d256118e6efcc0ddfe51d5c9e91a658")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 16663 :SHA256
   "075bd432eda2463916247f9c30f4815f17510e9c6bd0477ab72c33fc90c05a99")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 10501 :SHA256
   "5b316780226dc319069d0edb61c53bc916d3a0ad013866547e2fbcd7d73af509")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 23637 :SHA256
   "bdd2f09be61a14cef91525d6efa739c835a9af7443da62f24c2b3b6d1fe51b88")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 19602 :SHA256
   "b3b0fa1c4332b1b4ff9c7403d23bfe82b59de288031b2b41ac305b7fe226534c")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 10437 :SHA256
   "8d445ac4238dfba369a21901cba63419044c603ccf1aedb4616d060147434f24")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 28858 :SHA256
   "88980cf14f5c450d5719e417c8f4f007ee431ba7e4a75f75ea5f585b44f8e76e")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 34960 :SHA256
   "10a1265c8ae3ed2da51944dfeb6aac5dfe4a726cb896440a4648c6a226d8f50f")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 11832 :SHA256
   "dc8b1b1eed9d3852be77a26efdb84a0126d004dde607cb3039fd76b522c18d48")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-structure.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-structure.fasl")
   :BYTES 41695 :SHA256
   "a8bbf35d696cd554418f7ed9f1fc56d5118498bc51343204cacc1b9a22a67aaf")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-support.fasl")
   :BYTES 18151 :SHA256
   "3302ca551a325cb977770ed2d70a1872945d0263151253942126f9ce265b5d73")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-tag-write-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-tag-write-support.fasl")
   :BYTES 22748 :SHA256
   "fdeac4911fbd77ae15f99151ef9de1b7c38aadd4a9a4721fddb0ee1e100598ec")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-tag-write-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-tag-write-threads.fasl")
   :BYTES 10786 :SHA256
   "a6fac4e847124aeba547b0840e97fa972ce3eb159ff2848c0a8d65fa3b9fc7fd")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-tag-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-tag-write.fasl")
   :BYTES 34841 :SHA256
   "c84462ec77ed6dd7441932d57ffbc91121a0323510b0903e457c3f638c3d097c")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-threads.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-threads.fasl")
   :BYTES 10405 :SHA256
   "6e60da3a8f6b68fe1cf388c2473dd71158bab9b36798a04a5a5fe75930b3a6ca")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-write-roundtrip.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 2572 :SHA256
   "a2c960aa5d055e07a26427fd9071c72db21e19ff32b00e8cf6af2c7f9418908f")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 14028 :SHA256
   "48b205e09cefe407925d99a92f4d6a945c16ea16ce5457a6a687c4be2b5d8ac9")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 10559 :SHA256
   "e46f8c518b0da9411b2b683ca85a7d5073559c9c619e276733fe65cda6701ba9")
  (:PATH "raw/core-R2-whole-cache/tests/codec/cbor-write.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/cbor-write.fasl")
   :BYTES 19810 :SHA256
   "b6b0644261113b728240c91fc80b8b2cbe1f6ba9b8510ce0f2d55c60438ded58")
  (:PATH "raw/core-R2-whole-cache/tests/codec/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/support.fasl")
   :BYTES 17745 :SHA256
   "f747df11c26022ae2fef10aaa670f947cc30f65bc56a66f4b6d58e17b065daa9")
  (:PATH "raw/core-R2-whole-cache/tests/codec/threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/threads.fasl")
   :BYTES 9429 :SHA256
   "8b1073b8607ad26d56a7c46cf8b0fa0ac09b59d823be94f65b3bc135068f9317")
  (:PATH "raw/core-R2-whole-cache/tests/codec/utf8.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/codec/utf8.fasl")
   :BYTES 25388 :SHA256
   "3f04e65fd0405ba382fe0105fa30ee537dae6f1dcdff3e74ccd60c03023b073c")
  (:PATH "raw/core-R2-whole-cache/tests/control/native.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/control/native.fasl")
   :BYTES 151862 :SHA256
   "66476578269414fa944fdfaee6a4c42794c0deb268c7012204c19e0c2af9d142")
  (:PATH "raw/core-R2-whole-cache/tests/control/publication.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/control/publication.fasl")
   :BYTES 258144 :SHA256
   "d4f542f9222c0299986df2a25c470c46df222e5b03b327b6b91c02f4d211b6f4")
  (:PATH "raw/core-R2-whole-cache/tests/control/recovery-publication.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/control/recovery-publication.fasl")
   :BYTES 96693 :SHA256
   "1b205d094ffdfe8581f006a777f847c1a7456ab25e99c78ad01a2f16c721ff48")
  (:PATH "raw/core-R2-whole-cache/tests/control/recovery-read.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/control/recovery-read.fasl")
   :BYTES 144700 :SHA256
   "fc7d61b0acd192e2cdf61c3aff0c6380e4116a54e13a4055a4b20d0e103e92e1")
  (:PATH "raw/core-R2-whole-cache/tests/control/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/control/support.fasl")
   :BYTES 3966 :SHA256
   "5786b2921b3b317ee590b214e44c3a8c356e8e8a252c51ac2ab571e928eba806")
  (:PATH "raw/core-R2-whole-cache/tests/csn/registry.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/csn/registry.fasl")
   :BYTES 50847 :SHA256
   "b24c8208a01a1b1acad294dbe74238e94705926e81c8f0414a85fd6d28ad0b47")
  (:PATH "raw/core-R2-whole-cache/tests/csn/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/csn/support.fasl")
   :BYTES 40008 :SHA256
   "1715fd450ba32f876558fd16fb766fd36b70af4a750787b7786851ec49630d9b")
  (:PATH "raw/core-R2-whole-cache/tests/csn/threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/csn/threads.fasl")
   :BYTES 22688 :SHA256
   "b863317e5183c09ce3ad437a1f373496aa6257b86e2b15d0632187c24d49a8d4")
  (:PATH "raw/core-R2-whole-cache/tests/epochs/lifecycle.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/epochs/lifecycle.fasl")
   :BYTES 74001 :SHA256
   "81d08d485a7835068744cabd66b107dec3bf3290e1ae2b80e5589aff18bf185c")
  (:PATH "raw/core-R2-whole-cache/tests/epochs/support.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/epochs/support.fasl")
   :BYTES 35879 :SHA256
   "c772be62402bff44e81448b401d1ed3db2f289219a6d966c4910cec93295ca97")
  (:PATH "raw/core-R2-whole-cache/tests/epochs/threads.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/epochs/threads.fasl")
   :BYTES 10436 :SHA256
   "8d4ad6b04d72840dd2cd95219f46e12875df404dfc0ee55580b4f1f5a0195242")
  (:PATH "raw/core-R2-whole-cache/tests/execution/handoff.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/execution/handoff.fasl")
   :BYTES 90800 :SHA256
   "bb6c8eefec9266cb897ce380b88460f5a7ae1f902099d729006311661119bd65")
  (:PATH "raw/core-R2-whole-cache/tests/execution/queue.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/execution/queue.fasl")
   :BYTES 40351 :SHA256
   "609f406e5b785aaa57bb0b61224a6d5d231d6d9e97541dbe3af25abff42a8e7d")
  (:PATH "raw/core-R2-whole-cache/tests/execution/ready-recycle.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/execution/ready-recycle.fasl")
   :BYTES 67068 :SHA256
   "9a3c91271434152a6145d0d5581f2d617b0591bcd53eca7b5f5b0e63a225ac0a")
  (:PATH "raw/core-R2-whole-cache/tests/execution/ready.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/execution/ready.fasl")
   :BYTES 82284 :SHA256
   "e81602be49699070b81edaee1f8a1134169b502cf1b53e04f395eb69774bfc0e")
  (:PATH "raw/core-R2-whole-cache/tests/execution/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/execution/support.fasl")
   :BYTES 16072 :SHA256
   "95bea0fd9b194958276bcfda3ca6739559853a8412319a198da210d7b4626da0")
  (:PATH "raw/core-R2-whole-cache/tests/execution/threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/execution/threads.fasl")
   :BYTES 32792 :SHA256
   "bd6a978bb778ab2846edac8fa53983048e813d4d08acedd866b45f46309aa6fb")
  (:PATH "raw/core-R2-whole-cache/tests/execution/worker.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/execution/worker.fasl")
   :BYTES 158284 :SHA256
   "604a2c3ad05e423234a4d9d46d81b6ce9c0ab3b4e396a5fb7f4f4594983f30ed")
  (:PATH "raw/core-R2-whole-cache/tests/foundation/batch.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/foundation/batch.fasl")
   :BYTES 19007 :SHA256
   "09273bc570dcd6cacd4cb6425a73b284127b7f88b1209c09138fa6e02476f411")
  (:PATH "raw/core-R2-whole-cache/tests/foundation/binary.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/foundation/binary.fasl")
   :BYTES 15575 :SHA256
   "16630695022ce579c11e7db540d9f05b0a778b5785f0fad0c0b3c7d401a567cc")
  (:PATH "raw/core-R2-whole-cache/tests/foundation/record.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/foundation/record.fasl")
   :BYTES 59130 :SHA256
   "425f39d8c83a6a9548645647018c4ea75a781d8d99d2d39c38116cc9c1f75942")
  (:PATH "raw/core-R2-whole-cache/tests/foundation/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/foundation/support.fasl")
   :BYTES 10289 :SHA256
   "720c23c12e229a9fa00f0814d1391c4bbb78055819e63a90ce165eab877952ce")
  (:PATH "raw/core-R2-whole-cache/tests/get-active/construction.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-active/construction.fasl")
   :BYTES 80711 :SHA256
   "95d599c1f7d1db3b48b982e54e0e6a19cafe79e5e62c012e65b8ccd2f6fd3f43")
  (:PATH "raw/core-R2-whole-cache/tests/get-active/directory.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-active/directory.fasl")
   :BYTES 29473 :SHA256
   "7e24f7a56b48eb95339f5830ad1120d4d5b5f5f5c0b76d8afe6d31abb4fa0336")
  (:PATH "raw/core-R2-whole-cache/tests/get-active/preflight.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-active/preflight.fasl")
   :BYTES 72404 :SHA256
   "2d51ee3461b36c2483997051c3e3962c98e2b0db1caa24634479186e50913986")
  (:PATH "raw/core-R2-whole-cache/tests/get-active/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-active/read.fasl")
   :BYTES 110779 :SHA256
   "72fbb7afffdfbd90a4282cbc8df91474795b7c99f3c628f0979dc2bc5a6842d2")
  (:PATH "raw/core-R2-whole-cache/tests/get-active/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-active/support.fasl")
   :BYTES 179848 :SHA256
   "28087e1705a0930b515fdd388c3dc61335886864a30405e28a09684320de57d4")
  (:PATH "raw/core-R2-whole-cache/tests/get-directory/construction.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-directory/construction.fasl")
   :BYTES 40555 :SHA256
   "38ec0355d3949999c1c52d400ba231836bc2a092f07b98291519ee6ab9aa2adf")
  (:PATH "raw/core-R2-whole-cache/tests/get-directory/lifetime-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-directory/lifetime-support.fasl")
   :BYTES 26866 :SHA256
   "eafbb8d44fb4771ecb8ca1f336c36c85d6870e5aae207ec337efa7ea77ad4b09")
  (:PATH "raw/core-R2-whole-cache/tests/get-directory/lifetime.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-directory/lifetime.fasl")
   :BYTES 69132 :SHA256
   "f80cbba6c8ec51aaba244fc58adda96e2767b256472e10ce29daa58597462c20")
  (:PATH "raw/core-R2-whole-cache/tests/get-directory/read.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-directory/read.fasl")
   :BYTES 65633 :SHA256
   "c7f92c13509e5d5c577a741b65445da959f3e52c10be42f59c25d13b03690007")
  (:PATH "raw/core-R2-whole-cache/tests/get-directory/series-read.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-directory/series-read.fasl")
   :BYTES 243998 :SHA256
   "8d2608038a69454fc3238d6b59846e654b624911199370435cf047cbb1874051")
  (:PATH "raw/core-R2-whole-cache/tests/get-directory/series-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-directory/series-support.fasl")
   :BYTES 116833 :SHA256
   "f4dd05d35f30a3f1ce7017e9ff08c730380d17566f6155eed23ca67d2ae525e7")
  (:PATH "raw/core-R2-whole-cache/tests/get-directory/support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-directory/support.fasl")
   :BYTES 133883 :SHA256
   "453a77e8e98ef62e91143ee1dd3ded1c93bf3c4529f9b6d756bf21654a08441a")
  (:PATH "raw/core-R2-whole-cache/tests/get-directory/threads.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-directory/threads.fasl")
   :BYTES 15456 :SHA256
   "7930f16994968abda74326a714b6fb1d5ff3b86999e517da0e0a0e0ae3eb6d2f")
  (:PATH "raw/core-R2-whole-cache/tests/get-performance/guards.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-performance/guards.fasl")
   :BYTES 19333 :SHA256
   "6eed1badc7143569e3737ce6621ee16d94d3aa3ad6b973a50d39e7098c4baa13")
  (:PATH "raw/core-R2-whole-cache/tests/get-performance/paths.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-performance/paths.fasl")
   :BYTES 15884 :SHA256
   "05d34ebd7e3721f7510e13962524b8370984cd649e7f5b422cc25f1aa52c8f9e")
  (:PATH "raw/core-R2-whole-cache/tests/get-performance/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-performance/support.fasl")
   :BYTES 114338 :SHA256
   "19669b472ff3da44df671ab8c94a0207850ace60a0bd09b36cbf2f36df1c3d26")
  (:PATH "raw/core-R2-whole-cache/tests/get-performance/threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-performance/threads.fasl")
   :BYTES 10498 :SHA256
   "fd335c19ae695cc015c07048ab6ea413fd282b22fcdbc17970efb52789e30831")
  (:PATH "raw/core-R2-whole-cache/tests/get-resolver/construction.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-resolver/construction.fasl")
   :BYTES 56497 :SHA256
   "5bd097d9d292ae5e787fa0bc3e619492f19c7d6bff27d0d948c25036247f61d2")
  (:PATH "raw/core-R2-whole-cache/tests/get-resolver/read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-resolver/read.fasl")
   :BYTES 122930 :SHA256
   "756eeeddedb9a7ca54bb86a6f7ab773b769fd702c0b77128863e5ac93df359cd")
  (:PATH "raw/core-R2-whole-cache/tests/get-resolver/sort.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-resolver/sort.fasl")
   :BYTES 31291 :SHA256
   "8dc1c1e8e1ea0073bb418ccf4d3f0a9767e8b499d386d1a1cf6d8139a9d06ffd")
  (:PATH "raw/core-R2-whole-cache/tests/get-resolver/support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get-resolver/support.fasl")
   :BYTES 130408 :SHA256
   "4322295e9b11b10a2032ea3b37662dbd1003a4c30d07b23c3cf5ce9339b8d099")
  (:PATH "raw/core-R2-whole-cache/tests/get/lifecycle.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get/lifecycle.fasl")
   :BYTES 86083 :SHA256
   "a8b659208685786c8b5e5e81e66a8d05114951a0e993df4efaa241f61de77bb3")
  (:PATH "raw/core-R2-whole-cache/tests/get/segment.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get/segment.fasl")
   :BYTES 64584 :SHA256
   "f64a01a0f60612c493434e8a46af490e6841bacbf1b9f2e26357286f61e9c6b9")
  (:PATH "raw/core-R2-whole-cache/tests/get/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/get/support.fasl")
   :BYTES 56083 :SHA256
   "b0afeaa830e899aafcaf291185c859639422d359ad4101fcfcae8cbff45e09fd")
  (:PATH "raw/core-R2-whole-cache/tests/hash/guards.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/hash/guards.fasl")
   :BYTES 4823 :SHA256
   "9e898a1c68aca8e10bade5666a007e873e2166e7d611b6dd2db0a6d2533f49d0")
  (:PATH "raw/core-R2-whole-cache/tests/hash/hash64.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/hash/hash64.fasl")
   :BYTES 37250 :SHA256
   "e1ce2d2e531e85a072c73579d2c1985a725a0a4bc238f1aafa4f96ef68dbcd73")
  (:PATH "raw/core-R2-whole-cache/tests/hash/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/hash/support.fasl")
   :BYTES 46861 :SHA256
   "4118a696edcf919f1991965060abc6627be3aeeae008245e390b89f928263b02")
  (:PATH "raw/core-R2-whole-cache/tests/hash/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/hash/threads.fasl")
   :BYTES 14686 :SHA256
   "0c47f69c28fa76f67e7c5d51175a912793dc4fc28832e70ae939d5de923a8ef7")
  (:PATH "raw/core-R2-whole-cache/tests/io/flush-failure.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/io/flush-failure.fasl")
   :BYTES 34590 :SHA256
   "dddd974b531c4a19f91d5bf2f6610d78d8b58069000e501de3fc81f6e61e0f4e")
  (:PATH "raw/core-R2-whole-cache/tests/io/native.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/io/native.fasl")
   :BYTES 34334 :SHA256
   "bea926d98dd373f0077d1df20ce85b5cbaeb083c024dbe6cd05be2b8d8e0d893")
  (:PATH "raw/core-R2-whole-cache/tests/io/rename-native.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/io/rename-native.fasl")
   :BYTES 126308 :SHA256
   "fd27a17b9479995960cbfb60d48dd8eb028c8bcc8c4406525387b3c10a1a9814")
  (:PATH "raw/core-R2-whole-cache/tests/io/rename.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/io/rename.fasl")
   :BYTES 110064 :SHA256
   "bb168d73ad257f8b9a51e6870dd2194630c355ec1da93ebd4f9ba4006623d39e")
  (:PATH "raw/core-R2-whole-cache/tests/io/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/io/support.fasl")
   :BYTES 16082 :SHA256
   "12aac7a1c7cd28a5580f1514fbc1e15abd4b57f3974d14833b39db2b6789ddb2")
  (:PATH "raw/core-R2-whole-cache/tests/io/transfer-failure.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/io/transfer-failure.fasl")
   :BYTES 25960 :SHA256
   "403239f89cdba46a48ca727cba77dc1e12046bfec1e3f16e65aa927d18f0a43d")
  (:PATH "raw/core-R2-whole-cache/tests/io/transfer.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/io/transfer.fasl")
   :BYTES 53187 :SHA256
   "32be9ef25786e23bc3939bd8f2e342b7fd941ce6e903ebab2ce0b5f8045ec392")
  (:PATH "raw/core-R2-whole-cache/tests/mvcc/capture.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/mvcc/capture.fasl")
   :BYTES 48575 :SHA256
   "24a7bf3fc4fdf025f04536914e7eea0390157c439a418b3a01fda22120515e78")
  (:PATH "raw/core-R2-whole-cache/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 89157 :SHA256
   "07131636a3e18b055f01c5815cd05256dae866e20a6e8d290edc3067fa85892c")
  (:PATH "raw/core-R2-whole-cache/tests/mvcc/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/mvcc/support.fasl")
   :BYTES 38358 :SHA256
   "66be4595886ccd98abfc8d9d65a995254576afe7a0922786f4396ef845ceaee2")
  (:PATH "raw/core-R2-whole-cache/tests/read/lifecycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/read/lifecycle.fasl")
   :BYTES 122302 :SHA256
   "90320b2afa38a69e0973311a7b4e867ff3c18373ef434fd95847bf2b697d4b54")
  (:PATH "raw/core-R2-whole-cache/tests/read/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/read/support.fasl")
   :BYTES 20936 :SHA256
   "4543691b60a93be6988a1dc52c7865fab812cf2c2234a84ccfcad7f19743e103")
  (:PATH "raw/core-R2-whole-cache/tests/read/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/read/threads.fasl")
   :BYTES 16898 :SHA256
   "d4cc854d461987b697ba0426033eb9abe5919d9c38823dbde3fa5e1e5aa546ca")
  (:PATH "raw/core-R2-whole-cache/tests/recovery-active/guards.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery-active/guards.fasl")
   :BYTES 32872 :SHA256
   "f7c0747992a07257a42fc1461ad5040566607448d2e48a3525928a9682068b49")
  (:PATH "raw/core-R2-whole-cache/tests/recovery-active/semantics.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery-active/semantics.fasl")
   :BYTES 24457 :SHA256
   "29ef2f32cca7d37efcd7684eb015fc9d3abfc4d0f9e01e07ada58e8e5155844b")
  (:PATH "raw/core-R2-whole-cache/tests/recovery-active/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery-active/support.fasl")
   :BYTES 73722 :SHA256
   "150945b4e92e3f79db0b8eff6d4c25306d656505bd6183a30dc4f6483932d95b")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/corruption.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/corruption.fasl")
   :BYTES 13106 :SHA256
   "e5d0b769b14c6f25b9d8bc2bb0f16d180fe2a1b6f390fd0bb32df212824d4186")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 34022 :SHA256
   "68a9fef35efbb113e904454d1b4931515fe25ba6d6527e37d8bca460d2362d70")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 69392 :SHA256
   "7868e9a9641f9b3ac0b20ffdef2505a5729cf495553a5cb2fda8b6bf711eeed0")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/decisions-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/decisions-support.fasl")
   :BYTES 16632 :SHA256
   "ec46a7b2ae8d021c4bc024f5b9340dcc2b9d025dd5f02165e7ddc3a524095d8f")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/decisions.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/decisions.fasl")
   :BYTES 57607 :SHA256
   "7e6edde25f169820b60ed5b8d0e4c9b55dd22bc6c2e50e0bcd7f7cc7ec0dba31")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/inventory-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/inventory-support.fasl")
   :BYTES 20603 :SHA256
   "4a4eea740f9912172011d06e0cadc950d89885f52aa0bdcdbcd1ddaf0a232639")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/inventory.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/inventory.fasl")
   :BYTES 37721 :SHA256
   "37a8739d757f6ba72f79f96d3cdfd5ffe9520a6388b73ba747ab2a49e238935f")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 47979 :SHA256
   "fdd2b11da9cb3d81e379cd22fbc894a1fe44ab91a06f7b4a6ddf390996c26bf0")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/manifest-support.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/manifest-support.fasl")
   :BYTES 24117 :SHA256
   "618f78c32c39ab196bcd94be9c27d4c50e98483008bf731062ae2f89525c2551")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/manifest-transition.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/manifest-transition.fasl")
   :BYTES 63037 :SHA256
   "745050e35a010f849c8526a05ebce47b37ec32a2bc28cfbb5c186c07bf6f9ca0")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/manifest.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/manifest.fasl")
   :BYTES 33944 :SHA256
   "eba85844ae216ed8f06e5f822b8c85c1b125ef692bbff62cdf6647b301fdcbf9")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/scan.fasl")
   :BYTES 52960 :SHA256
   "6628e5076c95f5e61636ddefd9fcde6cce1c871f6d4d4e78663e400f827af65e")
  (:PATH "raw/core-R2-whole-cache/tests/recovery/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/recovery/support.fasl")
   :BYTES 17920 :SHA256
   "322f16ea90a5f57a2ba963be4706d283592a640d2c60ea8fa80312436513a163")
  (:PATH "raw/core-R2-whole-cache/tests/scheduler/controller.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/scheduler/controller.fasl")
   :BYTES 48551 :SHA256
   "bbb494f72f7350549fdaa1abfdd6e75956f156b7d0df4ce3538ca72669b2e93b")
  (:PATH "raw/core-R2-whole-cache/tests/scheduler/dispatch.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/scheduler/dispatch.fasl")
   :BYTES 64711 :SHA256
   "c7c1014335b125b41edf3e43fbfd97e7d67afbb394ebe25e21408a11d5b3f4d5")
  (:PATH "raw/core-R2-whole-cache/tests/scheduler/lifecycle.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/scheduler/lifecycle.fasl")
   :BYTES 96610 :SHA256
   "d2fd642e9471d2dbbb6045f8028aa62ffa4c0ec2394e2c64beb36db4a3bf21ee")
  (:PATH "raw/core-R2-whole-cache/tests/scheduler/pool-begin.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/scheduler/pool-begin.fasl")
   :BYTES 59530 :SHA256
   "f900a789e3c38b8d8bea036cdb2d31bb332be2f9913cf24f9c5563ddec0949ec")
  (:PATH "raw/core-R2-whole-cache/tests/scheduler/pool-claim.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/scheduler/pool-claim.fasl")
   :BYTES 42928 :SHA256
   "e20c0a1e691bc11b7b07ebbd4b6be056f5fd9b4f7133e564e81afa25f00dfa6f")
  (:PATH "raw/core-R2-whole-cache/tests/scheduler/pool-recycle.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/scheduler/pool-recycle.fasl")
   :BYTES 52638 :SHA256
   "73a9ca525368e05a9facd61ee4bc6d7220e8221be41535bfbd0b9efc812d575d")
  (:PATH "raw/core-R2-whole-cache/tests/scheduler/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/scheduler/support.fasl")
   :BYTES 10748 :SHA256
   "21add841f0d4bbc347490512f68faa906d9b1846ee0ffe4ab760a1eacd238a22")
  (:PATH "raw/core-R2-whole-cache/tests/smoke.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/smoke.fasl")
   :BYTES 3302 :SHA256
   "2ae8a94fe1db0b587166de7f560164b1fbae61e719e78804ac79b51f11a0d5c5")
  (:PATH "raw/core-R2-whole-cache/tests/storage/compaction-scan.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/storage/compaction-scan.fasl")
   :BYTES 35516 :SHA256
   "6f669bd175ff6a11b1b24c5e42a6ff68a27e6df6f045873f0037f48a631a8e3e")
  (:PATH "raw/core-R2-whole-cache/tests/storage/control-payload.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/storage/control-payload.fasl")
   :BYTES 59369 :SHA256
   "cb49bf687efad89f07ce37bcb58730ce26c1352f45d5902a848b483deee31474")
  (:PATH "raw/core-R2-whole-cache/tests/storage/log-header.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/storage/log-header.fasl")
   :BYTES 36655 :SHA256
   "d13e03610849ef306e9a801b865fb78b6f96b6871e7755e81a9f202130f32194")
  (:PATH "raw/core-R2-whole-cache/tests/storage/segment-header.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/storage/segment-header.fasl")
   :BYTES 18234 :SHA256
   "af56d7c5856e9a38766efd8d49cb83f13f682766adfc53f979eb4f76c27140ca")
  (:PATH "raw/core-R2-whole-cache/tests/storage/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R2-fasl/tests/storage/support.fasl")
   :BYTES 13736 :SHA256
   "1a1e5c6d6b8d5e75c19a7fec2f1aa37947c8a8e3e0df37380d6b5416d47847be")
  (:PATH "raw/core-R3-inner/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073651-command-78980-0/conservazione.lisp")
   :BYTES 1784 :SHA256
   "98d157314a9bc3e333c3ceb403d254698dbe88db54898243b71ac63c415b0906")
  (:PATH "raw/core-R3-inner/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073651-command-78980-0/report.lisp")
   :BYTES 317 :SHA256
   "ecd50fe6451e2c874af17e1b46d8e990f8425c6546ee1ee65ca33e3c8623cf9b")
  (:PATH "raw/core-R3-inner/report.lisp.gz" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073651-command-78980-0/report.lisp.gz")
   :BYTES 172791 :SHA256
   "b2421bab7646de4b62794d3e52cb29b7df6a626f547c62d1abaa72c0d466fffa")
  (:PATH "raw/core-R3-outer/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073647-command-78833-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "d2210e19482988f1a63174cd36f1b70734245fe5229981d4073b22580bf2ce8b")
  (:PATH "raw/core-R3-outer/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073647-command-78833-0/report.lisp")
   :BYTES 192801 :SHA256
   "6748905da301c6c23730234b782399dc3243db8b6c13410446b0fcb26a8e9195")
  (:PATH "raw/core-R3-whole-cache/src/active/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/active/package.fasl")
   :BYTES 1598 :SHA256
   "60d7564dbd859cb394cd54fb0cdbc1767c36a98e5d65ccfe174bb13b9b807c6e")
  (:PATH "raw/core-R3-whole-cache/src/active/preflight.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/active/preflight.fasl")
   :BYTES 4808 :SHA256
   "e21a067c7045645cb307a2f37930fd9e8f00affd3053f43288abf111cd2c2e06")
  (:PATH "raw/core-R3-whole-cache/src/active/prepare.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/active/prepare.fasl")
   :BYTES 5570 :SHA256
   "d1b5b0ae665df434b3e7d2af39dc6449fcb80526d2bec8be656c5efe62938208")
  (:PATH "raw/core-R3-whole-cache/src/active/source.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/active/source.fasl")
   :BYTES 5224 :SHA256
   "e0768abfa7b8d4128d61ba6291f132f61c66c347da948448e88fe0fa9710c8f9")
  (:PATH "raw/core-R3-whole-cache/src/active/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/active/types.fasl")
   :BYTES 5985 :SHA256
   "ed41f096c664b276f2d049c191c8afda27bd7a44c6eebcb109e3e898ab0c6c02")
  (:PATH "raw/core-R3-whole-cache/src/cache/build.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/cache/build.fasl")
   :BYTES 8859 :SHA256
   "6b6eed4c507d058caebd2e1c08372687ac2a2ea0c8f9213939d6478948b8f58b")
  (:PATH "raw/core-R3-whole-cache/src/cache/clock.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/cache/clock.fasl")
   :BYTES 4900 :SHA256
   "b1c2909cba0b3a97b2ebf540eae2798f1aaee4d19ccbea08b4dcbbf58a830166")
  (:PATH "raw/core-R3-whole-cache/src/cache/core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/cache/core.fasl")
   :BYTES 7275 :SHA256
   "e137e1f4b82d307945cdd9a0225f0b1a1db53a8621338b25ca1c21a996ae0060")
  (:PATH "raw/core-R3-whole-cache/src/cache/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/cache/package.fasl")
   :BYTES 1182 :SHA256
   "70e1d3155187f6290310bb025dcc5d5a71107b42b7e27070dae45bab5c6ecd26")
  (:PATH "raw/core-R3-whole-cache/src/cache/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/cache/read.fasl")
   :BYTES 11973 :SHA256
   "cf8a72170a3ce21e77ad484fb55d6bb7ad3669c3efea58e4f89721fa7149cb2f")
  (:PATH "raw/core-R3-whole-cache/src/cache/types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/cache/types.fasl")
   :BYTES 18000 :SHA256
   "4ce69a13163a0dfee45bfc1cd609044aba53d06afadee21ea39d36ecfb92b70d")
  (:PATH "raw/core-R3-whole-cache/src/cache/write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/cache/write.fasl")
   :BYTES 9839 :SHA256
   "30c5c23c823efcf5a386623ccb8da95bb0ebb5183c16042ceda14ac93652e9a4")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-array-input.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-array-input.fasl")
   :BYTES 9988 :SHA256
   "9d082bdf873885edbcb380cb9eb8a5eacf701a6ac7b07d6627c5d12dec04ee3c")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-array-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-array-write.fasl")
   :BYTES 8702 :SHA256
   "e96ad3ec5903fa6dfdf881a3f9922e9008bfa9c85c067cdbd7466fc27fba4aba")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 4242 :SHA256
   "fa359e69b73f858ad579a38e0a13c65dfcc84f7c92f1664e398d0fe9c8ef2f71")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 5060 :SHA256
   "a72ae2e014ae0c58640ea5051ecc9795b5c58350b666e67dd3134c7bff43bf5f")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-float-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-float-write.fasl")
   :BYTES 6810 :SHA256
   "646c2414f4447c08d110effceefb7742e7d424a84f1596b2d31fac363140cde7")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-header.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-header.fasl")
   :BYTES 7392 :SHA256
   "22d16986af72912b595933f3c6960127de8a8c61b0ec80dd683f2b76c51385b7")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-map-input.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-map-input.fasl")
   :BYTES 10479 :SHA256
   "181bebc2c748cd7952dd7ba5320cce3fe6629e55cba114e72122948a771f2283")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-map-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-map-write.fasl")
   :BYTES 8790 :SHA256
   "f6e844861d9699e6068f77a2de152b2bad606755c000910d063573d9ec291623")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-minimal.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-minimal.fasl")
   :BYTES 5480 :SHA256
   "8c368a9dfd7bc23cfceb15a01d5e164fe87d081e0eb3f125c1d0508d981ef1b9")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-package.fasl")
   :BYTES 1262 :SHA256
   "2683419097804256e16960a1ee474e3319626d57da3233018b7d317590ce6605")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 3465 :SHA256
   "d9075b73529ebdbfcc09c650d2b290cc0961c7ca7eb37f3a07c9541ae0d9baae")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 10671 :SHA256
   "335dc67ace5e4dfb4825999c244da7ccd8c528c8f4a0ec596e270c1c95a8bba3")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 2941 :SHA256
   "e38df189204830198f9758312be3e18591bcd468dfffe9d9c67dca3481ba87d4")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 8030 :SHA256
   "d727c2ded958c07948a8e80f2eb28c1c4e43715ccc03c5d4939ea0917ccbcd85")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-scan.fasl")
   :BYTES 8491 :SHA256
   "d13c9ffeb963819ab7f9fd18dec4fbaa4cacc870e55dbadc905b3cbd1ca35c2a")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 3956 :SHA256
   "a5d05e78900b746860c548e1ee6ff74c8f10e8992430ceaaee01c8295ad95385")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-space.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-space.fasl")
   :BYTES 11645 :SHA256
   "fced72f3564db2ca4b9bb5389e7371c22f5b989b8aba4fe6705604796582c2bb")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-string-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-string-write.fasl")
   :BYTES 9770 :SHA256
   "39c3c3186b8ac5923a824af2b15d309b9098a375314f38d15d1185dd38916998")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-tag-input.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-tag-input.fasl")
   :BYTES 7031 :SHA256
   "2da7cedfe76fd4127911cbd2ceb92f36d2058b3c939a210bfb1440cb65c78929")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-tag-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-tag-write.fasl")
   :BYTES 6374 :SHA256
   "f431c61a66a424583b997fd953af006269047dd1fc7785cb4da99ed0e6c60124")
  (:PATH "raw/core-R3-whole-cache/src/codec/cbor-write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/cbor-write.fasl")
   :BYTES 6935 :SHA256
   "4afdb8f1df60bf1b8390ccf74aeb07e17fab3e44fe619a054c42e8d035397e56")
  (:PATH "raw/core-R3-whole-cache/src/codec/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/package.fasl")
   :BYTES 951 :SHA256
   "4bee1701f65018605151f8e581c85cc489725aa80b1db283ec57ab9ef03811f2")
  (:PATH "raw/core-R3-whole-cache/src/codec/utf8.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/codec/utf8.fasl")
   :BYTES 8348 :SHA256
   "f053d1098a418bfc152ce3751a92f7cece8edd9769fed829bf1ef850b60e397e")
  (:PATH "raw/core-R3-whole-cache/src/control/build.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/build.fasl")
   :BYTES 8215 :SHA256
   "24cbcb8260ba6097cb171a1c0164a997eddfce69e7d7f837d23af3a54d157208")
  (:PATH "raw/core-R3-whole-cache/src/control/dependency.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/dependency.fasl")
   :BYTES 4004 :SHA256
   "6abe56656de1c325f98646c1c0654a9ed26fd15c10264119acb86e23a717bdd9")
  (:PATH "raw/core-R3-whole-cache/src/control/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/package.fasl")
   :BYTES 2274 :SHA256
   "c8f4e17e8e8e7150a4a5dcad5d260527cd116e9cbfa53ff4a2ac4a1941cdea0e")
  (:PATH "raw/core-R3-whole-cache/src/control/preflight.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/preflight.fasl")
   :BYTES 5187 :SHA256
   "ee9fa32e1c494e5a6ad04cab5b1af2811ea663b9502c71faade006683030be4b")
  (:PATH "raw/core-R3-whole-cache/src/control/prepare.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/prepare.fasl")
   :BYTES 5568 :SHA256
   "b7e59db61bac2442b4eb80c60a9116c42bef294fa61d0f2e5ae7b0e42ee22ffe")
  (:PATH "raw/core-R3-whole-cache/src/control/publication-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/publication-read.fasl")
   :BYTES 4071 :SHA256
   "f279b07e351564fb64cb51504d177e197d4817ef780a9161fcd15fb9f952c40f")
  (:PATH "raw/core-R3-whole-cache/src/control/publication.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/publication.fasl")
   :BYTES 6080 :SHA256
   "bfe958b3f15f5b3652159b1723de32353fcd46a22049ccb068c8c8d4a279ebec")
  (:PATH "raw/core-R3-whole-cache/src/control/recovery-publication.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/recovery-publication.fasl")
   :BYTES 2906 :SHA256
   "5cf78e177eb08efcd94304fb9b314cfdd84dcf330904fd8eb78d756aeb7ccc83")
  (:PATH "raw/core-R3-whole-cache/src/control/recovery-read.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/recovery-read.fasl")
   :BYTES 8815 :SHA256
   "4c6777d060ebd91e9eb903abeeac2f39eee47277b09c58fa2c20866adb0d13c1")
  (:PATH "raw/core-R3-whole-cache/src/control/recovery-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/recovery-types.fasl")
   :BYTES 9710 :SHA256
   "7d7fa6e12f368d679aeda97ea2718ca0076ce1d79164d2cf50edd4e98ebaea8b")
  (:PATH "raw/core-R3-whole-cache/src/control/transfer.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/transfer.fasl")
   :BYTES 4892 :SHA256
   "5917895294d70b7d3ba9b34b972419c7df44789e37e22f57a687a3ad43961e64")
  (:PATH "raw/core-R3-whole-cache/src/control/types.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/control/types.fasl")
   :BYTES 21480 :SHA256
   "ed5805fd871a1f5d2e78310951c40b8b3ed4e5cdf794a598fcce3e52d5863fe5")
  (:PATH "raw/core-R3-whole-cache/src/csn/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/csn/package.fasl")
   :BYTES 984 :SHA256
   "6afc40851961832bca02140ab9aa28849386f3ee1b161535ad551bd04a3c5123")
  (:PATH "raw/core-R3-whole-cache/src/csn/registry.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/csn/registry.fasl")
   :BYTES 29111 :SHA256
   "983c4831e4cd501d3d8e29abc2dfbb1634c437c18f81aacaa7a7a5470b2c45ee")
  (:PATH "raw/core-R3-whole-cache/src/dispatch/begin.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/dispatch/begin.fasl")
   :BYTES 2531 :SHA256
   "f0041561b97fdbc84a41be0750e532d758117dec7f073a742f0b4fbf1174aecd")
  (:PATH "raw/core-R3-whole-cache/src/dispatch/build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/dispatch/build.fasl")
   :BYTES 2251 :SHA256
   "692db4230bf4f46b02f5cd0698e7d1a60f8452fe085bfb2a6d65d1a52ba6e1b5")
  (:PATH "raw/core-R3-whole-cache/src/dispatch/claim.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/dispatch/claim.fasl")
   :BYTES 3551 :SHA256
   "97bdc0bd40bbb5f51dd280fe60132051b78a66533b21525d61d67834ef665adb")
  (:PATH "raw/core-R3-whole-cache/src/dispatch/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/dispatch/package.fasl")
   :BYTES 1076 :SHA256
   "79f9a3f6bb93aff4ff58af61ccc09673dc4a158142273d29b7162c1357d28361")
  (:PATH "raw/core-R3-whole-cache/src/dispatch/recycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/dispatch/recycle.fasl")
   :BYTES 3639 :SHA256
   "248d23f2eebd664e37304bbdf30c714a33742002fb4c014c4fc497c9d31b9c9c")
  (:PATH "raw/core-R3-whole-cache/src/dispatch/types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/dispatch/types.fasl")
   :BYTES 5583 :SHA256
   "47007c46b6fff0f7155d737992eb0867423208b7245e9d21b888243729cbd133")
  (:PATH "raw/core-R3-whole-cache/src/epochs/core.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/epochs/core.fasl")
   :BYTES 9466 :SHA256
   "f02a28774a962610f83a38c3cedb4e41499c7dd7a848f5ab657ebd839cfce051")
  (:PATH "raw/core-R3-whole-cache/src/epochs/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/epochs/package.fasl")
   :BYTES 1209 :SHA256
   "6836c2901ed911da5501c011755f4ae7795cd99c1a056d966cca615f1e069cc3")
  (:PATH "raw/core-R3-whole-cache/src/epochs/read.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/epochs/read.fasl")
   :BYTES 5305 :SHA256
   "55252db3a16336573b576d50d48b3137bc5b2176c03d5804d3a5165cd7d41705")
  (:PATH "raw/core-R3-whole-cache/src/epochs/reclaim.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/epochs/reclaim.fasl")
   :BYTES 10815 :SHA256
   "264d69eac476dfe17fa66a73d846a100763e9f785557f8acd021c77cea462861")
  (:PATH "raw/core-R3-whole-cache/src/epochs/retire.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/epochs/retire.fasl")
   :BYTES 9424 :SHA256
   "be88dc52dd5d61c73eaa5f34f816eea8881a1f82d1e29e634ac71183337f62e8")
  (:PATH "raw/core-R3-whole-cache/src/epochs/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/epochs/types.fasl")
   :BYTES 24030 :SHA256
   "789cb943339f14dc96f1e64425900ed533d54635d6de07a3923b0ddd6159aafe")
  (:PATH "raw/core-R3-whole-cache/src/execution/handoff.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/handoff.fasl")
   :BYTES 15939 :SHA256
   "1095d019c08bf2041fb7d1c254d7d70dd751c245e2a2ce0ee1d529605f8a4569")
  (:PATH "raw/core-R3-whole-cache/src/execution/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/package.fasl")
   :BYTES 1620 :SHA256
   "dd0ff03d075e6568e1cac74ff054dcdc419b0f1d1ac296ddf6f60ead50a137fb")
  (:PATH "raw/core-R3-whole-cache/src/execution/queue.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/queue.fasl")
   :BYTES 17794 :SHA256
   "bae17dd6acb4edac712a47dcf58b5b6aa47f9083135d3b532c5c00eb23fed291")
  (:PATH "raw/core-R3-whole-cache/src/execution/ready-recycle.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/ready-recycle.fasl")
   :BYTES 5179 :SHA256
   "5882e9d7b6b477f45af4e1702c1a7a58894f8a0db448152d7317bd7bfb5d7b9f")
  (:PATH "raw/core-R3-whole-cache/src/execution/ready-types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/ready-types.fasl")
   :BYTES 14971 :SHA256
   "e9ac3b71d8fc6b09c8823e9e4c4ae13449062e593b482d3bc5e21a89bf244014")
  (:PATH "raw/core-R3-whole-cache/src/execution/ready.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/ready.fasl")
   :BYTES 9717 :SHA256
   "e2ba7aaaa6d21bd8c4bec2bf55a60dbac2d46cebe3f664ea818c97732578d532")
  (:PATH "raw/core-R3-whole-cache/src/execution/worker-boundary.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/worker-boundary.fasl")
   :BYTES 6435 :SHA256
   "ccef410429b2455834abe0617b7d3ad3a70682939d136de6543a72fdea1ea75c")
  (:PATH "raw/core-R3-whole-cache/src/execution/worker-claim.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/worker-claim.fasl")
   :BYTES 12445 :SHA256
   "1cca2f960c74a1ff755f6b7819616a98aad21cfbe4461dc3bff13c756f288c3c")
  (:PATH "raw/core-R3-whole-cache/src/execution/worker-run.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/worker-run.fasl")
   :BYTES 9039 :SHA256
   "59104c979cf3a23754758dce80e40cfadf4d01cebe12b041a60389d4ef50a32a")
  (:PATH "raw/core-R3-whole-cache/src/execution/worker-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/worker-types.fasl")
   :BYTES 22095 :SHA256
   "e07c7e94606dfcf6da731f1665d50e606735481afe74c425e2aa1e9b8aefbcbc")
  (:PATH "raw/core-R3-whole-cache/src/execution/writer.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/execution/writer.fasl")
   :BYTES 8982 :SHA256
   "ad7a57284c6fd2f5eb62e3a630af485def1a0b9ee1185734387f87381ec9b47c")
  (:PATH "raw/core-R3-whole-cache/src/foundation/batch.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/foundation/batch.fasl")
   :BYTES 9681 :SHA256
   "1a440e28c6e7e65386f189d305031e7191ce4e0768698a24f666ed8043f0d0a0")
  (:PATH "raw/core-R3-whole-cache/src/foundation/binary.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/foundation/binary.fasl")
   :BYTES 9087 :SHA256
   "e29152b5138f79c74d18375c57a0b22ac236777fce74a44d13b3ac8ae1ecbdc7")
  (:PATH "raw/core-R3-whole-cache/src/foundation/conditions.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/foundation/conditions.fasl")
   :BYTES 6281 :SHA256
   "f42961011bc39377672864694ff72f09460184d0d2fe75b91de11b4b26162ef5")
  (:PATH "raw/core-R3-whole-cache/src/foundation/crc32c.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/foundation/crc32c.fasl")
   :BYTES 4263 :SHA256
   "dd015d21ae96df3d6514e37f739d45757a2d3de864fc4273c8f91f40afa9e7ac")
  (:PATH "raw/core-R3-whole-cache/src/foundation/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/foundation/package.fasl")
   :BYTES 2094 :SHA256
   "11f203856bc1e718790d4a92406c4027ef684d0f20fec4dfceb35f597f61fefe")
  (:PATH "raw/core-R3-whole-cache/src/foundation/record.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/foundation/record.fasl")
   :BYTES 36370 :SHA256
   "854fbf57a1319c51ce8afaeac8d50ea94406d0d2327e69d7a7ecaa4f69c1f660")
  (:PATH "raw/core-R3-whole-cache/src/get-directory/build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-directory/build.fasl")
   :BYTES 6196 :SHA256
   "7f1dc3f65e5963fa468888eaa4dd0606e187b50aaadc3a6cf53485047e68620a")
  (:PATH "raw/core-R3-whole-cache/src/get-directory/package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-directory/package.fasl")
   :BYTES 2181 :SHA256
   "9d09e5c548774384460fac69ce07887e1f5d065ad4a012e30bd36ce668526f4d")
  (:PATH "raw/core-R3-whole-cache/src/get-directory/read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-directory/read.fasl")
   :BYTES 7292 :SHA256
   "344770854de25746af6839aa62f6ddbe3394750213fbe6deaaf2c664a3a97301")
  (:PATH "raw/core-R3-whole-cache/src/get-directory/sources-read.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-directory/sources-read.fasl")
   :BYTES 8243 :SHA256
   "213a058a92e9a4f9b94acd80c18a7e56493751b2834498e116380b6e2d5c0621")
  (:PATH "raw/core-R3-whole-cache/src/get-directory/sources-types.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-directory/sources-types.fasl")
   :BYTES 12646 :SHA256
   "ed0aa2ce113dd905c53722745277d774389d257ea084fe1e3326dd9ae4d47d62")
  (:PATH "raw/core-R3-whole-cache/src/get-directory/types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-directory/types.fasl")
   :BYTES 7029 :SHA256
   "5ff44e54af75a5f728fc934b3bedb9e1bca1c8aca95f783a099a02ba85d35c27")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/active-build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/active-build.fasl")
   :BYTES 13965 :SHA256
   "7a1114ced8705c324074a0ea4a3183f98880339b7359f28acc7aa383b3042736")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/active-directory.fasl")
   :BYTES 6977 :SHA256
   "44a0990fde85e7ee6f88c1dda22831c83d325c7d5bb054bbead989bd6f37f3e0")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/active-init.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/active-init.fasl")
   :BYTES 3947 :SHA256
   "0cf53d63505d57d681db68d475f5965557f6c8ded613bfb9f47d9a1234b96cd7")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 9017 :SHA256
   "b281af6aeb0e1a851a2f29ecb243c7b802fae0b8e554c7aa84dcd8273e6719df")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/active-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/active-read.fasl")
   :BYTES 6887 :SHA256
   "c8146f7e2565ffbcd228f2668fd24e0482f1d524b4258322de07eacb2b2e9c13")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/active-scan.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/active-scan.fasl")
   :BYTES 8231 :SHA256
   "8b37cc5700c45a3a2fa4ad14e790451bb48030efa919e383210198ad97b57876")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/active-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/active-types.fasl")
   :BYTES 17331 :SHA256
   "8f1526b0a5a24955732411ce006d63514ce9a7c59e437e2e00810e754a354099")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/build.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/build.fasl")
   :BYTES 10760 :SHA256
   "db2bf9d40c97eeaa4419ee399f9b430731ed099fa675e42d3074dd382eeafcd4")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/package.fasl")
   :BYTES 2677 :SHA256
   "d7fb0ef6a300df96b1b8754660e8153f532905197b2746a32bc3d5fceca089e9")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/read.fasl")
   :BYTES 10523 :SHA256
   "57827fc106c1352778d8077b99980b96dc7743547d55c27a11c0654a6b9b3c39")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/rows.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/rows.fasl")
   :BYTES 5870 :SHA256
   "2738b8d168dd74c91b83d9d9b1f3e2a5850e65355c88c17845bfb4a929e8c5da")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/scan.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/scan.fasl")
   :BYTES 10748 :SHA256
   "31e69cf4d8655c433319dc218e50449b93360a905ba112c6f390154bc7146f13")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/sort.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/sort.fasl")
   :BYTES 9395 :SHA256
   "e8cd1a418589754977d2235ac0bd941f2c47f85661fe82d4e77a16ec8ffef257")
  (:PATH "raw/core-R3-whole-cache/src/get-resolver/types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get-resolver/types.fasl")
   :BYTES 7442 :SHA256
   "f55951300906a06147f0075c8e74f176b5c303713979697f39ab25486420421f")
  (:PATH "raw/core-R3-whole-cache/src/get/build.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get/build.fasl")
   :BYTES 6750 :SHA256
   "98349bbac1d269d68fc7516344b154a9f2bfa89e705609511ed81b97ef496897")
  (:PATH "raw/core-R3-whole-cache/src/get/lifecycle.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get/lifecycle.fasl")
   :BYTES 8691 :SHA256
   "0c88c5ee082c047afc79f44e29f862f5dd5e761031d3fe168e7ce3fe757241fb")
  (:PATH "raw/core-R3-whole-cache/src/get/lookup.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get/lookup.fasl")
   :BYTES 11211 :SHA256
   "4834c1da166e65789d4d5dd219c83edad83c9432a0c83cd9acd9285d27d5c7eb")
  (:PATH "raw/core-R3-whole-cache/src/get/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get/package.fasl")
   :BYTES 2174 :SHA256
   "122d27494f293aa84906ac3660fb3ad3f6c9bb1bd86a9ecc9d4cf3045f1843d0")
  (:PATH "raw/core-R3-whole-cache/src/get/segment.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get/segment.fasl")
   :BYTES 10571 :SHA256
   "e891b4bf99a82b08d9cf253ef2ce1ff0c2b9022e0fe32b3b7ed4cdfb517f4f07")
  (:PATH "raw/core-R3-whole-cache/src/get/target.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get/target.fasl")
   :BYTES 7816 :SHA256
   "d4857011a4485f6a8cf9dc89ddf570f875ba53d0ba1aeb31ed577665a9d32136")
  (:PATH "raw/core-R3-whole-cache/src/get/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/get/types.fasl")
   :BYTES 30924 :SHA256
   "5baeaf49ee6b0b7890955bfa48782614e35b85917c0f01cd9fab78a6216caef1")
  (:PATH "raw/core-R3-whole-cache/src/hash/arithmetic.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/hash/arithmetic.fasl")
   :BYTES 7692 :SHA256
   "8de0fcb4dbd9afc88e526f3f6c84a2684d3bebad27e8488b30a3fda3af3836a0")
  (:PATH "raw/core-R3-whole-cache/src/hash/blocks.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/hash/blocks.fasl")
   :BYTES 8303 :SHA256
   "43e693ad137ba2c20e42a5e1733e1430623cc26f1800bd01c6772ccf3f5c901c")
  (:PATH "raw/core-R3-whole-cache/src/hash/hash64.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/hash/hash64.fasl")
   :BYTES 6652 :SHA256
   "b79c47d0a0546c24fa410e31b4da21c334e52c29122c65366c6c2188ee55df16")
  (:PATH "raw/core-R3-whole-cache/src/hash/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/hash/package.fasl")
   :BYTES 959 :SHA256
   "6df49c968445000c89c7a9fc172b8667779bc4cd6f79e4ae36c3f966cd65bef1")
  (:PATH "raw/core-R3-whole-cache/src/index/core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/core.fasl")
   :BYTES 6195 :SHA256
   "a6f6b48677337512a876e906151915fad0a9462b23649e48e2b7cfbe37fbc9ca")
  (:PATH "raw/core-R3-whole-cache/src/index/hash-digests.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/hash-digests.fasl")
   :BYTES 6112 :SHA256
   "797a5ab4361bb5855f7bc4e4d10ef870e57cb134c4050caea9acf23b05f29391")
  (:PATH "raw/core-R3-whole-cache/src/index/hash-seed.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/hash-seed.fasl")
   :BYTES 5144 :SHA256
   "3f37085c0e27720e0682aabb1694125f087823fb0921a7ad0551d237f2dda88c")
  (:PATH "raw/core-R3-whole-cache/src/index/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/package.fasl")
   :BYTES 1154 :SHA256
   "b56da341dd36b798ebd6b7e7093d5f85638f6a170085127f6c32fea9706cf18c")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-arena.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-arena.fasl")
   :BYTES 6834 :SHA256
   "361681141cf6620b82ec560ed3eb1cec56374074af0b58df6483002c37545221")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-build.fasl")
   :BYTES 10607 :SHA256
   "ed925149181dff158f392543cbf02fecc2300cffab9d9ded7e05d9bd8ebc0210")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-core.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-core.fasl")
   :BYTES 8760 :SHA256
   "00bedf2f597b015d5df632f554f026fb3b9caad2f7018cb214a4ba94f00e8d2f")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-directory.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-directory.fasl")
   :BYTES 14244 :SHA256
   "a09b23cf9febf5e07708493c35d636fb2bb5a55aea1196d83e5be6ef51385028")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-package.fasl")
   :BYTES 1729 :SHA256
   "1cb61cf69823cb571136628f0a4f45599ae1241e4e84b3c2bfb0af13c793be01")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-probe.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-probe.fasl")
   :BYTES 13350 :SHA256
   "d9eb6176f7099f7ead3d584ce15b869e1cf5b509017d6c9637bd6b1cb9b6dccb")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-read.fasl")
   :BYTES 7553 :SHA256
   "e34a85fcfd208df0056916c8f6031b966d382c46548877eae96e2e2f32c854c4")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-relocate.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-relocate.fasl")
   :BYTES 9181 :SHA256
   "9456059c823676432a91897dfd5bceb635d044108438a84c62c8fe6ff7d09d01")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-types.fasl")
   :BYTES 36228 :SHA256
   "49638800b7864110a77ffcd49908f07dd1da93297cc10498ab1f7928c97b1c33")
  (:PATH "raw/core-R3-whole-cache/src/index/primary-write.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/primary-write.fasl")
   :BYTES 15743 :SHA256
   "46a012a264f4cf2c158b7cf79ca9bb7d124f62e92c8c12b4cb32770a5afef6c6")
  (:PATH "raw/core-R3-whole-cache/src/index/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/read.fasl")
   :BYTES 7208 :SHA256
   "89c1d44795031550cebf3bc4944cc567631df88201946c8ddeb7d281210bc5b0")
  (:PATH "raw/core-R3-whole-cache/src/index/rebuild-budget.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/rebuild-budget.fasl")
   :BYTES 6574 :SHA256
   "55d2924a23d3c57f91cb3a2ed7c849322a75b4dfc291f5bb43e66e0e3c21f97f")
  (:PATH "raw/core-R3-whole-cache/src/index/rebuild-copy.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/rebuild-copy.fasl")
   :BYTES 8117 :SHA256
   "6917c7c4c7f2a117f1a6ab75b3605fd6595b687ab5837c73835f7e0afbd9fd53")
  (:PATH "raw/core-R3-whole-cache/src/index/rebuild-scan.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/rebuild-scan.fasl")
   :BYTES 12587 :SHA256
   "3f065eac415a885fa2f87c0e782ae779d9095aa218a46c5a02e8eaf141fbd19b")
  (:PATH "raw/core-R3-whole-cache/src/index/rebuild.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/rebuild.fasl")
   :BYTES 4527 :SHA256
   "3d5cd46eeee9112df7a96d11221093ed98e06013aaf149bb36aeb7c6a042dc1b")
  (:PATH "raw/core-R3-whole-cache/src/index/relocate.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/relocate.fasl")
   :BYTES 6695 :SHA256
   "641fb40b78281bd93711fcb8c0741f02ea598f146108219637633d10be43bd39")
  (:PATH "raw/core-R3-whole-cache/src/index/types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/types.fasl")
   :BYTES 9949 :SHA256
   "2dfc8f2de96bebfe8915cfe7748e587945802c9ea42fd3e58dad3a903047ad36")
  (:PATH "raw/core-R3-whole-cache/src/index/validation.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/validation.fasl")
   :BYTES 9618 :SHA256
   "9dd268982dec0a7ed80890da12cc53f23f1255e705934e2d52423183b10e39ee")
  (:PATH "raw/core-R3-whole-cache/src/index/write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/index/write.fasl")
   :BYTES 12528 :SHA256
   "93a977b64093f5a78765c2d36a3ca1ce9b13dc8f2d1b4747a3f199026c03cc13")
  (:PATH "raw/core-R3-whole-cache/src/io/flush.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/flush.fasl")
   :BYTES 4626 :SHA256
   "25f3dda411cfe581750ce0d96002365553c6f119851f1a87e84a8721f6b8fe53")
  (:PATH "raw/core-R3-whole-cache/src/io/identity-types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/identity-types.fasl")
   :BYTES 4480 :SHA256
   "7a5677e1408375509bd83c623ccd3c2586854ed6607740b483dc712c30b036c6")
  (:PATH "raw/core-R3-whole-cache/src/io/identity.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/identity.fasl")
   :BYTES 7752 :SHA256
   "872e77bdfe9a4ea5d2b4a5efb8f41236b2c2e1ec39f6d811ac753ad862b03efb")
  (:PATH "raw/core-R3-whole-cache/src/io/lifecycle.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/lifecycle.fasl")
   :BYTES 10869 :SHA256
   "5e08a0b4c8671564ab772dee88f73f55e3b9ea6c3984240e14b8b9a6c763e9f8")
  (:PATH "raw/core-R3-whole-cache/src/io/namespace.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/namespace.fasl")
   :BYTES 11397 :SHA256
   "0f7029dc7775784b0164c1523e33c6a342e2f16ba4268e0c335981424e95645f")
  (:PATH "raw/core-R3-whole-cache/src/io/native-namespace.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/native-namespace.fasl")
   :BYTES 17954 :SHA256
   "786a3093604ce6984544d7272952fbea8a62548e9057868bab52fe2403d5a267")
  (:PATH "raw/core-R3-whole-cache/src/io/native.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/native.fasl")
   :BYTES 22514 :SHA256
   "18f96bc833e1705129c42ba71078e9ee8f7cdde0ea432887d16e7abc99451469")
  (:PATH "raw/core-R3-whole-cache/src/io/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/package.fasl")
   :BYTES 1383 :SHA256
   "398f28b586efbe21c4a470e7f25fbc58445f155cefdc739c39fcfab56835cd60")
  (:PATH "raw/core-R3-whole-cache/src/io/rename.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/rename.fasl")
   :BYTES 10588 :SHA256
   "45592a4f5b08b00d0b6cdb06df632fbdd6d6ff417849076d67d6d86174ca9408")
  (:PATH "raw/core-R3-whole-cache/src/io/transfer.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/transfer.fasl")
   :BYTES 16327 :SHA256
   "bf6d0b592cb401d28a6963b820f40cd347ebd9f6b995b822be0cb5e564076a3a")
  (:PATH "raw/core-R3-whole-cache/src/io/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/io/types.fasl")
   :BYTES 24346 :SHA256
   "0691e23f98166dfedb7a0666be57bcf33a208c9d7aa52ba8a4a2c6fdd475fbe5")
  (:PATH "raw/core-R3-whole-cache/src/mvcc/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/mvcc/package.fasl")
   :BYTES 1322 :SHA256
   "1a67c50a7a448acb46eae90b979c24277a32137380fcad0bf45d1c95a08c83a6")
  (:PATH "raw/core-R3-whole-cache/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 11955 :SHA256
   "cacc0c45b4e10268b1d94c418c2e33d6dab71270ffc13c0cec2357ed30236fb6")
  (:PATH "raw/core-R3-whole-cache/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 6281 :SHA256
   "4f249856e05093d3b83282f003cd2ddd54f708c00ff1230dca75000446c1d571")
  (:PATH "raw/core-R3-whole-cache/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 10492 :SHA256
   "5bf235a9c6f2f99553319df43bbcd74d03edf6b92e5d77101930474b1b37b201")
  (:PATH "raw/core-R3-whole-cache/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 13716 :SHA256
   "910a87ffbaf45bb8864dbbd4ef61e1bf4945aad1e32acfdc220671085b70cee2")
  (:PATH "raw/core-R3-whole-cache/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 10026 :SHA256
   "987df68c9a9b78117bb82e7fe1db6d5ab346965f210f774efefd5753b844706f")
  (:PATH "raw/core-R3-whole-cache/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 21792 :SHA256
   "84f16ea0b012984a1f694e4a5d6ae431b498fa16271502bd160e3bc8de47fcb6")
  (:PATH "raw/core-R3-whole-cache/src/mvcc/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/mvcc/types.fasl")
   :BYTES 1406 :SHA256
   "a93421111d6c5666c130dce9de7c98dd7d8d6034dda823ed6b785acb40eb5744")
  (:PATH "raw/core-R3-whole-cache/src/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/package.fasl")
   :BYTES 1418 :SHA256
   "e1aa9ddabe3f4f5d5c23beab00cf9de5c092734c553e363074df230810906551")
  (:PATH "raw/core-R3-whole-cache/src/read/core.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/read/core.fasl")
   :BYTES 6252 :SHA256
   "c302911a5087aca2d89793f3d644fcdd7d7b4e3986ae0012be043353d72cf358")
  (:PATH "raw/core-R3-whole-cache/src/read/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/read/package.fasl")
   :BYTES 1214 :SHA256
   "678dc71e0b301475cb15400c8ade7d997a648e04e4d0d850e9be783b45d684d5")
  (:PATH "raw/core-R3-whole-cache/src/read/task.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/read/task.fasl")
   :BYTES 14118 :SHA256
   "ac1d9fdaa1ec4fa7f4093fc8cb9183e2fe9958e095e898386525e80afed183b7")
  (:PATH "raw/core-R3-whole-cache/src/read/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/read/types.fasl")
   :BYTES 9790 :SHA256
   "64a1375b04587c089856620d3c564f53b280e70ce521de6fb6aaaa318ffee833")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/build.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/build.fasl")
   :BYTES 7775 :SHA256
   "dd196c22e502c8d0e995c297eeb96f130572219ca2789bc08b31dc5463bba6c3")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/closure.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/closure.fasl")
   :BYTES 5274 :SHA256
   "d2b655afb4b3e555eafd5841260082646666c79cfa68d7abad878bf5eb6f0bfc")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/frames.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/frames.fasl")
   :BYTES 8947 :SHA256
   "91579f2ce2823a253780e9a144c97ea5c0a01076e6cda36bfb8d497b5984cbe3")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/package.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/package.fasl")
   :BYTES 1967 :SHA256
   "3e4ebecc0aad20cffee42f5973385559991f96c20b99381517a952f1fe8adefe")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/publication.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/publication.fasl")
   :BYTES 4402 :SHA256
   "b90fb17f5a110a25f897961ee6bb7920df41564417c488156a6d0034b86b9d55")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/query.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/query.fasl")
   :BYTES 5374 :SHA256
   "ccc15d305c4e0b4fa877d08e347191a41568c1e482d7d5537a047e82afa50e03")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/read.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/read.fasl")
   :BYTES 5663 :SHA256
   "6dc09e8bceea96bb87b5f4ba3e834c6c32a3d83f961f954db76668011e228888")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/resolve.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/resolve.fasl")
   :BYTES 7630 :SHA256
   "7949f7a8f92f18a1f5d8c4fc2012b6b862ab53b6f86a89caf6f01c061c6c559f")
  (:PATH "raw/core-R3-whole-cache/src/recovery-active/types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery-active/types.fasl")
   :BYTES 18468 :SHA256
   "9c35e5692c97472de291b728a658bb1029f1c7bad020f9bfc103685193f7006e")
  (:PATH "raw/core-R3-whole-cache/src/recovery/decisions-build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/decisions-build.fasl")
   :BYTES 17741 :SHA256
   "3256ccc5907a2d2f111f9235cea84b679324c568d7c81cf072911b5848c9c146")
  (:PATH "raw/core-R3-whole-cache/src/recovery/decisions-package.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/decisions-package.fasl")
   :BYTES 1313 :SHA256
   "5ddb29bb8d0538a6d37652c1a25afde2d8209a7339a930f7c2c2976a37305f49")
  (:PATH "raw/core-R3-whole-cache/src/recovery/decisions-query.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/decisions-query.fasl")
   :BYTES 7494 :SHA256
   "654f3aded7c0b3da34d63254ecd29573abbfbc3a5bd27d1a5f08167eb74274ed")
  (:PATH "raw/core-R3-whole-cache/src/recovery/decisions-radix.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/decisions-radix.fasl")
   :BYTES 14802 :SHA256
   "8167696656a9a5eb5d205eb2d03496f6ab2221ff8be6bfc6aae2dcabeeba2052")
  (:PATH "raw/core-R3-whole-cache/src/recovery/decisions-sort.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/decisions-sort.fasl")
   :BYTES 14195 :SHA256
   "2f9e6ef721012636562b0c716a8e56f9a59bb78a11ed64139dc055e096ed96db")
  (:PATH "raw/core-R3-whole-cache/src/recovery/decisions-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/decisions-types.fasl")
   :BYTES 11092 :SHA256
   "783067dcec700d2cf060d5f4a9002d7ffc89b53d512c7a14457b3985ef828ab5")
  (:PATH "raw/core-R3-whole-cache/src/recovery/inventory-build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/inventory-build.fasl")
   :BYTES 14484 :SHA256
   "dcd0a5bf5185d63363bae0a677738fd0b3637ff9bef796e52ef1257a59a83943")
  (:PATH "raw/core-R3-whole-cache/src/recovery/inventory-query.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/inventory-query.fasl")
   :BYTES 3831 :SHA256
   "2e63fe43a50ab041b290624fe3a5ee42f514fc20efc81ce4cdb26a8bde795de8")
  (:PATH "raw/core-R3-whole-cache/src/recovery/inventory-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/inventory-types.fasl")
   :BYTES 14879 :SHA256
   "d385445b0803b004eaac0b966cf11fa18377404e85c62dedf8d744e058a48b72")
  (:PATH "raw/core-R3-whole-cache/src/recovery/manifest-build.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/manifest-build.fasl")
   :BYTES 15478 :SHA256
   "69eea9c3189b2611265142cb9f9b52c9a81b5f771160e2408c6c889883bbbaa3")
  (:PATH "raw/core-R3-whole-cache/src/recovery/manifest-decode.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/manifest-decode.fasl")
   :BYTES 10766 :SHA256
   "6d54c187662d6f9b561b9dc7ac14a622fa201c8faf1c8a6e6fca3c344d71b186")
  (:PATH "raw/core-R3-whole-cache/src/recovery/manifest-fold.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/manifest-fold.fasl")
   :BYTES 14563 :SHA256
   "e2a9e5e059b5c23a24ec75802f514ea319323c4f440f88ad7561c2c30ceaaf74")
  (:PATH "raw/core-R3-whole-cache/src/recovery/manifest-package.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/manifest-package.fasl")
   :BYTES 1782 :SHA256
   "a41b44ed56da3e7294ab061ebc8561fe30f64028d14357ae70a5dcf4cb06f0a1")
  (:PATH "raw/core-R3-whole-cache/src/recovery/manifest-query.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/manifest-query.fasl")
   :BYTES 6823 :SHA256
   "dce9122a8c59a3cd2f5b4becb76ab4548cd73e53724cff58434ce8abcae6bfd3")
  (:PATH "raw/core-R3-whole-cache/src/recovery/manifest-transition.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/manifest-transition.fasl")
   :BYTES 6644 :SHA256
   "78fbf4c5b1096aaf1f465473b5b7cb7547c54bc716e6205b883a5f1b94cc940a")
  (:PATH "raw/core-R3-whole-cache/src/recovery/manifest-types.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/manifest-types.fasl")
   :BYTES 30432 :SHA256
   "9b60ef265f463108d4df712b04a0d140f37d3955cdef444ef74a0edf152ba804")
  (:PATH "raw/core-R3-whole-cache/src/recovery/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/package.fasl")
   :BYTES 1356 :SHA256
   "4f01b23b7e348e3f1f51b44baaa71497b625f639d74175b1b18edbf1d675e4a7")
  (:PATH "raw/core-R3-whole-cache/src/recovery/scan.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/recovery/scan.fasl")
   :BYTES 25465 :SHA256
   "3303aef63a6ca0b7c866c5c7010698cce348068a22971c5dd2021913d3d27530")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/build.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/build.fasl")
   :BYTES 4117 :SHA256
   "c7cbcad3f88cb9126fbe910298bca1522d77fb7a08f11bb9368a8ec7f47b3bee")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/lifecycle-build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/lifecycle-build.fasl")
   :BYTES 6622 :SHA256
   "a4e7f3ca81933fb65f248597252bb8aeb7dae570e4084c764ad14a72cfc1f911")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/lifecycle-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/lifecycle-read.fasl")
   :BYTES 4505 :SHA256
   "1e0c1c31991db1850fdc8a427907359399983fffc05e2ddcfe4f64802f3476c4")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/lifecycle-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/lifecycle-types.fasl")
   :BYTES 13351 :SHA256
   "53472a89e950d8bd49c11ce0de5e2740c79144e53d6cdff69040a59eb8b87ce4")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/lifecycle-update.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/lifecycle-update.fasl")
   :BYTES 5742 :SHA256
   "a3637d761d5021c84afca7d0c2eb2c4aea1f07b80428ce64ac2edcca0782e8f0")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/lifecycle-worker.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/lifecycle-worker.fasl")
   :BYTES 3574 :SHA256
   "ce0d676f13513772448dd89fa2a2a05260d43434daa7f8aa7e633bf8ec57c0a5")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/package.fasl")
   :BYTES 1158 :SHA256
   "a0b32e1b227a9d81369bf28ca9de53528e4d7ed45ac5fa2a96391ab9c965e09a")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/policy.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/policy.fasl")
   :BYTES 4430 :SHA256
   "c7fb7f3e6a6c6cd0af02345797660531557d48a0fa8d5899e5cc602e7f54669e")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/pool-claim.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/pool-claim.fasl")
   :BYTES 2745 :SHA256
   "8383a0824bf1d240a3520dca518258687f60354384e8517fa707298f94790848")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/read.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/read.fasl")
   :BYTES 3347 :SHA256
   "68eca62656fb4f4d7de93891c5e392bed61fb12a645f5230b5936b4d24e20dbc")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/types.fasl")
   :BYTES 16622 :SHA256
   "fd519505a236ee3a35b6cb9397d94ba62166c1a9ab10c5d7c6a62a29722f0d56")
  (:PATH "raw/core-R3-whole-cache/src/scheduler/update.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/scheduler/update.fasl")
   :BYTES 4748 :SHA256
   "f118b7f2e4266bafca38345cf1e1d35b20309c4e0d9eba600568da81d41289d7")
  (:PATH "raw/core-R3-whole-cache/src/series/events.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/events.fasl")
   :BYTES 17576 :SHA256
   "928aab2ef48b3361c872a7b6457f52b94d2c715f21fd68ce4ba48fd706effdde")
  (:PATH "raw/core-R3-whole-cache/src/series/io-events.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/io-events.fasl")
   :BYTES 8406 :SHA256
   "2b1007cf5ba6a4e420ee4905857c8e8a2d71bbe6db108b2c3c276de43082d952")
  (:PATH "raw/core-R3-whole-cache/src/series/ownership.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/ownership.fasl")
   :BYTES 13676 :SHA256
   "88ece17b3e86b674932fee8fad821ab52a7ad0ff8fc643f2e1d2cf10bfd31014")
  (:PATH "raw/core-R3-whole-cache/src/series/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/package.fasl")
   :BYTES 1763 :SHA256
   "6ae7b7a48a6644d8b8e38d766d6303c05df833aab5725ce2793a08f12bc00ce9")
  (:PATH "raw/core-R3-whole-cache/src/series/publication.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/publication.fasl")
   :BYTES 14476 :SHA256
   "f6217a679f024ff43abcf31384a98d95de5ccbc2f6024f8f523b8c7633cf15af")
  (:PATH "raw/core-R3-whole-cache/src/series/query.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/query.fasl")
   :BYTES 6512 :SHA256
   "931991fec48d03ff878338560f234cdde5cded7935e06aae563390bae711ba2f")
  (:PATH "raw/core-R3-whole-cache/src/series/retirement.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/retirement.fasl")
   :BYTES 8228 :SHA256
   "6300b41d81701cf09566e1d495dada423c6b6a769dff4b7bcf7675ab2c3c8b4e")
  (:PATH "raw/core-R3-whole-cache/src/series/routing-build.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/routing-build.fasl")
   :BYTES 6431 :SHA256
   "9c24ddbbae8158f7c0c227f5771620506fd0c283472196fc5cd80f659e1b3ebc")
  (:PATH "raw/core-R3-whole-cache/src/series/routing-select.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/routing-select.fasl")
   :BYTES 6889 :SHA256
   "04d843f6135d6b67a808c34658f8c21c21a8215729be7167ecda4d5aef3dc215")
  (:PATH "raw/core-R3-whole-cache/src/series/routing-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/routing-types.fasl")
   :BYTES 9288 :SHA256
   "edd93c4ac74b84fe0ac0619076a2505923dd0c55851484c715f968d8f9fe7e6d")
  (:PATH "raw/core-R3-whole-cache/src/series/types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/types.fasl")
   :BYTES 34027 :SHA256
   "d6aeba15dd13339e89bd2567dd531a8c4c12b66c26284f537f5057ac04b213f6")
  (:PATH "raw/core-R3-whole-cache/src/series/worker-boundary.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/worker-boundary.fasl")
   :BYTES 7864 :SHA256
   "2f377f83d86dc81300339c893c0a48df1a0ed2c4971b4497d54f957e149df1e9")
  (:PATH "raw/core-R3-whole-cache/src/series/worker-package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/worker-package.fasl")
   :BYTES 1605 :SHA256
   "e22996df38aa23cd46b14685dbfe3884b1de37151d9ddfd35609be69a1ec194c")
  (:PATH "raw/core-R3-whole-cache/src/series/worker-run.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/worker-run.fasl")
   :BYTES 15276 :SHA256
   "de2150dfe47496abb5810305f08143735aec270e793c8a577d65e020db99def8")
  (:PATH "raw/core-R3-whole-cache/src/series/worker-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/series/worker-types.fasl")
   :BYTES 17282 :SHA256
   "79700f65d85f34562b8c8044456930173794715a1cc3c1a3c571db06a44cd7b8")
  (:PATH "raw/core-R3-whole-cache/src/storage/compaction-scan.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/storage/compaction-scan.fasl")
   :BYTES 8302 :SHA256
   "f1f87c3ae201de7ff0661f85d3a8fb6c6bef9fc24eb018172fb74acacbb36493")
  (:PATH "raw/core-R3-whole-cache/src/storage/control-payload.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/storage/control-payload.fasl")
   :BYTES 12148 :SHA256
   "acee2c937210aa4427c3a4bfdd0b5ee95e89100775f27a3fba9f3e38a8fd0c9a")
  (:PATH "raw/core-R3-whole-cache/src/storage/formats.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/storage/formats.fasl")
   :BYTES 8600 :SHA256
   "de8d85277e412edd8861766f047e5a18bc922b0d079ceff51925668c1cb67601")
  (:PATH "raw/core-R3-whole-cache/src/storage/log-header.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/storage/log-header.fasl")
   :BYTES 7988 :SHA256
   "3a6e677a6a892b14865f00481bdfbe007a5240b16adca6451bbd8278e7fc7310")
  (:PATH "raw/core-R3-whole-cache/src/storage/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/storage/package.fasl")
   :BYTES 1514 :SHA256
   "fd3de00e525a8c2a1490acd55c60013566f4e953daee7b7fd478c55d757c876a")
  (:PATH "raw/core-R3-whole-cache/src/storage/payload-record.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/storage/payload-record.fasl")
   :BYTES 6765 :SHA256
   "ea1046f7ebb7ce35ed2b2dfb95aae313f9c751ab720312b89ec56576f4adab5b")
  (:PATH "raw/core-R3-whole-cache/src/storage/payload-write.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/storage/payload-write.fasl")
   :BYTES 9565 :SHA256
   "00e072a52537f39777cb276a2394d96d3de656e091f1071a6244e3c8da9935c7")
  (:PATH "raw/core-R3-whole-cache/src/storage/segment-header.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/storage/segment-header.fasl")
   :BYTES 10328 :SHA256
   "9f503f692d17ef46c747947149b800efcfe0d10c857967c4628e261a4debffaf")
  (:PATH "raw/core-R3-whole-cache/src/wal/builder.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/wal/builder.fasl")
   :BYTES 14611 :SHA256
   "ff41e7df7b2d83528efc7b0c4d62ad1576839a4c3656fc0a5d1efb1c64f6433e")
  (:PATH "raw/core-R3-whole-cache/src/wal/csn.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/wal/csn.fasl")
   :BYTES 16451 :SHA256
   "17162ffe19639c831e9f39b7c225a77d58deab74b8aa07b9cfab165042c7c972")
  (:PATH "raw/core-R3-whole-cache/src/wal/executor.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/wal/executor.fasl")
   :BYTES 13818 :SHA256
   "9570c80261bcf73d82545d718d9bc186fb51933c607587522329a40301ce9fa5")
  (:PATH "raw/core-R3-whole-cache/src/wal/group.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/wal/group.fasl")
   :BYTES 11046 :SHA256
   "2db9dd8d8c6ade367aa3338416aa5b4de8ee2cc75f0279604e6d82b06f9676b4")
  (:PATH "raw/core-R3-whole-cache/src/wal/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/wal/package.fasl")
   :BYTES 2139 :SHA256
   "95f73585ec5a8dc507c30e97ecdf26afd8f8c0bb959e9ede163b9382b4782c28")
  (:PATH "raw/core-R3-whole-cache/src/wal/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/src/wal/types.fasl")
   :BYTES 38905 :SHA256
   "a6e8e782b353c861fba2c712a564f65f910e2e3a7aa729182bbc5d81edf6c69d")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-array-write-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-array-write-support.fasl")
   :BYTES 22696 :SHA256
   "e35aaf50ac48cff291fdcbac59f408d63d72757bc4afee359287d7049798b851")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-array-write-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-array-write-threads.fasl")
   :BYTES 11048 :SHA256
   "0851ef3e66ea73ed8ef123623b0c6819d7450894a66b60b4cb97d6f2c674601c")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-array-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-array-write.fasl")
   :BYTES 36683 :SHA256
   "fee6198cef7b301319db2d334e01dcb66ee6379737eccc78f62f2ba917b49aa3")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 30420 :SHA256
   "493689cc66ee3a744b63221035cb01d4ac4619c57cab5f1cc67c24a8811d895e")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 10560 :SHA256
   "df25374f19aec5335e9ad6cb721f18f3c3c30f7ae32464a8790f4855de26f52f")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 40133 :SHA256
   "0eba32fc98011cb92ca405fb731072b584c60f4e8b2753c78ef42906e8162902")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-header.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-header.fasl")
   :BYTES 22725 :SHA256
   "47fdca53f9372ede7da887a457f4f85c0b8ab3b35fae9fc7f6ebf73fc749fce5")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-map-write-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-map-write-support.fasl")
   :BYTES 23704 :SHA256
   "dbb367775bbf125f01b0124294c26353ed924991f786bcadb12426dbc3319223")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-map-write-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-map-write-threads.fasl")
   :BYTES 11026 :SHA256
   "f88213668c3ce394ff5c71edc94804fa08ff70720c1dfee5a9dbbed1277e9461")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-map-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-map-write.fasl")
   :BYTES 38952 :SHA256
   "33ad323b219290808dbb425670685bc1251caa0afa8e17e7aaef0d8d7dd00cc3")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 3153 :SHA256
   "48907ecf957d182f379b918a6eb6500ca30038ea72f511c8c25c41eb680c500e")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 30244 :SHA256
   "f428955c885beaa72fba0d0c664b8c7b421785a8c86f8be146629a9f24366e11")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 12095 :SHA256
   "b7ef9236845c3b61a98a8f6a91f2691f37dbd34441eb202b35a60e1f2b0a0439")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 33537 :SHA256
   "15a84029e7555c0b69d8293ea603604a259c314a3a892c7d52209c7b6fc2f806")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-minimal-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 23909 :SHA256
   "c3c7b304fef5a10a3ff020061e8731dee38b36b7612e1b2a3d6e5b2b7874c200")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-minimal-threads.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 9957 :SHA256
   "2e92d7857d0c6d828ab91aa5a55d98f407f15e62c7477fbbeb9916c949189bd8")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 24433 :SHA256
   "2efa5886cfdeb8bf70e087a3dbbbdc729d256118e6efcc0ddfe51d5c9e91a658")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 16663 :SHA256
   "075bd432eda2463916247f9c30f4815f17510e9c6bd0477ab72c33fc90c05a99")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 10501 :SHA256
   "5b316780226dc319069d0edb61c53bc916d3a0ad013866547e2fbcd7d73af509")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 23637 :SHA256
   "bdd2f09be61a14cef91525d6efa739c835a9af7443da62f24c2b3b6d1fe51b88")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 19602 :SHA256
   "b3b0fa1c4332b1b4ff9c7403d23bfe82b59de288031b2b41ac305b7fe226534c")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 10437 :SHA256
   "8d445ac4238dfba369a21901cba63419044c603ccf1aedb4616d060147434f24")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 28858 :SHA256
   "88980cf14f5c450d5719e417c8f4f007ee431ba7e4a75f75ea5f585b44f8e76e")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 34960 :SHA256
   "10a1265c8ae3ed2da51944dfeb6aac5dfe4a726cb896440a4648c6a226d8f50f")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 11832 :SHA256
   "dc8b1b1eed9d3852be77a26efdb84a0126d004dde607cb3039fd76b522c18d48")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-structure.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-structure.fasl")
   :BYTES 41695 :SHA256
   "a8bbf35d696cd554418f7ed9f1fc56d5118498bc51343204cacc1b9a22a67aaf")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-support.fasl")
   :BYTES 18151 :SHA256
   "3302ca551a325cb977770ed2d70a1872945d0263151253942126f9ce265b5d73")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-tag-write-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-tag-write-support.fasl")
   :BYTES 22748 :SHA256
   "fdeac4911fbd77ae15f99151ef9de1b7c38aadd4a9a4721fddb0ee1e100598ec")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-tag-write-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-tag-write-threads.fasl")
   :BYTES 10786 :SHA256
   "a6fac4e847124aeba547b0840e97fa972ce3eb159ff2848c0a8d65fa3b9fc7fd")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-tag-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-tag-write.fasl")
   :BYTES 34841 :SHA256
   "c84462ec77ed6dd7441932d57ffbc91121a0323510b0903e457c3f638c3d097c")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-threads.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-threads.fasl")
   :BYTES 10405 :SHA256
   "6e60da3a8f6b68fe1cf388c2473dd71158bab9b36798a04a5a5fe75930b3a6ca")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-write-roundtrip.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 2572 :SHA256
   "a2c960aa5d055e07a26427fd9071c72db21e19ff32b00e8cf6af2c7f9418908f")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 14028 :SHA256
   "48b205e09cefe407925d99a92f4d6a945c16ea16ce5457a6a687c4be2b5d8ac9")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 10559 :SHA256
   "e46f8c518b0da9411b2b683ca85a7d5073559c9c619e276733fe65cda6701ba9")
  (:PATH "raw/core-R3-whole-cache/tests/codec/cbor-write.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/cbor-write.fasl")
   :BYTES 19810 :SHA256
   "b6b0644261113b728240c91fc80b8b2cbe1f6ba9b8510ce0f2d55c60438ded58")
  (:PATH "raw/core-R3-whole-cache/tests/codec/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/support.fasl")
   :BYTES 17745 :SHA256
   "f747df11c26022ae2fef10aaa670f947cc30f65bc56a66f4b6d58e17b065daa9")
  (:PATH "raw/core-R3-whole-cache/tests/codec/threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/threads.fasl")
   :BYTES 9429 :SHA256
   "8b1073b8607ad26d56a7c46cf8b0fa0ac09b59d823be94f65b3bc135068f9317")
  (:PATH "raw/core-R3-whole-cache/tests/codec/utf8.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/codec/utf8.fasl")
   :BYTES 25388 :SHA256
   "3f04e65fd0405ba382fe0105fa30ee537dae6f1dcdff3e74ccd60c03023b073c")
  (:PATH "raw/core-R3-whole-cache/tests/control/native.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/control/native.fasl")
   :BYTES 151862 :SHA256
   "66476578269414fa944fdfaee6a4c42794c0deb268c7012204c19e0c2af9d142")
  (:PATH "raw/core-R3-whole-cache/tests/control/publication.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/control/publication.fasl")
   :BYTES 258144 :SHA256
   "d4f542f9222c0299986df2a25c470c46df222e5b03b327b6b91c02f4d211b6f4")
  (:PATH "raw/core-R3-whole-cache/tests/control/recovery-publication.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/control/recovery-publication.fasl")
   :BYTES 96693 :SHA256
   "1b205d094ffdfe8581f006a777f847c1a7456ab25e99c78ad01a2f16c721ff48")
  (:PATH "raw/core-R3-whole-cache/tests/control/recovery-read.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/control/recovery-read.fasl")
   :BYTES 144700 :SHA256
   "fc7d61b0acd192e2cdf61c3aff0c6380e4116a54e13a4055a4b20d0e103e92e1")
  (:PATH "raw/core-R3-whole-cache/tests/control/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/control/support.fasl")
   :BYTES 3966 :SHA256
   "5786b2921b3b317ee590b214e44c3a8c356e8e8a252c51ac2ab571e928eba806")
  (:PATH "raw/core-R3-whole-cache/tests/csn/registry.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/csn/registry.fasl")
   :BYTES 50847 :SHA256
   "b24c8208a01a1b1acad294dbe74238e94705926e81c8f0414a85fd6d28ad0b47")
  (:PATH "raw/core-R3-whole-cache/tests/csn/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/csn/support.fasl")
   :BYTES 40008 :SHA256
   "1715fd450ba32f876558fd16fb766fd36b70af4a750787b7786851ec49630d9b")
  (:PATH "raw/core-R3-whole-cache/tests/csn/threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/csn/threads.fasl")
   :BYTES 22688 :SHA256
   "b863317e5183c09ce3ad437a1f373496aa6257b86e2b15d0632187c24d49a8d4")
  (:PATH "raw/core-R3-whole-cache/tests/epochs/lifecycle.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/epochs/lifecycle.fasl")
   :BYTES 74001 :SHA256
   "81d08d485a7835068744cabd66b107dec3bf3290e1ae2b80e5589aff18bf185c")
  (:PATH "raw/core-R3-whole-cache/tests/epochs/support.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/epochs/support.fasl")
   :BYTES 35879 :SHA256
   "c772be62402bff44e81448b401d1ed3db2f289219a6d966c4910cec93295ca97")
  (:PATH "raw/core-R3-whole-cache/tests/epochs/threads.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/epochs/threads.fasl")
   :BYTES 10436 :SHA256
   "8d4ad6b04d72840dd2cd95219f46e12875df404dfc0ee55580b4f1f5a0195242")
  (:PATH "raw/core-R3-whole-cache/tests/execution/handoff.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/execution/handoff.fasl")
   :BYTES 90800 :SHA256
   "bb6c8eefec9266cb897ce380b88460f5a7ae1f902099d729006311661119bd65")
  (:PATH "raw/core-R3-whole-cache/tests/execution/queue.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/execution/queue.fasl")
   :BYTES 40351 :SHA256
   "609f406e5b785aaa57bb0b61224a6d5d231d6d9e97541dbe3af25abff42a8e7d")
  (:PATH "raw/core-R3-whole-cache/tests/execution/ready-recycle.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/execution/ready-recycle.fasl")
   :BYTES 67068 :SHA256
   "9a3c91271434152a6145d0d5581f2d617b0591bcd53eca7b5f5b0e63a225ac0a")
  (:PATH "raw/core-R3-whole-cache/tests/execution/ready.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/execution/ready.fasl")
   :BYTES 82284 :SHA256
   "e81602be49699070b81edaee1f8a1134169b502cf1b53e04f395eb69774bfc0e")
  (:PATH "raw/core-R3-whole-cache/tests/execution/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/execution/support.fasl")
   :BYTES 16072 :SHA256
   "95bea0fd9b194958276bcfda3ca6739559853a8412319a198da210d7b4626da0")
  (:PATH "raw/core-R3-whole-cache/tests/execution/threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/execution/threads.fasl")
   :BYTES 32792 :SHA256
   "bd6a978bb778ab2846edac8fa53983048e813d4d08acedd866b45f46309aa6fb")
  (:PATH "raw/core-R3-whole-cache/tests/execution/worker.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/execution/worker.fasl")
   :BYTES 158284 :SHA256
   "604a2c3ad05e423234a4d9d46d81b6ce9c0ab3b4e396a5fb7f4f4594983f30ed")
  (:PATH "raw/core-R3-whole-cache/tests/foundation/batch.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/foundation/batch.fasl")
   :BYTES 19007 :SHA256
   "09273bc570dcd6cacd4cb6425a73b284127b7f88b1209c09138fa6e02476f411")
  (:PATH "raw/core-R3-whole-cache/tests/foundation/binary.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/foundation/binary.fasl")
   :BYTES 15575 :SHA256
   "16630695022ce579c11e7db540d9f05b0a778b5785f0fad0c0b3c7d401a567cc")
  (:PATH "raw/core-R3-whole-cache/tests/foundation/record.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/foundation/record.fasl")
   :BYTES 59130 :SHA256
   "425f39d8c83a6a9548645647018c4ea75a781d8d99d2d39c38116cc9c1f75942")
  (:PATH "raw/core-R3-whole-cache/tests/foundation/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/foundation/support.fasl")
   :BYTES 10289 :SHA256
   "720c23c12e229a9fa00f0814d1391c4bbb78055819e63a90ce165eab877952ce")
  (:PATH "raw/core-R3-whole-cache/tests/get-active/construction.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-active/construction.fasl")
   :BYTES 80711 :SHA256
   "95d599c1f7d1db3b48b982e54e0e6a19cafe79e5e62c012e65b8ccd2f6fd3f43")
  (:PATH "raw/core-R3-whole-cache/tests/get-active/directory.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-active/directory.fasl")
   :BYTES 29473 :SHA256
   "7e24f7a56b48eb95339f5830ad1120d4d5b5f5f5c0b76d8afe6d31abb4fa0336")
  (:PATH "raw/core-R3-whole-cache/tests/get-active/preflight.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-active/preflight.fasl")
   :BYTES 72404 :SHA256
   "2d51ee3461b36c2483997051c3e3962c98e2b0db1caa24634479186e50913986")
  (:PATH "raw/core-R3-whole-cache/tests/get-active/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-active/read.fasl")
   :BYTES 110779 :SHA256
   "72fbb7afffdfbd90a4282cbc8df91474795b7c99f3c628f0979dc2bc5a6842d2")
  (:PATH "raw/core-R3-whole-cache/tests/get-active/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-active/support.fasl")
   :BYTES 179848 :SHA256
   "28087e1705a0930b515fdd388c3dc61335886864a30405e28a09684320de57d4")
  (:PATH "raw/core-R3-whole-cache/tests/get-directory/construction.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-directory/construction.fasl")
   :BYTES 40555 :SHA256
   "38ec0355d3949999c1c52d400ba231836bc2a092f07b98291519ee6ab9aa2adf")
  (:PATH "raw/core-R3-whole-cache/tests/get-directory/lifetime-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-directory/lifetime-support.fasl")
   :BYTES 26866 :SHA256
   "eafbb8d44fb4771ecb8ca1f336c36c85d6870e5aae207ec337efa7ea77ad4b09")
  (:PATH "raw/core-R3-whole-cache/tests/get-directory/lifetime.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-directory/lifetime.fasl")
   :BYTES 69132 :SHA256
   "f80cbba6c8ec51aaba244fc58adda96e2767b256472e10ce29daa58597462c20")
  (:PATH "raw/core-R3-whole-cache/tests/get-directory/read.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-directory/read.fasl")
   :BYTES 65633 :SHA256
   "c7f92c13509e5d5c577a741b65445da959f3e52c10be42f59c25d13b03690007")
  (:PATH "raw/core-R3-whole-cache/tests/get-directory/series-read.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-directory/series-read.fasl")
   :BYTES 243998 :SHA256
   "8d2608038a69454fc3238d6b59846e654b624911199370435cf047cbb1874051")
  (:PATH "raw/core-R3-whole-cache/tests/get-directory/series-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-directory/series-support.fasl")
   :BYTES 116833 :SHA256
   "f4dd05d35f30a3f1ce7017e9ff08c730380d17566f6155eed23ca67d2ae525e7")
  (:PATH "raw/core-R3-whole-cache/tests/get-directory/support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-directory/support.fasl")
   :BYTES 133883 :SHA256
   "453a77e8e98ef62e91143ee1dd3ded1c93bf3c4529f9b6d756bf21654a08441a")
  (:PATH "raw/core-R3-whole-cache/tests/get-directory/threads.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-directory/threads.fasl")
   :BYTES 15456 :SHA256
   "7930f16994968abda74326a714b6fb1d5ff3b86999e517da0e0a0e0ae3eb6d2f")
  (:PATH "raw/core-R3-whole-cache/tests/get-performance/guards.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-performance/guards.fasl")
   :BYTES 19333 :SHA256
   "6eed1badc7143569e3737ce6621ee16d94d3aa3ad6b973a50d39e7098c4baa13")
  (:PATH "raw/core-R3-whole-cache/tests/get-performance/paths.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-performance/paths.fasl")
   :BYTES 15884 :SHA256
   "05d34ebd7e3721f7510e13962524b8370984cd649e7f5b422cc25f1aa52c8f9e")
  (:PATH "raw/core-R3-whole-cache/tests/get-performance/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-performance/support.fasl")
   :BYTES 114338 :SHA256
   "19669b472ff3da44df671ab8c94a0207850ace60a0bd09b36cbf2f36df1c3d26")
  (:PATH "raw/core-R3-whole-cache/tests/get-performance/threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-performance/threads.fasl")
   :BYTES 10498 :SHA256
   "fd335c19ae695cc015c07048ab6ea413fd282b22fcdbc17970efb52789e30831")
  (:PATH "raw/core-R3-whole-cache/tests/get-resolver/construction.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-resolver/construction.fasl")
   :BYTES 56497 :SHA256
   "5bd097d9d292ae5e787fa0bc3e619492f19c7d6bff27d0d948c25036247f61d2")
  (:PATH "raw/core-R3-whole-cache/tests/get-resolver/read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-resolver/read.fasl")
   :BYTES 122930 :SHA256
   "756eeeddedb9a7ca54bb86a6f7ab773b769fd702c0b77128863e5ac93df359cd")
  (:PATH "raw/core-R3-whole-cache/tests/get-resolver/sort.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-resolver/sort.fasl")
   :BYTES 31291 :SHA256
   "8dc1c1e8e1ea0073bb418ccf4d3f0a9767e8b499d386d1a1cf6d8139a9d06ffd")
  (:PATH "raw/core-R3-whole-cache/tests/get-resolver/support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get-resolver/support.fasl")
   :BYTES 130408 :SHA256
   "4322295e9b11b10a2032ea3b37662dbd1003a4c30d07b23c3cf5ce9339b8d099")
  (:PATH "raw/core-R3-whole-cache/tests/get/lifecycle.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get/lifecycle.fasl")
   :BYTES 86083 :SHA256
   "a8b659208685786c8b5e5e81e66a8d05114951a0e993df4efaa241f61de77bb3")
  (:PATH "raw/core-R3-whole-cache/tests/get/segment.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get/segment.fasl")
   :BYTES 64584 :SHA256
   "f64a01a0f60612c493434e8a46af490e6841bacbf1b9f2e26357286f61e9c6b9")
  (:PATH "raw/core-R3-whole-cache/tests/get/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/get/support.fasl")
   :BYTES 56083 :SHA256
   "b0afeaa830e899aafcaf291185c859639422d359ad4101fcfcae8cbff45e09fd")
  (:PATH "raw/core-R3-whole-cache/tests/hash/guards.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/hash/guards.fasl")
   :BYTES 4823 :SHA256
   "9e898a1c68aca8e10bade5666a007e873e2166e7d611b6dd2db0a6d2533f49d0")
  (:PATH "raw/core-R3-whole-cache/tests/hash/hash64.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/hash/hash64.fasl")
   :BYTES 37250 :SHA256
   "e1ce2d2e531e85a072c73579d2c1985a725a0a4bc238f1aafa4f96ef68dbcd73")
  (:PATH "raw/core-R3-whole-cache/tests/hash/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/hash/support.fasl")
   :BYTES 46861 :SHA256
   "4118a696edcf919f1991965060abc6627be3aeeae008245e390b89f928263b02")
  (:PATH "raw/core-R3-whole-cache/tests/hash/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/hash/threads.fasl")
   :BYTES 14686 :SHA256
   "0c47f69c28fa76f67e7c5d51175a912793dc4fc28832e70ae939d5de923a8ef7")
  (:PATH "raw/core-R3-whole-cache/tests/index/hash-digests.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/index/hash-digests.fasl")
   :BYTES 149745 :SHA256
   "be44dfe600c2b4f1a1129754e151dd30a6f708373b7e5ce437a88a4383f63983")
  (:PATH "raw/core-R3-whole-cache/tests/index/primary-support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/index/primary-support.fasl")
   :BYTES 55227 :SHA256
   "b7a1051f8631b5a1801f55bd2ecacd76443606a9df2ad97ecffae2fa3de2b291")
  (:PATH "raw/core-R3-whole-cache/tests/index/primary-threads.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/index/primary-threads.fasl")
   :BYTES 54615 :SHA256
   "a0548b249b81df70dc1a71eacc9fd34d86f91538dba7ffde07b7542f5345a54b")
  (:PATH "raw/core-R3-whole-cache/tests/index/primary.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/index/primary.fasl")
   :BYTES 143095 :SHA256
   "4ee49fff6bad0085144d56d984bc48c72abcd8d17391816cb03d2d6d75b77cee")
  (:PATH "raw/core-R3-whole-cache/tests/index/rebuild.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/index/rebuild.fasl")
   :BYTES 135893 :SHA256
   "1d70d014b46ff1c7450d3198d6ac2fa3ee454afa13bd66ddb5303ed9e5370aa9")
  (:PATH "raw/core-R3-whole-cache/tests/index/slot-support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/index/slot-support.fasl")
   :BYTES 48241 :SHA256
   "733962317309006ceb91dbba88fb77e67fa54ccf96c42d4d1168edc702ad4d52")
  (:PATH "raw/core-R3-whole-cache/tests/index/slot-threads.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/index/slot-threads.fasl")
   :BYTES 52741 :SHA256
   "b39180112e5b975cdf8e85188eecdcee3389be181337a9f51d2ecd8cace44691")
  (:PATH "raw/core-R3-whole-cache/tests/index/slots.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/index/slots.fasl")
   :BYTES 148218 :SHA256
   "8a0663989a4f00496e57259e725e9c06960b207edd2d36d929686618a0bf5a31")
  (:PATH "raw/core-R3-whole-cache/tests/io/flush-failure.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/io/flush-failure.fasl")
   :BYTES 34590 :SHA256
   "dddd974b531c4a19f91d5bf2f6610d78d8b58069000e501de3fc81f6e61e0f4e")
  (:PATH "raw/core-R3-whole-cache/tests/io/native.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/io/native.fasl")
   :BYTES 34334 :SHA256
   "bea926d98dd373f0077d1df20ce85b5cbaeb083c024dbe6cd05be2b8d8e0d893")
  (:PATH "raw/core-R3-whole-cache/tests/io/rename-native.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/io/rename-native.fasl")
   :BYTES 126308 :SHA256
   "fd27a17b9479995960cbfb60d48dd8eb028c8bcc8c4406525387b3c10a1a9814")
  (:PATH "raw/core-R3-whole-cache/tests/io/rename.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/io/rename.fasl")
   :BYTES 110064 :SHA256
   "bb168d73ad257f8b9a51e6870dd2194630c355ec1da93ebd4f9ba4006623d39e")
  (:PATH "raw/core-R3-whole-cache/tests/io/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/io/support.fasl")
   :BYTES 16082 :SHA256
   "12aac7a1c7cd28a5580f1514fbc1e15abd4b57f3974d14833b39db2b6789ddb2")
  (:PATH "raw/core-R3-whole-cache/tests/io/transfer-failure.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/io/transfer-failure.fasl")
   :BYTES 25960 :SHA256
   "403239f89cdba46a48ca727cba77dc1e12046bfec1e3f16e65aa927d18f0a43d")
  (:PATH "raw/core-R3-whole-cache/tests/io/transfer.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/io/transfer.fasl")
   :BYTES 53187 :SHA256
   "32be9ef25786e23bc3939bd8f2e342b7fd941ce6e903ebab2ce0b5f8045ec392")
  (:PATH "raw/core-R3-whole-cache/tests/mvcc/capture.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/mvcc/capture.fasl")
   :BYTES 48575 :SHA256
   "24a7bf3fc4fdf025f04536914e7eea0390157c439a418b3a01fda22120515e78")
  (:PATH "raw/core-R3-whole-cache/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 89157 :SHA256
   "07131636a3e18b055f01c5815cd05256dae866e20a6e8d290edc3067fa85892c")
  (:PATH "raw/core-R3-whole-cache/tests/mvcc/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/mvcc/support.fasl")
   :BYTES 38358 :SHA256
   "66be4595886ccd98abfc8d9d65a995254576afe7a0922786f4396ef845ceaee2")
  (:PATH "raw/core-R3-whole-cache/tests/read/lifecycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/read/lifecycle.fasl")
   :BYTES 122302 :SHA256
   "90320b2afa38a69e0973311a7b4e867ff3c18373ef434fd95847bf2b697d4b54")
  (:PATH "raw/core-R3-whole-cache/tests/read/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/read/support.fasl")
   :BYTES 20936 :SHA256
   "4543691b60a93be6988a1dc52c7865fab812cf2c2234a84ccfcad7f19743e103")
  (:PATH "raw/core-R3-whole-cache/tests/read/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/read/threads.fasl")
   :BYTES 16898 :SHA256
   "d4cc854d461987b697ba0426033eb9abe5919d9c38823dbde3fa5e1e5aa546ca")
  (:PATH "raw/core-R3-whole-cache/tests/recovery-active/guards.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery-active/guards.fasl")
   :BYTES 32872 :SHA256
   "f7c0747992a07257a42fc1461ad5040566607448d2e48a3525928a9682068b49")
  (:PATH "raw/core-R3-whole-cache/tests/recovery-active/publication.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery-active/publication.fasl")
   :BYTES 23782 :SHA256
   "6f8b1526c79033d69554c2f444ddb303b3ed8cfcdf827240675e97697f5ee9cb")
  (:PATH "raw/core-R3-whole-cache/tests/recovery-active/semantics.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery-active/semantics.fasl")
   :BYTES 24457 :SHA256
   "29ef2f32cca7d37efcd7684eb015fc9d3abfc4d0f9e01e07ada58e8e5155844b")
  (:PATH "raw/core-R3-whole-cache/tests/recovery-active/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery-active/support.fasl")
   :BYTES 73722 :SHA256
   "150945b4e92e3f79db0b8eff6d4c25306d656505bd6183a30dc4f6483932d95b")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/corruption.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/corruption.fasl")
   :BYTES 13106 :SHA256
   "e5d0b769b14c6f25b9d8bc2bb0f16d180fe2a1b6f390fd0bb32df212824d4186")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 34022 :SHA256
   "68a9fef35efbb113e904454d1b4931515fe25ba6d6527e37d8bca460d2362d70")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 69392 :SHA256
   "7868e9a9641f9b3ac0b20ffdef2505a5729cf495553a5cb2fda8b6bf711eeed0")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/decisions-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/decisions-support.fasl")
   :BYTES 16632 :SHA256
   "ec46a7b2ae8d021c4bc024f5b9340dcc2b9d025dd5f02165e7ddc3a524095d8f")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/decisions.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/decisions.fasl")
   :BYTES 57607 :SHA256
   "7e6edde25f169820b60ed5b8d0e4c9b55dd22bc6c2e50e0bcd7f7cc7ec0dba31")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/inventory-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/inventory-support.fasl")
   :BYTES 20603 :SHA256
   "4a4eea740f9912172011d06e0cadc950d89885f52aa0bdcdbcd1ddaf0a232639")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/inventory.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/inventory.fasl")
   :BYTES 37721 :SHA256
   "37a8739d757f6ba72f79f96d3cdfd5ffe9520a6388b73ba747ab2a49e238935f")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 47979 :SHA256
   "fdd2b11da9cb3d81e379cd22fbc894a1fe44ab91a06f7b4a6ddf390996c26bf0")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/manifest-support.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/manifest-support.fasl")
   :BYTES 24117 :SHA256
   "618f78c32c39ab196bcd94be9c27d4c50e98483008bf731062ae2f89525c2551")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/manifest-transition.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/manifest-transition.fasl")
   :BYTES 63037 :SHA256
   "745050e35a010f849c8526a05ebce47b37ec32a2bc28cfbb5c186c07bf6f9ca0")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/manifest.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/manifest.fasl")
   :BYTES 33944 :SHA256
   "eba85844ae216ed8f06e5f822b8c85c1b125ef692bbff62cdf6647b301fdcbf9")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/scan.fasl")
   :BYTES 52960 :SHA256
   "6628e5076c95f5e61636ddefd9fcde6cce1c871f6d4d4e78663e400f827af65e")
  (:PATH "raw/core-R3-whole-cache/tests/recovery/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/recovery/support.fasl")
   :BYTES 17920 :SHA256
   "322f16ea90a5f57a2ba963be4706d283592a640d2c60ea8fa80312436513a163")
  (:PATH "raw/core-R3-whole-cache/tests/scheduler/controller.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/scheduler/controller.fasl")
   :BYTES 48551 :SHA256
   "bbb494f72f7350549fdaa1abfdd6e75956f156b7d0df4ce3538ca72669b2e93b")
  (:PATH "raw/core-R3-whole-cache/tests/scheduler/dispatch.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/scheduler/dispatch.fasl")
   :BYTES 64711 :SHA256
   "c7c1014335b125b41edf3e43fbfd97e7d67afbb394ebe25e21408a11d5b3f4d5")
  (:PATH "raw/core-R3-whole-cache/tests/scheduler/lifecycle.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/scheduler/lifecycle.fasl")
   :BYTES 96610 :SHA256
   "d2fd642e9471d2dbbb6045f8028aa62ffa4c0ec2394e2c64beb36db4a3bf21ee")
  (:PATH "raw/core-R3-whole-cache/tests/scheduler/pool-begin.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/scheduler/pool-begin.fasl")
   :BYTES 59530 :SHA256
   "f900a789e3c38b8d8bea036cdb2d31bb332be2f9913cf24f9c5563ddec0949ec")
  (:PATH "raw/core-R3-whole-cache/tests/scheduler/pool-claim.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/scheduler/pool-claim.fasl")
   :BYTES 42928 :SHA256
   "e20c0a1e691bc11b7b07ebbd4b6be056f5fd9b4f7133e564e81afa25f00dfa6f")
  (:PATH "raw/core-R3-whole-cache/tests/scheduler/pool-recycle.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/scheduler/pool-recycle.fasl")
   :BYTES 52638 :SHA256
   "73a9ca525368e05a9facd61ee4bc6d7220e8221be41535bfbd0b9efc812d575d")
  (:PATH "raw/core-R3-whole-cache/tests/scheduler/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/scheduler/support.fasl")
   :BYTES 10748 :SHA256
   "21add841f0d4bbc347490512f68faa906d9b1846ee0ffe4ab760a1eacd238a22")
  (:PATH "raw/core-R3-whole-cache/tests/series/boundaries.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/series/boundaries.fasl")
   :BYTES 10737 :SHA256
   "0ef6dceb89081aa8b85c920d102f3ea712ce888abcd9aaef093f61178b2554e8")
  (:PATH "raw/core-R3-whole-cache/tests/series/controller.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/series/controller.fasl")
   :BYTES 165194 :SHA256
   "babe68c9aa5fe40bc12aadf841df1c9c8576babb666391f345d2baba0faf9a63")
  (:PATH "raw/core-R3-whole-cache/tests/series/support.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/series/support.fasl")
   :BYTES 96230 :SHA256
   "00540f7fbdf6544c365b9f16775ef256ca6d026c57c256d490849aa12f09f6bb")
  (:PATH "raw/core-R3-whole-cache/tests/series/threads.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/series/threads.fasl")
   :BYTES 44967 :SHA256
   "0b2886e2521a1345b9743d10d5ca039a9b99a61ecc0375da676f751b2f2add7b")
  (:PATH "raw/core-R3-whole-cache/tests/series/worker-bridge.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/series/worker-bridge.fasl")
   :BYTES 111081 :SHA256
   "e207c5c64341d6c2bb9426854dc38ad017be202a769df5f4d4b5ed10660831b4")
  (:PATH "raw/core-R3-whole-cache/tests/series/worker-routing.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/series/worker-routing.fasl")
   :BYTES 64497 :SHA256
   "61ab3298c366d120565723344c2a57683d04d063e59a1cfa7eca3bcbe3657580")
  (:PATH "raw/core-R3-whole-cache/tests/smoke.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/smoke.fasl")
   :BYTES 3302 :SHA256
   "2ae8a94fe1db0b587166de7f560164b1fbae61e719e78804ac79b51f11a0d5c5")
  (:PATH "raw/core-R3-whole-cache/tests/storage/compaction-scan.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/storage/compaction-scan.fasl")
   :BYTES 35516 :SHA256
   "6f669bd175ff6a11b1b24c5e42a6ff68a27e6df6f045873f0037f48a631a8e3e")
  (:PATH "raw/core-R3-whole-cache/tests/storage/control-payload.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/storage/control-payload.fasl")
   :BYTES 59369 :SHA256
   "cb49bf687efad89f07ce37bcb58730ce26c1352f45d5902a848b483deee31474")
  (:PATH "raw/core-R3-whole-cache/tests/storage/log-header.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/storage/log-header.fasl")
   :BYTES 36655 :SHA256
   "d13e03610849ef306e9a801b865fb78b6f96b6871e7755e81a9f202130f32194")
  (:PATH "raw/core-R3-whole-cache/tests/storage/segment-header.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/storage/segment-header.fasl")
   :BYTES 18234 :SHA256
   "af56d7c5856e9a38766efd8d49cb83f13f682766adfc53f979eb4f76c27140ca")
  (:PATH "raw/core-R3-whole-cache/tests/storage/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/storage/support.fasl")
   :BYTES 13736 :SHA256
   "1a1e5c6d6b8d5e75c19a7fec2f1aa37947c8a8e3e0df37380d6b5416d47847be")
  (:PATH "raw/core-R3-whole-cache/tests/wal/builder.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/wal/builder.fasl")
   :BYTES 17412 :SHA256
   "8b3a053c2083b5540a8a4feba1c17284ee97370d26d80abc5abc767bdff2e722")
  (:PATH "raw/core-R3-whole-cache/tests/wal/csn-threads.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/wal/csn-threads.fasl")
   :BYTES 27304 :SHA256
   "b5f47c522cc535cbfd3f52329fdf5d2f74616b648ca504416168e31cb715c134")
  (:PATH "raw/core-R3-whole-cache/tests/wal/csn.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/wal/csn.fasl")
   :BYTES 167884 :SHA256
   "4d299cc28337af5bb7de31f4c7832d37e332f3f4630d1c598410620d792616cf")
  (:PATH "raw/core-R3-whole-cache/tests/wal/fault.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/wal/fault.fasl")
   :BYTES 28714 :SHA256
   "31eecf5bce2f9deaffcbce896efcc5134a2a27d3496d2123cb92f0d001566318")
  (:PATH "raw/core-R3-whole-cache/tests/wal/group.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/wal/group.fasl")
   :BYTES 25488 :SHA256
   "db11e1707a871ee578122dd45b0b9b7cf827ec6f8f5a660b09c046c0da6eaf38")
  (:PATH "raw/core-R3-whole-cache/tests/wal/native.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/wal/native.fasl")
   :BYTES 9855 :SHA256
   "fbc2cf5e46820901532bd953c0af4828d8a2bc90fecad1d91f00c2c2409fed58")
  (:PATH "raw/core-R3-whole-cache/tests/wal/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-R3-fasl/tests/wal/support.fasl")
   :BYTES 8034 :SHA256
   "a6c3271b5d348b790ace6e3b77590f79ca425a3fbcc1baf161d077b1d66af824")
  (:PATH "raw/counter-947/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073593-command-73467-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "79e305789845801f3ef00dc939ba24cbdebedb3fd97a12d2ff4454a7bcf73fb9")
  (:PATH "raw/counter-947/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073593-command-73467-0/report.lisp")
   :BYTES 318801 :SHA256
   "3cfc9ff2956376b0b0f36d6ae6088bc649d459e7153b45cb80f12f6523725b40")
  (:PATH "raw/counter-b92/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073674-command-80020-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "0e882176612c912e8c5a7aee1632ac1701ef6e935d3030a0c461bdc0d84e7648")
  (:PATH "raw/counter-b92/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073674-command-80020-0/report.lisp")
   :BYTES 318801 :SHA256
   "0c30a2b6dc31ae650ff7faa6b225bb607a3f3d6f46ce5dd82abf6004203a388a")
  (:PATH "raw/counter-runtime/count-94719b4.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-count-runtime/count-94719b4.lisp")
   :BYTES 122372 :SHA256
   "098b412d749cd623572021b583532c28b987caa800c1c3f97bdaf40c09bd36dc")
  (:PATH "raw/counter-runtime/count-F3-wrapper.stderr.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-count-runtime/count-F3-wrapper.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/counter-runtime/count-F3-wrapper.stdout.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-count-runtime/count-F3-wrapper.stdout.log")
   :BYTES 406 :SHA256
   "963ee4acd389c891f429e2ad0e9eb162c1cd97bcecd3237f28cb1e6970171e18")
  (:PATH "raw/counter-runtime/count-b92c1a2.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-count-runtime/count-b92c1a2.lisp")
   :BYTES 122372 :SHA256
   "19e1c09d6ac24bd9c6bdc93e0ca3e4b743eeb17bfcf403a869712bef20e75958")
  (:PATH "raw/counter-runtime/count-wrapper.stderr.log" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-count-runtime/count-wrapper.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/counter-runtime/count-wrapper.stdout.log" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-count-runtime/count-wrapper.stdout.log")
   :BYTES 406 :SHA256
   "4526bc0c6059fc1ab7fd567d83c469d678c108392a77d033977421b282147556")
  (:PATH "raw/counter-source/count-tests.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-audit-tools/count-tests.lisp")
   :BYTES 14296 :SHA256
   "1cb93fc4901faefaa66fdfe4207f012f51f683f8ab622ec5a25a92aa4512541e")
  (:PATH "raw/full-semantic-b92/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074229-command-13693-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "13256feeb3b439cd743c166b5132748dcc251433604c5aa7747de00091fc1e09")
  (:PATH "raw/full-semantic-b92/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074229-command-13693-0/report.lisp")
   :BYTES 425222 :SHA256
   "0319125210e59b9a2dfd18303f49ba59529c6a1d935f4734fd8cd65a34380d2c")
  (:PATH "raw/names-b92-qualified/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074377-command-21075-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "e1fa10e3e65fc8a56acda289a2416cd562023138bc56b7637cdd65de25163635")
  (:PATH "raw/names-b92-qualified/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074377-command-21075-0/report.lisp")
   :BYTES 195203 :SHA256
   "f2e2b4e1ce11861ab9a30966f8b2262fa0aaa4e6b89acd272cde2a44e6dd93d3")
  (:PATH "raw/names-initial-reader-failure/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074241-command-14160-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "b47ddbcbbda1450db294bfe7b99e956249d2fed5670adae0ffbd6d55996394da")
  (:PATH "raw/names-initial-reader-failure/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074241-command-14160-0/report.lisp")
   :BYTES 197866 :SHA256
   "c78a5f4b8619881a33bef1b84bdcaa9706f31dbaf52f8d2cb0dd8775bfa5e854")
  (:PATH "raw/names-source/names-audit.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-name-tools/names-audit.lisp")
   :BYTES 3105 :SHA256
   "457c94fb93c43270a9f031fc14d4ad97677400ba21e624e9cbd3fb1ca8da4ffc")
  (:PATH "raw/publication-source/audit-batch.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-tools/audit-batch.lisp")
   :BYTES 26411 :SHA256
   "d17564b38f51cd54e7ae86241c82c0eaa81a41bc9a29ecc70a6f937d59d59173")
  (:PATH "raw/publication-source/batch-sha.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-tools/batch-sha.lisp")
   :BYTES 5787 :SHA256
   "130f428551e1aa17a946c2614db5dc14adf9ae35309ec2b21c3be5b2d59be1da")
  (:PATH "raw/publication-source/collector-batch.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-publication-tools/collector-batch.lisp")
   :BYTES 24309 :SHA256
   "e6b2cdecbe1bf1602109161b07c7ce51c6716323238dea10e8f9cb7a96a4facf")
  (:PATH "raw/reader-fixtures/completion-exit/isolated-build.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-reader-self-test-83562-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-fixtures/completion-exit/stderr.log" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-reader-self-test-83562-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-fixtures/completion-exit/stdout.log" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-reader-self-test-83562-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-fixtures/report.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-reader-self-test-83562-0/report.lisp")
   :BYTES 2015 :SHA256
   "1e8bdb3e7c6173646452ebe5952b4acf6d08ea790fd9243f377fcdfadc7608b5")
  (:PATH "raw/reader-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-reader-self-test-83562-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-fixtures/signal/stderr.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-reader-self-test-83562-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-fixtures/signal/stdout.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-reader-self-test-83562-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/semantic-runtime/full-R3-audit.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-runtime/full-R3-audit.lisp")
   :BYTES 224114 :SHA256
   "bf403aed0d685c308de812ad89f05936259c3409b03e1c1f5689e3ca21c3ca68")
  (:PATH "raw/semantic-runtime/full-R3-audit.stderr.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-runtime/full-R3-audit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/semantic-runtime/full-R3-audit.stdout.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-runtime/full-R3-audit.stdout.log")
   :BYTES 1195 :SHA256
   "2746b6d7744c4ac338c920aff0324b58a079336c0db77a4afdf461b00a947d18")
  (:PATH "raw/semantic-source/audit-F2.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-tools/audit-F2.lisp")
   :BYTES 41338 :SHA256
   "8c857dc58646dbd85acb2d1231a66f20834db6eac837415a3cd6cf206f476df7")
  (:PATH "raw/semantic-source/batch-sha.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-tools/batch-sha.lisp")
   :BYTES 5787 :SHA256
   "130f428551e1aa17a946c2614db5dc14adf9ae35309ec2b21c3be5b2d59be1da")
  (:PATH "raw/semantic-source/count-tests.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-tools/count-tests.lisp")
   :BYTES 14296 :SHA256
   "1cb93fc4901faefaa66fdfe4207f012f51f683f8ab622ec5a25a92aa4512541e")
  (:PATH "raw/semantic-source/scoped-runner.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-tools/scoped-runner.lisp")
   :BYTES 1397 :SHA256
   "c1f97d6967f3e1a4c79aae065549a6f5bf76b4c18b6b7a3a123fa9ebf82ebeb7")
  (:PATH "raw/snapshot-fixtures/completion-exit/isolated-build.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-snapshot-self-test-83479-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-fixtures/completion-exit/stderr.log" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-snapshot-self-test-83479-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-fixtures/completion-exit/stdout.log" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-snapshot-self-test-83479-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-fixtures/report.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-snapshot-self-test-83479-0/report.lisp")
   :BYTES 2033 :SHA256
   "f0243fcd7bb26e3a990ea1f67553e64b9e85b105c54c7e79ea0e731de771aaca")
  (:PATH "raw/snapshot-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-snapshot-self-test-83479-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-fixtures/signal/stderr.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-snapshot-self-test-83479-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-fixtures/signal/stdout.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073723-snapshot-self-test-83479-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "raw/spike-aggregate/SPK-01.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-01.lisp")
   :BYTES 27224 :SHA256
   "02b49efd505ea29b426523ea9f7073e6d26f1732ea5d8b2cff5d8cf2d1039cf9")
  (:PATH "raw/spike-aggregate/SPK-02.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "fb05a88811a778018d834e08230e3f83da2ad2981096ed8e2f0828ab6c54cbc8")
  (:PATH "raw/spike-aggregate/SPK-03.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-03.lisp")
   :BYTES 3668 :SHA256
   "f11ed149843335d68828ae5115cc5cc92f31c20c56db5e9fb7ac9a5ef6d3d2c7")
  (:PATH "raw/spike-aggregate/SPK-04.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "bee03ef7d6e76e9c41b12b77f0d26b8fff1fe348dca84d414755209af24a2284")
  (:PATH "raw/spike-aggregate/SPK-05.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-05.lisp")
   :BYTES 10148 :SHA256
   "deceeb8ff28e5c2b94fba6c87d0f719b3bd100a6e6cf948ec06399bdeb4005db")
  (:PATH "raw/spike-aggregate/SPK-06.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-06.lisp")
   :BYTES 24576 :SHA256
   "0c84bd42ff82f569c00bb893cdb4744a920c6d19f16d4f970b5193fccc923541")
  (:PATH "raw/spike-aggregate/SPK-07.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "eff8a3e9f4bcdbffd53336c1491ae98afa165f859e0e237605215cfc424e63f8")
  (:PATH "raw/spike-aggregate/SPK-07.lisp.gz" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-07.lisp.gz")
   :BYTES 410640 :SHA256
   "868054b05c9e701e00673468984dc7f67531e33e9aba9ea11eb7c043031c8232")
  (:PATH "raw/spike-aggregate/SPK-08.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "9a5955c48948d42f57fedae0fe39cc0de5ca2e69aaf36c891d7030b92b7af184")
  (:PATH "raw/spike-aggregate/SPK-09.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "14a7e535ebd4a074e0c6e0648e30d70c1ed7c412a19456c1422be460ad2fb8be")
  (:PATH "raw/spike-aggregate/SPK-10.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "e4ff389db8fefc262ab75666146578ec6c8d9b27be27aefa4b80f3473d0da417")
  (:PATH "raw/spike-aggregate/conservazione.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/conservazione.lisp")
   :BYTES 2357 :SHA256
   "81d64aa11f0ce517c11b1146877ba893aea87ced1120df1214262f2a0b94b590")
  (:PATH "raw/spike-aggregate/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/report.lisp")
   :BYTES 318 :SHA256
   "ffb8811e410f32ab50607208610491ea17890c0a8f4fb05b812b7211d4d119b7")
  (:PATH "raw/spike-aggregate/report.lisp.gz" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001074077-check-6016-0/report.lisp.gz")
   :BYTES 467232 :SHA256
   "d19d6964f90d3212e021e5fef0dcef1a48238cc5e99b0dfd786df19e4211a44e")
  (:PATH "raw/syntax-947/conservazione.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073549-command-71582-0/conservazione.lisp")
   :BYTES 1190 :SHA256
   "264feb1ecb51b5428a32265b3092a762c90ad91dc0c8d989ca85234301c68f6e")
  (:PATH "raw/syntax-947/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/4001073549-command-71582-0/report.lisp")
   :BYTES 196783 :SHA256
   "3b8586efab945502a5a7fa5f33a0c1194e1fe71b6e159030cf414f5dac41b5a8")
  (:PATH "semantic-auditor-source.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/active-recovery-verification/ArcDocDB/spikes/out/active-recovery-semantic-tools/audit-F2.lisp")
   :BYTES 41338 :SHA256
   "8c857dc58646dbd85acb2d1231a66f20834db6eac837415a3cd6cf206f476df7"))
 :LIMITS
 (:COMPLETE-EXPLICIT-GROUPS :RAW-FASL-PRESERVED-AS-DATA :SOURCE-AND-COPY-SHA256
  :LOSSLESS-GZIP-FOR-LARGE-RAW :NO-RESULT-PROMOTION))
