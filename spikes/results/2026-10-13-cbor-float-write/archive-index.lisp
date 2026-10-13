(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((10) BASE-CHAR . "process-01") :RECORD-PATH
   "processes/process-01/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "tools/cbor-float-write-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((10) BASE-CHAR . "process-02") :RECORD-PATH
   "processes/process-02/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((33) BASE-CHAR . "tools/cbor-float-write-audit.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((10) BASE-CHAR . "process-03") :RECORD-PATH
   "processes/process-03/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")))
  (:LABEL #A((10) BASE-CHAR . "process-04") :RECORD-PATH
   "processes/process-04/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/coverage-self-test/")))
  (:LABEL #A((10) BASE-CHAR . "process-05") :RECORD-PATH
   "processes/process-05/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((33) BASE-CHAR . "tools/cbor-float-write-bench.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL #A((10) BASE-CHAR . "process-06") :RECORD-PATH
   "processes/process-06/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((33) BASE-CHAR . "tools/cbor-float-write-bench.lisp")
    #A((7) BASE-CHAR . "--bench")))
  (:LABEL #A((10) BASE-CHAR . "process-07") :RECORD-PATH
   "processes/process-07/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((46) BASE-CHAR . "spikes/out/cbor-float-write-20261013/coverage/")
    #A((16) BASE-CHAR . "cbor-float-write")))
  (:LABEL #A((10) BASE-CHAR . "process-08") :RECORD-PATH
   "processes/process-08/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((33) BASE-CHAR . "tools/cbor-float-write-audit.lisp")
    #A((7) BASE-CHAR . "--bench")
    #A((49) BASE-CHAR . "spikes/out/4000905677-command-32530-0/report.lisp")
    #A((40) BASE-CHAR . "cd5749edc0a757ee3a5b470eda566a6685d32fd8")
    #A((40) BASE-CHAR . "03c6aed61e2c243d8b1a6c4332ce1837c4e9a77c")))
  (:LABEL #A((10) BASE-CHAR . "process-09") :RECORD-PATH
   "processes/process-09/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "tools/cbor-float-write-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((47) BASE-CHAR . "spikes/out/cbor-float-write-20261013/mutations/")))
  (:LABEL #A((10) BASE-CHAR . "process-10") :RECORD-PATH
   "processes/process-10/report.lisp" :STATUS :FAILED :EXIT-CODE 1
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/self-test-1/")))
  (:LABEL #A((10) BASE-CHAR . "process-11") :RECORD-PATH
   "processes/process-11/report.lisp" :STATUS :FAILED :EXIT-CODE 1
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/")))
  (:LABEL #A((10) BASE-CHAR . "process-12") :RECORD-PATH
   "processes/process-12/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/")))
  (:LABEL #A((10) BASE-CHAR . "process-13") :RECORD-PATH
   "processes/process-13/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/")))
  (:LABEL #A((10) BASE-CHAR . "process-14") :RECORD-PATH
   "processes/process-14/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root") #A((11) BASE-CHAR . "spikes/out/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL #A((10) BASE-CHAR . "process-15") :RECORD-PATH
   "processes/process-15/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/manifest.lisp")
   :BYTES 7024 :SHA256
   "57d576dcca9b62ff83d24d9efc480c45393b9f24d210ca861114c1dc4fbfa22c")
  (:PATH "collection-source.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
   :BYTES 22602 :SHA256
   "53d8c739a95a79aba4ddc363abd6e0bc1f8d3f64b1572150b730f69eedc15296")
  (:PATH "processes/process-01/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905572-command-32030-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "c55b628a85307661a291809d2ec57930d95ac53dc51fb54358ad65707332d646")
  (:PATH "processes/process-01/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905572-command-32030-0/report.lisp")
   :BYTES 221129 :SHA256
   "5bf758c1ca34fd5a4392d65d640653fafc90f992f484be52140921bc5161ebe0")
  (:PATH "processes/process-02/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905572-command-32031-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "405cead3902c327e8745d8b4e129bdc18b14b044001b9fb2923b702cb22cd8f2")
  (:PATH "processes/process-02/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905572-command-32031-0/report.lisp")
   :BYTES 157529 :SHA256
   "70530ceb98b46d03189ab6d39e2314ac9c02c1c50879988188ca50ed0c79d9b6")
  (:PATH "processes/process-03/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905572-command-32032-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "15c73751d30f158db5fcf52ab9e3ac8d9721a0375e6ef68f46bfb2dacfebb712")
  (:PATH "processes/process-03/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905572-command-32032-0/report.lisp")
   :BYTES 777871 :SHA256
   "9941f54a5cbb4a16981c2584ef6a4ed32b5bd6612dbe8712c55622059da09212")
  (:PATH "processes/process-04/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905572-command-32033-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "ef727c5c23d8ea7c60f3621a4ca0d46e16cc0ed1752b3a7ddedf29616fcd15b5")
  (:PATH "processes/process-04/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905572-command-32033-0/report.lisp")
   :BYTES 153004 :SHA256
   "4866ed9e77aaff9ec5598d7c0b6d6895be90067428d9c65914481b85b3c8bc94")
  (:PATH "processes/process-05/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905644-command-32361-0/conservazione.lisp")
   :BYTES 1152 :SHA256
   "2b2e3881035908c165618d42f5a5f1ac6b7bb13adbcda725a588bb2f58ae1a07")
  (:PATH "processes/process-05/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905644-command-32361-0/report.lisp")
   :BYTES 190123 :SHA256
   "254b80220b8b51ce51d5e0d8629c2d32b65983b89fcdffa1f89b1e779e88ea8a")
  (:PATH "processes/process-06/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905677-command-32530-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "2a0431828606cec8fb56b8332d267bd1398cbeb8e7751bd71b03576e2af04768")
  (:PATH "processes/process-06/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905677-command-32530-0/report.lisp")
   :BYTES 198507 :SHA256
   "1154975a7c27c433d402c7b7549a62fb321b1e43fb806f5def86dd8825bfceb6")
  (:PATH "processes/process-07/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905717-command-32850-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "48ef86672b5fd98de6922afb38dd5996e34ae335100a6d220d0776e9a7243818")
  (:PATH "processes/process-07/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905717-command-32850-0/report.lisp")
   :BYTES 155106 :SHA256
   "183c3eb8273d8ad4f3348df9dfd3d6d09afeab74c7bc097e56119297c2d5ae24")
  (:PATH "processes/process-08/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905717-command-32851-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "3970df67d0c4ba11d0576c1dbc771e7beee565f9dfc9aeb6260d9a95d5140a2a")
  (:PATH "processes/process-08/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905717-command-32851-0/report.lisp")
   :BYTES 154777 :SHA256
   "a648824ca0f0ec2c3520cfa885dc6a9f6909f723fafc0e6e0b364b7a4d9cce61")
  (:PATH "processes/process-09/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905717-command-32852-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "d6b3adbfd521ffc8e5dc45d50cca5bef09f330d4313181c2673541c3909f711b")
  (:PATH "processes/process-09/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905717-command-32852-0/report.lisp")
   :BYTES 223988 :SHA256
   "f2d4164b39abae02751130ea8d93f912c1f0320f9a62fb63a35e7f1bab7dd5b6")
  (:PATH "processes/process-10/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905801-command-34576-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "f246798232517f93ffd156fc7c71d13a931948da925f9ca0775584c4de53b1ac")
  (:PATH "processes/process-10/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905801-command-34576-0/report.lisp")
   :BYTES 156531 :SHA256
   "e21589452e81c09d0ac6ba5a99cdcd05f24fbf869f51f20b4c6f98faf31ac554")
  (:PATH "processes/process-11/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905856-command-35196-0/conservazione.lisp")
   :BYTES 1152 :SHA256
   "86eadb029131a3f267745b39086942ec8f5f68be3a8095cc8d6bfbd3a08c6483")
  (:PATH "processes/process-11/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905856-command-35196-0/report.lisp")
   :BYTES 157339 :SHA256
   "ab016908a7a27175ff83f8816e26a2be5752414a940caa9c04c6194428537949")
  (:PATH "processes/process-12/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905890-command-35636-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "066e71ab4bcb1b684bf9a49670ad7c4a8fc2ee046f03e83eede9d7d3569bb78c")
  (:PATH "processes/process-12/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905890-command-35636-0/report.lisp")
   :BYTES 153837 :SHA256
   "3f6e6a60a2139b770cdabc96e36cc59f9479910e11e1f5a2a949c05898d6c2e3")
  (:PATH "processes/process-13/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906040-command-37108-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "8c6cce5cb0578e04f44e2b376f5ccc2700329905944b8c3a1959944a2ffd0ad2")
  (:PATH "processes/process-13/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906040-command-37108-0/report.lisp")
   :BYTES 153838 :SHA256
   "24fe454201876cd077570a1e7d3a9da6fae0f4a67c1a04bbdd36f5684d7485a3")
  (:PATH "processes/process-14/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906427-command-39942-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "62c03654f8d2a3cf6f2a0f52829926a0ef38aad0337bd1261e1a5f7d9e05ab11")
  (:PATH "processes/process-14/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906427-command-39942-0/report.lisp")
   :BYTES 154586 :SHA256
   "91b6a14988470606adac2be2a35708d564a31e980cc0d9a26e080870e66b7ea8")
  (:PATH "processes/process-15/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906623-command-43539-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "fbcf5ad47b0579feaa03cef9e3270f678de5a578e2aae1dd82c0ea686591d94a")
  (:PATH "processes/process-15/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906623-command-43539-0/report.lisp")
   :BYTES 824588 :SHA256
   "6afe50f7706619b23e77265efd645e9249a70d4a1226ce11f4f7592224832eeb")
  (:PATH
   "raw/4000905574-cbor-float-write-worker-self-test-32095/baseline-copy/report.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/baseline-copy/report.lisp")
   :BYTES 507 :SHA256
   "893533a77ed198b1fdc051183010f4eaa86b8c1aa0a8cc65a7b2553596bd8eee")
  (:PATH
   "raw/4000905574-cbor-float-write-worker-self-test-32095/baseline-copy/test.log"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000905574-cbor-float-write-worker-self-test-32095/baseline-transport/report.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/baseline-transport/report.lisp")
   :BYTES 522 :SHA256
   "f531d0b4f63b07491e49a556cb1c79bf6cb431eef6ee5dba014591f68d21c861")
  (:PATH
   "raw/4000905574-cbor-float-write-worker-self-test-32095/baseline-transport/test.log"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000905574-cbor-float-write-worker-self-test-32095/completion-exit/test.log"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000905574-cbor-float-write-worker-self-test-32095/completion-exit/tools/cbor-float-write-isolated-build.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/completion-exit/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000905574-cbor-float-write-worker-self-test-32095/report.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/report.lisp")
   :BYTES 1742 :SHA256
   "f52c9ca690a7cc6b3f2d0b9623f384d5be523c6f769c777b19f4470db10c2447")
  (:PATH
   "raw/4000905574-cbor-float-write-worker-self-test-32095/signal/test.log"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000905574-cbor-float-write-worker-self-test-32095/signal/tools/cbor-float-write-isolated-build.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905574-cbor-float-write-worker-self-test-32095/signal/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/4000905718-cbor-float-write-worker-self-test-32900/baseline-copy/report.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/baseline-copy/report.lisp")
   :BYTES 507 :SHA256
   "b1a28e73739e7e4e648f441c11a8afdbff8e9cc987249e92014b58e3695bceb9")
  (:PATH
   "raw/4000905718-cbor-float-write-worker-self-test-32900/baseline-copy/test.log"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000905718-cbor-float-write-worker-self-test-32900/baseline-transport/report.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/baseline-transport/report.lisp")
   :BYTES 522 :SHA256
   "67b9c14d63b09ab03ff4902358eb5ded96bd941cc38dde05339eb7b9ad5383d1")
  (:PATH
   "raw/4000905718-cbor-float-write-worker-self-test-32900/baseline-transport/test.log"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000905718-cbor-float-write-worker-self-test-32900/completion-exit/test.log"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000905718-cbor-float-write-worker-self-test-32900/completion-exit/tools/cbor-float-write-isolated-build.lisp"
   :SOURCE
   #A((184) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/completion-exit/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000905718-cbor-float-write-worker-self-test-32900/report.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/report.lisp")
   :BYTES 1742 :SHA256
   "b42cbe5d1c1982287405ad2ebaeb62d2a086058b9b452b17fdded0fe4d7118b3")
  (:PATH
   "raw/4000905718-cbor-float-write-worker-self-test-32900/signal/test.log"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000905718-cbor-float-write-worker-self-test-32900/signal/tools/cbor-float-write-isolated-build.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000905718-cbor-float-write-worker-self-test-32900/signal/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/4000906647-snapshot-self-test-44166-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906647-snapshot-self-test-44166-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/4000906647-snapshot-self-test-44166-0/completion-exit/stderr.log"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906647-snapshot-self-test-44166-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/4000906647-snapshot-self-test-44166-0/completion-exit/stdout.log"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906647-snapshot-self-test-44166-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/4000906647-snapshot-self-test-44166-0/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906647-snapshot-self-test-44166-0/report.lisp")
   :BYTES 1961 :SHA256
   "5832c8e08243453b6e8b2e6c15ab500b7ebb658f479f2866880cab29ea838950")
  (:PATH "raw/4000906647-snapshot-self-test-44166-0/signal/isolated-build.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906647-snapshot-self-test-44166-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/4000906647-snapshot-self-test-44166-0/signal/stderr.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906647-snapshot-self-test-44166-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/4000906647-snapshot-self-test-44166-0/signal/stdout.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906647-snapshot-self-test-44166-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH
   "raw/4000906648-reader-self-test-44190-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906648-reader-self-test-44190-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/4000906648-reader-self-test-44190-0/completion-exit/stderr.log"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906648-reader-self-test-44190-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/4000906648-reader-self-test-44190-0/completion-exit/stdout.log"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906648-reader-self-test-44190-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/4000906648-reader-self-test-44190-0/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906648-reader-self-test-44190-0/report.lisp")
   :BYTES 1943 :SHA256
   "35274d7643fe1f1c272518d8dd6908f62ecf82828161612fff599719dbb523a5")
  (:PATH "raw/4000906648-reader-self-test-44190-0/signal/isolated-build.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906648-reader-self-test-44190-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/4000906648-reader-self-test-44190-0/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906648-reader-self-test-44190-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/4000906648-reader-self-test-44190-0/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906648-reader-self-test-44190-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/4000906799-check-47514-0/SPK-01.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "4d2ba5d6d8c75bc3abb047894339d93eec662df11243aa115520c34d553ef0b6")
  (:PATH "raw/4000906799-check-47514-0/SPK-02.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-02.lisp")
   :BYTES 1605 :SHA256
   "63c94c80aa4ca94878bded9a1b693ab4aaad7397b258fa75dfe21604774f4a23")
  (:PATH "raw/4000906799-check-47514-0/SPK-03.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-03.lisp")
   :BYTES 3644 :SHA256
   "d427a80b45a644ffdcd99b76c88540d029ff47e329da055e47316257246c4bfd")
  (:PATH "raw/4000906799-check-47514-0/SPK-04.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-04.lisp")
   :BYTES 6751 :SHA256
   "34e878b955547ef3806b5e9b4acf21e2ad92e069b5f705b0e87f2145aefb8cbc")
  (:PATH "raw/4000906799-check-47514-0/SPK-05.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-05.lisp")
   :BYTES 10042 :SHA256
   "bf32a156985153f4978fdcc018c8ba707f0774024e92f367fb032f5e56128965")
  (:PATH "raw/4000906799-check-47514-0/SPK-06.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-06.lisp")
   :BYTES 24050 :SHA256
   "5ea370f0111edcdd8a8a816163de158162a457303404dc4f79d94f2f3475efac")
  (:PATH "raw/4000906799-check-47514-0/SPK-07.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "5c766a9ffe27d2c7d511955dbacbe4011119558242b780be506315772ca054d4")
  (:PATH "raw/4000906799-check-47514-0/SPK-07.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-07.lisp.gz")
   :BYTES 410622 :SHA256
   "719495a623bb5aff3c7cc65f3eb2fc2c158b0097a7adf6e78e7a1015d90bd044")
  (:PATH "raw/4000906799-check-47514-0/SPK-08.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "a45ff2687356ac0b5016b65368637fe2b93547489310b2e0e67e731bebe1daff")
  (:PATH "raw/4000906799-check-47514-0/SPK-09.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "01750b4fc5c640e8cdb025910dc0d70b8e7be78116a29cd7e8ecf4ec86082efa")
  (:PATH "raw/4000906799-check-47514-0/SPK-10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "70d6b6ba3a5a4196611b6b9bb3679bfcbad97ba3f2a92b476944fbcbafc742b2")
  (:PATH "raw/4000906799-check-47514-0/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/conservazione.lisp")
   :BYTES 2301 :SHA256
   "00ff09d155c19082a054c805ec146d0f041feb40137ec9b83d3fbeeaa487e6ce")
  (:PATH "raw/4000906799-check-47514-0/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/report.lisp")
   :BYTES 318 :SHA256
   "2efea564ff1e2e1c199d91ad4bb9d85da0c651186abb1cd537f31309b299e709")
  (:PATH "raw/4000906799-check-47514-0/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906799-check-47514-0/report.lisp.gz")
   :BYTES 466813 :SHA256
   "37105c9ca037a1cf682825b41865948d0b8c05c62b584aa631babd626d90a013")
  (:PATH "raw/coverage-self-test-html/cover-index.html" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage-self-test/cover-index.html")
   :BYTES 1799 :SHA256
   "02996b28b826cfaf997cfabee27d8dc364d2b6d46588667c416d571c1f96b104")
  (:PATH "raw/coverage-self-test-html/e45956f2a56f161a0890a83dae0dc501.html"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage-self-test/e45956f2a56f161a0890a83dae0dc501.html")
   :BYTES 2839 :SHA256
   "4063b32d45458516745d3ae3b10702964150dac534f1ac3cc76b02f58ca0f3de")
  (:PATH "raw/coverage-self-test/coverage-fixture.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage-self-test/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/coverage/23a33ec5ac2b59d1b9d7819bf40c11d1.html" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage/23a33ec5ac2b59d1b9d7819bf40c11d1.html")
   :BYTES 30109 :SHA256
   "287ed54697c0e8f92596c28f3678cce462fad6ca82aedfec4f4ac8a95392b64a")
  (:PATH "raw/coverage/8cf55e316599aaec35dd1fc1f1566797.html" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage/8cf55e316599aaec35dd1fc1f1566797.html")
   :BYTES 31681 :SHA256
   "c85c97a0932b23fc93d328958117d6b45ca160ba8ac47e9d8168f584b5b6d7e8")
  (:PATH "raw/coverage/cover-index.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage/cover-index.html")
   :BYTES 1956 :SHA256
   "0fd3fda477a1b039a03ce29a359c15b65fe2ad188b1c7a598068317294cc58bd")
  (:PATH "raw/coverage/coverage-state.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage/coverage-state.lisp")
   :BYTES 325 :SHA256
   "cc549548dfa8d64e7df10644e05782004a2debb3bb231ed86d368b2832eef36d")
  (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage/coverage-state.lisp.gz")
   :BYTES 282160 :SHA256
   "6fc1f209e628ef03d1a30a5439432e101ab440a2f36b171459fa1b49e77e872a")
  (:PATH "raw/frozen/arcdocdb.asd" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/arcdocdb.asd")
   :BYTES 13232 :SHA256
   "c99d0d6225434a02e2d6d1af304c5f7f7f538f84cca1aebbcbc3c4aefd36047a")
  (:PATH
   "raw/frozen/docs/implementazione/cbor-float-scrittura-decisioni.md.txt"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/docs/implementazione/cbor-float-scrittura-decisioni.md.txt")
   :BYTES 1920 :SHA256
   "6754294cb0650156b112e996d82fac8175c6ffb772e3355fe782f98dc0e4c861")
  (:PATH "raw/frozen/docs/implementazione/cbor-float-scrittura-lettura.md.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/docs/implementazione/cbor-float-scrittura-lettura.md.txt")
   :BYTES 14846 :SHA256
   "eaa52b6f4f7e6857dbba3684b8a5fc2bf77a941725cb5aa63f8bbef098595821")
  (:PATH "raw/frozen/docs/implementazione/cbor-float-scrittura-metodo.md.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/docs/implementazione/cbor-float-scrittura-metodo.md.txt")
   :BYTES 4657 :SHA256
   "81ad17b9f34636d3eb6fade4135400387943e8cb006d6f5f72381cd27b140d15")
  (:PATH
   "raw/frozen/docs/implementazione/cbor-float-scrittura-revisione.md.txt"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/docs/implementazione/cbor-float-scrittura-revisione.md.txt")
   :BYTES 8528 :SHA256
   "65a74eba0c3bbec31b35b21d0a66e49018c231dcdabed5080376f0e967e9b23f")
  (:PATH "raw/frozen/docs/implementazione/cbor-float-scrittura.md.txt" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/docs/implementazione/cbor-float-scrittura.md.txt")
   :BYTES 1905 :SHA256
   "dfc43be9469fe231a575c30acc81ab3fe6296beec0651500f7b7442e1f0ea478")
  (:PATH "raw/frozen/docs/tracciabilita/matrice.md.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/docs/tracciabilita/matrice.md.txt")
   :BYTES 49576 :SHA256
   "9fb8313730d0bfccce300f676a91e3692ffc580df7489e8da5fcf40d26e4a35a")
  (:PATH "raw/frozen/docs/tracciabilita/requisiti.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/docs/tracciabilita/requisiti.lisp")
   :BYTES 39919 :SHA256
   "8623baf3a7e5d25ed3e8e4a9a2627f9fdb52e44e1e17d9050441c0cfddf63343")
  (:PATH "raw/frozen/snapshot-index.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/snapshot-index.lisp")
   :BYTES 3419 :SHA256
   "0463bf1718f96ce15c665afd6c1afd0548561838811ff3f42d54bfae6cb8a98d")
  (:PATH "raw/frozen/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/frozen/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/frozen/src/codec/cbor-float-write.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/frozen/src/codec/cbor-package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/frozen/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/frozen/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/frozen/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/frozen/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/frozen/tools/cbor-float-write-audit.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/tools/cbor-float-write-audit.lisp")
   :BYTES 48028 :SHA256
   "8d15a95a92a25cdb3b397b289c67d5c64f0155a29dc8d36bdda33fbf8701862f")
  (:PATH "raw/frozen/tools/cbor-float-write-bench.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/tools/cbor-float-write-bench.lisp")
   :BYTES 12784 :SHA256
   "43172506ca84378b507668738b358b982ec96912e1b737028fb62f8d4736bc2c")
  (:PATH "raw/frozen/tools/cbor-float-write-mutation.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/tools/cbor-float-write-mutation.lisp")
   :BYTES 39964 :SHA256
   "faa10a01e54082f7a8c5d0d9a8be6317ee6d8c7c6967522bb36c81fb5f154192")
  (:PATH "raw/frozen/tools/foundation-coverage.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/frozen/tools/foundation-coverage.lisp")
   :BYTES 16660 :SHA256
   "ea442ed9712796a2793eabefe546d2e41820fddc086a446a30e54ceeb3927702")
  (:PATH "raw/helpers/audit-original-pre-comment.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/audit-original-pre-comment.lisp")
   :BYTES 47932 :SHA256
   "32e3feb673b2ac634d9dc6c05003962e434b6d757b6ee2dc0ac80552a606334e")
  (:PATH "raw/helpers/build-manifest.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/build-manifest.lisp")
   :BYTES 3016 :SHA256
   "50541a3ae9a134d25cb8362fa355d9c56000b722e2de59765077a675d90ff567")
  (:PATH "raw/helpers/freeze-sources.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/freeze-sources.lisp")
   :BYTES 2397 :SHA256
   "c6cbf0b322c2b09375d37df8bd5c92219254a06c10250a7882fa5c671b6c858f")
  (:PATH "raw/helpers/mutation-catalogue-before-quotient-guard.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutation-catalogue-before-quotient-guard.lisp")
   :BYTES 39964 :SHA256
   "40fe7ee005ae1f84431db4cc4b1be55103fc354718885e1c36237a3dec9470de")
  (:PATH "raw/helpers/mutation-original-pre-catalogue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutation-original-pre-catalogue.lisp")
   :BYTES 34479 :SHA256
   "4735b4d0eb36a3d78eb6382638d34f0d9e5e44d9cea36dc053afe196eec83e9f")
  (:PATH "raw/mutations/0/src/cache/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/0/src/cache/clock.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/0/src/cache/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/0/src/cache/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/0/src/cache/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/0/src/cache/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/0/src/cache/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/0/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/0/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations/0/src/codec/cbor-float-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-float-write.lisp")
   :BYTES 5087 :SHA256
   "6d390ce0e59d1f33f9ff30b445828a2041f88eed53c5f3491e64ebf515aaf198")
  (:PATH "raw/mutations/0/src/codec/cbor-header.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/0/src/codec/cbor-minimal.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/0/src/codec/cbor-package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/0/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/0/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/0/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/0/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/0/src/codec/cbor-scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/0/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/0/src/codec/cbor-space.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/0/src/codec/cbor-string-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/0/src/codec/cbor-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/0/src/codec/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/0/src/codec/utf8.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/0/src/csn/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/0/src/csn/registry.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/0/src/epochs/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/0/src/epochs/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/0/src/epochs/read.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/0/src/epochs/reclaim.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/0/src/epochs/retire.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/0/src/epochs/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/0/src/execution/handoff.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/0/src/execution/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/0/src/execution/queue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/0/src/execution/ready-recycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/0/src/execution/ready-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/0/src/execution/ready.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/0/src/execution/worker-boundary.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/0/src/execution/worker-claim.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/0/src/execution/worker-run.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/0/src/execution/worker-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/0/src/execution/writer.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/0/src/foundation/batch.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/0/src/foundation/binary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/0/src/foundation/conditions.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/0/src/foundation/crc32c.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/0/src/foundation/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/0/src/foundation/record.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/0/src/get-directory/build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/0/src/get-directory/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/0/src/get-directory/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/0/src/get-directory/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/0/src/get-resolver/active-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/0/src/get-resolver/active-directory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/0/src/get-resolver/active-preflight.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/0/src/get-resolver/active-read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/0/src/get-resolver/active-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/0/src/get-resolver/active-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/0/src/get-resolver/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/0/src/get-resolver/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/0/src/get-resolver/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/0/src/get-resolver/rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/0/src/get-resolver/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/0/src/get-resolver/sort.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/0/src/get-resolver/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/0/src/get/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/0/src/get/lifecycle.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/0/src/get/lookup.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/0/src/get/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/0/src/get/segment.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/0/src/get/target.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/0/src/get/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/0/src/hash/arithmetic.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/0/src/hash/blocks.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/0/src/hash/hash64.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/0/src/hash/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/0/src/index/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/0/src/index/hash-digests.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/0/src/index/hash-seed.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/0/src/index/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/0/src/index/primary-arena.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/0/src/index/primary-build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/0/src/index/primary-core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/0/src/index/primary-directory.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/0/src/index/primary-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/0/src/index/primary-probe.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/0/src/index/primary-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/0/src/index/primary-relocate.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/0/src/index/primary-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/0/src/index/primary-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/0/src/index/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/0/src/index/rebuild-budget.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/0/src/index/rebuild-copy.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/0/src/index/rebuild-scan.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/0/src/index/rebuild.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/0/src/index/relocate.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/0/src/index/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/0/src/index/validation.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/0/src/index/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/0/src/io/flush.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/0/src/io/lifecycle.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/0/src/io/native.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/0/src/io/package.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/0/src/io/transfer.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/0/src/io/types.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/0/src/mvcc/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/0/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/0/src/mvcc/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/0/src/package.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/0/src/read/core.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/0/src/read/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/0/src/read/task.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/0/src/read/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/0/src/recovery/decisions-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/0/src/recovery/decisions-package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/0/src/recovery/decisions-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/0/src/recovery/decisions-radix.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/0/src/recovery/decisions-sort.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/0/src/recovery/decisions-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/0/src/recovery/inventory-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/0/src/recovery/inventory-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/0/src/recovery/inventory-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/0/src/recovery/manifest-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/0/src/recovery/manifest-decode.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/0/src/recovery/manifest-fold.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/0/src/recovery/manifest-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/0/src/recovery/manifest-query.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/0/src/recovery/manifest-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/0/src/recovery/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/0/src/recovery/scan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/0/src/series/events.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/0/src/series/io-events.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/0/src/series/ownership.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/0/src/series/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/0/src/series/publication.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/0/src/series/query.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/0/src/series/retirement.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/0/src/series/routing-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/0/src/series/routing-select.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/0/src/series/routing-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/0/src/series/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/0/src/series/worker-boundary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/0/src/series/worker-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/0/src/series/worker-run.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/0/src/series/worker-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/0/src/storage/compaction-scan.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/0/src/storage/control-payload.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/0/src/storage/formats.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/0/src/storage/log-header.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/0/src/storage/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/0/src/storage/payload-record.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/0/src/storage/payload-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/0/src/storage/segment-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/0/src/wal/builder.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/0/src/wal/csn.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/0/src/wal/executor.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/0/src/wal/group.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/0/src/wal/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/0/src/wal/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/0/test.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/test.log")
   :BYTES 27120 :SHA256
   "0a5ce8fd1e2b5433818a14d0f5866a81737af158f9137bf960d4ad5493b81a3e")
  (:PATH "raw/mutations/0/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/0/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/0/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/0/tests/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/0/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/0/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/0/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/0/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/0/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/0/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/0/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/0/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/0/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/0/tests/codec/cbor-structure.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/0/tests/codec/cbor-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/0/tests/codec/cbor-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/0/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/0/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/0/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/0/tests/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/0/tests/codec/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/0/tests/codec/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/0/tests/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/0/tests/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/0/tests/csn/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/0/tests/csn/threads.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/0/tests/epochs/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/0/tests/epochs/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/0/tests/epochs/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/0/tests/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/0/tests/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/0/tests/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/0/tests/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/0/tests/execution/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/0/tests/execution/threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/0/tests/execution/worker.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/0/tests/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/0/tests/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/0/tests/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/0/tests/foundation/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/0/tests/get-directory/construction.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/0/tests/get-directory/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/0/tests/get-directory/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/0/tests/get-directory/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/0/tests/get-performance/guards.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/0/tests/get-performance/paths.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/0/tests/get-performance/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/0/tests/get-performance/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/0/tests/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/0/tests/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/0/tests/get/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/0/tests/hash/guards.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/0/tests/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/0/tests/hash/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/0/tests/hash/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/0/tests/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/0/tests/index/primary-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/0/tests/index/primary-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/0/tests/index/primary.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/0/tests/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/0/tests/index/slot-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/0/tests/index/slot-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/0/tests/index/slots.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/0/tests/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/0/tests/io/support.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/0/tests/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/0/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/0/tests/lint-fixtures/good.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/0/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/0/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/0/tests/mvcc/capture.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/0/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/0/tests/mvcc/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/0/tests/read/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/0/tests/read/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/0/tests/read/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/0/tests/recovery/corruption.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/0/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/0/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/0/tests/recovery/decisions-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/0/tests/recovery/decisions.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/0/tests/recovery/inventory-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/0/tests/recovery/inventory.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/0/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/0/tests/recovery/manifest-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/0/tests/recovery/manifest.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/0/tests/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/0/tests/recovery/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/0/tests/series/boundaries.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/0/tests/series/controller.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/0/tests/series/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/0/tests/series/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/0/tests/series/worker-bridge.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/0/tests/series/worker-routing.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/0/tests/smoke.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/0/tests/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/0/tests/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/0/tests/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/0/tests/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/0/tests/storage/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/0/tests/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/0/tests/wal/csn-threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/0/tests/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/0/tests/wal/fault.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/0/tests/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/0/tests/wal/native.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/0/tests/wal/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/0/tools/build.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/0/tools/cbor-float-write-isolated-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/0/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 474 :SHA256
   "43b224c3713a95f0c1636d354f3f0b4eb8dee42fb98bd1fee3c0aabc8ee7b0d0")
  (:PATH "raw/mutations/1/src/cache/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/1/src/cache/clock.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/1/src/cache/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/1/src/cache/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/1/src/cache/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/1/src/cache/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/1/src/cache/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/1/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/1/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations/1/src/codec/cbor-float-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-float-write.lisp")
   :BYTES 5087 :SHA256
   "352a10b20a5e00dc3b05cd13db62a7194efb3c61ebaa155d275c2db751b6f464")
  (:PATH "raw/mutations/1/src/codec/cbor-header.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/1/src/codec/cbor-minimal.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/1/src/codec/cbor-package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/1/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/1/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/1/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/1/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/1/src/codec/cbor-scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/1/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/1/src/codec/cbor-space.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/1/src/codec/cbor-string-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/1/src/codec/cbor-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/1/src/codec/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/1/src/codec/utf8.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/1/src/csn/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/1/src/csn/registry.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/1/src/epochs/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/1/src/epochs/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/1/src/epochs/read.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/1/src/epochs/reclaim.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/1/src/epochs/retire.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/1/src/epochs/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/1/src/execution/handoff.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/1/src/execution/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/1/src/execution/queue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/1/src/execution/ready-recycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/1/src/execution/ready-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/1/src/execution/ready.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/1/src/execution/worker-boundary.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/1/src/execution/worker-claim.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/1/src/execution/worker-run.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/1/src/execution/worker-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/1/src/execution/writer.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/1/src/foundation/batch.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/1/src/foundation/binary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/1/src/foundation/conditions.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/1/src/foundation/crc32c.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/1/src/foundation/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/1/src/foundation/record.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/1/src/get-directory/build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/1/src/get-directory/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/1/src/get-directory/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/1/src/get-directory/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/1/src/get-resolver/active-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/1/src/get-resolver/active-directory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/1/src/get-resolver/active-preflight.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/1/src/get-resolver/active-read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/1/src/get-resolver/active-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/1/src/get-resolver/active-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/1/src/get-resolver/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/1/src/get-resolver/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/1/src/get-resolver/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/1/src/get-resolver/rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/1/src/get-resolver/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/1/src/get-resolver/sort.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/1/src/get-resolver/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/1/src/get/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/1/src/get/lifecycle.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/1/src/get/lookup.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/1/src/get/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/1/src/get/segment.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/1/src/get/target.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/1/src/get/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/1/src/hash/arithmetic.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/1/src/hash/blocks.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/1/src/hash/hash64.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/1/src/hash/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/1/src/index/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/1/src/index/hash-digests.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/1/src/index/hash-seed.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/1/src/index/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/1/src/index/primary-arena.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/1/src/index/primary-build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/1/src/index/primary-core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/1/src/index/primary-directory.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/1/src/index/primary-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/1/src/index/primary-probe.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/1/src/index/primary-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/1/src/index/primary-relocate.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/1/src/index/primary-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/1/src/index/primary-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/1/src/index/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/1/src/index/rebuild-budget.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/1/src/index/rebuild-copy.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/1/src/index/rebuild-scan.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/1/src/index/rebuild.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/1/src/index/relocate.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/1/src/index/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/1/src/index/validation.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/1/src/index/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/1/src/io/flush.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/1/src/io/lifecycle.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/1/src/io/native.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/1/src/io/package.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/1/src/io/transfer.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/1/src/io/types.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/1/src/mvcc/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/1/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/1/src/mvcc/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/1/src/package.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/1/src/read/core.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/1/src/read/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/1/src/read/task.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/1/src/read/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/1/src/recovery/decisions-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/1/src/recovery/decisions-package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/1/src/recovery/decisions-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/1/src/recovery/decisions-radix.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/1/src/recovery/decisions-sort.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/1/src/recovery/decisions-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/1/src/recovery/inventory-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/1/src/recovery/inventory-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/1/src/recovery/inventory-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/1/src/recovery/manifest-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/1/src/recovery/manifest-decode.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/1/src/recovery/manifest-fold.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/1/src/recovery/manifest-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/1/src/recovery/manifest-query.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/1/src/recovery/manifest-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/1/src/recovery/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/1/src/recovery/scan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/1/src/series/events.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/1/src/series/io-events.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/1/src/series/ownership.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/1/src/series/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/1/src/series/publication.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/1/src/series/query.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/1/src/series/retirement.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/1/src/series/routing-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/1/src/series/routing-select.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/1/src/series/routing-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/1/src/series/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/1/src/series/worker-boundary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/1/src/series/worker-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/1/src/series/worker-run.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/1/src/series/worker-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/1/src/storage/compaction-scan.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/1/src/storage/control-payload.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/1/src/storage/formats.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/1/src/storage/log-header.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/1/src/storage/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/1/src/storage/payload-record.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/1/src/storage/payload-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/1/src/storage/segment-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/1/src/wal/builder.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/1/src/wal/csn.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/1/src/wal/executor.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/1/src/wal/group.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/1/src/wal/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/1/src/wal/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/1/test.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/test.log")
   :BYTES 27129 :SHA256
   "485d0f433596556efb10f869f76c79d34892295b321e21e4776e8e86aaeee3a6")
  (:PATH "raw/mutations/1/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/1/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/1/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/1/tests/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/1/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/1/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/1/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/1/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/1/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/1/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/1/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/1/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/1/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/1/tests/codec/cbor-structure.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/1/tests/codec/cbor-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/1/tests/codec/cbor-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/1/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/1/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/1/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/1/tests/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/1/tests/codec/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/1/tests/codec/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/1/tests/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/1/tests/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/1/tests/csn/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/1/tests/csn/threads.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/1/tests/epochs/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/1/tests/epochs/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/1/tests/epochs/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/1/tests/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/1/tests/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/1/tests/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/1/tests/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/1/tests/execution/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/1/tests/execution/threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/1/tests/execution/worker.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/1/tests/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/1/tests/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/1/tests/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/1/tests/foundation/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/1/tests/get-directory/construction.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/1/tests/get-directory/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/1/tests/get-directory/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/1/tests/get-directory/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/1/tests/get-performance/guards.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/1/tests/get-performance/paths.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/1/tests/get-performance/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/1/tests/get-performance/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/1/tests/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/1/tests/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/1/tests/get/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/1/tests/hash/guards.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/1/tests/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/1/tests/hash/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/1/tests/hash/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/1/tests/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/1/tests/index/primary-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/1/tests/index/primary-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/1/tests/index/primary.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/1/tests/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/1/tests/index/slot-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/1/tests/index/slot-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/1/tests/index/slots.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/1/tests/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/1/tests/io/support.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/1/tests/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/1/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/1/tests/lint-fixtures/good.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/1/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/1/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/1/tests/mvcc/capture.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/1/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/1/tests/mvcc/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/1/tests/read/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/1/tests/read/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/1/tests/read/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/1/tests/recovery/corruption.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/1/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/1/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/1/tests/recovery/decisions-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/1/tests/recovery/decisions.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/1/tests/recovery/inventory-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/1/tests/recovery/inventory.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/1/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/1/tests/recovery/manifest-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/1/tests/recovery/manifest.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/1/tests/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/1/tests/recovery/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/1/tests/series/boundaries.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/1/tests/series/controller.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/1/tests/series/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/1/tests/series/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/1/tests/series/worker-bridge.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/1/tests/series/worker-routing.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/1/tests/smoke.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/1/tests/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/1/tests/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/1/tests/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/1/tests/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/1/tests/storage/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/1/tests/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/1/tests/wal/csn-threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/1/tests/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/1/tests/wal/fault.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/1/tests/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/1/tests/wal/native.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/1/tests/wal/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/1/tools/build.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/1/tools/cbor-float-write-isolated-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/1/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 474 :SHA256
   "3a5a8004ab7ff4e5cf8cf57a17d1ba29bf0864e0138599157aa7d7dc034fbef6")
  (:PATH "raw/mutations/2/src/cache/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/2/src/cache/clock.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/2/src/cache/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/2/src/cache/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/2/src/cache/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/2/src/cache/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/2/src/cache/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/2/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/2/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "8b67183ea909e09ed123db514c37193d96e927beaa22bcde6ead633e1ff9508f")
  (:PATH "raw/mutations/2/src/codec/cbor-float-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations/2/src/codec/cbor-header.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/2/src/codec/cbor-minimal.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/2/src/codec/cbor-package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/2/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/2/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/2/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/2/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/2/src/codec/cbor-scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/2/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/2/src/codec/cbor-space.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/2/src/codec/cbor-string-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/2/src/codec/cbor-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/2/src/codec/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/2/src/codec/utf8.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/2/src/csn/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/2/src/csn/registry.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/2/src/epochs/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/2/src/epochs/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/2/src/epochs/read.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/2/src/epochs/reclaim.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/2/src/epochs/retire.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/2/src/epochs/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/2/src/execution/handoff.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/2/src/execution/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/2/src/execution/queue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/2/src/execution/ready-recycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/2/src/execution/ready-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/2/src/execution/ready.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/2/src/execution/worker-boundary.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/2/src/execution/worker-claim.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/2/src/execution/worker-run.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/2/src/execution/worker-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/2/src/execution/writer.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/2/src/foundation/batch.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/2/src/foundation/binary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/2/src/foundation/conditions.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/2/src/foundation/crc32c.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/2/src/foundation/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/2/src/foundation/record.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/2/src/get-directory/build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/2/src/get-directory/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/2/src/get-directory/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/2/src/get-directory/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/2/src/get-resolver/active-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/2/src/get-resolver/active-directory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/2/src/get-resolver/active-preflight.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/2/src/get-resolver/active-read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/2/src/get-resolver/active-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/2/src/get-resolver/active-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/2/src/get-resolver/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/2/src/get-resolver/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/2/src/get-resolver/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/2/src/get-resolver/rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/2/src/get-resolver/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/2/src/get-resolver/sort.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/2/src/get-resolver/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/2/src/get/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/2/src/get/lifecycle.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/2/src/get/lookup.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/2/src/get/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/2/src/get/segment.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/2/src/get/target.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/2/src/get/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/2/src/hash/arithmetic.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/2/src/hash/blocks.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/2/src/hash/hash64.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/2/src/hash/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/2/src/index/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/2/src/index/hash-digests.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/2/src/index/hash-seed.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/2/src/index/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/2/src/index/primary-arena.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/2/src/index/primary-build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/2/src/index/primary-core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/2/src/index/primary-directory.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/2/src/index/primary-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/2/src/index/primary-probe.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/2/src/index/primary-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/2/src/index/primary-relocate.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/2/src/index/primary-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/2/src/index/primary-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/2/src/index/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/2/src/index/rebuild-budget.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/2/src/index/rebuild-copy.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/2/src/index/rebuild-scan.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/2/src/index/rebuild.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/2/src/index/relocate.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/2/src/index/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/2/src/index/validation.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/2/src/index/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/2/src/io/flush.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/2/src/io/lifecycle.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/2/src/io/native.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/2/src/io/package.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/2/src/io/transfer.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/2/src/io/types.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/2/src/mvcc/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/2/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/2/src/mvcc/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/2/src/package.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/2/src/read/core.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/2/src/read/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/2/src/read/task.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/2/src/read/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/2/src/recovery/decisions-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/2/src/recovery/decisions-package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/2/src/recovery/decisions-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/2/src/recovery/decisions-radix.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/2/src/recovery/decisions-sort.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/2/src/recovery/decisions-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/2/src/recovery/inventory-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/2/src/recovery/inventory-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/2/src/recovery/inventory-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/2/src/recovery/manifest-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/2/src/recovery/manifest-decode.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/2/src/recovery/manifest-fold.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/2/src/recovery/manifest-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/2/src/recovery/manifest-query.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/2/src/recovery/manifest-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/2/src/recovery/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/2/src/recovery/scan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/2/src/series/events.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/2/src/series/io-events.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/2/src/series/ownership.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/2/src/series/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/2/src/series/publication.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/2/src/series/query.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/2/src/series/retirement.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/2/src/series/routing-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/2/src/series/routing-select.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/2/src/series/routing-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/2/src/series/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/2/src/series/worker-boundary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/2/src/series/worker-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/2/src/series/worker-run.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/2/src/series/worker-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/2/src/storage/compaction-scan.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/2/src/storage/control-payload.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/2/src/storage/formats.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/2/src/storage/log-header.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/2/src/storage/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/2/src/storage/payload-record.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/2/src/storage/payload-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/2/src/storage/segment-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/2/src/wal/builder.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/2/src/wal/csn.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/2/src/wal/executor.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/2/src/wal/group.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/2/src/wal/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/2/src/wal/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/2/test.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/test.log")
   :BYTES 27248 :SHA256
   "61e510fa1bc81e71efd420dd3cc486bfb3a11108df080a82a781805117e9ed28")
  (:PATH "raw/mutations/2/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/2/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/2/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/2/tests/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/2/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/2/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/2/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/2/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/2/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/2/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/2/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/2/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/2/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/2/tests/codec/cbor-structure.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/2/tests/codec/cbor-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/2/tests/codec/cbor-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/2/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/2/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/2/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/2/tests/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/2/tests/codec/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/2/tests/codec/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/2/tests/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/2/tests/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/2/tests/csn/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/2/tests/csn/threads.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/2/tests/epochs/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/2/tests/epochs/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/2/tests/epochs/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/2/tests/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/2/tests/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/2/tests/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/2/tests/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/2/tests/execution/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/2/tests/execution/threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/2/tests/execution/worker.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/2/tests/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/2/tests/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/2/tests/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/2/tests/foundation/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/2/tests/get-directory/construction.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/2/tests/get-directory/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/2/tests/get-directory/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/2/tests/get-directory/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/2/tests/get-performance/guards.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/2/tests/get-performance/paths.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/2/tests/get-performance/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/2/tests/get-performance/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/2/tests/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/2/tests/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/2/tests/get/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/2/tests/hash/guards.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/2/tests/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/2/tests/hash/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/2/tests/hash/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/2/tests/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/2/tests/index/primary-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/2/tests/index/primary-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/2/tests/index/primary.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/2/tests/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/2/tests/index/slot-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/2/tests/index/slot-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/2/tests/index/slots.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/2/tests/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/2/tests/io/support.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/2/tests/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/2/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/2/tests/lint-fixtures/good.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/2/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/2/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/2/tests/mvcc/capture.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/2/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/2/tests/mvcc/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/2/tests/read/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/2/tests/read/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/2/tests/read/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/2/tests/recovery/corruption.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/2/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/2/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/2/tests/recovery/decisions-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/2/tests/recovery/decisions.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/2/tests/recovery/inventory-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/2/tests/recovery/inventory.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/2/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/2/tests/recovery/manifest-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/2/tests/recovery/manifest.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/2/tests/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/2/tests/recovery/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/2/tests/series/boundaries.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/2/tests/series/controller.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/2/tests/series/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/2/tests/series/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/2/tests/series/worker-bridge.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/2/tests/series/worker-routing.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/2/tests/smoke.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/2/tests/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/2/tests/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/2/tests/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/2/tests/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/2/tests/storage/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/2/tests/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/2/tests/wal/csn-threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/2/tests/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/2/tests/wal/fault.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/2/tests/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/2/tests/wal/native.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/2/tests/wal/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/2/tools/build.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/2/tools/cbor-float-write-isolated-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/2/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 474 :SHA256
   "71f0b4efd8b7974b1a444d4ac147c3a9660ba81d9d24f2e4c4a6d46db0119904")
  (:PATH "raw/mutations/3/src/cache/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/3/src/cache/clock.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/3/src/cache/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/3/src/cache/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/3/src/cache/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/3/src/cache/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/3/src/cache/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/3/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/3/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "d14920c5f7c54bf1538f1b350ff5615a37fce74341ff1498aafbf6a7b9315350")
  (:PATH "raw/mutations/3/src/codec/cbor-float-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations/3/src/codec/cbor-header.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/3/src/codec/cbor-minimal.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/3/src/codec/cbor-package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/3/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/3/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/3/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/3/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/3/src/codec/cbor-scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/3/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/3/src/codec/cbor-space.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/3/src/codec/cbor-string-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/3/src/codec/cbor-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/3/src/codec/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/3/src/codec/utf8.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/3/src/csn/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/3/src/csn/registry.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/3/src/epochs/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/3/src/epochs/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/3/src/epochs/read.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/3/src/epochs/reclaim.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/3/src/epochs/retire.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/3/src/epochs/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/3/src/execution/handoff.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/3/src/execution/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/3/src/execution/queue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/3/src/execution/ready-recycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/3/src/execution/ready-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/3/src/execution/ready.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/3/src/execution/worker-boundary.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/3/src/execution/worker-claim.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/3/src/execution/worker-run.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/3/src/execution/worker-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/3/src/execution/writer.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/3/src/foundation/batch.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/3/src/foundation/binary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/3/src/foundation/conditions.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/3/src/foundation/crc32c.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/3/src/foundation/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/3/src/foundation/record.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/3/src/get-directory/build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/3/src/get-directory/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/3/src/get-directory/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/3/src/get-directory/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/3/src/get-resolver/active-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/3/src/get-resolver/active-directory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/3/src/get-resolver/active-preflight.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/3/src/get-resolver/active-read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/3/src/get-resolver/active-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/3/src/get-resolver/active-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/3/src/get-resolver/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/3/src/get-resolver/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/3/src/get-resolver/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/3/src/get-resolver/rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/3/src/get-resolver/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/3/src/get-resolver/sort.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/3/src/get-resolver/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/3/src/get/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/3/src/get/lifecycle.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/3/src/get/lookup.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/3/src/get/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/3/src/get/segment.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/3/src/get/target.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/3/src/get/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/3/src/hash/arithmetic.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/3/src/hash/blocks.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/3/src/hash/hash64.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/3/src/hash/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/3/src/index/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/3/src/index/hash-digests.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/3/src/index/hash-seed.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/3/src/index/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/3/src/index/primary-arena.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/3/src/index/primary-build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/3/src/index/primary-core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/3/src/index/primary-directory.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/3/src/index/primary-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/3/src/index/primary-probe.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/3/src/index/primary-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/3/src/index/primary-relocate.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/3/src/index/primary-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/3/src/index/primary-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/3/src/index/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/3/src/index/rebuild-budget.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/3/src/index/rebuild-copy.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/3/src/index/rebuild-scan.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/3/src/index/rebuild.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/3/src/index/relocate.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/3/src/index/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/3/src/index/validation.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/3/src/index/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/3/src/io/flush.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/3/src/io/lifecycle.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/3/src/io/native.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/3/src/io/package.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/3/src/io/transfer.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/3/src/io/types.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/3/src/mvcc/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/3/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/3/src/mvcc/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/3/src/package.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/3/src/read/core.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/3/src/read/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/3/src/read/task.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/3/src/read/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/3/src/recovery/decisions-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/3/src/recovery/decisions-package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/3/src/recovery/decisions-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/3/src/recovery/decisions-radix.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/3/src/recovery/decisions-sort.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/3/src/recovery/decisions-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/3/src/recovery/inventory-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/3/src/recovery/inventory-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/3/src/recovery/inventory-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/3/src/recovery/manifest-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/3/src/recovery/manifest-decode.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/3/src/recovery/manifest-fold.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/3/src/recovery/manifest-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/3/src/recovery/manifest-query.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/3/src/recovery/manifest-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/3/src/recovery/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/3/src/recovery/scan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/3/src/series/events.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/3/src/series/io-events.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/3/src/series/ownership.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/3/src/series/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/3/src/series/publication.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/3/src/series/query.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/3/src/series/retirement.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/3/src/series/routing-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/3/src/series/routing-select.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/3/src/series/routing-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/3/src/series/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/3/src/series/worker-boundary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/3/src/series/worker-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/3/src/series/worker-run.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/3/src/series/worker-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/3/src/storage/compaction-scan.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/3/src/storage/control-payload.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/3/src/storage/formats.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/3/src/storage/log-header.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/3/src/storage/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/3/src/storage/payload-record.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/3/src/storage/payload-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/3/src/storage/segment-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/3/src/wal/builder.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/3/src/wal/csn.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/3/src/wal/executor.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/3/src/wal/group.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/3/src/wal/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/3/src/wal/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/3/test.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/test.log")
   :BYTES 27141 :SHA256
   "97ea30d97a7e7133b0b78f1c8d9bcae764cc03df3d8b1ff40461911fd1c9e5f3")
  (:PATH "raw/mutations/3/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/3/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/3/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/3/tests/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/3/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/3/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/3/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/3/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/3/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/3/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/3/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/3/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/3/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/3/tests/codec/cbor-structure.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/3/tests/codec/cbor-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/3/tests/codec/cbor-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/3/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/3/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/3/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/3/tests/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/3/tests/codec/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/3/tests/codec/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/3/tests/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/3/tests/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/3/tests/csn/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/3/tests/csn/threads.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/3/tests/epochs/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/3/tests/epochs/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/3/tests/epochs/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/3/tests/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/3/tests/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/3/tests/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/3/tests/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/3/tests/execution/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/3/tests/execution/threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/3/tests/execution/worker.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/3/tests/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/3/tests/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/3/tests/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/3/tests/foundation/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/3/tests/get-directory/construction.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/3/tests/get-directory/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/3/tests/get-directory/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/3/tests/get-directory/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/3/tests/get-performance/guards.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/3/tests/get-performance/paths.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/3/tests/get-performance/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/3/tests/get-performance/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/3/tests/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/3/tests/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/3/tests/get/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/3/tests/hash/guards.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/3/tests/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/3/tests/hash/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/3/tests/hash/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/3/tests/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/3/tests/index/primary-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/3/tests/index/primary-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/3/tests/index/primary.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/3/tests/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/3/tests/index/slot-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/3/tests/index/slot-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/3/tests/index/slots.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/3/tests/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/3/tests/io/support.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/3/tests/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/3/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/3/tests/lint-fixtures/good.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/3/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/3/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/3/tests/mvcc/capture.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/3/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/3/tests/mvcc/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/3/tests/read/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/3/tests/read/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/3/tests/read/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/3/tests/recovery/corruption.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/3/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/3/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/3/tests/recovery/decisions-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/3/tests/recovery/decisions.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/3/tests/recovery/inventory-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/3/tests/recovery/inventory.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/3/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/3/tests/recovery/manifest-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/3/tests/recovery/manifest.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/3/tests/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/3/tests/recovery/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/3/tests/series/boundaries.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/3/tests/series/controller.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/3/tests/series/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/3/tests/series/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/3/tests/series/worker-bridge.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/3/tests/series/worker-routing.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/3/tests/smoke.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/3/tests/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/3/tests/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/3/tests/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/3/tests/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/3/tests/storage/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/3/tests/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/3/tests/wal/csn-threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/3/tests/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/3/tests/wal/fault.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/3/tests/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/3/tests/wal/native.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/3/tests/wal/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/3/tools/build.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/3/tools/cbor-float-write-isolated-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/3/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 474 :SHA256
   "20312ddab6bdd98d950a9925af440769ca63b2a476652af71cbe99774ecdef62")
  (:PATH "raw/mutations/4/src/cache/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/4/src/cache/clock.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/4/src/cache/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/4/src/cache/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/4/src/cache/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/4/src/cache/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/4/src/cache/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/4/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/4/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-float-narrow.lisp")
   :BYTES 4565 :SHA256
   "ff7c3554c550eba64c0edba6c70d72c4d3558dd929f900a7bc0898375e6b330a")
  (:PATH "raw/mutations/4/src/codec/cbor-float-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations/4/src/codec/cbor-header.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/4/src/codec/cbor-minimal.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/4/src/codec/cbor-package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/4/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/4/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/4/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/4/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/4/src/codec/cbor-scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/4/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/4/src/codec/cbor-space.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/4/src/codec/cbor-string-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/4/src/codec/cbor-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/4/src/codec/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/4/src/codec/utf8.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/4/src/csn/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/4/src/csn/registry.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/4/src/epochs/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/4/src/epochs/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/4/src/epochs/read.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/4/src/epochs/reclaim.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/4/src/epochs/retire.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/4/src/epochs/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/4/src/execution/handoff.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/4/src/execution/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/4/src/execution/queue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/4/src/execution/ready-recycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/4/src/execution/ready-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/4/src/execution/ready.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/4/src/execution/worker-boundary.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/4/src/execution/worker-claim.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/4/src/execution/worker-run.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/4/src/execution/worker-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/4/src/execution/writer.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/4/src/foundation/batch.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/4/src/foundation/binary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/4/src/foundation/conditions.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/4/src/foundation/crc32c.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/4/src/foundation/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/4/src/foundation/record.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/4/src/get-directory/build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/4/src/get-directory/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/4/src/get-directory/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/4/src/get-directory/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/4/src/get-resolver/active-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/4/src/get-resolver/active-directory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/4/src/get-resolver/active-preflight.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/4/src/get-resolver/active-read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/4/src/get-resolver/active-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/4/src/get-resolver/active-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/4/src/get-resolver/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/4/src/get-resolver/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/4/src/get-resolver/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/4/src/get-resolver/rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/4/src/get-resolver/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/4/src/get-resolver/sort.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/4/src/get-resolver/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/4/src/get/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/4/src/get/lifecycle.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/4/src/get/lookup.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/4/src/get/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/4/src/get/segment.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/4/src/get/target.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/4/src/get/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/4/src/hash/arithmetic.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/4/src/hash/blocks.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/4/src/hash/hash64.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/4/src/hash/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/4/src/index/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/4/src/index/hash-digests.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/4/src/index/hash-seed.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/4/src/index/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/4/src/index/primary-arena.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/4/src/index/primary-build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/4/src/index/primary-core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/4/src/index/primary-directory.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/4/src/index/primary-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/4/src/index/primary-probe.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/4/src/index/primary-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/4/src/index/primary-relocate.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/4/src/index/primary-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/4/src/index/primary-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/4/src/index/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/4/src/index/rebuild-budget.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/4/src/index/rebuild-copy.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/4/src/index/rebuild-scan.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/4/src/index/rebuild.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/4/src/index/relocate.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/4/src/index/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/4/src/index/validation.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/4/src/index/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/4/src/io/flush.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/4/src/io/lifecycle.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/4/src/io/native.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/4/src/io/package.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/4/src/io/transfer.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/4/src/io/types.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/4/src/mvcc/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/4/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/4/src/mvcc/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/4/src/package.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/4/src/read/core.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/4/src/read/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/4/src/read/task.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/4/src/read/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/4/src/recovery/decisions-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/4/src/recovery/decisions-package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/4/src/recovery/decisions-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/4/src/recovery/decisions-radix.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/4/src/recovery/decisions-sort.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/4/src/recovery/decisions-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/4/src/recovery/inventory-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/4/src/recovery/inventory-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/4/src/recovery/inventory-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/4/src/recovery/manifest-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/4/src/recovery/manifest-decode.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/4/src/recovery/manifest-fold.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/4/src/recovery/manifest-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/4/src/recovery/manifest-query.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/4/src/recovery/manifest-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/4/src/recovery/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/4/src/recovery/scan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/4/src/series/events.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/4/src/series/io-events.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/4/src/series/ownership.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/4/src/series/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/4/src/series/publication.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/4/src/series/query.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/4/src/series/retirement.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/4/src/series/routing-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/4/src/series/routing-select.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/4/src/series/routing-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/4/src/series/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/4/src/series/worker-boundary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/4/src/series/worker-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/4/src/series/worker-run.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/4/src/series/worker-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/4/src/storage/compaction-scan.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/4/src/storage/control-payload.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/4/src/storage/formats.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/4/src/storage/log-header.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/4/src/storage/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/4/src/storage/payload-record.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/4/src/storage/payload-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/4/src/storage/segment-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/4/src/wal/builder.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/4/src/wal/csn.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/4/src/wal/executor.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/4/src/wal/group.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/4/src/wal/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/4/src/wal/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/4/test.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/test.log")
   :BYTES 27333 :SHA256
   "6fe926b0456861b32a5f674e3112f145e4279b2e1ffdbd67060bc645795975a1")
  (:PATH "raw/mutations/4/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/4/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/4/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/4/tests/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/4/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/4/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/4/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/4/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/4/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/4/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/4/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/4/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/4/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/4/tests/codec/cbor-structure.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/4/tests/codec/cbor-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/4/tests/codec/cbor-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/4/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/4/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/4/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/4/tests/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/4/tests/codec/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/4/tests/codec/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/4/tests/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/4/tests/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/4/tests/csn/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/4/tests/csn/threads.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/4/tests/epochs/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/4/tests/epochs/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/4/tests/epochs/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/4/tests/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/4/tests/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/4/tests/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/4/tests/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/4/tests/execution/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/4/tests/execution/threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/4/tests/execution/worker.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/4/tests/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/4/tests/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/4/tests/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/4/tests/foundation/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/4/tests/get-directory/construction.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/4/tests/get-directory/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/4/tests/get-directory/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/4/tests/get-directory/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/4/tests/get-performance/guards.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/4/tests/get-performance/paths.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/4/tests/get-performance/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/4/tests/get-performance/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/4/tests/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/4/tests/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/4/tests/get/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/4/tests/hash/guards.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/4/tests/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/4/tests/hash/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/4/tests/hash/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/4/tests/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/4/tests/index/primary-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/4/tests/index/primary-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/4/tests/index/primary.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/4/tests/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/4/tests/index/slot-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/4/tests/index/slot-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/4/tests/index/slots.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/4/tests/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/4/tests/io/support.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/4/tests/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/4/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/4/tests/lint-fixtures/good.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/4/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/4/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/4/tests/mvcc/capture.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/4/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/4/tests/mvcc/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/4/tests/read/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/4/tests/read/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/4/tests/read/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/4/tests/recovery/corruption.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/4/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/4/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/4/tests/recovery/decisions-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/4/tests/recovery/decisions.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/4/tests/recovery/inventory-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/4/tests/recovery/inventory.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/4/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/4/tests/recovery/manifest-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/4/tests/recovery/manifest.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/4/tests/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/4/tests/recovery/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/4/tests/series/boundaries.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/4/tests/series/controller.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/4/tests/series/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/4/tests/series/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/4/tests/series/worker-bridge.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/4/tests/series/worker-routing.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/4/tests/smoke.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/4/tests/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/4/tests/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/4/tests/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/4/tests/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/4/tests/storage/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/4/tests/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/4/tests/wal/csn-threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/4/tests/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/4/tests/wal/fault.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/4/tests/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/4/tests/wal/native.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/4/tests/wal/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/4/tools/build.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/4/tools/cbor-float-write-isolated-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/4/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 474 :SHA256
   "30be6d08e96daa4ced0689d7c6254d3bf7373de15d924762325c51060d435f9e")
  (:PATH "raw/mutations/5/src/cache/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/5/src/cache/clock.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/5/src/cache/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/5/src/cache/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/5/src/cache/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/5/src/cache/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/5/src/cache/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/5/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/5/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations/5/src/codec/cbor-float-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-float-write.lisp")
   :BYTES 5140 :SHA256
   "1da29e0de37b23e2893c4fa682b0e0b87f7c4011c61031b71e1fcee43a5df820")
  (:PATH "raw/mutations/5/src/codec/cbor-header.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/5/src/codec/cbor-minimal.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/5/src/codec/cbor-package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/5/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/5/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/5/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/5/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/5/src/codec/cbor-scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/5/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/5/src/codec/cbor-space.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/5/src/codec/cbor-string-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/5/src/codec/cbor-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/5/src/codec/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/5/src/codec/utf8.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/5/src/csn/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/5/src/csn/registry.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/5/src/epochs/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/5/src/epochs/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/5/src/epochs/read.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/5/src/epochs/reclaim.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/5/src/epochs/retire.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/5/src/epochs/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/5/src/execution/handoff.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/5/src/execution/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/5/src/execution/queue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/5/src/execution/ready-recycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/5/src/execution/ready-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/5/src/execution/ready.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/5/src/execution/worker-boundary.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/5/src/execution/worker-claim.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/5/src/execution/worker-run.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/5/src/execution/worker-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/5/src/execution/writer.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/5/src/foundation/batch.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/5/src/foundation/binary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/5/src/foundation/conditions.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/5/src/foundation/crc32c.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/5/src/foundation/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/5/src/foundation/record.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/5/src/get-directory/build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/5/src/get-directory/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/5/src/get-directory/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/5/src/get-directory/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/5/src/get-resolver/active-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/5/src/get-resolver/active-directory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/5/src/get-resolver/active-preflight.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/5/src/get-resolver/active-read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/5/src/get-resolver/active-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/5/src/get-resolver/active-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/5/src/get-resolver/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/5/src/get-resolver/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/5/src/get-resolver/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/5/src/get-resolver/rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/5/src/get-resolver/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/5/src/get-resolver/sort.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/5/src/get-resolver/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/5/src/get/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/5/src/get/lifecycle.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/5/src/get/lookup.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/5/src/get/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/5/src/get/segment.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/5/src/get/target.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/5/src/get/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/5/src/hash/arithmetic.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/5/src/hash/blocks.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/5/src/hash/hash64.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/5/src/hash/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/5/src/index/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/5/src/index/hash-digests.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/5/src/index/hash-seed.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/5/src/index/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/5/src/index/primary-arena.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/5/src/index/primary-build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/5/src/index/primary-core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/5/src/index/primary-directory.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/5/src/index/primary-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/5/src/index/primary-probe.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/5/src/index/primary-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/5/src/index/primary-relocate.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/5/src/index/primary-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/5/src/index/primary-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/5/src/index/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/5/src/index/rebuild-budget.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/5/src/index/rebuild-copy.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/5/src/index/rebuild-scan.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/5/src/index/rebuild.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/5/src/index/relocate.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/5/src/index/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/5/src/index/validation.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/5/src/index/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/5/src/io/flush.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/5/src/io/lifecycle.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/5/src/io/native.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/5/src/io/package.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/5/src/io/transfer.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/5/src/io/types.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/5/src/mvcc/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/5/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/5/src/mvcc/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/5/src/package.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/5/src/read/core.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/5/src/read/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/5/src/read/task.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/5/src/read/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/5/src/recovery/decisions-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/5/src/recovery/decisions-package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/5/src/recovery/decisions-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/5/src/recovery/decisions-radix.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/5/src/recovery/decisions-sort.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/5/src/recovery/decisions-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/5/src/recovery/inventory-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/5/src/recovery/inventory-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/5/src/recovery/inventory-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/5/src/recovery/manifest-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/5/src/recovery/manifest-decode.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/5/src/recovery/manifest-fold.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/5/src/recovery/manifest-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/5/src/recovery/manifest-query.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/5/src/recovery/manifest-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/5/src/recovery/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/5/src/recovery/scan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/5/src/series/events.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/5/src/series/io-events.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/5/src/series/ownership.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/5/src/series/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/5/src/series/publication.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/5/src/series/query.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/5/src/series/retirement.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/5/src/series/routing-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/5/src/series/routing-select.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/5/src/series/routing-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/5/src/series/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/5/src/series/worker-boundary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/5/src/series/worker-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/5/src/series/worker-run.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/5/src/series/worker-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/5/src/storage/compaction-scan.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/5/src/storage/control-payload.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/5/src/storage/formats.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/5/src/storage/log-header.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/5/src/storage/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/5/src/storage/payload-record.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/5/src/storage/payload-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/5/src/storage/segment-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/5/src/wal/builder.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/5/src/wal/csn.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/5/src/wal/executor.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/5/src/wal/group.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/5/src/wal/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/5/src/wal/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/5/test.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/test.log")
   :BYTES 27116 :SHA256
   "d7abc5eeb99063ad4ef8458262d750cb4a5461186836ae3c8d396325b132c043")
  (:PATH "raw/mutations/5/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/5/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/5/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/5/tests/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/5/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/5/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/5/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/5/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/5/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/5/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/5/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/5/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/5/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/5/tests/codec/cbor-structure.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/5/tests/codec/cbor-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/5/tests/codec/cbor-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/5/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/5/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/5/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/5/tests/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/5/tests/codec/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/5/tests/codec/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/5/tests/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/5/tests/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/5/tests/csn/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/5/tests/csn/threads.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/5/tests/epochs/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/5/tests/epochs/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/5/tests/epochs/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/5/tests/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/5/tests/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/5/tests/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/5/tests/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/5/tests/execution/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/5/tests/execution/threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/5/tests/execution/worker.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/5/tests/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/5/tests/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/5/tests/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/5/tests/foundation/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/5/tests/get-directory/construction.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/5/tests/get-directory/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/5/tests/get-directory/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/5/tests/get-directory/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/5/tests/get-performance/guards.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/5/tests/get-performance/paths.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/5/tests/get-performance/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/5/tests/get-performance/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/5/tests/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/5/tests/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/5/tests/get/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/5/tests/hash/guards.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/5/tests/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/5/tests/hash/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/5/tests/hash/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/5/tests/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/5/tests/index/primary-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/5/tests/index/primary-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/5/tests/index/primary.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/5/tests/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/5/tests/index/slot-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/5/tests/index/slot-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/5/tests/index/slots.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/5/tests/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/5/tests/io/support.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/5/tests/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/5/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/5/tests/lint-fixtures/good.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/5/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/5/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/5/tests/mvcc/capture.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/5/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/5/tests/mvcc/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/5/tests/read/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/5/tests/read/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/5/tests/read/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/5/tests/recovery/corruption.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/5/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/5/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/5/tests/recovery/decisions-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/5/tests/recovery/decisions.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/5/tests/recovery/inventory-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/5/tests/recovery/inventory.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/5/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/5/tests/recovery/manifest-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/5/tests/recovery/manifest.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/5/tests/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/5/tests/recovery/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/5/tests/series/boundaries.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/5/tests/series/controller.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/5/tests/series/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/5/tests/series/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/5/tests/series/worker-bridge.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/5/tests/series/worker-routing.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/5/tests/smoke.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/5/tests/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/5/tests/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/5/tests/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/5/tests/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/5/tests/storage/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/5/tests/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/5/tests/wal/csn-threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/5/tests/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/5/tests/wal/fault.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/5/tests/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/5/tests/wal/native.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/5/tests/wal/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/5/tools/build.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/5/tools/cbor-float-write-isolated-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/5/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 474 :SHA256
   "d4ea8a427da0c927816e0974fed282b77bc141c5104888dce94d99072d5ac2eb")
  (:PATH "raw/mutations/6/src/cache/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/6/src/cache/clock.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/6/src/cache/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/6/src/cache/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/6/src/cache/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/6/src/cache/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/6/src/cache/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/6/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/6/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations/6/src/codec/cbor-float-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "c8e7643a8ed57d14a9002a9d21aa78cc48b770d089d8567a97c098c1d3f4f7ba")
  (:PATH "raw/mutations/6/src/codec/cbor-header.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/6/src/codec/cbor-minimal.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/6/src/codec/cbor-package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/6/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/6/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/6/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/6/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/6/src/codec/cbor-scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/6/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/6/src/codec/cbor-space.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/6/src/codec/cbor-string-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/6/src/codec/cbor-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/6/src/codec/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/6/src/codec/utf8.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/6/src/csn/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/6/src/csn/registry.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/6/src/epochs/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/6/src/epochs/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/6/src/epochs/read.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/6/src/epochs/reclaim.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/6/src/epochs/retire.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/6/src/epochs/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/6/src/execution/handoff.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/6/src/execution/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/6/src/execution/queue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/6/src/execution/ready-recycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/6/src/execution/ready-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/6/src/execution/ready.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/6/src/execution/worker-boundary.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/6/src/execution/worker-claim.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/6/src/execution/worker-run.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/6/src/execution/worker-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/6/src/execution/writer.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/6/src/foundation/batch.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/6/src/foundation/binary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/6/src/foundation/conditions.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/6/src/foundation/crc32c.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/6/src/foundation/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/6/src/foundation/record.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/6/src/get-directory/build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/6/src/get-directory/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/6/src/get-directory/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/6/src/get-directory/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/6/src/get-resolver/active-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/6/src/get-resolver/active-directory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/6/src/get-resolver/active-preflight.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/6/src/get-resolver/active-read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/6/src/get-resolver/active-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/6/src/get-resolver/active-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/6/src/get-resolver/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/6/src/get-resolver/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/6/src/get-resolver/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/6/src/get-resolver/rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/6/src/get-resolver/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/6/src/get-resolver/sort.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/6/src/get-resolver/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/6/src/get/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/6/src/get/lifecycle.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/6/src/get/lookup.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/6/src/get/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/6/src/get/segment.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/6/src/get/target.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/6/src/get/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/6/src/hash/arithmetic.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/6/src/hash/blocks.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/6/src/hash/hash64.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/6/src/hash/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/6/src/index/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/6/src/index/hash-digests.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/6/src/index/hash-seed.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/6/src/index/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/6/src/index/primary-arena.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/6/src/index/primary-build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/6/src/index/primary-core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/6/src/index/primary-directory.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/6/src/index/primary-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/6/src/index/primary-probe.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/6/src/index/primary-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/6/src/index/primary-relocate.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/6/src/index/primary-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/6/src/index/primary-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/6/src/index/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/6/src/index/rebuild-budget.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/6/src/index/rebuild-copy.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/6/src/index/rebuild-scan.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/6/src/index/rebuild.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/6/src/index/relocate.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/6/src/index/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/6/src/index/validation.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/6/src/index/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/6/src/io/flush.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/6/src/io/lifecycle.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/6/src/io/native.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/6/src/io/package.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/6/src/io/transfer.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/6/src/io/types.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/6/src/mvcc/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/6/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/6/src/mvcc/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/6/src/package.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/6/src/read/core.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/6/src/read/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/6/src/read/task.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/6/src/read/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/6/src/recovery/decisions-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/6/src/recovery/decisions-package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/6/src/recovery/decisions-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/6/src/recovery/decisions-radix.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/6/src/recovery/decisions-sort.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/6/src/recovery/decisions-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/6/src/recovery/inventory-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/6/src/recovery/inventory-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/6/src/recovery/inventory-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/6/src/recovery/manifest-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/6/src/recovery/manifest-decode.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/6/src/recovery/manifest-fold.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/6/src/recovery/manifest-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/6/src/recovery/manifest-query.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/6/src/recovery/manifest-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/6/src/recovery/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/6/src/recovery/scan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/6/src/series/events.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/6/src/series/io-events.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/6/src/series/ownership.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/6/src/series/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/6/src/series/publication.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/6/src/series/query.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/6/src/series/retirement.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/6/src/series/routing-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/6/src/series/routing-select.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/6/src/series/routing-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/6/src/series/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/6/src/series/worker-boundary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/6/src/series/worker-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/6/src/series/worker-run.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/6/src/series/worker-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/6/src/storage/compaction-scan.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/6/src/storage/control-payload.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/6/src/storage/formats.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/6/src/storage/log-header.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/6/src/storage/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/6/src/storage/payload-record.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/6/src/storage/payload-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/6/src/storage/segment-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/6/src/wal/builder.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/6/src/wal/csn.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/6/src/wal/executor.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/6/src/wal/group.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/6/src/wal/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/6/src/wal/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/6/test.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/test.log")
   :BYTES 27131 :SHA256
   "9f9b67dc34dc631212b43920ce428a12b2fd5e7f375dacb09d30cffebeb34d94")
  (:PATH "raw/mutations/6/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/6/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/6/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/6/tests/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/6/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/6/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/6/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/6/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/6/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/6/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/6/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/6/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/6/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/6/tests/codec/cbor-structure.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/6/tests/codec/cbor-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/6/tests/codec/cbor-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/6/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/6/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/6/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/6/tests/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/6/tests/codec/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/6/tests/codec/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/6/tests/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/6/tests/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/6/tests/csn/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/6/tests/csn/threads.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/6/tests/epochs/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/6/tests/epochs/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/6/tests/epochs/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/6/tests/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/6/tests/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/6/tests/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/6/tests/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/6/tests/execution/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/6/tests/execution/threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/6/tests/execution/worker.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/6/tests/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/6/tests/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/6/tests/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/6/tests/foundation/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/6/tests/get-directory/construction.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/6/tests/get-directory/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/6/tests/get-directory/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/6/tests/get-directory/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/6/tests/get-performance/guards.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/6/tests/get-performance/paths.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/6/tests/get-performance/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/6/tests/get-performance/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/6/tests/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/6/tests/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/6/tests/get/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/6/tests/hash/guards.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/6/tests/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/6/tests/hash/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/6/tests/hash/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/6/tests/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/6/tests/index/primary-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/6/tests/index/primary-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/6/tests/index/primary.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/6/tests/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/6/tests/index/slot-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/6/tests/index/slot-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/6/tests/index/slots.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/6/tests/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/6/tests/io/support.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/6/tests/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/6/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/6/tests/lint-fixtures/good.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/6/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/6/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/6/tests/mvcc/capture.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/6/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/6/tests/mvcc/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/6/tests/read/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/6/tests/read/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/6/tests/read/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/6/tests/recovery/corruption.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/6/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/6/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/6/tests/recovery/decisions-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/6/tests/recovery/decisions.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/6/tests/recovery/inventory-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/6/tests/recovery/inventory.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/6/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/6/tests/recovery/manifest-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/6/tests/recovery/manifest.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/6/tests/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/6/tests/recovery/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/6/tests/series/boundaries.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/6/tests/series/controller.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/6/tests/series/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/6/tests/series/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/6/tests/series/worker-bridge.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/6/tests/series/worker-routing.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/6/tests/smoke.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/6/tests/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/6/tests/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/6/tests/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/6/tests/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/6/tests/storage/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/6/tests/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/6/tests/wal/csn-threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/6/tests/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/6/tests/wal/fault.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/6/tests/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/6/tests/wal/native.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/6/tests/wal/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/6/tools/build.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/6/tools/cbor-float-write-isolated-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/6/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 474 :SHA256
   "a2643cd0f97c5a41d8f7c7f800c378fcf0e85e72b03c6828d3f77ff977a7aad8")
  (:PATH "raw/mutations/7/src/cache/build.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/7/src/cache/clock.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/7/src/cache/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/7/src/cache/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/7/src/cache/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/7/src/cache/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/7/src/cache/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/7/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/7/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations/7/src/codec/cbor-float-write.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-float-write.lisp")
   :BYTES 5092 :SHA256
   "ad840ae710fdf1b158ba634f2dd4f2db5632e15afe1f3d1128a96d964dd00341")
  (:PATH "raw/mutations/7/src/codec/cbor-header.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/7/src/codec/cbor-minimal.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/7/src/codec/cbor-package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/7/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/7/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/7/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/7/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/7/src/codec/cbor-scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/7/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/7/src/codec/cbor-space.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/7/src/codec/cbor-string-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/7/src/codec/cbor-write.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/7/src/codec/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/7/src/codec/utf8.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/7/src/csn/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/7/src/csn/registry.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/7/src/epochs/core.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/7/src/epochs/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/7/src/epochs/read.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/7/src/epochs/reclaim.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/7/src/epochs/retire.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/7/src/epochs/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/7/src/execution/handoff.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/7/src/execution/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/7/src/execution/queue.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/7/src/execution/ready-recycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/7/src/execution/ready-types.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/7/src/execution/ready.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/7/src/execution/worker-boundary.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/7/src/execution/worker-claim.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/7/src/execution/worker-run.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/7/src/execution/worker-types.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/7/src/execution/writer.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/7/src/foundation/batch.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/7/src/foundation/binary.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/7/src/foundation/conditions.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/7/src/foundation/crc32c.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/7/src/foundation/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/7/src/foundation/record.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/7/src/get-directory/build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/7/src/get-directory/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/7/src/get-directory/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/7/src/get-directory/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/7/src/get-resolver/active-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/7/src/get-resolver/active-directory.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/7/src/get-resolver/active-preflight.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/7/src/get-resolver/active-read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/7/src/get-resolver/active-scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/7/src/get-resolver/active-types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/7/src/get-resolver/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/7/src/get-resolver/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/7/src/get-resolver/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/7/src/get-resolver/rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/7/src/get-resolver/scan.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/7/src/get-resolver/sort.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/7/src/get-resolver/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/7/src/get/build.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/7/src/get/lifecycle.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/7/src/get/lookup.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/7/src/get/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/7/src/get/segment.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/7/src/get/target.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/7/src/get/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/7/src/hash/arithmetic.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/7/src/hash/blocks.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/7/src/hash/hash64.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/7/src/hash/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/7/src/index/core.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/7/src/index/hash-digests.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/7/src/index/hash-seed.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/7/src/index/package.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/7/src/index/primary-arena.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/7/src/index/primary-build.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/7/src/index/primary-core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/7/src/index/primary-directory.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/7/src/index/primary-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/7/src/index/primary-probe.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/7/src/index/primary-read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/7/src/index/primary-relocate.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/7/src/index/primary-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/7/src/index/primary-write.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/7/src/index/read.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/7/src/index/rebuild-budget.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/7/src/index/rebuild-copy.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/7/src/index/rebuild-scan.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/7/src/index/rebuild.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/7/src/index/relocate.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/7/src/index/types.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/7/src/index/validation.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/7/src/index/write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/7/src/io/flush.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/7/src/io/lifecycle.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/7/src/io/native.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/7/src/io/package.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/7/src/io/transfer.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/7/src/io/types.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/7/src/mvcc/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/7/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/7/src/mvcc/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/7/src/package.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/7/src/read/core.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/7/src/read/package.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/7/src/read/task.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/7/src/read/types.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/7/src/recovery/decisions-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/7/src/recovery/decisions-package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/7/src/recovery/decisions-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/7/src/recovery/decisions-radix.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/7/src/recovery/decisions-sort.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/7/src/recovery/decisions-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/7/src/recovery/inventory-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/7/src/recovery/inventory-query.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/7/src/recovery/inventory-types.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/7/src/recovery/manifest-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/7/src/recovery/manifest-decode.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/7/src/recovery/manifest-fold.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/7/src/recovery/manifest-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/7/src/recovery/manifest-query.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/7/src/recovery/manifest-types.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/7/src/recovery/package.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/7/src/recovery/scan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/7/src/series/events.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/7/src/series/io-events.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/7/src/series/ownership.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/7/src/series/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/7/src/series/publication.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/7/src/series/query.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/7/src/series/retirement.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/7/src/series/routing-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/7/src/series/routing-select.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/7/src/series/routing-types.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/7/src/series/types.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/7/src/series/worker-boundary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/7/src/series/worker-package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/7/src/series/worker-run.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/7/src/series/worker-types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/7/src/storage/compaction-scan.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/7/src/storage/control-payload.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/7/src/storage/formats.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/7/src/storage/log-header.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/7/src/storage/package.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/7/src/storage/payload-record.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/7/src/storage/payload-write.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/7/src/storage/segment-header.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/7/src/wal/builder.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/7/src/wal/csn.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/7/src/wal/executor.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/7/src/wal/group.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/7/src/wal/package.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/7/src/wal/types.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/7/test.log" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/test.log")
   :BYTES 27029 :SHA256
   "586b8850c8d4e8e4d655c4a2244455a4fd8efb550f48c944b9fd5e27beb67df8")
  (:PATH "raw/mutations/7/tests/codec/cbor-float-write-support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/7/tests/codec/cbor-float-write-threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/7/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/7/tests/codec/cbor-header.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-scan-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-scan-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/7/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/7/tests/codec/cbor-simple-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/7/tests/codec/cbor-simple-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/7/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/7/tests/codec/cbor-string-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/7/tests/codec/cbor-string-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/7/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/7/tests/codec/cbor-structure-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/7/tests/codec/cbor-structure-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/7/tests/codec/cbor-structure.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/7/tests/codec/cbor-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/7/tests/codec/cbor-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/7/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/7/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/7/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/7/tests/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/7/tests/codec/support.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/7/tests/codec/threads.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/7/tests/codec/utf8.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/7/tests/csn/registry.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/7/tests/csn/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/7/tests/csn/threads.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/7/tests/epochs/lifecycle.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/7/tests/epochs/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/7/tests/epochs/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/7/tests/execution/handoff.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/7/tests/execution/queue.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/7/tests/execution/ready-recycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/7/tests/execution/ready.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/7/tests/execution/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/7/tests/execution/threads.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/7/tests/execution/worker.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/7/tests/foundation/batch.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/7/tests/foundation/binary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/7/tests/foundation/record.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/7/tests/foundation/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/7/tests/get-directory/construction.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/7/tests/get-directory/read.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/7/tests/get-directory/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/7/tests/get-directory/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/7/tests/get-performance/guards.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/7/tests/get-performance/paths.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/7/tests/get-performance/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/7/tests/get-performance/threads.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/7/tests/get/lifecycle.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/7/tests/get/segment.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/7/tests/get/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/7/tests/hash/guards.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/7/tests/hash/hash64.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/7/tests/hash/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/7/tests/hash/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/7/tests/index/hash-digests.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/7/tests/index/primary-support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/7/tests/index/primary-threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/7/tests/index/primary.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/7/tests/index/rebuild.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/7/tests/index/slot-support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/7/tests/index/slot-threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/7/tests/index/slots.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/7/tests/io/native.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/7/tests/io/support.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/7/tests/io/transfer.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/7/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/7/tests/lint-fixtures/good.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/7/tests/lint-fixtures/keyword-barrier.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/7/tests/lint-fixtures/qualified-reader.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/7/tests/mvcc/capture.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/7/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/7/tests/mvcc/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/7/tests/read/lifecycle.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/7/tests/read/support.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/7/tests/read/threads.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/7/tests/recovery/corruption.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/7/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/7/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/7/tests/recovery/decisions-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/7/tests/recovery/decisions.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/7/tests/recovery/inventory-support.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/7/tests/recovery/inventory.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/7/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/7/tests/recovery/manifest-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/7/tests/recovery/manifest.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/7/tests/recovery/scan.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/7/tests/recovery/support.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/7/tests/series/boundaries.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/7/tests/series/controller.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/7/tests/series/support.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/7/tests/series/threads.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/7/tests/series/worker-bridge.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/7/tests/series/worker-routing.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/7/tests/smoke.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/7/tests/storage/compaction-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/7/tests/storage/control-payload.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/7/tests/storage/log-header.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/7/tests/storage/segment-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/7/tests/storage/support.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/7/tests/wal/builder.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/7/tests/wal/csn-threads.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/7/tests/wal/csn.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/7/tests/wal/fault.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/7/tests/wal/group.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/7/tests/wal/native.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/7/tests/wal/support.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/7/tools/build.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/7/tools/cbor-float-write-isolated-build.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/7/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 474 :SHA256
   "af2b3682b7213e1404540b71ab9974dab7fdc3e8d33df68afb8af5702c6c9b66")
  (:PATH "raw/mutations/baseline/src/cache/build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/cache/build.lisp")
   :BYTES 4966 :SHA256
   "fca59b03a9e01a4f048fea6b75ca38ad749205c70cf97b22c5d6fe1c93d44ad0")
  (:PATH "raw/mutations/baseline/src/cache/clock.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/cache/clock.lisp")
   :BYTES 2952 :SHA256
   "c7c2ce5f03bcdecd284914c5aeb5efda489d08dd9a42b89305de74ba29f8428f")
  (:PATH "raw/mutations/baseline/src/cache/core.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/cache/core.lisp")
   :BYTES 3503 :SHA256
   "0c6e0ae33bfea90bf17df04dec2330d50a596d44359c88d31719e0fe684d05a4")
  (:PATH "raw/mutations/baseline/src/cache/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/cache/package.lisp")
   :BYTES 758 :SHA256
   "93e7e4efde01256c78efe88b059a686673d6374cfd333afa08f9005a207ee848")
  (:PATH "raw/mutations/baseline/src/cache/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/cache/read.lisp")
   :BYTES 6485 :SHA256
   "5700e43ae8ee859e96bdecb5953af43a712fd9e6ec23a53565759676bb07f85a")
  (:PATH "raw/mutations/baseline/src/cache/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/cache/types.lisp")
   :BYTES 2448 :SHA256
   "16ff5c4a8f67de70d90bc31cfc0b1c3a6e7f46bb47bad79f4a7837849cccdb30")
  (:PATH "raw/mutations/baseline/src/cache/write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/cache/write.lisp")
   :BYTES 5481 :SHA256
   "8dd17d311cc6d0e9658911120e669a8f6297c81791633620f8c12b4e737527a8")
  (:PATH "raw/mutations/baseline/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations/baseline/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations/baseline/src/codec/cbor-float-write.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations/baseline/src/codec/cbor-header.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations/baseline/src/codec/cbor-minimal.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations/baseline/src/codec/cbor-package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-package.lisp")
   :BYTES 647 :SHA256
   "c2a6fe51760c871705e4cf213ada92fed140fac26cf177d06889e18ab87fb45b")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations/baseline/src/codec/cbor-scan.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations/baseline/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations/baseline/src/codec/cbor-space.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations/baseline/src/codec/cbor-string-write.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations/baseline/src/codec/cbor-write.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/baseline/src/codec/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations/baseline/src/codec/utf8.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations/baseline/src/csn/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/csn/package.lisp")
   :BYTES 441 :SHA256
   "b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0")
  (:PATH "raw/mutations/baseline/src/csn/registry.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/csn/registry.lisp")
   :BYTES 12139 :SHA256
   "56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a")
  (:PATH "raw/mutations/baseline/src/epochs/core.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/epochs/core.lisp")
   :BYTES 5909 :SHA256
   "b0e40800e86c5b0769a006fb01a696935ffe1e673f908976a15f80d4c149f399")
  (:PATH "raw/mutations/baseline/src/epochs/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/epochs/package.lisp")
   :BYTES 779 :SHA256
   "234fe69468bc70ef7254288edb09c865696b42f76163c2338ad26650ad985dbd")
  (:PATH "raw/mutations/baseline/src/epochs/read.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/epochs/read.lisp")
   :BYTES 3240 :SHA256
   "13c9f307d0e2c7cbb7bacac181c4c8f8e8fa360110437f2590d6feed0edfd905")
  (:PATH "raw/mutations/baseline/src/epochs/reclaim.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/epochs/reclaim.lisp")
   :BYTES 6373 :SHA256
   "4db52ed6445662c5d2e72ed6dee7db31b34dcd1ce5d7e6b928e5bac96b129202")
  (:PATH "raw/mutations/baseline/src/epochs/retire.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/epochs/retire.lisp")
   :BYTES 5858 :SHA256
   "eba1448ebbdd9310192c47d44bb49ced175871667807eb8447c490cb30dac72b")
  (:PATH "raw/mutations/baseline/src/epochs/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/epochs/types.lisp")
   :BYTES 5304 :SHA256
   "c9611fce70de0af2e566fb1ffaccd595733ae6dac2c14d9826c8bdc1e0c92097")
  (:PATH "raw/mutations/baseline/src/execution/handoff.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/handoff.lisp")
   :BYTES 8362 :SHA256
   "3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a")
  (:PATH "raw/mutations/baseline/src/execution/package.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/package.lisp")
   :BYTES 1181 :SHA256
   "833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30")
  (:PATH "raw/mutations/baseline/src/execution/queue.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/queue.lisp")
   :BYTES 5374 :SHA256
   "244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90")
  (:PATH "raw/mutations/baseline/src/execution/ready-recycle.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/ready-recycle.lisp")
   :BYTES 3387 :SHA256
   "2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b")
  (:PATH "raw/mutations/baseline/src/execution/ready-types.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/ready-types.lisp")
   :BYTES 5248 :SHA256
   "0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f")
  (:PATH "raw/mutations/baseline/src/execution/ready.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/ready.lisp")
   :BYTES 6635 :SHA256
   "a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327")
  (:PATH "raw/mutations/baseline/src/execution/worker-boundary.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/worker-boundary.lisp")
   :BYTES 2309 :SHA256
   "4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a")
  (:PATH "raw/mutations/baseline/src/execution/worker-claim.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/worker-claim.lisp")
   :BYTES 6401 :SHA256
   "62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e")
  (:PATH "raw/mutations/baseline/src/execution/worker-run.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/worker-run.lisp")
   :BYTES 5124 :SHA256
   "fc106a26204144a5d3f66113f9cac3443234b7086885752c565e6649e6c1e542")
  (:PATH "raw/mutations/baseline/src/execution/worker-types.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/worker-types.lisp")
   :BYTES 8461 :SHA256
   "62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317")
  (:PATH "raw/mutations/baseline/src/execution/writer.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/execution/writer.lisp")
   :BYTES 6484 :SHA256
   "8ba19e24501c2eb1ae1f42bdafccb97781472737073325d6b0db452edaa8a105")
  (:PATH "raw/mutations/baseline/src/foundation/batch.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations/baseline/src/foundation/binary.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations/baseline/src/foundation/conditions.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations/baseline/src/foundation/crc32c.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations/baseline/src/foundation/package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations/baseline/src/foundation/record.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations/baseline/src/get-directory/build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-directory/build.lisp")
   :BYTES 3791 :SHA256
   "9bebb3cd9d66a8ec2fd0c72ad828e00ab2347093642653da45ef263bc855f947")
  (:PATH "raw/mutations/baseline/src/get-directory/package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-directory/package.lisp")
   :BYTES 1215 :SHA256
   "2392743441d4dba1d2cc73a91e0901089aabb651c2c7be43b589f0291063dba9")
  (:PATH "raw/mutations/baseline/src/get-directory/read.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-directory/read.lisp")
   :BYTES 4981 :SHA256
   "a2287eb7e91bed84f3727baaf81376bbe5bf5df15cde1ea268c6d2fa66fe0a5d")
  (:PATH "raw/mutations/baseline/src/get-directory/types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-directory/types.lisp")
   :BYTES 1856 :SHA256
   "0e2348291a4994f45bd1f6fe5efdc66041d2fdce18641d1af11b6c850ed69b2b")
  (:PATH "raw/mutations/baseline/src/get-resolver/active-build.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/active-build.lisp")
   :BYTES 7907 :SHA256
   "1f2f8e10c1669e0f0f8eb6293bbc4d169c9ff35c263521329cc843c509803170")
  (:PATH "raw/mutations/baseline/src/get-resolver/active-directory.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/active-directory.lisp")
   :BYTES 4611 :SHA256
   "c2b9a9ac3209270e9949720473908460548430a8098c9199fb55d2317a87682b")
  (:PATH "raw/mutations/baseline/src/get-resolver/active-preflight.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/active-preflight.lisp")
   :BYTES 5228 :SHA256
   "eb56f5704666cac3a88ec97f58f70c7d61db2e8feea6a094db4c468a1a2775a9")
  (:PATH "raw/mutations/baseline/src/get-resolver/active-read.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/active-read.lisp")
   :BYTES 3574 :SHA256
   "5d742ef91111becf2b04650d5e101a8ef8ccff6fa2ceba8babb891939cbe15e0")
  (:PATH "raw/mutations/baseline/src/get-resolver/active-scan.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/active-scan.lisp")
   :BYTES 5564 :SHA256
   "97dd4f59d4449334b113e9403a208007ed1a398a9b53f88bda3e3c0bbf3a1067")
  (:PATH "raw/mutations/baseline/src/get-resolver/active-types.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/active-types.lisp")
   :BYTES 3031 :SHA256
   "33e2c68307e25af859df7d63fbb0edac002ca47bb1d4d96cc2810bdf44a2b4ee")
  (:PATH "raw/mutations/baseline/src/get-resolver/build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/build.lisp")
   :BYTES 6855 :SHA256
   "c649c80c2b510669fc1c0a7f15b3080b7fb46a3423a1e49db5bb9ff248176e0a")
  (:PATH "raw/mutations/baseline/src/get-resolver/package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/package.lisp")
   :BYTES 2582 :SHA256
   "9c5ac5d54693356732c2873f0f51c9f230e3eebd18f55638b2424eec7f3d692c")
  (:PATH "raw/mutations/baseline/src/get-resolver/read.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/read.lisp")
   :BYTES 7271 :SHA256
   "dd100bb17e15589124916767f8a690ae683ac8c462102c778639f917a5f1924d")
  (:PATH "raw/mutations/baseline/src/get-resolver/rows.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/rows.lisp")
   :BYTES 3350 :SHA256
   "d9db85d788006fc7ad1f9a7cdeef28b992605de7fac8c295dd7fdc51f5511854")
  (:PATH "raw/mutations/baseline/src/get-resolver/scan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/scan.lisp")
   :BYTES 6786 :SHA256
   "35a1780c6bf66364ef94c4151fa91f02eebe359f0ca0639985d2a907fd9d512d")
  (:PATH "raw/mutations/baseline/src/get-resolver/sort.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/sort.lisp")
   :BYTES 7118 :SHA256
   "974bf44efeb1cd26c5e9db0601aea295c8f1a18234894ad9d41938a2880e2255")
  (:PATH "raw/mutations/baseline/src/get-resolver/types.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get-resolver/types.lisp")
   :BYTES 1772 :SHA256
   "b847d6c388f4d052a2d707b7c410cc7c2ef60482fb5cd9ef384c016c31d1dc00")
  (:PATH "raw/mutations/baseline/src/get/build.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get/build.lisp")
   :BYTES 3745 :SHA256
   "bcfc4916e9a85833dc151c4ce176bc905f2c03b6bc6d636f97a60df0d8c16739")
  (:PATH "raw/mutations/baseline/src/get/lifecycle.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get/lifecycle.lisp")
   :BYTES 5345 :SHA256
   "885ba4141114ea411cac37c9b5f924aaa7f9f2a5ba311ebf92a392e5da1e3c59")
  (:PATH "raw/mutations/baseline/src/get/lookup.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get/lookup.lisp")
   :BYTES 4352 :SHA256
   "9d1042d4cf1e7bd9c6d1153de12b2459e7a2724e47bd32534cd7ae56cb274c5f")
  (:PATH "raw/mutations/baseline/src/get/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get/package.lisp")
   :BYTES 1995 :SHA256
   "87b795779aef0c4b918a039d182daddd22b902a9ad10c763df4364b7e630151c")
  (:PATH "raw/mutations/baseline/src/get/segment.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get/segment.lisp")
   :BYTES 8097 :SHA256
   "4a486528cb2c1cc3471cb4b332d4314d24011889e1f885db6fd5600bb077eea3")
  (:PATH "raw/mutations/baseline/src/get/target.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get/target.lisp")
   :BYTES 5652 :SHA256
   "9f682f735e49108cad176a6143ec99e1be64da98f29cae0b52f9b49cdea34250")
  (:PATH "raw/mutations/baseline/src/get/types.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/get/types.lisp")
   :BYTES 4413 :SHA256
   "653b23a6e719cd1f55e7c58b4d7e8143aec5983992ba210d0eac1f4c8682f623")
  (:PATH "raw/mutations/baseline/src/hash/arithmetic.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/hash/arithmetic.lisp")
   :BYTES 3073 :SHA256
   "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9")
  (:PATH "raw/mutations/baseline/src/hash/blocks.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/hash/blocks.lisp")
   :BYTES 3262 :SHA256
   "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f")
  (:PATH "raw/mutations/baseline/src/hash/hash64.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/hash/hash64.lisp")
   :BYTES 1768 :SHA256
   "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f")
  (:PATH "raw/mutations/baseline/src/hash/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/hash/package.lisp")
   :BYTES 477 :SHA256
   "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0")
  (:PATH "raw/mutations/baseline/src/index/core.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/core.lisp")
   :BYTES 2959 :SHA256
   "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff")
  (:PATH "raw/mutations/baseline/src/index/hash-digests.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/hash-digests.lisp")
   :BYTES 3674 :SHA256
   "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673")
  (:PATH "raw/mutations/baseline/src/index/hash-seed.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/hash-seed.lisp")
   :BYTES 2437 :SHA256
   "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1")
  (:PATH "raw/mutations/baseline/src/index/package.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/package.lisp")
   :BYTES 727 :SHA256
   "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507")
  (:PATH "raw/mutations/baseline/src/index/primary-arena.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-arena.lisp")
   :BYTES 3485 :SHA256
   "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5")
  (:PATH "raw/mutations/baseline/src/index/primary-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-build.lisp")
   :BYTES 5379 :SHA256
   "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b")
  (:PATH "raw/mutations/baseline/src/index/primary-core.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-core.lisp")
   :BYTES 4211 :SHA256
   "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e")
  (:PATH "raw/mutations/baseline/src/index/primary-directory.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-directory.lisp")
   :BYTES 8114 :SHA256
   "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd")
  (:PATH "raw/mutations/baseline/src/index/primary-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-package.lisp")
   :BYTES 1451 :SHA256
   "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860")
  (:PATH "raw/mutations/baseline/src/index/primary-probe.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-probe.lisp")
   :BYTES 5936 :SHA256
   "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4")
  (:PATH "raw/mutations/baseline/src/index/primary-read.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-read.lisp")
   :BYTES 3575 :SHA256
   "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f")
  (:PATH "raw/mutations/baseline/src/index/primary-relocate.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-relocate.lisp")
   :BYTES 4073 :SHA256
   "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20")
  (:PATH "raw/mutations/baseline/src/index/primary-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-types.lisp")
   :BYTES 3949 :SHA256
   "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64")
  (:PATH "raw/mutations/baseline/src/index/primary-write.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/primary-write.lisp")
   :BYTES 7061 :SHA256
   "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655")
  (:PATH "raw/mutations/baseline/src/index/read.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/read.lisp")
   :BYTES 3030 :SHA256
   "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7")
  (:PATH "raw/mutations/baseline/src/index/rebuild-budget.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/rebuild-budget.lisp")
   :BYTES 3593 :SHA256
   "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0")
  (:PATH "raw/mutations/baseline/src/index/rebuild-copy.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/rebuild-copy.lisp")
   :BYTES 4027 :SHA256
   "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee")
  (:PATH "raw/mutations/baseline/src/index/rebuild-scan.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/rebuild-scan.lisp")
   :BYTES 5002 :SHA256
   "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e")
  (:PATH "raw/mutations/baseline/src/index/rebuild.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/rebuild.lisp")
   :BYTES 2872 :SHA256
   "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1")
  (:PATH "raw/mutations/baseline/src/index/relocate.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/relocate.lisp")
   :BYTES 2383 :SHA256
   "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc")
  (:PATH "raw/mutations/baseline/src/index/types.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/types.lisp")
   :BYTES 2434 :SHA256
   "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e")
  (:PATH "raw/mutations/baseline/src/index/validation.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/validation.lisp")
   :BYTES 3930 :SHA256
   "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a")
  (:PATH "raw/mutations/baseline/src/index/write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/index/write.lisp")
   :BYTES 4784 :SHA256
   "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28")
  (:PATH "raw/mutations/baseline/src/io/flush.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/io/flush.lisp")
   :BYTES 1569 :SHA256
   "0ff9522660c824265368a62dbf7df2a5f5ad59f4ef759217107e1e49d8ed6325")
  (:PATH "raw/mutations/baseline/src/io/lifecycle.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/io/lifecycle.lisp")
   :BYTES 4536 :SHA256
   "baa1f763fe0f394a14d381b753dcb1be1e90eb03eaff5d6469465b5d4eca015f")
  (:PATH "raw/mutations/baseline/src/io/native.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/io/native.lisp")
   :BYTES 5026 :SHA256
   "b8cf3ce1ff7b4fa9def8a602ab768c0e9a321f8d6cdce6e5b2b7ded2fe3d97dd")
  (:PATH "raw/mutations/baseline/src/io/package.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/io/package.lisp")
   :BYTES 592 :SHA256
   "118eba04ab2aa87a2d86e0b0269dbeacaa485457acebbc12c57317ae465a89c0")
  (:PATH "raw/mutations/baseline/src/io/transfer.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/io/transfer.lisp")
   :BYTES 5051 :SHA256
   "3748328cf85e1c007900a63bdd0f159f38a8d7cd3577c92c56fc68692b9b7bcf")
  (:PATH "raw/mutations/baseline/src/io/types.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/io/types.lisp")
   :BYTES 4143 :SHA256
   "50c7eeea91af232fca7103ce5a25535958d73836f01cb45a20c7120b88b1336b")
  (:PATH "raw/mutations/baseline/src/mvcc/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/mvcc/package.lisp")
   :BYTES 833 :SHA256
   "91fa3ea0c8e21f70ddf88a68087b1584589ae19f93a0c39e7a56d9d3eaac219c")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-core.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/mvcc/snapshots-core.lisp")
   :BYTES 7622 :SHA256
   "1d4edf03e647015fc4e74fdaa72d22d7d2426633a86f89361eb04b5ea2281998")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-csn.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/mvcc/snapshots-csn.lisp")
   :BYTES 2725 :SHA256
   "f0af2e4fdb87b23f4090281c3c19453728bbbba7f14833def8bff27fc3a8eb77")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-lifecycle.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/mvcc/snapshots-lifecycle.lisp")
   :BYTES 6609 :SHA256
   "909b797b5a4fb6f29e02e7fe0543708adf40979ff2b6de1e12de64fd3e556082")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-read.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/mvcc/snapshots-read.lisp")
   :BYTES 6651 :SHA256
   "0ee89b646107bc9b6d9e3cbdccca3dc4fc55a3fe881b75a9c17d86eae073dda9")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-register.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/mvcc/snapshots-register.lisp")
   :BYTES 6654 :SHA256
   "5061dd7e28ae26ab75946082e0583b34c26e228fce9a82158729dd3d560b275b")
  (:PATH "raw/mutations/baseline/src/mvcc/snapshots-types.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/mvcc/snapshots-types.lisp")
   :BYTES 3817 :SHA256
   "d4acf9ed262d9643547e8af4f3928eb6cae3d2ab9a7a87732890edf9f94db73f")
  (:PATH "raw/mutations/baseline/src/mvcc/types.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/mvcc/types.lisp")
   :BYTES 471 :SHA256
   "148311c837c4af4e5b254282c7e18a5f98383c9dff593ad4cef878b8feb30e50")
  (:PATH "raw/mutations/baseline/src/package.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations/baseline/src/read/core.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/read/core.lisp")
   :BYTES 3846 :SHA256
   "7a437189ce0d5dcf503fdbddb4e8d229c43167e3c5a99e813e8ae23855bab89f")
  (:PATH "raw/mutations/baseline/src/read/package.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/read/package.lisp")
   :BYTES 831 :SHA256
   "e3ad1a96fa0eb818108b222b0195af8d3579ab6bf07b29d5fb0fb9c550e4b4df")
  (:PATH "raw/mutations/baseline/src/read/task.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/read/task.lisp")
   :BYTES 5073 :SHA256
   "d309dcdc86ce31a913ffbce7f258066db0a3f9d756f76c680bba1252d98ec0c2")
  (:PATH "raw/mutations/baseline/src/read/types.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/read/types.lisp")
   :BYTES 2358 :SHA256
   "f3f1c4c736c5a64a6de47302b24833665b3188c1627dec866fc3784c283eec6c")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-build.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/decisions-build.lisp")
   :BYTES 11857 :SHA256
   "be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-package.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/decisions-package.lisp")
   :BYTES 818 :SHA256
   "a58dcefca404c567bcb339c24e2ad38767a49964d34dc2c3c6696c932902de39")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-query.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/decisions-query.lisp")
   :BYTES 4525 :SHA256
   "08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-radix.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/decisions-radix.lisp")
   :BYTES 11061 :SHA256
   "564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-sort.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/decisions-sort.lisp")
   :BYTES 7654 :SHA256
   "cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2")
  (:PATH "raw/mutations/baseline/src/recovery/decisions-types.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/decisions-types.lisp")
   :BYTES 2056 :SHA256
   "77cfcb54f46cc735310546f0f89fd0dfd16297cf74f8b0942ee7e451ae59873c")
  (:PATH "raw/mutations/baseline/src/recovery/inventory-build.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/inventory-build.lisp")
   :BYTES 9592 :SHA256
   "cc486c3dcb7e83656301a0bea59442f8e654543740b0d6950290450f5e2f415e")
  (:PATH "raw/mutations/baseline/src/recovery/inventory-query.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/inventory-query.lisp")
   :BYTES 2100 :SHA256
   "8b151ca6e8cee66a4e9035398349e21f0f3b4d1fdb564557ed60d3cf52fe7bfb")
  (:PATH "raw/mutations/baseline/src/recovery/inventory-types.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/inventory-types.lisp")
   :BYTES 2392 :SHA256
   "df84220d8e679322bc1a68d9e279e25985e6a07d64c95782191d9085987624e9")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-build.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/manifest-build.lisp")
   :BYTES 10251 :SHA256
   "1e6f306f14685607c3e5adb3ddefd3cbbef915d3185882b1f8ea18aa6b0f9471")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-decode.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/manifest-decode.lisp")
   :BYTES 6160 :SHA256
   "04ee77e3b294a41f5b93fab01c99b907a39d6ab229f770484b00af64f3505779")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-fold.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/manifest-fold.lisp")
   :BYTES 7068 :SHA256
   "60ed35eefdeafe2d1bdb40b6306969b6b00801e641e2a14a61a5492d45486730")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-package.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/manifest-package.lisp")
   :BYTES 1372 :SHA256
   "0575efe36245b73db5c99f53577f3ed17039b8b796fa1e9095bdb8a0c6cdc5dc")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-query.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/manifest-query.lisp")
   :BYTES 3582 :SHA256
   "d033f9dea7c94f92dd52dc45fa84b5dc852ac99ab254503c1a51d78eadb8ad6b")
  (:PATH "raw/mutations/baseline/src/recovery/manifest-types.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/manifest-types.lisp")
   :BYTES 3345 :SHA256
   "4d6a51841dde7f5cd88834cb94538e3d6b060b660d210c7d418b1d7a940b7a10")
  (:PATH "raw/mutations/baseline/src/recovery/package.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/package.lisp")
   :BYTES 927 :SHA256
   "a7593b4df8d126fb3953c75628230392822a156dd74e7f5e38d5131bce2d62c9")
  (:PATH "raw/mutations/baseline/src/recovery/scan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/recovery/scan.lisp")
   :BYTES 12829 :SHA256
   "cdcc030eb24d1bcc8ededafbfb1fe8bc3e107af0dd4a1d4b8f202f049904e218")
  (:PATH "raw/mutations/baseline/src/series/events.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/events.lisp")
   :BYTES 9566 :SHA256
   "c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7")
  (:PATH "raw/mutations/baseline/src/series/io-events.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/io-events.lisp")
   :BYTES 5385 :SHA256
   "5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546")
  (:PATH "raw/mutations/baseline/src/series/ownership.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/ownership.lisp")
   :BYTES 8810 :SHA256
   "195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4")
  (:PATH "raw/mutations/baseline/src/series/package.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/package.lisp")
   :BYTES 1392 :SHA256
   "7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408")
  (:PATH "raw/mutations/baseline/src/series/publication.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/publication.lisp")
   :BYTES 6094 :SHA256
   "288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762")
  (:PATH "raw/mutations/baseline/src/series/query.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/query.lisp")
   :BYTES 3600 :SHA256
   "21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9")
  (:PATH "raw/mutations/baseline/src/series/retirement.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/retirement.lisp")
   :BYTES 4634 :SHA256
   "23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059")
  (:PATH "raw/mutations/baseline/src/series/routing-build.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/routing-build.lisp")
   :BYTES 4023 :SHA256
   "70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d")
  (:PATH "raw/mutations/baseline/src/series/routing-select.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/routing-select.lisp")
   :BYTES 3486 :SHA256
   "796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a")
  (:PATH "raw/mutations/baseline/src/series/routing-types.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/routing-types.lisp")
   :BYTES 2046 :SHA256
   "31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1")
  (:PATH "raw/mutations/baseline/src/series/types.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/types.lisp")
   :BYTES 3316 :SHA256
   "5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9")
  (:PATH "raw/mutations/baseline/src/series/worker-boundary.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256
   "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73")
  (:PATH "raw/mutations/baseline/src/series/worker-package.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/worker-package.lisp")
   :BYTES 1192 :SHA256
   "dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7")
  (:PATH "raw/mutations/baseline/src/series/worker-run.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256
   "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f")
  (:PATH "raw/mutations/baseline/src/series/worker-types.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256
   "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a")
  (:PATH "raw/mutations/baseline/src/storage/compaction-scan.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/storage/compaction-scan.lisp")
   :BYTES 5510 :SHA256
   "63b4e2bd18045a3aead8833509f6984d9d1f99b458ee790e61194b5a20ee329d")
  (:PATH "raw/mutations/baseline/src/storage/control-payload.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/storage/control-payload.lisp")
   :BYTES 6273 :SHA256
   "106b5eefb612ea6180a50ee7c7db682930dc481fc7cedb5b94f32a34ab2e9491")
  (:PATH "raw/mutations/baseline/src/storage/formats.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/storage/formats.lisp")
   :BYTES 3841 :SHA256
   "7b926250bf3ace00ed955d5ea9c27b66ab44fa21e3b4b78f87f1fce9dae1494f")
  (:PATH "raw/mutations/baseline/src/storage/log-header.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/storage/log-header.lisp")
   :BYTES 3947 :SHA256
   "817ba58a321911b766db3f7c75ada3d557249258641cc973811863a43695be81")
  (:PATH "raw/mutations/baseline/src/storage/package.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/storage/package.lisp")
   :BYTES 1079 :SHA256
   "28b5e2c1558e4055cf792638a49161b09b101a9e70cd7182b9638dcc6a10a01e")
  (:PATH "raw/mutations/baseline/src/storage/payload-record.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/storage/payload-record.lisp")
   :BYTES 3641 :SHA256
   "ea76337e95dd48a65d412efdcf403f5c4b1588759aa33152caed4ebdb0c649a7")
  (:PATH "raw/mutations/baseline/src/storage/payload-write.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/storage/payload-write.lisp")
   :BYTES 5239 :SHA256
   "15b8638ce03d098181dfa2a85ec48db687c917fb0f1aa9ea799d20ce5ff8dfbc")
  (:PATH "raw/mutations/baseline/src/storage/segment-header.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/storage/segment-header.lisp")
   :BYTES 5517 :SHA256
   "f0b78ed097b1f92ee3201288b0e4924066c3f38a06c1681cf0c531c9fd982011")
  (:PATH "raw/mutations/baseline/src/wal/builder.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/wal/builder.lisp")
   :BYTES 8445 :SHA256
   "186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0")
  (:PATH "raw/mutations/baseline/src/wal/csn.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/wal/csn.lisp")
   :BYTES 9577 :SHA256
   "2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810")
  (:PATH "raw/mutations/baseline/src/wal/executor.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/wal/executor.lisp")
   :BYTES 6023 :SHA256
   "d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8")
  (:PATH "raw/mutations/baseline/src/wal/group.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/wal/group.lisp")
   :BYTES 6305 :SHA256
   "7401cefa0a094aa1765ded7ab209d924a84c6a3d579bbceadc38ab0c0582bd4b")
  (:PATH "raw/mutations/baseline/src/wal/package.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/wal/package.lisp")
   :BYTES 1774 :SHA256
   "483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89")
  (:PATH "raw/mutations/baseline/src/wal/types.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/src/wal/types.lisp")
   :BYTES 5420 :SHA256
   "c4ae64ea2a63f8eeccf026cc130cdb668f3e4b256f30804db59230e9a023e18e")
  (:PATH "raw/mutations/baseline/test.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/test.log")
   :BYTES 69381 :SHA256
   "93200b8b81029cec3228245d7bdf30788dfa271c5fdbd1f757f72e14ba4a4b99")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-float-write-support.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10030 :SHA256
   "158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-float-write-threads.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 3701 :SHA256
   "96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-header.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 4547 :SHA256
   "1c7918faa4077f159990a7419a5de5d846f6301e6e3e728c883edad3e51b8660")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal-threads.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 3799 :SHA256
   "e5ecd31dee3f9b26f1577a5cacda5fce78a9a2ff894afb24cfc29e502e3972c2")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-simple-write-support.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-simple-write-threads.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-structure-threads.lisp")
   :BYTES 4305 :SHA256
   "28f05d84e92eb1a9c30b2d90ab9edd7157823e9440416cb04567a71d94e9c645")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-structure.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-threads.lisp")
   :BYTES 3683 :SHA256
   "3eb0102046f7d64ed449e6ebcfd019a7cb92cc7334239afd8802b044b5e9ab14")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/mutations/baseline/tests/codec/cbor-write.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/mutations/baseline/tests/codec/support.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/mutations/baseline/tests/codec/threads.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/threads.lisp")
   :BYTES 3111 :SHA256
   "d693a74fc7276c958d083532fde8aab86e604b28da6ff67334a39dc348fcd337")
  (:PATH "raw/mutations/baseline/tests/codec/utf8.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/mutations/baseline/tests/csn/registry.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/csn/registry.lisp")
   :BYTES 19411 :SHA256
   "c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950")
  (:PATH "raw/mutations/baseline/tests/csn/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/csn/support.lisp")
   :BYTES 11407 :SHA256
   "6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db")
  (:PATH "raw/mutations/baseline/tests/csn/threads.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/csn/threads.lisp")
   :BYTES 10525 :SHA256
   "0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2")
  (:PATH "raw/mutations/baseline/tests/epochs/lifecycle.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/epochs/lifecycle.lisp")
   :BYTES 25394 :SHA256
   "ddc2fbdad9f97d2e4ff008c167776a50b17b742398306fbd5198dca474559cbf")
  (:PATH "raw/mutations/baseline/tests/epochs/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/epochs/support.lisp")
   :BYTES 5943 :SHA256
   "366be7af4bf6c4ed946b3fa9e97aea6b034c83e3b757d81c54078dc76d229b6d")
  (:PATH "raw/mutations/baseline/tests/epochs/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/epochs/threads.lisp")
   :BYTES 3654 :SHA256
   "54b73e06c61e64f32a3e3af0791891dacb6590e929163dcf0fac95f2c71e66fd")
  (:PATH "raw/mutations/baseline/tests/execution/handoff.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/execution/handoff.lisp")
   :BYTES 33278 :SHA256
   "7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e")
  (:PATH "raw/mutations/baseline/tests/execution/queue.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/execution/queue.lisp")
   :BYTES 12894 :SHA256
   "fd71ebd45d556fdb5212129000eee628a003cb624b48607bc744145455a8a722")
  (:PATH "raw/mutations/baseline/tests/execution/ready-recycle.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/execution/ready-recycle.lisp")
   :BYTES 30075 :SHA256
   "c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae")
  (:PATH "raw/mutations/baseline/tests/execution/ready.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/execution/ready.lisp")
   :BYTES 33555 :SHA256
   "4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e")
  (:PATH "raw/mutations/baseline/tests/execution/support.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/execution/support.lisp")
   :BYTES 4469 :SHA256
   "2b43544d8a1a18fd0e68e3576dc5e33189af52f5c725566b1665632548564a43")
  (:PATH "raw/mutations/baseline/tests/execution/threads.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/execution/threads.lisp")
   :BYTES 14622 :SHA256
   "e864cd4d99064d2b63823b5541fe123fc8186d632400629fb50841e123b2d359")
  (:PATH "raw/mutations/baseline/tests/execution/worker.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/execution/worker.lisp")
   :BYTES 59783 :SHA256
   "ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06")
  (:PATH "raw/mutations/baseline/tests/foundation/batch.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/foundation/batch.lisp")
   :BYTES 5185 :SHA256
   "fc5242806f7eae35760f1e1a16566c5266fd74608b217fd069dc269e6ccdc183")
  (:PATH "raw/mutations/baseline/tests/foundation/binary.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/foundation/binary.lisp")
   :BYTES 3721 :SHA256
   "c8e60ebfe830b6b8d166fed267d451bf1aa21604d9e661fb5c231759d038f4fe")
  (:PATH "raw/mutations/baseline/tests/foundation/record.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/foundation/record.lisp")
   :BYTES 14950 :SHA256
   "d47e0aaf280f4e27ebd7518b50e876fa61266c4d9aad17ced8d0f46bd0a9d3e8")
  (:PATH "raw/mutations/baseline/tests/foundation/support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations/baseline/tests/get-directory/construction.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get-directory/construction.lisp")
   :BYTES 11868 :SHA256
   "4ce9aa7064793e908008b9e1055c1e2527d5071006782ea956509c28e8c712d7")
  (:PATH "raw/mutations/baseline/tests/get-directory/read.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get-directory/read.lisp")
   :BYTES 27170 :SHA256
   "a222541b6413bb93ff86a269273f1fa15bfad0d1e4072fc058b023fec5143280")
  (:PATH "raw/mutations/baseline/tests/get-directory/support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get-directory/support.lisp")
   :BYTES 24102 :SHA256
   "be3a216a6ec597b63186b6bf3d3e35f3327f3001b1c00535d64b10bcb5d9fe85")
  (:PATH "raw/mutations/baseline/tests/get-directory/threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get-directory/threads.lisp")
   :BYTES 6618 :SHA256
   "e6a93ec22bc6f5a31b37ae99d927d1ca3a53893adb2eae21cd89d132a82d1f64")
  (:PATH "raw/mutations/baseline/tests/get-performance/guards.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get-performance/guards.lisp")
   :BYTES 8986 :SHA256
   "c41721b917ed443355ea3707efdd07e7da53a978c0515ab1e5ede5fcc47d63fc")
  (:PATH "raw/mutations/baseline/tests/get-performance/paths.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get-performance/paths.lisp")
   :BYTES 4936 :SHA256
   "3b8d2c9c93467507ea2bb471d42192eb1fa084b55c0f4263b5ef0d3acf468f55")
  (:PATH "raw/mutations/baseline/tests/get-performance/support.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get-performance/support.lisp")
   :BYTES 22497 :SHA256
   "e586ed94dcb2aaba00282931cdd83313e4f84a86d4d1ba85e2d56e8b7433ed8d")
  (:PATH "raw/mutations/baseline/tests/get-performance/threads.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get-performance/threads.lisp")
   :BYTES 4744 :SHA256
   "05ace5eb351ab49da59611dc1a2a5abedb9d723a2fc6e75a30fc76e507573a90")
  (:PATH "raw/mutations/baseline/tests/get/lifecycle.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get/lifecycle.lisp")
   :BYTES 22565 :SHA256
   "73bf87c2aee7b537dba31fc0ae554272f7d2be5a4c1e9e96ea2f21a17f6f71f5")
  (:PATH "raw/mutations/baseline/tests/get/segment.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get/segment.lisp")
   :BYTES 15454 :SHA256
   "e9722f419ce0810c98c28d0e1a74da85d52346a0befff40c1119934519fc6f98")
  (:PATH "raw/mutations/baseline/tests/get/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/get/support.lisp")
   :BYTES 12352 :SHA256
   "21f0da34755882f7dcc3ee760528ca39d4731e1a79ea94525c62753b7f60422c")
  (:PATH "raw/mutations/baseline/tests/hash/guards.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/hash/guards.lisp")
   :BYTES 1162 :SHA256
   "9af5b38443a57d224990a68e93f12f7a4cda306f94c7ccd3ccb50635865d7864")
  (:PATH "raw/mutations/baseline/tests/hash/hash64.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/hash/hash64.lisp")
   :BYTES 17948 :SHA256
   "70606bc68807143cfea9583871474c84efc868d13692cde28488284dee43e0f1")
  (:PATH "raw/mutations/baseline/tests/hash/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/hash/support.lisp")
   :BYTES 10828 :SHA256
   "0fae9dc36976af544f83e6051b9cf9d67c9bef0b9e25f1fa2a48fdac48592acb")
  (:PATH "raw/mutations/baseline/tests/hash/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/hash/threads.lisp")
   :BYTES 6701 :SHA256
   "3fc587a57d26a294aebfc6a7aeadf2f61a42a21106c1c57517f891b76b4e750a")
  (:PATH "raw/mutations/baseline/tests/index/hash-digests.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/index/hash-digests.lisp")
   :BYTES 35926 :SHA256
   "3b3b39f861883cf2017cab8e6488560a6bb3897d63784f00e820a6450d743225")
  (:PATH "raw/mutations/baseline/tests/index/primary-support.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/index/primary-support.lisp")
   :BYTES 13938 :SHA256
   "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a")
  (:PATH "raw/mutations/baseline/tests/index/primary-threads.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/index/primary-threads.lisp")
   :BYTES 13744 :SHA256
   "adf1864160afd39c09c546a736508e7f0980948bac5a047a001fd2f6cca414a2")
  (:PATH "raw/mutations/baseline/tests/index/primary.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/index/primary.lisp")
   :BYTES 30166 :SHA256
   "d15dd394f9656ee634bcdcfb3f408f0c81b0e31b4b298612ce2746ea6de0d696")
  (:PATH "raw/mutations/baseline/tests/index/rebuild.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/index/rebuild.lisp")
   :BYTES 32112 :SHA256
   "b7ae5120b8e8565d44235ee57acd684c20db4b166f06288ed97a2d0ff400f7c1")
  (:PATH "raw/mutations/baseline/tests/index/slot-support.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/index/slot-support.lisp")
   :BYTES 12800 :SHA256
   "1718e43244f68d0593ba4db584fae55cd260a4c0bdd012c9e4bf9209bf8ade31")
  (:PATH "raw/mutations/baseline/tests/index/slot-threads.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/index/slot-threads.lisp")
   :BYTES 11698 :SHA256
   "ed0f4b2e6c47f640eb727c5cf760ec435f2d02685b40ededa6f854fa87a91a3f")
  (:PATH "raw/mutations/baseline/tests/index/slots.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/index/slots.lisp")
   :BYTES 26420 :SHA256
   "e82e3e9b1dad02f09bfad26cb9545a378ab3021e265a22cf675801044de96deb")
  (:PATH "raw/mutations/baseline/tests/io/native.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/io/native.lisp")
   :BYTES 6207 :SHA256
   "9a9b4607ffd9fe2f57d0131ed516d8f045f85397c7082e7aa0883b08c7a37dc0")
  (:PATH "raw/mutations/baseline/tests/io/support.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/io/support.lisp")
   :BYTES 2951 :SHA256
   "283ab16cdb01d5d81b5f78c2f2aa2676913f07a682a9f8c573e67c956f2d6a50")
  (:PATH "raw/mutations/baseline/tests/io/transfer.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/io/transfer.lisp")
   :BYTES 11847 :SHA256
   "827e879fdd05d196059258ec78af754234012e2b217518d6391f35fb631d71fd")
  (:PATH "raw/mutations/baseline/tests/lint-fixtures/bad.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/lint-fixtures/bad.lisp")
   :BYTES 1587 :SHA256
   "ac8912ce6cc1101f2ebc305a50c0565879547b527d7ca0aeac900ee06bf26652")
  (:PATH "raw/mutations/baseline/tests/lint-fixtures/good.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/lint-fixtures/good.lisp")
   :BYTES 671 :SHA256
   "05ce84f8fd12d9af48252601bcc92d6d60335b53f39b01a9fe2697c4bdaa8cee")
  (:PATH "raw/mutations/baseline/tests/lint-fixtures/keyword-barrier.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/lint-fixtures/keyword-barrier.lisp")
   :BYTES 199 :SHA256
   "e26dab117e9526ace35bb45b92f977065d33fcc4404c40fd4fc3c77749689a96")
  (:PATH "raw/mutations/baseline/tests/lint-fixtures/qualified-reader.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/lint-fixtures/qualified-reader.lisp")
   :BYTES 152 :SHA256
   "835229bdc1a0ed0c08511cd6121e1f1bc4284da2cfba951b72cd1a74a6040d35")
  (:PATH "raw/mutations/baseline/tests/mvcc/capture.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/mvcc/capture.lisp")
   :BYTES 16356 :SHA256
   "ea6d1cfe982ccd1e98857bfa7092d4f1bf35e82bd46fa4c9a8403d30e9a8af35")
  (:PATH "raw/mutations/baseline/tests/mvcc/lifecycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/mvcc/lifecycle.lisp")
   :BYTES 23964 :SHA256
   "4b6523fb0fb91eed3167e126434ef091fea13d032b4b04bc071d30ffa2282c16")
  (:PATH "raw/mutations/baseline/tests/mvcc/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/mvcc/support.lisp")
   :BYTES 5931 :SHA256
   "faeb5781be2c634bd61bb65d03eae248403b33376de8c306289c558ee7941290")
  (:PATH "raw/mutations/baseline/tests/read/lifecycle.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/read/lifecycle.lisp")
   :BYTES 17804 :SHA256
   "c4c4642408816f2e0e809e21d04739b68b9391237e3e46ea0b195ed82857c3a8")
  (:PATH "raw/mutations/baseline/tests/read/support.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/read/support.lisp")
   :BYTES 4845 :SHA256
   "8095cc39d49342f6e43f3421b4fced839da02d8d11b4d8ddcd91bd346447e754")
  (:PATH "raw/mutations/baseline/tests/read/threads.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/read/threads.lisp")
   :BYTES 4150 :SHA256
   "e2e223b69b08a5d76b9773c6ad4dee13ef2ddbb6f5ababa713cc5654bc7b51c5")
  (:PATH "raw/mutations/baseline/tests/recovery/corruption.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/corruption.lisp")
   :BYTES 7106 :SHA256
   "ab0fca8f28b57b99d69c2cb5e087135713a296aea9328ad234da88fbaf65355c")
  (:PATH "raw/mutations/baseline/tests/recovery/decisions-audit.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/decisions-audit.lisp")
   :BYTES 14971 :SHA256
   "35479ab2de43fd0a2bf65025c7ebd1c53d791e728316d0d00da96a08600fd6f0")
  (:PATH "raw/mutations/baseline/tests/recovery/decisions-radix.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/decisions-radix.lisp")
   :BYTES 27851 :SHA256
   "75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0")
  (:PATH "raw/mutations/baseline/tests/recovery/decisions-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/decisions-support.lisp")
   :BYTES 6797 :SHA256
   "a0c71abdf2b6685e24c0144485f66261283028f0377bb14a210c2b0a3ca2abb4")
  (:PATH "raw/mutations/baseline/tests/recovery/decisions.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/decisions.lisp")
   :BYTES 19149 :SHA256
   "37b5bded30afbed2a0968e85f179db08f74c44b117127e448db7b1b4a7ac036e")
  (:PATH "raw/mutations/baseline/tests/recovery/inventory-support.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/inventory-support.lisp")
   :BYTES 8083 :SHA256
   "2c6e1e6fb7a641c17f08b9dc4f425c86b6feb03f871496d918a08215957bcb27")
  (:PATH "raw/mutations/baseline/tests/recovery/inventory.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/inventory.lisp")
   :BYTES 14479 :SHA256
   "e6342511c85b67ba9f1bef190bbf141e7e2fbcb92005ea3e43851488988c7fb9")
  (:PATH "raw/mutations/baseline/tests/recovery/manifest-audit.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/manifest-audit.lisp")
   :BYTES 17670 :SHA256
   "f4db042a50275b840f0d4e5c78e4454c36fccff80e72f4ffc786c4f5007f83d6")
  (:PATH "raw/mutations/baseline/tests/recovery/manifest-support.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/manifest-support.lisp")
   :BYTES 9769 :SHA256
   "d5fcc1a53715c6b07600536b78143d99d3f1edb10ccae8e06f7cb4917c30b830")
  (:PATH "raw/mutations/baseline/tests/recovery/manifest.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/manifest.lisp")
   :BYTES 13799 :SHA256
   "28f1311cdd468fd076fee2053f9949aa98febcae28cc108fabe106a0f2054edd")
  (:PATH "raw/mutations/baseline/tests/recovery/scan.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/scan.lisp")
   :BYTES 16966 :SHA256
   "c0ed9d49f266fc77e1b72a51a6283c5c49084427808d0cb402ab40a9176d4d6b")
  (:PATH "raw/mutations/baseline/tests/recovery/support.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/recovery/support.lisp")
   :BYTES 5957 :SHA256
   "7083ff693d5e184526dce131d14b3fd58b5226e90c4f12d7b86768ec8b086204")
  (:PATH "raw/mutations/baseline/tests/series/boundaries.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/series/boundaries.lisp")
   :BYTES 5802 :SHA256
   "12283035e836d60bba5dbe868947c641658091b1bbfde82742fe416f429968b8")
  (:PATH "raw/mutations/baseline/tests/series/controller.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/series/controller.lisp")
   :BYTES 60484 :SHA256
   "4bea80eb231575f48b208ddb57af6a11706481e0ec755b084f6cd4b6fd0481a1")
  (:PATH "raw/mutations/baseline/tests/series/support.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/series/support.lisp")
   :BYTES 16885 :SHA256
   "8821ae9e002941eff8ea3ae7dbfc727cb6874b68d2d1ef85af668eb2d34a0c0c")
  (:PATH "raw/mutations/baseline/tests/series/threads.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/series/threads.lisp")
   :BYTES 19694 :SHA256
   "bbea64d207d14698b39ab0f8ded03db11bab09955d3f66705c23d69c09aefc8e")
  (:PATH "raw/mutations/baseline/tests/series/worker-bridge.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256
   "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176")
  (:PATH "raw/mutations/baseline/tests/series/worker-routing.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/series/worker-routing.lisp")
   :BYTES 32093 :SHA256
   "f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9")
  (:PATH "raw/mutations/baseline/tests/smoke.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/smoke.lisp")
   :BYTES 735 :SHA256
   "9e880b35987d70fafac2ba70d940dcac0bfc3cbd3971b2f36dd54bc849c7f9c8")
  (:PATH "raw/mutations/baseline/tests/storage/compaction-scan.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/storage/compaction-scan.lisp")
   :BYTES 16196 :SHA256
   "2a001ba21b72b7eec9f3c871ceca098a0d6d13d068d5a099fbbc6dd15772c4f5")
  (:PATH "raw/mutations/baseline/tests/storage/control-payload.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/storage/control-payload.lisp")
   :BYTES 12651 :SHA256
   "b7698a5f27ed54290b18fcd61b9e334a1685cf3640f1e3e46e54dd8e38acaeae")
  (:PATH "raw/mutations/baseline/tests/storage/log-header.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/storage/log-header.lisp")
   :BYTES 11969 :SHA256
   "cf2ffcfebf549b93fc47c42f9f3816d52074264abf83dce285c01378a7f45b1e")
  (:PATH "raw/mutations/baseline/tests/storage/segment-header.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/storage/segment-header.lisp")
   :BYTES 4149 :SHA256
   "dd94d76f20db349ba0f4337ac34400a034a86f4ede523fed5551d261091c83df")
  (:PATH "raw/mutations/baseline/tests/storage/support.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/storage/support.lisp")
   :BYTES 4029 :SHA256
   "dfb74f2108cbd909cb867eda09d4a22164aaf4eaf0534a06ae2a732bd20b2625")
  (:PATH "raw/mutations/baseline/tests/wal/builder.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/wal/builder.lisp")
   :BYTES 4000 :SHA256
   "903fb769d104d75871f7fa1db0ecd8ad5c54ef29c212441ce5d527dab467b1e6")
  (:PATH "raw/mutations/baseline/tests/wal/csn-threads.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/wal/csn-threads.lisp")
   :BYTES 12114 :SHA256
   "f41096f116253e588524746ecce74c444227937b854706889d9fdd8ec6a3445c")
  (:PATH "raw/mutations/baseline/tests/wal/csn.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/wal/csn.lisp")
   :BYTES 34661 :SHA256
   "b508b26e6bad4aa105b0d500aa810a00b9db54726e1b440975894d6225bc5e3a")
  (:PATH "raw/mutations/baseline/tests/wal/fault.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/wal/fault.lisp")
   :BYTES 7614 :SHA256
   "0574c51ccfe04a24c71c3b03341b04f24c8fb271d902b365c4fa82175015a875")
  (:PATH "raw/mutations/baseline/tests/wal/group.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/wal/group.lisp")
   :BYTES 5524 :SHA256
   "edbdab57cfa0c0d5bdd31342fea6461e2691c887a66f2ca3113f605aed3ea40e")
  (:PATH "raw/mutations/baseline/tests/wal/native.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/wal/native.lisp")
   :BYTES 2567 :SHA256
   "3d54ef02df2f251943694a7bbb1141b7dc1a0079cebda7eed66211e6cd7fc2f7")
  (:PATH "raw/mutations/baseline/tests/wal/support.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tests/wal/support.lisp")
   :BYTES 1951 :SHA256
   "90a47539e5e2898c0a08059207f30bb5551e7ca8fc166f8f6ce7b95afa757295")
  (:PATH "raw/mutations/baseline/tools/build.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/mutations/baseline/tools/cbor-float-write-isolated-build.lisp"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/baseline/tools/cbor-float-write-isolated-build.lisp")
   :BYTES 488 :SHA256
   "2b79f4e9c826ff9cead08091650f378680337d9a14bf17c456245e2215e22917")
  (:PATH "raw/mutations/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/mutations/report.lisp")
   :BYTES 68465 :SHA256
   "31d9d45051005025157e7bab013b2ee74d47f40d477a83f852465e3c9fbb4651")
  (:PATH "raw/parallel-collection/closed-check-4000905893-35652-0.log" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/closed-check-4000905893-35652-0.log")
   :BYTES 971 :SHA256
   "b38b187e2323ff562247593c9a9576c732b50619c00f438ad95904e2ff26b41e")
  (:PATH "raw/parallel-collection/closed-check-4000906044-37124-0.log" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/closed-check-4000906044-37124-0.log")
   :BYTES 971 :SHA256
   "f1ebc3b6d5f1945fc3ca021488648fe2430c05fda99d07101a6241b59bfeb5bc")
  (:PATH "raw/parallel-collection/collect-attempt1-syntax-failure.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collect-attempt1-syntax-failure.lisp")
   :BYTES 22579 :SHA256
   "875f56224f163d4748c0a3a79532b2d759b746fea1116a690da8609e58ee6d5d")
  (:PATH "raw/parallel-collection/collect-attempt2-semaphore-failure.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collect-attempt2-semaphore-failure.lisp")
   :BYTES 22580 :SHA256
   "c7d3b6223ae9bb893cd42baa7705eb80ca5b80c30c2129acc5494975f0d30449")
  (:PATH "raw/parallel-collection/collect-before-date-fix.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collect-before-date-fix.lisp")
   :BYTES 22602 :SHA256
   "02ad685895d5b111d259dd6dfcd925851f0c212f92ff320fe8328c822d394420")
  (:PATH "raw/parallel-collection/collect-original.diff" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collect-original.diff")
   :BYTES 31753 :SHA256
   "49dad05b909647cf9f7d80f39c85e3fe70136d2bbb670e16680745e3c4ccc5a1")
  (:PATH "raw/parallel-collection/collect-original.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collect-original.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "raw/parallel-collection/collect.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
   :BYTES 22602 :SHA256
   "53d8c739a95a79aba4ddc363abd6e0bc1f8d3f64b1572150b730f69eedc15296")
  (:PATH
   "raw/parallel-collection/collection-observation-4000905857-35234-0.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000905857-35234-0.lisp")
   :BYTES 409 :SHA256
   "ea3370d26db7f9c46ec9b5652a16a516e15be6fb5cb6dfda32f6d68e8a40af75")
  (:PATH
   "raw/parallel-collection/collection-observation-4000905891-35652-0.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000905891-35652-0.lisp")
   :BYTES 6954 :SHA256
   "16094d2bf9c914b1af4a6fa0608fe0c4e124f096385d05868e7b454c6e926e78")
  (:PATH
   "raw/parallel-collection/collection-observation-4000905896-35652-0.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000905896-35652-0.lisp")
   :BYTES 6879 :SHA256
   "ab23a602dbc5f574f8f4dc5431c17c6a7fb583347d685b69838c714d24d3c690")
  (:PATH
   "raw/parallel-collection/collection-observation-4000905898-35652-0.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000905898-35652-0.lisp")
   :BYTES 586 :SHA256
   "0957b62b0b8cba9a139256e9c186a5e2cbd8f55564bab5b0bd2dba18a29013ef")
  (:PATH
   "raw/parallel-collection/collection-observation-4000905898-35652-1.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000905898-35652-1.lisp")
   :BYTES 422 :SHA256
   "b17f698431c8fd470d91d87c0ab358b1e8d3966e9c5ab1ffc63f7e6a2b4a54a0")
  (:PATH
   "raw/parallel-collection/collection-observation-4000906041-37124-0.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000906041-37124-0.lisp")
   :BYTES 6954 :SHA256
   "c43131a671b314a15a18f83a142f36e4a64125e1db167ac8e8054f6f362c0322")
  (:PATH
   "raw/parallel-collection/collection-observation-4000906048-37124-0.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000906048-37124-0.lisp")
   :BYTES 6879 :SHA256
   "7346374cdfa3b95ffca385a233abafdb303ff5581aba4b175a1c63efcc9d3090")
  (:PATH
   "raw/parallel-collection/collection-observation-4000906051-37124-0.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000906051-37124-0.lisp")
   :BYTES 586 :SHA256
   "032836f4454bf13d135167e427c53b0b14638f9c4a480834435e33e62c99a1c7")
  (:PATH
   "raw/parallel-collection/collection-observation-4000906051-37124-1.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000906051-37124-1.lisp")
   :BYTES 422 :SHA256
   "d10c1347861e43b26b12f4051e636e1ea6f227722db36c206db6b896fdfd636b")
  (:PATH "raw/parallel-collection/self-test-2/input/manifest.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/manifest.lisp")
   :BYTES 462 :SHA256
   "27676fe7110e7a70a06ba804dd6f544108817caddeb95db84a7a70f9878bb49d")
  (:PATH "raw/parallel-collection/self-test-2/input/process/report.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/process/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file00.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file01.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file02.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file03.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file04.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file05.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file06.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file07.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file08.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file09.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file10.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file11.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file12.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file13.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/parallel-collection/self-test-2/input/tree/file14.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-2/input/tree/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/collection-manifest.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/collection-manifest.lisp")
   :BYTES 462 :SHA256
   "c23543227e47213e315da89dfe53a6ab413d2bada141800b074d780b02a29f95")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/collection-source.lisp"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/collection-source.lisp")
   :BYTES 22602 :SHA256
   "02ad685895d5b111d259dd6dfcd925851f0c212f92ff320fe8328c822d394420")
  (:PATH
   "raw/parallel-collection/self-test-3/corrupt/processes/synthetic/report.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "4648873d1757e47c894b7359c1685f67877133ee4baed81040b49a32b3e9062e")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file00.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file01.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file02.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file03.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file04.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file05.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file06.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file07.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file08.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file09.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file10.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file11.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file12.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file13.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/parallel-collection/self-test-3/corrupt/raw/fixtures/file14.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/corrupt/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/parallel-collection/self-test-3/input/duplicate.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/duplicate.lisp")
   :BYTES 674 :SHA256
   "cc743146e7312ca9ac71123828f1afe868e7a0ec157fda1b3604397f6947556d")
  (:PATH "raw/parallel-collection/self-test-3/input/manifest.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/manifest.lisp")
   :BYTES 462 :SHA256
   "c23543227e47213e315da89dfe53a6ab413d2bada141800b074d780b02a29f95")
  (:PATH "raw/parallel-collection/self-test-3/input/process/report.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/process/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file00.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file01.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file02.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file03.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file04.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file05.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file06.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file07.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file08.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file09.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file10.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file11.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file12.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file13.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/parallel-collection/self-test-3/input/tree/file14.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/input/tree/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/parallel-collection/self-test-3/report.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/report.lisp")
   :BYTES 820 :SHA256
   "86de7ac37585577d31b3367101b80a2b925017b47d96f2c7784651fbb3a8a25b")
  (:PATH "raw/parallel-collection/self-test-3/valid/archive-index.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/archive-index.lisp")
   :BYTES 6252 :SHA256
   "755d9071e14380f837c9846df98d4d5f22d6250c51876c7686e73f98e525bd00")
  (:PATH "raw/parallel-collection/self-test-3/valid/catalogo.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/catalogo.lisp")
   :BYTES 419 :SHA256
   "8a8199a1c49bbe6c5d80b12bb2cba3f8c1a19515471b6fd20c66f51df113f813")
  (:PATH "raw/parallel-collection/self-test-3/valid/collection-manifest.lisp"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/collection-manifest.lisp")
   :BYTES 462 :SHA256
   "c23543227e47213e315da89dfe53a6ab413d2bada141800b074d780b02a29f95")
  (:PATH "raw/parallel-collection/self-test-3/valid/collection-source.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/collection-source.lisp")
   :BYTES 22602 :SHA256
   "02ad685895d5b111d259dd6dfcd925851f0c212f92ff320fe8328c822d394420")
  (:PATH
   "raw/parallel-collection/self-test-3/valid/processes/synthetic/report.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file00.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file01.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file02.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file03.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file04.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file05.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file06.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file07.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file08.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file09.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file10.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file11.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file12.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file13.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/parallel-collection/self-test-3/valid/raw/fixtures/file14.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-3/valid/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/collection-manifest.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/collection-manifest.lisp")
   :BYTES 462 :SHA256
   "84ade654064ef3971efa73f33845eb4a1dbf0fc97ea0e194898838ddfc8b0fd0")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/collection-source.lisp"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/collection-source.lisp")
   :BYTES 22602 :SHA256
   "53d8c739a95a79aba4ddc363abd6e0bc1f8d3f64b1572150b730f69eedc15296")
  (:PATH
   "raw/parallel-collection/self-test-4/corrupt/processes/synthetic/report.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "4648873d1757e47c894b7359c1685f67877133ee4baed81040b49a32b3e9062e")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file00.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file01.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file02.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file03.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file04.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file05.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file06.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file07.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file08.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file09.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file10.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file11.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file12.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file13.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/parallel-collection/self-test-4/corrupt/raw/fixtures/file14.bin"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/corrupt/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/parallel-collection/self-test-4/input/duplicate.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/duplicate.lisp")
   :BYTES 674 :SHA256
   "4472d99b28d7cb1dc923591b94addd2aecbd844abe29e5ff0ae53bee07747d90")
  (:PATH "raw/parallel-collection/self-test-4/input/manifest.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/manifest.lisp")
   :BYTES 462 :SHA256
   "84ade654064ef3971efa73f33845eb4a1dbf0fc97ea0e194898838ddfc8b0fd0")
  (:PATH "raw/parallel-collection/self-test-4/input/process/report.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/process/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file00.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file01.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file02.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file03.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file04.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file05.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file06.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file07.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file08.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file09.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file10.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file11.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file12.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file13.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/parallel-collection/self-test-4/input/tree/file14.bin" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/input/tree/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/parallel-collection/self-test-4/report.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/report.lisp")
   :BYTES 820 :SHA256
   "65f5304b66ea2c3ec042d3e11f1cbdfe45b6f6789792dec267279d2643c8ed1d")
  (:PATH "raw/parallel-collection/self-test-4/valid/archive-index.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/archive-index.lisp")
   :BYTES 6252 :SHA256
   "99d5db25828b423606f9a2bdcb4e1a687bd6561f491b0d9beb7fd363a018051f")
  (:PATH "raw/parallel-collection/self-test-4/valid/catalogo.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/catalogo.lisp")
   :BYTES 419 :SHA256
   "5d7f8f22c2270357efa895e5ca4116fcfab2068ab6544b504c43a97a7c2b464b")
  (:PATH "raw/parallel-collection/self-test-4/valid/collection-manifest.lisp"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/collection-manifest.lisp")
   :BYTES 462 :SHA256
   "84ade654064ef3971efa73f33845eb4a1dbf0fc97ea0e194898838ddfc8b0fd0")
  (:PATH "raw/parallel-collection/self-test-4/valid/collection-source.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/collection-source.lisp")
   :BYTES 22602 :SHA256
   "53d8c739a95a79aba4ddc363abd6e0bc1f8d3f64b1572150b730f69eedc15296")
  (:PATH
   "raw/parallel-collection/self-test-4/valid/processes/synthetic/report.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/processes/synthetic/report.lisp")
   :BYTES 148 :SHA256
   "71c873322e15691eb8d3f45e9d770ed27f270f7a09131b2a464c9b81344c6b59")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file00.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file00.bin")
   :BYTES 17 :SHA256
   "af9dcf71a8f0e01f903c5df9e037e42e480485ad980847955bacf94985fb097a")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file01.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file01.bin")
   :BYTES 18 :SHA256
   "7e3725e6ac0c5befbcf909a35cf04b9842d818bb6585eeb92cf5282ebc359d1d")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file02.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file02.bin")
   :BYTES 19 :SHA256
   "f20dc8c1dad8dad8bc9b3e3b69fe7ebe75000c167cc6fab7697cfcfbe6be765b")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file03.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file03.bin")
   :BYTES 20 :SHA256
   "cdc69a0a06256e7d701b8df1035c2e162be5d6ececf2e22e69f47c4c2d4a557a")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file04.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file04.bin")
   :BYTES 21 :SHA256
   "4e4374a1b949247860d25de51816f9de8e65a1e0f401c6f1bd11cb2e22a187d9")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file05.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file05.bin")
   :BYTES 22 :SHA256
   "fa84bfdfc8b282c2a2094ebd77dd6f7d9448759760d5bb4c6bb8f0540c25e8a6")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file06.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file06.bin")
   :BYTES 23 :SHA256
   "c75bbdfbbfd3ec4436b2111bf5804164f661e8a7de450c3eddfb4bd41eb57ed5")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file07.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file07.bin")
   :BYTES 24 :SHA256
   "4704d589eae4a4a58531348f8975ad5c91d5cba375e2172a9aa0719127384651")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file08.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file08.bin")
   :BYTES 25 :SHA256
   "a7c3b7fa76f97f7ef9256d6576d42efda29ee5907b343114523ecffea422c5b9")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file09.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file09.bin")
   :BYTES 26 :SHA256
   "8c55d8e773dd6335df16763191992bcbc0c8c3f16184c5c346c4510eb91e9f75")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file10.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file10.bin")
   :BYTES 27 :SHA256
   "2c1f162efb9cd54db9fed48ae2d40b28d6ef24151c44951c2fd65acb4751d885")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file11.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file11.bin")
   :BYTES 28 :SHA256
   "9c143090c94cb1c197cb2fd19c520bcd08749d20985341d5fadd7a16246bddc6")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file12.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file12.bin")
   :BYTES 29 :SHA256
   "48f5e8a8415a7ae651f839f98e72b2e707ee8e879fc56f113a42c34ee8b44a55")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file13.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file13.bin")
   :BYTES 30 :SHA256
   "903b714efab5295fbc60b89d71af1f1cb2f37326e678dd02049544a6eea85219")
  (:PATH "raw/parallel-collection/self-test-4/valid/raw/fixtures/file14.bin"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/self-test-4/valid/raw/fixtures/file14.bin")
   :BYTES 31 :SHA256
   "751505faba46064d2f78f7c2de89a58296f179dfa2cb29e50dea62a17ead0c56")
  (:PATH "raw/precompile-quotient-guard/cbor-float-narrow.original.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/precompile-quotient-guard/cbor-float-narrow.original.lisp")
   :BYTES 4329 :SHA256
   "2d8fc33097b10d161c4850e9670fe477cab75ede601dfb5027d59e21985dde9f")
  (:PATH "raw/precompile-quotient-guard/cbor-float-narrow.revised.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/precompile-quotient-guard/cbor-float-narrow.revised.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/precompile-quotient-guard/reading-note.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/precompile-quotient-guard/reading-note.lisp")
   :BYTES 408 :SHA256
   "9922e4865885b75a16f3caae6d8fe66828956af52ba6377a677a033bb47453d8")
  (:PATH "raw/readings/coverage-review-draft.md.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/coverage-review-draft.md.txt")
   :BYTES 9730 :SHA256
   "7f19d6a1d35c4f068b3111ca47770a342dd9de80664bc9fcc6d52416b863a5c5")
  (:PATH "raw/readings/runtime-review-draft.md.txt" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/runtime-review-draft.md.txt")
   :BYTES 14622 :SHA256
   "2f43e7bc3d9c6c83cb9f5f8318b1983f0a530a41e0d35e6b236a64e48a1c03e6"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
