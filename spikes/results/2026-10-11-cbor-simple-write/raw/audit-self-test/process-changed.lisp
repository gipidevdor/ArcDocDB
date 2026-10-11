(:CASE #A((15) BASE-CHAR . "process-changed") :EXPECTED :REJECT :OBSERVED
 :AS-EXPECTED :FIXTURE
 (:SCHEMA-VERSION 1 :KIND :COMMAND-VERIFICATION :STATUS :OK :EXIT-CODE 0
  :COMMAND ("sbcl" "fixture") :STDOUT "" :STDERR "" :SOURCE-CONSISTENCY
  :CHANGED :SOURCE-BLOBS-BEFORE
  ((:PATH "src/codec/cbor-simple-write.lisp" :GIT-BLOB
    "58c7a3a040ec814fae2dfe636f569b5623cba8f0"))
  :SOURCE-BLOBS-AFTER
  ((:PATH "src/codec/cbor-simple-write.lisp" :GIT-BLOB
    "58c7a3a040ec814fae2dfe636f569b5623cba8f0"))))
