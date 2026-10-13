(:schema-version 1 :kind :local-static-reading :date "2026-10-13"
 :reading :bounded-cost-and-ownership :independent-review nil :qualification nil
 :source-paths ("src/io/identity-types.lisp" "src/io/native.lisp" "src/io/identity.lisp"
                "src/get-resolver/active-build.lisp" "arcdocdb.asd")
 :observations
 ((:id :bounded :finding "Nessun ciclo o attesa. Creazione con al massimo due callback/fstat e una associazione; verifica con confronti EQ e due controlli di apertura.")
  (:id :representation :finding "Interi firmati/non firmati 64 bit preservati senza logand, conversioni o hashing. Possono allocare bignum solo nel compito I/O di associazione.")
  (:id :publication :finding "La factory ACTIVE non fa I/O, non pubblica root e non cambia i percorsi reader. La prova non attesta commit, CRC, durability o quiescenza EBR.")
  (:id :disassembly :finding "Nel disassemblato locale ARM64, esigi-aperto e verifica-associazione-file non contengono ALLOC-TRAMP, GENERIC o BIGNUM. La factory alloca la sorgente per contratto. Nessuna misura dinamica o conclusione sui costi transitivi.")
  (:id :ownership :finding "Slot dell'associazione read-only, nessun copier/export di FD. Nessuna nuova scrittura condivisa, lock globale o syscall fuori da io.")
  (:id :preconditions :finding "Il controller deve escludere close/dup2 concorrenti e mutazioni esterne. Ricontrollo stati dopo callback; non può risolvere race esterne che violano ownership."))
 :open (:allocation-measurement :latency-measurement :fault-injection :thread-stress
        :server-adoption :independent-review :c1-qualification))
