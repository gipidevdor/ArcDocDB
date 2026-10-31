(in-package #:arcdocdb.fulltext.codec)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-008
(declaim (ftype (function (octets index index u16 index index u16 spazio-codec-full-text) null)
                controlla-ordine-dizionario))
(defun controlla-ordine-dizionario (buffer begin end field prior-start prior-end prior-field space)
  "Pre: terms within section. Post: strict field/byte order; repetitions rejected.
First term handled by caller; no locale used in comparison."
  (unless (<= begin end (length buffer)) (error 'invariant-violation :reason :fulltext-dict-term-range))
  (unless (or (> field prior-field)
              (and (= field prior-field)
                   (minusp (confronta-span-codec buffer prior-start prior-end buffer begin end space))))
    (error 'corruption-detected :reason :fulltext-dictionary-order :offset begin))
  nil)

;;; REQ: REQ-SEC-008
(declaim (ftype (function (octets descrittore-full-text spazio-codec-full-text) null) verifica-dizionario-file))
(defun verifica-dizionario-file (buffer descriptor space)
  "Pre: frame/META/LENGTHS verified. Post: complete DICT, strings, postings, and positions.
No section residue; terms already in profile; global coverage checked after loop."
  (let* ((starts (spazio-codec-full-text-starts space)) (sizes (spazio-codec-full-text-lengths space))
         (count (floor (aref sizes 1) +dict-width+)) (posts (floor (aref sizes 3) +posting-width+))
         (terms 0) (posting 0) (position 0) (prior-start 0) (prior-end 0) (prior-field 0))
    (dotimes (i count)
      (lavoro-codec space)
      (let* ((p (+ (aref starts 1) (* i +dict-width+))) (field (leggi-u16 buffer p))
             (size (leggi-u32 buffer (+ p +dict-term-length+))) (begin (+ (aref starts 2) terms)))
        (unless (and (campo-dichiarato-p descriptor field) (zerop (leggi-u16 buffer (+ p 2))))
          (error 'corruption-detected :reason :fulltext-dictionary-fields :offset p))
        (unless (<= 1 size (min (descrittore-full-text-term-limit descriptor) (- (aref sizes 2) terms)))
          (error 'corruption-detected :reason :fulltext-term-length :offset p))
        (u64-esatto buffer (+ p +dict-term-offset+) terms :fulltext-term-partition)
        (when (plusp i) (controlla-ordine-dizionario buffer begin (+ begin size) field
                                                   prior-start prior-end prior-field space))
        (verifica-termine-profilo buffer begin (+ begin size) space)
        (u64-esatto buffer (+ p +dict-first-posting+) posting :fulltext-posting-partition)
        (let ((n (indice-u64-bounded buffer (+ p +dict-posting-count+) (- posts posting) :fulltext-posting-count)))
          (when (zerop n) (error 'corruption-detected :reason :fulltext-posting-count :offset p))
          (multiple-value-setq (posting position) (verifica-lista-posting buffer space field posting n position)))
        (incf terms size) (setf prior-start begin prior-end (+ begin size) prior-field field)))
    (unless (and (= terms (aref sizes 2)) (= posting posts) (= (* position +position-width+) (aref sizes 4)))
      (error 'corruption-detected :reason :fulltext-section-partition))
    (verifica-copertura space position))
  nil)

;;; REQ: REQ-SEC-008 REQ-SEC-010
(declaim (ftype (function (t t t t t &key (:max-bytes t) (:max-work t)) index) verifica-indice-full-text))
(defun verifica-indice-full-text (buffer start end descriptor space
                                &key (max-bytes f::+default-file-budget+) (max-work 268435456))
  "Pre: immutable file, authoritative binding copied from descriptor, exclusive scratch.
Post: END only after frame, exact META, canonical terms, orders/partitions, and position union.
Validates structure against supplied PUT map; neither validates hint or document
text, resolves CSNs, nor publishes READY. Correct CRC does not replace checks.
Typed format/corruption/budget errors; no partial result, I/O, or file mutation."
  (prepara-codec descriptor space max-work max-bytes)
  (controlla-buffer-codec buffer start end space descriptor)
  (when (> (- end start) max-bytes) (error 'resource-exhausted :reason :fulltext-file-budget))
  (leggi-sezioni-codec buffer start end descriptor space max-bytes)
  (verifica-lunghezze-file buffer descriptor space)
  (verifica-dizionario-file buffer descriptor space)
  end)
