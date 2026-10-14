(:schema-version 1 :kind :local-static-reading :date "2026-10-14"
 :qualification nil :independent-review nil
 :source-paths ("src/control/recovery-types.lisp" "src/control/recovery-read.lisp"
                "src/control/recovery-publication.lisp" "src/recovery/manifest-transition.lisp")
 :observations
 ((:id :authority :finding "Vista canonica e input readonly provengono dal catalogo. EOF fisico attestato resta precondizione; buffer intero al parser, nessun EOF dedotto da un budget. Namespace/file stabili fino al publisher.")
  (:id :integrity :finding "Lettura per chunk dallo stesso FD, header CRC/identità/versione verificato, scanner a EOF prima del fold. TAIL richiede ricerca completa; errori semantici o LOG-CORRUPTION propagano senza token parziale.")
  (:id :decision :finding "Guard di identità vista e transizione prima di qualunque claim. Un solo publisher canonico gestisce CAS, rename, directory-fsync e failure, senza nuovo punto atomico.")
  (:id :failure :finding "Nessun handler generico, retry, FD-close, fsync, append o troncatura nella lettura. Prima del publisher errori non reclamano il gettone; il controller deve gestire fail-stop/quarantena."))
 :open (:functional-qualification :fault-injection :physical-eof-attestation :namespace-exclusivity
        :old-active-scan :inventory :recovery-integration :independent-review :c1))
