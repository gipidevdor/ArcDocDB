(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-PUBLICATION-SELFTEST :STATUS :FAILED :SCRATCH
 #A((42) BASE-CHAR . "/tmp/lifecycle-publication-fixture-ZxpZN6/") :CHECK-COUNT 32 :CHECKS
 ((:NAME :PLAIN-COPY-BYTE-PROOF :STATUS :OK)
  (:NAME :PLAIN-COPY-EXISTING-DESTINATION-REJECTED :STATUS :OK :DETAIL
   "Destinazione o payload già esistente: /tmp/lifecycle-publication-fixture-ZxpZN6/byte-copy/copy.lisp")
  (:NAME :PLAIN-COPY-EXISTING-BYTES-UNCHANGED :STATUS :OK)
  (:NAME :EVIDENCE-SOURCE-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((117) BASE-CHAR
      . "Evidence proof richiede file regolare, senza symlink: /tmp/lifecycle-publication-fixture-ZxpZN6/byte-copy/linked.lisp"))
  (:NAME :EVIDENCE-DESTINATION-SYMLINK-REJECTED :STATUS :OK :DETAIL
   "Destinazione o payload già esistente: /tmp/lifecycle-publication-fixture-ZxpZN6/byte-copy/linked.lisp")
  (:NAME :SYMLINK-TARGET-BYTES-UNCHANGED :STATUS :OK) (:NAME :UTF8-INVENTORY-COMPLETE :STATUS :OK)
  (:NAME :PYTHON-UNUSUAL-EXTENSIONLESS-AND-EXTRA-INCLUDED :STATUS :OK)
  (:NAME :BINARY-FASL-EXPLICITLY-EXCLUDED :STATUS :OK)
  (:NAME #A((39) BASE-CHAR . "inventory-roundtrip-extra.native-format") :STATUS :OK)
  (:NAME #A((28) BASE-CHAR . "inventory-roundtrip-Makefile") :STATUS :OK)
  (:NAME #A((30) BASE-CHAR . "inventory-roundtrip-measure.py") :STATUS :OK)
  (:NAME #A((34) BASE-CHAR . "inventory-roundtrip-native.unusual") :STATUS :OK)
  (:NAME #A((31) BASE-CHAR . "inventory-roundtrip-source.lisp") :STATUS :OK)
  (:NAME :EXCLUDED-FASL-CANNOT-SATISFY-REQUIRED :STATUS :OK :DETAIL
   #A((101) BASE-CHAR
      . "Raw richiesto assente dall'inventario: /tmp/lifecycle-publication-fixture-ZxpZN6/inventory/cache.fasl"))
  (:NAME :MISSING-REQUIRED-REJECTED :STATUS :OK :DETAIL
   #A((102) BASE-CHAR
      . "Raw richiesto assente dall'inventario: /tmp/lifecycle-publication-fixture-ZxpZN6/inventory/missing.raw"))
  (:NAME :INVENTORY-FILE-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((115) BASE-CHAR
      . "Originale non regolare o symlink rifiutato: /private/tmp/lifecycle-publication-fixture-ZxpZN6/bad-symlink/source.py"))
  (:NAME :INVENTORY-DIRECTORY-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((132) BASE-CHAR
      . "Directory assente, non regolare o symlink: /private/tmp/lifecycle-publication-fixture-ZxpZN6/bad-directory-symlink/linked-directory/"))
  (:NAME :INVENTORY-FIFO-REJECTED-WITHOUT-OPENING :STATUS :OK :DETAIL
   #A((111) BASE-CHAR
      . "Originale non regolare o symlink rifiutato: /private/tmp/lifecycle-publication-fixture-ZxpZN6/bad-fifo/pipe.log"))
  (:NAME :INVALID-UTF8-PLAN-REJECTED :STATUS :OK :DETAIL
   #A((197) BASE-CHAR . ":UTF-8 stream decoding error on
#<SB-SYS:FD-STREAM for \"file /private/tmp/lifecycle-publication-fixture-ZxpZN6/bad-utf8/invalid.py\" {8005F7D653}>:

  the octet sequence #(195 40) cannot be decoded."))
  (:NAME :MISSING-DEVELOPMENT-ROOT-REJECTED :STATUS :OK :DETAIL
   #A((54) BASE-CHAR . "Error in SB-POSIX:LSTAT: No such file or directory (2)"))
  (:NAME :CHANGED-SOURCE-AFTER-PLAN-REJECTED :STATUS :OK :DETAIL
   #A((111) BASE-CHAR
      . "Sorgente cambiata dopo il piano: /private/tmp/lifecycle-publication-fixture-ZxpZN6/changed-after-plan/source.py"))
  (:NAME :CHANGED-SOURCE-PLAN-CREATED-NO-OUTPUT :STATUS :OK)
  (:NAME :NATIVE-TEXT-EXCEEDS-ONE-MIB :STATUS :OK)
  (:NAME :SINGLE-LARGE-SOURCE-CLASSIFIED :STATUS :OK)
  (:NAME :LARGE-ONLY-PLAN-WITHOUT-SMALL-SOURCE :STATUS :OK)
  (:NAME :LARGE-PLAN-PRESERVES-COMPLETE-NATIVE-SOURCE :STATUS :OK)
  (:NAME :LARGE-SERIALIZED-BUNDLE-EXCEEDS-PLAIN-BUDGET :STATUS :OK)
  (:NAME :LARGE-WRITE-AND-COMPACTION :STATUS :OK)
  (:NAME :LARGE-OUTPUT-IS-GZIP-DESCRIPTOR :STATUS :OK)
  (:NAME :LARGE-STAGE-IGNORED-AND-OUTSIDE-INVENTORY :STATUS :OK)
  (:NAME :GZIP-ROUNDTRIP-NATIVE-BYTES-WITHOUT-LOSS :STATUS :FAILED))
 :LIMITS
 (:FIXTURE-DATA-ONLY :NO-CANONICAL-PUBLICATION :NO-GIT-MUTATION :ORIGINAL-FIXTURES-RETAINED
  :LARGE-STAGE-OUTSIDE-INVENTORIED-ROOTS :NOT-ENGINE-QUALIFICATION)
 :DIAGNOSTIC
 #A((78) BASE-CHAR
    . "Lifecycle publication fixture failed: GZIP-ROUNDTRIP-NATIVE-BYTES-WITHOUT-LOSS"))
