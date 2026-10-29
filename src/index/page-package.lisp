;;; OWNER: chiamante possiede buffer e descrittori fuori dal lookup GET.
;;; SHARED: sole identita' copiate e immutabili; nessun I/O o stato fra Serie.
;;; REQ: REQ-IDX-009 REQ-AFF-004 REQ-AFF-008
(defpackage #:arcdocdb.index.page
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:octets #:index #:u32 #:u64 #:check-range
                #:leggi-u16 #:leggi-u32 #:leggi-u64 #:scrivi-u16 #:scrivi-u32
                #:scrivi-u64 #:crc32c)
  (:import-from #:arcdocdb.record #:+header-bytes+ #:+max-record-bytes+
                #:+max-document-bytes+ #:+max-key-bytes+ #:u64-equal-p)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:corruption-detected
                #:unsupported-format #:invariant-violation)
  (:export #:identita-pagina #:crea-identita-pagina
           #:descrittore-pagina #:crea-descrittore-pagina
           #:scrivi-pagina-indice #:verifica-pagina-indice
           #:cache-pagine #:crea-cache-pagine #:crea-cache-pagine-file #:copia-pagina-cache
           #:lettore-indice-pagine #:crea-lettore-indice-pagine #:leggi-indice-pagine
           #:costruttore-pagine #:crea-costruttore-pagine #:crea-costruttore-pagine-file
           #:entry-costruzione #:crea-entry-costruzione #:riferimento-costruito
           #:costruisci-bucket-pagine #:costruisci-directory-pagine #:identita-riferimento-costruito
           #:fonte-indice #:crea-fonte-indice #:sigillo-immagine #:sigilla-immagine-pagine
           #:immagine-indice-verificata #:recupera-immagine-pagine
           #:vista-indice-paginato #:crea-vista-indice-paginato #:pubblica-immagine-verificata
           #:invalida-vista-indice-paginato #:leggi-vista-indice-paginato))
