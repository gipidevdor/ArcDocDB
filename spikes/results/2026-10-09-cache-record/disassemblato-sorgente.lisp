(:SCHEMA-VERSION 1 :KIND :SOURCE-SUPPORT :LANGUAGE :COMMON-LISP :ORIGINAL-PATH
 "/tmp/arcdocdb-cache-disassemble.lisp" :TEXT "(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                         (unless (typep condition 'sb-kernel:redefinition-warning)
                           (error condition)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb\"))
(dolist (name '(arcdocdb.cache:cerca-record-cache
               arcdocdb.cache::copia-posto-cache
               arcdocdb.cache::insieme-cache
               arcdocdb.cache::scegli-vittima-cache
               arcdocdb.cache::scrivi-posto-cache
               arcdocdb.cache::prova-inserimento-cache
               arcdocdb.record:verifica-put-parole))
  (format t \"~&;;; STATIC-DISASSEMBLY ~S; product function not executed.~%\" name)
  (disassemble name))
"
 :LIMITS (:FILESYSTEM-COLLECTION-ONLY :NO-PRODUCT-FUNCTION-EXECUTION))
