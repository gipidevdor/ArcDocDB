(:CASE #A((12) BASE-CHAR . "process-blob") :EXPECTED :REJECT :OBSERVED
 :AS-EXPECTED :FIXTURE
 (:SCHEMA-VERSION 1 :KIND :COMMAND-VERIFICATION :STATUS :OK :EXIT-CODE 0
  :COMMAND ("sbcl" "fixture") :STDOUT "" :STDERR "" :SOURCE-CONSISTENCY :STABLE
  :SOURCE-BLOBS-BEFORE
  ((:PATH "src/codec/cbor-string-write.lisp" :GIT-BLOB "other"))
  :SOURCE-BLOBS-AFTER
  ((:PATH "src/codec/cbor-string-write.lisp" :GIT-BLOB
    "a2c5c77dd51bff760bff4508e998d94370921eda"))))
