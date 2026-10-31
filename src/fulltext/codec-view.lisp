;;; OWNER: chi apre il segmento mantiene vivi e immutabili buffer e vista fino a quiescenza.
;;; SHARED: sole letture; ogni query usa uno spazio analitico esclusivo.
(in-package #:arcdocdb.fulltext.codec)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-008
(defstruct (vista-indice-full-text (:constructor %vista-indice-full-text (buffer starts sizes descriptor)) (:copier nil))
  "Immutable view created only after complete verification against the supplied descriptor."
  (buffer (make-array 0 :element-type '(unsigned-byte 8)) :type octets :read-only t)
  (starts (make-array 6 :element-type 'u64) :type (simple-array (unsigned-byte 64) (6)) :read-only t)
  (sizes (make-array 6 :element-type 'u64) :type (simple-array (unsigned-byte 64) (6)) :read-only t)
  (descriptor nil :type (or null descrittore-full-text) :read-only t))

;;; REQ: REQ-SEC-008
(declaim (ftype (function (t t t t t &key (:max-bytes t) (:max-work t)) vista-indice-full-text)
                crea-vista-indice-full-text))
(defun crea-vista-indice-full-text (buffer start end descriptor space
                                  &key (max-bytes f::+default-file-budget+) (max-work 268435456))
  "Pre: cold opening, buffer immutable until view retirement. Post: owned view
after verification; only six spans copied, scratch reusable. Propagates checker errors.
Does not take I/O ownership, publish generations, or certify documents/MVCC."
  (let ((next (verifica-indice-full-text buffer start end descriptor space :max-bytes max-bytes :max-work max-work)))
    (unless (= next end) (error 'invariant-violation :reason :fulltext-view-end))
    (%vista-indice-full-text buffer (copy-seq (spazio-codec-full-text-starts space))
                            (copy-seq (spazio-codec-full-text-lengths space)) descriptor)))

;;; REQ: REQ-SEC-004 REQ-SEC-007 REQ-SEC-008
(declaim (ftype (function (vista-indice-full-text index u16 a:spazio-full-text index) (member -1 0 1))
                confronta-termine-vista))
(defun confronta-termine-vista (view item field query term)
  "Pre: verified view and DONE query. Post: DICT comparison with field/token; exclusive budget."
  (a::consuma-lavoro-full-text query)
  (let* ((buffer (vista-indice-full-text-buffer view))
         (p (+ (aref (vista-indice-full-text-starts view) 1) (* item +dict-width+)))
         (f (leggi-u16 buffer p)) (n (leggi-u32 buffer (+ p +dict-term-length+)))
         (begin (+ (aref (vista-indice-full-text-starts view) 2) (leggi-u64 buffer (+ p +dict-term-offset+))))
         (q-start (aref (a::spazio-full-text-begins query) term))
         (q-end (aref (a::spazio-full-text-ends query) term)))
    (unless (= f field) (return-from confronta-termine-vista (if (< f field) -1 1)))
    (r::confronta-termini buffer begin n (a::spazio-full-text-bytes query) q-start (- q-end q-start) query)))

;;; REQ: REQ-SEC-004 REQ-SEC-008
(declaim (ftype (function (vista-indice-full-text u16 a:spazio-full-text index) fixnum) cerca-termine-vista))
(defun cerca-termine-vista (view field query term)
  "Pre: verified view. Post: DICT index or -1; binary search with query budget."
  (let ((low 0) (high (floor (aref (vista-indice-full-text-sizes view) 1) +dict-width+)))
    (loop repeat (1+ high) while (< low high) do
      (let* ((mid (floor (+ low high) 2)) (order (confronta-termine-vista view mid field query term)))
        (cond ((minusp order) (setf low (1+ mid))) ((plusp order) (setf high mid))
              (t (return-from cerca-termine-vista mid)))))
    -1))

;;; REQ: REQ-SEC-004 REQ-SEC-008
(declaim (ftype (function (vista-indice-full-text index u32 a:spazio-full-text) fixnum) cerca-posting-vista))
(defun cerca-posting-vista (view dictionary row query)
  "Pre: valid DICT index. Post: absolute posting offset for the row, or -1."
  (let* ((buffer (vista-indice-full-text-buffer view))
         (d (+ (aref (vista-indice-full-text-starts view) 1) (* dictionary +dict-width+)))
         (low (leggi-u64 buffer (+ d +dict-first-posting+)))
         (high (+ low (leggi-u64 buffer (+ d +dict-posting-count+))))
         (base (aref (vista-indice-full-text-starts view) 3)))
    (loop repeat (1+ (- high low)) while (< low high) do
      (a::consuma-lavoro-full-text query)
      (let* ((mid (floor (+ low high) 2)) (p (+ base (* mid +posting-width+))) (r (leggi-u32 buffer p)))
        (cond ((< r row) (setf low (1+ mid))) ((> r row) (setf high mid))
              (t (return-from cerca-posting-vista p)))))
    -1))
