;;; OWNER: attore I/O, buffer footer privato; nessuna operazione di namespace o pubblicazione.
;;; SHARED: nessuno; fonte attesa proviene dal recovery canonico del chiamante.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-AFF-002
(declaim (ftype (function (octets sigillo-immagine) null) scrivi-sigillo-immagine))
(defun scrivi-sigillo-immagine (buffer seal)
  "Pre: descrittore interno canonico, buffer esclusivo di una pagina. Post: footer completo con CRC.
INVALID-ARGUMENT prima degli effetti per taglia; non implica append/flush o commit."
  (unless (= (length buffer) (sigillo-immagine-size seal)) (error 'invalid-argument :reason :index-image-size))
  (let ((source (sigillo-immagine-source seal)) (root (sigillo-immagine-root seal)))
    (fill buffer 0)
    (scrivi-u32 buffer 0 +image-magic-low+) (scrivi-u32 buffer 4 +image-magic-high+)
    (scrivi-u16 buffer +image-off-version+ +image-version+)
    (setf (aref buffer +image-off-size+) (nth-value 0 (geometria-pagina (length buffer))))
    (replace buffer (fonte-indice-archive source) :start1 +image-off-archive+)
    (replace buffer (fonte-indice-series source) :start1 +image-off-series+)
    (replace buffer (fonte-indice-token source) :start1 +image-off-token+)
    (scrivi-u64 buffer +image-off-image+ (identita-pagina-image root))
    (scrivi-u64 buffer +image-off-generation+ (identita-pagina-generation root))
    (scrivi-u64 buffer +image-off-root+ (identita-pagina-page root))
    (scrivi-u64 buffer +image-off-root-generation+ (identita-pagina-generation root))
    (scrivi-u64 buffer +image-off-pages+ (sigillo-immagine-pages seal))
    (scrivi-u64 buffer +image-off-csn+ (fonte-indice-csn source))
    (scrivi-u64 buffer +image-off-count+ (fonte-indice-count source))
    (scrivi-u32 buffer +image-off-seed-high+ (sigillo-immagine-seed-high seal))
    (scrivi-u32 buffer +image-off-seed-low+ (sigillo-immagine-seed-low seal))
    (scrivi-u32 buffer (- (length buffer) 4) (crc32c buffer 0 (- (length buffer) 4)))) nil)

;;; REQ: REQ-IDX-010 REQ-AFF-002
(declaim (ftype (function (octets fonte-indice u32 u32) null) verifica-fonte-sigillo))
(defun verifica-fonte-sigillo (buffer source seed-high seed-low)
  "Pre: checksum footer gia' verificato. Post: fonte, CSN, conteggio e seme esatti prima delle pagine.
CORRUPTION-DETECTED per immagine incompatibile; nessuna deduzione di autorita' dal footer."
  (unless (and (equalp (subseq buffer +image-off-archive+ +image-off-series+) (fonte-indice-archive source))
               (equalp (subseq buffer +image-off-series+ +image-off-image+) (fonte-indice-series source))
               (equalp (subseq buffer +image-off-token+ +image-used+) (fonte-indice-token source))
               (= (leggi-u64 buffer +image-off-csn+) (fonte-indice-csn source))
               (= (leggi-u64 buffer +image-off-count+) (fonte-indice-count source))
               (= (leggi-u32 buffer +image-off-seed-high+) seed-high)
               (= (leggi-u32 buffer +image-off-seed-low+) seed-low))
    (error 'corruption-detected :reason :index-image-source-mismatch)) nil)

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (octets index fonte-indice u32 u32) sigillo-immagine) leggi-sigillo-immagine))
(defun leggi-sigillo-immagine (buffer eof source seed-high seed-low)
  "Pre: una pagina footer stabile, EOF esatto osservato dal controller. Post: metadati solo dopo il gate completo.
CORRUPTION-DETECTED per geometria/CRC/campi; UNSUPPORTED-FORMAT per versione integra ignota."
  (let* ((size (length buffer)) (crc-offset (- size 4)))
    (unless (and (member size '(4096 16384 65536)) (>= eof (* 3 size)) (zerop (mod eof size)))
      (error 'corruption-detected :reason :index-image-size))
    (unless (= (leggi-u32 buffer crc-offset) (crc32c buffer 0 crc-offset))
      (error 'corruption-detected :reason :index-image-footer-crc))
    (unless (and (= (leggi-u32 buffer 0) +image-magic-low+) (= (leggi-u32 buffer 4) +image-magic-high+))
      (error 'corruption-detected :reason :index-image-magic))
    (unless (= (leggi-u16 buffer +image-off-version+) +image-version+)
      (error 'unsupported-format :reason :index-image-version))
    (unless (and (= (aref buffer +image-off-size+) (nth-value 0 (geometria-pagina size)))
                 (zerop (aref buffer +image-off-flags+)) (zerop (leggi-u32 buffer +image-off-reserved+))
                 (pagina-zero-p buffer +image-used+ crc-offset))
      (error 'corruption-detected :reason :index-image-reserved))
    (verifica-fonte-sigillo buffer source seed-high seed-low)
    (let ((pages (leggi-u64 buffer +image-off-pages+)) (image (leggi-u64 buffer +image-off-image+))
          (generation (leggi-u64 buffer +image-off-generation+)) (root (leggi-u64 buffer +image-off-root+)))
      (unless (and (<= 1 pages 65536) (= eof (* (+ pages 2) size)) (= root (* pages size))
                   (<= 1 image +page-id-max+) (<= 1 generation +page-id-max+)
                   (= generation (leggi-u64 buffer +image-off-root-generation+)))
        (error 'corruption-detected :reason :index-image-root))
      (%make-sigillo-immagine source (crea-identita-pagina (fonte-indice-series source) image root generation)
                             size pages seed-high seed-low))))
