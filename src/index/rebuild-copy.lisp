;;; OWNER: writer costruisce e verifica candidati BUILDING, senza pubblicarli.
;;; SHARED: legge solo il sorgente corrente; scrive candidati e revisione locale della Serie.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-005 REQ-IDX-007 REQ-AFF-004
(declaim (ftype (function (frammento-indice frammento-indice (or null frammento-indice) u32)
                         frammento-indice) destinazione-ricostruzione))
(defun destinazione-ricostruzione (source first second high)
  "Pre: ordered children or rebuild candidate of the verified geometry. Post: digest destination.
Source prefix verified in preflight; no selection based on physical slot."
  (esigi-frammento-sano (frammento-indice-owner source) first)
  (if second
      (progn
        (esigi-frammento-sano (frammento-indice-owner source) second)
        (if (oddp (prefix-hash high (frammento-indice-depth first))) second first))
      first))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice frammento-indice (or null frammento-indice)
                                         digests-frammento digests-frammento contenuto-slot contesto-indice)
                         null) copia-ricostruzione))
(defun copia-ricostruzione (index source first second highs lows words context)
  "Pre: complete preflight, empty candidates, distinct private scratch. Post: compact live copies.
C slots visited; copies only live-key bytes and identical payloads except for arena offset."
  (let ((arena (frammento-indice-arena source)))
    (dotimes (slot (indice-primario-capacity index))
      (when (campiona-ricostruzione source slot words)
        (let ((offset (ldb (byte 32 0) (aref words 2))) (size (ldb (byte 16 32) (aref words 2)))
              (target (destinazione-ricostruzione source first second (aref highs slot))))
          (pubblica-chiave-indice index target arena offset (+ offset size)
                                 (aref highs slot) (aref lows slot) words context)))))
  (esigi-frammento-sano index source)
  nil)

;;; REQ: REQ-IDX-005 REQ-IDX-007 REQ-AFF-004
(declaim (ftype (function (contenuto-slot contenuto-slot) boolean) copia-ricostruzione-uguale-p))
(defun copia-ricostruzione-uguale-p (original copy)
  "Pre: two validated private live payloads. Post: identical except for local arena offset.
Seqlock is not part of the payload; key-len/flags/reserved must remain identical."
  (and (= (aref original 0) (aref copy 0)) (= (aref original 1) (aref copy 1))
       (= (ash (aref original 2) -32) (ash (aref copy 2) -32))
       (= (aref original 3) (aref copy 3)) (= (aref original 4) (aref copy 4))))

;;; REQ: REQ-IDX-005 REQ-IDX-007 REQ-AFF-004
(declaim (ftype (function (indice-primario frammento-indice frammento-indice (or null frammento-indice)
                                         digests-frammento digests-frammento contenuto-slot contenuto-slot)
                         null) verifica-ricostruzione))
(defun verifica-ricostruzione (index source first second highs lows words work)
  "Pre: copies built, exclusive writer. Post: every live source key found with identical payload.
Candidate count checked later by the plan; bytewise lookup does not infer faithful copying from count."
  (let ((arena (frammento-indice-arena source)))
    (dotimes (slot (indice-primario-capacity index))
      (when (campiona-ricostruzione source slot words)
        (let ((offset (ldb (byte 32 0) (aref words 2))) (size (ldb (byte 16 32) (aref words 2)))
              (target (destinazione-ricostruzione source first second (aref highs slot))))
          (multiple-value-bind (found-slot found)
              (sonda-ricostruzione target arena offset (+ offset size) (aref lows slot) work)
            (unless (and found (<= 0 found-slot) (copia-ricostruzione-uguale-p words work))
              (guasto-indice index :primary-rebuild-copy-mismatch)))))))
  (esigi-frammento-sano index first)
  nil)
