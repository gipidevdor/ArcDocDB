(:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTOR-SELF-TEST :STATUS :FAILED
 :CHECKS 984 :CASE-COUNT 59 :CASES
 ((:NAME "explicit-closed-parallel-history" :STATUS :FAILED :DIAGNOSTIC
   #A((64) BASE-CHAR
      . "Raccolta rifiutata :RELATIVE-PATH: Nome di percorso non ammesso.")
   :CASE-ID 1 :DIRECTORY
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-01-explicit-closed-parallel-history/")
   :CHECKS 14)
  (:NAME "schema-version" :STATUS :FAILED :DIAGNOSTIC
   #A((99) BASE-CHAR
      . "Self-test collector: Motivo :MANIFEST-SCHEMA, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 2 :DIRECTORY
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-02-schema-version/")
   :CHECKS 14)
  (:NAME "manifest-kind" :STATUS :FAILED :DIAGNOSTIC
   #A((99) BASE-CHAR
      . "Self-test collector: Motivo :MANIFEST-SCHEMA, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 3 :DIRECTORY
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-03-manifest-kind/")
   :CHECKS 14)
  (:NAME "date-format" :STATUS :FAILED :DIAGNOSTIC
   #A((99) BASE-CHAR
      . "Self-test collector: Motivo :MANIFEST-SCHEMA, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 4 :DIRECTORY
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-04-date-format/")
   :CHECKS 14)
  (:NAME "unknown-trees" :STATUS :FAILED :DIAGNOSTIC
   #A((94) BASE-CHAR
      . "Self-test collector: Motivo :DATA-SHAPE, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 5 :DIRECTORY
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-05-unknown-trees/")
   :CHECKS 14)
  (:NAME "duplicate-manifest-key" :STATUS :FAILED :DIAGNOSTIC
   #A((99) BASE-CHAR
      . "Self-test collector: Motivo :DUPLICATE-FIELD, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 6 :DIRECTORY
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-06-duplicate-manifest-key/")
   :CHECKS 14)
  (:NAME #1="relative-target" :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((28) BASE-CHAR . "Nome di percorso non ammesso"))
   :CASE-ID 7 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-07-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((28) BASE-CHAR . "Nome di percorso non ammesso"))
   :CASE-ID 8 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-08-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((28) BASE-CHAR . "Nome di percorso non ammesso"))
   :CASE-ID 9 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-09-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((28) BASE-CHAR . "Nome di percorso non ammesso"))
   :CASE-ID 10 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-10-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((28) BASE-CHAR . "Nome di percorso non ammesso"))
   :CASE-ID 11 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-11-relative-target/")
   :CHECKS 50)
  (:NAME #1# :STATUS :OK :DETAIL
   (:EXPECTED-REASON :RELATIVE-PATH :OBSERVED-REASON :RELATIVE-PATH :DIAGNOSTIC
    #A((28) BASE-CHAR . "Nome di percorso non ammesso"))
   :CASE-ID 12 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-12-relative-target/")
   :CHECKS 50)
  (:NAME #2="reserved-target" :STATUS :FAILED :DIAGNOSTIC
   #A((99) BASE-CHAR
      . "Self-test collector: Motivo :RESERVED-TARGET, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 13 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-13-reserved-target/")
   :CHECKS 14)
  (:NAME #2# :STATUS :FAILED :DIAGNOSTIC
   #A((99) BASE-CHAR
      . "Self-test collector: Motivo :RESERVED-TARGET, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 14 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-14-reserved-target/")
   :CHECKS 14)
  (:NAME #2# :STATUS :FAILED :DIAGNOSTIC
   #A((99) BASE-CHAR
      . "Self-test collector: Motivo :RESERVED-TARGET, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 15 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-15-reserved-target/")
   :CHECKS 14)
  (:NAME #2# :STATUS :FAILED :DIAGNOSTIC
   #A((99) BASE-CHAR
      . "Self-test collector: Motivo :RESERVED-TARGET, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 16 :DIRECTORY
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-16-reserved-target/")
   :CHECKS 14)
  (:NAME "duplicate-target" :STATUS :FAILED :DIAGNOSTIC
   #A((100) BASE-CHAR
      . "Self-test collector: Motivo :DUPLICATE-TARGET, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 17 :DIRECTORY
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-17-duplicate-target/")
   :CHECKS 14)
  (:NAME "file-directory-collision" :STATUS :FAILED :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :PATH-COLLISION, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 18 :DIRECTORY
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-18-file-directory-collision/")
   :CHECKS 14)
  (:NAME "unknown-file-field" :STATUS :FAILED :DIAGNOSTIC
   #A((94) BASE-CHAR
      . "Self-test collector: Motivo :DATA-SHAPE, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 19 :DIRECTORY
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-19-unknown-file-field/")
   :CHECKS 14)
  (:NAME "unknown-process-field" :STATUS :FAILED :DIAGNOSTIC
   #A((94) BASE-CHAR
      . "Self-test collector: Motivo :DATA-SHAPE, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 20 :DIRECTORY
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-20-unknown-process-field/")
   :CHECKS 14)
  (:NAME #3="invalid-process-label" :STATUS :FAILED :DIAGNOSTIC
   #A((97) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-LABEL, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 21 :DIRECTORY
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-21-invalid-process-label/")
   :CHECKS 14)
  (:NAME #3# :STATUS :FAILED :DIAGNOSTIC
   #A((97) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-LABEL, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 22 :DIRECTORY
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-22-invalid-process-label/")
   :CHECKS 14)
  (:NAME "duplicate-process-label" :STATUS :FAILED :DIAGNOSTIC
   #A((97) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-LABEL, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 23 :DIRECTORY
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-23-duplicate-process-label/")
   :CHECKS 14)
  (:NAME "record-not-in-files" :STATUS :FAILED :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-RECORD, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 24 :DIRECTORY
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-24-record-not-in-files/")
   :CHECKS 14)
  (:NAME "duplicate-process-record" :STATUS :FAILED :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-RECORD, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 25 :DIRECTORY
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-25-duplicate-process-record/")
   :CHECKS 14)
  (:NAME "wrong-record-kind" :STATUS :FAILED :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-SCHEMA, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 26 :DIRECTORY
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-26-wrong-record-kind/")
   :CHECKS 14)
  (:NAME #4="nonterminal-record" :STATUS :FAILED :DIAGNOSTIC
   #A((102) BASE-CHAR
      . "Self-test collector: Motivo :INCOMPLETE-PROCESS, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 27 :DIRECTORY
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-27-nonterminal-record/")
   :CHECKS 14)
  (:NAME #4# :STATUS :FAILED :DIAGNOSTIC
   #A((102) BASE-CHAR
      . "Self-test collector: Motivo :INCOMPLETE-PROCESS, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 28 :DIRECTORY
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-28-nonterminal-record/")
   :CHECKS 14)
  (:NAME "unfinished-record" :STATUS :FAILED :DIAGNOSTIC
   #A((102) BASE-CHAR
      . "Self-test collector: Motivo :INCOMPLETE-PROCESS, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 29 :DIRECTORY
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-29-unfinished-record/")
   :CHECKS 14)
  (:NAME "invalid-record-metadata" :STATUS :FAILED :DIAGNOSTIC
   #A((100) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-METADATA, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 30 :DIRECTORY
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-30-invalid-record-metadata/")
   :CHECKS 14)
  (:NAME "ok-with-failing-exit" :STATUS :FAILED :DIAGNOSTIC
   #A((100) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-METADATA, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 31 :DIRECTORY
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-31-ok-with-failing-exit/")
   :CHECKS 14)
  (:NAME "ok-with-changed-source" :STATUS :FAILED :DIAGNOSTIC
   #A((100) BASE-CHAR
      . "Self-test collector: Motivo :PROCESS-METADATA, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 32 :DIRECTORY
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-32-ok-with-changed-source/")
   :CHECKS 14)
  (:NAME "explicit-gzip-payload-required" :STATUS :FAILED :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :DECODED-RECORD, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 33 :DIRECTORY
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-33-explicit-gzip-payload-required/")
   :CHECKS 14)
  (:NAME "accessory-descriptor-also-needs-explicit-payload" :STATUS :FAILED
   :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :DECODED-RECORD, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 34 :DIRECTORY
   #A((193) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-34-accessory-descriptor-also-needs-explicit-payload/")
   :CHECKS 14)
  (:NAME "accessory-compressed-record-retained-with-payload" :STATUS :FAILED
   :DIAGNOSTIC
   #A((64) BASE-CHAR
      . "Raccolta rifiutata :RELATIVE-PATH: Nome di percorso non ammesso.")
   :CASE-ID 35 :DIRECTORY
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-35-accessory-compressed-record-retained-with-payload/")
   :CHECKS 14)
  (:NAME "gzip-target-must-match-descriptor" :STATUS :FAILED :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :DECODED-RECORD, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 36 :DIRECTORY
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-36-gzip-target-must-match-descriptor/")
   :CHECKS 14)
  (:NAME "descriptor-hash-mismatch" :STATUS :FAILED :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :DECODED-RECORD, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 37 :DIRECTORY
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-37-descriptor-hash-mismatch/")
   :CHECKS 14)
  (:NAME "source-leaf-symlink" :STATUS :FAILED :DIAGNOSTIC
   #A((101) BASE-CHAR
      . "Self-test collector: Motivo :NONREGULAR-SOURCE, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 38 :DIRECTORY
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-38-source-leaf-symlink/")
   :CHECKS 14)
  (:NAME "plain-budget-exact-boundary" :STATUS :FAILED :DIAGNOSTIC
   #A((64) BASE-CHAR
      . "Raccolta rifiutata :RELATIVE-PATH: Nome di percorso non ammesso.")
   :CASE-ID 39 :DIRECTORY
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-39-plain-budget-exact-boundary/")
   :CHECKS 14)
  (:NAME "gzip-budget-exact-boundary" :STATUS :FAILED :DIAGNOSTIC
   #A((64) BASE-CHAR
      . "Raccolta rifiutata :RELATIVE-PATH: Nome di percorso non ammesso.")
   :CASE-ID 40 :DIRECTORY
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-40-gzip-budget-exact-boundary/")
   :CHECKS 14)
  (:NAME "plain-budget-over" :STATUS :FAILED :DIAGNOSTIC
   #A((95) BASE-CHAR
      . "Self-test collector: Motivo :FILE-BUDGET, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 41 :DIRECTORY
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-41-plain-budget-over/")
   :CHECKS 14)
  (:NAME "gzip-budget-over" :STATUS :FAILED :DIAGNOSTIC
   #A((95) BASE-CHAR
      . "Self-test collector: Motivo :FILE-BUDGET, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 42 :DIRECTORY
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-42-gzip-budget-over/")
   :CHECKS 14)
  (:NAME "existing-destination-never-overwritten" :STATUS :FAILED :DIAGNOSTIC
   #A((104) BASE-CHAR
      . "Self-test collector: Motivo :EXISTING-DESTINATION, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 43 :DIRECTORY
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-43-existing-destination-never-overwritten/")
   :CHECKS 15)
  (:NAME "existing-observations-never-overwritten" :STATUS :FAILED :DIAGNOSTIC
   #A((105) BASE-CHAR
      . "Self-test collector: Motivo :EXISTING-OBSERVATIONS, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 44 :DIRECTORY
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-44-existing-observations-never-overwritten/")
   :CHECKS 15)
  (:NAME #5="destination-observations-overlap" :STATUS :FAILED :DIAGNOSTIC
   #A((96) BASE-CHAR
      . "Self-test collector: Motivo :PATH-OVERLAP, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 45 :DIRECTORY
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-45-destination-observations-overlap/")
   :CHECKS 14)
  (:NAME #5# :STATUS :FAILED :DIAGNOSTIC
   #A((96) BASE-CHAR
      . "Self-test collector: Motivo :PATH-OVERLAP, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 46 :DIRECTORY
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-46-destination-observations-overlap/")
   :CHECKS 14)
  (:NAME #5# :STATUS :FAILED :DIAGNOSTIC
   #A((96) BASE-CHAR
      . "Self-test collector: Motivo :PATH-OVERLAP, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 47 :DIRECTORY
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-47-destination-observations-overlap/")
   :CHECKS 14)
  (:NAME "corrupt-copy-retains-failure" :STATUS :FAILED :DIAGNOSTIC
   #A((96) BASE-CHAR
      . "Self-test collector: Motivo :COPIED-BYTES, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 48 :DIRECTORY
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-48-corrupt-copy-retains-failure/")
   :CHECKS 14)
  (:NAME "source-change-retains-failure" :STATUS :FAILED :DIAGNOSTIC
   #A((98) BASE-CHAR
      . "Self-test collector: Motivo :SOURCE-CHANGED, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 49 :DIRECTORY
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-49-source-change-retains-failure/")
   :CHECKS 14)
  (:NAME "unindexed-extra-rejected-by-final-checker" :STATUS :FAILED
   :DIAGNOSTIC
   #A((96) BASE-CHAR
      . "Self-test collector: Motivo :CLOSED-CHECK, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 50 :DIRECTORY
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-50-unindexed-extra-rejected-by-final-checker/")
   :CHECKS 14)
  (:NAME "manifest-read-eval-disabled" :STATUS :FAILED :DIAGNOSTIC
   #A((94) BASE-CHAR
      . "Self-test collector: Motivo :DATA-SHAPE, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 51 :DIRECTORY
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-51-manifest-read-eval-disabled/")
   :CHECKS 14)
  (:NAME "manifest-eof-required" :STATUS :FAILED :DIAGNOSTIC
   #A((94) BASE-CHAR
      . "Self-test collector: Motivo :DATA-SHAPE, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 52 :DIRECTORY
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-52-manifest-eof-required/")
   :CHECKS 14)
  (:NAME "record-read-eval-disabled" :STATUS :FAILED :DIAGNOSTIC
   #A((94) BASE-CHAR
      . "Self-test collector: Motivo :DATA-SHAPE, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 53 :DIRECTORY
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-53-record-read-eval-disabled/")
   :CHECKS 14)
  (:NAME "record-eof-required" :STATUS :FAILED :DIAGNOSTIC
   #A((94) BASE-CHAR
      . "Self-test collector: Motivo :DATA-SHAPE, osservato :RELATIVE-PATH/Nome di percorso non ammesso")
   :CASE-ID 54 :DIRECTORY
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-54-record-eof-required/")
   :CHECKS 14)
  (:NAME #6="cli-arguments" :STATUS :OK :DETAIL T :CASE-ID 55 :DIRECTORY
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-55-cli-arguments/")
   :CHECKS 2)
  (:NAME #6# :STATUS :OK :DETAIL T :CASE-ID 56 :DIRECTORY
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-56-cli-arguments/")
   :CHECKS 2)
  (:NAME #6# :STATUS :OK :DETAIL T :CASE-ID 57 :DIRECTORY
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-57-cli-arguments/")
   :CHECKS 2)
  (:NAME #6# :STATUS :OK :DETAIL T :CASE-ID 58 :DIRECTORY
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-58-cli-arguments/")
   :CHECKS 2)
  (:NAME #6# :STATUS :OK :DETAIL T :CASE-ID 59 :DIRECTORY
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/case-59-cli-arguments/")
   :CHECKS 2))
 :ROOT
 #A((136) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/command-archive-collector-self-test-7ftAjf/")
 :FIXTURES-PRESERVED T :PRODUCT-CAMPAIGNS NIL :SCALING-CLAIM NIL :MCDC-CLAIM
 NIL)
