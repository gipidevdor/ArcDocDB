(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-get-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(dolist (name '(arcdocdb.get::scegli-candidato-get arcdocdb.get::verifica-target-get
                arcdocdb.get::verifica-cache-get arcdocdb.get::leggi-prova-get
                arcdocdb.get::leggi-put-get arcdocdb.get::inserisci-cache-get
                arcdocdb.get::avvia-get arcdocdb.get::sonda-cache-get
                arcdocdb.get::leggi-record-get arcdocdb.get::copia-valore-get
                arcdocdb.get::concludi-get arcdocdb.get::abbandona-get))
  (format t \"~&FUNZIONE ~S~%\" name)
  (disassemble (symbol-function name)))
"
 :LIMITS (:FILESYSTEM-COLLECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
