(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "command-01" :RECORD-PATH "processes/command-01/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/integration-selftest-01/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-02" :RECORD-PATH "processes/command-02/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/integration-selftest-02/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-03" :RECORD-PATH "processes/command-03/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((17) BASE-CHAR . "--non-interactive") #A((6) BASE-CHAR . "--eval")
    #A((15) BASE-CHAR . "(require :asdf)") #A((6) BASE-CHAR . "--eval")
    #A((19) BASE-CHAR . "(require :sb-posix)") #A((6) BASE-CHAR . "--eval")
    #A((36) BASE-CHAR . "(defpackage :arcdocdb.ci (:use :cl))")
    #A((6) BASE-CHAR . "--load") #A((21) BASE-CHAR . "tests/ci-catalog.lisp")
    #A((6) BASE-CHAR . "--eval")
    #A((456) BASE-CHAR
       . "(let ((rows nil) (failed 0)) (dolist (p (directory \"tools/ci/*.lisp\")) (handler-case (with-open-file (s p) (loop for x = (read s nil :end) until (eq x :end)) (push (list :path (namestring p) :status :passed) rows)) (error (c) (incf failed) (push (list :path (namestring p) :status :failed :reason (princ-to-string c)) rows)))) (write (list :kind :ci-reader-audit :failed failed :files (nreverse rows))) (terpri) (sb-ext:exit :code (if (zerop failed) 0 1)))"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-04" :RECORD-PATH "processes/command-04/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/integration-selftest-03/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-05" :RECORD-PATH "processes/command-05/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/integration-selftest-04/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-06" :RECORD-PATH "processes/command-06/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/integration-selftest-05/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-07" :RECORD-PATH "processes/command-07/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((4) BASE-CHAR . "plan") #A((5) BASE-CHAR . "--out")
    #A((34) BASE-CHAR . "spikes/out/ci/plan-integration-01/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-08" :RECORD-PATH "processes/command-08/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/integration-selftest-06/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-09" :RECORD-PATH "processes/command-09/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((4) BASE-CHAR . "plan") #A((5) BASE-CHAR . "--out")
    #A((34) BASE-CHAR . "spikes/out/ci/plan-integration-02/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-10" :RECORD-PATH "processes/command-10/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/integration-selftest-07/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-11" :RECORD-PATH "processes/command-11/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((4) BASE-CHAR . "plan") #A((5) BASE-CHAR . "--out")
    #A((34) BASE-CHAR . "spikes/out/ci/plan-integration-03/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-12" :RECORD-PATH "processes/command-12/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((3) BASE-CHAR . "run") #A((5) BASE-CHAR . "--job")
    #A((12) BASE-CHAR . "verify-macos") #A((5) BASE-CHAR . "--out")
    #A((36) BASE-CHAR . "spikes/out/ci/verify-integration-01/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-13" :RECORD-PATH "processes/command-13/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-14" :RECORD-PATH "processes/command-14/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((3) BASE-CHAR . "256") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((17) BASE-CHAR . "--non-interactive") #A((6) BASE-CHAR . "--eval")
    #A((36) BASE-CHAR . "(defpackage :arcdocdb.ci (:use :cl))")
    #A((6) BASE-CHAR . "--load") #A((21) BASE-CHAR . "tools/ci/measure.lisp")
    #A((6) BASE-CHAR . "--eval")
    #A((77) BASE-CHAR
       . "(arcdocdb.ci::ci-measure-worker \"spikes/out/ci/worker-integration-01.lisp\" 1)"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-15" :RECORD-PATH "processes/command-15/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((38) BASE-CHAR . "spikes/out/ci/integration-selftest-08/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-16" :RECORD-PATH "processes/command-16/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((3) BASE-CHAR . "run") #A((5) BASE-CHAR . "--job")
    #A((5) BASE-CHAR . "bench") #A((5) BASE-CHAR . "--out")
    #A((35) BASE-CHAR . "spikes/out/ci/bench-integration-01/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-17" :RECORD-PATH "processes/command-17/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/ci/publisher-fixture.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-18" :RECORD-PATH "processes/command-18/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((41) BASE-CHAR . "spikes/out/ci/publisher-race-fixture.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-19" :RECORD-PATH "processes/command-19/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write")
    #A((5) BASE-CHAR . "trace") #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "bench/manifest.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/manifest.lisp")
   :BYTES 6894 :SHA256
   "7cf4820dc489f76ccc8ba3f47f78d62f8a49415e855850247704d8fec6ae4750")
  (:PATH "bench/raw/child-result.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/child-result.lisp")
   :BYTES 25274 :SHA256
   "5e5d17138f295e7afc8137bbbc36e7b31dd34f663aaa28c32e77cdbac19c6443")
  (:PATH "bench/raw/commands/job/conservazione.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/commands/job/conservazione.lisp")
   :BYTES 1174 :SHA256
   "e19a5e440bd41eae427488e8af388a43553c171fb5085fd717188e36a0cb2613")
  (:PATH "bench/raw/commands/job/report.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/commands/job/report.lisp")
   :BYTES 310 :SHA256
   "4820ea8bc08d146848347f6ea3d1597e375a14f02650db256f3af7b6a172ff2b")
  (:PATH "bench/raw/commands/job/report.lisp.gz" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/commands/job/report.lisp.gz")
   :BYTES 78650 :SHA256
   "0f11d54a3a28f4a861e6781e17e43e8b4efcf2a08673142e2e0f88fddc182a49")
  (:PATH "bench/raw/coordinator-identity.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/coordinator-identity.lisp")
   :BYTES 212 :SHA256
   "c9fa0020f737340e51ef27cf4dbfb7801722012519d13fb035d16f4fd85b31c4")
  (:PATH "bench/raw/job-driver.stderr" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/job-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "bench/raw/job-driver.stdout" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/job-driver.stdout")
   :BYTES 463 :SHA256
   "1604a0f0b58f6dd7cbec4b2cd87cd60ca88c458b4620b3c895b0932cf8401d20")
  (:PATH "bench/raw/measure-replica-01.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-01.lisp")
   :BYTES 2122 :SHA256
   "cd2bf26fbfebe3eecbcea6de4a705a056fe8ed14d24509aefe62d40d56d41f03")
  (:PATH "bench/raw/measure-replica-01.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-01.log")
   :BYTES 440 :SHA256
   "7910f64b885c89dee5926bf115bb3cfe3187d0c2c5e14253f3886a8705d786c5")
  (:PATH "bench/raw/measure-replica-02.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-02.lisp")
   :BYTES 2122 :SHA256
   "e5de7cb5ef04c6046785a6a0f5e7c932b4466869c7fc5f7b5acb7f81a1cba148")
  (:PATH "bench/raw/measure-replica-02.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-02.log")
   :BYTES 440 :SHA256
   "7910f64b885c89dee5926bf115bb3cfe3187d0c2c5e14253f3886a8705d786c5")
  (:PATH "bench/raw/measure-replica-03.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-03.lisp")
   :BYTES 2123 :SHA256
   "7bc0b7c3ad73b4f7cc6f68ba3227e5dc0b95bf1d12b44451fa0b9731b33ff97c")
  (:PATH "bench/raw/measure-replica-03.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-03.log")
   :BYTES 440 :SHA256
   "7910f64b885c89dee5926bf115bb3cfe3187d0c2c5e14253f3886a8705d786c5")
  (:PATH "bench/raw/measure-replica-04.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-04.lisp")
   :BYTES 2122 :SHA256
   "e4891e9d7753cb2a79bac8bbed358cf6e90a2269f483867df1e8f7f22f934662")
  (:PATH "bench/raw/measure-replica-04.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-04.log")
   :BYTES 440 :SHA256
   "7910f64b885c89dee5926bf115bb3cfe3187d0c2c5e14253f3886a8705d786c5")
  (:PATH "bench/raw/measure-replica-05.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-05.lisp")
   :BYTES 2124 :SHA256
   "99490fcea83835d75bd6a1648680606c168e0f924e79a03ccf13bd6314c5ed7d")
  (:PATH "bench/raw/measure-replica-05.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure-replica-05.log")
   :BYTES 440 :SHA256
   "7910f64b885c89dee5926bf115bb3cfe3187d0c2c5e14253f3886a8705d786c5")
  (:PATH "bench/raw/measure.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/raw/measure.lisp")
   :BYTES 25274 :SHA256
   "5e5d17138f295e7afc8137bbbc36e7b31dd34f663aaa28c32e77cdbac19c6443")
  (:PATH "bench/result.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/bench/result.lisp")
   :BYTES 17815 :SHA256
   "45d0003628c3b21c57297227c65c5f83406f830e0a075c03a506b53ed92cca7f")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-manifest.lisp")
   :BYTES 25112 :SHA256
   "8e7b9cf3b5b4341ec929fb876bf323b4af0965647052cc5f3d920fbbe9eea284")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "measure/replica-01.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/measure/replica-01.lisp")
   :BYTES 2125 :SHA256
   "4df030191b326e095fc6e95646eee36d972ca8c5dcb083372222a21692a89d6b")
  (:PATH "methods/prepare-integration-archive.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/methods/prepare-integration-archive.lisp")
   :BYTES 4204 :SHA256
   "baa9d943fe9d7955d9e201fdafab44aab49a4bbb1f41131341f5843bd1a0dc64")
  (:PATH "methods/publisher-fixture.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/methods/publisher-fixture.lisp")
   :BYTES 6843 :SHA256
   "d6a79ae8b336895c4998caba1382bcb1abd166e4ccf2862c89eeae934ffeb5c5")
  (:PATH "methods/publisher-race-fixture.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/methods/publisher-race-fixture.lisp")
   :BYTES 4576 :SHA256
   "bf2201a61e5cd7a92e1ad11ba6f1c996caa1cabb15cec3213570d0f5018b4a97")
  (:PATH "plan/manifest.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/plan/manifest.lisp")
   :BYTES 4388 :SHA256
   "fd8f547e5a8adb19544df745b41316b3fd2a45ac5c8f84524f1012cc9b3b564b")
  (:PATH "plan/raw/sources.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/plan/raw/sources.lisp")
   :BYTES 3940 :SHA256
   "978aff2b451464c63e15c6a14ee694f119ea32e11671a9b3069294f6dc06efde")
  (:PATH "plan/result.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/plan/result.lisp")
   :BYTES 8105 :SHA256
   "3ee722266f151d6c733cc3f83c8bd15cbf914957c3d3b21c31d492583555a720")
  (:PATH "processes/command-01/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-01/conservazione.lisp")
   :BYTES 1142 :SHA256
   "802f9238b09064481384b269867677faf71c05945f6027f746541e20a4dfd584")
  (:PATH "processes/command-01/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-01/report.lisp")
   :BYTES 310 :SHA256
   "a7b73180c2593e6dba36da801e99ed7a565a19481051e3f20d9399c43da0f042")
  (:PATH "processes/command-01/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-01/report.lisp.gz")
   :BYTES 80152 :SHA256
   "414c0abce4f149c027ce1b7ef3eee1a48059dbbf8d76b569bd1349f7b2ba70c4")
  (:PATH "processes/command-02/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-02/conservazione.lisp")
   :BYTES 1142 :SHA256
   "4b93ddba068ebbe7f1ce3c79feca44e1a2c52bce63f0b5ca32a48a9fac7ccff8")
  (:PATH "processes/command-02/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-02/report.lisp")
   :BYTES 310 :SHA256
   "34ab2908692ddf35472b07d217d146024c9d5dbc0273dfa1f8614f98604a5213")
  (:PATH "processes/command-02/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-02/report.lisp.gz")
   :BYTES 80135 :SHA256
   "07aebf6dfcf10014a3a9a2a9fbdfb174f1cf519e9928f93ee181c9d11cc85086")
  (:PATH "processes/command-03/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-03/conservazione.lisp")
   :BYTES 1142 :SHA256
   "47d6b55603f0301d67d13c4373b5b31cd6ea12dd3116f171ef67f7b68b0ba419")
  (:PATH "processes/command-03/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-03/report.lisp")
   :BYTES 310 :SHA256
   "5e71e4ca1390fa937f48c0659f77a2772e170282b95486afb6e69c16da3d6ecf")
  (:PATH "processes/command-03/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-03/report.lisp.gz")
   :BYTES 79315 :SHA256
   "736f974bb4c41553cd3ebc1e1721523ac0123895882b77046e7460ea88a81acf")
  (:PATH "processes/command-04/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-04/conservazione.lisp")
   :BYTES 1142 :SHA256
   "d7bc64300ebe6b2d15daaa09ec7857671fe8c57cb7d8698753ca4552f8a53bd5")
  (:PATH "processes/command-04/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-04/report.lisp")
   :BYTES 310 :SHA256
   "14856fd0517b5dacb035fe9a62c48da7a8ef04066e9329a9831c1242ac2fcc4c")
  (:PATH "processes/command-04/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-04/report.lisp.gz")
   :BYTES 82970 :SHA256
   "2237f8719dafaf446df7441d1c955dd94e3181d0ce1900c579e6f5684c7d09e0")
  (:PATH "processes/command-05/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-05/conservazione.lisp")
   :BYTES 1142 :SHA256
   "87ccc74edffa7d2e4958379ab0eb0146694e6ee317e1a823d029add164700ac3")
  (:PATH "processes/command-05/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-05/report.lisp")
   :BYTES 310 :SHA256
   "d5456976296f1a3b8872d7525efe5c1757210d8624f13bcc36d214f3dfa74ade")
  (:PATH "processes/command-05/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-05/report.lisp.gz")
   :BYTES 80140 :SHA256
   "6de1a00d87462f72d79a87b6848e5a77ef5c09b991c289cba59738362ae0786f")
  (:PATH "processes/command-06/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-06/conservazione.lisp")
   :BYTES 1142 :SHA256
   "9866642728982777971366df9170062e0374500ddd6b9b04015e74ce9d4c3a88")
  (:PATH "processes/command-06/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-06/report.lisp")
   :BYTES 310 :SHA256
   "59e462ac7fe08e0f3e81b9bb349d672eab1fc1e31c1665ee1571ce73f4c231b0")
  (:PATH "processes/command-06/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-06/report.lisp.gz")
   :BYTES 78777 :SHA256
   "6b65e213034a40eaf1a2d0b7460b013780ed607988e45e49a296128d3fe89fb4")
  (:PATH "processes/command-07/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-07/conservazione.lisp")
   :BYTES 1142 :SHA256
   "fa7ff1dbd345e8fc6387d02a9d02aeafcc1937e2abf82801abc070bf397f2e2c")
  (:PATH "processes/command-07/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-07/report.lisp")
   :BYTES 310 :SHA256
   "74243ee114261779c50020aa798c1fa567e0e05c0373525e43707773125a31f1")
  (:PATH "processes/command-07/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-07/report.lisp.gz")
   :BYTES 78629 :SHA256
   "fea78df5e40a975f3b21a95364e6f737c2b78a75cac74f80631af4966323224c")
  (:PATH "processes/command-08/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-08/conservazione.lisp")
   :BYTES 1142 :SHA256
   "60c7f31c643f96371f0fa14135467110307ec53b25d966261bbbe908aa2e244a")
  (:PATH "processes/command-08/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-08/report.lisp")
   :BYTES 310 :SHA256
   "e8b86ca3317048ee59a8c982dab6420890c012765a777b3898c224d9e78d1f11")
  (:PATH "processes/command-08/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-08/report.lisp.gz")
   :BYTES 78770 :SHA256
   "b0e092ca8939a29cc2dad8fa15e209b29391d92bf100381302572b07aa532d6d")
  (:PATH "processes/command-09/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-09/conservazione.lisp")
   :BYTES 1142 :SHA256
   "fdcef542d09b6d4d23718aa84eee89f1944f3db47f7a4116f8061a0979ca9a57")
  (:PATH "processes/command-09/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-09/report.lisp")
   :BYTES 310 :SHA256
   "1a2a6925eeb80a33abdf6d908b6d35de77054d9dd5e93de5d08082a5cb0f1447")
  (:PATH "processes/command-09/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-09/report.lisp.gz")
   :BYTES 78651 :SHA256
   "4d0e73895c11c1000cbac969234d4da15c3704a6ed22c24c0d5b7b77cea4c404")
  (:PATH "processes/command-10/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-10/conservazione.lisp")
   :BYTES 1142 :SHA256
   "5e71b7a65ec785ebf7f64425c9e3a21d3b3b50d565fbb0ee2f6dbac37c82cab5")
  (:PATH "processes/command-10/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-10/report.lisp")
   :BYTES 310 :SHA256
   "9293628fe84042e979938e352228793b1c0a7ad4c86f926b1dc348d4d1452ebb")
  (:PATH "processes/command-10/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-10/report.lisp.gz")
   :BYTES 78761 :SHA256
   "0e8c5956e837a98149a1d579b6a432c39dc365b0596c53cbc9467f84aba9c503")
  (:PATH "processes/command-11/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-11/conservazione.lisp")
   :BYTES 1142 :SHA256
   "e879dc9a53c915c2210a304f7d7376812616be2a0889e8b0d3e92ff3cda46872")
  (:PATH "processes/command-11/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-11/report.lisp")
   :BYTES 310 :SHA256
   "e45ffbc8f9da650516beefeaf4095c540998198af7f92ee87da4622347daf41f")
  (:PATH "processes/command-11/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-11/report.lisp.gz")
   :BYTES 78577 :SHA256
   "7da4b5dcf5bf1e4337aac27a68fbd57ab7b26506a848c0998b239b653ca92660")
  (:PATH "processes/command-12/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-12/conservazione.lisp")
   :BYTES 1142 :SHA256
   "b0defe5ccb0ec814b449179f4b5f3d606ec27e3a9925914c4d51d9659f96b723")
  (:PATH "processes/command-12/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-12/report.lisp")
   :BYTES 310 :SHA256
   "54b47042617c23dac634c60ed58ed2baf029a23168b9ee8990fe56627642a230")
  (:PATH "processes/command-12/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-12/report.lisp.gz")
   :BYTES 78594 :SHA256
   "0a16c11cbb946ad2dbf8681495b8c631321473bc680345d7eeaa2eee30299417")
  (:PATH "processes/command-13/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-13/conservazione.lisp")
   :BYTES 1717 :SHA256
   "6372110d0d5e9d43993ddb9d7bf6c47d975d5055fb0b363a2c6600e3a6f06615")
  (:PATH "processes/command-13/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-13/report.lisp")
   :BYTES 317 :SHA256
   "0003139e4849900a3c23381fe737a97b844674db4049fb6123febb6598b895c4")
  (:PATH "processes/command-13/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-13/report.lisp.gz")
   :BYTES 236270 :SHA256
   "f9d0455977e4a9bcd00fe1592c3a6c0b9bdd48d2a480e4d87187825dad5d2fe4")
  (:PATH "processes/command-14/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-14/conservazione.lisp")
   :BYTES 1139 :SHA256
   "cecc91100a622f634735c1aa11db696644b929cf73324f7669e47980dffe7ca2")
  (:PATH "processes/command-14/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-14/report.lisp")
   :BYTES 310 :SHA256
   "c4acc7f53c66f98d6a91975ccab36811dfc7f273525d5b6c863c42e15c0bc941")
  (:PATH "processes/command-14/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-14/report.lisp.gz")
   :BYTES 78930 :SHA256
   "6773b89dc99514dd061a4faa4ef09bc1d0382c09a0e15f912d966c225a80ee31")
  (:PATH "processes/command-15/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-15/conservazione.lisp")
   :BYTES 1142 :SHA256
   "ed77a66d486c85aa56582563d063dc6525a39adf4c0cb46f76893a32a8be925f")
  (:PATH "processes/command-15/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-15/report.lisp")
   :BYTES 310 :SHA256
   "2418b81bcfd55faada155078bd8c536b94ae4b080380f5b3f80843b85b61c3fa")
  (:PATH "processes/command-15/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-15/report.lisp.gz")
   :BYTES 78772 :SHA256
   "8da0462c00cee78b14e82ce914bb7e144c0811bc710fb3d8f067b2375d13d83f")
  (:PATH "processes/command-16/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-16/conservazione.lisp")
   :BYTES 1142 :SHA256
   "5d2ae766ddfedcf5ad5741137bf97dcaed0051838d296aa05746f9f57e38d2bc")
  (:PATH "processes/command-16/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-16/report.lisp")
   :BYTES 310 :SHA256
   "9bbd7e0f48269602512505baf46c52fb2487833e54f1508d0cb855ca8360773a")
  (:PATH "processes/command-16/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-16/report.lisp.gz")
   :BYTES 78589 :SHA256
   "05ce65c5e01411ed87e87ec3c06817bb1c4897fc643508466a7827fe0d563009")
  (:PATH "processes/command-17/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-17/conservazione.lisp")
   :BYTES 1142 :SHA256
   "89066c79ae5dd0f0856bdf626d70d3cbeb04ec23ac8307fb48daa061a0351971")
  (:PATH "processes/command-17/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-17/report.lisp")
   :BYTES 310 :SHA256
   "96b70d44d18f6b2d562f191843ddc58e93120f1f99d75d34f36882edcefc8db8")
  (:PATH "processes/command-17/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-17/report.lisp.gz")
   :BYTES 78884 :SHA256
   "31c062cdbb62c380d710c11a2c8fbd23302035e8eaddde47e3d1c609ea086778")
  (:PATH "processes/command-18/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-18/conservazione.lisp")
   :BYTES 1142 :SHA256
   "a07b8b6adac4fa7c088e13f5dec86b95b074f4ec46e3035bd68a7ef0ae12b2d3")
  (:PATH "processes/command-18/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-18/report.lisp")
   :BYTES 310 :SHA256
   "4ed5166d878171f102f685770a69e2341b145978e08be90b54a2be8960af3ca9")
  (:PATH "processes/command-18/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-18/report.lisp.gz")
   :BYTES 78892 :SHA256
   "86105d949d64f948af1553c68496436e701705c7040d7023471de5bdd4526da2")
  (:PATH "processes/command-19/conservazione.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-19/conservazione.lisp")
   :BYTES 1142 :SHA256
   "601b5d3a57dbbce4229827f94eec6bb7e71a94a89b4c7ba883b19ca50c3eae3a")
  (:PATH "processes/command-19/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-19/report.lisp")
   :BYTES 310 :SHA256
   "795ca59aede3abc2c10828aa206c8e7ac9975630fc8a4222e2181ecbcafce770")
  (:PATH "processes/command-19/report.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/processes/command-19/report.lisp.gz")
   :BYTES 78662 :SHA256
   "471c35ecd6859b9eba46d10646dab9f726b9411340025c8857fce5362e9c8560")
  (:PATH "publisher/fixture.bundle" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/fixture.bundle")
   :BYTES 11834 :SHA256
   "600688071c3da800fdbe34f35068b826dc1e968bf3030680648a58a7d18bfdd4")
  (:PATH "publisher/race-report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/race-report.lisp")
   :BYTES 426 :SHA256
   "a4057af5240e8a229e50a6dd303e67a1be4fa5659abe428fb15241e5c760a63a")
  (:PATH "publisher/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/report.lisp")
   :BYTES 514 :SHA256
   "ee4745536e4203e02daba39ac9e3a3b005165e022cf05e46ea4b83c069ccbe9b")
  (:PATH
   "publisher/rounds/publisher-4001219113-17216-0/round-1/publication.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/rounds/publisher-4001219113-17216-0/round-1/publication.lisp")
   :BYTES 1923 :SHA256
   "d3c8412d510acb5f3b6e513dcc00719aade5523f3df230a4484ed16b3aadca04")
  (:PATH
   "publisher/rounds/publisher-4001219117-17216-0/round-1/publication.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/rounds/publisher-4001219117-17216-0/round-1/publication.lisp")
   :BYTES 1923 :SHA256
   "d74b255a69c8160676652735f3b2cebadaf6cb60a4141b68b4b6006ec57f68d7")
  (:PATH
   "publisher/rounds/publisher-4001219120-17216-0/round-1/publication.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/rounds/publisher-4001219120-17216-0/round-1/publication.lisp")
   :BYTES 2238 :SHA256
   "064b250698b5e8453940c11ed7c7b08f66e84de562330480f712c8cfd33df2f7")
  (:PATH
   "publisher/rounds/publisher-4001219127-17216-0/round-1/publication.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/rounds/publisher-4001219127-17216-0/round-1/publication.lisp")
   :BYTES 2238 :SHA256
   "5bf1f276b0a308126445198c9db5d34644c27eceea7c8bfd9b273741298940b0")
  (:PATH
   "publisher/rounds/publisher-4001219210-19431-0/round-1/publication.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/rounds/publisher-4001219210-19431-0/round-1/publication.lisp")
   :BYTES 1960 :SHA256
   "58343f3f79b93ed478c2d0ac98f764b64d8c4ab25cb4e56c2aa2653933e3990a")
  (:PATH
   "publisher/rounds/publisher-4001219210-19431-0/round-1/push-failure.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/rounds/publisher-4001219210-19431-0/round-1/push-failure.lisp")
   :BYTES 89 :SHA256
   "0e461622c21258d11a1f00435ad95096d8800d18a03969236bdbd8a51da51cbf")
  (:PATH
   "publisher/rounds/publisher-4001219210-19431-0/round-2/publication.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/publisher/rounds/publisher-4001219210-19431-0/round-2/publication.lisp")
   :BYTES 1960 :SHA256
   "5fd54c49d341efa5d65419190eb7ffbfa2a25f40118495087f37fedcacd4f825")
  (:PATH "report.md" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/report.md")
   :BYTES 2740 :SHA256
   "1309e035a1b66807253c4dc0f0d4a861d1cc9ad96bdf464bdc79e6c58a5f526b")
  (:PATH "review.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/review.lisp")
   :BYTES 1280 :SHA256
   "385f3817ec95d857ee4a8b6ff396990dd5434faf2a8e7bb049a00907085a7699")
  (:PATH "self-tests/05/boundaries.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/05/boundaries.lisp")
   :BYTES 549 :SHA256
   "6e71e73ca98f713556c9acc90cad0dae31bdf741b29689d6740b82449201f7fc")
  (:PATH "self-tests/05/data.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/05/data.lisp")
   :BYTES 3670 :SHA256
   "311f2b9ae33edf811f1bf7b1dd2da868d7352b72010d8d78fa198b8737e8dab8")
  (:PATH "self-tests/05/measure.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/05/measure.lisp")
   :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "self-tests/05/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/05/report.lisp")
   :BYTES 410 :SHA256
   "9fda25603630cc0c6af005de1088869d7756ecef5e890298c27c250f12ab528f")
  (:PATH "self-tests/05/tests.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/05/tests.lisp")
   :BYTES 1914 :SHA256
   "f3dc77dfbea7e42ce8e12b221591cbec6804a977bf3a8e67f35fab95a082de2f")
  (:PATH "self-tests/05/workflow.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/05/workflow.lisp")
   :BYTES 27164 :SHA256
   "7b4ebd85fa3033dd0736bf4608b95f3914bf87f3fff67fabfe538903196c156c")
  (:PATH "self-tests/06/boundaries.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/06/boundaries.lisp")
   :BYTES 496 :SHA256
   "645f831f90d825de774cf776f16de162e5a90f741c8734dea345bfd970017349")
  (:PATH "self-tests/06/data.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/06/data.lisp")
   :BYTES 3017 :SHA256
   "d4ef2eab0385ce32c91ba6b156c856ecffe25c39765c792bd8a56f27cf0b073f")
  (:PATH "self-tests/06/measure.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/06/measure.lisp")
   :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "self-tests/06/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/06/report.lisp")
   :BYTES 410 :SHA256
   "62550fc573fb73cfa57aa08bd9c98cc71f4504f3ff72c7c81744d84a82460705")
  (:PATH "self-tests/06/tests.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/06/tests.lisp")
   :BYTES 1914 :SHA256
   "f3dc77dfbea7e42ce8e12b221591cbec6804a977bf3a8e67f35fab95a082de2f")
  (:PATH "self-tests/06/workflow.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/06/workflow.lisp")
   :BYTES 27512 :SHA256
   "af21905d770603d8af3b2a0b997b92f39b1ee52f97a24db853cb389c7ae99e5c")
  (:PATH "self-tests/07/boundaries.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/07/boundaries.lisp")
   :BYTES 496 :SHA256
   "645f831f90d825de774cf776f16de162e5a90f741c8734dea345bfd970017349")
  (:PATH "self-tests/07/data.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/07/data.lisp")
   :BYTES 3017 :SHA256
   "d4ef2eab0385ce32c91ba6b156c856ecffe25c39765c792bd8a56f27cf0b073f")
  (:PATH "self-tests/07/measure.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/07/measure.lisp")
   :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "self-tests/07/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/07/report.lisp")
   :BYTES 410 :SHA256
   "987a550dd48bb7fb44d1c2058daa04dc4eea51c7f48ce81bcbf5310b34b6639b")
  (:PATH "self-tests/07/tests.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/07/tests.lisp")
   :BYTES 1914 :SHA256
   "f3dc77dfbea7e42ce8e12b221591cbec6804a977bf3a8e67f35fab95a082de2f")
  (:PATH "self-tests/07/workflow.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/07/workflow.lisp")
   :BYTES 27556 :SHA256
   "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269")
  (:PATH "self-tests/08/boundaries.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/08/boundaries.lisp")
   :BYTES 617 :SHA256
   "e3dde1942bea1dc6c4d6312abb8a4c4c800eb4e22260e490536ab03c6a0bd84d")
  (:PATH "self-tests/08/data.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/08/data.lisp")
   :BYTES 3017 :SHA256
   "d4ef2eab0385ce32c91ba6b156c856ecffe25c39765c792bd8a56f27cf0b073f")
  (:PATH "self-tests/08/measure.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/08/measure.lisp")
   :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "self-tests/08/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/08/report.lisp")
   :BYTES 467 :SHA256
   "47232dad372b2beac9f2e0ad83ed6381d2609ee7e248f53f5c26b59442fe7c0f")
  (:PATH "self-tests/08/tests.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/08/tests.lisp")
   :BYTES 1914 :SHA256
   "f3dc77dfbea7e42ce8e12b221591cbec6804a977bf3a8e67f35fab95a082de2f")
  (:PATH "self-tests/08/workflow.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/self-tests/08/workflow.lisp")
   :BYTES 27556 :SHA256
   "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269")
  (:PATH "verify/manifest.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/manifest.lisp")
   :BYTES 6348 :SHA256
   "65300bd20de2b306b730bef9819a3a3e77b493165f422030778b17313a243d66")
  (:PATH "verify/raw/child-result.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/child-result.lisp")
   :BYTES 316 :SHA256
   "2a628777d70500e30202d8ad98281b5ad9d480f4351bae9a76f7e1cfac239c6a")
  (:PATH "verify/raw/child-result.lisp.gz" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/child-result.lisp.gz")
   :BYTES 49909 :SHA256
   "037e2344f40b7c62802970819fc2be88f203adcdca718cac1cd7cadfd0f0a5c5")
  (:PATH "verify/raw/commands/job/conservazione.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/commands/job/conservazione.lisp")
   :BYTES 1175 :SHA256
   "74f57755b417a0d76b92e8764cacf8613c49a05f72b172fd11c53aca5c47933f")
  (:PATH "verify/raw/commands/job/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/commands/job/report.lisp")
   :BYTES 311 :SHA256
   "1854e67bc16bf154e2e2b0a0cf17d08c2d59d0bfb74aea228bd1381658c2b42b")
  (:PATH "verify/raw/commands/job/report.lisp.gz" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/commands/job/report.lisp.gz")
   :BYTES 112929 :SHA256
   "a1012b7a4dd24c70564747c77963f18dc0136bb1bde8eaaa6776608c87faaf0b")
  (:PATH "verify/raw/job-driver.stderr" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/job-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "verify/raw/job-driver.stdout" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/job-driver.stdout")
   :BYTES 472 :SHA256
   "e8dccc21a03a268ff9f41e2777983e4342140e5dffb2b11ddf93912287850b68")
  (:PATH "verify/raw/tests.events.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/tests.events.lisp")
   :BYTES 318 :SHA256
   "b70669a80145e4d0ccdcf5dd503accf4656f2a7f338db3b2c3735224079fe784")
  (:PATH "verify/raw/tests.events.lisp.gz" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/tests.events.lisp.gz")
   :BYTES 113053 :SHA256
   "b9e34d281f9da6f4daf51841152188b9b8990a1797c89239ac0e6ad28ab11c7d")
  (:PATH "verify/raw/tests.expected.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/tests.expected.lisp")
   :BYTES 7146 :SHA256
   "f1b383839a5215886356e42e6e4a6e16d685df13677b4a8ef56887f9ccad6057")
  (:PATH "verify/raw/tests.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/tests.lisp")
   :BYTES 309 :SHA256
   "d609f4b4ce55f64bdead0dec82c6b36e89cd89d33768d0a33c2698dd88174f24")
  (:PATH "verify/raw/tests.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/raw/tests.lisp.gz")
   :BYTES 49909 :SHA256
   "037e2344f40b7c62802970819fc2be88f203adcdca718cac1cd7cadfd0f0a5c5")
  (:PATH "verify/result.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/ci/archive-stage/verify/result.lisp")
   :BYTES 4784 :SHA256
   "fe48d4eab86530e2a315f47dbd5db72dfe91c4a21dc8e22c66a71102880964bc"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
