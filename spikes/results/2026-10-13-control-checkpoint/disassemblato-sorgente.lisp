(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-control-checkpoint-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(dolist (name '(arcdocdb.io:verifica-file-distinti
                arcdocdb.control::verifica-active-checkpoint
                arcdocdb.control::verifica-rilettura-control))
  (format t \"~&FUNZIONE ~S~%\" name)
  (disassemble name))
"
 :LIMITS (:COMPILE-OR-STATIC-INSPECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
