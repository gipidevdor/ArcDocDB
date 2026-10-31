;;; OWNER: attore M1 in RECOVERING, directory esclusiva; un solo FD locale alla volta.
;;; SHARED: nessuno; soli derivati readonly, senza rename, cancellazione o decisione di catalogo.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-REC-001
(declaim (ftype (function (t) boolean) nome-candidato-indice-p))
(defun nome-candidato-indice-p (name)
  "Pre: name from inventory or an untrusted fixture. Post: T only for the canonical M1 image form.
Comparisons bounded to 32 characters; no interpretation as authority or a path."
  (and (stringp name) (= (length name) 32) (string= name "primary-" :end1 8)
       (string= name ".idx.tmp" :start1 24)
       (loop for i from 8 below 24 always (not (null (find (char name i) "0123456789abcdef"))))))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (string (or null string)) boolean) nome-candidato-preferito-p))
(defun nome-candidato-preferito-p (name selected)
  "Pre: already validated canonical 32-character names, SELECTED possibly NIL.
Post: deterministic priority without authority or history; bounded comparison, no additional conditions."
  (or (null selected) (not (null (string> name selected)))))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (simple-vector index) index) conta-candidati-indice))
(defun conta-candidati-indice (names limit)
  "Pre: complete bounded inventory. Post: count verified before opening candidates.
RESOURCE-EXHAUSTED above quota: no selection based on a partial inventory."
  (let ((count 0))
    (loop for name across names do
      (when (nome-candidato-indice-p name)
        (incf count)
        (when (> count limit) (error 'resource-exhausted :reason :engine-image-discovery-candidates))))
    count))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-002
(declaim (ftype (function (motore io:file-io index octets arcdocdb.index.page:fonte-indice) boolean)
                footer-candidato-corrente-p))
(defun footer-candidato-corrente-p (engine file eof buffer source)
  "Pre: RECOVERING, read-only file/exact EOF, private page buffer. Post: eligibility only, not an adoptable proof.
Incomplete geometry/CRC, a different profile, and a stale source are discarded; other codec/I/O errors propagate.
An eligible footer still requires complete verification of the selected file before READY."
  (let ((size (length buffer)))
    (unless (and (>= eof (* 3 size)) (zerop (mod eof size)) (<= eof (* 65538 size)))
      (return-from footer-candidato-corrente-p nil))
    (unless (= size (io:leggi-esatto file buffer 0 size (- eof size)))
      (error 'invariant-violation :reason :engine-image-discovery-read))
    (unless (= (b:leggi-u32 buffer (- size 4)) (b:crc32c buffer 0 (- size 4)))
      (return-from footer-candidato-corrente-p nil))
    (unless (= (aref buffer arcdocdb.index.page::+image-off-size+)
               (nth-value 0 (arcdocdb.index.page::geometria-pagina size)))
      (return-from footer-candidato-corrente-p nil))
    (handler-case
        (progn
          (arcdocdb.index.page::leggi-sigillo-immagine buffer eof source
            (p::indice-primario-seed-high (motore-index engine)) (p::indice-primario-seed-low (motore-index engine)))
          t)
      (corruption-detected (condition)
        (if (eq :index-image-source-mismatch (arcdocdb.conditions:error-reason condition)) nil (error condition))))))

;;; REQ: REQ-IDX-010 REQ-AFF-004 REQ-REC-001
(declaim (ftype (function (motore string opzione-indice-paginato octets arcdocdb.index.page:fonte-indice) boolean)
                ispeziona-candidato-indice))
(defun ispeziona-candidato-indice (engine name template buffer source)
  "Pre: RECOVERING owner, canonical name, exclusive namespace. Post: eligibility and local FD closed.
Every error/nonlocal exit attempts cleanup while preserving the primary cause; failed close on success propagates.
No candidate or FD is transferred to the engine by this probe."
  (multiple-value-bind (file eof)
      (io:apri-lettura-nella-directory (motore-directory engine) name
        :max-transfer (opzione-indice-paginato-size template) :max-file-bytes (opzione-indice-paginato-bytes template))
    (let ((complete nil))
      (unwind-protect
           (multiple-value-prog1
               (progn
                 (osserva-motore engine :index-image-candidate)
                 (footer-candidato-corrente-p engine file eof buffer source))
             (setf complete t))
        (if complete (io:chiudi file) (tenta-cleanup-motore engine (lambda () (io:chiudi file))))))))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-REC-001
(declaim (ftype (function (string opzione-indice-paginato) opzione-indice-paginato) opzione-candidato-scoperto))
(defun opzione-candidato-scoperto (name template)
  "Pre: selected canonical name, validated immutable profile. Post: private copy of the selection.
No I/O or commit proof: adoption must still verify it completely."
  (crea-opzione-indice-paginato name :page-size (opzione-indice-paginato-size template)
    :frames (opzione-indice-paginato-frames template) :max-visits (opzione-indice-paginato-visits template)
    :max-bytes (opzione-indice-paginato-bytes template)))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore arcdocdb.index.page:fonte-indice index) null) verifica-fonte-startup-indice))
(defun verifica-fonte-startup-indice (engine source revision)
  "Pre: owner, after discovery callbacks and before returning the selection.
Post: RECOVERING, healthy controller, revision and canonical source intact; INVARIANT-VIOLATION without adoption."
  (p::esigi-indice-sano (motore-index engine))
  (unless (and (eq :recovering (motore-state engine))
               (eq :healthy (s:stato-controllore-serie (motore-controller engine)))
               (= revision (p::indice-primario-revision (motore-index engine)))
               (arcdocdb.index.page::stessa-fonte-indice-p source (fonte-canonica-indice-motore engine)))
    (error 'invariant-violation :reason :engine-image-discovery-source-changed))
  nil)

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (motore opzione-scoperta-indice) (or null opzione-indice-paginato)) scopri-indice-paginato-motore))
(defun scopri-indice-paginato-motore (engine config)
  "Pre: RECOVERING owner after canonical replay, exclusive namespace. Post: maximum name among eligible footers or NIL.
Bounded inventory/candidates/footers; zero adoptions. Absence keeps the resident index; real errors reject startup.
Lexicographic hexadecimal order is priority only, not history or a source of truth."
  (esigi-owner-motore engine)
  (unless (eq :recovering (motore-state engine)) (error 'invariant-violation :reason :engine-image-discovery-state))
  (osserva-motore engine :before-index-discovery)
  (let* ((limit (opzione-scoperta-indice-names config))
         (names (io:elenca-directory (motore-directory engine) :max-names limit :max-total-name-bytes (* 255 limit)))
         (count (conta-candidati-indice names (opzione-scoperta-indice-candidates config)))
         (template (opzione-scoperta-indice-template config))
         (buffer (make-array (opzione-indice-paginato-size template) :element-type '(unsigned-byte 8) :initial-element 0))
         (source (fonte-canonica-indice-motore engine))
         (revision (p::indice-primario-revision (motore-index engine))) (selected nil) (visited 0))
    (loop for name across names do
      (when (nome-candidato-indice-p name)
        (incf visited)
        (when (ispeziona-candidato-indice engine name template buffer source)
          (when (nome-candidato-preferito-p name selected) (setf selected name)))))
    (unless (= count visited)
      (error 'invariant-violation :reason :engine-image-discovery-inventory))
    (osserva-motore engine :index-image-discovered)
    (verifica-fonte-startup-indice engine source revision)
    (when selected (opzione-candidato-scoperto selected template))))
