;;;; Lettura sintattica isolata; nessuna compilazione o esecuzione del prodotto/test.
;;;; Le package segnaposto servono solo a risolvere i nomi durante READ.
(in-package #:cl-user)

(defun csr-package (name exports)
  (let ((package (or (find-package name) (make-package name :use '("COMMON-LISP")))))
    (dolist (name exports) (export (intern name package) package))
    package))

(defun csr-bootstrap ()
  (dolist (entry '(("ARCDOCDB.FOUNDATION.TESTS" "IS" "BYTES")
                   ("ARCDOCDB.CONDITIONS" "ARCDOCDB-ERROR" "INVALID-ARGUMENT"
                    "RESOURCE-EXHAUSTED" "CORRUPTION-DETECTED" "ERROR-REASON" "ERROR-OFFSET")
                   ("ARCDOCDB.CBOR.TESTS" "CBOR-SNAPSHOT" "CBOR-UNCHANGED-P"
                    "CBOR-WAIT" "CBOR-JOIN" "CBOR-STOP-WORKERS")
                   ("ARCDOCDB.CBOR.STRUCTURE.TESTS" "CS-REF-UTF8")
                   ("ARCDOCDB.UTF8.TESTS" "UTF8-ENCODE-SCALARS")
                   ("ARCDOCDB.CBOR" "SCRIVI-STRINGA-CBOR-MINIMA"
                    "VERIFICA-STRUTTURA-CBOR-MINIMA" "CREA-SPAZIO-CBOR")
                   ("ARCDOCDB.UTF8" "VERIFICA-UTF8")
                   ("ARCDOCDB.CBOR.STRING.WRITE.TESTS" "RUN")))
    (csr-package (first entry) (rest entry))))

(defun csr-read-file (path expected)
  (let ((*read-eval* nil) (*package* (find-package "COMMON-LISP-USER"))
        (count 0) (end (gensym "EOF")))
    (with-open-file (input path)
      (loop for form = (read input nil end)
            until (eq form end)
            do (incf count)
               (when (and (consp form) (eq (car form) 'in-package))
                 (setf *package* (or (find-package (symbol-name (second form)))
                                    (error "Package non predisposta in ~A." path))))))
    (unless (= count expected)
      (error "Numero forme ~A: atteso ~D, osservato ~D." path expected count))
    (format t "SYNTAX-READ PASS ~A forms=~D; zero EVAL/COMPILE/LOAD dei file letti.~%"
            path count)))

(defun csr-self-test ()
  (let ((*read-eval* nil) (observed nil))
    (unless (equal '(+ 1 2) (read-from-string "(+ 1 2)"))
      (error "Reader: fixture valida non riconosciuta."))
    (handler-case (read-from-string "(+ 1 2")
      (end-of-file () (setf observed t)))
    (unless observed (error "Reader: parentesi mancante non rilevata."))
    (setf observed nil)
    (handler-case (read-from-string "#.(+ 1 2)")
      (reader-error () (setf observed t)))
    (unless observed (error "Reader: READ-EVAL non bloccato.")))
  (format t "STATIC-READER SELF-TEST PASS valid/malformed/read-eval-blocked.~%"))

(csr-bootstrap)
(csr-self-test)
(dolist (entry '(("src/codec/cbor-string-write.lisp" 12)
                 ("tests/codec/cbor-string-write-support.lisp" 14)
                 ("tests/codec/cbor-string-write.lisp" 21)
                 ("tests/codec/cbor-string-write-threads.lisp" 2)))
  (csr-read-file (first entry) (second entry)))
(format t "STATIC-ONLY: nessun prodotto caricato, test definito o chiamato, build o campagna runtime.~%")
