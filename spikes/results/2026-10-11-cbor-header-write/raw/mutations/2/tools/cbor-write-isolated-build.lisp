;;;; Runner della copia isolata; avvia la build rigorosa originale.
(REQUIRE :ASDF)
(ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS
 '(:OUTPUT-TRANSLATIONS
   ("/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/2/"
    "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/2/fasl/")
   :IGNORE-INHERITED-CONFIGURATION))
(LOAD "tools/build.lisp")
