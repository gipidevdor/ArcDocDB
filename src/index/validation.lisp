;;; OWNER: buffer di input privato del writer; dati stabili verificati anche dai reader.
;;; SHARED: nessuna modifica nei predicati; nessuna interpretazione del layout v1.
(in-package #:arcdocdb.index.slots)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-LIM-001 REQ-LIM-003 REQ-AFF-004
(declaim (inline metadati-chiave-validi-p record-slot-valido-p
                 contenuto-vivo-valido-p contenuto-vuoto-p esigi-contenuto-slot))
(declaim (ftype (function (u64) boolean) metadati-chiave-validi-p))
(defun metadati-chiave-validi-p (key)
  "Pre: private or consistently acquired v2 word. Post: T for a representable live key.
NIL for an invalid flag, reserved field, length, or range; does not verify the actual arena."
  (let ((length (ldb (byte 16 32) key)) (offset (ldb (byte 32 0) key)))
    (and (= 1 (ldb (byte 8 48) key)) (zerop (ldb (byte 8 56) key))
         (plusp length) (<= (+ offset length) #x100000000))))

;;; REQ: REQ-IDX-001 REQ-LIM-001 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (u64 u64 u64) boolean) record-slot-valido-p))
(defun record-slot-valido-p (location key length-word)
  "Pre: private or consistently acquired v2 words. Post: T for valid record/location bounds.
NIL for an invalid reserved field, length/document, or end outside the segment; does not read storage bytes."
  (let ((key-length (ldb (byte 16 32) key)) (record-length (ldb (byte 32 0) length-word))
        (offset (ldb (byte 32 0) location)))
    (and (zerop (ldb (byte 32 32) length-word))
         (<= (+ +header-bytes+ key-length) record-length +max-record-bytes+)
         (<= (- record-length +header-bytes+ key-length) +max-document-bytes+)
         (<= (+ offset record-length) #xffffffff))))

;;; REQ: REQ-IDX-001 REQ-LIM-001 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (u64 u64 u64 u64 u64 boolean) boolean) contenuto-vivo-valido-p))
(defun contenuto-vivo-valido-p (csn location key length-word end retained)
  "Pre: private fields or fields acquired with a stable seqlock; no shared reads here.
Post: T only for live representable v2 content; NIL without effects for invalid data.
Does not verify arena membership, record bytes, manifest, or commit decision."
  (and (plusp csn) (metadati-chiave-validi-p key) (record-slot-valido-p location key length-word)
       (if retained (> end csn) (zerop end))))

;;; REQ: REQ-IDX-003 REQ-IDX-006
(declaim (ftype (function (u64 u64 u64 u64 u64) boolean) contenuto-vuoto-p))
(defun contenuto-vuoto-p (csn location key length-word end)
  "Pre: private or consistently acquired fields. Post: T only if all fields are zero.
No effects; an empty slot is not a storage tombstone."
  (zerop (logior csn location key length-word end)))

;;; REQ: REQ-LIM-001 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (banco-slot contenuto-slot) null) esigi-contenuto-slot))
(defun esigi-contenuto-slot (bank source)
  "Pre: five-word SOURCE exclusive to the writer, unchanged throughout the operation.
Post: valid live v2 content; INVALID-ARGUMENT without touching the bank for invalid input."
  (unless (contenuto-vivo-valido-p (aref source 0) (aref source 1) (aref source 2)
                                 (aref source 3) (aref source 4) (banco-slot-retained bank))
    (error 'invalid-argument :reason :index-slot-payload))
  nil)

;;; REQ: REQ-IDX-003 REQ-AFF-004
(declaim (inline verifica-campi-slot))
(declaim (ftype (function (banco-slot u64 u64 u64 u64 u64) boolean) verifica-campi-slot))
(defun verifica-campi-slot (bank csn location key length-word end)
  "Pre: stable internal data after seqlock or under an exclusive writer.
Post: T if live, NIL if completely empty; otherwise FAULTED and INVARIANT-VIOLATION."
  (cond ((contenuto-vuoto-p csn location key length-word end) nil)
        ((contenuto-vivo-valido-p csn location key length-word end (banco-slot-retained bank)) t)
        (t (guasto-slot bank :index-slot-inconsistent))))
