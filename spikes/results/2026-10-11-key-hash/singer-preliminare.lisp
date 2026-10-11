;;; DATI: non caricare/eseguire. Schema 1, auto-attestazione NON QUALIFICANTE.
;;; Solo comandi/output gia noti; nessuna nuova compilazione, prova cold, sensore o benchmark.
(:schema-version 1
 :kind "preliminary-verification"
 :scope "key-hash-singer"
 :report-source "agent-self-report"
 :qualification "nonqualifying-auto-attestation"
 :qualification-statement "AUTO-ATTESTAZIONE NON QUALIFICANTE. Registro retrospettivo costruito da comandi e risultati gia noti nella conversazione, senza nuova compilazione, controllo cold, sensore o benchmark. Non sostituisce tools/record-command.lisp, non qualifica il prodotto e non promuove requisiti o prestazioni. Gli exit degli involucri non sono spacciati per exit del processo figlio."
 :status "recorded"
 :execution-date "2026-10-11"
 :exact-execution-times-not-recorded t
 :new-verification-executions nil
 :tool-or-method-modified-for-record nil
 :commit-created-by-agent nil
 :entry-count 9
 :performance-executed nil
 :sensor-executed nil
 :asdf-test-suite-executed nil
 :source-hashes (:algorithm "sha256"
 :collection-basis "File letti prima della sola correzione dei quattro path nel metodo; non snapshot ai clock delle esecuzioni pregresse."
 :files ((:path "tools/key-hash-bench.lisp"
 :sha256 "ecda9a421c7ab96c0510b6a97b8beef5226c9b7112cfc3c8073586dd2edd4a6f"
 :bytes 48490
 :scope "driver finale, gia letto; nessuna ulteriore modifica del tool")
 (:path "docs/implementazione/hash-chiavi-metodo.md"
 :sha256 "33d4952bfa865c06d539c3096787c5d5f2222779e7d2144c55e86acc52fbc7b1"
 :bytes 11794
 :scope "metodo PRIMA della correzione dei quattro path; NON hash del documento congelato dopo la correzione"))
 :post-correction-method-hash-not-recorded t
 :historical-source-hashes-at-execution-not-preserved t
 :parent-product-hashes-at-execution-not-preserved t
 :historical-versions-reconstructed nil
 :qualifying nil)
 :freeze (:state "frozen"
 :scope "i due file dell'agente, dopo la correzione dei quattro path; nessuna modifica successiva"
 :output-directories ("spikes/out/key-hash-self-test/"
 "spikes/out/key-hash-bench-negative/"
 "spikes/out/key-hash-bench-serial/"
 "spikes/out/key-hash-bench-parallel/")
 :parent-registered-selftest "Passato secondo il messaggio del parent; non rieseguito e non attribuito alle prove preliminari dell'agente.")
 :output-retention (:available-existing-merged-logs ((:path "/tmp/arcdocdb-key-hash-cold-check.log"
 :bytes-observed 141249)
 (:path "/tmp/arcdocdb-key-hash-compile.log"
 :bytes-observed 84380)
 (:path "/tmp/arcdocdb-key-hash-schema-check.log"
 :bytes-observed 66)
 (:path "/tmp/arcdocdb-key-hash-cli-check.log"
 :bytes-observed 21))
 :stdout-stderr-separation-not-preserved t
 :statement "I risultati tool gia noti e gli estratti sono trascritti sotto; i quattro log combinati gia esistenti sono gli unici stream completi disponibili. Gli output precedenti troncati o sovrascritti non sono recuperati ne rigenerati. L'assenza di un originale autonomo e dichiarata per ogni comando."
 :overwritten-logs-not-reassigned-to-earlier-commands t)
 :available-merged-output-transcriptions ((:execution "cold-product-01"
 :full-log-embedded nil
 :combined-output-excerpt "; compilation finished in 0:00:00.002
; 
; compilation unit finished
;   printed 145 notes
COLD-SELF-TEST (:STATUS :OK :ORACLE :INDEPENDENT-COLD-XXH64 :ANCHORS 3
                :FIXTURES 24 :EDGE-SPANS 24 :EMPTY-VECTORS 2 :NEGATIVE-CASES 26
                :INTERLEAVED-RECHECK T)
")
 (:execution "compile-04"
 :full-log-embedded nil
 :combined-output-excerpt "; compilation unit finished
;   printed 203 notes
; wrote /tmp/arcdocdb-key-hash-bench-check.fasl
; compilation finished in 0:00:00.556
")
 (:execution "cold-schema-02"
 :full-log-embedded t
 :combined-output "SCHEMA-COLD-OK: 24 campi, 12 valori negativi, rate zero/positive.
")
 (:execution "cold-cli-02"
 :full-log-embedded t
 :combined-output "CLI-AND-PLAN-COLD-OK
"))
 :large-complete-logs-not-embedded t
 :large-log-retention-note "I log ampi restano nei quattro path preesistenti elencati; in questo preliminare sono conservati gli estratti gia letti, senza ulteriore recupero o esecuzione. Gli originali separati stdout/stderr non sono conservati. Gli hash storici di esecuzione non sono disponibili."
 :known-failures ("compile-01"
 "compile-03-with-note-search"
 "cold-schema-cli-01-failed")
 :executions ((:id "compile-01"
 :kind "compilation"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(push :key-hash-bench-library *features*)' --eval '(multiple-value-bind (output warnings failure) (compile-file \"tools/key-hash-bench.lisp\" :output-file \"/tmp/arcdocdb-key-hash-bench-check.fasl\") (declare (ignore output)) (when (or warnings failure) (sb-ext:exit :code 1)))'"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 1
 :child-exit-code 1
 :child-exit-code-not-recorded nil
 :outcome "failed"
 :outcome-basis "Exit code 1 e errore di lettura osservati nel risultato della chiamata; output trascritto dalla conversazione."
 :source-version-at-execution "v1"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tools/key-hash-bench.lisp\" (written 11 OCT 2026 12:49:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tools/key-hash-bench.lisp
; in: DEFUN WRITE-FROZEN
;     (FUNCALL ARCDOCDB.KEY-HASH.BENCH::VALIDATOR ARCDOCDB.KEY-HASH.BENCH::SNAPSHOT)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   VALIDATOR is not known to be a function

;     (FUNCALL ARCDOCDB.KEY-HASH.BENCH::VALIDATOR ARCDOCDB.KEY-HASH.BENCH::STORED)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   VALIDATOR is not known to be a function

; 
; caught ERROR:
;   READ error during COMPILE-FILE:
;   
;     Symbol \"UNPARSE-TYPE\" not found in the SB-KERNEL package.
;   
;       Line: 125, Column: 42, File-Position: 6477
;   
;       Stream: #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tools/key-hash-bench.lisp\" {80086904C3}>
; 
; compilation unit aborted
;   caught 1 fatal ERROR condition
;   caught 1 ERROR condition
;   printed 2 notes

; compilation aborted after 0:00:00.300
"
 :complete-tool-result-transcribed t
 :available-output-excerpts nil
 :existing-merged-log-path nil
 :superseded-original-log nil
 :original-complete-output-not-in-transcript nil
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil)
 (:id "symbol-inventory-01"
 :kind "support-symbol-inventory"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(dolist (name (quote (\"TYPE-SPECIFIER\" \"SPECIFIER-TYPE\" \"TYPE=\" \"UNPARSE-TYPE\"))) (multiple-value-bind (sym status) (find-symbol name \"SB-KERNEL\") (format t \"~A ~A ~A~%\" name status (and sym (fboundp sym)))))'
wc -l tools/key-hash-bench.lisp docs/implementazione/hash-chiavi-metodo.md
sed -n '70,155p' tools/key-hash-bench.lisp"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 0
 :child-exit-code nil
 :child-exit-code-not-recorded t
 :outcome "ok"
 :outcome-basis "Exit 0 dell'involucro; exit SBCL non isolato dagli altri comandi. Solo i quattro nomi di simboli sono qui ritrascritti; il restante stdout wc/sed non e' conservato come stream autonomo."
 :source-version-at-execution "v1"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription nil
 :complete-tool-result-transcribed nil
 :available-output-excerpts ("TYPE-SPECIFIER EXTERNAL #<FUNCTION SB-KERNEL:TYPE-SPECIFIER>
SPECIFIER-TYPE EXTERNAL #<FUNCTION SB-KERNEL:SPECIFIER-TYPE>
TYPE= EXTERNAL #<FUNCTION SB-KERNEL:TYPE=>
UNPARSE-TYPE NIL NIL
")
 :existing-merged-log-path nil
 :superseded-original-log nil
 :original-complete-output-not-in-transcript t
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil)
 (:id "compile-02"
 :kind "compilation"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(push :key-hash-bench-library *features*)' --eval '(multiple-value-bind (output warnings failure) (compile-file \"tools/key-hash-bench.lisp\" :output-file \"/tmp/arcdocdb-key-hash-bench-check.fasl\") (declare (ignore output)) (when (or warnings failure) (sb-ext:exit :code 1)))'"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 0
 :child-exit-code 0
 :child-exit-code-not-recorded nil
 :outcome "ok"
 :outcome-basis "Exit 0 del comando diretto osservato; risultato tool troncato (original_token_count 22693). Nessun log completo salvato."
 :source-version-at-execution "v2"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription nil
 :complete-tool-result-transcribed nil
 :available-output-excerpts ("; compiling file \"/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tools/key-hash-bench.lisp\" (written 11 OCT 2026 12:51:47 PM):
"
 "; compilation unit finished
;   printed 230 notes


; wrote /tmp/arcdocdb-key-hash-bench-check.fasl
; compilation finished in 0:00:00.547
")
 :existing-merged-log-path nil
 :superseded-original-log nil
 :original-complete-output-not-in-transcript t
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil)
 (:id "compile-03-with-note-search"
 :kind "compilation-and-output-search"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(push :key-hash-bench-library *features*)' --eval '(multiple-value-bind (output warnings failure) (compile-file \"tools/key-hash-bench.lisp\" :output-file \"/tmp/arcdocdb-key-hash-bench-check.fasl\") (declare (ignore output)) (when (or warnings failure) (sb-ext:exit :code 1)))' > /tmp/arcdocdb-key-hash-compile.log 2>&1
rg -n -A 65 'in: DEFUN KERNEL|in: DEFUN MEASURE-KERNEL|in: DEFUN CONTROL-KERNEL|in: DEFUN MEASURE-CONTROL' /tmp/arcdocdb-key-hash-compile.log"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 1
 :child-exit-code nil
 :child-exit-code-not-recorded t
 :outcome "wrapper-failed"
 :outcome-basis "Exit 1 dell'involucro e output vuoto osservati. La ricerca rg non trova quelle intestazioni; il codice della compilazione precedente nella stessa shell non e' stato isolato. Il log di questa compilazione e' stato poi sovrascritto da compile-04."
 :source-version-at-execution "v2"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription ""
 :complete-tool-result-transcribed t
 :available-output-excerpts nil
 :existing-merged-log-path nil
 :superseded-original-log "/tmp/arcdocdb-key-hash-compile.log"
 :original-complete-output-not-in-transcript nil
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil)
 (:id "cold-product-01"
 :kind "cold-product-self-test"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(push :key-hash-bench-library *features*)' --load tools/key-hash-bench.lisp --eval '(let* ((report (arcdocdb.key-hash.bench::new-report)) (hash (arcdocdb.key-hash.bench::load-product report))) (format t \"COLD-SELF-TEST ~S~%\" (arcdocdb.key-hash.bench::product-self-test hash)))' > /tmp/arcdocdb-key-hash-cold-check.log 2>&1
tail -45 /tmp/arcdocdb-key-hash-cold-check.log"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 0
 :child-exit-code nil
 :child-exit-code-not-recorded t
 :outcome "ok-output"
 :outcome-basis "Il log contiene COLD-SELF-TEST :STATUS :OK: 3 anchor, 24 fixture, 24 edge span, 2 empty vector, 26 rifiuti e recheck interlacciato. L'exit 0 osservato e' dell'involucro che termina con tail, non un exit SBCL separatamente acquisito."
 :source-version-at-execution "v3"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription nil
 :complete-tool-result-transcribed nil
 :available-output-excerpts nil
 :existing-merged-log-path "/tmp/arcdocdb-key-hash-cold-check.log"
 :superseded-original-log nil
 :original-complete-output-not-in-transcript t
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil)
 (:id "cold-schema-cli-01-failed"
 :kind "cold-schema-and-cli-check"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(push :key-hash-bench-library *features*)' --load tools/key-hash-bench.lisp --eval '(in-package :arcdocdb.key-hash.bench)' --eval '(let* ((raw (make-raw :completed 20000 :status :ok)) (record (metric raw :sensor-empty 0 nil nil 20000)) (positive (metric (make-raw :completed 4 :status :ok :heap 4194304 :ticks 1) :sensor-positive 0 nil nil 4))) (validate-metric record) (validate-metric positive) (dolist (key +metric-fields+) (let ((broken (freeze record))) (remf broken key) (expect-rejection (lambda () (validate-metric broken))))) (dolist (key (quote (:iterations :completed :bytes :heap-bytes :raw-ticks :seconds :ns-per-call :bytes-per-second :length :workers :sink-high :sink-low))) (let ((broken (freeze record))) (setf (getf broken key) -1) (expect-rejection (lambda () (validate-metric broken))))) (expect-rejection (lambda () (validate-metric positive :zero-heap t))) (format t \"SCHEMA-COLD-OK ~D required fields; zero tick and positive tick rates.~%\" (length +metric-fields+)))' --eval '(dolist (args (quote ((\"--bench\" \"new/\" \"--parallel\" \"20000\") (\"--bench\" \"new/\" \"100000\" \"--parallel\") (\"--self-test\" \"new/\") (\"--negative-fixture\" \"new/\")))) (multiple-value-bind (mode dir parallel count) (parse-arguments args) (declare (ignore mode dir parallel)) (assert (<= 20000 count 100000)))) (dolist (args (quote ((\"--bench\" \"new/\" \"19999\") (\"--bench\" \"new/\" \"100001\") (\"--bench\" \"new/\" \"--parallel\" \"--parallel\") (\"--self-test\" \"new/\" \"20000\")))) (expect-rejection (lambda () (parse-arguments args)))) (assert (= (length (campaign-identities nil)) 120)) (assert (= (length (campaign-identities t)) 480)) (format t \"CLI-AND-PLAN-COLD-OK~%\")' > /tmp/arcdocdb-key-hash-schema-check.log 2>&1
tail -12 /tmp/arcdocdb-key-hash-schema-check.log"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 0
 :child-exit-code nil
 :child-exit-code-not-recorded t
 :outcome "child-failed"
 :outcome-basis "Le metriche sintetiche stampano SCHEMA-COLD-OK, poi SBCL rifiuta piu' espressioni nell'ultima opzione --eval. Exit 0 osservato solo per tail; il codice SBCL non e' isolato. Il log completo fallito e' stato successivamente sovrascritto da cold-schema-02. Il fallimento non e' una regressione del driver."
 :source-version-at-execution "v3"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription nil
 :complete-tool-result-transcribed nil
 :available-output-excerpts ("SCHEMA-COLD-OK 24 required fields; zero tick and positive tick rates.
"
 "Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80086C03C3}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \"Multiple expressions in --eval option: ~S\" {8008102B23}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK SB-EXT:*INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \"Multiple expressions in --eval option: ~S\" {8008102B23}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \"Multiple expressions in --eval option: ~S\" {8008102B23}>)
"
 "unhandled condition in --disable-debugger mode, quitting
")
 :existing-merged-log-path nil
 :superseded-original-log "/tmp/arcdocdb-key-hash-schema-check.log"
 :original-complete-output-not-in-transcript t
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil)
 (:id "cold-cli-02"
 :kind "cold-cli-and-plan-check"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(push :key-hash-bench-library *features*)' --load tools/key-hash-bench.lisp --eval '(in-package :arcdocdb.key-hash.bench)' --eval '(progn (dolist (args (quote ((\"--bench\" \"new/\" \"--parallel\" \"20000\") (\"--bench\" \"new/\" \"100000\" \"--parallel\") (\"--self-test\" \"new/\") (\"--negative-fixture\" \"new/\")))) (multiple-value-bind (mode dir parallel count) (parse-arguments args) (declare (ignore mode dir parallel)) (assert (<= 20000 count 100000)))) (dolist (args (quote ((\"--bench\" \"new/\" \"19999\") (\"--bench\" \"new/\" \"100001\") (\"--bench\" \"new/\" \"--parallel\" \"--parallel\") (\"--self-test\" \"new/\" \"20000\")))) (expect-rejection (lambda () (parse-arguments args)))) (assert (= (length (campaign-identities nil)) 120)) (assert (= (length (campaign-identities t)) 480)) (format t \"CLI-AND-PLAN-COLD-OK~%\"))' > /tmp/arcdocdb-key-hash-cli-check.log 2>&1"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 0
 :child-exit-code 0
 :child-exit-code-not-recorded nil
 :outcome "ok"
 :outcome-basis "Comando diretto corretto con PROGN; exit 0 osservato. Solo parsing, rifiuti degli argomenti e conteggi delle identita' della campagna, senza clock o kernel."
 :source-version-at-execution "v3"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription nil
 :complete-tool-result-transcribed nil
 :available-output-excerpts nil
 :existing-merged-log-path "/tmp/arcdocdb-key-hash-cli-check.log"
 :superseded-original-log nil
 :original-complete-output-not-in-transcript t
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil)
 (:id "compile-04"
 :kind "compilation"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(push :key-hash-bench-library *features*)' --eval '(multiple-value-bind (output warnings failure) (compile-file \"tools/key-hash-bench.lisp\" :output-file \"/tmp/arcdocdb-key-hash-bench-check.fasl\") (declare (ignore output)) (when (or warnings failure) (sb-ext:exit :code 1)))' > /tmp/arcdocdb-key-hash-compile.log 2>&1"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 0
 :child-exit-code 0
 :child-exit-code-not-recorded nil
 :outcome "ok"
 :outcome-basis "Ultima compilazione diretta: exit 0 osservato. Il comando richiede exit 1 se COMPILE-FILE restituisce warning/failure; il log corrente appartiene a questa esecuzione, non a compile-03."
 :source-version-at-execution "v4"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription nil
 :complete-tool-result-transcribed nil
 :available-output-excerpts nil
 :existing-merged-log-path "/tmp/arcdocdb-key-hash-compile.log"
 :superseded-original-log nil
 :original-complete-output-not-in-transcript t
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil)
 (:id "cold-schema-02"
 :kind "cold-schema-check"
 :exact-shell-command "sbcl --noinform --no-userinit --no-sysinit --non-interactive --eval '(push :key-hash-bench-library *features*)' --load tools/key-hash-bench.lisp --eval '(in-package :arcdocdb.key-hash.bench)' --eval '(let* ((raw (make-raw :completed 20000 :status :ok)) (record (metric raw :sensor-empty 0 nil nil 20000)) (positive (metric (make-raw :completed 4 :status :ok :heap 4194304 :ticks 1) :sensor-positive 0 nil nil 4))) (validate-metric record) (validate-metric positive) (dolist (key +metric-fields+) (let ((broken (freeze record))) (remf broken key) (expect-rejection (lambda () (validate-metric broken))))) (dolist (key (quote (:iterations :completed :bytes :heap-bytes :raw-ticks :seconds :ns-per-call :bytes-per-second :length :workers :sink-high :sink-low))) (let ((broken (freeze record))) (setf (getf broken key) -1) (expect-rejection (lambda () (validate-metric broken))))) (expect-rejection (lambda () (validate-metric positive :zero-heap t))) (format t \"SCHEMA-COLD-OK: ~D campi, 12 valori negativi, rate zero/positive.~%\" (length +metric-fields+)))' > /tmp/arcdocdb-key-hash-schema-check.log 2>&1"
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :shell "zsh"
 :shell-exit-code 0
 :child-exit-code 0
 :child-exit-code-not-recorded nil
 :outcome "ok"
 :outcome-basis "Comando diretto: exit 0 osservato. Metriche sintetiche (nessuna misura): 24 campi mancanti, 12 valori negativi, gate heap positivo rifiutato, rate con zero/positivo tick."
 :source-version-at-execution "v4"
 :source-hashes-before-not-recorded t
 :source-hashes-after-not-recorded t
 :stdout-not-preserved-separately t
 :stderr-not-preserved-separately t
 :combined-tool-output-transcription nil
 :complete-tool-result-transcribed nil
 :available-output-excerpts nil
 :existing-merged-log-path "/tmp/arcdocdb-key-hash-schema-check.log"
 :superseded-original-log nil
 :original-complete-output-not-in-transcript t
 :output-separation-available nil
 :reexecuted-for-record nil
 :qualifying nil))
 :limits ("auto-attestazione non qualificante"
 "nessuno snapshot storico autonomo prima/dopo"
 "stdout/stderr originari non separati"
 "output troncati e sovrascritti dichiarati"
 "nessuna ricostruzione esaustiva"
 "nessuna nuova esecuzione"))

