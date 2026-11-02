;;;; C4: inspect only this process's compiled product; no live function mutation.
(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd")) (asdf:load-system "arcdocdb/local")
(dolist (name '(arcdocdb.local::finish-local-client-response arcdocdb.local::call-with-local-response-envelope
                arcdocdb.local::receive-local-client-frame arcdocdb.local::run-local-client-exchange))
  (format t "~&PRODUCT-DISASSEMBLY ~S~%" name) (disassemble name))
(format t "~&PRODUCT-DIAGNOSTIC-COMPLETE~%")
