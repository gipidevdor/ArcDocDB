;;; OWNER: solo attore M1; token e contatori seguono il replay o il commit prima di admission/ACK.
;;; SHARED: nessuno; identita' di prefisso append-only, nessun hash probabilistico.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (motore u64 u64 index index) null) registra-fonte-indice-motore))
(defun registra-fonte-indice-motore (engine csn segment offset bytes)
  "Pre: record M1 committed pubblicato nell'indice privato, ordine CSN stretto, nessuna compaction.
Post: token esatto di 32 byte (versione, segmento, offset, lunghezza), ultimo CSN separato.
I segmenti non si riscrivono e gli ID non si riusano; il prefisso immutabile identifica la fonte M1.
Prima del primo record il token contiene solo la versione; le tombstone avanzano la fonte."
  (unless (and (plusp segment) (plusp bytes)
               (or (zerop (b:leggi-u64 (motore-source-token engine) 8)) (> csn (motore-source-csn engine))))
    (error 'invariant-violation :reason :engine-image-source-order))
  (let ((token (motore-source-token engine)))
    (b:scrivi-u64 token 0 (motore-version engine)) (b:scrivi-u64 token 8 segment)
    (b:scrivi-u64 token 16 offset) (b:scrivi-u64 token 24 bytes)
    (setf (motore-source-csn engine) csn))
  nil)

;;; REQ: REQ-IDX-010 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (motore) arcdocdb.index.page:fonte-indice) fonte-canonica-indice-motore))
(defun fonte-canonica-indice-motore (engine)
  "Pre: replay canonico completato, owner esclusivo; root M1 senza split.
Post: copie possedute del token e cardinalita' esatta del frammento autorevole.
Un futuro backend split/compaction richiede un nuovo legame di fonte, non riusa questo contratto."
  (p::esigi-indice-sano (motore-index engine))
  (let* ((root (p::acquisisci-root (motore-index engine))) (directory (p::root-indice-directory root)))
    (unless (and (zerop (p::root-indice-depth root)) (= (length directory) 1))
      (error 'unsupported-format :reason :engine-image-source-outside-m1))
    (let ((fragment (svref directory 0)))
      (p::esigi-frammento-sano (motore-index engine) fragment)
      (arcdocdb.index.page:crea-fonte-indice (motore-archive-id engine) (motore-series-id engine)
        (motore-source-token engine) (motore-source-csn engine) (p::frammento-indice-live fragment)))))

;;; REQ: REQ-IDX-010 REQ-CON-002
(declaim (ftype (function (motore) arcdocdb.index.page:fonte-indice) fonte-indice-motore))
(defun fonte-indice-motore (engine)
  "Pre: owner e motore READY senza richiesta in volo. Post: snapshot copiato della fonte corrente.
Non presta indice o FD; diventa obsoleto al commit seguente, nessuna prenotazione o I/O."
  (esigi-motore-pronto engine)
  (fonte-canonica-indice-motore engine))

;;; REQ: REQ-IDX-010 REQ-CON-002
(declaim (ftype (function (motore) (member :resident :paged)) modo-indice-motore))
(defun modo-indice-motore (engine)
  "Pre: owner READY seriale. Post: backend del prossimo GET, nessun effetto o garanzia di migrazione."
  (esigi-motore-pronto engine)
  (if (motore-paged engine) :paged :resident))

;;; REQ: REQ-IDX-010 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (motore octets integer integer p:contesto-indice
                                (simple-array (unsigned-byte 64) (5)))
                         (member :live :absent :retry-limit)) sonda-indice-motore))
(defun sonda-indice-motore (engine key start end probe destination)
  "Pre: GET ammesso nel contesto dell'attore M1, indice corrente stabile, scratch privati.
Post: un solo backend; errori paginati propagati senza ripiego. Nessuna allocazione intenzionale."
  (esigi-owner-motore engine)
  (unless (motore-busy engine) (error 'invariant-violation :reason :engine-image-lookup-admission))
  (let ((paged (motore-paged engine)))
    (if paged
        (arcdocdb.index.page:leggi-vista-indice-paginato paged key start end destination)
        (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) key start end)
          (p:leggi-indice-primario (motore-index engine) key start end high low probe destination)))))
