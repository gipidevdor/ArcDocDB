;;; DATI SCHEMA 1: non caricare/eseguire questo file.
;;; Auto-attestazione preliminare NON QUALIFICANTE; nessuna nuova esecuzione.
;;; Comandi e output trascritti dalla chat; stdout/stderr raw separati non conservati.
;;; Hash e ambiente retrospettivi: non attribuirli agli input runtime del 15/15.
(:schema-version 1
 :kind :preliminary-test-evidence
 :scope :key-hash
 :agent "Turing"
 :status :self-reported-preliminary
 :record-source :agent-self-report
 :runtime-record nil
 :product-qualification nil
 :accepted-for-qualification nil
 :new-test-executions-for-this-record 0
 :recorded-at "2026-10-11T13:05:09.777668+02:00"
 :conservation-activity "Sola trascrizione di chiamate precedenti, lettura di metadati e hash dei file; nessun nuovo corpo test, loader Lisp, benchmark, linter o mutante eseguito."
 :limits (:after-the-fact-transcription
  :not-product-qualification
  :no-runtime-source-hashes
  :no-separate-stdout-stderr
  :style-warnings-muffled-in-historical-commands
  :post-run-product-changes)
 :qualification-statement "AUTO-ATTESTAZIONE NON QUALIFICANTE. Il 15/15 e i fallimenti precedenti sono conservati dalla trascrizione della chat, senza un registratore strutturato coevo. Output originali separati stdout/stderr NON CONSERVATI; hash e ambiente misurati soltanto dopo le esecuzioni, senza attestazione dei sorgenti effettivamente caricati o di stabilita prima/dopo. Nessuna promozione a evidenza accettata, nessun claim di build senza warning, completezza semantica o correttezza del prodotto."
 :frozen-test (:path "tests/index/hash-digests.lisp"
  :sha256 "12e023a46358ae58accd24c7888e2237c0c4eb6cf7b71fa8567b921978feada5"
  :bytes 34685
  :registered-tests 15
  :freeze-kind :agent-editing-stopped
  :file-permissions-changed nil
  :source-changed-for-conservation nil
  :runtime-hash-basis :not-collected-during-run)
 :environment (:capture-basis :post-run-metadata-only
  :historical-working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
  :historical-shell "/bin/zsh"
  :historical-timezone-from-task "Europe/Rome"
  :runtime-environment-captured nil
  :os (:sysname "Darwin"
   :release "27.0.0"
   :version "Darwin Kernel Version 27.0.0: Tue Aug 11 21:02:57 PDT 2026; root:xnu-13432.1.9~1/RELEASE_ARM64_T8132"
   :machine "arm64"
   :macos-version "27.0.1"
   :macos-build "26A434")
  :sbcl (:requested-executable "sbcl"
   :resolved-path-observed "/opt/homebrew/bin/sbcl"
   :installation-target "/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl"
   :version-from-installation-path "2.6.9"
   :version-command-executed nil
   :executable-sha256-now "62024bec43646b430d6d3e9dafc6beefa1e28869f9b316cc86862b7ba9ccf188")
  :environment-variables-now (:SHELL "/bin/zsh"
   :PATH "/opt/homebrew/bin:/opt/homebrew/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/pkg/env/global/bin:/opt/X11/bin:/Library/Apple/usr/bin:/usr/local/share/dotnet:~/.dotnet/tools:/usr/local/go/bin:/opt/homebrew/bin:/Applications/ChatGPT.app/Contents/Resources/codex-cli/codex-path:/Users/gpicchiarelli/.codex/tmp/arg0/codex-arg0k5NcM8:/Users/gpicchiarelli/.cache/codex-runtimes/codex-primary-runtime/dependencies/bin/override:/Users/gpicchiarelli/.local/bin:/opt/homebrew/sbin:/opt/local/bin:/opt/local/sbin:/Users/gpicchiarelli/.cache/codex-runtimes/codex-primary-runtime/dependencies/bin/fallback:/Applications/ChatGPT.app/Contents/Resources:/Applications/ChatGPT.app/Contents/Resources/codex-cli/CodexCLI.app/Contents/MacOS"
   :LANG "C.UTF-8"
   :LC-ALL "C.UTF-8"
   :LC-CTYPE "C.UTF-8"
   :TZ nil)
  :limit "Metadati della conservazione, non una cattura coeva delle tre chiamate; non provano l'ambiente storico.")
 :repository (:working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
  :head-at-conservation "fdde3a9d2ca0bd8b86ffeb6a51e6340d3dce5140"
  :status-at-conservation-before-record " M docs/implementazione/hash-chiavi-metodo.md
"
  :runtime-head-before nil
  :runtime-head-after nil
  :parent-changes-observed ("src/hash/blocks.lisp"
   "src/hash/package.lisp"
   "src/index/hash-digests.lisp")
  :limit "Il parent sta correggendo il prodotto; il snapshot corrente non viene attribuito al precedente 15/15.")
 :loaded-source-paths ("src/foundation/package.lisp"
  "src/foundation/conditions.lisp"
  "src/foundation/binary.lisp"
  "src/foundation/crc32c.lisp"
  "src/foundation/record.lisp"
  "src/foundation/batch.lisp"
  "src/hash/package.lisp"
  "src/hash/arithmetic.lisp"
  "src/hash/blocks.lisp"
  "src/hash/hash64.lisp"
  "src/index/package.lisp"
  "src/index/types.lisp"
  "src/index/core.lisp"
  "src/index/validation.lisp"
  "src/index/read.lisp"
  "src/index/write.lisp"
  "src/index/relocate.lisp"
  "src/index/primary-package.lisp"
  "src/index/primary-types.lisp"
  "src/index/primary-core.lisp"
  "src/index/primary-build.lisp"
  "src/index/primary-probe.lisp"
  "src/index/primary-read.lisp"
  "src/index/primary-write.lisp"
  "src/index/primary-relocate.lisp"
  "src/index/primary-arena.lisp"
  "src/index/primary-directory.lisp"
  "src/index/rebuild-scan.lisp"
  "src/index/rebuild-budget.lisp"
  "src/index/rebuild-copy.lisp"
  "src/index/rebuild.lisp"
  "src/index/hash-seed.lisp"
  "src/index/hash-digests.lisp"
  "tests/foundation/support.lisp"
  "tests/index/primary-support.lisp"
  "tests/index/hash-digests.lisp")
 :source-hash-algorithm :sha256
 :source-hashes-at-conservation ((:path "src/foundation/package.lisp"
   :sha256 "7567bd326f16df6200bc8d786a66a8eb8db6892c0eaf59df85e667231b6ce837"
   :bytes 1501)
  (:path "src/foundation/conditions.lisp"
   :sha256 "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
   :bytes 2239)
  (:path "src/foundation/binary.lisp"
   :sha256 "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
   :bytes 3295)
  (:path "src/foundation/crc32c.lisp"
   :sha256 "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
   :bytes 3332)
  (:path "src/foundation/record.lisp"
   :sha256 "1afe1ab9951ac1f35ff4e0439e0e65e2f5bf551b2cb4ac241893654de75ae8e2"
   :bytes 16369)
  (:path "src/foundation/batch.lisp"
   :sha256 "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
   :bytes 5228)
  (:path "src/hash/package.lisp"
   :sha256 "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0"
   :bytes 477)
  (:path "src/hash/arithmetic.lisp"
   :sha256 "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9"
   :bytes 3073)
  (:path "src/hash/blocks.lisp"
   :sha256 "548acad762347870ca803c729312b92a9dd0afc5553791095a1545b847e0c768"
   :bytes 3084)
  (:path "src/hash/hash64.lisp"
   :sha256 "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f"
   :bytes 1768)
  (:path "src/index/package.lisp"
   :sha256 "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507"
   :bytes 727)
  (:path "src/index/types.lisp"
   :sha256 "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e"
   :bytes 2434)
  (:path "src/index/core.lisp"
   :sha256 "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff"
   :bytes 2959)
  (:path "src/index/validation.lisp"
   :sha256 "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a"
   :bytes 3930)
  (:path "src/index/read.lisp"
   :sha256 "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7"
   :bytes 3030)
  (:path "src/index/write.lisp"
   :sha256 "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28"
   :bytes 4784)
  (:path "src/index/relocate.lisp"
   :sha256 "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc"
   :bytes 2383)
  (:path "src/index/primary-package.lisp"
   :sha256 "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860"
   :bytes 1451)
  (:path "src/index/primary-types.lisp"
   :sha256 "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64"
   :bytes 3949)
  (:path "src/index/primary-core.lisp"
   :sha256 "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e"
   :bytes 4211)
  (:path "src/index/primary-build.lisp"
   :sha256 "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b"
   :bytes 5379)
  (:path "src/index/primary-probe.lisp"
   :sha256 "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4"
   :bytes 5936)
  (:path "src/index/primary-read.lisp"
   :sha256 "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f"
   :bytes 3575)
  (:path "src/index/primary-write.lisp"
   :sha256 "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655"
   :bytes 7061)
  (:path "src/index/primary-relocate.lisp"
   :sha256 "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20"
   :bytes 4073)
  (:path "src/index/primary-arena.lisp"
   :sha256 "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5"
   :bytes 3485)
  (:path "src/index/primary-directory.lisp"
   :sha256 "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd"
   :bytes 8114)
  (:path "src/index/rebuild-scan.lisp"
   :sha256 "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e"
   :bytes 5002)
  (:path "src/index/rebuild-budget.lisp"
   :sha256 "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0"
   :bytes 3593)
  (:path "src/index/rebuild-copy.lisp"
   :sha256 "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee"
   :bytes 4027)
  (:path "src/index/rebuild.lisp"
   :sha256 "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1"
   :bytes 2872)
  (:path "src/index/hash-seed.lisp"
   :sha256 "5dcc8a1164473392b56ba5be7b0f047d2a59322a9abf1e80e485c624c6f4b9c8"
   :bytes 1800)
  (:path "src/index/hash-digests.lisp"
   :sha256 "d2c3080e6eaf2355fce8256f3c1ed82889b5cda9b9bef7e071d6f069d8d88cf5"
   :bytes 3669)
  (:path "tests/foundation/support.lisp"
   :sha256 "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
   :bytes 2464)
  (:path "tests/index/primary-support.lisp"
   :sha256 "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a"
   :bytes 13938)
  (:path "tests/index/hash-digests.lisp"
   :sha256 "12e023a46358ae58accd24c7888e2237c0c4eb6cf7b71fa8567b921978feada5"
   :bytes 34685)
  (:path "arcdocdb.asd"
   :sha256 "cd0562994e8cd5de7de01ab118a44f76359916977e02b7d4ad07c2e0e1ed32f5"
   :bytes 9365))
 :historical-revision-candidate (:revision "fdde3a9d2ca0bd8b86ffeb6a51e6340d3dce5140"
  :hashes ((:path "src/foundation/package.lisp"
    :sha256 "7567bd326f16df6200bc8d786a66a8eb8db6892c0eaf59df85e667231b6ce837"
    :bytes 1501)
   (:path "src/foundation/conditions.lisp"
    :sha256 "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb"
    :bytes 2239)
   (:path "src/foundation/binary.lisp"
    :sha256 "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea"
    :bytes 3295)
   (:path "src/foundation/crc32c.lisp"
    :sha256 "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b"
    :bytes 3332)
   (:path "src/foundation/record.lisp"
    :sha256 "1afe1ab9951ac1f35ff4e0439e0e65e2f5bf551b2cb4ac241893654de75ae8e2"
    :bytes 16369)
   (:path "src/foundation/batch.lisp"
    :sha256 "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3"
    :bytes 5228)
   (:path "src/hash/package.lisp"
    :sha256 "1e7668fa26fc1a8e3b3cfe824aa3e08b30b57441d5f90d44453fc3a9259a10d0"
    :bytes 477)
   (:path "src/hash/arithmetic.lisp"
    :sha256 "c439e534b768acb123d69b921b85e1e56683aa8335bbc87efba95fe95f256fa9"
    :bytes 3073)
   (:path "src/hash/blocks.lisp"
    :sha256 "548acad762347870ca803c729312b92a9dd0afc5553791095a1545b847e0c768"
    :bytes 3084)
   (:path "src/hash/hash64.lisp"
    :sha256 "99e4c8394a8f877ce1f552f15a57a082c0ec81015e87119ee4ffea28cf3ae77f"
    :bytes 1768)
   (:path "src/index/package.lisp"
    :sha256 "29a92a82463779da1cdc1b54ee614d98fa53c586047ab237892fd0bc88f71507"
    :bytes 727)
   (:path "src/index/types.lisp"
    :sha256 "9e5de440049100c740f222234a2fc3d9daf7405f31a5ab0eae9e076872766c4e"
    :bytes 2434)
   (:path "src/index/core.lisp"
    :sha256 "26c8ea468f67d19f80f0adceaade4310e72ee7d8409132947b06c040bb649bff"
    :bytes 2959)
   (:path "src/index/validation.lisp"
    :sha256 "205ea3fe20d69cce0daaf43a5a8f16f33aedef813b0744f4f9115ad049f3ea8a"
    :bytes 3930)
   (:path "src/index/read.lisp"
    :sha256 "8718fa96b37de6a97bc60f94f44b2ed8a7f2d14ebf95581c86c9e3624feb2cf7"
    :bytes 3030)
   (:path "src/index/write.lisp"
    :sha256 "c69072fb3eecd051cb9a37383712f11ab38229ed2e368771c94e198689222b28"
    :bytes 4784)
   (:path "src/index/relocate.lisp"
    :sha256 "136f92a62d1339797dfeaf35ba6c13e1274b5b95b8fb4d14051d675fb8880bbc"
    :bytes 2383)
   (:path "src/index/primary-package.lisp"
    :sha256 "0682eb9a61596506b6788bd0285f9808db2496246caae64ab3203182ed46b860"
    :bytes 1451)
   (:path "src/index/primary-types.lisp"
    :sha256 "f17ca0dcd8a538b921f00044e23872b28272638c4435eacd30f0509422505e64"
    :bytes 3949)
   (:path "src/index/primary-core.lisp"
    :sha256 "730c4f0c3a13188c5e5d4ee179b7611b58b297f6d198fc7f7b1449955b97b50e"
    :bytes 4211)
   (:path "src/index/primary-build.lisp"
    :sha256 "06ca5ac8c03504e2d2f973873e5cabf7518c090cd1f8f2118c46e0ea2f9bf37b"
    :bytes 5379)
   (:path "src/index/primary-probe.lisp"
    :sha256 "61093d26a2010f83096e3532597b590b1d07720bfcd1f3c225f2a995c7db06d4"
    :bytes 5936)
   (:path "src/index/primary-read.lisp"
    :sha256 "bb4b56aaa7087d3a272a814d0f14d1e17f7e713266323aa04fffef0abcbc696f"
    :bytes 3575)
   (:path "src/index/primary-write.lisp"
    :sha256 "30298b5f27aa94523e3bfc92f40c1f3aa2532c75207e4f4ac2d1d34d580a4655"
    :bytes 7061)
   (:path "src/index/primary-relocate.lisp"
    :sha256 "1ee0fe72ecb6d65744e4de9c69e0a6540c5f29a1c34667ff322c4d3001f77b20"
    :bytes 4073)
   (:path "src/index/primary-arena.lisp"
    :sha256 "1518086c44c7b98cc6866869f722d357e1a318cd666291237f1e54f1a6e7f6f5"
    :bytes 3485)
   (:path "src/index/primary-directory.lisp"
    :sha256 "8f291fa0155d69aec98b562e70123c7acdd2f40a0da26729e227405e308ed7dd"
    :bytes 8114)
   (:path "src/index/rebuild-scan.lisp"
    :sha256 "2293aa5c0956f40dbf48cd7d7becde0f8bda4bbb3fcd7f6e40f4b33424c74c5e"
    :bytes 5002)
   (:path "src/index/rebuild-budget.lisp"
    :sha256 "ac35554073d8eb1b809629079ea4a00cbbc1925f01a0e6e745b2591bb5effae0"
    :bytes 3593)
   (:path "src/index/rebuild-copy.lisp"
    :sha256 "5245fbf86161cde7a7c44f5bcc417ac150b7cd6a34a6bab09dacbf260d3ea6ee"
    :bytes 4027)
   (:path "src/index/rebuild.lisp"
    :sha256 "17438f95b8105b8202279e936c149d61836b80c7db33a0384e86c4e964f7e7e1"
    :bytes 2872)
   (:path "src/index/hash-seed.lisp"
    :sha256 "5dcc8a1164473392b56ba5be7b0f047d2a59322a9abf1e80e485c624c6f4b9c8"
    :bytes 1800)
   (:path "src/index/hash-digests.lisp"
    :sha256 "d2c3080e6eaf2355fce8256f3c1ed82889b5cda9b9bef7e071d6f069d8d88cf5"
    :bytes 3669)
   (:path "tests/foundation/support.lisp"
    :sha256 "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b"
    :bytes 2464)
   (:path "tests/index/primary-support.lisp"
    :sha256 "222d6282e69a1011c9f8c78cf739cf937a10a68aa2094ea5fdaea7e905e3e89a"
    :bytes 13938)
   (:path "tests/index/hash-digests.lisp"
    :sha256 "12e023a46358ae58accd24c7888e2237c0c4eb6cf7b71fa8567b921978feada5"
    :bytes 34685)
   (:path "arcdocdb.asd"
    :sha256 "cd0562994e8cd5de7de01ab118a44f76359916977e02b7d4ad07c2e0e1ed32f5"
    :bytes 9365))
  :basis :retrospective-git-content
  :qualification nil
  :limit "Hash di blob Git calcolati adesso: candidato storico ricostruibile, NON snapshot runtime. Il test untracked ha solo hash retrospettivi delle patch.")
 :attempts ((:id "load-01-failed"
   :command "sbcl --noinform --script /dev/stdin <<'LISP'
(handler-bind ((style-warning #'muffle-warning))
  (dolist (file '(\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\"
                  \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\"
                  \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\"
                  \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\"
                  \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\"
                  \"src/index/package.lisp\" \"src/index/types.lisp\" \"src/index/core.lisp\"
                  \"src/index/validation.lisp\" \"src/index/read.lisp\" \"src/index/write.lisp\"
                  \"src/index/relocate.lisp\" \"src/index/primary-package.lisp\"
                  \"src/index/primary-types.lisp\" \"src/index/primary-core.lisp\"
                  \"src/index/primary-build.lisp\" \"src/index/primary-probe.lisp\"
                  \"src/index/primary-read.lisp\" \"src/index/primary-write.lisp\"
                  \"src/index/primary-relocate.lisp\" \"src/index/primary-arena.lisp\"
                  \"src/index/primary-directory.lisp\" \"src/index/rebuild-scan.lisp\"
                  \"src/index/rebuild-budget.lisp\" \"src/index/rebuild-copy.lisp\"
                  \"src/index/rebuild.lisp\" \"src/index/hash-seed.lisp\"
                  \"src/index/hash-digests.lisp\" \"tests/foundation/support.lisp\"
                  \"tests/index/primary-support.lisp\" \"tests/index/hash-digests.lisp\"))
    (load file)))
(format t \"Loaded ~D hash-map tests without running them.~%\"
        (length arcdocdb.index.primary.tests::*tests*))
LISP"
   :command-basis :exact-tool-call-text-transcribed
   :shell "/bin/zsh"
   :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
   :argv ("sbcl"
    "--noinform"
    "--script"
    "/dev/stdin")
   :stdin-transport :shell-heredoc
   :stdin-program "(handler-bind ((style-warning #'muffle-warning))
  (dolist (file '(\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\"
                  \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\"
                  \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\"
                  \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\"
                  \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\"
                  \"src/index/package.lisp\" \"src/index/types.lisp\" \"src/index/core.lisp\"
                  \"src/index/validation.lisp\" \"src/index/read.lisp\" \"src/index/write.lisp\"
                  \"src/index/relocate.lisp\" \"src/index/primary-package.lisp\"
                  \"src/index/primary-types.lisp\" \"src/index/primary-core.lisp\"
                  \"src/index/primary-build.lisp\" \"src/index/primary-probe.lisp\"
                  \"src/index/primary-read.lisp\" \"src/index/primary-write.lisp\"
                  \"src/index/primary-relocate.lisp\" \"src/index/primary-arena.lisp\"
                  \"src/index/primary-directory.lisp\" \"src/index/rebuild-scan.lisp\"
                  \"src/index/rebuild-budget.lisp\" \"src/index/rebuild-copy.lisp\"
                  \"src/index/rebuild.lisp\" \"src/index/hash-seed.lisp\"
                  \"src/index/hash-digests.lisp\" \"tests/foundation/support.lisp\"
                  \"tests/index/primary-support.lisp\" \"tests/index/hash-digests.lisp\"))
    (load file)))
(format t \"Loaded ~D hash-map tests without running them.~%\"
        (length arcdocdb.index.primary.tests::*tests*))
"
   :exit-code 1
   :wall-time-seconds 0.836239458
   :tool-chunk-id "471b90"
   :started-at nil
   :finished-at nil
   :stdout nil
   :stderr nil
   :stdout-status :not-separately-retained
   :stderr-status :not-separately-retained
   :combined-output "Unhandled SB-C::INPUT-ERROR-IN-LOAD in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                                 {80052605A3}>:
  READ error during LOAD:

    unmatched close parenthesis

      Line: 388, Column: 84, File-Position: 23555

      Stream: #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp\" {80088A01B3}>

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80052605A3}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SB-C::INPUT-ERROR-IN-LOAD {8006F2FDE3}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK SB-EXT:*INVOKE-DEBUGGER-HOOK* #<SB-C::INPUT-ERROR-IN-LOAD {8006F2FDE3}>)
2: (INVOKE-DEBUGGER #<SB-C::INPUT-ERROR-IN-LOAD {8006F2FDE3}>)
3: (ERROR #<SB-C::INPUT-ERROR-IN-LOAD {8006F2FDE3}>)
4: (SB-C:COMPILER-ERROR SB-C::INPUT-ERROR-IN-LOAD :CONDITION #<SB-INT:SIMPLE-READER-ERROR \"unmatched close parenthesis\" {8006F2FD93}> :STREAM #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp\" {80088A01B3}>)
5: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {107A21DAB}> #<SB-C::SOURCE-INFO {80088A0403}> SB-C::INPUT-ERROR-IN-LOAD)
6: (SB-INT:LOAD-AS-SOURCE #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp\" {80088A01B3}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
7: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp\" {80088A01B3}> NIL)
8: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {107A2187B}> #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp\" {80088A01B3}> NIL #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp\" {80088A01B3}>)
9: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp\" {80088A01B3}> NIL)
10: (LOAD \"tests/index/hash-digests.lisp\" :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
11: (\"top level form\") [toplevel]
12: ((FLET \"G\" :IN SB-C::%COMPILE-IN-LEXENV))
13: (SB-C::%COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LOAD-TIME-VALUE # T) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (DOLIST (COMMON-LISP-USER::FILE (QUOTE #)) (LOAD COMMON-LISP-USER::FILE)))) #<NULL-LEXENV> NIL #<SB-C::SOURCE-INFO {8003870423}> 0 NIL T T)
14: (SB-C:EVAL-WITH-COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LOAD-TIME-VALUE # T) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (DOLIST (COMMON-LISP-USER::FILE (QUOTE #)) (LOAD COMMON-LISP-USER::FILE)))) #<NULL-LEXENV> #<SB-C::SOURCE-INFO {8003870423}> 0 NIL)
15: (SB-IMPL::%SIMPLE-EVAL (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LOAD-TIME-VALUE # T) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (DOLIST (COMMON-LISP-USER::FILE (QUOTE #)) (LOAD COMMON-LISP-USER::FILE)))) #<NULL-LEXENV>)
16: (SB-INT:SIMPLE-EVAL-IN-LEXENV (HANDLER-BIND ((STYLE-WARNING (FUNCTION MUFFLE-WARNING))) (DOLIST (COMMON-LISP-USER::FILE (QUOTE (\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\" \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\" \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\" \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\" \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\" \"src/index/package.lisp\" \"src/index/types.lisp\" ...))) (LOAD COMMON-LISP-USER::FILE))) #<NULL-LEXENV>)
17: (SB-EXT:EVAL-TLF (HANDLER-BIND ((STYLE-WARNING (FUNCTION MUFFLE-WARNING))) (DOLIST (COMMON-LISP-USER::FILE (QUOTE (\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\" \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\" \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\" \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\" \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\" \"src/index/package.lisp\" \"src/index/types.lisp\" ...))) (LOAD COMMON-LISP-USER::FILE))) 0 NIL)
18: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((STYLE-WARNING (FUNCTION MUFFLE-WARNING))) (DOLIST (COMMON-LISP-USER::FILE (QUOTE (\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\" \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\" \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\" \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\" \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\" \"src/index/package.lisp\" \"src/index/types.lisp\" ...))) (LOAD COMMON-LISP-USER::FILE))) 0)
19: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((STYLE-WARNING (FUNCTION MUFFLE-WARNING))) (DOLIST (COMMON-LISP-USER::FILE (QUOTE (\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\" \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\" \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\" \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\" \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\" \"src/index/package.lisp\" \"src/index/types.lisp\" ...))) (LOAD COMMON-LISP-USER::FILE))) :CURRENT-INDEX 0)
20: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {107A20F1B}> #<SB-C::SOURCE-INFO {8003870423}> SB-C::INPUT-ERROR-IN-LOAD)
21: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \"file /dev/stdin\" {8003870043}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
22: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \"file /dev/stdin\" {8003870043}> NIL)
23: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {107A209EB}> #<SB-SYS:FD-STREAM for \"file /dev/stdin\" {8003870043}> NIL #<SB-SYS:FD-STREAM for \"file /dev/stdin\" {8003870043}>)
24: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \"file /dev/stdin\" {8003870043}> NIL)
25: (LOAD #<SB-SYS:FD-STREAM for \"file /dev/stdin\" {8003870043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
26: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \"file /dev/stdin\" {8003870043}>)
27: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
28: ((FLET \"WITHOUT-INTERRUPTS-BODY-\" :IN SB-IMPL::PROCESS-SCRIPT))
29: (SB-IMPL::PROCESS-SCRIPT \"/dev/stdin\")
30: (SB-IMPL::TOPLEVEL-INIT)
31: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
32: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
33: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
"
   :combined-output-sha256 "b8241988599bf76a139be4adda0f143663f2804587a4ccb74206f4e123064c24"
   :output-basis :agent-transcription-of-tool-transcript
   :output-limit "Trascrizione dall'output combinato dello strumento nella chat. stdout/stderr originali separati NON CONSERVATI; non assumere stderr vuoto. Byte-exactness non attestata; nessun file raw runtime o registratore strutturato coevo recuperato."
   :runtime-record nil
   :source-hashes-before nil
   :source-hashes-after nil
   :runtime-source-consistency :not-measured
   :test-source-sha256 "d82b779e208656b215a4adafaaf24a4ffaf1affd24f3438a51f485b363836ded"
   :test-hash-basis :retrospective-reconstruction-from-chat-patches
   :qualification nil
   :outcome (:kind :load-failed
    :tests-called 0
    :cause "Parentesi chiusa eccedente alla riga 388; INPUT-ERROR-IN-LOAD. Nessun corpo test chiamato."))
  (:id "suite-02-failed"
   :command "sbcl --noinform --script /dev/stdin <<'LISP'
(handler-bind ((style-warning #'muffle-warning))
  (dolist (file '(\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\"
                  \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\"
                  \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\"
                  \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\"
                  \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\"
                  \"src/index/package.lisp\" \"src/index/types.lisp\" \"src/index/core.lisp\"
                  \"src/index/validation.lisp\" \"src/index/read.lisp\" \"src/index/write.lisp\"
                  \"src/index/relocate.lisp\" \"src/index/primary-package.lisp\"
                  \"src/index/primary-types.lisp\" \"src/index/primary-core.lisp\"
                  \"src/index/primary-build.lisp\" \"src/index/primary-probe.lisp\"
                  \"src/index/primary-read.lisp\" \"src/index/primary-write.lisp\"
                  \"src/index/primary-relocate.lisp\" \"src/index/primary-arena.lisp\"
                  \"src/index/primary-directory.lisp\" \"src/index/rebuild-scan.lisp\"
                  \"src/index/rebuild-budget.lisp\" \"src/index/rebuild-copy.lisp\"
                  \"src/index/rebuild.lisp\" \"src/index/hash-seed.lisp\"
                  \"src/index/hash-digests.lisp\" \"tests/foundation/support.lisp\"
                  \"tests/index/primary-support.lisp\" \"tests/index/hash-digests.lisp\"))
    (load file)))
(let ((failed 0))
  (dolist (test (reverse arcdocdb.index.primary.tests::*tests*))
    (handler-case (progn (funcall test) (format t \"ok ~A~%\" test))
      (error (condition) (incf failed) (format t \"FAIL ~A: ~A~%\" test condition))))
  (format t \"~D cases, ~D failures.~%\" (length arcdocdb.index.primary.tests::*tests*) failed)
  (sb-ext:exit :code (if (zerop failed) 0 1)))
LISP"
   :command-basis :exact-tool-call-text-transcribed
   :shell "/bin/zsh"
   :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
   :argv ("sbcl"
    "--noinform"
    "--script"
    "/dev/stdin")
   :stdin-transport :shell-heredoc
   :stdin-program "(handler-bind ((style-warning #'muffle-warning))
  (dolist (file '(\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\"
                  \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\"
                  \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\"
                  \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\"
                  \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\"
                  \"src/index/package.lisp\" \"src/index/types.lisp\" \"src/index/core.lisp\"
                  \"src/index/validation.lisp\" \"src/index/read.lisp\" \"src/index/write.lisp\"
                  \"src/index/relocate.lisp\" \"src/index/primary-package.lisp\"
                  \"src/index/primary-types.lisp\" \"src/index/primary-core.lisp\"
                  \"src/index/primary-build.lisp\" \"src/index/primary-probe.lisp\"
                  \"src/index/primary-read.lisp\" \"src/index/primary-write.lisp\"
                  \"src/index/primary-relocate.lisp\" \"src/index/primary-arena.lisp\"
                  \"src/index/primary-directory.lisp\" \"src/index/rebuild-scan.lisp\"
                  \"src/index/rebuild-budget.lisp\" \"src/index/rebuild-copy.lisp\"
                  \"src/index/rebuild.lisp\" \"src/index/hash-seed.lisp\"
                  \"src/index/hash-digests.lisp\" \"tests/foundation/support.lisp\"
                  \"tests/index/primary-support.lisp\" \"tests/index/hash-digests.lisp\"))
    (load file)))
(let ((failed 0))
  (dolist (test (reverse arcdocdb.index.primary.tests::*tests*))
    (handler-case (progn (funcall test) (format t \"ok ~A~%\" test))
      (error (condition) (incf failed) (format t \"FAIL ~A: ~A~%\" test condition))))
  (format t \"~D cases, ~D failures.~%\" (length arcdocdb.index.primary.tests::*tests*) failed)
  (sb-ext:exit :code (if (zerop failed) 0 1)))
"
   :exit-code 1
   :wall-time-seconds 0.782066709
   :tool-chunk-id "41d184"
   :started-at nil
   :finished-at nil
   :stdout nil
   :stderr nil
   :stdout-status :not-separately-retained
   :stderr-status :not-separately-retained
   :combined-output "ok TEST-REQ-IDX-005-HASH-MAP-PHYSICAL-SLOTS
ok TEST-REQ-IDX-005-HASH-MAP-NONLIVE-SENTINELS-AND-EXACT-COUNTS
ok TEST-REQ-IDX-005-HASH-MAP-OUTPUT-ARITY-EMPTY-AND-UNCONFIGURED
FAIL TEST-REQ-IDX-005-HASH-MAP-SEED-CONSTRUCTOR-AND-IMMUTABILITY: Asserzione fallita: (TYPEP
                                                                                       CONDITION
                                                                                       TYPE)
ok TEST-REQ-IDX-005-HASH-MAP-OUTPUT-TYPES-PREFLIGHT
ok TEST-REQ-IDX-005-HASH-MAP-OUTPUT-LENGTHS-PREFLIGHT
ok TEST-REQ-IDX-005-HASH-MAP-OUTPUT-ALIAS-PREFLIGHT
ok TEST-REQ-IDX-005-HASH-MAP-INVALID-SEED-TYPES-PREFLIGHT
ok TEST-REQ-IDX-005-HASH-MAP-SEED-MISMATCH
ok TEST-REQ-IDX-005-HASH-MAP-STALE-SOURCE
ok TEST-REQ-IDX-005-HASH-MAP-BUILDING-SOURCE
ok TEST-REQ-IDX-005-HASH-MAP-FOREIGN-SOURCE
ok TEST-REQ-IDX-005-HASH-MAP-CANONICAL-ROOT-AND-BANK-GUARDS
ok TEST-REQ-IDX-005-HASH-MAP-CORRUPT-BANK-FAULTS-IMMEDIATELY
ok TEST-REQ-IDX-005-HASH-MAP-CORRUPT-ARENA-AND-LIVE-COUNT
15 cases, 1 failures.
"
   :combined-output-sha256 "6f5b54b49cbaabeec1b5988982314caae316bf031fe78ad47462a2a1c387954c"
   :output-basis :agent-transcription-of-tool-transcript
   :output-limit "Trascrizione dall'output combinato dello strumento nella chat. stdout/stderr originali separati NON CONSERVATI; non assumere stderr vuoto. Byte-exactness non attestata; nessun file raw runtime o registratore strutturato coevo recuperato."
   :runtime-record nil
   :source-hashes-before nil
   :source-hashes-after nil
   :runtime-source-consistency :not-measured
   :test-source-sha256 "0ef35a34a42d9f7bf3de652745543893ce2dc5f38db470abc9771a91964f64e4"
   :test-hash-basis :retrospective-reconstruction-from-chat-patches
   :qualification nil
   :outcome (:kind :tests-failed
    :cases 15
    :passed 14
    :failed 1
    :failure-test "TEST-REQ-IDX-005-HASH-MAP-SEED-CONSTRUCTOR-AND-IMMUTABILITY"
    :cause "Il helper di guasto inoltrava il seed interno NIL al preflight input; attesa di invariant-violation non soddisfatta. La successiva patch usa input u32 zero per le FI di coppia interna incoerente."))
  (:id "suite-03-passed"
   :command "sbcl --noinform --script /dev/stdin <<'LISP'
(handler-bind ((style-warning #'muffle-warning))
  (dolist (file '(\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\"
                  \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\"
                  \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\"
                  \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\"
                  \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\"
                  \"src/index/package.lisp\" \"src/index/types.lisp\" \"src/index/core.lisp\"
                  \"src/index/validation.lisp\" \"src/index/read.lisp\" \"src/index/write.lisp\"
                  \"src/index/relocate.lisp\" \"src/index/primary-package.lisp\"
                  \"src/index/primary-types.lisp\" \"src/index/primary-core.lisp\"
                  \"src/index/primary-build.lisp\" \"src/index/primary-probe.lisp\"
                  \"src/index/primary-read.lisp\" \"src/index/primary-write.lisp\"
                  \"src/index/primary-relocate.lisp\" \"src/index/primary-arena.lisp\"
                  \"src/index/primary-directory.lisp\" \"src/index/rebuild-scan.lisp\"
                  \"src/index/rebuild-budget.lisp\" \"src/index/rebuild-copy.lisp\"
                  \"src/index/rebuild.lisp\" \"src/index/hash-seed.lisp\"
                  \"src/index/hash-digests.lisp\" \"tests/foundation/support.lisp\"
                  \"tests/index/primary-support.lisp\" \"tests/index/hash-digests.lisp\"))
    (load file)))
(let ((failed 0))
  (dolist (test (reverse arcdocdb.index.primary.tests::*tests*))
    (handler-case (progn (funcall test) (format t \"ok ~A~%\" test))
      (error (condition) (incf failed) (format t \"FAIL ~A: ~A~%\" test condition))))
  (format t \"~D cases, ~D failures.~%\" (length arcdocdb.index.primary.tests::*tests*) failed)
  (sb-ext:exit :code (if (zerop failed) 0 1)))
LISP"
   :command-basis :exact-tool-call-text-transcribed
   :shell "/bin/zsh"
   :working-directory "/Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB"
   :argv ("sbcl"
    "--noinform"
    "--script"
    "/dev/stdin")
   :stdin-transport :shell-heredoc
   :stdin-program "(handler-bind ((style-warning #'muffle-warning))
  (dolist (file '(\"src/foundation/package.lisp\" \"src/foundation/conditions.lisp\"
                  \"src/foundation/binary.lisp\" \"src/foundation/crc32c.lisp\"
                  \"src/foundation/record.lisp\" \"src/foundation/batch.lisp\"
                  \"src/hash/package.lisp\" \"src/hash/arithmetic.lisp\"
                  \"src/hash/blocks.lisp\" \"src/hash/hash64.lisp\"
                  \"src/index/package.lisp\" \"src/index/types.lisp\" \"src/index/core.lisp\"
                  \"src/index/validation.lisp\" \"src/index/read.lisp\" \"src/index/write.lisp\"
                  \"src/index/relocate.lisp\" \"src/index/primary-package.lisp\"
                  \"src/index/primary-types.lisp\" \"src/index/primary-core.lisp\"
                  \"src/index/primary-build.lisp\" \"src/index/primary-probe.lisp\"
                  \"src/index/primary-read.lisp\" \"src/index/primary-write.lisp\"
                  \"src/index/primary-relocate.lisp\" \"src/index/primary-arena.lisp\"
                  \"src/index/primary-directory.lisp\" \"src/index/rebuild-scan.lisp\"
                  \"src/index/rebuild-budget.lisp\" \"src/index/rebuild-copy.lisp\"
                  \"src/index/rebuild.lisp\" \"src/index/hash-seed.lisp\"
                  \"src/index/hash-digests.lisp\" \"tests/foundation/support.lisp\"
                  \"tests/index/primary-support.lisp\" \"tests/index/hash-digests.lisp\"))
    (load file)))
(let ((failed 0))
  (dolist (test (reverse arcdocdb.index.primary.tests::*tests*))
    (handler-case (progn (funcall test) (format t \"ok ~A~%\" test))
      (error (condition) (incf failed) (format t \"FAIL ~A: ~A~%\" test condition))))
  (format t \"~D cases, ~D failures.~%\" (length arcdocdb.index.primary.tests::*tests*) failed)
  (sb-ext:exit :code (if (zerop failed) 0 1)))
"
   :exit-code 0
   :wall-time-seconds 1.576787041
   :tool-chunk-id "ac848b"
   :started-at nil
   :finished-at nil
   :stdout nil
   :stderr nil
   :stdout-status :not-separately-retained
   :stderr-status :not-separately-retained
   :combined-output "ok TEST-REQ-IDX-005-HASH-MAP-PHYSICAL-SLOTS
ok TEST-REQ-IDX-005-HASH-MAP-NONLIVE-SENTINELS-AND-EXACT-COUNTS
ok TEST-REQ-IDX-005-HASH-MAP-OUTPUT-ARITY-EMPTY-AND-UNCONFIGURED
ok TEST-REQ-IDX-005-HASH-MAP-SEED-CONSTRUCTOR-AND-IMMUTABILITY
ok TEST-REQ-IDX-005-HASH-MAP-OUTPUT-TYPES-PREFLIGHT
ok TEST-REQ-IDX-005-HASH-MAP-OUTPUT-LENGTHS-PREFLIGHT
ok TEST-REQ-IDX-005-HASH-MAP-OUTPUT-ALIAS-PREFLIGHT
ok TEST-REQ-IDX-005-HASH-MAP-INVALID-SEED-TYPES-PREFLIGHT
ok TEST-REQ-IDX-005-HASH-MAP-SEED-MISMATCH
ok TEST-REQ-IDX-005-HASH-MAP-STALE-SOURCE
ok TEST-REQ-IDX-005-HASH-MAP-BUILDING-SOURCE
ok TEST-REQ-IDX-005-HASH-MAP-FOREIGN-SOURCE
ok TEST-REQ-IDX-005-HASH-MAP-CANONICAL-ROOT-AND-BANK-GUARDS
ok TEST-REQ-IDX-005-HASH-MAP-CORRUPT-BANK-FAULTS-IMMEDIATELY
ok TEST-REQ-IDX-005-HASH-MAP-CORRUPT-ARENA-AND-LIVE-COUNT
15 cases, 0 failures.
"
   :combined-output-sha256 "02b83711c716f8e6cea98c7c525edbdf5158e2d8db3c251a74adde69c2d5c30d"
   :output-basis :agent-transcription-of-tool-transcript
   :output-limit "Trascrizione dall'output combinato dello strumento nella chat. stdout/stderr originali separati NON CONSERVATI; non assumere stderr vuoto. Byte-exactness non attestata; nessun file raw runtime o registratore strutturato coevo recuperato."
   :runtime-record nil
   :source-hashes-before nil
   :source-hashes-after nil
   :runtime-source-consistency :not-measured
   :test-source-sha256 "12e023a46358ae58accd24c7888e2237c0c4eb6cf7b71fa8567b921978feada5"
   :test-hash-basis :retrospective-reconstruction-from-chat-patches
   :qualification nil
   :outcome (:kind :tests-passed
    :cases 15
    :passed 15
    :failed 0
    :scope "Solo il nuovo file test, caricato con le dipendenze sorgente e primary-support; nessun test-system ASDF, benchmark, coverage o mutazione.")))
 :other-failed-or-nonzero-attempts ((:id "authoring-patch-failed"
   :kind :tool-failure
   :tool "tools.apply_patch"
   :request-text "*** Begin Patch
*** Update File: /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp
@@
-                                'invariant-violation :primary-index-faulted)))))))))
+                                'invariant-violation :primary-index-faulted))))))))
@@
-      ;; Reprise du writer apres split: le seed possede reste le meme pour hash et lookup.
+      ;; Il writer dopo lo split usa ancora il seed posseduto per hash e lookup.
*** End Patch"
   :command nil
   :stdout nil
   :stderr nil
   :tool-output "Script error:
apply_patch verification failed: Failed to find expected lines in /Users/gpicchiarelli/.codex/worktrees/hash-chiavi/ArcDocDB/tests/index/hash-digests.lisp:
      ;; Reprise du writer apres split: le seed possede reste le meme pour hash et lookup."
   :basis :agent-transcription-of-tool-transcript
   :cause "Hunk in ordine inverso rispetto alle posizioni nel file; retry successivo con hunk ordinati."
   :product-executed nil
   :qualification nil)
  (:id "inventory-search-no-match"
   :kind :inspection-command-nonzero
   :command "git status --short && rg --files -g AGENTS.md /Users/gpicchiarelli/.codex/worktrees/hash-chiavi /Users/gpicchiarelli/Documents/ArcDocDB"
   :exit-code 1
   :tool-chunk-id "906738"
   :combined-output " M arcdocdb.asd
?? src/hash/
"
   :stdout nil
   :stderr nil
   :output-limit "Trascrizione dall'output combinato dello strumento nella chat. stdout/stderr originali separati NON CONSERVATI; non assumere stderr vuoto. Byte-exactness non attestata; nessun file raw runtime o registratore strutturato coevo recuperato."
   :cause "Ricerca AGENTS senza corrispondenze; nessun test eseguito.")
  (:id "inspection-slot-types-missing"
   :kind :inspection-command-failed
   :command "cat src/index/slot-types.lisp src/index/package.lisp && sed -n '1,185p' arcdocdb.asd && rg -n 'source|bank|root|fault|writable' tests/index/primary.lisp src/index/primary-build.lisp src/index/primary-arena.lisp src/index/primary-write.lisp"
   :exit-code 1
   :tool-chunk-id "799717"
   :combined-output "cat: src/index/slot-types.lisp: No such file or directory
;;; OWNER: un writer logico per banco della Serie; reader con buffer privato preallocato.
;;; SHARED: solo dati della Serie, nessun lock o contatore comune tra Serie.
;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-004 REQ-LIM-001 REQ-AFF-008
(defpackage #:arcdocdb.index.slots
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:u64)
  (:import-from #:arcdocdb.record #:+header-bytes+ #:+max-record-bytes+ #:+max-document-bytes+)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted #:invariant-violation)
  (:export #:banco-slot #:crea-banco-slot #:leggi-slot-v2 #:pubblica-slot-v2
           #:rimuovi-slot-v2 #:riloca-slot-v2 #:credito-scrittura-slot
           #:congela-banco-slot #:invalida-banco-slot))
"
   :stdout nil
   :stderr nil
   :output-limit "Trascrizione dall'output combinato dello strumento nella chat. stdout/stderr originali separati NON CONSERVATI; non assumere stderr vuoto. Byte-exactness non attestata; nessun file raw runtime o registratore strutturato coevo recuperato.")
  (:id "inspection-bank-file-missing"
   :kind :inspection-command-failed
   :command "sed -n '1,180p' arcdocdb.asd && cat src/index/types.lisp src/index/bank.lisp src/index/primary-build.lisp src/index/primary-probe.lisp"
   :exit-code 1
   :tool-chunk-id "e54f73"
   :combined-output nil
   :stdout nil
   :stderr nil
   :output-status :full-output-not-retained-in-this-record
   :diagnostic-excerpt "cat: src/index/bank.lisp: No such file or directory"
   :limit "Output completo dei file letti non conservato in questo record; estratto diagnostico trascritto dalla chat, nessuna prova runtime.")
  (:id "inspection-scripts-directory-missing"
   :kind :inspection-command-failed
   :command "rg --files src/index tests/index | head -65 && command -v sbcl && rg --files -g '*lint*' -g '*AGENTS*' -g '*check*' tools scripts"
   :exit-code 2
   :tool-chunk-id "a66292"
   :combined-output nil
   :stdout nil
   :stderr nil
   :output-status :full-output-not-retained-in-this-record
   :diagnostic-excerpt "rg: scripts: No such file or directory (os error 2)"
   :limit "Elenco completo dei file non conservato in questo record; estratto diagnostico trascritto dalla chat.")
  (:id "diff-check-nonzero"
   :kind :inspection-command-nonzero
   :command "git diff --no-index --check /dev/null tests/index/hash-digests.lisp && git status --short -- tests/index/hash-digests.lisp && rg -n '^\\(defun|^\\(deftest|primary-.*:|:[a-z].*(corrupt|faulted|source|owner|frozen|hash|count|range|used)' tests/index/hash-digests.lisp"
   :exit-code 1
   :tool-chunk-id "eb51ca"
   :combined-output ""
   :stdout nil
   :stderr nil
   :output-limit "Trascrizione dall'output combinato dello strumento nella chat. stdout/stderr originali separati NON CONSERVATI; non assumere stderr vuoto. Byte-exactness non attestata; nessun file raw runtime o registratore strutturato coevo recuperato."
   :cause "git diff --no-index restituisce 1 per file diverso da /dev/null; i comandi successivi con && non sono stati eseguiti. Nessun diagnostico restituito; nessun test eseguito."))
 :successful-isolated-execution (:attempt-id "suite-03-passed"
  :test-count 15
  :passed 15
  :failed 0
  :basis :agent-self-report
  :qualification nil
  :reexecuted nil)
 :herschel-findings ((:finding "Root NIL produce TYPE-ERROR."
   :basis :user-relayed-herschel-finding
   :reproduced-by-turing nil
   :owner :parent
   :status :parent-correction-pending)
  (:finding "Digest ricalcolato discordante produce INVALID-ARGUMENT anziche indice FAULTED."
   :basis :user-relayed-herschel-finding
   :reproduced-by-turing nil
   :owner :parent
   :status :parent-correction-pending))
 :known-coverage-limits "I 15 test preliminari non coprono i due rilievi aggiunti da Herschel. Il parent corregge il prodotto e aggiunge i test; Turing non modifica il file congelato e non esegue nuove verifiche.")
