;;; OWNER: caricatore/verificatore, buffer stabile per la durata della chiamata.
;;; SHARED: nessuno; il chiamante impedisce mutazioni/riuso mentre verifica.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-AFF-002
(declaim (ftype (function (octets index index identita-pagina) page-kind) verifica-header-pagina))
(defun verifica-header-pagina (buffer start size identity)
  "Pre: page present and size admitted. Post: intact header and exact identity.
CORRUPTION-DETECTED for CRC/identity/fields; UNSUPPORTED-FORMAT for unknown version/type."
  (esigi-pagina (= (leggi-u32 buffer (+ start +off-header-crc+))
                   (crc32c buffer start (+ start +off-header-crc+)))
                'corruption-detected :index-page-header-crc)
  (esigi-pagina (and (= (leggi-u32 buffer start) +page-magic-low+)
                    (= (leggi-u32 buffer (+ start +off-magic-high+)) +page-magic-high+))
                'corruption-detected :index-page-magic)
  (unless (= (leggi-u16 buffer (+ start +off-version+)) +page-version+)
    (error 'unsupported-format :reason :index-page-version))
  (esigi-pagina (and (= (aref buffer (+ start +off-size+)) (nth-value 0 (geometria-pagina size)))
                    (zerop (leggi-u32 buffer (+ start +off-flags+)))
                    (zerop (leggi-u32 buffer (+ start +off-reserved+))))
                'corruption-detected :index-page-header-fields)
  (esigi-pagina
   (and (u64-equal-p buffer (+ start +off-image+) (identita-pagina-image identity))
        (u64-equal-p buffer (+ start +off-page+) (identita-pagina-page identity))
        (u64-equal-p buffer (+ start +off-generation+) (identita-pagina-generation identity))
        (loop for i below +page-identity-bytes+ always
              (= (aref buffer (+ start +off-series+ i)) (aref (identita-pagina-serie identity) i))))
   'corruption-detected :index-page-identity)
  (case (aref buffer (+ start +off-kind+))
    (1 :bucket) (2 :directory) (3 :chiave)
    (otherwise (error 'unsupported-format :reason :index-page-kind))))

;;; REQ: REQ-IDX-009 REQ-AFF-004 REQ-AFF-002
(declaim (ftype (function (octets integer integer identita-pagina)
                         (values page-kind fixnum u32 index page-number page-number &optional))
                verifica-pagina-indice))
(defun verifica-pagina-indice (buffer start end identity)
  "Pre: stable one-page span, authoritative identity from the expected reference.
Post: type, count, parameter, used, next, and next-generation only after complete verification.
INVALID-ARGUMENT for range outside buffer; CORRUPTION-DETECTED for an incomplete/inconsistent page;
UNSUPPORTED-FORMAT for unknown version/type with an intact header. No modification or I/O.
Does not certify complete chains, key hash, commit, snapshot, or GET liveness."
  (check-range buffer start end)
  (let ((size (- end start)))
    (esigi-pagina (plusp (nth-value 0 (geometria-pagina size)))
                  'corruption-detected :index-page-size)
    (let* ((kind (verifica-header-pagina buffer start size identity))
           (used (leggi-u32 buffer (+ start +off-used+)))
           (count (leggi-u32 buffer (+ start +off-count+)))
           (parameter (leggi-u32 buffer (+ start +off-parameter+)))
           (next (leggi-u64 buffer (+ start +off-next+)))
           (generation (leggi-u64 buffer (+ start +off-next-generation+))))
      (esigi-pagina (and (<= used (- size +page-header+)) (<= count 65535)
                        (<= next +page-id-max+) (<= generation +page-id-max+))
                    'corruption-detected :index-page-header-domain)
      (esigi-pagina (= (leggi-u32 buffer (+ start +off-body-crc+))
                       (crc32c buffer (+ start +page-header+) end))
                    'corruption-detected :index-page-body-crc)
      (esigi-pagina (pagina-zero-p buffer (+ start +page-header+ used) end)
                    'corruption-detected :index-page-padding)
      (verifica-corpo-pagina buffer (+ start +page-header+) used size identity
                             kind count parameter next generation 'corruption-detected)
      (values kind count parameter used next generation))))
