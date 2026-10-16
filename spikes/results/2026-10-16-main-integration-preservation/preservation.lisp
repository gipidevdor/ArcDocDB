(:schema-version 1
 :kind :main-integration-preservation
 :date "2026-10-16"
 :status :ok
 :audit-base-main "435866f66099bd0d05623701d3bcf79b8481dc0d"
 :deleted-branch-tips ((:ref "refs/heads/codex/cbor-item-read"
 :commit "1bdfce485633cacc924d5e7a3b1149b0185a4fa9"
 :reachable-from-main t)
 (:ref "refs/heads/codex/cbor-string-read"
 :commit "998c9621ba0886c2c7ea8f23a581b9cf50abcb0a"
 :reachable-from-main t)
 (:ref "refs/heads/codex/command-archive-collector"
 :commit "7c7255fad65336f7a7fff361ba569ad12fec1537"
 :reachable-from-main t)
 (:ref "refs/heads/codex/fulltext-core"
 :commit "6a84e3269d43fb5164c0a1296bc4e2422982cb3c"
 :reachable-from-main t)
 (:ref "refs/heads/codex/get-outcome-verification"
 :commit "f06cac14f587edad971c0edd048eef0e375ba970"
 :reachable-from-main t)
 (:ref "refs/heads/codex/parallel-evidence"
 :commit "6467624ca78f1652aaefb30fe84e9dac1a0033b8"
 :reachable-from-main t)
 (:ref "refs/heads/codex/reader-verification"
 :commit "9a768634e3c081226212f8ebeb10ff10bee07360"
 :reachable-from-main t))
 :worktree-heads ((:path "/Users/gpicchiarelli/Documents/ArcDocDB"
 :commit "435866f66099bd0d05623701d3bcf79b8481dc0d"
 :reachable-from-main t
 :working-state :preservation-files-only)
 (:path "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB"
 :commit "d7135d336ea73c026b274eaa8e9ce14e63996a9b"
 :reachable-from-main t
 :working-state :clean)
 (:path "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB"
 :commit "1bdfce485633cacc924d5e7a3b1149b0185a4fa9"
 :reachable-from-main t
 :working-state :clean)
 (:path "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB"
 :commit "2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11"
 :reachable-from-main t
 :working-state :clean)
 (:path "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB"
 :commit "6467624ca78f1652aaefb30fe84e9dac1a0033b8"
 :reachable-from-main t
 :working-state :clean)
 (:path "/Users/gpicchiarelli/.codex/worktrees/fulltext-core/ArcDocDB"
 :commit "01890f9f31e748f6bfa7d082f29b7ac55ba1ddf6"
 :reachable-from-main t
 :working-state :clean)
 (:path "/Users/gpicchiarelli/.codex/worktrees/get-outcome-verification/ArcDocDB"
 :commit "f06cac14f587edad971c0edd048eef0e375ba970"
 :reachable-from-main t
 :working-state :clean)
 (:path "/Users/gpicchiarelli/.codex/worktrees/reader-verification/ArcDocDB"
 :commit "9a768634e3c081226212f8ebeb10ff10bee07360"
 :reachable-from-main t
 :working-state :clean)
 (:path "/Users/gpicchiarelli/.codex/worktrees/snapshot-verification/ArcDocDB"
 :commit "9457742fdafa5d633447ab0f28b0c7231684a940"
 :reachable-from-main t
 :working-state :clean)
 (:path "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB"
 :commit "110e79f10a7a9688694c6a48771bb0d928ca85ed"
 :reachable-from-main t
 :working-state :clean))
 :additional-integrated-heads ("d7135d336ea73c026b274eaa8e9ce14e63996a9b"
 "01890f9f31e748f6bfa7d082f29b7ac55ba1ddf6")
 :local-copies ((:original-path "arcdocdb 2.asd"
 :archived-path "raw/arcdocdb-preexisting-copy.asd.txt"
 :canonical-path "arcdocdb.asd"
 :original-git-blob "f20f139516622495864eb7160268dc2dc06f9461"
 :canonical-git-blob "6d988741a426434acc3f9eae5281bf915f23d7e0"
 :bytes 21299
 :sha256 "7b7d7222b6b6ce26b6be1cb0590748628d9ee190dc581b76df6aad976e858f95"
 :byte-identical-copy t
 :relation-to-canonical "Elenco ASDF precedente; i moduli sono presenti nel file canonico ampliato.")
 (:original-path "src/codec/package 2.lisp"
 :archived-path "raw/codec-package-preexisting-copy.lisp.txt"
 :canonical-path "src/codec/package.lisp"
 :original-git-blob "7139b8ce1a947efe6599f2cbbdf78a02e35a68f1"
 :canonical-git-blob "7139b8ce1a947efe6599f2cbbdf78a02e35a68f1"
 :bytes 414
 :sha256 "f9290165b869702d1787489cb36940d48c8a53b45456db98c1c9b5060acb8637"
 :byte-identical-copy t
 :relation-to-canonical "Identico al package canonico.")
 (:original-path "src/codec/utf8 2.lisp"
 :archived-path "raw/codec-utf8-preexisting-copy.lisp.txt"
 :canonical-path "src/codec/utf8.lisp"
 :original-git-blob "badbbff542ed9e8cd18435544c1f3111c99fda1c"
 :canonical-git-blob "e2339f232be3d432311503cb48f9ad8e2e53e8e8"
 :bytes 7377
 :sha256 "69ef45cfcd57237d05afdd31f5d3eb1a6a2fb198c8c74c64742a1db03ebd6465"
 :byte-identical-copy t
 :relation-to-canonical "Lettore scalare precedente; il canonico aggiunge il controllo esplicito della larghezza impossibile.")
 (:original-path "docs/adr/0055-interfaccia-locale-unix-socket 2.md"
 :archived-path "raw/adr-0055-preexisting-copy.md.txt"
 :canonical-path "docs/adr/0055-interfaccia-locale-unix-socket.md"
 :original-git-blob "34dc862714c81665e5d7e997b4ca301b270417e9"
 :canonical-git-blob "34dc862714c81665e5d7e997b4ca301b270417e9"
 :bytes 7468
 :sha256 "67c6fe622a8c7a57f62862373bd4d00aabfbe896cb5efbefd40d478f5675f54e"
 :byte-identical-copy t
 :relation-to-canonical "Identico alla decisione canonica."))
 :verification-input-audit "verification-inputs.lisp"
 :limits (:reachability-and-byte-preservation
 :archived-variants-are-source-data
 :own-preservation-files-pending-this-commit
 :product-verification-recorded-separately))
