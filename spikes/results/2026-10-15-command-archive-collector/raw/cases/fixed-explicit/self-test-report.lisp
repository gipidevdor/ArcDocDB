(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTOR-SELF-TEST :STATUS :OK
 :CHECKS 2807 :CASE-COUNT 59 :CASES
 ((:NAME "explicit-closed-parallel-history" :STATUS :OK :DETAIL
   (:PLANNED-FILES 9 :WORKERS 4 :HISTORICAL-STATUSES
    (:OK :FAILED :SOURCE-CHANGED :FAILED) :STRICT-CLOSURE T
    :INPUT-BYTES-UNCHANGED T :SCALING-CLAIM NIL)
   :CASE-ID 1 :DIRECTORY
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-01-explicit-closed-parallel-history/")
   :CHECKS 136)
  (:NAME "schema-version" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :MANIFEST-SCHEMA :OBSERVED-REASON :MANIFEST-SCHEMA
    :DIAGNOSTIC
    #A((51) BASE-CHAR . "Manifesto schema1, kind e data YYYY-MM-DD richiesti"))
   :CASE-ID 2 :DIRECTORY
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-02-schema-version/")
   :CHECKS 50)
  (:NAME "manifest-kind" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :MANIFEST-SCHEMA :OBSERVED-REASON :MANIFEST-SCHEMA
    :DIAGNOSTIC
    #A((51) BASE-CHAR . "Manifesto schema1, kind e data YYYY-MM-DD richiesti"))
   :CASE-ID 3 :DIRECTORY
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-03-manifest-kind/")
   :CHECKS 50)
  (:NAME "date-format" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :MANIFEST-SCHEMA :OBSERVED-REASON :MANIFEST-SCHEMA
    :DIAGNOSTIC
    #A((51) BASE-CHAR . "Manifesto schema1, kind e data YYYY-MM-DD richiesti"))
   :CASE-ID 4 :DIRECTORY
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-04-date-format/")
   :CHECKS 50)
  (:NAME "unknown-trees" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DATA-SHAPE :OBSERVED-REASON :DATA-SHAPE :DIAGNOSTIC
    #A((24) BASE-CHAR . "Campo :TREES non ammesso"))
   :CASE-ID 5 :DIRECTORY
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-05-unknown-trees/")
   :CHECKS 50)
  (:NAME "duplicate-manifest-key" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DUPLICATE-FIELD :OBSERVED-REASON :DUPLICATE-FIELD
    :DIAGNOSTIC #A((21) BASE-CHAR . "Campo :DATE duplicato"))
   :CASE-ID 6 :DIRECTORY
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-06-duplicate-manifest-key/")
   :CHECKS 50)
  (:NAME #1="relative-target" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((53) BASE-CHAR
       . "Percorso relativo semplice richiesto: \"../escape.bin\""))
   :CASE-ID 7 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-07-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((53) BASE-CHAR
       . "Percorso relativo semplice richiesto: \"/absolute.bin\""))
   :CASE-ID 8 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-08-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((44) BASE-CHAR . "Percorso relativo semplice richiesto: \"a//b\""))
   :CASE-ID 9 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-09-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((45) BASE-CHAR . "Percorso relativo semplice richiesto: \"a/./b\""))
   :CASE-ID 10 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-10-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((46) BASE-CHAR . "Percorso relativo semplice richiesto: \"a/../b\""))
   :CASE-ID 11 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-11-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((28) BASE-CHAR . "Nome di percorso non ammesso"))
   :CASE-ID 12 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-12-relative-target/")
   :CHECKS 50)
  (:NAME #2="reserved-target" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RESERVED-TARGET :OBSERVED-REASON :RESERVED-TARGET
    :DIAGNOSTIC #A((34) BASE-CHAR . "Path riservato: archive-index.lisp"))
   :CASE-ID 13 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-13-reserved-target/")
   :CHECKS 50)
  (:NAME #2# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RESERVED-TARGET :OBSERVED-REASON :RESERVED-TARGET
    :DIAGNOSTIC #A((29) BASE-CHAR . "Path riservato: catalogo.lisp"))
   :CASE-ID 14 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-14-reserved-target/")
   :CHECKS 50)
  (:NAME #2# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RESERVED-TARGET :OBSERVED-REASON :RESERVED-TARGET
    :DIAGNOSTIC
    #A((40) BASE-CHAR . "Path riservato: collection-manifest.lisp"))
   :CASE-ID 15 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-15-reserved-target/")
   :CHECKS 50)
  (:NAME #2# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RESERVED-TARGET :OBSERVED-REASON :RESERVED-TARGET
    :DIAGNOSTIC #A((38) BASE-CHAR . "Path riservato: collection-source.lisp"))
   :CASE-ID 16 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-16-reserved-target/")
   :CHECKS 50)
  (:NAME "duplicate-target" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DUPLICATE-TARGET :OBSERVED-REASON :DUPLICATE-TARGET
    :DIAGNOSTIC #A((23) BASE-CHAR . "processes/0/report.lisp"))
   :CASE-ID 17 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-17-duplicate-target/")
   :CHECKS 50)
  (:NAME "file-directory-collision" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PATH-COLLISION :OBSERVED-REASON :PATH-COLLISION
    :DIAGNOSTIC #A((36) BASE-CHAR . "Directory al posto di file: raw/node"))
   :CASE-ID 18 :DIRECTORY
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-18-file-directory-collision/")
   :CHECKS 50)
  (:NAME "unknown-file-field" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DATA-SHAPE :OBSERVED-REASON :DATA-SHAPE :DIAGNOSTIC
    #A((27) BASE-CHAR . "Campo :IMPLICIT non ammesso"))
   :CASE-ID 19 :DIRECTORY
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-19-unknown-file-field/")
   :CHECKS 50)
  (:NAME "unknown-process-field" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DATA-SHAPE :OBSERVED-REASON :DATA-SHAPE :DIAGNOSTIC
    #A((25) BASE-CHAR . "Campo :STATUS non ammesso"))
   :CASE-ID 20 :DIRECTORY
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-20-unknown-process-field/")
   :CHECKS 50)
  (:NAME #3="invalid-process-label" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-LABEL :OBSERVED-REASON :PROCESS-LABEL :DIAGNOSTIC
    #A((30) BASE-CHAR . "Label semplice unica richiesta"))
   :CASE-ID 21 :DIRECTORY
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-21-invalid-process-label/")
   :CHECKS 50)
  (:NAME #3# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-LABEL :OBSERVED-REASON :PROCESS-LABEL :DIAGNOSTIC
    #A((24) BASE-CHAR . "Label semplice richiesta"))
   :CASE-ID 22 :DIRECTORY
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-22-invalid-process-label/")
   :CHECKS 50)
  (:NAME "duplicate-process-label" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-LABEL :OBSERVED-REASON :PROCESS-LABEL :DIAGNOSTIC
    #A((30) BASE-CHAR . "Label semplice unica richiesta"))
   :CASE-ID 23 :DIRECTORY
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-23-duplicate-process-label/")
   :CHECKS 50)
  (:NAME "record-not-in-files" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-RECORD :OBSERVED-REASON :PROCESS-RECORD
    :DIAGNOSTIC
    #A((48) BASE-CHAR . "Record non presente nei file: absent/report.lisp"))
   :CASE-ID 24 :DIRECTORY
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-24-record-not-in-files/")
   :CHECKS 50)
  (:NAME "duplicate-process-record" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-RECORD :OBSERVED-REASON :PROCESS-RECORD
    :DIAGNOSTIC
    #A((41) BASE-CHAR . "Record duplicato: processes/0/report.lisp"))
   :CASE-ID 25 :DIRECTORY
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-25-duplicate-process-record/")
   :CHECKS 50)
  (:NAME "wrong-record-kind" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-SCHEMA :OBSERVED-REASON :PROCESS-SCHEMA
    :DIAGNOSTIC
    #A((45) BASE-CHAR . "Record schema1 COMMAND-VERIFICATION richiesto"))
   :CASE-ID 26 :DIRECTORY
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-26-wrong-record-kind/")
   :CHECKS 50)
  (:NAME #4="nonterminal-record" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :INCOMPLETE-PROCESS :OBSERVED-REASON :INCOMPLETE-PROCESS
    :DIAGNOSTIC
    #A((44) BASE-CHAR . "Record non concluso: processes/0/report.lisp"))
   :CASE-ID 27 :DIRECTORY
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-27-nonterminal-record/")
   :CHECKS 50)
  (:NAME #4# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :INCOMPLETE-PROCESS :OBSERVED-REASON :INCOMPLETE-PROCESS
    :DIAGNOSTIC
    #A((44) BASE-CHAR . "Record non concluso: processes/0/report.lisp"))
   :CASE-ID 28 :DIRECTORY
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-28-nonterminal-record/")
   :CHECKS 50)
  (:NAME "unfinished-record" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :INCOMPLETE-PROCESS :OBSERVED-REASON :INCOMPLETE-PROCESS
    :DIAGNOSTIC
    #A((44) BASE-CHAR . "Record non concluso: processes/0/report.lisp"))
   :CASE-ID 29 :DIRECTORY
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-29-unfinished-record/")
   :CHECKS 50)
  (:NAME "invalid-record-metadata" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-METADATA :OBSERVED-REASON :PROCESS-METADATA
    :DIAGNOSTIC
    #A((55) BASE-CHAR
       . "Campi command/status/exit/source-consistency non validi"))
   :CASE-ID 30 :DIRECTORY
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-30-invalid-record-metadata/")
   :CHECKS 50)
  (:NAME "ok-with-failing-exit" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-METADATA :OBSERVED-REASON :PROCESS-METADATA
    :DIAGNOSTIC #A((24) BASE-CHAR . "OK richiede exit0/STABLE"))
   :CASE-ID 31 :DIRECTORY
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-31-ok-with-failing-exit/")
   :CHECKS 50)
  (:NAME "ok-with-changed-source" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PROCESS-METADATA :OBSERVED-REASON :PROCESS-METADATA
    :DIAGNOSTIC #A((24) BASE-CHAR . "OK richiede exit0/STABLE"))
   :CASE-ID 32 :DIRECTORY
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-32-ok-with-changed-source/")
   :CHECKS 50)
  (:NAME "explicit-gzip-payload-required" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DECODED-RECORD :OBSERVED-REASON :DECODED-RECORD
    :DIAGNOSTIC
    #A((317) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-33-explicit-gzip-payload-required/inputs/records/gzip/report.lisp: Raccolta rifiutata :DECODED-RECORD: Payload autenticato non selezionato al path processes/gzip/report.lisp.gz."))
   :CASE-ID 33 :DIRECTORY
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-33-explicit-gzip-payload-required/")
   :CHECKS 50)
  (:NAME "accessory-descriptor-also-needs-explicit-payload" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DECODED-RECORD :OBSERVED-REASON :DECODED-RECORD
    :DIAGNOSTIC
    #A((335) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-34-accessory-descriptor-also-needs-explicit-payload/inputs/records/gzip/report.lisp: Raccolta rifiutata :DECODED-RECORD: Payload autenticato non selezionato al path processes/gzip/report.lisp.gz."))
   :CASE-ID 34 :DIRECTORY
   #A((192) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-34-accessory-descriptor-also-needs-explicit-payload/")
   :CHECKS 50)
  (:NAME "accessory-compressed-record-retained-with-payload" :STATUS :OK
   :DETAIL (:PROCESSES 3 :ACCESSORY-DESCRIPTOR :PRESERVED) :CASE-ID 35
   :DIRECTORY
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-35-accessory-compressed-record-retained-with-payload/")
   :CHECKS 51)
  (:NAME "gzip-target-must-match-descriptor" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DECODED-RECORD :OBSERVED-REASON :DECODED-RECORD
    :DIAGNOSTIC
    #A((320) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-36-gzip-target-must-match-descriptor/inputs/records/gzip/report.lisp: Raccolta rifiutata :DECODED-RECORD: Payload autenticato non selezionato al path processes/gzip/report.lisp.gz."))
   :CASE-ID 36 :DIRECTORY
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-36-gzip-target-must-match-descriptor/")
   :CHECKS 50)
  (:NAME "descriptor-hash-mismatch" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DECODED-RECORD :OBSERVED-REASON :DECODED-RECORD
    :DIAGNOSTIC
    #A((470) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-37-descriptor-hash-mismatch/inputs/records/gzip/report.lisp: Evidenza non valida /Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-37-descriptor-hash-mismatch/inputs/records/gzip/report.lisp: SHA256 del PAYLOAD diverso da COMPRESSED-SHA256."))
   :CASE-ID 37 :DIRECTORY
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-37-descriptor-hash-mismatch/")
   :CHECKS 50)
  (:NAME "source-leaf-symlink" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :NONREGULAR-SOURCE :OBSERVED-REASON :NONREGULAR-SOURCE
    :DIAGNOSTIC
    #A((228) BASE-CHAR
       . "File regolare senza symlink finale: /Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-38-source-leaf-symlink/inputs/config/../raw/link.bin"))
   :CASE-ID 38 :DIRECTORY
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-38-source-leaf-symlink/")
   :CHECKS 50)
  (:NAME "plain-budget-exact-boundary" :STATUS :OK :DETAIL
   (:BYTES 1048576 :TARGET "raw/data.bin" :STATUS :OK) :CASE-ID 39 :DIRECTORY
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-39-plain-budget-exact-boundary/")
   :CHECKS 51)
  (:NAME "gzip-budget-exact-boundary" :STATUS :OK :DETAIL
   (:BYTES 8388608 :TARGET "raw/data.gz" :STATUS :OK) :CASE-ID 40 :DIRECTORY
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-40-gzip-budget-exact-boundary/")
   :CHECKS 51)
  (:NAME "plain-budget-over" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :FILE-BUDGET :OBSERVED-REASON :FILE-BUDGET :DIAGNOSTIC
    #A((42) BASE-CHAR . "raw/data.bin: 1048577 byte, limite 1048576"))
   :CASE-ID 41 :DIRECTORY
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-41-plain-budget-over/")
   :CHECKS 50)
  (:NAME "gzip-budget-over" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :FILE-BUDGET :OBSERVED-REASON :FILE-BUDGET :DIAGNOSTIC
    #A((41) BASE-CHAR . "raw/data.gz: 8388609 byte, limite 8388608"))
   :CASE-ID 42 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-42-gzip-budget-over/")
   :CHECKS 50)
  (:NAME "existing-destination-never-overwritten" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :EXISTING-DESTINATION :OBSERVED-REASON
    :EXISTING-DESTINATION :DIAGNOSTIC
    #A((190) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-43-existing-destination-never-overwritten/archive/"))
   :CASE-ID 43 :DIRECTORY
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-43-existing-destination-never-overwritten/")
   :CHECKS 52)
  (:NAME "existing-observations-never-overwritten" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :EXISTING-OBSERVATIONS :OBSERVED-REASON
    :EXISTING-OBSERVATIONS :DIAGNOSTIC
    #A((196) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-44-existing-observations-never-overwritten/observations/"))
   :CASE-ID 44 :DIRECTORY
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-44-existing-observations-never-overwritten/")
   :CHECKS 53)
  (:NAME #5="destination-observations-overlap" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PATH-OVERLAP :OBSERVED-REASON :PATH-OVERLAP :DIAGNOSTIC
    #A((54) BASE-CHAR
       . "Archivio e osservazioni devono essere esterni fra loro"))
   :CASE-ID 45 :DIRECTORY
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-45-destination-observations-overlap/")
   :CHECKS 49)
  (:NAME #5# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PATH-OVERLAP :OBSERVED-REASON :PATH-OVERLAP :DIAGNOSTIC
    #A((54) BASE-CHAR
       . "Archivio e osservazioni devono essere esterni fra loro"))
   :CASE-ID 46 :DIRECTORY
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-46-destination-observations-overlap/")
   :CHECKS 49)
  (:NAME #5# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :PATH-OVERLAP :OBSERVED-REASON :PATH-OVERLAP :DIAGNOSTIC
    #A((54) BASE-CHAR
       . "Archivio e osservazioni devono essere esterni fra loro"))
   :CASE-ID 47 :DIRECTORY
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-47-destination-observations-overlap/")
   :CHECKS 49)
  (:NAME "corrupt-copy-retains-failure" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :COPIED-BYTES :OBSERVED-REASON :COPIED-BYTES :DIAGNOSTIC
    #A((192) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-48-corrupt-copy-retains-failure/archive/raw/data.bin"))
   :CASE-ID 48 :DIRECTORY
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-48-corrupt-copy-retains-failure/")
   :CHECKS 51)
  (:NAME "source-change-retains-failure" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :SOURCE-CHANGED :OBSERVED-REASON :SOURCE-CHANGED
    :DIAGNOSTIC
    #A((192) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-49-source-change-retains-failure/inputs/raw/data.bin"))
   :CASE-ID 49 :DIRECTORY
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-49-source-change-retains-failure/")
   :CHECKS 48)
  (:NAME "unindexed-extra-rejected-by-final-checker" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :CLOSED-CHECK :OBSERVED-REASON :CLOSED-CHECK :DIAGNOSTIC
    #A((237) BASE-CHAR
       . "Exit 1 signal NIL, log /Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log")
    :CHECKER-STATUS :FAILED :CHECKER-REASON :INVENTORY :CHECKER-LOG
    #A((214) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log"))
   :CASE-ID 50 :DIRECTORY
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-50-unindexed-extra-rejected-by-final-checker/")
   :CHECKS 55)
  (:NAME "manifest-read-eval-disabled" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DATA-SHAPE :OBSERVED-REASON :DATA-SHAPE :DIAGNOSTIC
    #A((378) BASE-CHAR . "Lettura DATA: can't read #. while *READ-EVAL* is NIL

                Line: 1, Column: 301, File-Position: 301

                Stream: #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-51-manifest-read-eval-disabled/inputs/config/manifest.lisp\" {8005F41B23}>"))
   :CASE-ID 51 :DIRECTORY
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-51-manifest-read-eval-disabled/")
   :CHECKS 51)
  (:NAME "manifest-eof-required" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DATA-SHAPE :OBSERVED-REASON :DATA-SHAPE :DIAGNOSTIC
    #A((16) BASE-CHAR . "Piu di una forma"))
   :CASE-ID 52 :DIRECTORY
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-52-manifest-eof-required/")
   :CHECKS 50)
  (:NAME "record-read-eval-disabled" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DATA-SHAPE :OBSERVED-REASON :DATA-SHAPE :DIAGNOSTIC
    #A((371) BASE-CHAR . "Lettura DATA: can't read #. while *READ-EVAL* is NIL

                Line: 1, Column: 299, File-Position: 299

                Stream: #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-53-record-read-eval-disabled/inputs/records/ok.lisp\" {800612CFE3}>"))
   :CASE-ID 53 :DIRECTORY
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-53-record-read-eval-disabled/")
   :CHECKS 51)
  (:NAME "record-eof-required" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :DATA-SHAPE :OBSERVED-REASON :DATA-SHAPE :DIAGNOSTIC
    #A((16) BASE-CHAR . "Piu di una forma"))
   :CASE-ID 54 :DIRECTORY
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-54-record-eof-required/")
   :CHECKS 50)
  (:NAME #6="cli-arguments" :STATUS :OK :DETAIL T :CASE-ID 55 :DIRECTORY
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-55-cli-arguments/")
   :CHECKS 2)
  (:NAME #6# :STATUS :OK :DETAIL T :CASE-ID 56 :DIRECTORY
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-56-cli-arguments/")
   :CHECKS 2)
  (:NAME #6# :STATUS :OK :DETAIL T :CASE-ID 57 :DIRECTORY
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-57-cli-arguments/")
   :CHECKS 2)
  (:NAME #6# :STATUS :OK :DETAIL T :CASE-ID 58 :DIRECTORY
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-58-cli-arguments/")
   :CHECKS 2)
  (:NAME #6# :STATUS :OK :DETAIL T :CASE-ID 59 :DIRECTORY
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/case-59-cli-arguments/")
   :CHECKS 2))
 :ROOT
 #A((135) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/")
 :FIXTURES-PRESERVED T :PRODUCT-CAMPAIGNS NIL :SCALING-CLAIM NIL :MCDC-CLAIM
 NIL)
