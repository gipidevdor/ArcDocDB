;;;; Runner della copia isolata; avvia la build rigorosa originale.
(REQUIRE :ASDF)
(ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS
 '(:OUTPUT-TRANSLATIONS
   ("/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/"
    "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-mutations-20261011/7/fasl/")
   :IGNORE-INHERITED-CONFIGURATION))
(LOAD "tools/build.lisp")
