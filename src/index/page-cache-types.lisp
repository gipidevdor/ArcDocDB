;;; OWNER: un attore I/O per cache; copie private, nessun frame prestato ai reader.
;;; SHARED: nessuno; il caricatore sincrono non puo' rientrare nella cache.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-LIM-003
(defstruct (cache-pagine (:constructor %make-cache-pagine (size frames identities references loader)) (:copier nil))
  "Pre: factory, memoria privata. Post: frame fissi e sostituzione FIFO locale.
Solo l'owner puo' copiare pagine; nessun protocollo concorrente o root durevole."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (size 4096 :type (member 4096 16384 65536) :read-only t)
  (frames #() :type simple-vector :read-only t)
  (identities #() :type simple-vector :read-only t)
  (references #() :type simple-vector :read-only t)
  (loader #'identity :type function :read-only t)
  (cursor 0 :type index)
  (busy nil :type boolean))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t) cache-pagine) crea-cache-pagine))
(defun crea-cache-pagine (size frame-count loader)
  "Pre: caricatore fidato (identity buffer) restituisce SIZE dopo lettura esatta.
Post: FRAME-COUNT frame preallocati; payload <= 256 MiB, metadati separati O(frame-count).
INVALID-ARGUMENT prima di allocare per taglia, numero o callback invalidi.
Il caricatore prende in prestito BUFFER solo durante la chiamata, senza trattenerlo."
  (unless (and (member size '(4096 16384 65536))
               (typep frame-count '(integer 1 65536)) (functionp loader))
    (error 'invalid-argument :reason :index-page-cache-configuration))
  (when (> (* size frame-count) 268435456)
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-page-cache-budget))
  (let ((frames (make-array frame-count :element-type t))
        (identities (make-array frame-count :element-type t :initial-element nil))
        (references (make-array frame-count :element-type t)))
    (dotimes (i frame-count)
      (setf (aref frames i) (make-array size :element-type '(unsigned-byte 8) :initial-element 0)
            (aref references i) (crea-identita-pagina
                                (make-array 16 :element-type '(unsigned-byte 8) :initial-element 0) 1 1 1)))
    (%make-cache-pagine size frames identities references loader)))

;;; REQ: REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (identita-pagina identita-pagina) boolean) stessa-identita-pagina-p))
(defun stessa-identita-pagina-p (first second)
  "Pre: identita' canoniche immutabili. Post: uguaglianza completa, senza I/O o allocazione.
Confronta anche Serie e immagine: stesso offset non implica stessa pagina."
  (and (= (identita-pagina-image first) (identita-pagina-image second))
       (= (identita-pagina-page first) (identita-pagina-page second))
       (= (identita-pagina-generation first) (identita-pagina-generation second))
       (equalp (identita-pagina-serie first) (identita-pagina-serie second))))

;;; REQ: REQ-IDX-009 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (t t arcdocdb.io:file-io) cache-pagine) crea-cache-pagine-file))
(defun crea-cache-pagine-file (size frame-count file)
  "Pre: file readonly prestato, immagine immutabile; attore I/O mantiene aperto il file.
Post: cache a frame fissi collegata a PREAD esatto del modulo I/O, senza mmap.
Il file non e' posseduto/chiuso dalla cache. Errori di capacita' prima delle letture;
CRC e identita' sempre verificati dopo il trasferimento, prima della copia caller."
  (unless (member size '(4096 16384 65536))
    (error 'invalid-argument :reason :index-page-cache-configuration))
  (arcdocdb.io:verifica-capienza-lettura file size)
  (crea-cache-pagine size frame-count
    (lambda (identity buffer)
      (arcdocdb.io:leggi-esatto file buffer 0 size (identita-pagina-page identity)))))

;;; REQ: REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (identita-pagina identita-pagina) null) copia-identita-privata))
(defun copia-identita-privata (source target)
  "Pre: TARGET cursore privato invalido, distinto dalla sorgente pubblicata.
Post: copia completa senza allocazione; la cache non trattiene cursori caller mutabili.
INVALID-ARGUMENT per alias; nessun trasferimento di ownership della sorgente."
  (when (eq source target) (error 'invalid-argument :reason :index-page-identity-alias))
  (replace (identita-pagina-serie target) (identita-pagina-serie source))
  (setf (identita-pagina-image target) (identita-pagina-image source)
        (identita-pagina-page target) (identita-pagina-page source)
        (identita-pagina-generation target) (identita-pagina-generation source))
  nil)
