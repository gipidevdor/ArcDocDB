(:SCHEMA-VERSION 1 :KIND :SELECTION-PREPARER-FIXTURES :STATUS :OK
 :STARTED-AT-UNIVERSAL-TIME 4001085386 :FINISHED-AT-UNIVERSAL-TIME 4001085388
 :HELPER-BLOB-BEFORE "97331bd62bbed68375eeaeac00c7a137fd7544da"
 :HELPER-BLOB-AFTER "97331bd62bbed68375eeaeac00c7a137fd7544da"
 :HELPER-DATA-FORMS 7 :READ-EVAL NIL :EOF T :CHECKS 77 :CASES
 ((:NAME "01-positive" :STATUS :OK :EXPECTED :POSITIVE :EXECUTION
   (:ARGV
    (#1=#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
     #2="--noinform" #3="--no-userinit" #4="--no-sysinit"
     #5="--disable-debugger" #6="--script"
     #7=#A((132) BASE-CHAR
           . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/prepare.lisp")
     #8=#A((147) BASE-CHAR
           . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/plan.lisp"))
    :EXIT-CODE 0 :SIGNAL NIL :STDOUT
    #A((149) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/stdout.lisp")
    :STDERR
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/stderr.log"))
   :PLAN #8# :MANIFEST
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/manifest.lisp")
   :SOURCE-SNAPSHOTS
   ((:PATH
     #A((156) BASE-CHAR
        . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/source/.hidden.bin")
     :BYTES 4 :SHA256
     "6d6f7836f1e146dc0204afb5133dae52fdc05603d8ac2dc793b481b0e0829fd1")
    (:PATH
     #A((154) BASE-CHAR
        . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/source/plain.txt")
     :BYTES 15 :SHA256
     "3ed8a690a01dc12fa9284843fb380433d9c81afd51f43c72e8726d86742fb3b1")
    (:PATH
     #A((152) BASE-CHAR
        . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/source/note.md")
     :BYTES 20 :SHA256
     "cb8863843e557f85ef55258e96cf2eb0bf3e7c2dad89280d9de58ed5486cd68c"))
   :CHECKS 12)
  (:NAME "02-collision" :STATUS :OK :EXPECTED :COLLISION :EXECUTION
   (:ARGV
    (#1# #2# #3# #4# #5# #6# #7#
     #9=#A((148) BASE-CHAR
           . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/plan.lisp"))
    :EXIT-CODE 1 :SIGNAL NIL :STDOUT
    #A((150) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/stdout.lisp")
    :STDERR
    #A((149) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/stderr.log"))
   :PLAN #9# :MANIFEST
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/manifest.lisp")
   :SOURCE-SNAPSHOTS
   ((:PATH
     #A((156) BASE-CHAR
        . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/source/foo.md.txt")
     :BYTES 18 :SHA256
     "aedb93ee98e8103bca599854bae084c3bfd74632021dd4c9f1be46268d6dd7c0")
    (:PATH
     #A((152) BASE-CHAR
        . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/source/foo.md")
     :BYTES 8 :SHA256
     "0e52f6b9d02515c59bb4fdeec2762fdbe701080c82986fc4dfbefcb1e2389817"))
   :CHECKS 7)
  (:NAME "03-symlink" :STATUS :OK :EXPECTED :SYMLINK :EXECUTION
   (:ARGV
    (#1# #2# #3# #4# #5# #6# #7#
     #10=#A((146) BASE-CHAR
            . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/plan.lisp"))
    :EXIT-CODE 1 :SIGNAL NIL :STDOUT
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/stdout.lisp")
    :STDERR
    #A((147) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/stderr.log"))
   :PLAN #10# :MANIFEST
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/manifest.lisp")
   :SOURCE-SNAPSHOTS
   ((:PATH
     #A((161) BASE-CHAR
        . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/owned-target/payload.txt")
     :BYTES 30 :SHA256
     "5825ce13f100b285cefa392e7c0a57bb128d2a1e6f812393f7762943ff87c20c"))
   :CHECKS 8)
  (:NAME "04-depth33" :STATUS :OK :EXPECTED :DEPTH :EXECUTION
   (:ARGV
    (#1# #2# #3# #4# #5# #6# #7#
     #11=#A((146) BASE-CHAR
            . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/plan.lisp"))
    :EXIT-CODE 1 :SIGNAL NIL :STDOUT
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/stdout.lisp")
    :STDERR
    #A((147) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/stderr.log"))
   :PLAN #11# :MANIFEST
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/manifest.lisp")
   :SOURCE-SNAPSHOTS NIL :CHECKS 40))
 :LIMITS
 (:SYNTHETIC-PLANS-WITHOUT-PROCESSES :COLLECTOR-NOT-INVOKED
  :NO-PRODUCT-LOAD-OR-COMPILATION :NO-PRODUCTION-CAMPAIGNS
  :OWNED-SYMLINK-AND-DEPTH-FIXTURES-PRESERVED))
