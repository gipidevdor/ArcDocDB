(:schema-version 1 :kind :local-static-reading :date "2026-10-14"
 :qualification nil :independent-review nil
 :source-paths ("src/control/recovery-types.lisp" "src/control/recovery-read.lisp"
                "src/control/recovery-publication.lisp" "src/recovery/manifest-transition.lisp")
 :observations
 ((:id :ownership :finding "Input e vista canonici trattenuti, buffer non trattenuto. Il decoder già copia tutto il manifest; nessuna hash table o capacità numerica esportata. Scratch esclusivo, alias all'identità rifiutato prima del range.")
  (:id :conservation :finding "CLOSED incluso con esiti/lunghezza uguali, vecchio ACTIVE chiuso, conteggio esattamente più uno: nessun CLOSED extra. REMOVED incluso e stesso conteggio: nessuna sostituzione/omissione. Esiti includono presenza per CSN zero e confronto u64 completo.")
  (:id :freshness :finding "Nuovo ACTIVE almeno al high-water precedentemente ricostruito. Esaurimento distinto da ID zero. Manifest nuovo già validato richiede il proprio next-id oltre ogni ID; nessun riuso durante questo passaggio.")
  (:id :cost :finding "Cicli di lettura CEILING(size/chunk) e scansioni finite delle tabelle/entry già ricostruite. O(byte) più decoder, O(CLOSED+REMOVED+esiti) medio nel confronto; allocazioni cold, nessun nuovo stato condiviso tra Serie.")
  (:id :scope :finding "La transizione non certifica lunghezza/esiti del vecchio ACTIVE senza scanner del segmento. Percorso conservativo dedicato al recovery esclusivo; non autorizza compaction/reclaim o ammissione del traffico."))
 :open (:functional-qualification :fault-injection :allocation-and-latency-measurements
        :old-active-scan :inventory :recovery-integration :independent-review :c1))
