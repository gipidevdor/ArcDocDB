(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-active-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(let ((text (with-output-to-string (*standard-output*)
              (dolist (name '(arcdocdb.get.resolver::pagina-attiva
                              arcdocdb.get.resolver::trova-pagina-attiva
                              arcdocdb.get.resolver::risolvi-candidato-attivo-get
                              arcdocdb.get.resolver::sonda-cache-attiva-get
                              arcdocdb.get.resolver::leggi-record-attivo-get))
                (format t \"~&FUNZIONE ~S~%\" name)
                (disassemble (symbol-function name))))))
  (with-open-file (stream \"/tmp/arcdocdb-active-disassembly.txt\" :direction :output :if-exists :supersede)
    (write-string text stream))
  (write-string text))
"
 :LIMITS (:FILESYSTEM-COLLECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
