;;; OWNER: gettone writer della Serie e scratch esclusivo, nessun altro mutatore.
;;; SHARED: chiave prima del payload, payload prima del controllo; nessun ritorno a EMPTY.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (frammento-indice fixnum fixnum boolean fixnum) null)
                verifica-spazio-chiave-writer))
(defun verifica-spazio-chiave-writer (fragment size slot found offset)
  "Pre: complete writer probe, current offset or arena end. Post: PUT space admitted.
Only a new key requires live occupancy below 7/8 and new arena bytes; no reservation.
RESOURCE-EXHAUSTED before modifications, in the same order as the canonical mutator."
  (when (minusp slot) (error 'resource-exhausted :reason :primary-fragment-full))
  (unless found
    (when (>= (frammento-indice-live fragment)
              (* 7 (ash (banco-slot-capacity (frammento-indice-bank fragment)) -3)))
      (error 'resource-exhausted :reason :primary-fragment-load))
    (when (> (+ offset size) (length (frammento-indice-arena fragment)))
      (error 'resource-exhausted :reason :primary-key-arena-full)))
  nil)

;;; REQ: REQ-IDX-003 REQ-IDX-005 REQ-IDX-006 REQ-IDX-007 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice fixnum) null)
                verifica-credito-mutazione-writer))
(defun verifica-credito-mutazione-writer (index fragment slot)
  "Pre: slot selected for PUT or a present DELETE, exclusive writer. Post: one change admitted.
Checks sequence and revision without consuming them; an absent DELETE must not call it."
  (when (zerop (credito-scrittura-slot (frammento-indice-bank fragment) slot))
    (error 'resource-exhausted :reason :primary-slot-rebuild-required))
  (esigi-revisione index)
  nil)

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-IDX-006 REQ-IDX-007 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice octets integer integer u32 u32
                                         contesto-indice &key (:rimozione boolean)) null)
                verifica-capienza-mutazione-indice))
(defun verifica-capienza-mutazione-indice (index fragment key start end high low context
                                         &key (rimozione nil))
  "Pre: sole writer, key/span and digest consistent with the Serie, free exclusive context.
No mutator, freeze, or directory change between preflight and application on the same fragment.
Post: NIL if domain/health/span/probe and mutation resources are admitted now.
A new PUT checks slot, live occupancy 7/8, and arena; every PUT and present DELETE checks credit/revision.
An absent DELETE requires no resources. Does not validate new CSNs/payloads, reserve, or authorize commit.
No index data, counter, or credit changes on success/ordinary rejection; scratch
may change; BUSY acquired here is always released. Invariants preserve canonical fail-stop.
Probe bounded to C slots with the same LOW as the mutators, without I/O, retry, or growth."
  (esigi-frammento-writer index fragment high)
  (esigi-chiave key start end)
  (esigi-contesto-libero context)
  (unwind-protect
       (progn
         (setf (contesto-indice-busy context) t)
         (multiple-value-bind (slot found)
             (sonda-writer fragment key start end low (contesto-indice-words context))
           (esigi-frammento-sano index fragment)
           (unless rimozione
             (verifica-spazio-chiave-writer
              fragment (- end start) slot found
              (if found (ldb (byte 32 0) (aref (contesto-indice-words context) 2))
                  (frammento-indice-used fragment))))
           (when (or (not rimozione) found)
             (verifica-credito-mutazione-writer index fragment slot)))
         nil)
    (setf (contesto-indice-busy context) nil)))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice octets fixnum fixnum u32
                                         contenuto-slot contenuto-slot)
                         (values fixnum boolean fixnum &optional)) prepara-chiave-writer))
(defun prepara-chiave-writer (index fragment key start end low source work)
  "Pre: writer, valid private SOURCE, distinct WORK scratch. Post: slot, trovato-p, and key offset.
Verifies capacity, arena, CSN monotonicity, and credit before changes; WORK contains the new payload.
Does not reserve pending-batch resources or authorize a durable commit."
  (multiple-value-bind (slot found) (sonda-writer fragment key start end low work)
    (let* ((size (- end start))
           (offset (if found (ldb (byte 32 0) (aref work 2)) (frammento-indice-used fragment))))
      (verifica-spazio-chiave-writer fragment size slot found offset)
      (when (and found (<= (aref source 0) (aref work 0)))
        (error 'invalid-argument :reason :primary-csn-not-increasing))
      (verifica-credito-mutazione-writer index fragment slot)
      (copia-contenuto source work)
      (setf (aref work 2) (logior offset (ash size 32) (ash 1 48)))
      (values slot found offset))))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-AFF-004
(declaim (ftype (function (indice-primario frammento-indice octets fixnum fixnum u32 fixnum
                                         boolean fixnum contenuto-slot) null) applica-chiave-writer))
(defun applica-chiave-writer (index fragment key start end low slot found offset work)
  "Pre: complete preflight and exclusive writer. Post: payload and control published in order.
Interruption of the compound operation makes the index/bank FAULTED, including after the
payload seqlock has returned to an even sequence; no rollback."
  (let ((bank (frammento-indice-bank fragment)) (complete nil))
    (unwind-protect
         (progn
           (incf (indice-primario-revision index))
           (unless found
             (replace (frammento-indice-arena fragment) key :start1 offset :start2 start :end2 end)
             (incf (frammento-indice-used fragment) (- end start)))
           (pubblica-slot-v2 bank slot work)
           (sb-thread:barrier (:write))
           (setf (aref (frammento-indice-controls fragment) slot) (logand low 127))
           (unless found (incf (frammento-indice-live fragment)))
           (esigi-frammento-sano index fragment)
           (setf complete t))
      (unless complete (invalida-banco-slot bank) (invalida-indice-primario index))))
  nil)

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice octets integer integer u32 u32
                                         contenuto-slot contesto-indice) null) pubblica-chiave-indice))
(defun pubblica-chiave-indice (index fragment key start end high low source context)
  "Pre: writer, consistent digest; retention, conflicts, commit, and batch reservations handled externally.
Live v2 SOURCE with key-len matching the span, arena offset replaced internally; distinct scratch.
Post: one live key, strictly increasing CSN on update; no I/O or commit attested.
Insufficient capacity/sequence/arena rejected before mutation; external rebuild/split."
  (esigi-frammento-writer index fragment high)
  (esigi-chiave key start end)
  (esigi-contenuto-slot (frammento-indice-bank fragment) source)
  (unless (= (- end start) (ldb (byte 16 32) (aref source 2)))
    (error 'invalid-argument :reason :primary-source-key-length))
  (when (eq source (contesto-indice-words context))
    (error 'invalid-argument :reason :primary-source-alias))
  (esigi-contesto-libero context)
  (unwind-protect
       (progn
         (setf (contesto-indice-busy context) t)
         (multiple-value-bind (slot found offset)
             (prepara-chiave-writer index fragment key start end low source (contesto-indice-words context))
           (applica-chiave-writer index fragment key start end low slot found offset
                                 (contesto-indice-words context))))
    (setf (contesto-indice-busy context) nil)))

;;; REQ: REQ-IDX-003 REQ-IDX-006 REQ-AFF-004
(declaim (ftype (function (indice-primario frammento-indice fixnum) null) applica-rimozione-writer))
(defun applica-rimozione-writer (index fragment slot)
  "Pre: verified live slot, credit and revision available. Post: zeroed slot, then DELETED.
Does not modify keys or create persistent tombstones; interruption => domain FAULTED."
  (let ((bank (frammento-indice-bank fragment)) (complete nil))
    (unwind-protect
         (progn
           (incf (indice-primario-revision index))
           (rimuovi-slot-v2 bank slot)
           (sb-thread:barrier (:write))
           (setf (aref (frammento-indice-controls fragment) slot) +ctrl-deleted+)
           (decf (frammento-indice-live fragment))
           (esigi-frammento-sano index fragment)
           (setf complete t))
      (unless complete (invalida-banco-slot bank) (invalida-indice-primario index))))
  nil)

;;; REQ: REQ-IDX-003 REQ-IDX-006 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice octets integer integer u32 u32 contesto-indice)
                         boolean) rimuovi-chiave-indice))
(defun rimuovi-chiave-indice (index fragment key start end high low context)
  "Pre: writer, external retention/tombstone and reservations already handled. Post: T removed, NIL absent.
Absence consumes no sequence/revision; slots and keys do not cross a migration."
  (esigi-frammento-writer index fragment high)
  (esigi-chiave key start end)
  (esigi-contesto-libero context)
  (unwind-protect
       (progn
         (setf (contesto-indice-busy context) t)
         (multiple-value-bind (slot found)
             (sonda-writer fragment key start end low (contesto-indice-words context))
           (esigi-frammento-sano index fragment)
           (unless found (return-from rimuovi-chiave-indice nil))
           (verifica-credito-mutazione-writer index fragment slot)
           (applica-rimozione-writer index fragment slot)
           t))
    (setf (contesto-indice-busy context) nil)))
