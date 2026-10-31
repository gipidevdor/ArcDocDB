;;; OWNER: un solo attore I/O della Serie possiede motore, writer, GET e capacita'.
;;; SHARED: nessun nuovo stato globale; il solo registro CSN canonico dell'Archivio M1.
;;; REQ: REQ-REC-001 REQ-CON-002 REQ-WAL-006 REQ-AFF-008 REQ-IDX-012
(defpackage #:arcdocdb.engine
  (:use #:cl)
  (:local-nicknames (#:d #:arcdocdb.index.disk) (#:io #:arcdocdb.io) (#:w #:arcdocdb.wal) (#:s #:arcdocdb.series)
                   (#:p #:arcdocdb.index.primary) (#:g #:arcdocdb.get) (#:gd #:arcdocdb.get.directory)
                   (#:r #:arcdocdb.get.resolver) (#:a #:arcdocdb.active) (#:c #:arcdocdb.control)
                   (#:ra #:arcdocdb.recovery.active) (#:rc #:arcdocdb.recovery.closed)
                   (#:rs #:arcdocdb.recovery.series) (#:dar #:arcdocdb.recovery.archive)
                   (#:ac #:arcdocdb.recovery.archive.csn) (#:mf #:arcdocdb.recovery.manifest)
                   (#:rt #:arcdocdb.runtime) (#:b #:arcdocdb.binary) (#:f #:arcdocdb.storage.format))
  (:import-from #:arcdocdb.binary #:octets #:index #:u32 #:u64)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted #:invariant-violation
                #:io-fault #:corruption-detected #:unsupported-format)
  (:export #:compatta-motore #:statistiche-compattazione-motore
           #:politica-indice-automatico #:crea-politica-indice-automatico
           #:configura-budget-indice-motore #:statistiche-indice-motore #:motore #:apri-motore #:chiudi-motore #:stato-motore
           #:scrivi-documento #:cancella-documento #:leggi-documento #:frontiere-motore
           #:opzione-indice-paginato #:crea-opzione-indice-paginato #:fonte-indice-motore #:modo-indice-motore
           #:costruisci-indice-paginato-motore #:attiva-indice-paginato-motore #:rinnova-indice-paginato-motore
           #:opzione-scoperta-indice #:crea-opzione-scoperta-indice
           #:politica-rinnovo-indice #:crea-politica-rinnovo-indice
           #:rinnovo-indice-richiesto-p #:mantieni-indice-paginato-motore
           #:opzione-rinnovo-automatico #:crea-opzione-rinnovo-automatico #:configura-rinnovo-automatico-motore
           #:errore-cleanup-motore #:causa-cleanup-motore #:errori-cleanup-motore))
