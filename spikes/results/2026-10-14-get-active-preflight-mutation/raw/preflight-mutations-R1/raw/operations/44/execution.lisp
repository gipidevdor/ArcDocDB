(:SIGNAL NIL :EXIT-CODE 0 :ARGV
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
  "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/preflight-mutations-R1/raw/evidence/ignore-batch-version/driver.lisp")
 :DEADLINE-SECONDS 120 :STATUS :OK :TIMED-OUT NIL :CLEANUP :REAPED)
