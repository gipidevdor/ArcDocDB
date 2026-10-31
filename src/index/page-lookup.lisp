;;; OWNER: attore I/O del lettore; immagine/root stabili per l'intera richiesta.
;;; SHARED: nessuno; candidati non equivalgono a visibilita' committed o snapshot.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-009
(declaim (ftype (function (u32 u32 fixnum fixnum) fixnum) radix-digest-pagina))
(defun radix-digest-pagina (high low bits shift)
  "Pre: verified directory geometry, bits <=11, shift+bits <=64. Post: radix index from two u32s.
No temporary u64 packing, including fields crossing bit 32."
  (unless (and (<= 1 bits 11) (<= 0 shift 63) (<= (+ bits shift) 64))
    (error 'invariant-violation :reason :index-page-lookup-radix))
  (if (>= shift 32) (ldb (byte bits (- shift 32)) high)
      (ldb (byte bits 0) (logior (ash low (- shift))
                               (ash (ldb (byte bits 0) high) (- 32 shift))))))

;;; REQ: REQ-IDX-001 REQ-IDX-009
(declaim (ftype (function (lettore-indice-pagine octets index index u32 u32) (integer -1 65536))
                cerca-entry-pagina))
(defun cerca-entry-pagina (reader key start end high low)
  "Pre: verified bucket and trusted key digest. Post: entry offset or -1, complete comparison.
Flat probe in groups of 16, all group candidates before EMPTY; at most C slots."
  (let* ((buffer (lettore-indice-pagine-bucket reader)) (capacity (leggi-u32 buffer +off-parameter+))
         (base (logand (ash low -7) (- capacity +page-group+))))
    (dotimes (step (floor capacity +page-group+))
      (let ((empty nil))
        (dotimes (i +page-group+)
          (let* ((slot (+ base i)) (control (aref buffer (+ +page-header+ slot)))
                 (entry (+ +page-header+ capacity (* slot +entry-bytes+))))
            (when (= control +page-empty+) (setf empty t))
            (when (and (= control (logand low 127)) (= (leggi-u32 buffer entry) low)
                       (= (leggi-u32 buffer (+ entry 4)) high)
                       (chiave-entry-uguale-p reader entry key start end))
              (return-from cerca-entry-pagina entry))))
        (when empty (return-from cerca-entry-pagina -1)))
      (setf base (logand (+ base +page-group+) (1- capacity))))
    -1))

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (lettore-indice-pagine octets index index u32 u32) (integer -1 65536))
                attraversa-indice-pagine))
(defun attraversa-indice-pagine (reader key start end high low)
  "Pre: BUSY and fresh budgets. Post: candidate entry or -1 after complete directory/bucket path.
Directory with strictly descending radix intervals; overflow only for buckets.
Every page verified by cache, chains bounded by budget; errors distinct from absence."
  (let* ((root (lettore-indice-pagine-root reader)) (page (identita-pagina-page root))
         (generation (identita-pagina-generation root)) (limit 64) (bucket-seen nil)
         (buffer (lettore-indice-pagine-bucket reader)))
    (loop repeat (lettore-indice-pagine-max-pages reader) do
      (leggi-pagina-lookup reader page generation buffer)
      (case (aref buffer +off-kind+)
        (2 (let* ((parameter (leggi-u32 buffer +off-parameter+))
                  (bits (ldb (byte 8 0) parameter)) (shift (ldb (byte 8 8) parameter)))
             (when (or bucket-seen (> (+ bits shift) limit))
               (error 'corruption-detected :reason :index-page-lookup-directory-order))
             (setf limit shift)
             (let ((ref (+ +page-header+ (* +reference-bytes+ (radix-digest-pagina high low bits shift)))))
               (setf page (leggi-u64 buffer ref) generation (leggi-u64 buffer (+ ref +reference-generation+))))))
        (1 (setf bucket-seen t)
           (let ((entry (cerca-entry-pagina reader key start end high low)))
             (when (plusp entry)
               (setf (lettore-indice-pagine-found-page reader) page
                     (lettore-indice-pagine-found-entry reader) entry)
               (return-from attraversa-indice-pagine entry)))
           (setf page (leggi-u64 buffer +off-next+) generation (leggi-u64 buffer +off-next-generation+)))
        (otherwise (error 'corruption-detected :reason :index-page-lookup-page-kind)))
      (when (zerop page) (return-from attraversa-indice-pagine -1)))
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-page-lookup-page-budget)))

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (lettore-indice-pagine octets integer integer
                         (simple-array (unsigned-byte 64) (5))) null) preflight-lookup-pagine))
(defun preflight-lookup-pagine (reader key start end destination)
  "Pre: stable caller inputs. Post: owner, non-reentrancy, spans, and separate output verified without I/O.
INVALID-ARGUMENT before modifying credits/scratch; no coordination across Serie."
  (unless (eq (lettore-indice-pagine-owner reader) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :index-page-lookup-owner))
  (when (lettore-indice-pagine-busy reader)
    (error 'invalid-argument :reason :index-page-lookup-reentry))
  (check-range key start end)
  (unless (<= 1 (- end start) +max-key-bytes+)
    (error 'invalid-argument :reason :index-page-lookup-key-length))
  (when (or (eq key (lettore-indice-pagine-bucket reader))
            (eq key (lettore-indice-pagine-key-page reader)))
    (error 'invalid-argument :reason :index-page-lookup-alias))
  (unless (= (length destination) 5) (error 'invalid-argument :reason :index-page-lookup-output))
  nil)

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (lettore-indice-pagine octets integer integer u32 u32
                         (simple-array (unsigned-byte 64) (5)) index) (member :live :absent)) leggi-indice-pagine-budget))
(defun leggi-indice-pagine-budget (reader key start end high low destination page-budget)
  "Pre: immutable image and trusted Serie XXH64 digest, as in the resident primary.
Post: LIVE copies five words in resident candidate format; ABSENT leaves output untouched.
I/O, corruption, and budget errors propagated without output; BUSY released on every exit.
This is a candidate: commit, MVCC, segment pin, and record CRC remain GET responsibilities."
  (preflight-lookup-pagine reader key start end destination)
  (setf (lettore-indice-pagine-busy reader) t
        (lettore-indice-pagine-found-page reader) 0 (lettore-indice-pagine-found-entry reader) 0
        (lettore-indice-pagine-remaining reader) (min page-budget (lettore-indice-pagine-max-pages reader))
        (lettore-indice-pagine-key-remaining reader) (lettore-indice-pagine-max-key-bytes reader))
  (unwind-protect
       (let ((entry (attraversa-indice-pagine reader key start end high low)))
         (when (= entry -1) (return-from leggi-indice-pagine-budget :absent))
         (let ((buffer (lettore-indice-pagine-bucket reader)))
           (setf (aref destination 0) (logior (leggi-u32 buffer (+ entry +entry-csn+))
                                            (ash (leggi-u32 buffer (+ entry +entry-csn+ 4)) 32))
                 (aref destination 1) (logior (leggi-u32 buffer (+ entry +entry-location+))
                                            (ash (leggi-u32 buffer (+ entry +entry-location+ 4)) 32))
                 (aref destination 2) (logior (ash (- end start) 32) (ash 1 48))
                 (aref destination 3) (leggi-u32 buffer (+ entry +entry-length+))
                 (aref destination 4) 0))
         :live)
    (setf (lettore-indice-pagine-busy reader) nil)))


;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (lettore-indice-pagine octets integer integer u32 u32
                         (simple-array (unsigned-byte 64) (5))) (member :live :absent)) leggi-indice-pagine))
(defun leggi-indice-pagine (reader key start end high low destination)
  "Pre: trusted digest and exclusive context. Post: complete candidate or ABSENT without touching output.
Private budget is the maximum for the request; global verification uses a lower cumulative ceiling."
  (leggi-indice-pagine-budget reader key start end high low destination (lettore-indice-pagine-max-pages reader)))
