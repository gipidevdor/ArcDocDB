;;; OWNER: attore I/O, buffer prestato soltanto durante il sink sincrono.
;;; SHARED: nessuno; append di derivati, nessuna decisione durevole o rinomina.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (costruttore-pagine page-kind fixnum u32 index page-number) identita-pagina) emetti-pagina-costruita))
(defun emetti-pagina-costruita (builder kind count parameter used next)
  "Pre: BUSY, budget del lotto ammesso, corpo pronto. Post: pagina verificata e append esatto.
Il sink non e' un commit: su errore/nonlocal exit il confine del lotto rende FAULTED.
Nessun flush o pubblicazione; offset mai riusato dopo un effetto incompleto."
  (unless (costruttore-pagine-busy builder) (error 'invariant-violation :reason :index-build-state))
  (let* ((domain (costruttore-pagine-domain builder)) (size (costruttore-pagine-size builder))
         (offset (costruttore-pagine-offset builder))
         (identity (crea-identita-pagina (identita-pagina-serie domain) (identita-pagina-image domain)
                                        offset (identita-pagina-generation domain)))
         (descriptor (crea-descrittore-pagina identity kind count parameter :next next
                                             :next-generation (if (zerop next) 0 (identita-pagina-generation domain))))
         (buffer (costruttore-pagine-buffer builder)))
    (unless (= (scrivi-pagina-indice buffer 0 size descriptor (costruttore-pagine-body builder) 0 used) size)
      (error 'invariant-violation :reason :index-build-page-write))
    (verifica-pagina-indice buffer 0 size identity)
    (unless (eql (funcall (costruttore-pagine-sink builder) buffer offset) (+ offset size))
      (error 'arcdocdb.conditions:io-fault :reason :index-build-short-write :operation :write))
    (incf (costruttore-pagine-offset builder) size) (incf (costruttore-pagine-written builder))
    identity))

;;; REQ: REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (costruttore-pagine entry-costruzione) page-number) emetti-chiave-costruita))
(defun emetti-chiave-costruita (builder entry)
  "Pre: chiave esterna pianificata. Post: coda prima della testa, PageRef decrescenti.
Al piu' 17 frammenti per chiave 65535 byte; errore propagato al confine del lotto."
  (let* ((key (entry-costruzione-key entry)) (length (length key)) (next 0)
         (chunk (- (costruttore-pagine-size builder) +page-header+)) (parts (ceiling length chunk)))
    (dotimes (step parts)
      (let* ((start (* (- parts step 1) chunk)) (used (min chunk (- length start))))
        (replace (costruttore-pagine-body builder) key :start2 start :end2 (+ start used))
        (setf next (identita-pagina-page (emetti-pagina-costruita builder :chiave length start used next)))))
    next))

;;; REQ: REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (costruttore-pagine) null) emetti-chiavi-piano))
(defun emetti-chiavi-piano (builder)
  "Pre: piano ammesso. Post: tutte le chiavi esterne hanno testa verificata prima del bucket.
Massimo C chiavi, contatori del costruttore aggiornati soltanto dagli append completi."
  (dotimes (slot (length (costruttore-pagine-plan builder)))
    (when (= (aref (costruttore-pagine-external builder) slot) 1)
      (setf (aref (costruttore-pagine-heads builder) slot)
            (emetti-chiave-costruita builder (aref (costruttore-pagine-plan builder) slot))))) nil)

;;; REQ: REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (costruttore-pagine index entry-costruzione index) index) scrivi-entry-costruita))
(defun scrivi-entry-costruita (builder slot entry cursor)
  "Pre: bucket azzerato, teste esterne disponibili. Post: entry e chiave canoniche, nuovo cursore arena.
Packing in ordine fisico degli slot, nessun buco; digest calcolato con il seme del costruttore."
  (let* ((body (costruttore-pagine-body builder)) (capacity (length (costruttore-pagine-plan builder)))
         (offset (+ capacity (* slot +entry-bytes+))) (key (entry-costruzione-key entry))
         (external (= 1 (aref (costruttore-pagine-external builder) slot))))
    (setf (aref body slot) (logand (entry-costruzione-low entry) 127))
    (scrivi-u32 body offset (entry-costruzione-low entry)) (scrivi-u32 body (+ offset 4) (entry-costruzione-high entry))
    (scrivi-u64 body (+ offset +entry-csn+) (entry-costruzione-csn entry))
    (scrivi-u64 body (+ offset +entry-location+) (entry-costruzione-location entry))
    (scrivi-u32 body (+ offset +entry-length+) (entry-costruzione-bytes entry))
    (scrivi-u16 body (+ offset +entry-key-length+) (length key))
    (if external
        (progn (scrivi-u16 body (+ offset +entry-flags+) 1)
               (scrivi-u64 body (+ offset +entry-key-page+) (aref (costruttore-pagine-heads builder) slot))
               (scrivi-u64 body (+ offset +entry-key-generation+)
                           (identita-pagina-generation (costruttore-pagine-domain builder))) cursor)
        (progn (scrivi-u32 body (+ offset +entry-key-offset+) cursor)
               (replace body key :start1 cursor) (+ cursor (length key))))))
