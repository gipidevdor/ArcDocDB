(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-recovery-checkpoint-disassemble.lisp" :TEXT "(require :asdf)
(asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
(asdf:load-system \"arcdocdb\")
(dolist (name '(arcdocdb.recovery.checkpoint:crea-checkpoint-da-active
                arcdocdb.recovery.checkpoint::misura-payload-checkpoint
                arcdocdb.recovery.checkpoint::verifica-checkpoint-derivato))
 (format t \"~&FUNZIONE ~S~%\" name)
 (disassemble name))
"
 :LIMITS (:COMPILE-OR-STATIC-INSPECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
