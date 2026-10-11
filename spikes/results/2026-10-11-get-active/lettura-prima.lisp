(:schema-version 1 :kind :local-static-reading :date "2026-10-11"
 :reading :authority-and-integrity :independent-review nil :qualification nil
 :source-paths ("src/get-resolver/active-build.lisp" "src/get-resolver/active-scan.lisp"
                "src/get-resolver/active-preflight.lisp"
                "src/get-resolver/active-read.lisp")
 :observations
 ((:id :authority :finding "Reader legge soltanto la root effettiva dal controller dopo ingresso EBR; root privata/pianificata non viene passata al reader. Il CAS esistente verifica copertura WAL e FIFO.")
  (:id :binding :finding "Lease e token verificati prima della scansione; lotto identificato con ID/versione della capacità. Associazione dei FD allo stesso file fisico resta obbligo del controller.")
  (:id :prefix :finding "Ogni delta verifica il nuovo lotto completo: CRC/SEAL, offset assoluto, fine, count e due word CSN. Niente EOF/H/posizione-scritta come certificato di pubblicazione.")
  (:id :scope :finding "Prepared e OUTCOME validi vengono rifiutati come integrazione non supportata, senza inferire abort e senza cambiare ADR-0041. Token resta al caller sui rifiuti pre-adozione.")
  (:id :preflight :finding "Lotto OPEN: ring, forma e budget del resolver controllati prima del CSN, senza riserva. Lease/root/byte stabili fino alla chiusura; adozione ricontrolla e conserva token su eventuale rifiuto. Non attesta CRC del body o successo dell'allocazione.")
  (:id :failure :finding "Integrità del sealed buffer o invariante impossibile nel costruttore segnano FAULTED Archivio e propagano; errori/nonlocal exit sul reader liberano EBR. Nessun rollback della root pubblicata.")
  (:id :read :finding "Pagina indica il prefisso del lotto che contiene il candidato. Resolver comune confronta offset/size/CSN/flags/FD e GET rilegge/ricontrolla il valore. Cache non attesta da sola il commit."))
 :open (:functional-cases :condition-coverage :fault-injection :real-thread-stress
        :multiserie-active-proof :physical-fd-association :primary-publication :independent-review :c1-qualification))
