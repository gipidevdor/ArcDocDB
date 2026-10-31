;;; OWNER: writer con gettone della Serie; array digest privati prenotati dal controller.
;;; SHARED: legge soltanto la root corrente e il sorgente; nessun coordinamento tra Serie.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (fixnum t t t t) null) esigi-mappe-hash))
(defun esigi-mappe-hash (capacity highs lows seed-high seed-low)
  "Pre: Serie capability. Post: distinct C-element u32 maps and seed in two u32s.
INVALID-ARGUMENT before any allocation/write: :primary-hash-arrays or :primary-hash-seed."
  (unless (and (typep highs 'digests-frammento) (typep lows 'digests-frammento)
               (= capacity (length highs)) (= capacity (length lows)) (not (eq highs lows)))
    (error 'invalid-argument :reason :primary-hash-arrays))
  (unless (and (typep seed-high 'u32) (typep seed-low 'u32))
    (error 'invalid-argument :reason :primary-hash-seed))
  nil)

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice t t t t)
                         (values fixnum fixnum fixnum &optional)) calcola-digests-frammento))
(defun calcola-digests-frammento (index source highs lows seed-high seed-low)
  "Pre: exclusive writer, current published source, private u32 maps and Serie seed.
Post: XXH64 digests at live physical slots, other elements unchanged; three values C, live count, key bytes.
Both u32 seed words must match immutable index configuration, before map access.
Root, bank, arena, and revision unchanged. Allocates two fixed five-u64 scratch buffers: maintenance.
Preflight rejections without writes; inconsistent seed => INVALID-ARGUMENT, corruption => FAULTED.
On rejection during scanning, discard partial private maps; no index rollback."
  (esigi-indice-sano index)
  (esigi-sorgente-directory index (acquisisci-root index) source)
  (let ((capacity (indice-primario-capacity index)))
    (esigi-mappe-hash capacity highs lows seed-high seed-low)
    (multiple-value-bind (expected-high expected-low) (esigi-seme-hash index)
      (unless (and (= expected-high seed-high) (= expected-low seed-low))
        (error 'invalid-argument :reason :primary-hash-seed-mismatch)))
    (when (> (frammento-indice-used source) (length (frammento-indice-arena source)))
      (guasto-indice index :primary-rebuild-arena-used))
    (let ((words (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0))
          (work (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0))
          (live 0) (bytes 0) (arena (frammento-indice-arena source)))
      (declare (type fixnum live bytes))
      (dotimes (slot capacity)
        (when (campiona-ricostruzione source slot words)
          (let ((offset (ldb (byte 32 0) (aref words 2))) (size (ldb (byte 16 32) (aref words 2))))
            (multiple-value-bind (high low)
                (hash-con-seme-indice index arena offset (+ offset size) seed-high seed-low)
              ;; Il seme e il digest sono interni: una discordanza non e input esterno.
              (handler-case (verifica-digest-ricostruzione source slot high low words work)
                (invalid-argument () (guasto-indice index :primary-hash-source-digest)))
              (setf (aref (the digests-frammento highs) slot) high
                    (aref (the digests-frammento lows) slot) low))
            (incf live) (incf bytes size))))
      (unless (= live (frammento-indice-live source)) (guasto-indice index :primary-rebuild-live-count))
      (values capacity live bytes))))
