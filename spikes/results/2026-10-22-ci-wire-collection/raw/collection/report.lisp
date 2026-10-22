(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((107) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-22-ci-wire-processi/"
   :INDEXED-FILES 89 :ACTUAL-FILES 91 :INDEXED-BYTES 2995375 :PROCESSES
   ((:LABEL "wire-before" :RECORD-PATH "processes/wire-before/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/ci.lisp" "self-test" "--out" "spikes/out/ci-wire-before")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "wire-after" :RECORD-PATH "processes/wire-after/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/ci.lisp" "self-test" "--out" "spikes/out/ci-wire-after")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "original-linux-replay" :RECORD-PATH
     "processes/original-linux-replay/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/out/ci-wire-audit/replay.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "full-check-wire" :RECORD-PATH
     "processes/full-check-wire/report.lisp" :COMMAND
     ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compact-before" :RECORD-PATH
     "processes/compact-before/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/ci.lisp" "self-test" "--out" "spikes/out/ci-compact-before")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compact-after" :RECORD-PATH "processes/compact-after/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/ci.lisp" "self-test" "--out" "spikes/out/ci-compact-after")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "size-bound" :RECORD-PATH "processes/size-bound/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/out/ci-wire-audit/size-bound-confirmed.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "size-bound-seal" :RECORD-PATH
     "processes/size-bound-seal/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "spikes/out/ci-wire-audit/size-bound-seal.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "full-check-final" :RECORD-PATH
     "processes/full-check-final/report.lisp" :COMMAND
     ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "814355fb2c04d4a84dcc0cf59186581db6667c0df8b82fb0ab7c7bff0635834f"
   :CATALOGUE-SHA256
   "c88f3ce2bc5ab6b57eb31337b810b0831ef6ed6255512bc42455985055cc85ee"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (7 29 29 24) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "processes/wire-before/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236375-command-62978-0/report.lisp")
    :BYTES 263780 :SHA256
    "f296a09cbd79decc366211457c90e57407212728c2eb1981f4e215924b2c1cd6"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/wire-before/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236375-command-62978-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "4a2179cec4e8c8cd9c35bc2a7b64461b6f0af93f7706f29734cf4141745b1c73"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/wire-after/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236470-command-63844-0/report.lisp")
    :BYTES 263775 :SHA256
    "7c6897b696cc0f58bcaaa56a80dd9daab0b46194cea261d88763b98a2fe122fa"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/wire-after/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236470-command-63844-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "b5795e0cb3b7a5571c5b608a2719c58f47f29158bafb08f5caea7d1a5d491d40"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/original-linux-replay/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236478-command-63941-0/report.lisp")
    :BYTES 263599 :SHA256
    "5486b9b4f7095005ec6275352e94a445e002535c1c9722b60595a850c58bc648"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/original-linux-replay/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236478-command-63941-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "5bf5e2ac8d764a8f5e13e9045579a6d35584e7a8a2adbcd1f86736738a69af4c"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check-wire/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236478-command-63957-0/report.lisp")
    :BYTES 317 :SHA256
    "b2a440da90ac90cff17fa5508b8a352bcc45900945f8ff5f5a04725f7a0ddeb1"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check-wire/report.lisp.gz" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236478-command-63957-0/report.lisp.gz")
    :BYTES 259889 :SHA256
    "2e0d98a287286211f6122c0389e9a29a49c11c6017c8ac2a89a55d65b1fa1a8b"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check-wire/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001236478-command-63957-0/conservazione.lisp")
    :BYTES 1721 :SHA256
    "031a5fb8638a576a16942c2183659ab7f49cd0b205a9be242d779b84aaa5aa28"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/compact-before/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237034-command-77024-0/report.lisp")
    :BYTES 263783 :SHA256
    "60d84d21b3f19b2a36bdd4f20bf7208bfed4044cdc1723d726d800c297d404e2"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/compact-before/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237034-command-77024-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "1422f44272df715bd31af93a65b5c81a50ac683f62b9a8bd1ce1302b13c82f13"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/compact-after/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237081-command-78703-0/report.lisp")
    :BYTES 263779 :SHA256
    "7940a890e822a222fe3329354b0dc47924a2053637d49506a626bd18aa744528"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/compact-after/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237081-command-78703-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "e79d9d6f7ee2f1b339103f7da646c997f945836b6ecf171cf707ac42f757eea6"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/size-bound/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237212-command-82223-0/report.lisp")
    :BYTES 263188 :SHA256
    "6ebb87afe90130379fc22825a40bbcaa572d9345fb1b40aaf07768ba71f4883c"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/size-bound/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237212-command-82223-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "8d200c1a59798a422ba208a3912f3a518d8128afe3e639c6c97759e05632f6fc"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/size-bound-seal/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676104-command-33678-0/report.lisp")
    :BYTES 263178 :SHA256
    "cfda3545418ca793fb7203b39193c9383b62a073e567801f82bdde7c26a6a3c5"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/size-bound-seal/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001676104-command-33678-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "836b5aa2e4fcb91161ec172ad94da11c0c641e8f3813d6b2e0b908b6f067185d"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check-final/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237079-command-78685-0/report.lisp")
    :BYTES 317 :SHA256
    "e21a519349612757e87b441367acccc8256d25ef140b711e7bb0df66a94426df"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check-final/report.lisp.gz" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237079-command-78685-0/report.lisp.gz")
    :BYTES 260013 :SHA256
    "e7bcbda0109673ae67640d83d95397a836cab2c83345d4b2c184658e5a3b660f"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check-final/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001237079-command-78685-0/conservazione.lisp")
    :BYTES 1721 :SHA256
    "fc4449c03627f0a2021fe88d906855e277a9376391e94d21f5a6d41805e5b645"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/report.lisp" :SOURCE
    #A((98) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/report.lisp")
    :BYTES 548 :SHA256
    "47532d1efafb985e123514d938f6c9625866f18d9a0a940194bea14c73ce0756"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/data.lisp" :SOURCE
    #A((96) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data.lisp")
    :BYTES 3186 :SHA256
    "6d3f417b3dda3bd64908ff08bd70feca58ab8bfddbf3b2c56ae47de7a7e7916f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/tests.lisp" :SOURCE
    #A((97) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/tests.lisp")
    :BYTES 2085 :SHA256
    "ae0d5fa207e288d093b22cbd6e01d8f2cb4223566da80e040c2c2ae837ccae4e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/conditions.lisp" :SOURCE
    #A((102) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/conditions.lisp")
    :BYTES 663 :SHA256
    "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/measure.lisp" :SOURCE
    #A((99) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/measure.lisp")
    :BYTES 2041 :SHA256
    "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/workflow.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/workflow.lisp")
    :BYTES 27556 :SHA256
    "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/boundaries.lisp" :SOURCE
    #A((102) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/boundaries.lisp")
    :BYTES 617 :SHA256
    "e3dde1942bea1dc6c4d6312abb8a4c4c800eb4e22260e490536ab03c6a0bd84d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/report.lisp" :SOURCE
    #A((97) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/report.lisp")
    :BYTES 548 :SHA256
    "e94a109d18f48f4345e65cee10c726425f8519f518db85910032d4e3f5b51189"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/data.lisp" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data.lisp")
    :BYTES 3144 :SHA256
    "6c3bd5e3200c3b256f01a6927fdd5a91d53bf2f43dee5a471d4193d01a15ee1e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/tests.lisp" :SOURCE
    #A((96) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/tests.lisp")
    :BYTES 2085 :SHA256
    "ae0d5fa207e288d093b22cbd6e01d8f2cb4223566da80e040c2c2ae837ccae4e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/conditions.lisp" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/conditions.lisp")
    :BYTES 663 :SHA256
    "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/measure.lisp" :SOURCE
    #A((98) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/measure.lisp")
    :BYTES 2041 :SHA256
    "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/workflow.lisp" :SOURCE
    #A((99) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/workflow.lisp")
    :BYTES 27556 :SHA256
    "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/boundaries.lisp" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/boundaries.lisp")
    :BYTES 617 :SHA256
    "e3dde1942bea1dc6c4d6312abb8a4c4c800eb4e22260e490536ab03c6a0bd84d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-before/report.lisp" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-before/report.lisp")
    :BYTES 548 :SHA256
    "157d3ce6209f280415ef36151f9109229c26e6a54fa37fcf3f0328debd234ce9"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-before/data.lisp" :SOURCE
    #A((99) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-before/data.lisp")
    :BYTES 3144 :SHA256
    "6c3bd5e3200c3b256f01a6927fdd5a91d53bf2f43dee5a471d4193d01a15ee1e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-before/tests.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-before/tests.lisp")
    :BYTES 2085 :SHA256
    "ae0d5fa207e288d093b22cbd6e01d8f2cb4223566da80e040c2c2ae837ccae4e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-before/conditions.lisp" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-before/conditions.lisp")
    :BYTES 663 :SHA256
    "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-before/measure.lisp" :SOURCE
    #A((102) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-before/measure.lisp")
    :BYTES 2041 :SHA256
    "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-before/workflow.lisp" :SOURCE
    #A((103) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-before/workflow.lisp")
    :BYTES 27556 :SHA256
    "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-before/boundaries.lisp" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-before/boundaries.lisp")
    :BYTES 806 :SHA256
    "0ec0aa0bb3e41adc5f51bc3f2be1ef2bf53dbe138098d5934a486992d3961b00"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/report.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/report.lisp")
    :BYTES 548 :SHA256
    "91de791c72f5fa0252b7b097767dd8721fdbeee86c4d815a3f735701123a16d7"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/data.lisp" :SOURCE
    #A((98) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/data.lisp")
    :BYTES 3144 :SHA256
    "6c3bd5e3200c3b256f01a6927fdd5a91d53bf2f43dee5a471d4193d01a15ee1e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/tests.lisp" :SOURCE
    #A((99) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/tests.lisp")
    :BYTES 2085 :SHA256
    "ae0d5fa207e288d093b22cbd6e01d8f2cb4223566da80e040c2c2ae837ccae4e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/conditions.lisp" :SOURCE
    #A((104) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/conditions.lisp")
    :BYTES 663 :SHA256
    "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/measure.lisp" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/measure.lisp")
    :BYTES 2041 :SHA256
    "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/workflow.lisp" :SOURCE
    #A((102) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/workflow.lisp")
    :BYTES 27556 :SHA256
    "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/boundaries.lisp" :SOURCE
    #A((104) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/boundaries.lisp")
    :BYTES 756 :SHA256
    "0e3371272be9afdfb3f1186e837e8ac7c1414301ab39654d6afc0817192d8d33"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/fresh/job-result-fresh-input.lisp" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data/job-result-fresh-input.lisp")
    :BYTES 367 :SHA256
    "c758c5086c6350012710e1c618ce3c7f69dc75816b4844e755853cf9864d4a88"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/fresh/job-result-fresh-stdout.log" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data/job-result-fresh-stdout.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/fresh/job-result-fresh-stderr.log" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data/job-result-fresh-stderr.log")
    :BYTES 3445 :SHA256
    "3859eb19ae267b8b801574422072eea426c24078aed30673ee393c9cc1948456"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/fresh/job-result-fresh-result.lisp" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data/job-result-fresh-result.lisp")
    :BYTES 675 :SHA256
    "d06596cbf234d399f0c973c2d4de11bb791208248200dab9e376a35969ced555"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/fresh/unknown-keyword-fresh-input.lisp" :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data/unknown-keyword-fresh-input.lisp")
    :BYTES 34 :SHA256
    "cfeb3615119c44e6dc38f0cbf87258ac036d5586695a55fa59ae6200bee68bcf"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/fresh/unknown-keyword-fresh-stdout.log" :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data/unknown-keyword-fresh-stdout.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/fresh/unknown-keyword-fresh-stderr.log" :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data/unknown-keyword-fresh-stderr.log")
    :BYTES 3130 :SHA256
    "c798e2ed0fdf55be93048e904f1caacbca3b0c19d924835876edd9c062b62fa7"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-before/fresh/unknown-keyword-fresh-result.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-before/data/unknown-keyword-fresh-result.lisp")
    :BYTES 685 :SHA256
    "f03cf35614acbf832eba3c1d5995a0f059f3ecd737064ae98bcd0e500ba3ca46"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/job-result-fresh-input.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/job-result-fresh-input.lisp")
    :BYTES 367 :SHA256
    "c758c5086c6350012710e1c618ce3c7f69dc75816b4844e755853cf9864d4a88"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/job-result-fresh-output.lisp" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/job-result-fresh-output.lisp")
    :BYTES 367 :SHA256
    "c758c5086c6350012710e1c618ce3c7f69dc75816b4844e755853cf9864d4a88"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/job-result-fresh-stdout.log" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/job-result-fresh-stdout.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/job-result-fresh-stderr.log" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/job-result-fresh-stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/job-result-fresh-result.lisp" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/job-result-fresh-result.lisp")
    :BYTES 673 :SHA256
    "8739669d197f86e7d4b1a26e704e426f3c5b366fda427af78bf02f1ae9a3cc4a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/unknown-keyword-fresh-input.lisp" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/unknown-keyword-fresh-input.lisp")
    :BYTES 34 :SHA256
    "f50df6fed03cec3a841c1eece7bf5e55264d879e3b2ba94fcf3c23731d1b8fc8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/unknown-keyword-fresh-stdout.log" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/unknown-keyword-fresh-stdout.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/unknown-keyword-fresh-stderr.log" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/unknown-keyword-fresh-stderr.log")
    :BYTES 3123 :SHA256
    "6dc958ec18ce0c55ffea025e63f76721cb13ba56cf9b8f13588fc9acb9144109"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/wire-after/fresh/unknown-keyword-fresh-result.lisp" :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-after/data/unknown-keyword-fresh-result.lisp")
    :BYTES 683 :SHA256
    "037fde8d96a894fe1fce145d2b1045d4932ea425116d3e2a1e3e8b0aee8217b8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-before/packet/result.lisp" :SOURCE
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-before/boundaries/coverage-summary/packet/result.lisp")
    :BYTES 118392 :SHA256
    "70f0954b1d175359d91b38195c45f2f5c3e71707bfe5492c4cc602aabd54a1ba"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/packet/result.lisp" :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/boundaries/coverage-summary/packet/result.lisp")
    :BYTES 304 :SHA256
    "1f93ef37a18916aa79b4c5b211297893645253478f9d2476a399987fb022b5b2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/packet/manifest.lisp" :SOURCE
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/boundaries/coverage-summary/packet/manifest.lisp")
    :BYTES 792 :SHA256
    "8c5402f9307918c601bedb38e6b447349ac58861b2a15771903c660c17035c61"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/packet/raw/coverage.lisp" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/boundaries/coverage-summary/packet/raw/coverage.lisp")
    :BYTES 311 :SHA256
    "8044e567997def9afa7679a0fd3a9c193f49194fb68f8e18f3e4929cfcf041a2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/packet/raw/coverage.lisp.gz" :SOURCE
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/boundaries/coverage-summary/packet/raw/coverage.lisp.gz")
    :BYTES 2087 :SHA256
    "88724284ba9d29027910a6f2cf8a733a2fe71aaf31967ba67a348c082ae38800"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compact-after/original-coverage.lisp" :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-compact-after/boundaries/coverage-summary/work/coverage.lisp")
    :BYTES 118298 :SHA256
    "6369668b4511c51f6c85500e46418eef289db2d20d5b48b5e752754974b65dd4"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/replay.lisp" :SOURCE
    #A((97) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-audit/replay.lisp")
    :BYTES 1291 :SHA256
    "fdb7d1275adf19c875df749c54c9121a0128127e39a29436ded6132eb86b6b8d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/replay-result.lisp" :SOURCE
    #A((104) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-audit/replay-result.lisp")
    :BYTES 3375 :SHA256
    "fd0f192cd437196858f747a9a76e0b89942d8469f27e6cca55fc51a69b397a80"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/size-bound-confirmed.lisp" :SOURCE
    #A((111) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-audit/size-bound-confirmed.lisp")
    :BYTES 1666 :SHA256
    "54c1f0c90e4da2c0d8780e16736b82c11bc1d0e5ddd1b4c9861ca62a1e54a61a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/size-bound-confirmed-result.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-audit/size-bound-confirmed-result.lisp")
    :BYTES 92 :SHA256
    "729837ca3d143bd720330ce1cec95a4b8384c01eec577be5a0f227b023c10945"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/size-bound-seal.lisp" :SOURCE
    #A((106) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-audit/size-bound-seal.lisp")
    :BYTES 1986 :SHA256
    "cc382c995e155c0c0910785e5a92db5b2cec1ea02d0fae423d6869f86903a33d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/size-bound-seal-result.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-audit/size-bound-seal-result.lisp")
    :BYTES 92 :SHA256
    "d245328c5ff355a243433530c48d0b95ef37eb97e023094e0ce8200c9890f4f4"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/source-commits.txt" :SOURCE
    #A((111) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/source-commits.txt")
    :BYTES 596 :SHA256
    "9109de1ba941e22a3808156d84c2e6a92d1ab6e5d084a0aea74676a9d62d611d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/compact-before/tools/ci/producer.lisp" :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/sources/compact-before/tools/ci/producer.lisp")
    :BYTES 15241 :SHA256
    "b64bf89a386fdb7e21de1ab8982e33dbe69354b09d7f0ad82b9621c1633e206b"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/compact-before/tools/ci/self-test.lisp" :SOURCE
    #A((139) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/sources/compact-before/tools/ci/self-test.lisp")
    :BYTES 12570 :SHA256
    "b26bf36e842bd402a30936a255d3fc75db8055146762f1482d5eb23983a34c26"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/final/tools/ci/data-self-test.lisp" :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/sources/final/tools/ci/data-self-test.lisp")
    :BYTES 23493 :SHA256
    "f13b97006d71ddafe85997017f8c7732a9f408fd8ba1fc74823079ab54b0066f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/final/tools/ci/data.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/sources/final/tools/ci/data.lisp")
    :BYTES 27300 :SHA256
    "424a94f89c8128276fe992a963fcc24e221c5933f6fcc3ec599372da02b0083d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/final/tools/ci/producer.lisp" :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/sources/final/tools/ci/producer.lisp")
    :BYTES 15250 :SHA256
    "3d346de332e9991a83289d2c9ad752a30b9b79696adccdcc90d44446335ac183"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/final/tools/ci/self-test.lisp" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/sources/final/tools/ci/self-test.lisp")
    :BYTES 12570 :SHA256
    "b26bf36e842bd402a30936a255d3fc75db8055146762f1482d5eb23983a34c26"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/wire-before/tools/ci/data-self-test.lisp" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/sources/wire-before/tools/ci/data-self-test.lisp")
    :BYTES 23493 :SHA256
    "f13b97006d71ddafe85997017f8c7732a9f408fd8ba1fc74823079ab54b0066f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/sources/wire-before/tools/ci/data.lisp" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/sources/wire-before/tools/ci/data.lisp")
    :BYTES 27264 :SHA256
    "82dc965f85266d4bd37c4f36da73db382c77b947f1fc70288d8084dceb415cc9"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/method.md.txt" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/ci-wire-processi.md")
    :BYTES 3926 :SHA256
    "cea0c4a612399708a0344a61c5abcc16750454c27ff647fbf0502fb800f459e6"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((106) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-conservation/manifest.lisp")
    :BYTES 16095 :SHA256
    "d115fc2675e12f97fdf25c58411caae0d8dba57d6dbbe33854ccec7f6091c6f9"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL "wire-before" :RECORD-PATH "processes/wire-before/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((25) BASE-CHAR . "spikes/out/ci-wire-before"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "wire-after" :RECORD-PATH "processes/wire-after/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((24) BASE-CHAR . "spikes/out/ci-wire-after"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "original-linux-replay" :RECORD-PATH
   "processes/original-linux-replay/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/ci-wire-audit/replay.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check-wire" :RECORD-PATH
   "processes/full-check-wire/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "compact-before" :RECORD-PATH "processes/compact-before/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((28) BASE-CHAR . "spikes/out/ci-compact-before"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "compact-after" :RECORD-PATH "processes/compact-after/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((27) BASE-CHAR . "spikes/out/ci-compact-after"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "size-bound" :RECORD-PATH "processes/size-bound/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((50) BASE-CHAR . "spikes/out/ci-wire-audit/size-bound-confirmed.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "size-bound-seal" :RECORD-PATH
   "processes/size-bound-seal/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "spikes/out/ci-wire-audit/size-bound-seal.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check-final" :RECORD-PATH
   "processes/full-check-final/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 89 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((104) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-22-ci-wire-processi/")
 :OBSERVATIONS
 #A((91) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/ci-wire-collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
