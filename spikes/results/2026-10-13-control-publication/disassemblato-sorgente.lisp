(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-control-publication-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(dolist (name '(arcdocdb.io::native-entry-identity
                arcdocdb.io:sostituisci-temporaneo
                arcdocdb.control:pubblica-control-recuperato))
  (format t \"~&FUNZIONE ~S~%\" name)
  (disassemble name))
"
 :LIMITS (:COMPILE-OR-STATIC-INSPECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
