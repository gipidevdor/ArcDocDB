(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-resolver-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(let ((text (with-output-to-string (*standard-output*)
              (dolist (name '(arcdocdb.get.resolver::trova-riga-resolver
                              arcdocdb.get.resolver::verifica-parole-resolver
                              arcdocdb.get.resolver::verifica-riga-resolver
                              arcdocdb.get.resolver::risolvi-candidato-get
                              arcdocdb.get.resolver::sonda-cache-risolta-get
                              arcdocdb.get.resolver::leggi-record-risolto-get))
                (format t \"~&FUNZIONE ~S~%\" name)
                (disassemble (symbol-function name))))))
  (with-open-file (stream \"/tmp/arcdocdb-resolver-disassembly.txt\" :direction :output :if-exists :supersede)
    (write-string text stream))
  (write-string text))
"
 :LIMITS (:FILESYSTEM-COLLECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
