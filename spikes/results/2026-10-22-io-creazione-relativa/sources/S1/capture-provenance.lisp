(:SCHEMA-VERSION 1 :KIND :SOURCE-RECONSTRUCTION-PROVENANCE :STATUS :CLOSED :FROZEN-GIT-COMMIT
 "b5ad739ba1fc0252920c088e2442140e448451ad" :CAPTURE-POLICY
 :RECONSTRUCTED-AFTER-FREEZE-FROM-IMMUTABLE-GIT-BLOBS :RUN-RELATIONSHIP
 :NOT-A-SNAPSHOT-CAPTURED-DURING-EXECUTION :HEAD-OBSERVED-AT-CAPTURE
 "bb561af43ec846d37fdc7be9743098a764048a7a" :WORKING-TREE-POLICY
 :NOT-REQUIRED-CLEAN-IMMUTABLE-GIT-BLOBS-ONLY :EARLIER-ATTEMPT
 (:STATUS :STOPPED-BEFORE-SOURCE-COPY :CAUSE
  :WORKTREE-CLEANLINESS-PRECONDITION-NO-LONGER-APPLICABLE :PROCEDURE
  "spikes/out/creazione-relativa-publication/prepare-source-S1.lisp.txt" :STDOUT
  "spikes/out/creazione-relativa-publication/prepare-source-S1.stdout.txt" :STDERR
  "spikes/out/creazione-relativa-publication/prepare-source-S1.stderr.txt")
 :ORIGINAL-RUN-DATE "2026-10-17" :STARTED-AT-UNIVERSAL-TIME 4001676194 :STARTED-AT-UTC
 #A((20) BASE-CHAR . "2026-10-22T16:43:14Z") :FINISHED-AT-UNIVERSAL-TIME 4001676200
 :FINISHED-AT-UTC #A((20) BASE-CHAR . "2026-10-22T16:43:20Z") :PROCEDURE
 "spikes/out/creazione-relativa-publication/prepare-source-S1-R2.lisp.txt" :PROCEDURE-BYTES 6619
 :PROCEDURE-SHA256 "ea84d356bc45c5182aedb792f7b4226647c013b38cfb49ed00f84b58b20e03ed" :COMMANDS
 (("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "HEAD")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "diff-tree" "--no-commit-id" "--name-only" "-r" "b5ad739ba1fc0252920c088e2442140e448451ad")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:CHANGELOG.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:CHANGELOG.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/CHANGELOG.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:arcdocdb.asd")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:arcdocdb.asd")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/arcdocdb.asd.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/README.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/README.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/README.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse"
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa-metodo.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show"
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa-metodo.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa-metodo.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse"
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa-revisione.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show"
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa-revisione.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa-revisione.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse"
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/prova-verticale.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/prova-verticale.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/prova-verticale.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/roadmap.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:docs/roadmap.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/roadmap.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/create-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/create-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/create-relative.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/native-create-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/native-create-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/native-create-relative.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/native-open-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/native-open-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/native-open-relative.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/open-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/open-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/open-relative.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/package.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/package.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/package.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/types.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/types.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/types.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative-native.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative-native.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative-native.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative-support.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative-support.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative-support.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative.lisp.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/vertical/method.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/vertical/method.md")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/vertical/method.md.txt"))
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "rev-parse" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/vertical/support.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "show" "b5ad739ba1fc0252920c088e2442140e448451ad:tests/vertical/support.lisp")
  ("git" "-C"
   #A((69) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/")
   "hash-object"
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/vertical/support.lisp.txt")))
 :RECORDS-MATCHED-AS-DATA
 ("spikes/out/creazione-relativa-R1/report.lisp"
  "spikes/out/4001237419-command-89011-0/report.lisp")
 :FILES
 ((:ORIGINAL "CHANGELOG.md" :GIT-SPEC "b5ad739ba1fc0252920c088e2442140e448451ad:CHANGELOG.md"
   :GIT-BLOB "8201d2a38e1a4bf3c2b976ca6aa71ce6538dc150" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/CHANGELOG.md.txt" :BYTES 36136 :SHA256
   "774b9dc20f5e335307c114f1a687d8aace9fa0a3fa4418f54dc28b7a5509d326")
  (:ORIGINAL "arcdocdb.asd" :GIT-SPEC "b5ad739ba1fc0252920c088e2442140e448451ad:arcdocdb.asd"
   :GIT-BLOB "7f012f9d3b9e292e4436d9f46ebab4bc49e5a5a6" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/arcdocdb.asd.txt" :BYTES 23792 :SHA256
   "8befb245892d1903979e547cd0c1eb27050ff3c4ba59cbdbfc57cc1ea3817980")
  (:ORIGINAL "docs/implementazione/README.md" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/README.md" :GIT-BLOB
   "251c80738dc0eccae317a69688d19d0b117951ec" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/README.md.txt" :BYTES
   18609 :SHA256 "c0ca9e1cb694a27345be768575790982d3f892664411e9b6144eaaf829ddfc28")
  (:ORIGINAL "docs/implementazione/io-creazione-relativa-metodo.md" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa-metodo.md"
   :GIT-BLOB "47d46d63f741410d3f3f6bbed64b99d905c0b06c" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa-metodo.md.txt"
   :BYTES 6209 :SHA256 "d94511192a422d4fc506d89bcd2cd76974d79d7c2a771282fdce0e4a76837f8d")
  (:ORIGINAL "docs/implementazione/io-creazione-relativa-revisione.md" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa-revisione.md"
   :GIT-BLOB "0120cb5d4efec0a4adde9877b417aaad5181af7c" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa-revisione.md.txt"
   :BYTES 4213 :SHA256 "8780ea5690eba71858ee9d116cd616bec8d92c15e202be5496280bdfc38e6c40")
  (:ORIGINAL "docs/implementazione/io-creazione-relativa.md" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io-creazione-relativa.md"
   :GIT-BLOB "8911e5f76ec7ef919ca74af907b3f0842b2a51ab" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa.md.txt"
   :BYTES 2571 :SHA256 "1af4522ec6d1bcff095f39de7df4a783d9bec231cb230089b500bc3855676f4a")
  (:ORIGINAL "docs/implementazione/io.md" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/io.md" :GIT-BLOB
   "60bf873451259cd1dd2cf31cad3122195fffdad1" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io.md.txt" :BYTES 9849
   :SHA256 "19d7ecb74f35699a948756845727d2de151563868caf99de996da8812d1ad696")
  (:ORIGINAL "docs/implementazione/prova-verticale.md" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:docs/implementazione/prova-verticale.md" :GIT-BLOB
   "797aff287aed7a8d195f04d0dae705680cb76de5" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/prova-verticale.md.txt"
   :BYTES 7499 :SHA256 "00f6e671fc7adf5eaa1b0cbe94304808965fc74facc70851707c9674c016639b")
  (:ORIGINAL "docs/roadmap.md" :GIT-SPEC "b5ad739ba1fc0252920c088e2442140e448451ad:docs/roadmap.md"
   :GIT-BLOB "5fc605ebe829018aaaa08c27de6eae4527c7e5a9" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/docs/roadmap.md.txt" :BYTES 15171 :SHA256
   "a496373e57b7aed3223f80672dba120c6583bf66e110702c6bdbae57e991c9b7")
  (:ORIGINAL "src/io/create-relative.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/create-relative.lisp" :GIT-BLOB
   "4efe755dfbce6df892c864b26e7a2b77f7b6bed3" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/src/io/create-relative.lisp.txt" :BYTES
   5960 :SHA256 "444a479156881ad66fd2a63460f42116f25f9f5a749442ce911d6bca2540c86f")
  (:ORIGINAL "src/io/native-create-relative.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/native-create-relative.lisp" :GIT-BLOB
   "85c0d583b527933b62208c660788aa5a3bfc8e60" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/src/io/native-create-relative.lisp.txt"
   :BYTES 2180 :SHA256 "56b824eb7c4ad9ee1a3e3b8bf3690e117d28d1fa4cb2e8e3a282ba252f14b121")
  (:ORIGINAL "src/io/native-open-relative.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/native-open-relative.lisp" :GIT-BLOB
   "3cd9fed0cf0ad49b9bcbcd1cd9457581db6a31b0" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/src/io/native-open-relative.lisp.txt"
   :BYTES 2178 :SHA256 "5d3b7f128061a7b5fbae7ff611c1fe4b1e6e7e83e4909789dc1cbb5efeae0242")
  (:ORIGINAL "src/io/open-relative.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/open-relative.lisp" :GIT-BLOB
   "aa64c30d62836c92eeb4d9ea2867b44b5fcbe04c" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/src/io/open-relative.lisp.txt" :BYTES 10396
   :SHA256 "78faa5443804b61daca3bb58433064ce680a4ef50066541869c3affe2f01922c")
  (:ORIGINAL "src/io/package.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/package.lisp" :GIT-BLOB
   "dab69b9611ba4874b19c67d8ae6dffe901d6d86d" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/src/io/package.lisp.txt" :BYTES 911 :SHA256
   "3654b5eb7f060615debfc9b36aa5bc43d8be3e049cfafec879efca41c21faab5")
  (:ORIGINAL "src/io/types.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:src/io/types.lisp" :GIT-BLOB
   "29c1e9b309e8bd78cd662e622d681e0720a16e11" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/src/io/types.lisp.txt" :BYTES 5699 :SHA256
   "aab5bc1d17bbb848785222385686bc21443fc824cfae1569355e67fba646d70d")
  (:ORIGINAL "tests/io/create-relative-native.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative-native.lisp" :GIT-BLOB
   "fd5e819e2197869a93259857aacfa68bfe9e9a44" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative-native.lisp.txt"
   :BYTES 9736 :SHA256 "93c711a1b7ec5e8a23c1c1d713867c153aab043d144de7644c856711634a9a95")
  (:ORIGINAL "tests/io/create-relative-support.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative-support.lisp" :GIT-BLOB
   "8382ffb8f04b6d2fc3e4adb89f995c9c37b0e445" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative-support.lisp.txt"
   :BYTES 6334 :SHA256 "76df4adf981328f463d040d9d9037ad1ebe427276014333b5ed64cc55b1e8ae7")
  (:ORIGINAL "tests/io/create-relative.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:tests/io/create-relative.lisp" :GIT-BLOB
   "7fb4c3665ca1b8f6de2dedd2827cfc150dcddf02" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative.lisp.txt" :BYTES
   12385 :SHA256 "0bb3b18fdc5baa871a7be684b0681d3a6d1de4969dcb76fb8a7b1e2539479d1d")
  (:ORIGINAL "tests/vertical/method.md" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:tests/vertical/method.md" :GIT-BLOB
   "57f1f8272984822af8911e96b25c3e6434944855" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/tests/vertical/method.md.txt" :BYTES 8438
   :SHA256 "2b5019f648be9871478b8334013411b355be16510d9db751d36a3cb71495a376")
  (:ORIGINAL "tests/vertical/support.lisp" :GIT-SPEC
   "b5ad739ba1fc0252920c088e2442140e448451ad:tests/vertical/support.lisp" :GIT-BLOB
   "37c2e8d1da68eb425cdd11548f8699c888afd7bf" :COPY
   "spikes/out/creazione-relativa-publication/source-S1/tests/vertical/support.lisp.txt" :BYTES
   15199 :SHA256 "06c74c302c0dc8a9ec4ca6ac33f5a667446a278675869b5bf6c3dfbd4ed7790a")))
