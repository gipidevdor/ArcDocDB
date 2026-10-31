;;; OWNER: il caller conserva buffer, chiave, prova e versione visibile dell'indice.
;;; SHARED: sole letture della configurazione; nessun pin, file o dato comune fra Serie.
(in-package #:arcdocdb.cache)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CCH-002 REQ-CCH-004 REQ-AFF-008
(declaim (ftype (function (u32 u32 u32 u32 octets u32 u32 u8 integer) null) check-cache-request))
(defun check-cache-request (segment-high segment-low offset size key csn-high csn-low flags version)
  "Pre: typed fields from the location and expected committed record.
Post: nonzero identity, physical u32 range, format limits, valid CSN and flags before copying.
INVALID-ARGUMENT/UNSUPPORTED-FORMAT for input; no visibility decision."
  (multiple-value-bind (key-limit record-limit) (format-limits version)
    (unless (and (or (plusp segment-high) (plusp segment-low))
                 (or (plusp csn-high) (plusp csn-low))
                 (<= 1 (length key) key-limit)
                 (<= (+ +header-bytes+ (length key) 1) size record-limit)
                 (<= (+ offset size) #x100000000)
                 (zerop (logand flags (logxor 255 (allowed-flags +put+)))))
      (error 'invalid-argument :reason :cache-request)))
  nil)

;;; REQ: REQ-CCH-001 REQ-CCH-004
(declaim (ftype (function (cache-serie u32) (or null classe-cache)) scegli-classe-cache))
(defun scegli-classe-cache (cache size)
  "Pre: verified length; immutable partition. Post: first sufficient active class or NIL.
At most sixteen classes; no allocation, waiting, or mutation."
  (let ((classes (cache-serie-classes cache)))
    (dotimes (i (length classes) nil)
      (let ((class (aref classes i)))
        (when (<= size (classe-cache-size class)) (return class))))))

;;; REQ: REQ-CCH-001 REQ-CCH-004
(declaim (inline mix-cache))
(declaim (ftype (function (u32) u32) mix-cache))
(defun mix-cache (word)
  "Pre: u32. Post: deterministic scalar mixing to distribute aligned offsets.
Does not compute document-key digests; no state, global seed, or cryptographic guarantee."
  (declare (type u32 word))
  (let* ((a (logxor word (ash word -16)))
         (b (logand #xffffffff (* a #x7feb352d)))
         (c (logxor b (ash b -15)))
         (d (logand #xffffffff (* c #x846ca68b))))
    (declare (type u32 a b c d))
    (logxor d (ash d -16))))

;;; REQ: REQ-CCH-001 REQ-CCH-004
(declaim (ftype (function (classe-cache u32 u32 u32) cache-set) insieme-cache))
(defun insieme-cache (class high low offset)
  "Pre: class and location verified. Post: set index within capacity.
Mixing includes 64 segment bits and 32 offset bits; no probing beyond the set."
  (logand (1- (classe-cache-sets class))
          (mix-cache (logxor (mix-cache high) (mix-cache (logxor low #x9e3779b9))
                             (mix-cache (logxor offset #x85ebca6b))))))

;;; REQ: REQ-CCH-002 REQ-CCH-004
(declaim (inline tag-cache-p))
(declaim (ftype (function (classe-cache cache-slot u32 u32 u32 u32) boolean) tag-cache-p))
(defun tag-cache-p (class slot high low offset size)
  "Pre: slot in the bounded set. Post: comparison of the four u32 values without copying.
Provisional result without seqlock: can only initiate a copy to be reverified or a miss."
  (let ((tags (classe-cache-tags class)) (base (* slot +cache-tag-words+)))
    (and (= high (aref tags base)) (= low (aref tags (+ base 1)))
         (= offset (aref tags (+ base 2))) (= size (aref tags (+ base 3))))))
