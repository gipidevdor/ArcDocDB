(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((113) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-collection-2/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-15-recovery-segment-id/"
   :INDEXED-FILES 144 :ACTUAL-FILES 146 :INDEXED-BYTES 3618454 :PROCESSES
   ((:LABEL "coverage" :RECORD-PATH "processes/coverage/report.lisp" :COMMAND
     ("sbcl" "--script" "tools/foundation-coverage.lisp" "--report"
      "spikes/out/recovery-id-coverage/" "recovery")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "self-test-incomplete-copy" :RECORD-PATH
     "processes/self-test-incomplete-copy/report.lisp" :COMMAND
     ("sbcl" "--script" "tools/foundation-mutation.lisp" "--self-test") :STATUS
     :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "mutation-incomplete-copy" :RECORD-PATH
     "processes/mutation-incomplete-copy/report.lisp" :COMMAND
     ("sbcl" "--script" "tools/foundation-mutation.lisp" "--run"
      "spikes/out/recovery-id-mutation/" "inventory-id" "--jobs" "4")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "self-test-fixed-copy" :RECORD-PATH
     "processes/self-test-fixed-copy/report.lisp" :COMMAND
     ("sbcl" "--script" "tools/foundation-mutation.lisp" "--self-test") :STATUS
     :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "mutation-compile-rejection" :RECORD-PATH
     "processes/mutation-compile-rejection/report.lisp" :COMMAND
     ("sbcl" "--script" "tools/foundation-mutation.lisp" "--run"
      "spikes/out/recovery-id-mutation-2/" "inventory-id" "--jobs" "4")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "self-test-final" :RECORD-PATH
     "processes/self-test-final/report.lisp" :COMMAND
     ("sbcl" "--script" "tools/foundation-mutation.lisp" "--self-test") :STATUS
     :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "mutation-final" :RECORD-PATH
     "processes/mutation-final/report.lisp" :COMMAND
     ("sbcl" "--script" "tools/foundation-mutation.lisp" "--run"
      "spikes/out/recovery-id-mutation-3/" "inventory-id" "--jobs" "4")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "vertical" :RECORD-PATH "processes/vertical/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/vertical-crash.lisp" "--self-test")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "6638f58e6c46bfa9d9dea22b202ba47867b42c8b0dcdecda5d752c2a00bf786d"
   :CATALOGUE-SHA256
   "69db25126ae7f69324d750914ecf85a59ea7a35613beca403a3046be61ccba94"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (37 38 48 21) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "processes/coverage/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084677-command-26041-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "2d17dd708807d6517a2d3f3c4827231d9b644583d8044bf2ca9851e28892d850"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/coverage/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084677-command-26041-0/report.lisp")
    :BYTES 217810 :SHA256
    "bdb30f8184932d98e99740493881fd83ca161c142ada25b2647058508dd1d80a"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/self-test-incomplete-copy/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084717-command-26681-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "e98d6a02b69692379beb9a7525c627bc91ce14c502f4be02c608de191f80c4c2"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/self-test-incomplete-copy/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084717-command-26681-0/report.lisp")
    :BYTES 215767 :SHA256
    "7092459bd80c25d3918fb73aa23c8a117c27cc63ac83eb844f6ba8fd9176c669"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/mutation-incomplete-copy/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084717-command-26680-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "03dd34e1d7e623ff6e5e9ba66fd1c1fced8485ecd21fbe514dce27a55e81d36a"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/mutation-incomplete-copy/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084717-command-26680-0/report.lisp")
    :BYTES 215917 :SHA256
    "8c483f516ccead7ff6d9d5ba4093d7f861462469e949cf2ca07726bd3e67e7d7"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/self-test-fixed-copy/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084796-command-28225-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "93cbcfe2be8772cd8621ade0f8b5512613e129f1a52435e6dd319a423bea339b"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/self-test-fixed-copy/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084796-command-28225-0/report.lisp")
    :BYTES 209859 :SHA256
    "d6f0e1eecd6cbfe879155082e13af831f6f26a8823ede99bd89cf84e7f2cd9e7"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/mutation-compile-rejection/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084796-command-28226-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "2c33bd38f05b7b061a2a937f4385bbf7393811d3a5cb9b06d71db0d4dc19ab76"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/mutation-compile-rejection/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084796-command-28226-0/report.lisp")
    :BYTES 218405 :SHA256
    "e0a2373dcbd7ed7b4a9ff28f066f030da554018d52b8f6c2797627640e7b9891"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/self-test-final/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084944-command-30704-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "4c6568ed82ae1e84746f695c4c1967694a45bf8d728eb4bbe5fea2763e169858"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/self-test-final/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084944-command-30704-0/report.lisp")
    :BYTES 210081 :SHA256
    "3d783811ca9fe25f0505f561c90ae3e3a8ff191681e2616fde4226964bba7fc5"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/mutation-final/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084944-command-30703-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "71c79e3bd8b21dbc842a6786f0e7db90d5af648843b5369921972f0573c075d6"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/mutation-final/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084944-command-30703-0/report.lisp")
    :BYTES 212349 :SHA256
    "07f498650ff54b7c8bdc1260c3ddb69e887e19c9dbc995cf197a8d8201e929ae"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/vertical/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084951-command-30845-0/conservazione.lisp")
    :BYTES 1142 :SHA256
    "014b8494d5f07f630893e9fb21fe435941c50bef516644a8b5b953befcb3a762"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/vertical/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001084951-command-30845-0/report.lisp")
    :BYTES 218212 :SHA256
    "e98dd3205900f133acc0995fd4ef578f57c2c674f410a48a3050d4861fa18dff"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation/report.lisp" :SOURCE
    #A((104) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation/report.lisp")
    :BYTES 244 :SHA256
    "a3837e0e8cdac93284d8b01738cb686aeb02c4b7f65ac3568f91631160d927f2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation/baseline/test.log" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation/baseline/test.log")
    :BYTES 10227 :SHA256
    "fc6cb60ca2f1b8fcca17dcfa71d715891de39e64ad998b7fe4dfdac7809ea113"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation/baseline/runner.lisp.txt" :SOURCE
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation/baseline/tools/mutation-isolated-build.lisp")
    :BYTES 1922 :SHA256
    "5eda4b0330b5699426199b186af98161d0964767b9f166bd62092ea4c47b1756"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation/baseline/inventory-id.lisp.txt" :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation/baseline/src/recovery/inventory-id.lisp")
    :BYTES 2856 :SHA256
    "5f32aae756e92b0225f1304a04ff85bc174193521afea313a24cb111c902130e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/report.lisp" :SOURCE
    #A((106) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/report.lisp")
    :BYTES 2432 :SHA256
    "6d4ff51ed2392bc0f0654befe98835bf0867949e21bedaf2733ffc72939fa37d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/0/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/0/test.log")
    :BYTES 12490 :SHA256
    "482c93c16934e4dfddaa8b86aeab84b08b52f3d1264c3ba17bc8ca057dbe0939"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/1/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/1/test.log")
    :BYTES 12275 :SHA256
    "be1211a34f7c5b78c7a72841b223603a93de663806432881ab360f4b6a471dcc"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/10/test.log" :SOURCE
    #A((106) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/10/test.log")
    :BYTES 20118 :SHA256
    "15df25b2ab22812afe80cef02ce4d2d44044114f55f7bd295b1c97a48880ce56"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/2/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/2/test.log")
    :BYTES 12275 :SHA256
    "dfce00f2232512059ee4c255a352d07d5d4f15a82f7b57f83a678b57202afbc3"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/3/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/3/test.log")
    :BYTES 12251 :SHA256
    "5289431e0982e3c8c02d0a6b4a3d03cba54d310a6ab58431e6b6034d8a10b015"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/4/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/4/test.log")
    :BYTES 12195 :SHA256
    "28c422da7cdff28e2a952be1968d8e9a4ae7a3e715e661b5b8bdc1433e7429d1"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/5/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/5/test.log")
    :BYTES 12251 :SHA256
    "5fe5b32ff2fe3bc43c43e923a7fe133b4b402b3c1a814ec97a41126aa6b14b01"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/6/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/6/test.log")
    :BYTES 12251 :SHA256
    "30206bf71fefb4abd10963821bbc0b81146dac79986f2e27ce878e9d9348df54"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/7/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/7/test.log")
    :BYTES 12197 :SHA256
    "118e7dc640c11941bfc49014c42ffe93eebe62e561fb0c1cf1f23af2b4f53697"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/8/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/8/test.log")
    :BYTES 11999 :SHA256
    "8a446816738500f675c4c483b61abee56fc76d58ccb6dd9d0747a53808fefe82"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/9/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/9/test.log")
    :BYTES 12127 :SHA256
    "dc020b52a85072c22286cc42431b3ac2f0a6c57cb8e3cb75b72ddd0e5805e7cc"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/baseline/test.log" :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/baseline/test.log")
    :BYTES 1068 :SHA256
    "a173503d02630bac8d30added9282ec59ff595e3bf729ff0d48f57d4bb737b6f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/0/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/0/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "6c9f96c677dc09247743534f2ec00adf26866bd5101331749320f37e25d17634"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/1/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/1/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "c82c34773a9f0b22540c7178bc97dfc34e9e2a7051333abc7a175d38a9c7dd3d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/10/runner.lisp.txt" :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/10/tools/mutation-isolated-build.lisp")
    :BYTES 1914 :SHA256
    "6b40fecea5d7e88d3d2eea028fab913247eca15681d53d3cd11ca77ee0f77f12"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/2/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/2/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "516f0ce0b740c9652739d8f3141760cddf98413d08a96a6441cacb6e6d723274"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/3/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/3/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "b5c1c1823de4cc1b05ae66fdbf4b131ae126f45b67d9b1ecd1d82767c2dd8689"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/4/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/4/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "1df742b9e22d13626a778b94569906345cfc50a89d6ab63ece2e0dcd7e67b1b4"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/5/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/5/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "614dc2e84d69f8a7ce4787e98d86af1485a6e55d180ae8ae9fe4468d1607f06a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/6/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/6/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "11dfcaf8c9681f32b02a55effac8317dd431eaad6be526c4ae4d61343c4fde3a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/7/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/7/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "699275582749ceda9a579a54eab8dc91489725ffffb380ba87827a9d9357af31"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/8/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/8/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "c4fe723694ea40d1987348942652356b269c9e69593b4a72778ba814dadfdc63"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/9/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/9/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "8f106821f7dfcdb6c80359d004402ec9ee808589a18dced0c86228f82d199ced"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/baseline/runner.lisp.txt" :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/baseline/tools/mutation-isolated-build.lisp")
    :BYTES 1926 :SHA256
    "33f0a005f1cd676f8a0bcfbbf26d87bd7a5e2ca6ade67c84b5600d5979e72dcc"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/0/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/0/src/recovery/inventory-id.lisp")
    :BYTES 2850 :SHA256
    "3e481bb2ec096ad80cbde9b4563b22c90dd1bc31a0ab87f3a08e5dc43cdfe76d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/1/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/1/src/recovery/inventory-id.lisp")
    :BYTES 2856 :SHA256
    "8cda3c56a1f54bf8031ee4d1c1d807cf1785a7f6796c822f7b848b0dccec8958"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/10/inventory-id.lisp.txt" :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/10/src/recovery/inventory-id.lisp")
    :BYTES 2854 :SHA256
    "07af0651fc065812aa9ab07198b83bec9d3f7a7f3d1890e2415c0a6dbb04bbca"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/2/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/2/src/recovery/inventory-id.lisp")
    :BYTES 2851 :SHA256
    "bda141a4be292d425e3d646f1c430b641b543822edda32f8a7572cbe08f6102f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/3/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/3/src/recovery/inventory-id.lisp")
    :BYTES 2863 :SHA256
    "62d2bb42f771bf4f3f9d039dc5541da299a25c7b9450397444219569ec4a6ea1"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/4/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/4/src/recovery/inventory-id.lisp")
    :BYTES 2855 :SHA256
    "e3b00445545eee5ae6c30c061f83cff9c4c948b70b9dde9754865e32f273ef32"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/5/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/5/src/recovery/inventory-id.lisp")
    :BYTES 2857 :SHA256
    "895e51159b67cab382051a5fb9ecaca895dd423ce9af28e99237ecbdb6cc107c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/6/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/6/src/recovery/inventory-id.lisp")
    :BYTES 2855 :SHA256
    "2e9f5c25a5f5cff536eca566378d681dee635e5bd41d0d27e0257e5b9e20cad6"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/7/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/7/src/recovery/inventory-id.lisp")
    :BYTES 2851 :SHA256
    "ab94e7a8dbbde6d34fa02527f833de6f6ff3a67529ff8126ded6e025835f58d2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/8/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/8/src/recovery/inventory-id.lisp")
    :BYTES 2854 :SHA256
    "3d02bb02bfc83a9b09ea8e175d10aa6be2458467b69ae3f75b8f244b4c51d37a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/9/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/9/src/recovery/inventory-id.lisp")
    :BYTES 2854 :SHA256
    "47f107621825e326c54f6e4aa9f99096cc149f474e888fcdd4aca90b3c4d5857"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-2/baseline/inventory-id.lisp.txt" :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-2/baseline/src/recovery/inventory-id.lisp")
    :BYTES 2856 :SHA256
    "5f32aae756e92b0225f1304a04ff85bc174193521afea313a24cb111c902130e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/report.lisp" :SOURCE
    #A((106) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/report.lisp")
    :BYTES 2437 :SHA256
    "eba3d6eb56583a781d11f1b2df0e9bafabee0102272c548f31b5eaa0a94609a5"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/0/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/0/test.log")
    :BYTES 12490 :SHA256
    "621d2ee029fab683b36f9304615f9a2ef17e68153cdbbba8c87d4ce9a1d42949"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/1/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/1/test.log")
    :BYTES 12275 :SHA256
    "f628ce540db290e07b18a3d09db869183d3e0fcfd3710d1facdc389b1ba62e82"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/10/test.log" :SOURCE
    #A((106) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/10/test.log")
    :BYTES 12090 :SHA256
    "0b6ba976f90f5a39686b23f34d7bf64f2f75dfd11d36a651ca05453a59ec7c92"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/2/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/2/test.log")
    :BYTES 12275 :SHA256
    "1cd5a61933e68591c27749c92b4be674fe97ae1616ba715c665e591e1f231f93"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/3/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/3/test.log")
    :BYTES 12251 :SHA256
    "fce72f11f3f7c86fd52de540f8103063272a53b43a538dde0514cd485630d632"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/4/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/4/test.log")
    :BYTES 12195 :SHA256
    "71a19a9df73d59032aee007c9c8a2f9442f11a9d86534ee6f163b35171d00330"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/5/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/5/test.log")
    :BYTES 12251 :SHA256
    "4f223909264d2e1896abf80a0d48a7f8591015ca184deb836fffbada361363bb"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/6/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/6/test.log")
    :BYTES 12251 :SHA256
    "3a5bea9f7aa9a4c857596ee8349cd5eb314a1fe4093e5e38bebf15a04b786e3e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/7/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/7/test.log")
    :BYTES 12197 :SHA256
    "87b76facf03b9b023dc9dcc136fe4eac7b73912f9c53a74fd2711b033534d5ce"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/8/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/8/test.log")
    :BYTES 11999 :SHA256
    "7e883b1dbb8a126a699660a86acc3de538309c6aaf8c37bc757c5391ad1742bb"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/9/test.log" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/9/test.log")
    :BYTES 12127 :SHA256
    "0e5683561b1cb3587af4c67c049760abf7de31f7831afa31946828c4ea0ce6f6"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/baseline/test.log" :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/baseline/test.log")
    :BYTES 1068 :SHA256
    "a173503d02630bac8d30added9282ec59ff595e3bf729ff0d48f57d4bb737b6f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/0/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/0/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "d6504b1c48fcaf979b0f118f794198076cdc0c8cad3977832c1d0bd89a688a30"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/1/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/1/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "6f6aa4d42bd9b65bd5ec92ff569ddade2a2ab11ac9f8ceb5ecfd6da7ad704972"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/10/runner.lisp.txt" :SOURCE
    #A((132) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/10/tools/mutation-isolated-build.lisp")
    :BYTES 1914 :SHA256
    "fe5cb4cbae9707a8978d1bebd41b755d2f9e1dff00b82fb98c48f24ea39b1b4d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/2/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/2/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "47201d821b3048ddf0054462fbcf5866af261a62801c7af594e8712d2f0c7986"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/3/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/3/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "d2b1638d4f734d0ce0d2f4b519741f66b3b0d6a282bcde66b908f06a059b7df2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/4/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/4/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "effe16573e1f8163a4d1bf45d0be4a522b87ff0fc4804d7db573c451b6fe2575"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/5/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/5/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "7799c599b138b7f6e133fa45654996788530f212dbc8b6bca612b833fbccca42"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/6/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/6/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "3e3b133c4457dfc0ac884c66281bf70985da6b9534ac4a8a62a6fc5fdf305902"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/7/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/7/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "81739bc9b4ecb24e36312aeaf402910c3e0aac56b916f3a503e2883bce6a493c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/8/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/8/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "d32466e6653ac100bb0a91a2d7a1321fa02dd01b92ab5f9b8d1b6fcf5322aa47"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/9/runner.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/9/tools/mutation-isolated-build.lisp")
    :BYTES 1912 :SHA256
    "c1eeb5c76638e956f438593717be5a91d1380822d7383c161e054e846c8ba5b8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/baseline/runner.lisp.txt" :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/baseline/tools/mutation-isolated-build.lisp")
    :BYTES 1926 :SHA256
    "9c1361b4e74626a4c3b9eb557ee09f731f5c2e6f506f933da010d519eb87de49"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/0/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/0/src/recovery/inventory-id.lisp")
    :BYTES 2850 :SHA256
    "3e481bb2ec096ad80cbde9b4563b22c90dd1bc31a0ab87f3a08e5dc43cdfe76d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/1/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/1/src/recovery/inventory-id.lisp")
    :BYTES 2856 :SHA256
    "8cda3c56a1f54bf8031ee4d1c1d807cf1785a7f6796c822f7b848b0dccec8958"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/10/inventory-id.lisp.txt" :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/10/src/recovery/inventory-id.lisp")
    :BYTES 2861 :SHA256
    "f68775f98e9b9253c19d959509d11818ba715fac593b13ef09590d12de8a1d69"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/2/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/2/src/recovery/inventory-id.lisp")
    :BYTES 2851 :SHA256
    "bda141a4be292d425e3d646f1c430b641b543822edda32f8a7572cbe08f6102f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/3/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/3/src/recovery/inventory-id.lisp")
    :BYTES 2863 :SHA256
    "62d2bb42f771bf4f3f9d039dc5541da299a25c7b9450397444219569ec4a6ea1"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/4/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/4/src/recovery/inventory-id.lisp")
    :BYTES 2855 :SHA256
    "e3b00445545eee5ae6c30c061f83cff9c4c948b70b9dde9754865e32f273ef32"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/5/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/5/src/recovery/inventory-id.lisp")
    :BYTES 2857 :SHA256
    "895e51159b67cab382051a5fb9ecaca895dd423ce9af28e99237ecbdb6cc107c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/6/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/6/src/recovery/inventory-id.lisp")
    :BYTES 2855 :SHA256
    "2e9f5c25a5f5cff536eca566378d681dee635e5bd41d0d27e0257e5b9e20cad6"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/7/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/7/src/recovery/inventory-id.lisp")
    :BYTES 2851 :SHA256
    "ab94e7a8dbbde6d34fa02527f833de6f6ff3a67529ff8126ded6e025835f58d2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/8/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/8/src/recovery/inventory-id.lisp")
    :BYTES 2854 :SHA256
    "3d02bb02bfc83a9b09ea8e175d10aa6be2458467b69ae3f75b8f244b4c51d37a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/9/inventory-id.lisp.txt" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/9/src/recovery/inventory-id.lisp")
    :BYTES 2854 :SHA256
    "47f107621825e326c54f6e4aa9f99096cc149f474e888fcdd4aca90b3c4d5857"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/recovery-id-mutation-3/baseline/inventory-id.lisp.txt" :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-mutation-3/baseline/src/recovery/inventory-id.lisp")
    :BYTES 2856 :SHA256
    "5f32aae756e92b0225f1304a04ff85bc174193521afea313a24cb111c902130e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before-tool-repairs/arcdocdb.asd.txt" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-before-copy-fix/arcdocdb.asd.txt")
    :BYTES 19584 :SHA256
    "7b6f2302ef7ee5f00497a8447d21e648c74c3bac61f8a372b7a776f959f34f02"))
  (:STATUS :OK :ENTRY
   (:PATH
    "raw/before-tool-repairs/docs/implementazione/id-segmento-recovery.md.txt"
    :SOURCE
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-before-copy-fix/docs/implementazione/id-segmento-recovery.md.txt")
    :BYTES 3621 :SHA256
    "a4459215a8846fae499bae827a33f8ca538de903424673f7be4b3d194fed9495"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before-tool-repairs/foundation-mutation-after-copy-fix.lisp.txt"
    :SOURCE
    #A((143) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-before-copy-fix/foundation-mutation-after-copy-fix.lisp.txt")
    :BYTES 42652 :SHA256
    "4e958e9d95cd55768ea3fdf217158edd4595c451dad3ae216d7f0c991e283903"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before-tool-repairs/src/recovery/inventory-id.lisp.txt" :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-before-copy-fix/src/recovery/inventory-id.lisp.txt")
    :BYTES 2856 :SHA256
    "5f32aae756e92b0225f1304a04ff85bc174193521afea313a24cb111c902130e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before-tool-repairs/src/recovery/manifest-package.lisp.txt"
    :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-before-copy-fix/src/recovery/manifest-package.lisp.txt")
    :BYTES 1445 :SHA256
    "c5d3e8523c665f20059e85a6e74f909e86b786cd38701831f2086a99694b8bac"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before-tool-repairs/tests/recovery/inventory-id.lisp.txt"
    :SOURCE
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-before-copy-fix/tests/recovery/inventory-id.lisp.txt")
    :BYTES 11082 :SHA256
    "142a8777aab71d30050a0dc6c8cecee9de7e5c673b499d409db30cf2fcb8c297"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before-tool-repairs/tests/vertical/support.lisp.txt" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-before-copy-fix/tests/vertical/support.lisp.txt")
    :BYTES 13940 :SHA256
    "c00e0991c435561dd4e1f6fde68bad25985de808db583227ef2c164fb3aca3d6"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/before-tool-repairs/tools/foundation-mutation.lisp.txt" :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-before-copy-fix/tools/foundation-mutation.lisp.txt")
    :BYTES 43860 :SHA256
    "fd8fea50acc59d87346781c08c1c1a4786c79346b386902954098b72d63c35d8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/27a7f863c1371612a48a85b3485fa16d.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/27a7f863c1371612a48a85b3485fa16d.html")
    :BYTES 19760 :SHA256
    "ff900809cebccc89c7bcaab5ed898b0dc4d3add40398bf06956a3b3bebe02924"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/33bf973423200aea09d36605b6ad41ba.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/33bf973423200aea09d36605b6ad41ba.html")
    :BYTES 7040 :SHA256
    "56d4c9716f34d97c9d16c16e351f27c82c111c4b6b0f93246ac57b050f6a586e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/453ecce9ed0c1a8b83ba14054b5388f4.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/453ecce9ed0c1a8b83ba14054b5388f4.html")
    :BYTES 26761 :SHA256
    "1ce6a7d6bb418fed4fb1579ba0365c9725033feac165acd0758068451cb21ba9"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/4cb32f6a4e79ed7c5602172741d3a4f7.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/4cb32f6a4e79ed7c5602172741d3a4f7.html")
    :BYTES 57520 :SHA256
    "d21f9d9b37609c6d5cf94bbbdd29fd7c4ed379fd80d28401ac680dfcc8856f2e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/5dd36d40288a8d37053e0c0ec4faf50b.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/5dd36d40288a8d37053e0c0ec4faf50b.html")
    :BYTES 9216 :SHA256
    "245694f9679decbd50ea74554e80f9c01fb4dc39661dc0f358065301965f520d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/629541ca7b566d0a18ef753bd1062a8e.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/629541ca7b566d0a18ef753bd1062a8e.html")
    :BYTES 14673 :SHA256
    "cff06addc338711546c441dad7ee943221e54bcac1350ab00cf9e289724be643"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/6c97a011e2c5a4dec8eaf271aeaf13b0.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/6c97a011e2c5a4dec8eaf271aeaf13b0.html")
    :BYTES 19611 :SHA256
    "342b23074be5267c1b8c0f82a93ded70e48b902ec0920f2db7452747e0d1d86f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/7089fd62da87fbc3e485077d81c6ed2d.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/7089fd62da87fbc3e485077d81c6ed2d.html")
    :BYTES 12293 :SHA256
    "86b4408ad1c1b0bf93cbb5e25104fb08a0979e1d3538ef408ac779c6cfa5c564"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/73044a2cf511751a3edea0528f0e3a00.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/73044a2cf511751a3edea0528f0e3a00.html")
    :BYTES 45753 :SHA256
    "956e45048bb69b128ec04213091883567feb95bc5ec792ff1dc9219b923fb691"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/7562c61cc4608f158a0e82806e20767c.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/7562c61cc4608f158a0e82806e20767c.html")
    :BYTES 56651 :SHA256
    "cc25b73afeac5813819e30dcdfb85dffbdd7740bd4aee8fc9bebfd4046da470d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/7ffdd16fc0a2e00438392ff57394d0c8.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/7ffdd16fc0a2e00438392ff57394d0c8.html")
    :BYTES 72964 :SHA256
    "0f517bafb5d395229982f0ef6b743012816ae16af5d869b4a3772d3b4b3932c4"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/86d53797d3cab9327b3a19d79833eafa.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/86d53797d3cab9327b3a19d79833eafa.html")
    :BYTES 12338 :SHA256
    "acf005d7723e467ccb54725f048484789a7a88b7d0ec7e176f0f60ca960b4338"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/980c75095272b3077f6cd57f1f82efe8.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/980c75095272b3077f6cd57f1f82efe8.html")
    :BYTES 13668 :SHA256
    "de98100b10f1db120bd89c6e92e47d434abaa004558516cca7ab1c5b4229e0a8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/9b162382a6e1954fc0ae8b70ac4d10da.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/9b162382a6e1954fc0ae8b70ac4d10da.html")
    :BYTES 66964 :SHA256
    "0598f22c463b67af5b972be3e18128cbcd616e7d4d5cd2c07b7eb11ff9c5057d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/acf97880925b02c1f4ee153ea089f1ed.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/acf97880925b02c1f4ee153ea089f1ed.html")
    :BYTES 37568 :SHA256
    "825fbd5cfbdbe443636edc82f6636da37b8a0b04e348e53a013dbe63012650a9"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/b821902cbd573ec8a825c2cfeee21742.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/b821902cbd573ec8a825c2cfeee21742.html")
    :BYTES 20370 :SHA256
    "e5f07fd3df6e150a9c69bfc4b66d168b6d43983a451dff4525b79e7d13ddcb4f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/cover-index.html" :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/cover-index.html")
    :BYTES 5184 :SHA256
    "5b387efcfa56726d84d7236fbde4ede57cd6d80bd13a6137ec0a7384750df944"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/ebc53c7f343684c5e6d739ca04a44d08.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/ebc53c7f343684c5e6d739ca04a44d08.html")
    :BYTES 63768 :SHA256
    "0c1ecfa1ef9b70ea128bd2044fa2af1e29f49735ad046ff529b9611b6866b76f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/eeca36d650ca02d2cfd327494a1dee5b.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/eeca36d650ca02d2cfd327494a1dee5b.html")
    :BYTES 6039 :SHA256
    "fcdcdbbe7fdeb87fff01a0c89a96dcdaf9a342ff7de2c7ee994f10644227d24e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/f8a63000ada3f970f085ccad83c4deb4.html" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-coverage/f8a63000ada3f970f085ccad83c4deb4.html")
    :BYTES 34756 :SHA256
    "9e878f9b87661eec59aac261eab9201c7ce53abe27b2b715276057320604fede"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-publication/coverage-state.lisp.gz")
    :BYTES 478524 :SHA256
    "a05184a4d41afaafb3643c5be526d468fe116cf463cf2f9a05fd1ed0a242a6ec"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/coverage-audit-result.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-audit/coverage-audit-result.lisp")
    :BYTES 694 :SHA256
    "3fc00095faaccfdd19eddb51de62204f5156b69743ceda74924b12fc75d481fd"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/coverage-audit.lisp" :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-audit/coverage-audit.lisp")
    :BYTES 3474 :SHA256
    "ff6459ac04f9a7d55f01f481331a7809be544f0130a63fd58116f07825e3a93b"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/read-records.lisp" :SOURCE
    #A((107) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-audit/read-records.lisp")
    :BYTES 848 :SHA256
    "28c46bd7e890d2279f68b101bd1246e9d1e4878d95ca96417701243adaf03f49"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/id-segmento-recovery.md.txt"
    :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/id-segmento-recovery.md")
    :BYTES 7720 :SHA256
    "c34b36edc8b64717e8db0c5a34858258519ccbe82acd87905cab38356c774c76"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery/inventory-id.lisp.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-id.lisp")
    :BYTES 2856 :SHA256
    "5f32aae756e92b0225f1304a04ff85bc174193521afea313a24cb111c902130e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/tests/recovery/inventory-id.lisp.txt" :SOURCE
    #A((93) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/recovery/inventory-id.lisp")
    :BYTES 11082 :SHA256
    "142a8777aab71d30050a0dc6c8cecee9de7e5c673b499d409db30cf2fcb8c297"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/CHANGELOG.md.txt" :SOURCE
    #A((73) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
    :BYTES 27513 :SHA256
    "6c8b24a18b26e5fd4154c9211d324a60c9384a83d0d9104640a15ac96387e670"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/arcdocdb.asd.txt" :SOURCE
    #A((73) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
    :BYTES 19584 :SHA256
    "7b6f2302ef7ee5f00497a8447d21e648c74c3bac61f8a372b7a776f959f34f02"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/affidabilita/copertura-eccezioni.md.txt" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/affidabilita/copertura-eccezioni.md")
    :BYTES 21140 :SHA256
    "49b0da2e331891697dcf1b3d4038348ce7e5e4b8e913e08faf2521032d4858ea"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/README.md.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md")
    :BYTES 13606 :SHA256
    "d5627452c4669334903c0b268cce81479554c972553b92aba5e0837af006084d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/inventario.md.txt" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/inventario.md")
    :BYTES 7269 :SHA256
    "61f500974b73e713c8fed1da25113bbbe5007f2c84e5f39f85636e75b8b6fdee"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/prova-verticale.md.txt" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/prova-verticale.md")
    :BYTES 5748 :SHA256
    "e387bbe6296721caac22fba6bbf77b3f9d4efcf14c583871c54295d127aef026"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/roadmap.md.txt" :SOURCE
    #A((76) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/roadmap.md")
    :BYTES 11961 :SHA256
    "0128b8d7b0ca86629fd4fabd149e1f10ee11b07d45e3164d0297b38b0415453f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery/manifest-package.lisp.txt" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-package.lisp")
    :BYTES 1445 :SHA256
    "c5d3e8523c665f20059e85a6e74f909e86b786cd38701831f2086a99694b8bac"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/tests/vertical/method.md.txt" :SOURCE
    #A((85) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/method.md")
    :BYTES 4638 :SHA256
    "126ea9ea8c25ff3e5cb823709223108895c2b7064a47571bdf45880ad535837c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/tests/vertical/support.lisp.txt" :SOURCE
    #A((88) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/support.lisp")
    :BYTES 13940 :SHA256
    "c00e0991c435561dd4e1f6fde68bad25985de808db583227ef2c164fb3aca3d6"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/tools/foundation-mutation.lisp.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/foundation-mutation.lisp")
    :BYTES 42679 :SHA256
    "4549110148d74dd75e96b3019c3a5039c97082242141b3e2ab99467a954faf1e"))
  (:STATUS :OK :ENTRY
   (:PATH "README.md" :SOURCE
    #A((106) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-publication/README.txt")
    :BYTES 2202 :SHA256
    "5509b7fcff272c98b4addaf20e9e3ccb9aeca6f8fe59dbde3817fe2b4cabf991"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/collection-rejected.log" :SOURCE
    #A((48) BASE-CHAR . "/private/tmp/arcdocdb-recovery-id-collection.log")
    :BYTES 200 :SHA256
    "20d3b0377c2b4f8e94c71e4b6ec6f7a213c6855afc85ae37e84170ef08721e68"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-publication/manifest.lisp")
    :BYTES 27067 :SHA256
    "8b9a74e52dc60978557084fb59bab23ba8e2ffbb73810c4fd609b766ec05d85b"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL "coverage" :RECORD-PATH "processes/coverage/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((32) BASE-CHAR . "spikes/out/recovery-id-coverage/")
    #A((8) BASE-CHAR . "recovery"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "self-test-incomplete-copy" :RECORD-PATH
   "processes/self-test-incomplete-copy/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-incomplete-copy" :RECORD-PATH
   "processes/mutation-incomplete-copy/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((32) BASE-CHAR . "spikes/out/recovery-id-mutation/")
    #A((12) BASE-CHAR . "inventory-id") #A((6) BASE-CHAR . "--jobs")
    #A((1) BASE-CHAR . "4"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "self-test-fixed-copy" :RECORD-PATH
   "processes/self-test-fixed-copy/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-compile-rejection" :RECORD-PATH
   "processes/mutation-compile-rejection/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((34) BASE-CHAR . "spikes/out/recovery-id-mutation-2/")
    #A((12) BASE-CHAR . "inventory-id") #A((6) BASE-CHAR . "--jobs")
    #A((1) BASE-CHAR . "4"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "self-test-final" :RECORD-PATH
   "processes/self-test-final/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-final" :RECORD-PATH "processes/mutation-final/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((34) BASE-CHAR . "spikes/out/recovery-id-mutation-3/")
    #A((12) BASE-CHAR . "inventory-id") #A((6) BASE-CHAR . "--jobs")
    #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "vertical" :RECORD-PATH "processes/vertical/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/vertical-crash.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 144 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((107) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-15-recovery-segment-id/")
 :OBSERVATIONS
 #A((97) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-collection-2/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
