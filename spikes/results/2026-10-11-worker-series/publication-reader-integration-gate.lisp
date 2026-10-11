(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-PUBLICATION-GATE :STATUS :PASSED :BASE
 "65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0" :PROCESS "documentation-reader-integration-gate.lisp"
 :SOURCE-CONSISTENCY :STABLE :EXIT-CODE 0 :STDOUT "sbcl --script tools/check-trace.lisp
115 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori
sbcl --script tools/check-links.lisp .
296 file, 2425 link controllati, 0 rotti
sbcl --dynamic-space-size 2048 --noinform --no-userinit --no-sysinit --script tools/check-evidence.lisp
(:STATUS :OK :CATALOGS 62 :ARTIFACT-REFERENCES 2117 :STORED-FILES 7886
 :STORED-BYTES 290445638 :LIMITS
 (:STRUCTURE-PRESENCE-SIZE-AND-COMPRESSED-INTEGRITY
  :NO-RESULT-REINTERPRETATION))
"
 :STDERR "" :LIMITS
 (:DOCUMENTATION-AND-EVIDENCE-ONLY :FULL-CHECK-PRESERVED-SEPARATELY
  :NO-PRODUCT-CHANGE-AFTER-FULL-CHECK))
