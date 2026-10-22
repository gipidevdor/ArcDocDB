(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "r4-product-integration" :RECORD-PATH
   "processes/r4-product-integration/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((193) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R4-fasl/\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "wire-regression-red-92fbfbbc" :RECORD-PATH
   "processes/wire-regression-red-92fbfbbc/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((72) BASE-CHAR
       . "spikes/out/creazione-relativa-publication/fresh-consumer-runner.lisp.txt")
    #A((5) BASE-CHAR . "--out")
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-before-fixture-R1/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "wire-regression-green-6c409f59" :RECORD-PATH
   "processes/wire-regression-green-6c409f59/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((72) BASE-CHAR
       . "spikes/out/creazione-relativa-publication/fresh-consumer-runner.lisp.txt")
    #A((5) BASE-CHAR . "--out")
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-after-fixture-R1/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "c4-selftest-r1-6c409f59" :RECORD-PATH
   "processes/c4-selftest-r1-6c409f59/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((96) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "c4-selftest-r2-integration" :RECORD-PATH
   "processes/c4-selftest-r2-integration/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((96) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/supplement-README.md.txt")
   :BYTES 4523 :SHA256
   "82a69f1895ff2ac526be61b08a6a15c3331a0d88ef8bfe0439bddda8345c03e7")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/supplement-manifest-R1.lisp")
   :BYTES 36115 :SHA256
   "73a30c2b2d64414d72fc09aa281f77828a23b2f2714d874aeeca3ac3ce45a1d6")
  (:PATH "collection-source.lisp" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "fixtures/wire-after/fresh-coverage-consumer/child.stderr" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-after-fixture-R1/fresh-coverage-consumer/child.stderr")
   :BYTES 865 :SHA256
   "5382786a785dc0dfcdfe9f526ae2b069679cb5333af292660bfe8c90eaabb10a")
  (:PATH "fixtures/wire-after/fresh-coverage-consumer/child.stdout" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-after-fixture-R1/fresh-coverage-consumer/child.stdout")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/wire-after/fresh-coverage-consumer/roundtrip.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-after-fixture-R1/fresh-coverage-consumer/roundtrip.lisp")
   :BYTES 676 :SHA256
   "b2874441c0f98eebb6b0131758ece99b0cedebcefa5917d68809a214fe116323")
  (:PATH "fixtures/wire-after/fresh-coverage-consumer/skipped-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-after-fixture-R1/fresh-coverage-consumer/skipped-result.lisp")
   :BYTES 676 :SHA256
   "acb007c6fdabf4321174ad0e2beb4999cb1ed643d15ccf5605225bb7cc9fbd79")
  (:PATH "fixtures/wire-after/fresh-coverage-consumer/verify-result.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-after-fixture-R1/fresh-coverage-consumer/verify-result.lisp")
   :BYTES 676 :SHA256
   "b2874441c0f98eebb6b0131758ece99b0cedebcefa5917d68809a214fe116323")
  (:PATH "fixtures/wire-before/fresh-coverage-consumer/child.stderr" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-before-fixture-R1/fresh-coverage-consumer/child.stderr")
   :BYTES 10159 :SHA256
   "01fec52ab9019083d07c924850dd498990248611025991631dec7524b069822e")
  (:PATH "fixtures/wire-before/fresh-coverage-consumer/child.stdout" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-before-fixture-R1/fresh-coverage-consumer/child.stdout")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/wire-before/fresh-coverage-consumer/verify-result.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-before-fixture-R1/fresh-coverage-consumer/verify-result.lisp")
   :BYTES 676 :SHA256
   "b2874441c0f98eebb6b0131758ece99b0cedebcefa5917d68809a214fe116323")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/manifest.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/manifest.lisp")
   :BYTES 9516 :SHA256
   "6c81ed3bb8ef59d85eed1327432a3618f6f2fa7321231e215d96f6ca5d5dc989")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/c4-driver.stderr" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/c4-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/c4-driver.stdout" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/c4-driver.stdout")
   :BYTES 113 :SHA256
   "accd85553cd1ff9661f469aea44b19c522417e9036085e7a8fa23a1a4f2649c0")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/child-result.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/child-result.lisp")
   :BYTES 3313 :SHA256
   "26745138f039902bada30effcd8f6963dd04f8d537faa81f6c30197f14c5918f")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/c4/conservazione.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/c4/conservazione.lisp")
   :BYTES 1085 :SHA256
   "c66a26eb8b734f75cf967c918477ff6dae9aa2e84f71dac49f78687c0b88471a")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/c4/report.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/c4/report.lisp")
   :BYTES 310 :SHA256
   "dcdededc68181c5dc987bb7fe8380bebc220cf80b9f79c4806dce933f145aef4")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/c4/report.lisp.gz"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/c4/report.lisp.gz")
   :BYTES 95360 :SHA256
   "5c30350d6c64e242ac8f630798dc752197c03ef9a389a9058c09903bb0c9ce5f")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/job/conservazione.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/job/conservazione.lisp")
   :BYTES 1087 :SHA256
   "2a4574e9a7f764091d0919e9dde0a51c346dc3c0a6eac768a8f0618002753490")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/job/report.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/job/report.lisp")
   :BYTES 310 :SHA256
   "408d3846546c93dd90a72647a78c421b94a321cd44b7c803e3c2225fde8168c4")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/job/report.lisp.gz"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/job/report.lisp.gz")
   :BYTES 84468 :SHA256
   "30b1c1fd8a23d1b064ebbe511763a0482f7d1abfe67333fe26dbbf5231bf08c1")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-audit/raw/commands/links/conservazione.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/links/conservazione.lisp")
   :BYTES 1091 :SHA256
   "f6ae9a5cf47731532c3cc89c5965dc2b18355512cefd06bdce849d330192cb7e")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/links/report.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/links/report.lisp")
   :BYTES 310 :SHA256
   "0f94292e48fde17af6122c34a7ec5b78cb39f1034bbd846bf5eb95b7b63c9662")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/links/report.lisp.gz"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/links/report.lisp.gz")
   :BYTES 84460 :SHA256
   "694d27f8cf9550293588512fb1515cb75d9987403c597796a7ec7b00ebed5d28")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-audit/raw/commands/lint/conservazione.lisp"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/lint/conservazione.lisp")
   :BYTES 1089 :SHA256
   "68ddd21b21275f097b1f31dc2d92d0c697f457fbd0c4833984244cee330ab954")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/lint/report.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/lint/report.lisp")
   :BYTES 310 :SHA256
   "29b5dc826ef4f031ba66fc4c36cbe538ee8d7457fbdd97cb7c8afe548959de57")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/lint/report.lisp.gz"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/lint/report.lisp.gz")
   :BYTES 84450 :SHA256
   "303a279b1c2c271b098f384e23a33dcfee29964e52b63292de79293f75983173")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-audit/raw/commands/trace/conservazione.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/trace/conservazione.lisp")
   :BYTES 1091 :SHA256
   "04b60fc1a03f902470e67fba35b19f03f9c52ac537d272e789ef8c80995b23fe")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/trace/report.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/trace/report.lisp")
   :BYTES 310 :SHA256
   "b752c6cf190bf8b01d80a59283ee3d9241c53ba7c299263d2ba04a9286912e78")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/commands/trace/report.lisp.gz"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/commands/trace/report.lisp.gz")
   :BYTES 84470 :SHA256
   "0609ddb4e492e25eefc6abf16a8b098c77602ff5005278524c48f103c73eeb8a")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/installation.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/installation.lisp")
   :BYTES 467 :SHA256
   "ef41d17220343dbfb5b3be875742e4ced45543735491e9949bd9d1f938539049")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/job-driver.stderr" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/job-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/job-driver.stdout" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/job-driver.stdout")
   :BYTES 375 :SHA256
   "4fdbe37b423024a6591a7aa7807ef9a5e8ae7b7d951a256dd74b2b45b8953d08")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/links-driver.stderr" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/links-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/links-driver.stdout" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/links-driver.stdout")
   :BYTES 321 :SHA256
   "a95694d4afcf1d2a44f630cec49f25079ba57e2c3c8a2ad3faaff132b682e740")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/links.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/links.lisp")
   :BYTES 181 :SHA256
   "1caf34b41eea89a6520e61ba283b7c2ebdf728d49cf45160198e1b984b991c91")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/lint-driver.stderr" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/lint-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/lint-driver.stdout" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/lint-driver.stdout")
   :BYTES 314 :SHA256
   "387f8efb68602d535b763670cff6cd044b5fca420c52944b7a83c89edbd23e9e")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/lint.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/lint.lisp")
   :BYTES 354 :SHA256
   "e06e92f8ef964928261c5f1c4a396fb3c27735203922b84009832641139b686e")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/trace-driver.stderr" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/trace-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/trace-driver.stdout" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/trace-driver.stdout")
   :BYTES 319 :SHA256
   "e7847b1847f92af08ce40758afbe5d76bb226ffb1fe8e3ad5bc52978d22dac32")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/raw/trace.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/raw/trace.lisp")
   :BYTES 1607 :SHA256
   "49759e0582754e9db6de3c30ddeb1af77b8ec3514a69efc48a00e7d734bcb5c0")
  (:PATH "old-ci-Q1/ci-39817860664-1-audit/result.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-audit/result.lisp")
   :BYTES 8407 :SHA256
   "1f4908d413e93c739dac77825e34b150141dde575b79597b80e407deca923043")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/manifest.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/manifest.lisp")
   :BYTES 7935 :SHA256
   "0a0afffc68139841d301f8670cc4ea212b6af7dbfd96da6a2fcd56672409f3d9")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/child-result.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/child-result.lisp")
   :BYTES 140 :SHA256
   "22824bfedad9bffeaa12cb19cec7a38349d3ad8bef65180d8948318d468040c0")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-coverage/raw/commands/job/conservazione.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/commands/job/conservazione.lisp")
   :BYTES 1093 :SHA256
   "8e4206492af0331e0c6b98aa28be29ca0fb412b1c8fadb4f7ca86c341483d676")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/commands/job/report.lisp"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/commands/job/report.lisp")
   :BYTES 310 :SHA256
   "a3a29eaea9583585ccb48bb7360f1330ebf095e4ef6eef227189ff49eece2025")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/commands/job/report.lisp.gz"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/commands/job/report.lisp.gz")
   :BYTES 84525 :SHA256
   "e77b70bfba57872aaeb121d93397402fe1158547d1e02c3aa50d8c7132affcf1")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage-tests.events.lisp"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage-tests.events.lisp")
   :BYTES 327 :SHA256
   "3876087514e502be21aea7df7f417547a60021a8c5bd14182d326cef96c94ed9")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage-tests.events.lisp.gz"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage-tests.events.lisp.gz")
   :BYTES 106404 :SHA256
   "766bb8a99a316ad92971fa7827604df2d007644438fe8893bc0ac5dd50ebf4f0")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage-tests.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage-tests.lisp")
   :BYTES 318 :SHA256
   "ad57e59c857723b6d35ad0dd64356077ffd59d5e281530e0632a46ddeaf73d3e")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage-tests.lisp.gz"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage-tests.lisp.gz")
   :BYTES 50165 :SHA256
   "4a95a4b59f4387dcd036f9add6874d810c15dc18fbe4d0362a7e4c68eedbd5d9")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage.expected.lisp"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage.expected.lisp")
   :BYTES 45633 :SHA256
   "992932ca7c3652995ba716213f3578b0f9f37efff1fd3207d57f892ec45299ad")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage.lcov" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage.lcov")
   :BYTES 312 :SHA256
   "39c53b942f52213a7afb3e8615f8a9e18da24511d1731c4b547efcda32cbc9be")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage.lcov.gz" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage.lcov.gz")
   :BYTES 24949 :SHA256
   "0d20182c8a93e2dbd4deb5030a1fba2be71cc10e5ba779d116d64c6b6890aba0")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage.stderr.log" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage.stderr.log")
   :BYTES 320 :SHA256
   "3087aae41207d43e0a5f0bbd4cf6f00d0792952b77415c6b6c6b8987eba59438")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage.stderr.log.gz"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage.stderr.log.gz")
   :BYTES 114146 :SHA256
   "e5be0a338a497f6cf4423fb6d13d258a64945faa633f195a19fb4626ca9749b5")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage.stdout.log" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage.stdout.log")
   :BYTES 318 :SHA256
   "5e708cd9c95fddc462adb7137832ce032b69bcc560ace17e4f4525e10d8c8f87")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/coverage.stdout.log.gz"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/coverage.stdout.log.gz")
   :BYTES 47133 :SHA256
   "738f2298681cc6719909f7b3a386420ddf873510e726a628fef198f36e714324")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/installation.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/installation.lisp")
   :BYTES 467 :SHA256
   "ef41d17220343dbfb5b3be875742e4ced45543735491e9949bd9d1f938539049")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/job-driver.stderr" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/job-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/raw/job-driver.stdout" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/raw/job-driver.stdout")
   :BYTES 388 :SHA256
   "5a7c1cf35b7db6b8b0de29422144ae3018c7dea77eece04dfb6b15f768d2d76f")
  (:PATH "old-ci-Q1/ci-39817860664-1-coverage/result.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-coverage/result.lisp")
   :BYTES 5282 :SHA256
   "407d18e34bcf18eeaf9561c6033170f693ad59ca9c43f67d46e9923eefacddb5")
  (:PATH "old-ci-Q1/ci-39817860664-1-plan/manifest.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-plan/manifest.lisp")
   :BYTES 5041 :SHA256
   "72a578343f6bea5943bf4b732f23ca7eb7f3e71ed9fe3233ed59e9eb946e53d6")
  (:PATH "old-ci-Q1/ci-39817860664-1-plan/raw/installation.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-plan/raw/installation.lisp")
   :BYTES 467 :SHA256
   "ef41d17220343dbfb5b3be875742e4ced45543735491e9949bd9d1f938539049")
  (:PATH "old-ci-Q1/ci-39817860664-1-plan/raw/sources.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-plan/raw/sources.lisp")
   :BYTES 4342 :SHA256
   "7d36d1a28d3fdf40abebd2f2c1f2561e70d4696ce56624c19f0364d295009ca1")
  (:PATH "old-ci-Q1/ci-39817860664-1-plan/result.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-plan/result.lisp")
   :BYTES 9017 :SHA256
   "a428bb8881486e84214be440d03fa406a15bd54013fe9e7bbcb450e30cb09aa5")
  (:PATH "old-ci-Q1/ci-39817860664-1-seal/manifest.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-seal/manifest.lisp")
   :BYTES 5037 :SHA256
   "67686a072583a0327ed2f3aaa56b9d95c3e74d6da6237641f6f1a15f8ab284dc")
  (:PATH "old-ci-Q1/ci-39817860664-1-seal/raw/report.md" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-seal/raw/report.md")
   :BYTES 8322 :SHA256
   "de127acd695fb443ddfe6f20296253713d1bd5f428f688ac4ef2d3337f539b4c")
  (:PATH "old-ci-Q1/ci-39817860664-1-seal/raw/summary.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-seal/raw/summary.lisp")
   :BYTES 13123 :SHA256
   "46c7786aa35a3467515b027fceafd10055bde40b4fd5278a1bc70a295cd4c2ab")
  (:PATH "old-ci-Q1/ci-39817860664-1-seal/result.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-seal/result.lisp")
   :BYTES 17806 :SHA256
   "f11522d57d115374b1c44a5f002f155ff998a71a70d13e185c99e9220b9251a6")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/manifest.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/manifest.lisp")
   :BYTES 7001 :SHA256
   "f9030252f927aad2fb478c74d1ca945081139d8209b3ed93d84dcc2f8db4d951")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/child-result.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/child-result.lisp")
   :BYTES 316 :SHA256
   "fffc7b20f7ed81b5445fee63246c35459c5490f3eecf1ec9fa941e35c01e4f66")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/child-result.lisp.gz"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/child-result.lisp.gz")
   :BYTES 50169 :SHA256
   "9973b45483336b0b889365588f9c383886473c2dae61ab464402d8d68f988a9a")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-verify-linux/raw/commands/job/conservazione.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/commands/job/conservazione.lisp")
   :BYTES 1101 :SHA256
   "c47abe112e4c97a4bf0d3ee9ad110bfec6ac1f14f07744eec8a1fcb2717e197f")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/commands/job/report.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/commands/job/report.lisp")
   :BYTES 311 :SHA256
   "c6d0cd363430b36240e31a0e49e70bbf15c750f8cd116dd898200b947c0d99f0")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-verify-linux/raw/commands/job/report.lisp.gz"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/commands/job/report.lisp.gz")
   :BYTES 119475 :SHA256
   "94ba360f1d6fd63b02516ceaa72e9a8e7757bb5347c08f33e0cbc3c86a82bc4e")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/installation.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/installation.lisp")
   :BYTES 467 :SHA256
   "ef41d17220343dbfb5b3be875742e4ced45543735491e9949bd9d1f938539049")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/job-driver.stderr"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/job-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/job-driver.stdout"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/job-driver.stdout")
   :BYTES 396 :SHA256
   "e5b451d38acddd3caa6f12fa9971d6b1f275deb97b921b7ecce10872a929f15c")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/tests.events.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/tests.events.lisp")
   :BYTES 318 :SHA256
   "9f4f0f3fdff8d3dc80dfe8dd13b2633c8c71d43eb7b2afe1c46e828b43e8ea0a")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/tests.events.lisp.gz"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/tests.events.lisp.gz")
   :BYTES 106661 :SHA256
   "68ea9ef426447d15fc72fc7092e5ec8a61c72791be83c5f06d71854c82b9d16d")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/tests.expected.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/tests.expected.lisp")
   :BYTES 7570 :SHA256
   "d77d6ba389bf9171194846534eac9a039f74b081bf41de688b1bb235ad92e6a6")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/tests.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/tests.lisp")
   :BYTES 309 :SHA256
   "d79944fabeb0dcaf70c30cc6f833779ec012607a059d34784da1ed6c32c93179")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/raw/tests.lisp.gz" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/raw/tests.lisp.gz")
   :BYTES 50169 :SHA256
   "9973b45483336b0b889365588f9c383886473c2dae61ab464402d8d68f988a9a")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-linux/result.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-linux/result.lisp")
   :BYTES 5260 :SHA256
   "cfefd61181f01f5d6ef2758f1017f8f92c7e565e8dfdb32dc90451f2394fe9fc")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/manifest.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/manifest.lisp")
   :BYTES 7001 :SHA256
   "96e8c54b1ec49353836aaaebc5a88815c5a0d6eba1b8782430586e0663ee94c0")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/child-result.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/child-result.lisp")
   :BYTES 316 :SHA256
   "3a8c80b7996374968581e517e8f05e9933a3b92d1397c8d527eb315521d4c237")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/child-result.lisp.gz"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/child-result.lisp.gz")
   :BYTES 55951 :SHA256
   "94021ad347b591cd341a812e398b22273ce7848e4d3438ca1fa92d1f9db7b6bb")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-verify-macos/raw/commands/job/conservazione.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/commands/job/conservazione.lisp")
   :BYTES 1106 :SHA256
   "28405bbeb1fc01484092c50615744903897751033d2b60c64df8acf0a5993bfa")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/commands/job/report.lisp"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/commands/job/report.lisp")
   :BYTES 311 :SHA256
   "bc9ec578b4729a0ceca021c88f12b06e673dccc4fa1b9a15cea2a177fc694555")
  (:PATH
   "old-ci-Q1/ci-39817860664-1-verify-macos/raw/commands/job/report.lisp.gz"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/commands/job/report.lisp.gz")
   :BYTES 119848 :SHA256
   "a037344034811a81f98d47f5fc35462e1bfa7ff9433bd385bc2ef8a8233d5879")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/installation.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/installation.lisp")
   :BYTES 593 :SHA256
   "4263c0e006c1f971df84355579773cfb8cac52b42745f335a0cefd9b1fb8c60d")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/job-driver.stderr"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/job-driver.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/job-driver.stdout"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/job-driver.stdout")
   :BYTES 400 :SHA256
   "95b013341e15052f3648b56d5a0c9bf8557b5b5f9675a5e715e261fd93b449d9")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/tests.events.lisp"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/tests.events.lisp")
   :BYTES 318 :SHA256
   "9a20300f450c0bf23cafd609f623e68f544f60c8bbef35faf0ccae9a92879abf")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/tests.events.lisp.gz"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/tests.events.lisp.gz")
   :BYTES 121115 :SHA256
   "b4e8241fbf6495734ecaa0a4c84db0aff2cd948e31e39695051082ab6a30c613")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/tests.expected.lisp"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/tests.expected.lisp")
   :BYTES 7570 :SHA256
   "d77d6ba389bf9171194846534eac9a039f74b081bf41de688b1bb235ad92e6a6")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/tests.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/tests.lisp")
   :BYTES 309 :SHA256
   "b9c8b57f807cec4d4b2723be58d57fbc71be6fae32293f2d99aa81fe9c7080b3")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/raw/tests.lisp.gz" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/raw/tests.lisp.gz")
   :BYTES 55951 :SHA256
   "94021ad347b591cd341a812e398b22273ce7848e4d3438ca1fa92d1f9db7b6bb")
  (:PATH "old-ci-Q1/ci-39817860664-1-verify-macos/result.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/ci-39817860664-1-verify-macos/result.lisp")
   :BYTES 5264 :SHA256
   "2ed0e5b4fee8de0a483469697f717b6b2e2c467b61a5063304f33df93eff043e")
  (:PATH "old-ci-Q1/failed-jobs.log" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-PR20/failed-jobs.log")
   :BYTES 2989 :SHA256
   "4680e78d673e5847cffcca8b93f2412ba115c6514200cf6ca3c9f3cfccd535a8")
  (:PATH "procedures/fresh-consumer-runner.lisp.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/fresh-consumer-runner.lisp.txt")
   :BYTES 2537 :SHA256
   "6ec8ae530051d4609c859d3f954aacc1fff846fa806262bbe45e270158ba86fa")
  (:PATH "procedures/supplement-manifest-builder.lisp.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/supplement-manifest-builder.lisp.txt")
   :BYTES 9205 :SHA256
   "869fca4e7b8027a658fec8d8b089731c8ebdc11b4e97861d7509e621f0ae9179")
  (:PATH "processes/c4-selftest-r1-6c409f59/conservazione.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-selftest-R1/conservazione.lisp")
   :BYTES 1192 :SHA256
   "18a19e1faafe6d538340245d89cb433dd82dee50634203ce51a6589c4e1f03f9")
  (:PATH "processes/c4-selftest-r1-6c409f59/report.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-selftest-R1/report.lisp")
   :BYTES 267896 :SHA256
   "925f140fdb5b1ed2ca16f7e86b68ac88b9eb347901369398f1238e2588a8d253")
  (:PATH "processes/c4-selftest-r2-integration/conservazione.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-selftest-R2/conservazione.lisp")
   :BYTES 1192 :SHA256
   "350ebe8971b0ea0960ab0534aeb680e8b8357a1f61c973fbd9d46d6b8b9e7c4a")
  (:PATH "processes/c4-selftest-r2-integration/report.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-selftest-R2/report.lisp")
   :BYTES 268114 :SHA256
   "2546c28b7081fe11a538ddaa2a991a0967a21a5055cd9f1c8e9aebd0f6845a90")
  (:PATH "processes/r4-product-integration/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R4/conservazione.lisp")
   :BYTES 1740 :SHA256
   "a0bd26382cbaafbcd820ad3bb8324aef0b712b143f1b953cde467da3cc7492c3")
  (:PATH "processes/r4-product-integration/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R4/report.lisp")
   :BYTES 317 :SHA256
   "1e8125f15ea25a64e797a36842417bfa07166cc1800908601a1d2701919d2af3")
  (:PATH "processes/r4-product-integration/report.lisp.gz" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R4/report.lisp.gz")
   :BYTES 250248 :SHA256
   "84a24f31aa3575131caf45f7e091174e949fd47d5c6d9bdfa1edc2171f2b45a7")
  (:PATH "processes/wire-regression-green-6c409f59/conservazione.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-after-R1/conservazione.lisp")
   :BYTES 1186 :SHA256
   "8598c3a768bbd4d64bf773e012e749e2e50a1d8898e1310ccfaa00f253ebc10e")
  (:PATH "processes/wire-regression-green-6c409f59/report.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-after-R1/report.lisp")
   :BYTES 267415 :SHA256
   "d0477122e8744e0ef96b58618d2a6572d948d23d30680e78eacd318d1b89017b")
  (:PATH "processes/wire-regression-red-92fbfbbc/conservazione.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-before-R1/conservazione.lisp")
   :BYTES 1188 :SHA256
   "bb17b3ba8daebbbe2a86cb2a677013fd7bc51e7aeeda23a375558573b811cf07")
  (:PATH "processes/wire-regression-red-92fbfbbc/report.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-ci-wire-before-R1/report.lisp")
   :BYTES 267874 :SHA256
   "bbd2348e5dc2f96d79da023326f86e22a1ef34c2c8eaada7b9bd38365e8b06b4")
  (:PATH "selftest-r1/boundaries.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/boundaries.lisp")
   :BYTES 617 :SHA256
   "e3dde1942bea1dc6c4d6312abb8a4c4c800eb4e22260e490536ab03c6a0bd84d")
  (:PATH "selftest-r1/conditions.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/conditions.lisp")
   :BYTES 663 :SHA256
   "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f")
  (:PATH "selftest-r1/data.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/data.lisp")
   :BYTES 3087 :SHA256
   "23a929b36fdc9bd4545a53b247bf5726b89f3c57258b7e408f0d3a82bd83b663")
  (:PATH "selftest-r1/data/fresh-coverage-consumer/child.stderr" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/data/fresh-coverage-consumer/child.stderr")
   :BYTES 865 :SHA256
   "5382786a785dc0dfcdfe9f526ae2b069679cb5333af292660bfe8c90eaabb10a")
  (:PATH "selftest-r1/data/fresh-coverage-consumer/child.stdout" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/data/fresh-coverage-consumer/child.stdout")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "selftest-r1/data/fresh-coverage-consumer/roundtrip.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/data/fresh-coverage-consumer/roundtrip.lisp")
   :BYTES 676 :SHA256
   "b2874441c0f98eebb6b0131758ece99b0cedebcefa5917d68809a214fe116323")
  (:PATH "selftest-r1/data/fresh-coverage-consumer/skipped-result.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/data/fresh-coverage-consumer/skipped-result.lisp")
   :BYTES 676 :SHA256
   "acb007c6fdabf4321174ad0e2beb4999cb1ed643d15ccf5605225bb7cc9fbd79")
  (:PATH "selftest-r1/data/fresh-coverage-consumer/verify-result.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/data/fresh-coverage-consumer/verify-result.lisp")
   :BYTES 676 :SHA256
   "b2874441c0f98eebb6b0131758ece99b0cedebcefa5917d68809a214fe116323")
  (:PATH "selftest-r1/measure.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/measure.lisp")
   :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "selftest-r1/report.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/report.lisp")
   :BYTES 548 :SHA256
   "22cb3c22916ede7cc6b0f5b2746dd174c99b5f56c62504c44afed725cd2635bc")
  (:PATH "selftest-r1/tests.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/tests.lisp")
   :BYTES 2085 :SHA256
   "ae0d5fa207e288d093b22cbd6e01d8f2cb4223566da80e040c2c2ae837ccae4e")
  (:PATH "selftest-r1/workflow.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R1/workflow.lisp")
   :BYTES 27556 :SHA256
   "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269")
  (:PATH "selftest-r2/boundaries.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/boundaries.lisp")
   :BYTES 914 :SHA256
   "b4a90356b0131ee2672a0777509a5483e592f019cc44b3fa8ce5907d58624927")
  (:PATH "selftest-r2/conditions.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/conditions.lisp")
   :BYTES 663 :SHA256
   "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f")
  (:PATH "selftest-r2/data.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/data.lisp")
   :BYTES 3214 :SHA256
   "1b61eec62d79d44cb0543b91c83c37d8c3ef787f125208c0093df05d63717fb2")
  (:PATH "selftest-r2/data/fresh-coverage-consumer/child.stderr" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/data/fresh-coverage-consumer/child.stderr")
   :BYTES 865 :SHA256
   "5382786a785dc0dfcdfe9f526ae2b069679cb5333af292660bfe8c90eaabb10a")
  (:PATH "selftest-r2/data/fresh-coverage-consumer/child.stdout" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/data/fresh-coverage-consumer/child.stdout")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "selftest-r2/data/fresh-coverage-consumer/roundtrip.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/data/fresh-coverage-consumer/roundtrip.lisp")
   :BYTES 676 :SHA256
   "b2874441c0f98eebb6b0131758ece99b0cedebcefa5917d68809a214fe116323")
  (:PATH "selftest-r2/data/fresh-coverage-consumer/skipped-result.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/data/fresh-coverage-consumer/skipped-result.lisp")
   :BYTES 676 :SHA256
   "acb007c6fdabf4321174ad0e2beb4999cb1ed643d15ccf5605225bb7cc9fbd79")
  (:PATH "selftest-r2/data/fresh-coverage-consumer/verify-result.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/data/fresh-coverage-consumer/verify-result.lisp")
   :BYTES 676 :SHA256
   "b2874441c0f98eebb6b0131758ece99b0cedebcefa5917d68809a214fe116323")
  (:PATH "selftest-r2/measure.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/measure.lisp")
   :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "selftest-r2/report.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/report.lisp")
   :BYTES 548 :SHA256
   "d1152a1e60ef605ba379f49986521852ea70110bbc02561e306679a7a0ab320d")
  (:PATH "selftest-r2/tests.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/tests.lisp")
   :BYTES 2085 :SHA256
   "ae0d5fa207e288d093b22cbd6e01d8f2cb4223566da80e040c2c2ae837ccae4e")
  (:PATH "selftest-r2/workflow.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-serie-create-relative-ci-wire-selftest-R2/workflow.lisp")
   :BYTES 27556 :SHA256
   "768d05134ef33bacb9190bb57a36cf5908934399e98cc6d962019c3d8b2ea269"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
