;;; OWNER: controller della Serie prepara directory immutabili prima dei compiti.
;;; SHARED: radici acquisite sotto EBR; nessuna scrittura per GET o fra Serie.
;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-008
(defpackage #:arcdocdb.get.directory
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index #:u32 #:u64)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted #:invariant-violation)
  (:import-from #:arcdocdb.io #:mode-file #:stato-file)
  (:import-from #:arcdocdb.get #:vista-get-serie #:contesto-get #:segmento-get
                #:segmento-get-owner #:segmento-get-file #:segmento-get-high #:segmento-get-low
                #:contesto-get-view #:contesto-get-content #:esigi-stato-get #:guasto-get
                #:abbandona-get)
  (:import-from #:arcdocdb.get.resolver #:mappa-segmento-get #:mappa-segmento-get-segment
                #:risolvi-candidato-get #:sonda-cache-risolta-get #:leggi-record-risolto-get)
  (:export #:directory-get-serie #:crea-directory-get-serie #:payload-directory-get-serie
           #:conta-segmenti-directory-get #:trova-mappa-directory-get
           #:risolvi-candidato-directory-get #:sonda-cache-directory-get #:leggi-record-directory-get))
