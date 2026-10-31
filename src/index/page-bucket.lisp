;;; OWNER: verifier sul buffer privato e stabile del caricamento/preparazione.
;;; SHARED: nessuno; non e' il lookup della futura cache.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009
(declaim (ftype (function (octets index fixnum fixnum u32 page-error) null) verifica-sonda-pagina))
(defun verifica-sonda-pagina (buffer start capacity slot low condition)
  "Pre: controls present and canonical capacity. Post: slot reachable through groups of 16.
Condition required if an earlier EMPTY group would make key invisible."
  (unless (and (member capacity '(32 128 512)) (<= 0 slot (1- capacity))
               (<= (+ start capacity) (length buffer)))
    (error 'invariant-violation :reason :index-page-probe-range))
  (let ((base (logand (ash low -7) (- capacity +page-group+)))
        (target (logand slot (- +page-group+))))
    (dotimes (step (floor capacity +page-group+))
      (when (= base target) (return-from verifica-sonda-pagina nil))
      (dotimes (i +page-group+)
        (esigi-pagina (/= (aref buffer (+ start base i)) +page-empty+)
                      condition :index-page-probe))
      (setf base (logand (+ base +page-group+) (1- capacity)))))
  (error 'invariant-violation :reason :index-page-probe-bound))

;;; REQ: REQ-IDX-009 REQ-LIM-001 REQ-LIM-003
(declaim (ftype (function (octets index page-error) null) verifica-record-entry-pagina))
(defun verifica-record-entry-pagina (buffer entry condition)
  "Pre: 64-byte entry present. Post: representable v2 primary candidate.
Condition required for zero CSN, record/key/document beyond limit, or invalid segment end.
Does not verify record CRC or commit decision; no data returned."
  (let ((key-length (leggi-u16 buffer (+ entry +entry-key-length+)))
        (record-length (leggi-u32 buffer (+ entry +entry-length+)))
        (offset (leggi-u32 buffer (+ entry +entry-location+))))
    (esigi-pagina (and (or (plusp (leggi-u32 buffer (+ entry +entry-csn+)))
                          (plusp (leggi-u32 buffer (+ entry +entry-csn+ 4))))
                      (plusp key-length)
                      (<= (+ +header-bytes+ key-length) record-length +max-record-bytes+)
                      (<= (- record-length +header-bytes+ key-length) +max-document-bytes+)
                      (<= (+ offset record-length) #xffffffff))
                  condition :index-page-record)
    (esigi-pagina (and (zerop (leggi-u32 buffer (+ entry +entry-reserved+)))
                      (zerop (leggi-u64 buffer (+ entry +entry-tail+))))
                  condition :index-page-entry-reserved))
  nil)

;;; REQ: REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (octets index index index identita-pagina index page-error) index)
                verifica-chiave-entry-pagina))
(defun verifica-chiave-entry-pagina (buffer entry cursor limit identity size condition)
  "Pre: record and range verified; CURSOR/LIMIT relative to body. Post: arena cursor.
Condition required for inconsistent flags, packing, external reference, or length."
  (unless (and (<= cursor limit (length buffer)) (<= (+ entry +entry-bytes+) (length buffer)))
    (error 'invariant-violation :reason :index-page-entry-range))
  (let ((flags (leggi-u16 buffer (+ entry +entry-flags+)))
        (offset (leggi-u32 buffer (+ entry +entry-key-offset+)))
        (length (leggi-u16 buffer (+ entry +entry-key-length+))))
    (case flags
      (0 (esigi-pagina (and (= offset cursor) (<= length (- limit cursor))
                            (pagina-zero-p buffer (+ entry +entry-key-page+) (+ entry +entry-tail+)))
                       condition :index-page-inline-key)
         (+ cursor length))
      (1 (esigi-pagina (and (zerop offset) (plusp (leggi-u64 buffer (+ entry +entry-key-page+))))
                       condition :index-page-external-key)
         (verifica-ref-binario buffer (+ entry +entry-key-page+) identity size condition)
         cursor)
      (otherwise (error condition :reason :index-page-key-flags)))))

;;; REQ: REQ-IDX-009
(declaim (ftype (function (octets index index index identita-pagina fixnum u32 page-error) null)
                verifica-bucket-pagina))
(defun verifica-bucket-pagina (buffer start used size identity count parameter condition)
  "Pre: body present and bounded to page. Post: valid controls, entries, keys, and packing.
Condition required for inconsistent geometry, occupancy, fingerprint, probe, or contents."
  (let* ((capacity (nth-value 1 (geometria-pagina size)))
         (base (* capacity (1+ +entry-bytes+))) (cursor base) (live 0))
    (esigi-pagina (and (= parameter capacity) (<= base used)
                      (<= count (floor (* capacity 7) 8))) condition :index-page-bucket-layout)
    (dotimes (slot capacity)
      (let* ((control (aref buffer (+ start slot)))
             (entry (+ start capacity (* slot +entry-bytes+))))
        (cond
          ((= control +page-empty+)
           (esigi-pagina (pagina-zero-p buffer entry (+ entry +entry-bytes+))
                         condition :index-page-empty-slot))
          ((< control 128)
           (incf live)
           (let ((low (leggi-u32 buffer entry)))
             (esigi-pagina (= control (logand low 127)) condition :index-page-fingerprint)
             (verifica-sonda-pagina buffer start capacity slot low condition))
           (verifica-record-entry-pagina buffer entry condition)
           (setf cursor (verifica-chiave-entry-pagina
                         buffer entry cursor used identity size condition)))
          (t (error condition :reason :index-page-control)))))
    (esigi-pagina (and (= live count) (= cursor used)) condition :index-page-bucket-count))
  nil)
