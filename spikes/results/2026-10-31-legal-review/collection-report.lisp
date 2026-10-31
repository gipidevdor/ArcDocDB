(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((132) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-legal-review/collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-legal-review-originals/"
   :INDEXED-FILES 55 :ACTUAL-FILES 57 :INDEXED-BYTES 7850413 :PROCESSES
   ((:LABEL "check-notices" :RECORD-PATH "processes/check-notices/report.lisp"
     :COMMAND ("make" "legal-check") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "unicode-check" :RECORD-PATH "processes/unicode-check/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/fulltext-unicode-tables.lisp" "--check" "data/unicode/18.0.0/"
      "src/fulltext/unicode-tables.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "docs-setup" :RECORD-PATH "processes/docs-setup/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/pages/bootstrap.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "check-notices-final" :RECORD-PATH
     "processes/check-notices-final/report.lisp" :COMMAND
     ("make" "legal-check") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
     :STABLE)
    (:LABEL "unicode-check-final" :RECORD-PATH
     "processes/unicode-check-final/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/fulltext-unicode-tables.lisp" "--check" "data/unicode/18.0.0/"
      "src/fulltext/unicode-tables.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "docs-check" :RECORD-PATH "processes/docs-check/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "notices-qualified" :RECORD-PATH
     "processes/notices-qualified/report.lisp" :COMMAND ("make" "legal-check")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "docs-qualified" :RECORD-PATH
     "processes/docs-qualified/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "package" :RECORD-PATH "processes/package/report.lisp" :COMMAND
     ("make" "legal-notices") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
     :STABLE)
    (:LABEL "security-reporting" :RECORD-PATH
     "processes/security-reporting/report.lisp" :COMMAND
     ("gh" "api" "repos/gipidevdor/ArcDocDB/private-vulnerability-reporting")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "artifact-check" :RECORD-PATH
     "processes/artifact-check/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/legal-notices.lisp" "--check-artifact" "_build/legal-notices/")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp" "--write")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint" :RECORD-PATH "processes/lint/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace" :RECORD-PATH "processes/trace/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links" :RECORD-PATH "processes/links/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "notices-complete" :RECORD-PATH
     "processes/notices-complete/report.lisp" :COMMAND ("make" "legal-check")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "docs-complete" :RECORD-PATH "processes/docs-complete/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/pages/build.lisp" "--test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "package-complete" :RECORD-PATH
     "processes/package-complete/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/legal-notices.lisp" "--stage-new"
      "_build/legal-notices-complete/")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "unicode-complete" :RECORD-PATH
     "processes/unicode-complete/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/fulltext-unicode-tables.lisp" "--check" "data/unicode/18.0.0/"
      "src/fulltext/unicode-tables.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "artifact-complete" :RECORD-PATH
     "processes/artifact-complete/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/legal-notices.lisp" "--check-artifact"
      "_build/legal-notices-complete/")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint-complete" :RECORD-PATH "processes/lint-complete/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-complete" :RECORD-PATH
     "processes/trace-complete/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links-complete" :RECORD-PATH
     "processes/links-complete/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "a478e92ac30b0c2733e8f980ca15d02fb87562bd1dcab80b2539e8342a725506"
   :CATALOGUE-SHA256
   "855692f41530aad6d8f37a2eaa382fa9c5ffd2e3fca0be7b18f2d4a7337f50c9"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (18 18 1 18) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/check-notices/report.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/check-notices/report.lisp")
    :BYTES 330418 :SHA256
    "24eb16cde7dbb018833bade8a11ff3be616bdcca33328f1e875f1142a3ae72cf"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/check-notices/conservazione.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/check-notices/conservazione.lisp")
    :BYTES 1177 :SHA256
    "1572227055bbd87865631342d0204b70e19598043092dfef548f1d94c82f213f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/unicode-check/report.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/unicode-check/report.lisp")
    :BYTES 336837 :SHA256
    "192ff87102532d175748de852372b2d2e28be0275db8a34ee008c038a53d6592"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/unicode-check/conservazione.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/unicode-check/conservazione.lisp")
    :BYTES 1177 :SHA256
    "2b942d933115589e8f80cde99a893847dc676e53127833d90de43d1c0351510c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((32) BASE-CHAR . "processes/docs-setup/report.lisp") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/docs-setup/report.lisp")
    :BYTES 330584 :SHA256
    "eaca4d5c410cb7be53043d317a2bd30e921fb1fb2de1afc89caaa9294d391976"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/docs-setup/conservazione.lisp")
    :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/docs-setup/conservazione.lisp")
    :BYTES 1171 :SHA256
    "a6594ea7a0201bc71974a747ba1fa7a8413408c51059f9d815e82beafcfed3e8"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/check-notices-final/report.lisp")
    :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/check-notices-final/report.lisp")
    :BYTES 330418 :SHA256
    "6c64530fc6b9e3acc5408a5ebe6d207d9721198eb22764e453c5a7990d8c7b0e"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((48) BASE-CHAR . "processes/check-notices-final/conservazione.lisp")
    :SOURCE
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/check-notices-final/conservazione.lisp")
    :BYTES 1189 :SHA256
    "3f3b08a4b462dccbe8df3719cc4f8ca5e9cc0f7380229cc589b00e1d03c9dcb9"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/unicode-check-final/report.lisp")
    :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/unicode-check-final/report.lisp")
    :BYTES 330587 :SHA256
    "55eb31a302f7fc06bff8f04d7768e24c03bd960e8d52427403f53b4fe50daac2"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((48) BASE-CHAR . "processes/unicode-check-final/conservazione.lisp")
    :SOURCE
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/unicode-check-final/conservazione.lisp")
    :BYTES 1189 :SHA256
    "a4e935c34546deb48116b283fae08c3ec656ba92535a2bfc5a7eb277d3e3ad80"))
  (:STATUS :OK :ENTRY
   (:PATH #A((32) BASE-CHAR . "processes/docs-check/report.lisp") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/docs-check/report.lisp")
    :BYTES 338120 :SHA256
    "4fc6631a0e807e58c4916dd04f248b830388062f3c243707017cb3ad2a0c5114"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/docs-check/conservazione.lisp")
    :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/docs-check/conservazione.lisp")
    :BYTES 1171 :SHA256
    "2ffbfc35f7d9c8327de48d9cb42cec932826bce2b2e2131ccc1896c061090d21"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/notices-qualified/report.lisp")
    :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/notices-qualified/report.lisp")
    :BYTES 330418 :SHA256
    "08826e3adb86264f168e9c1593224f271c3ef180ad532b8e0494838856ad72df"))
  (:STATUS :OK :ENTRY
   (:PATH #A((46) BASE-CHAR . "processes/notices-qualified/conservazione.lisp")
    :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/notices-qualified/conservazione.lisp")
    :BYTES 1185 :SHA256
    "138a875b3787ef4a5dc0c3f872f07a8cec0f132b0196da236905e28dec91bea2"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/docs-qualified/report.lisp") :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/docs-qualified/report.lisp")
    :BYTES 332742 :SHA256
    "6564162b482d36168459e7293592e00a47adeb96337775ade21ce71e8d6875f7"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/docs-qualified/conservazione.lisp")
    :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/docs-qualified/conservazione.lisp")
    :BYTES 1179 :SHA256
    "07d532ed57b0c003a612d04148b71d3595182038364aaaef6ff6413d551ad688"))
  (:STATUS :OK :ENTRY
   (:PATH #A((29) BASE-CHAR . "processes/package/report.lisp") :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/package/report.lisp")
    :BYTES 330322 :SHA256
    "b527d0e7a1731452f5ad823e62ff035be74b1f78f802ac71406628716364f1f9"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/package/conservazione.lisp") :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/package/conservazione.lisp")
    :BYTES 1165 :SHA256
    "3dc101ca99a8a0e5e761c8d8aa482e3218748b5ac97f7a83f63414f0de3eca1e"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/security-reporting/report.lisp")
    :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/security-reporting/report.lisp")
    :BYTES 330232 :SHA256
    "a3c99b1fbfd5891fd13340010a54b1359fb2f512d9e0709bfcb891e372058add"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((47) BASE-CHAR . "processes/security-reporting/conservazione.lisp")
    :SOURCE
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/security-reporting/conservazione.lisp")
    :BYTES 1187 :SHA256
    "c3ebe21a00f200bf97551366d6601554369f52a19fe4374a370b9bc308f36516"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/artifact-check/report.lisp") :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/artifact-check/report.lisp")
    :BYTES 330451 :SHA256
    "dfc7490df8a5225646b153572b47c1cd64de21e1a2373c32bb69f4eeb7a555c0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/artifact-check/conservazione.lisp")
    :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/artifact-check/conservazione.lisp")
    :BYTES 1177 :SHA256
    "0dc54eb3d780048c40280241fc116c4ab5353eb67237cb899ccc384c7f6323e2"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/trace-write/report.lisp")
    :BYTES 330423 :SHA256
    "133c717740d92065f0f5e72ed7f392e65f63ebc54d387f6a5066fad99f63cfa7"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/trace-write/conservazione.lisp")
    :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/trace-write/conservazione.lisp")
    :BYTES 1172 :SHA256
    "f3fabbf91c1b446c616468580b50f08ffd41f2d2a8b98a2ab1c1408120940e06"))
  (:STATUS :OK :ENTRY
   (:PATH #A((26) BASE-CHAR . "processes/lint/report.lisp") :SOURCE
    #A((115) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/lint/report.lisp")
    :BYTES 330335 :SHA256
    "b64e6084f90a0355a26cd27a523166adf6a9090fa4dd0a37f5908f847ac6b140"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/lint/conservazione.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/lint/conservazione.lisp")
    :BYTES 1158 :SHA256
    "f5007863a94a0f89ed3865d98ce84b8397880a30c033da3e8ca133e1fef7e7dd"))
  (:STATUS :OK :ENTRY
   (:PATH #A((27) BASE-CHAR . "processes/trace/report.lisp") :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/trace/report.lisp")
    :BYTES 330353 :SHA256
    "e4f31cfe6e82c573b0e7b23024bd26272895aebbc2e3246e570ca81bd63d10c9"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/trace/conservazione.lisp") :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/trace/conservazione.lisp")
    :BYTES 1160 :SHA256
    "bf73483179ba27fc239af882453bbc1259c31133369fd138e538a5ea5196cb57"))
  (:STATUS :OK :ENTRY
   (:PATH #A((27) BASE-CHAR . "processes/links/report.lisp") :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/links/report.lisp")
    :BYTES 330332 :SHA256
    "c1c187b2d0ea9571be2327bab4dd16243e35e32fe1269cf4179591fadd95b744"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/links/conservazione.lisp") :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/links/conservazione.lisp")
    :BYTES 1160 :SHA256
    "408d28a69f67a6cbb480b5803d27ae92a559e90a751ade6a4103f9c955f6419f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/notices-complete/report.lisp") :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/notices-complete/report.lisp")
    :BYTES 330640 :SHA256
    "b2754a7eadb24c56e04eebf42bcc1c08a390be8b37f2017bcae90a04069bc143"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/notices-complete/conservazione.lisp")
    :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/notices-complete/conservazione.lisp")
    :BYTES 1182 :SHA256
    "840a387c2da9b0aa14b323ac3c1eadaf67aa719a2087166b5ba1417c8b9972fd"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/docs-complete/report.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/docs-complete/report.lisp")
    :BYTES 332965 :SHA256
    "a554a8437b5290cfbd64c5fe789e0f6c090caf8c07070e6e35f71b00af1076f0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/docs-complete/conservazione.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/docs-complete/conservazione.lisp")
    :BYTES 1176 :SHA256
    "c20d81675117f2a9f6746fdad650c63be2e1d59fd4a4ea3ae615c291581be110"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/package-complete/report.lisp") :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/package-complete/report.lisp")
    :BYTES 330666 :SHA256
    "b096770e2570609a31a8638b3a48712cb99e186d5d80bad08a55feb960f7f33a"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/package-complete/conservazione.lisp")
    :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/package-complete/conservazione.lisp")
    :BYTES 1182 :SHA256
    "ddddb912aa11d08f6fccd669153e2a3d6cdc16add944941376fa96d1e1dc07d5"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/unicode-complete/report.lisp") :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/unicode-complete/report.lisp")
    :BYTES 330809 :SHA256
    "a798d5430cf901f5c8b6c71c6c3e2ce10878653efca9219f09c4ee0b7ed7fe02"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/unicode-complete/conservazione.lisp")
    :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/unicode-complete/conservazione.lisp")
    :BYTES 1182 :SHA256
    "a48d0f1899f074684e1135019dbac96c6328a238b86170fb3e8fc875c115b217"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/artifact-complete/report.lisp")
    :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/artifact-complete/report.lisp")
    :BYTES 330682 :SHA256
    "092c93461601360fd88081eb149b73c35c089999b0dd944b00736ab95c937aff"))
  (:STATUS :OK :ENTRY
   (:PATH #A((46) BASE-CHAR . "processes/artifact-complete/conservazione.lisp")
    :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/artifact-complete/conservazione.lisp")
    :BYTES 1184 :SHA256
    "2851c4e92e9d5816076c06e296705a2f94ef677aa7d920625b06b7892a70510f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/lint-complete/report.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/lint-complete/report.lisp")
    :BYTES 330557 :SHA256
    "2728cde01e5008af57dece45da86b87b547ef7d1759fa5cf680070884524abf0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/lint-complete/conservazione.lisp")
    :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/lint-complete/conservazione.lisp")
    :BYTES 1175 :SHA256
    "3f37dbf799b7ab61fa473ac912473c24a30b6c2018442af3c33b2655cf12c44f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/trace-complete/report.lisp") :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/trace-complete/report.lisp")
    :BYTES 330575 :SHA256
    "399a596e30174a24b82fa845b145867d877f3234871f7ef7942f665f55753f40"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/trace-complete/conservazione.lisp")
    :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/trace-complete/conservazione.lisp")
    :BYTES 1178 :SHA256
    "99ba042ba8ddf78fd5ed6eec7fb0f16986b2ab58e9bfdf7f74dbecbb87e557ae"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/links-complete/report.lisp") :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/links-complete/report.lisp")
    :BYTES 330554 :SHA256
    "ad0a9ec6782ca35cc31a05399df1a089bc31a74119bf31bb5ae46628910e28ca"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/links-complete/conservazione.lisp")
    :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/links-complete/conservazione.lisp")
    :BYTES 1178 :SHA256
    "eb1f361aca7003dabc4c3d1f92c4568b791dbeaed97ddd195ace69533d3e6ad6"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/upstream-audit-initial.json" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/upstream-audit.json")
    :BYTES 77411 :SHA256
    "8e43166d421da364eeacaa73879ea98c0614e3a8663dac73eb26fbd5c23deaf8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/notice-follow-up.json" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/notice-follow-up.json")
    :BYTES 42927 :SHA256
    "1f066bc4cbafba757704ca77818635286649b22b644974f9f001d6954b8125d6"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/table-payload.json" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/table-payload.json")
    :BYTES 210 :SHA256
    "40bc1068e9b7e565ad1f9b42b5c1c014fa45cd4caf9d81571f3ec31c0b86eefc"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/algorithm-reference.json" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/algorithm-reference.json")
    :BYTES 542 :SHA256
    "e493b72e242068a14a423439f33fe9a06352971974c397cd0057a65994f03672"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/upstream-requests.tsv" :SOURCE
    #A((111) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/out/legal-review-20261031/requests.tsv")
    :BYTES 28064 :SHA256
    "307859a1bcbd690c9233f8d0f720dc964a6afd6650dc64f89d94548f21813bea"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/upstream-audit-helper.py.txt" :SOURCE
    #A((38) BASE-CHAR . "/private/tmp/arcdocdb-license-audit.py") :BYTES 5320
    :SHA256
    "0c5b7cd3ef199ad924375dc853ede8ef3e5f28195a8c0aa2450bc5c41c440d8a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/archive-helper.lisp.txt" :SOURCE
    #A((40) BASE-CHAR . "/private/tmp/arcdocdb-legal-archive.lisp") :BYTES 2180
    :SHA256
    "afcd215529335e23b3ab76c954f1fc638a23c5709db03dc02250fb5de79b133d"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((47) BASE-CHAR . "/private/tmp/arcdocdb-legal-archive-inputs.lisp")
    :BYTES 15417 :SHA256
    "a3b76967a93284041e3e46ac6a0b026346d2cef384f18360845992bd202228fa"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((13) BASE-CHAR . "check-notices") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/check-notices/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "legal-check")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "unicode-check") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/unicode-check/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/fulltext-unicode-tables.lisp")
    #A((7) BASE-CHAR . "--check") #A((20) BASE-CHAR . "data/unicode/18.0.0/")
    #A((32) BASE-CHAR . "src/fulltext/unicode-tables.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "docs-setup") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/docs-setup/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((26) BASE-CHAR . "tools/pages/bootstrap.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((19) BASE-CHAR . "check-notices-final") :RECORD-PATH
   #A((41) BASE-CHAR . "processes/check-notices-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "legal-check")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((19) BASE-CHAR . "unicode-check-final") :RECORD-PATH
   #A((41) BASE-CHAR . "processes/unicode-check-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/fulltext-unicode-tables.lisp")
    #A((7) BASE-CHAR . "--check") #A((20) BASE-CHAR . "data/unicode/18.0.0/")
    #A((32) BASE-CHAR . "src/fulltext/unicode-tables.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "docs-check") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/docs-check/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/pages/build.lisp") #A((6) BASE-CHAR . "--test"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((17) BASE-CHAR . "notices-qualified") :RECORD-PATH
   #A((39) BASE-CHAR . "processes/notices-qualified/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "legal-check")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "docs-qualified") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/docs-qualified/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/pages/build.lisp") #A((6) BASE-CHAR . "--test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((7) BASE-CHAR . "package") :RECORD-PATH
   #A((29) BASE-CHAR . "processes/package/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((13) BASE-CHAR . "legal-notices")) :STATUS
   :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((18) BASE-CHAR . "security-reporting") :RECORD-PATH
   #A((40) BASE-CHAR . "processes/security-reporting/report.lisp") :COMMAND
   (#A((2) BASE-CHAR . "gh") #A((3) BASE-CHAR . "api")
    #A((57) BASE-CHAR
       . "repos/gipidevdor/ArcDocDB/private-vulnerability-reporting"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "artifact-check") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/artifact-check/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((24) BASE-CHAR . "tools/legal-notices.lisp")
    #A((16) BASE-CHAR . "--check-artifact")
    #A((21) BASE-CHAR . "_build/legal-notices/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "trace-write") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp")
    #A((7) BASE-CHAR . "--write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((4) BASE-CHAR . "lint") :RECORD-PATH
   #A((26) BASE-CHAR . "processes/lint/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "trace") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/trace/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "links") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/links/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((16) BASE-CHAR . "notices-complete") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/notices-complete/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "legal-check")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "docs-complete") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/docs-complete/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/pages/build.lisp") #A((6) BASE-CHAR . "--test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((16) BASE-CHAR . "package-complete") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/package-complete/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((24) BASE-CHAR . "tools/legal-notices.lisp")
    #A((11) BASE-CHAR . "--stage-new")
    #A((30) BASE-CHAR . "_build/legal-notices-complete/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((16) BASE-CHAR . "unicode-complete") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/unicode-complete/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/fulltext-unicode-tables.lisp")
    #A((7) BASE-CHAR . "--check") #A((20) BASE-CHAR . "data/unicode/18.0.0/")
    #A((32) BASE-CHAR . "src/fulltext/unicode-tables.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((17) BASE-CHAR . "artifact-complete") :RECORD-PATH
   #A((39) BASE-CHAR . "processes/artifact-complete/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((24) BASE-CHAR . "tools/legal-notices.lisp")
    #A((16) BASE-CHAR . "--check-artifact")
    #A((30) BASE-CHAR . "_build/legal-notices-complete/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "lint-complete") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/lint-complete/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "trace-complete") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/trace-complete/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "links-complete") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/links-complete/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 55 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((115) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-legal-review-originals/")
 :OBSERVATIONS
 #A((116) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/legal-distribution/ArcDocDB/spikes/results/2026-10-31-legal-review/collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
