(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-PUBLICATION-SELFTEST :STATUS :OK :SCRATCH
 #A((42) BASE-CHAR . "/tmp/lifecycle-publication-fixture-l7tyL8/") :CHECK-COUNT 58 :CHECKS
 ((:NAME :PLAIN-COPY-BYTE-PROOF :STATUS :OK)
  (:NAME :PLAIN-COPY-EXISTING-DESTINATION-REJECTED :STATUS :OK :DETAIL
   "Destinazione o payload già esistente: /tmp/lifecycle-publication-fixture-l7tyL8/byte-copy/copy.lisp")
  (:NAME :PLAIN-COPY-EXISTING-BYTES-UNCHANGED :STATUS :OK)
  (:NAME :EVIDENCE-SOURCE-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((117) BASE-CHAR
      . "Evidence proof richiede file regolare, senza symlink: /tmp/lifecycle-publication-fixture-l7tyL8/byte-copy/linked.lisp"))
  (:NAME :EVIDENCE-DESTINATION-SYMLINK-REJECTED :STATUS :OK :DETAIL
   "Destinazione o payload già esistente: /tmp/lifecycle-publication-fixture-l7tyL8/byte-copy/linked.lisp")
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
      . "Raw richiesto assente dall'inventario: /tmp/lifecycle-publication-fixture-l7tyL8/inventory/cache.fasl"))
  (:NAME :MISSING-REQUIRED-REJECTED :STATUS :OK :DETAIL
   #A((102) BASE-CHAR
      . "Raw richiesto assente dall'inventario: /tmp/lifecycle-publication-fixture-l7tyL8/inventory/missing.raw"))
  (:NAME :INVENTORY-FILE-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((115) BASE-CHAR
      . "Originale non regolare o symlink rifiutato: /private/tmp/lifecycle-publication-fixture-l7tyL8/bad-symlink/source.py"))
  (:NAME :INVENTORY-DIRECTORY-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((132) BASE-CHAR
      . "Directory assente, non regolare o symlink: /private/tmp/lifecycle-publication-fixture-l7tyL8/bad-directory-symlink/linked-directory/"))
  (:NAME :INVENTORY-FIFO-REJECTED-WITHOUT-OPENING :STATUS :OK :DETAIL
   #A((111) BASE-CHAR
      . "Originale non regolare o symlink rifiutato: /private/tmp/lifecycle-publication-fixture-l7tyL8/bad-fifo/pipe.log"))
  (:NAME :INVALID-UTF8-PLAN-REJECTED :STATUS :OK :DETAIL
   #A((197) BASE-CHAR . ":UTF-8 stream decoding error on
#<SB-SYS:FD-STREAM for \"file /private/tmp/lifecycle-publication-fixture-l7tyL8/bad-utf8/invalid.py\" {8005F7D5F3}>:

  the octet sequence #(195 40) cannot be decoded."))
  (:NAME :MISSING-DEVELOPMENT-ROOT-REJECTED :STATUS :OK :DETAIL
   #A((54) BASE-CHAR . "Error in SB-POSIX:LSTAT: No such file or directory (2)"))
  (:NAME :CHANGED-SOURCE-AFTER-PLAN-REJECTED :STATUS :OK :DETAIL
   #A((111) BASE-CHAR
      . "Sorgente cambiata dopo il piano: /private/tmp/lifecycle-publication-fixture-l7tyL8/changed-after-plan/source.py"))
  (:NAME :CHANGED-SOURCE-PLAN-CREATED-NO-OUTPUT :STATUS :OK)
  (:NAME :NATIVE-TEXT-EXCEEDS-ONE-MIB :STATUS :OK)
  (:NAME :SINGLE-LARGE-SOURCE-CLASSIFIED :STATUS :OK)
  (:NAME :LARGE-ONLY-PLAN-WITHOUT-SMALL-SOURCE :STATUS :OK)
  (:NAME :LARGE-PLAN-PRESERVES-COMPLETE-NATIVE-SOURCE :STATUS :OK)
  (:NAME :LARGE-SERIALIZED-BUNDLE-EXCEEDS-PLAIN-BUDGET :STATUS :OK)
  (:NAME :LARGE-WRITE-AND-COMPACTION :STATUS :OK)
  (:NAME :LARGE-OUTPUT-IS-GZIP-DESCRIPTOR :STATUS :OK)
  (:NAME :LARGE-STAGE-IGNORED-AND-OUTSIDE-INVENTORY :STATUS :OK)
  (:NAME :GZIP-ROUNDTRIP-NATIVE-BYTES-WITHOUT-LOSS :STATUS :OK)
  (:NAME :GZIP-UNDER-EIGHT-MIB-AND-EXPANDED-SOURCE-LARGE :STATUS :OK)
  (:NAME :DESCRIPTOR-AND-ORIGINAL-GZIP-COPIED-IDENTICALLY :STATUS :OK)
  (:NAME :LARGE-ORIGINAL-SOURCE-UNCHANGED :STATUS :OK)
  (:NAME :GZIP-EXISTING-DESTINATION-REJECTED :STATUS :OK :DETAIL
   "Destinazione o payload già esistente: /tmp/lifecycle-publication-fixture-l7tyL8/large-published/development-large-1.lisp")
  (:NAME :GZIP-EXISTING-DESCRIPTOR-AND-PAYLOAD-UNCHANGED :STATUS :OK)
  (:NAME :GZIP-PAYLOAD-ONLY-CONFLICT-REJECTED :STATUS :OK :DETAIL
   "Destinazione o payload già esistente: /tmp/lifecycle-publication-fixture-l7tyL8/gzip-payload-conflict/development-large-1.lisp")
  (:NAME :GZIP-PAYLOAD-ONLY-CONFLICT-CREATED-NO-DESCRIPTOR :STATUS :OK)
  (:NAME :RECURSIVE-CAMPAIGN-FILE-COUNT :STATUS :OK)
  (:NAME :RECURSIVE-CAMPAIGN-REAL-BYTES-SHA256-AND-GIT-BLOBS :STATUS :OK)
  (:NAME :RECURSIVE-CAMPAIGN-DESCRIPTOR-AND-GZIP-IDENTICAL :STATUS :OK)
  (:NAME :RECURSIVE-CAMPAIGN-NESTED-HIERARCHY-PRESERVED :STATUS :OK)
  (:NAME :RECURSIVE-CAMPAIGN-EXISTING-TARGET-REJECTED :STATUS :OK :DETAIL
   #A((51) BASE-CHAR . "Error in SB-POSIX::OPEN-WITH-MODE: File exists (17)"))
  (:NAME :RECURSIVE-CAMPAIGN-EXISTING-BYTES-UNCHANGED :STATUS :OK)
  (:NAME :RECURSIVE-CAMPAIGN-SOURCE-CHANGED-AFTER-PLAN-REJECTED :STATUS :OK :DETAIL
   #A((109) BASE-CHAR
      . "Campagna mutata dopo il piano: /private/tmp/lifecycle-publication-fixture-l7tyL8/campaign-changed/record.lisp"))
  (:NAME :RECURSIVE-CAMPAIGN-CHANGE-CREATED-NO-OUTPUT :STATUS :OK)
  (:NAME :RECURSIVE-CAMPAIGN-SOURCE-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((115) BASE-CHAR
      . "Originale non regolare o symlink rifiutato: /private/tmp/lifecycle-publication-fixture-l7tyL8/bad-symlink/source.py"))
  (:NAME :RECURSIVE-CAMPAIGN-DIRECTORY-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((132) BASE-CHAR
      . "Directory assente, non regolare o symlink: /private/tmp/lifecycle-publication-fixture-l7tyL8/bad-directory-symlink/linked-directory/"))
  (:NAME :MANIFEST-INVENTORIES-EVERY-ORIGINAL-FILE :STATUS :OK)
  (:NAME :MANIFEST-REAL-BYTES-SHA256-AND-GIT-BLOBS :STATUS :OK)
  (:NAME :MANIFEST-CATALOG-EXCLUDED-AND-NOT-SELF-REFERENTIAL :STATUS :OK)
  (:NAME :MANIFEST-EXISTING-DESTINATION-REJECTED :STATUS :OK :DETAIL
   #A((51) BASE-CHAR . "Error in SB-POSIX::OPEN-WITH-MODE: File exists (17)"))
  (:NAME :MANIFEST-EXISTING-BYTES-UNCHANGED :STATUS :OK)
  (:NAME :MANIFEST-DIRECTORY-SYMLINK-REJECTED :STATUS :OK :DETAIL
   #A((141) BASE-CHAR
      . "Directory assente, non regolare o symlink: /private/tmp/lifecycle-publication-fixture-l7tyL8/manifest-bad-directory-symlink/linked-directory/"))
  (:NAME :MANIFEST-DIRECTORY-SYMLINK-CREATED-NO-OUTPUT :STATUS :OK)
  (:NAME :INVALID-CONFIG-REJECTED :STATUS :OK :DETAIL
   #A((53) BASE-CHAR . "Input richiede base SHA40, snapshot, paths e records."))
  (:NAME :INVALID-CONFIG-CREATED-NO-OUTPUT :STATUS :OK))
 :LIMITS
 (:FIXTURE-DATA-ONLY :NO-CANONICAL-PUBLICATION :NO-GIT-MUTATION :ORIGINAL-FIXTURES-RETAINED
  :LARGE-STAGE-OUTSIDE-INVENTORIED-ROOTS :NOT-ENGINE-QUALIFICATION))
