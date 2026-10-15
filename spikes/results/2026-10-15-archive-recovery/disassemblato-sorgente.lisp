(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-archive-recovery-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(dolist (name '(arcdocdb.recovery.archive:leggi-decisioni-recuperate
                arcdocdb.recovery.archive::verifica-lettura-decisioni
                arcdocdb.recovery.archive:leggi-active-con-decisioni))
  (format t \"~&FUNZIONE ~S~%\" name)
  (disassemble name))
"
 :LIMITS (:COMPILE-OR-STATIC-INSPECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
