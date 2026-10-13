(:schema-version 1 :kind :local-static-reading :date "2026-10-13"
 :qualification nil :independent-review nil
 :source-paths ("src/io/native-namespace.lisp" "src/io/namespace.lisp" "src/control/types.lisp"
                "src/control/publication.lisp" "src/control/publication-read.lisp")
 :observations
 ((:id :authority :finding "Old target readonly validato dalla stessa Serie è precondizione. Nomi relativi a directory canonica; fstat/fstatat nofollow legano entrambi ai FD e rifiutano alias. Publisher non prova il recovery completo.")
  (:id :decision :finding "Rename del checkpoint è punto atomico; verifica dell'entry installata e fsync parent prima del risultato. Nessun ACK al client o adozione degli indici.")
  (:id :failure :finding "Una syscall rename, nessun retry/rollback/close/delete. Dopo presa, ogni uscita incompleta lascia gettone FAULTED. Rename-observed NIL non prova assenza di effetti; recovery sempre richiesto.")
  (:id :abi :finding "fstatat usa stat grovelled da SB-POSIX e suo selettore INODE64; flag verificati negli header Linux/macOS. Compilazione non qualifica dinamicamente queste nuove syscall."))
 :open (:native-dynamic-qualification :fault-injection :namespace-exclusivity :old-log-authority
        :recovery-integration :independent-review :c1))
