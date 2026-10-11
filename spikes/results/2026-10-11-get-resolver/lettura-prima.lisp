(:schema-version 1 :kind :local-static-reading :date "2026-10-11"
 :reading :authority-and-integrity :independent-review nil :qualification nil
 :source-paths ("src/get-resolver/build.lisp" "src/get-resolver/scan.lisp"
                "src/get-resolver/rows.lisp" "src/get-resolver/read.lisp")
 :observations
 ((:id :frontier :finding "CLOSED e valid-bytes provengono dal manifest della Serie, associato dal controller. Header e dati sono letti dal medesimo FD; nessun uso di EOF come prova di commit.")
  (:id :sealed-prefix :finding "Origine writer: verifica-lotto su ogni lotto con fine esatta. Origine compaction: verificatore esistente di sole cornici ordinarie. Nessuna classificazione TAIL su un buffer che non contiene EOF.")
  (:id :outcome :finding "Prove ordinate per entrambe le word TXID; duplicati discordi rifiutati. OUTCOME deve seguire il PUT. Prepared senza esito non viene reso leggibile.")
  (:id :read :finding "Riga deve coincidere per offset, size, CSN e flag; il GET verifica ancora il record e la prova durevole. Mappa non diventa fonte unica di verità.")
  (:id :lifetime :finding "Acquisizione dopo ingresso EBR, mappa pubblicata prima delle location e FD mantenuto aperto dal controller. Tutti i riferimenti scartati alla migrazione.")
  (:id :scope :finding "ACTIVE, directory/controller e prove EDIT restano da integrare. Le chiusure con esiti EDIT aggiuntivi sono rifiutate prima dell'I/O, senza qualificare come corrotto un formato valido."))
 :open (:functional-cases :condition-coverage :fault-injection :real-thread-stress
        :active-resolver :edit-proof :directory-publication :independent-review :c1-qualification))
