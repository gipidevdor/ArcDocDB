;;; OWNER: costruttore seriale; prove immutabili senza inventario o riferimenti ai figli.
;;; SHARED: nessuno; sintesi dei digest per verificare il routing delle directory.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (costruttore-pagine identita-pagina (member :bucket :directory) (integer 0 64)
                         simple-vector simple-vector) riferimento-costruito) prova-pagine-costruite))
(defun prova-pagine-costruite (builder identity kind ceiling entries children)
  "Pre: pagina e figli completamente consegnati, vettori limitati del lotto corrente.
Post: count e AND/OR dei digest, senza conservare chiavi/figli; nessuna prova di flush o unicita' globale."
  (let ((count 0) (ha #xffffffff) (ho 0) (la #xffffffff) (lo 0))
    (loop for entry across entries when entry do
      (incf count)
      (setf ha (logand ha (entry-costruzione-high entry)) ho (logior ho (entry-costruzione-high entry))
            la (logand la (entry-costruzione-low entry)) lo (logior lo (entry-costruzione-low entry))))
    (loop for child across children when child do
      (incf count (riferimento-costruito-count child))
      (setf ha (logand ha (riferimento-costruito-high-and child)) ho (logior ho (riferimento-costruito-high-or child))
            la (logand la (riferimento-costruito-low-and child)) lo (logior lo (riferimento-costruito-low-or child))))
    (%make-riferimento-costruito builder identity kind count ceiling ha ho la lo)))

;;; REQ: REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (riferimento-costruito fixnum fixnum index) null) verifica-routing-costruito))
(defun verifica-routing-costruito (child bits shift slot)
  "Pre: figlio verificato dello stesso costruttore. Post: ogni digest del sottoinsieme segue SLOT.
AND e OR uguali sul campo selezionato provano tutti i bit; intervalli radix non sovrapposti.
INVALID-ARGUMENT prima di ogni I/O, anche per immagine localmente valida ma mal instradata."
  (unless (<= (riferimento-costruito-ceiling child) shift)
    (error 'invalid-argument :reason :index-build-directory-order))
  (when (plusp (riferimento-costruito-count child))
    (unless (and (= slot (radix-digest-pagina (riferimento-costruito-high-and child)
                                            (riferimento-costruito-low-and child) bits shift))
                 (= slot (radix-digest-pagina (riferimento-costruito-high-or child)
                                            (riferimento-costruito-low-or child) bits shift)))
      (error 'invalid-argument :reason :index-build-directory-routing))) nil)

;;; REQ: REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (costruttore-pagine t t simple-vector) index) prepara-directory-costruita))
(defun prepara-directory-costruita (builder bits shift children)
  "Pre: costruttore BUSY, soli figli gia' completati. Post: corpo directory e routing interamente verificati.
Geometria/fanout/tipo/owner respinti prima degli effetti; count e' il numero di PageRef non nulle."
  (unless (and (typep bits 'fixnum) (<= 1 bits (nth-value 2 (geometria-pagina (costruttore-pagine-size builder))))
               (typep shift '(integer 0 63)) (<= (+ bits shift) 64) (= (length children) (ash 1 bits)))
    (error 'invalid-argument :reason :index-build-directory-geometry))
  (let ((body (costruttore-pagine-body builder)) (count 0))
    (fill body 0)
    (loop for child across children for slot from 0 when child do
      (unless (typep child 'riferimento-costruito) (error 'invalid-argument :reason :index-build-child-type))
      (verifica-riferimento-costruito builder child :any)
      (verifica-routing-costruito child bits shift slot)
      (let ((identity (riferimento-costruito-identity child)) (offset (* slot +reference-bytes+)))
        (scrivi-u64 body offset (identita-pagina-page identity))
        (scrivi-u64 body (+ offset +reference-generation+) (identita-pagina-generation identity)))
      (incf count))
    (verifica-budget-costruzione builder 1)
    count))
