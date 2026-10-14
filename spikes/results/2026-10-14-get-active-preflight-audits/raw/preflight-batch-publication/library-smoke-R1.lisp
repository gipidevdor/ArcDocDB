(:SCHEMA-VERSION 1 :KIND :BATCH-SHA-SMOKE :STATUS :OK :FROZEN-SOURCE-COMMIT
 "8c0866711c50d047f87b9c484ce56d42a87ba19c" :HASH-CODE-GIT-BLOB
 "b2cd809d99d049757156ddf0141997e3b67903b4" :BATCH-ARGV
 ("python3" "-c" "import os,sys,stat,hashlib
for name in sys.argv[1:]:
 fd=os.open(name,os.O_RDONLY|os.O_NOFOLLOW|os.O_NONBLOCK)
 try:
  before=os.fstat(fd)
  if not stat.S_ISREG(before.st_mode) or not 0<=before.st_size<=16777216: raise ValueError('file shape/size')
  digest=hashlib.sha256(); count=0
  for i in range(1+before.st_size//65536):
   chunk=os.read(fd,65536); digest.update(chunk); count+=len(chunk)
  after=os.fstat(fd)
  identity=lambda s:(s.st_dev,s.st_ino,s.st_size,s.st_mtime_ns,s.st_ctime_ns)
  if count!=before.st_size or identity(before)!=identity(after): raise ValueError('source drift')
  print(digest.hexdigest())
 finally: os.close(fd)"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA abc.txt"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA binary.txt"
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA empty.txt")
 :BEFORE
 ((:PATH
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA abc.txt"
   :BYTES 3 :SHA256
   "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
  (:PATH
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA binary.txt"
   :BYTES 256 :SHA256
   "40aff2e9d2d8922e47afd4648e6967497158785fbd1da870e7110266bf944880")
  (:PATH
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA empty.txt"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
 :AFTER
 ((:PATH
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA abc.txt"
   :BYTES 3 :SHA256
   "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
  (:PATH
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA binary.txt"
   :BYTES 256 :SHA256
   "40aff2e9d2d8922e47afd4648e6967497158785fbd1da870e7110266bf944880")
  (:PATH
   "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutation-selftest-R1/SHA empty.txt"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
 :NATIVE-ORACLE-SAMPLES-PER-SNAPSHOT 3 :TABLE-ENTRIES 3 :NO-PRODUCT-TESTS T)
