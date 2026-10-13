(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-active-init-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(dolist (name '(arcdocdb.io:verifica-capienza-lettura
                arcdocdb.active::verifica-registro-preparato
                arcdocdb.active:crea-sorgente-get-preparata))
  (format t \"~&FUNZIONE ~S~%\" name)
  (disassemble (symbol-function name)))
"
 :LIMITS (:COMPILE-OR-STATIC-INSPECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
