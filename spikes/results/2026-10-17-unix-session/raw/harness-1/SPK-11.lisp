(:SCHEMA-VERSION 1 :ID "SPK-11" :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "4096" "--noinform" "--no-userinit" "--no-sysinit"
  "--script" "spikes/SPK-11-unix-socket/run.lisp"
  #A((7) BASE-CHAR . "--check"))
 :EXIT-CODE 0 :STARTED-AT-UNIVERSAL-TIME 4001224323 :FINISHED-AT-UNIVERSAL-TIME
 4001224331 :WALL-SECONDS 7.95757d0 :STATUS :OK :SOURCE-BLOBS-BEFORE
 ((:PATH "tools/run-spikes.lisp" :GIT-BLOB
   "a354bbfd7f75576f94bc2ce7c8bdb0560faa4961")
  (:PATH "spikes/SPK-11-unix-socket/run.lisp" :GIT-BLOB
   "214f25aea6dfcf93541c2b7ea7f1092cba590ff5")
  (:PATH #A((35) BASE-CHAR . "spikes/SPK-11-unix-socket/core.lisp") :GIT-BLOB
   "7b526422d5be781d26213e128a49a07bc3e25788")
  (:PATH "spikes/SPK-11-unix-socket/transport.lisp" :GIT-BLOB
   "cfe4a32c04da589ed66a7d2b61e5dd7dcd8dd7f6")
  (:PATH "spikes/SPK-11-unix-socket/session-wire.lisp" :GIT-BLOB
   "d3bd3a22eb6ab70554f13ca798b8ea5ab310e863")
  (:PATH "spikes/SPK-11-unix-socket/session-model.lisp" :GIT-BLOB
   "104a8ef0c6b7be7a2ce30b5828100c08895ce6d5")
  (:PATH "spikes/SPK-11-unix-socket/session-checks.lisp" :GIT-BLOB
   "dce61a61ca1cf57219f03a0c34f9e7798bd3bbba")
  (:PATH "spikes/SPK-11-unix-socket/session-transport.lisp" :GIT-BLOB
   "a79fed48095bd01e56860372badc1e168ac8eb7a")
  (:PATH "spikes/SPK-11-unix-socket/scenarios.lisp" :GIT-BLOB
   "e934df86ffd7617a616b1ee117f61292e5fcc1da")
  (:PATH "spikes/SPK-11-unix-socket/codec-inputs.lisp" :GIT-BLOB
   "d0db0b9a40edd8e47d5e758f012bb45d489eaa89")
  (:PATH "src/package.lisp" :GIT-BLOB
   "3d0181717e3f334580bab9a6a507e2dfe57261ff")
  (:PATH "src/foundation/package.lisp" :GIT-BLOB
   "bca6808e75e144ac7e9643df07a1cc6df4f70ed3")
  (:PATH "src/foundation/conditions.lisp" :GIT-BLOB
   "edbe5eaa88c50dc13af8e367b73f7f41fd7bd724")
  (:PATH "src/foundation/binary.lisp" :GIT-BLOB
   "2d514f6fe2e81eecb29fa53de611fa5e28696904")
  (:PATH "src/codec/package.lisp" :GIT-BLOB
   "7139b8ce1a947efe6599f2cbbdf78a02e35a68f1")
  (:PATH "src/codec/utf8.lisp" :GIT-BLOB
   "e2339f232be3d432311503cb48f9ad8e2e53e8e8")
  (:PATH "src/codec/cbor-package.lisp" :GIT-BLOB
   "3e31d60234585442baa5664be96a83915e034397")
  (:PATH "src/codec/cbor-header.lisp" :GIT-BLOB
   "db635a50678f2712ec9516be335717ea254d4d09")
  (:PATH "src/codec/cbor-float-minimal.lisp" :GIT-BLOB
   "ca6215b30010d3d2eb90eaa6fd09dd5a9ac7778f")
  (:PATH "src/codec/cbor-minimal.lisp" :GIT-BLOB
   "761302dad1073c841397f6c88d595b114af8d9ef")
  (:PATH "src/codec/cbor-space.lisp" :GIT-BLOB
   "a8330e50a77b52a6b9044ebbb48f62bb4b3222a3")
  (:PATH "src/codec/cbor-scan-input.lisp" :GIT-BLOB
   "57ffc48cc688a4de8ebec5cb14c1e69c4209704a")
  (:PATH "src/codec/cbor-scan-stack.lisp" :GIT-BLOB
   "c574e87af5e195ddf3f596a4ae527e69c7a3c6a6")
  (:PATH "src/codec/cbor-scan-items.lisp" :GIT-BLOB
   "70272936e323b3e0cb05173c9fb68cb2b614c355")
  (:PATH "src/codec/cbor-scan.lisp" :GIT-BLOB
   "e3d7d77407046338d23e26eb0b8a2e8fdc3d699d")
  (:PATH "src/codec/cbor-scan-minimal.lisp" :GIT-BLOB
   "f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6"))
 :SOURCE-BLOBS-AFTER
 ((:PATH "tools/run-spikes.lisp" :GIT-BLOB
   "a354bbfd7f75576f94bc2ce7c8bdb0560faa4961")
  (:PATH "spikes/SPK-11-unix-socket/run.lisp" :GIT-BLOB
   "214f25aea6dfcf93541c2b7ea7f1092cba590ff5")
  (:PATH #A((35) BASE-CHAR . "spikes/SPK-11-unix-socket/core.lisp") :GIT-BLOB
   "7b526422d5be781d26213e128a49a07bc3e25788")
  (:PATH "spikes/SPK-11-unix-socket/transport.lisp" :GIT-BLOB
   "cfe4a32c04da589ed66a7d2b61e5dd7dcd8dd7f6")
  (:PATH "spikes/SPK-11-unix-socket/session-wire.lisp" :GIT-BLOB
   "d3bd3a22eb6ab70554f13ca798b8ea5ab310e863")
  (:PATH "spikes/SPK-11-unix-socket/session-model.lisp" :GIT-BLOB
   "104a8ef0c6b7be7a2ce30b5828100c08895ce6d5")
  (:PATH "spikes/SPK-11-unix-socket/session-checks.lisp" :GIT-BLOB
   "dce61a61ca1cf57219f03a0c34f9e7798bd3bbba")
  (:PATH "spikes/SPK-11-unix-socket/session-transport.lisp" :GIT-BLOB
   "a79fed48095bd01e56860372badc1e168ac8eb7a")
  (:PATH "spikes/SPK-11-unix-socket/scenarios.lisp" :GIT-BLOB
   "e934df86ffd7617a616b1ee117f61292e5fcc1da")
  (:PATH "spikes/SPK-11-unix-socket/codec-inputs.lisp" :GIT-BLOB
   "d0db0b9a40edd8e47d5e758f012bb45d489eaa89")
  (:PATH "src/package.lisp" :GIT-BLOB
   "3d0181717e3f334580bab9a6a507e2dfe57261ff")
  (:PATH "src/foundation/package.lisp" :GIT-BLOB
   "bca6808e75e144ac7e9643df07a1cc6df4f70ed3")
  (:PATH "src/foundation/conditions.lisp" :GIT-BLOB
   "edbe5eaa88c50dc13af8e367b73f7f41fd7bd724")
  (:PATH "src/foundation/binary.lisp" :GIT-BLOB
   "2d514f6fe2e81eecb29fa53de611fa5e28696904")
  (:PATH "src/codec/package.lisp" :GIT-BLOB
   "7139b8ce1a947efe6599f2cbbdf78a02e35a68f1")
  (:PATH "src/codec/utf8.lisp" :GIT-BLOB
   "e2339f232be3d432311503cb48f9ad8e2e53e8e8")
  (:PATH "src/codec/cbor-package.lisp" :GIT-BLOB
   "3e31d60234585442baa5664be96a83915e034397")
  (:PATH "src/codec/cbor-header.lisp" :GIT-BLOB
   "db635a50678f2712ec9516be335717ea254d4d09")
  (:PATH "src/codec/cbor-float-minimal.lisp" :GIT-BLOB
   "ca6215b30010d3d2eb90eaa6fd09dd5a9ac7778f")
  (:PATH "src/codec/cbor-minimal.lisp" :GIT-BLOB
   "761302dad1073c841397f6c88d595b114af8d9ef")
  (:PATH "src/codec/cbor-space.lisp" :GIT-BLOB
   "a8330e50a77b52a6b9044ebbb48f62bb4b3222a3")
  (:PATH "src/codec/cbor-scan-input.lisp" :GIT-BLOB
   "57ffc48cc688a4de8ebec5cb14c1e69c4209704a")
  (:PATH "src/codec/cbor-scan-stack.lisp" :GIT-BLOB
   "c574e87af5e195ddf3f596a4ae527e69c7a3c6a6")
  (:PATH "src/codec/cbor-scan-items.lisp" :GIT-BLOB
   "70272936e323b3e0cb05173c9fb68cb2b614c355")
  (:PATH "src/codec/cbor-scan.lisp" :GIT-BLOB
   "e3d7d77407046338d23e26eb0b8a2e8fdc3d699d")
  (:PATH "src/codec/cbor-scan-minimal.lisp" :GIT-BLOB
   "f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6"))
 :SOURCE-CONSISTENCY :STABLE :RESULT
 (:STATUS :OK :SPIKE :SPK-11 :FRAMING
  (:STATUS :OK :SPLIT-POINTS 21 :INVALID-LENGTHS 3 :TRUNCATED-PREFIX-OR-BODY 9
   :MAXIMUM-FRAME-BYTES 17825792 :ORACLE-NEGATIVE-CONTROLS 3)
  :SESSION
  (:STATUS :OK :CASES
   ((:CASE #A((18) BASE-CHAR . "CHECK-SESSION-WIRE") :STATUS :OK)
    (:CASE #A((18) BASE-CHAR . "CHECK-SESSION-MAPS") :STATUS :OK)
    (:CASE #A((25) BASE-CHAR . "CHECK-SESSION-NEGOTIATION") :STATUS :OK)
    (:CASE #A((20) BASE-CHAR . "CHECK-SESSION-CREDIT") :STATUS :OK)
    (:CASE #A((25) BASE-CHAR . "CHECK-SESSION-CORRELATION") :STATUS :OK)
    (:CASE #A((18) BASE-CHAR . "CHECK-SESSION-TIME") :STATUS :OK)
    (:CASE #A((23) BASE-CHAR . "CHECK-SESSION-ISOLATION") :STATUS :OK)
    (:CASE #A((25) BASE-CHAR . "CHECK-SESSION-SENSITIVITY") :STATUS :OK))
   :SENSITIVITY-CONTROLS 4 :PROFILE-BYTES 4096 :LIMITS
   (:C4-MODEL :SIMULATED-GATE-AND-CLOCK :NO-ENGINE
    :NO-PRODUCTION-ALLOCATION-CLAIM))
  :PROCESSES
  ((:STATUS :OK :MODE "fragmented" :SERVER-PID 10149 :CLIENT-PID 10151 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "fragmented"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION 20 :STDOUT
    "(:STATUS :OK :MODE #A((10) BASE-CHAR . \"fragmented\") :PID 10151)
"
    :STDERR "")
   (:STATUS :OK :MODE "coalesced" :SERVER-PID 10149 :CLIENT-PID 10154 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "coalesced"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION 20 :STDOUT
    "(:STATUS :OK :MODE #A((9) BASE-CHAR . \"coalesced\") :PID 10154)
"
    :STDERR "")
   (:STATUS :OK :MODE "maximum" :SERVER-PID 10149 :CLIENT-PID 10156 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "maximum"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION 10 :STDOUT
    "(:STATUS :OK :MODE #A((7) BASE-CHAR . \"maximum\") :PID 10156)
"
    :STDERR "")
   (:STATUS :OK :MODE "zero" :SERVER-PID 10149 :CLIENT-PID 10163 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "zero"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
    "(:STATUS :OK :MODE #A((4) BASE-CHAR . \"zero\") :PID 10163)
"
    :STDERR "")
   (:STATUS :OK :MODE "oversize" :SERVER-PID 10149 :CLIENT-PID 10167 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "oversize"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
    "(:STATUS :OK :MODE #A((8) BASE-CHAR . \"oversize\") :PID 10167)
"
    :STDERR "")
   (:STATUS :OK :MODE "truncated" :SERVER-PID 10149 :CLIENT-PID 10168 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "truncated"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
    "(:STATUS :OK :MODE #A((9) BASE-CHAR . \"truncated\") :PID 10168)
"
    :STDERR "")
   (:STATUS :OK :MODE "session" :SERVER-PID 10149 :CLIENT-PID 10172 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "session"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION
    (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 4096 :MAX-INFLIGHT 2 :MODEL-CALLS
     2 :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
    :STDOUT "(:STATUS :OK :MODE #A((7) BASE-CHAR . \"session\") :PID 10172)
"
    :STDERR "")
   (:STATUS :OK :MODE "session-invalid-hello" :SERVER-PID 10149 :CLIENT-PID
    10174 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "session-invalid-hello"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION
    (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
     :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
    :STDOUT
    "(:STATUS :OK :MODE #A((21) BASE-CHAR . \"session-invalid-hello\") :PID 10174)
"
    :STDERR "")
   (:STATUS :OK :MODE "session-pre-hello" :SERVER-PID 10149 :CLIENT-PID 10176
    :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "session-pre-hello"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION
    (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
     :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
    :STDOUT
    "(:STATUS :OK :MODE #A((17) BASE-CHAR . \"session-pre-hello\") :PID 10176)
"
    :STDERR "")
   (:STATUS :OK :MODE "session-oversize-hello" :SERVER-PID 10149 :CLIENT-PID
    10178 :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "session-oversize-hello"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION
    (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
     :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
    :STDOUT
    "(:STATUS :OK :MODE #A((22) BASE-CHAR . \"session-oversize-hello\") :PID 10178)
"
    :STDERR "")
   (:STATUS :OK :MODE "session-id-reuse" :SERVER-PID 10149 :CLIENT-PID 10180
    :ARGV
    ("--noinform" "--no-userinit" "--no-sysinit" "--script"
     #A((74) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp")
     "--client" "/tmp/arcdocdb-spk11-BsAeXo/ipc.sock" "session-id-reuse"
     #A((83) BASE-CHAR
        . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/"))
    :EXIT-CODE 0 :OBSERVATION
    (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 4096 :MAX-INFLIGHT 2 :MODEL-CALLS
     1 :PENDING-AT-CLOSE 1 :ENGINE-CALLED NIL)
    :STDOUT
    "(:STATUS :OK :MODE #A((16) BASE-CHAR . \"session-id-reuse\") :PID 10180)
"
    :STDERR ""))
  :NAMESPACE
  (:STATUS :OK :OCCUPIED-NODES (:LISTENER :ORPHAN :FILE :SYMLINK)
   :REPLACEMENT-PRESERVED T)
  :NATIVE-SYMLINK-BIND
  (:BIND-RESULT :BOUND :LINK (16777230 1544622254 41453) :TARGET
   (16777230 1544622255 49645))
  :LIMITS
  (:TRANSPORT-AND-CONTROL-MODEL :NO-ENGINE-ADMISSION :NO-DURABILITY
   :NO-DISTINCT-UID :NO-PERFORMANCE-MEASUREMENT))
 :STDOUT "(:STATUS :OK :SPIKE :SPK-11 :FRAMING
 (:STATUS :OK :SPLIT-POINTS 21 :INVALID-LENGTHS 3 :TRUNCATED-PREFIX-OR-BODY 9
  :MAXIMUM-FRAME-BYTES 17825792 :ORACLE-NEGATIVE-CONTROLS 3)
 :SESSION
 (:STATUS :OK :CASES
  ((:CASE #A((18) BASE-CHAR . \"CHECK-SESSION-WIRE\") :STATUS :OK)
   (:CASE #A((18) BASE-CHAR . \"CHECK-SESSION-MAPS\") :STATUS :OK)
   (:CASE #A((25) BASE-CHAR . \"CHECK-SESSION-NEGOTIATION\") :STATUS :OK)
   (:CASE #A((20) BASE-CHAR . \"CHECK-SESSION-CREDIT\") :STATUS :OK)
   (:CASE #A((25) BASE-CHAR . \"CHECK-SESSION-CORRELATION\") :STATUS :OK)
   (:CASE #A((18) BASE-CHAR . \"CHECK-SESSION-TIME\") :STATUS :OK)
   (:CASE #A((23) BASE-CHAR . \"CHECK-SESSION-ISOLATION\") :STATUS :OK)
   (:CASE #A((25) BASE-CHAR . \"CHECK-SESSION-SENSITIVITY\") :STATUS :OK))
  :SENSITIVITY-CONTROLS 4 :PROFILE-BYTES 4096 :LIMITS
  (:C4-MODEL :SIMULATED-GATE-AND-CLOCK :NO-ENGINE
   :NO-PRODUCTION-ALLOCATION-CLAIM))
 :PROCESSES
 ((:STATUS :OK :MODE \"fragmented\" :SERVER-PID 10149 :CLIENT-PID 10151 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"fragmented\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION 20 :STDOUT
   \"(:STATUS :OK :MODE #A((10) BASE-CHAR . \\\"fragmented\\\") :PID 10151)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"coalesced\" :SERVER-PID 10149 :CLIENT-PID 10154 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"coalesced\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION 20 :STDOUT
   \"(:STATUS :OK :MODE #A((9) BASE-CHAR . \\\"coalesced\\\") :PID 10154)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"maximum\" :SERVER-PID 10149 :CLIENT-PID 10156 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"maximum\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION 10 :STDOUT
   \"(:STATUS :OK :MODE #A((7) BASE-CHAR . \\\"maximum\\\") :PID 10156)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"zero\" :SERVER-PID 10149 :CLIENT-PID 10163 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"zero\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
   \"(:STATUS :OK :MODE #A((4) BASE-CHAR . \\\"zero\\\") :PID 10163)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"oversize\" :SERVER-PID 10149 :CLIENT-PID 10167 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"oversize\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
   \"(:STATUS :OK :MODE #A((8) BASE-CHAR . \\\"oversize\\\") :PID 10167)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"truncated\" :SERVER-PID 10149 :CLIENT-PID 10168 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"truncated\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
   \"(:STATUS :OK :MODE #A((9) BASE-CHAR . \\\"truncated\\\") :PID 10168)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"session\" :SERVER-PID 10149 :CLIENT-PID 10172 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION
   (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 4096 :MAX-INFLIGHT 2 :MODEL-CALLS
    2 :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
   :STDOUT \"(:STATUS :OK :MODE #A((7) BASE-CHAR . \\\"session\\\") :PID 10172)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"session-invalid-hello\" :SERVER-PID 10149 :CLIENT-PID
   10174 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session-invalid-hello\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION
   (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
    :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
   :STDOUT
   \"(:STATUS :OK :MODE #A((21) BASE-CHAR . \\\"session-invalid-hello\\\") :PID 10174)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"session-pre-hello\" :SERVER-PID 10149 :CLIENT-PID 10176
   :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session-pre-hello\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION
   (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
    :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
   :STDOUT
   \"(:STATUS :OK :MODE #A((17) BASE-CHAR . \\\"session-pre-hello\\\") :PID 10176)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"session-oversize-hello\" :SERVER-PID 10149 :CLIENT-PID
   10178 :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session-oversize-hello\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION
   (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
    :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
   :STDOUT
   \"(:STATUS :OK :MODE #A((22) BASE-CHAR . \\\"session-oversize-hello\\\") :PID 10178)
\"
   :STDERR \"\")
  (:STATUS :OK :MODE \"session-id-reuse\" :SERVER-PID 10149 :CLIENT-PID 10180
   :ARGV
   (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
    #A((74) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
    \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session-id-reuse\"
    #A((83) BASE-CHAR
       . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
   :EXIT-CODE 0 :OBSERVATION
   (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 4096 :MAX-INFLIGHT 2 :MODEL-CALLS
    1 :PENDING-AT-CLOSE 1 :ENGINE-CALLED NIL)
   :STDOUT
   \"(:STATUS :OK :MODE #A((16) BASE-CHAR . \\\"session-id-reuse\\\") :PID 10180)
\"
   :STDERR \"\"))
 :NAMESPACE
 (:STATUS :OK :OCCUPIED-NODES (:LISTENER :ORPHAN :FILE :SYMLINK)
  :REPLACEMENT-PRESERVED T)
 :NATIVE-SYMLINK-BIND
 (:BIND-RESULT :BOUND :LINK (16777230 1544622254 41453) :TARGET
  (16777230 1544622255 49645))
 :LIMITS
 (:TRANSPORT-AND-CONTROL-MODEL :NO-ENGINE-ADMISSION :NO-DURABILITY
  :NO-DISTINCT-UID :NO-PERFORMANCE-MEASUREMENT))
"
 :STDERR
 "(:STATUS :OK :MODE \"fragmented\" :SERVER-PID 10149 :CLIENT-PID 10151 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"fragmented\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION 20 :STDOUT
 \"(:STATUS :OK :MODE #A((10) BASE-CHAR . \\\"fragmented\\\") :PID 10151)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"coalesced\" :SERVER-PID 10149 :CLIENT-PID 10154 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"coalesced\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION 20 :STDOUT
 \"(:STATUS :OK :MODE #A((9) BASE-CHAR . \\\"coalesced\\\") :PID 10154)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"maximum\" :SERVER-PID 10149 :CLIENT-PID 10156 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"maximum\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION 10 :STDOUT
 \"(:STATUS :OK :MODE #A((7) BASE-CHAR . \\\"maximum\\\") :PID 10156)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"zero\" :SERVER-PID 10149 :CLIENT-PID 10163 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"zero\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
 \"(:STATUS :OK :MODE #A((4) BASE-CHAR . \\\"zero\\\") :PID 10163)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"oversize\" :SERVER-PID 10149 :CLIENT-PID 10167 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"oversize\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
 \"(:STATUS :OK :MODE #A((8) BASE-CHAR . \\\"oversize\\\") :PID 10167)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"truncated\" :SERVER-PID 10149 :CLIENT-PID 10168 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"truncated\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION NIL :STDOUT
 \"(:STATUS :OK :MODE #A((9) BASE-CHAR . \\\"truncated\\\") :PID 10168)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"session\" :SERVER-PID 10149 :CLIENT-PID 10172 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION
 (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 4096 :MAX-INFLIGHT 2 :MODEL-CALLS 2
  :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
 :STDOUT \"(:STATUS :OK :MODE #A((7) BASE-CHAR . \\\"session\\\") :PID 10172)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"session-invalid-hello\" :SERVER-PID 10149 :CLIENT-PID 10174
 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session-invalid-hello\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION
 (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
  :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
 :STDOUT
 \"(:STATUS :OK :MODE #A((21) BASE-CHAR . \\\"session-invalid-hello\\\") :PID 10174)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"session-pre-hello\" :SERVER-PID 10149 :CLIENT-PID 10176
 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session-pre-hello\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION
 (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
  :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
 :STDOUT
 \"(:STATUS :OK :MODE #A((17) BASE-CHAR . \\\"session-pre-hello\\\") :PID 10176)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"session-oversize-hello\" :SERVER-PID 10149 :CLIENT-PID 10178
 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session-oversize-hello\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION
 (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 0 :MAX-INFLIGHT 0 :MODEL-CALLS 0
  :PENDING-AT-CLOSE 0 :ENGINE-CALLED NIL)
 :STDOUT
 \"(:STATUS :OK :MODE #A((22) BASE-CHAR . \\\"session-oversize-hello\\\") :PID 10178)
\"
 :STDERR \"\")
(:STATUS :OK :MODE \"session-id-reuse\" :SERVER-PID 10149 :CLIENT-PID 10180 :ARGV
 (\"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--script\"
  #A((74) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/run.lisp\")
  \"--client\" \"/tmp/arcdocdb-spk11-BsAeXo/ipc.sock\" \"session-id-reuse\"
  #A((83) BASE-CHAR
     . \"/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/out/build-YS2gvw/\"))
 :EXIT-CODE 0 :OBSERVATION
 (:STATUS :OK :PROFILE :CONTROL :MAX-FRAME 4096 :MAX-INFLIGHT 2 :MODEL-CALLS 1
  :PENDING-AT-CLOSE 1 :ENGINE-CALLED NIL)
 :STDOUT
 \"(:STATUS :OK :MODE #A((16) BASE-CHAR . \\\"session-id-reuse\\\") :PID 10180)
\"
 :STDERR \"\")
")
