(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "trace-a" :RECORD-PATH "processes/trace-a/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-self" :RECORD-PATH "processes/coverage-self/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((34) BASE-CHAR . "spikes/out/closed-coverage-self-a/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-a" :RECORD-PATH "processes/coverage-a/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((29) BASE-CHAR . "spikes/out/closed-coverage-a/")
    #A((15) BASE-CHAR . "recovery-closed"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-b" :RECORD-PATH "processes/coverage-b/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((29) BASE-CHAR . "spikes/out/closed-coverage-b/")
    #A((15) BASE-CHAR . "recovery-closed"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "parentheses" :RECORD-PATH "processes/parentheses/report.lisp"
   :COMMAND
   (#A((7) BASE-CHAR . "python3") #A((2) BASE-CHAR . "-c")
    #A((652) BASE-CHAR . "from pathlib import Path
errors=[]
for path in sorted(Path(\"tests/recovery-closed\").glob(\"*.lisp\")):
 text=path.read_text(); depth=0; string=False; escape=False; comment=False; line=1
 for c in text:
  if c==\"\\n\": line+=1; comment=False
  if comment: continue
  if string:
   if escape: escape=False
   elif c==\"\\\\\": escape=True
   elif c==chr(34): string=False
  elif c==\";\": comment=True
  elif c==chr(34): string=True
  elif c==\"(\": depth+=1
  elif c==\")\":
   depth-=1
   if depth<0: errors.append((str(path),line,\"extra close\")); depth=0
 if depth or string: errors.append((str(path),line,depth,string))
print(errors)
raise SystemExit(bool(errors))"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-c" :RECORD-PATH "processes/coverage-c/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((29) BASE-CHAR . "spikes/out/closed-coverage-c/")
    #A((15) BASE-CHAR . "recovery-closed"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-d" :RECORD-PATH "processes/coverage-d/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((29) BASE-CHAR . "spikes/out/closed-coverage-d/")
    #A((15) BASE-CHAR . "recovery-closed"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "diagnostic" :RECORD-PATH "processes/diagnostic/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((29) BASE-CHAR . "tools/get-series-capture.lisp")
    #A((2) BASE-CHAR . "--") #A((4) BASE-CHAR . "sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((37) BASE-CHAR . "spikes/out/closed-input/diagnose.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-b" :RECORD-PATH "processes/trace-b/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-e" :RECORD-PATH "processes/coverage-e/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((29) BASE-CHAR . "spikes/out/closed-coverage-e/")
    #A((15) BASE-CHAR . "recovery-closed"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "check" :RECORD-PATH "processes/check/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "process-status" :RECORD-PATH "processes/process-status/report.lisp"
   :COMMAND
   (#A((7) BASE-CHAR . "/bin/sh") #A((2) BASE-CHAR . "-c")
    #A((125) BASE-CHAR
       . "show() { ps -p \"$1\" -o pid=,ppid=,etime=,pcpu=,command=; for child in $(pgrep -P \"$1\"); do show \"$child\"; done; }; show 95398"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "integration" :RECORD-PATH "processes/integration/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "build")
    #A((4) BASE-CHAR . "lint") #A((13) BASE-CHAR . "lint-selftest")
    #A((5) BASE-CHAR . "trace"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-input/manifest.lisp")
   :BYTES 15737 :SHA256
   "6bc595fb9acdff56d821f9b777e6371217e6e6bef49afc3314e43257859eb343")
  (:PATH "collection-source.lisp" :SOURCE
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "coverage/d/0dcc1d422f56497ba2609314e09eb0ed.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/0dcc1d422f56497ba2609314e09eb0ed.html")
   :BYTES 23931 :SHA256
   "633cf27b425255bb893b0f895fb48cb5566db06d16c4544c4a3ad176f2790ffe")
  (:PATH "coverage/d/35e6afbcef30a12946289692057bf773.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/35e6afbcef30a12946289692057bf773.html")
   :BYTES 11595 :SHA256
   "96a4c4089e8c9193f80b8238c812c337c3ad505fbe8bec50ef5a91ab210224b2")
  (:PATH "coverage/d/4fbc1871b248651a74dea5bc9f413181.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/4fbc1871b248651a74dea5bc9f413181.html")
   :BYTES 18230 :SHA256
   "eb0614e6b2c132e77f47e55902c2e3706342b169f6af99635bf30f92d5c39302")
  (:PATH "coverage/d/6951e49dd861c8a95023ea189c53103a.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/6951e49dd861c8a95023ea189c53103a.html")
   :BYTES 27412 :SHA256
   "3350a6da6f549e62761c1fd3d861e9680db4a069d343f88b432e012e7f58e8d2")
  (:PATH "coverage/d/a3ffdc1cb58bea8406f67845917f6bc5.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/a3ffdc1cb58bea8406f67845917f6bc5.html")
   :BYTES 20922 :SHA256
   "4456fc357eda09fe6c7594bb2694c725f6c6ba37d821c84aea65f0edb687e0cd")
  (:PATH "coverage/d/b076dc5d3deba5b604a603b306025c01.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/b076dc5d3deba5b604a603b306025c01.html")
   :BYTES 16199 :SHA256
   "bc4f0004798bf3d68c4afe803660228e091f72a5efdc459318bf45115b24f269")
  (:PATH "coverage/d/b25bba66eec7fa02b00e3b19f8ff75ce.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/b25bba66eec7fa02b00e3b19f8ff75ce.html")
   :BYTES 9493 :SHA256
   "56604d5ed00dd23bad6a090cd366b60096399d632b1770602841d5dc3379127a")
  (:PATH "coverage/d/cover-index.html" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/cover-index.html")
   :BYTES 3033 :SHA256
   "4259afaecd7074b9209eaca00de2ed475de75e5eca7fd882e92e557a46518e94")
  (:PATH "coverage/d/d1485ba3344fcc8599fa64460b85b3c4.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-d/d1485ba3344fcc8599fa64460b85b3c4.html")
   :BYTES 17396 :SHA256
   "f020f84e93bde8b8c0ffd78f89d26734fd982302e4a4f1799f7f3157ad34c1e4")
  (:PATH "coverage/e/0dcc1d422f56497ba2609314e09eb0ed.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/0dcc1d422f56497ba2609314e09eb0ed.html")
   :BYTES 23931 :SHA256
   "633cf27b425255bb893b0f895fb48cb5566db06d16c4544c4a3ad176f2790ffe")
  (:PATH "coverage/e/35e6afbcef30a12946289692057bf773.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/35e6afbcef30a12946289692057bf773.html")
   :BYTES 11537 :SHA256
   "a2bb542dc0c0fd72e2c0766bca86d25af595c4ed7d6b0dbbab3d75098a6a3037")
  (:PATH "coverage/e/4fbc1871b248651a74dea5bc9f413181.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/4fbc1871b248651a74dea5bc9f413181.html")
   :BYTES 18172 :SHA256
   "a1acf92b7b74d4a8b975bd40b1fdb964911cbbaca5aed60b26ee1ab4f0fb0a2a")
  (:PATH "coverage/e/6951e49dd861c8a95023ea189c53103a.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/6951e49dd861c8a95023ea189c53103a.html")
   :BYTES 27180 :SHA256
   "62e7858ba92ebcc148ea7fd6ab64908f15e583b4ef031fff1d7ec72df6c5628f")
  (:PATH "coverage/e/a3ffdc1cb58bea8406f67845917f6bc5.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/a3ffdc1cb58bea8406f67845917f6bc5.html")
   :BYTES 20634 :SHA256
   "3ce10a6c06f6c5924b4f7372c02b291d3859b238a7a9b66f30d2e3c2e2c3a65c")
  (:PATH "coverage/e/b076dc5d3deba5b604a603b306025c01.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/b076dc5d3deba5b604a603b306025c01.html")
   :BYTES 16199 :SHA256
   "bc4f0004798bf3d68c4afe803660228e091f72a5efdc459318bf45115b24f269")
  (:PATH "coverage/e/b25bba66eec7fa02b00e3b19f8ff75ce.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/b25bba66eec7fa02b00e3b19f8ff75ce.html")
   :BYTES 9493 :SHA256
   "56604d5ed00dd23bad6a090cd366b60096399d632b1770602841d5dc3379127a")
  (:PATH "coverage/e/cover-index.html" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/cover-index.html")
   :BYTES 3036 :SHA256
   "3769b27bd224b45cb3b90f450336b49419058a9df8d1dd89b829d89557176c27")
  (:PATH "coverage/e/d1485ba3344fcc8599fa64460b85b3c4.html" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-e/d1485ba3344fcc8599fa64460b85b3c4.html")
   :BYTES 17107 :SHA256
   "1f607f14a9c6c61c3632d5b77495ccf95206630069474170941615ac0da99e6d")
  (:PATH "coverage/self/88fd8f8f26066fd535cbeccdbe691838.html" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-self-a/88fd8f8f26066fd535cbeccdbe691838.html")
   :BYTES 2816 :SHA256
   "0569993a3a65d266abe4b1dcaf246e3bd0d243fd9b0a5376aba8a467b14ea21f")
  (:PATH "coverage/self/cover-index.html" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-self-a/cover-index.html")
   :BYTES 1776 :SHA256
   "a06217f16e8acd4eebb8c89f270fe4d79067e04e5fb249441b2f8e567c0b55ad")
  (:PATH "coverage/self/coverage-fixture.lisp.txt" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-coverage-self-a/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "nested/reader/completion-exit/isolated-build.lisp.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-reader-self-test-97751-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "nested/reader/completion-exit/stderr.log" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-reader-self-test-97751-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "nested/reader/completion-exit/stdout.log" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-reader-self-test-97751-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "nested/reader/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-reader-self-test-97751-0/report.lisp")
   :BYTES 1937 :SHA256
   "f45d07943817ead91200f247eaf6fb51a9c5ce760ee508b0e9f817c9c69ad0d8")
  (:PATH "nested/reader/signal/isolated-build.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-reader-self-test-97751-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "nested/reader/signal/stderr.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-reader-self-test-97751-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "nested/reader/signal/stdout.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-reader-self-test-97751-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "nested/snapshot/completion-exit/isolated-build.lisp.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-snapshot-self-test-97746-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "nested/snapshot/completion-exit/stderr.log" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-snapshot-self-test-97746-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "nested/snapshot/completion-exit/stdout.log" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-snapshot-self-test-97746-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "nested/snapshot/report.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-snapshot-self-test-97746-0/report.lisp")
   :BYTES 1955 :SHA256
   "899bab2fabc4370ccfd27059754b39b4a8ae484f7908b028079717450d9f07ca")
  (:PATH "nested/snapshot/signal/isolated-build.lisp.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-snapshot-self-test-97746-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "nested/snapshot/signal/stderr.log" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-snapshot-self-test-97746-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "nested/snapshot/signal/stdout.log" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154915-snapshot-self-test-97746-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "nested/spikes/SPK-01.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "babd480b1c94c5c304c179481d6283f21372542199d4919232a079163a72cc3b")
  (:PATH "nested/spikes/SPK-02.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "e1ea217f79e0b00aae45b284c25ce42cd0474e9355a7b0588e021b4c24d5adfe")
  (:PATH "nested/spikes/SPK-03.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-03.lisp")
   :BYTES 3641 :SHA256
   "45677b817fd98a3a0d1a1e9970798859da847bea21e403fa81010098b5a657df")
  (:PATH "nested/spikes/SPK-04.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-04.lisp")
   :BYTES 6751 :SHA256
   "ff66128ef6b6ea207afb656eeece9d57f336658e98ae65ed02f32b586ff7e4ee")
  (:PATH "nested/spikes/SPK-05.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-05.lisp")
   :BYTES 10039 :SHA256
   "ae3fd31cff0543f399aa40663efd336674670b22761e4b626156b36d2c2bc381")
  (:PATH "nested/spikes/SPK-06.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-06.lisp")
   :BYTES 23957 :SHA256
   "decf4414482372da935704c98d34b21525bf40fa152ff22bca150a7640258881")
  (:PATH "nested/spikes/SPK-07.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "ea73099c77888c915fb9d66fd860cc2e5ee71fbc4cad94458ce51bee1e2be353")
  (:PATH "nested/spikes/SPK-07.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-07.lisp.gz")
   :BYTES 410641 :SHA256
   "95e325bf36f6c4f017cfdad4e02aad0b350ce0dbdd2f3e1112ac15ee34367e60")
  (:PATH "nested/spikes/SPK-08.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "1e03fdbb3103b2a4051a5bdd0b6eabbe18744902bcdb874b48c02f6f34790e2b")
  (:PATH "nested/spikes/SPK-09.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "c68ccf5d63036ded1900e02b62d9ddaea19a94930512fc9cac5522f71629585c")
  (:PATH "nested/spikes/SPK-10.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "5afd64fdf6938e01ba42d653ec9f0599d922aa46a0d0d63dc19a50f705d2cffc")
  (:PATH "nested/spikes/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/conservazione.lisp")
   :BYTES 2294 :SHA256
   "80ae29cb24d886e1580ba84dbf58c5b92e452cb56e37ecb5627a7a479ec3d1bf")
  (:PATH "nested/spikes/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/report.lisp")
   :BYTES 318 :SHA256
   "cf4b75f9073875a30a08ebb9e4b9d2bea328d9ca3c2052fd6fe26c5802f13086")
  (:PATH "nested/spikes/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155304-check-11298-0/report.lisp.gz")
   :BYTES 466859 :SHA256
   "e10c835d72c73dc2834c2cdfc2e8107a2370d46ff8aa71636daa73e7107bf456")
  (:PATH "processes/check/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154827-command-95398-0/conservazione.lisp")
   :BYTES 1731 :SHA256
   "8db77c668761ed5880b96024125cdd384aa4a80b9c1f062f33501917fd866d27")
  (:PATH "processes/check/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154827-command-95398-0/report.lisp")
   :BYTES 317 :SHA256
   "aec0bb8bfa018426f8a2b71395031072774730266961c47c5bf5bf7a1e449cb6")
  (:PATH "processes/check/report.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154827-command-95398-0/report.lisp.gz")
   :BYTES 221811 :SHA256
   "05af37ca2fef1bb5079f3937ec091b583e595b628158be31bcaf46238cf87c67")
  (:PATH "processes/coverage-a/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154453-command-88101-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "3603748285169d905651036d0458e905bb0b853378f68f933bdd01dd074896be")
  (:PATH "processes/coverage-a/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154453-command-88101-0/report.lisp")
   :BYTES 227455 :SHA256
   "3fcf40f34e71ad014b4b82c9de066e3a65ad5e1c0144cbb278fd12c6eeaac875")
  (:PATH "processes/coverage-b/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154516-command-89153-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "131556f0599cdd8686f56ea10a028f3ee8f6e9a96cfa0348ea8ccb30cad77e04")
  (:PATH "processes/coverage-b/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154516-command-89153-0/report.lisp")
   :BYTES 227455 :SHA256
   "34a3997ffea9a5a9ea6996f594ac50d0b10a240cb55ffc94b3558e8178ae7a4a")
  (:PATH "processes/coverage-c/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154591-command-91079-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "5d3d433c5e5a60ed398e0e548a2986ce73b23cbd73075f0b4791581f990165b4")
  (:PATH "processes/coverage-c/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154591-command-91079-0/report.lisp")
   :BYTES 227561 :SHA256
   "49ad52b7bdedb7800dee9789374d91c20c9e316a79142c72268677deb80d5088")
  (:PATH "processes/coverage-d/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154641-command-91970-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "a434e3df7a1926de2c2b00273b188b89e12178703fb53f47a1665ea06df3d589")
  (:PATH "processes/coverage-d/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154641-command-91970-0/report.lisp")
   :BYTES 221195 :SHA256
   "293f972499ce862f9cbec9ab8719633eb158800e67dee89351c4dcb7689381bf")
  (:PATH "processes/coverage-e/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154827-command-95381-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "04931dce3813bd64dc2a33487adcf20a0ea2f38b01805ce3d06462667d7e3806")
  (:PATH "processes/coverage-e/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154827-command-95381-0/report.lisp")
   :BYTES 223475 :SHA256
   "027b6a9224105daa53d54060e09381fd2fe43dcc36636eda9f451903b6adbe46")
  (:PATH "processes/coverage-self/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154453-command-88102-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "d5c924a9429987dccef812d154f8087198258517fb6cefb3432760bc6b5afd85")
  (:PATH "processes/coverage-self/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154453-command-88102-0/report.lisp")
   :BYTES 216672 :SHA256
   "fc8f6963110a7bc8c0a99819485322009aeab86aad36fcb103f3a4dffa787e4c")
  (:PATH "processes/diagnostic/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154779-command-93995-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "084d1d2a4175df6f319e140f1efcb5fc4e5804532cf6f759b18d5cfcf3070b6e")
  (:PATH "processes/diagnostic/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154779-command-93995-0/report.lisp")
   :BYTES 224754 :SHA256
   "b601e2d6a91706f4257feee7cd8caf1d0c95df932d8e0adf480d93c0d14220de")
  (:PATH "processes/integration/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155392-command-13478-0/conservazione.lisp")
   :BYTES 1731 :SHA256
   "89ced800ce41160d6d63aad8b318a9e23ca17b01b060bfd31e1228ead45ddd4b")
  (:PATH "processes/integration/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155392-command-13478-0/report.lisp")
   :BYTES 317 :SHA256
   "e8dd472893720a4f6267450450ad4ff6d4edfb5958073744e832cd763e6ca4f0")
  (:PATH "processes/integration/report.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155392-command-13478-0/report.lisp.gz")
   :BYTES 212612 :SHA256
   "a3078ad3945ff2e6eeda09bf0cc60ea94cca11bbc7ec102b6e52f6c62d00cede")
  (:PATH "processes/parentheses/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154570-command-90508-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "288447f96dab7e20ba8b0e5339eb91421068ebdb4749ba927d4c497d3eed2b0c")
  (:PATH "processes/parentheses/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154570-command-90508-0/report.lisp")
   :BYTES 217178 :SHA256
   "8ac05d7bd2fd897a8dd4f9601d7e9ac97a5553945a7fa680e62fd96032872a48")
  (:PATH "processes/process-status/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155152-command-5658-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "59e20c45638dc30ae682c6b024158256d76df6532ba6e5d35a7a1d6ccf0fa727")
  (:PATH "processes/process-status/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001155152-command-5658-0/report.lisp")
   :BYTES 218693 :SHA256
   "6e7c01bdfe67d78218c364d64c5667490b7708a8f5214081781b6bb6225c8323")
  (:PATH "processes/trace-a/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154440-command-87757-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "c0611aaaf64de40b236c5a1863d6407fb8623f404b790bac8007ce0c6f7c3bda")
  (:PATH "processes/trace-a/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154440-command-87757-0/report.lisp")
   :BYTES 216507 :SHA256
   "199a7808a20630cadfc884ea149c28aefaf6fd90f92525ee0e3fbd781dc5042b")
  (:PATH "processes/trace-b/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154818-command-94901-0/conservazione.lisp")
   :BYTES 1150 :SHA256
   "3e233080ae332ab40fd9f8e75a6e04f2cfaddf6aecf012ddd7372deb007995fd")
  (:PATH "processes/trace-b/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/4001154818-command-94901-0/report.lisp")
   :BYTES 218201 :SHA256
   "44276fb955dec65439a524a7c9d3a1f96330830e0ca92f0dde6fc9a8c80bd791")
  (:PATH "raw/diagnose.lisp.txt" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-input/diagnose.lisp")
   :BYTES 1157 :SHA256
   "d7edf22515c530a5ad894f957b399e54f67b22aea6dad8b361be063698389405")
  (:PATH "raw/metodo.md.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/docs/implementazione/closed-recuperato-verifica.md")
   :BYTES 5108 :SHA256
   "5de19df6b640debb19830695fc2c9eecc33b41c9405c8919b53cf4723c9d7542")
  (:PATH "raw/revisione.md.txt" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/docs/implementazione/closed-recuperato-revisione.md")
   :BYTES 10981 :SHA256
   "892c3227c4a454eb8d2b234eee515bf5369414df2557fb4bd9e51b091d83b37c")
  (:PATH "report.md" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-input/report.md.txt")
   :BYTES 6726 :SHA256
   "1374455de9c3c99da0320f16822e168490c5a9d2d595935246aa1482265bbb38")
  (:PATH "summary.lisp" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/closed-verifica/ArcDocDB/spikes/out/closed-input/summary.lisp")
   :BYTES 2084 :SHA256
   "30d37273d960467e86b5c981bdd5623752cd525ced0dc6c9f5e9379d029e950e"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
