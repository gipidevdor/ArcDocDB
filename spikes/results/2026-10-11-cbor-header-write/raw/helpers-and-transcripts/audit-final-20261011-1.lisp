(:INPUT-OBSERVATIONS-AFTER
 ((:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703189-command-45999-0/report.lisp")
   :BYTES 149812 :SHA256
   "83f48c55072dfee6c46e8ce7e816310afc31479b11f5d58a70dd89aa288bef4a")
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703222-command-46351-0/report.lisp")
   :BYTES 117014 :SHA256
   "2cc420a249f9eeb733f381874e7077fd510db37fd83f6497d27e40736c66c300")
  (:PATH
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/coverage-state.lisp")
   :BYTES 325 :SHA256
   "b4de0dea5fb08cc80a4994d670797a11ac50bbd3ea0ba188719a549a278130cf")
  (:PATH
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/cover-index.html")
   :BYTES 1754 :SHA256
   "7d742e9939d9d7b40a23c42c79f535f4f0221a23f03925227fef6e8c3edb0027")
  (:PATH
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/e5db7850e81a5085099ab99ae6c5f733.html")
   :BYTES 33427 :SHA256
   "279e8e5274e5044e2fec2551d3e3b65c1271d7a81c6e096a7c8fe601e35a6848"))
 :INPUT-OBSERVATIONS-BEFORE
 ((:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703189-command-45999-0/report.lisp")
   :BYTES 149812 :SHA256
   "83f48c55072dfee6c46e8ce7e816310afc31479b11f5d58a70dd89aa288bef4a")
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703222-command-46351-0/report.lisp")
   :BYTES 117014 :SHA256
   "2cc420a249f9eeb733f381874e7077fd510db37fd83f6497d27e40736c66c300")
  (:PATH
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/coverage-state.lisp")
   :BYTES 325 :SHA256
   "b4de0dea5fb08cc80a4994d670797a11ac50bbd3ea0ba188719a549a278130cf")
  (:PATH
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/cover-index.html")
   :BYTES 1754 :SHA256
   "7d742e9939d9d7b40a23c42c79f535f4f0221a23f03925227fef6e8c3edb0027")
  (:PATH
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/e5db7850e81a5085099ab99ae6c5f733.html")
   :BYTES 33427 :SHA256
   "279e8e5274e5044e2fec2551d3e3b65c1271d7a81c6e096a7c8fe601e35a6848"))
 :CHECKS 857 :DIAGNOSTIC
 #A((44) BASE-CHAR . "Audit rejected: :COVERAGE-SOURCE-HTML-COUNTS") :BENCHMARK
 (:WRAPPER
  (:COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/cbor-write-bench.lisp")
    #A((7) BASE-CHAR . "--bench"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
   :STARTED-AT-UNIVERSAL-TIME 4000703190 :FINISHED-AT-UNIVERSAL-TIME
   4000703190)
  :RESULT
  (:CELLS 7 :SAMPLES 35 :HEAP-BYTES 0 :COLD-ARITY 1 :REFERENCE
   ((:NAME :INLINE-23 :HEADER (23) :NEXT 3 :TOKEN 2052 :SINK 16791552)
    (:NAME :NEGATIVE-WIRE-24 :HEADER (56 24) :NEXT 4 :TOKEN 2578 :SINK
     18946048)
    (:NAME :U16-256 :HEADER (89 1 0) :NEXT 5 :TOKEN 2916 :SINK 20330496)
    (:NAME :U32-65536 :HEADER (122 0 1 0 0) :NEXT 7 :TOKEN 3678 :SINK 23451648)
    (:NAME :U64-FIRST :HEADER (155 0 0 0 1 0 0 0 0) :NEXT 11 :TOKEN 5103 :SINK
     29288448)
    (:NAME :U64-MAXIMUM :HEADER (187 255 255 255 255 255 255 255 255) :NEXT 11
     :TOKEN 20492 :SINK 92321792)
    (:NAME :TAG-ASYMMETRIC :HEADER (219 1 2 3 4 5 6 7 8) :NEXT 11 :TOKEN 5600
     :SINK 31324160))
   :BASELINE
   (:ITERATIONS 4096 :WARMUP-ITERATIONS 128 :HEAP-BYTES 0 :RAW-TICKS 27
    :SECONDS 2.7d-5 :SINK 8386560 :EXPECTED-SINK 8386560 :EXPECTED-RETURN-TOKEN
    0 :CALLS-PER-SECOND 1.517037037037037d8)
   :POSITIVE-CONTROL
   (:ITERATIONS 16 :WARMUP-ITERATIONS 0 :HEAP-BYTES 16777472 :RAW-TICKS 52
    :SECONDS 5.2d-5 :SINK 16777336 :EXPECTED-SINK 16777336
    :EXPECTED-RETURN-TOKEN 1048576 :CALLS-PER-SECOND 307692.3076923077d0)))
 :SCHEMA-VERSION 1 :KIND :CBOR-WRITE-DATA-AUDIT :STATUS :FAILED :RECORDED-AT
 4000703700 :CLIENT-DATE "2026-10-11" :READ-POLICY
 (:READ-EVAL NIL :SINGLE-FORM-EOF :COMMON-LISP-ONLY :PRODUCT-NOT-LOADED))
