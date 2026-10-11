;;;; Runner della copia isolata; avvia la build rigorosa originale.
(REQUIRE :ASDF)
(ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS
 '(:OUTPUT-TRANSLATIONS
   ("/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/"
    "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/mutations/baseline/fasl/")
   :IGNORE-INHERITED-CONFIGURATION))
(LOAD "tools/build.lisp")
