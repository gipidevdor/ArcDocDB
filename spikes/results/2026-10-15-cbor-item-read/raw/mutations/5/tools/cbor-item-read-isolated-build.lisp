;;;; Runner della copia isolata; avvia la build rigorosa originale.
(REQUIRE :ASDF)
(ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS
 '(:OUTPUT-TRANSLATIONS
   ("/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/"
    "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-item-read-20261015/mutations/5/fasl/")
   :IGNORE-INHERITED-CONFIGURATION))
(LOAD "tools/build.lisp")
