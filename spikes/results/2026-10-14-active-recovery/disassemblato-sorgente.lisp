(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-active-recovery-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(dolist (name '(arcdocdb.recovery.active:leggi-active-recuperato
                arcdocdb.recovery.active::risolvi-txid-active
                arcdocdb.recovery.active:scrivi-chiusura-active
                arcdocdb.recovery.active:pubblica-control-da-active))
  (format t \"~&FUNZIONE ~S~%\" name)
  (disassemble name))
"
 :LIMITS (:COMPILE-OR-STATIC-INSPECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
