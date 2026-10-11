;;; DATI DI AUTORIPORTO: non caricare/eseguire questo file.
;;; Il comando e l'output sotto sono trascritti dalla precedente chiamata dell'agente.
;;; Nessun record runtime autonomo dello script o dello stdout era stato conservato.
;;; Non e' qualificazione del prodotto; la seconda lettura frozen non esegue codice.
(:kind :preliminary-syntax
 :limits :not-product-qualification
 :report-source :agent-self-report
 :runtime-record nil
 :line-claim "Nessun record runtime conservato nella precedente patch: script passato tramite /dev/stdin, stdout presente soltanto nel resoconto della chiamata. Questa trascrizione non costituisce una prova accettata di compilazione o qualificazione del prodotto."
 :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
 :command "sbcl --noinform --no-sysinit --no-userinit --disable-debugger --script /dev/stdin <<'LISP'
(defpackage #:arcdocdb.conditions
  (:use #:cl) (:export #:arcdocdb-error #:invalid-argument #:error-reason))
(define-condition arcdocdb.conditions:arcdocdb-error (error) ())
(define-condition arcdocdb.conditions:invalid-argument (arcdocdb.conditions:arcdocdb-error) ())
(defun arcdocdb.conditions:error-reason (condition)
  (declare (ignore condition)) (error \"Stub di audit, non chiamare.\"))
(defpackage #:arcdocdb.hash64 (:use #:cl) (:export #:xxh64))
(declaim (ftype (function (t t t t t) (values (unsigned-byte 32) (unsigned-byte 32) &optional))
                arcdocdb.hash64:xxh64))
(defun arcdocdb.hash64:xxh64 (buffer start end seed-high seed-low)
  (declare (ignore buffer start end seed-high seed-low))
  (error \"Stub di audit: esecuzione del prodotto proibita.\"))
(let ((files '(\"tests/hash/support.lisp\" \"tests/hash/hash64.lisp\" \"tests/hash/threads.lisp\"))
      (compiled 0) (warnings 0) (failures 0))
  (labels ((compile-definition (form)
             (multiple-value-bind (function warned failed)
                 (compile (second form) (cons 'lambda (cddr form)))
               (declare (ignore function))
               (incf compiled)
               (when warned (incf warnings))
               (when failed (incf failures)))))
    (dolist (file files)
      (with-open-file (input file)
        (loop for form = (read input nil :eof) until (eq form :eof)
              do (case (first form)
                   ((defpackage in-package defmacro declaim defvar defparameter) (eval form))
                   (defun (compile-definition form))
                   (t (when (string= (symbol-name (first form)) \"DEFTEST\")
                        (compile-definition (second (macroexpand-1 form))))))))))
  (format t \"Sola compilazione in memoria con package/stub separati: ~D funzioni, ~D warning, ~D failure.~%\"
          compiled warnings failures)
  (format t \"Nessuna funzione compilata e' stata chiamata; nessun prodotto/oracolo/test eseguito.~%\")
  (unless (zerop failures) (error \"Audit di compilazione fallito.\")))
LISP"
 :outcome (:exit-code 0
           :stdout "Sola compilazione in memoria con package/stub separati: 50 funzioni, 0 warning, 0 failure.
Nessuna funzione compilata e' stata chiamata; nessun prodotto/oracolo/test eseguito.
"
           :basis :agent-self-report
           :product-qualification nil)
 :scope "Sola compilazione in memoria dei form dei tre file tests/hash con package/condizioni/API stub in un processo separato; registri e parametri dei test definiti, nessun corpo test o oracolo chiamato. Preliminare anteriore all'ultima sostituzione di una fixture non-u8 con signed-byte 8."
 :product-sources-read nil
 :product-compiled nil
 :product-executed nil
 :tests-executed nil
 :runtime-artifact-recovered nil
 :reexecuted-for-this-record nil
 :claims "Il precedente conteggio 50/0/0 e' solo un autoriporto preliminare. Nessun claim di compilazione del prodotto, assenza di style warning del prodotto, equivalenza runtime, arita runtime o heap zero."
 :frozen-review-commit "0460a6e723325ff925b8c678e81544fbad2a2684")
