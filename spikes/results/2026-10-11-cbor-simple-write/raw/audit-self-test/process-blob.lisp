(:CASE #A((12) BASE-CHAR . "process-blob") :EXPECTED :REJECT :OBSERVED
 :AS-EXPECTED :FIXTURE
 (:SCHEMA-VERSION 1 :KIND :COMMAND-VERIFICATION :STATUS :OK :EXIT-CODE 0
  :COMMAND ("sbcl" "fixture") :STDOUT "" :STDERR "" :SOURCE-CONSISTENCY :STABLE
  :SOURCE-BLOBS-BEFORE
  ((:PATH "src/codec/cbor-simple-write.lisp" :GIT-BLOB "other"))
  :SOURCE-BLOBS-AFTER
  ((:PATH "src/codec/cbor-simple-write.lisp" :GIT-BLOB
    "58c7a3a040ec814fae2dfe636f569b5623cba8f0"))))
