;;;; Interi little-endian su vettori contigui; tutti i range sono half-open.
(in-package #:arcdocdb.binary)
(declaim (optimize (safety 3) (debug 2)))
(deftype octets () '(simple-array (unsigned-byte 8) (*)))
(deftype index () '(integer 0 #.most-positive-fixnum))
(deftype u8 () '(unsigned-byte 8))
(deftype u16 () '(unsigned-byte 16))
(deftype u32 () '(unsigned-byte 32))
(deftype u64 () '(unsigned-byte 64))

;;; REQ: REQ-LIM-001 REQ-AFF-004
(declaim (ftype (function (octets integer integer) (values index &optional))
                check-range))
(defun check-range (buffer start end)
  "Pre: BUFFER octets. Post: returns END if 0<=START<=END<=length.
Signals INVALID-ARGUMENT for an invalid range; does not modify BUFFER."
  (unless (<= 0 start end (length buffer))
    (error 'invalid-argument :reason :buffer-range))
  end)

;;; REQ: REQ-FOR-003
(declaim (inline leggi-u16 leggi-u32))
(declaim (ftype (function (octets index) (values u16 &optional)) leggi-u16)
         (ftype (function (octets index) (values u32 &optional)) leggi-u32)
         (ftype (function (octets index) (values u64 &optional)) leggi-u64))
(defun leggi-u16 (buffer start)
  "Pre: valid two-byte range. Post: LE u16; no modification.
Signals INVALID-ARGUMENT if out of range."
  (check-range buffer start (+ start 2))
  (logior (aref buffer start) (ash (aref buffer (+ start 1)) 8)))

;;; REQ: REQ-FOR-003
(defun leggi-u32 (buffer start)
  "Pre: valid four-byte range. Post: LE u32; no modification.
Signals INVALID-ARGUMENT if out of range."
  (check-range buffer start (+ start 4))
  (logior (aref buffer start) (ash (aref buffer (+ start 1)) 8)
          (ash (aref buffer (+ start 2)) 16) (ash (aref buffer (+ start 3)) 24)))

;;; REQ: REQ-FOR-003
(defun leggi-u64 (buffer start)
  "Pre: valid eight-byte range. Post: LE u64; no modification.
Signals INVALID-ARGUMENT if out of range; a high u64 may be a bignum."
  (check-range buffer start (+ start 8))
  (logior (leggi-u32 buffer start) (ash (leggi-u32 buffer (+ start 4)) 32)))

;;; REQ: REQ-FOR-003
(declaim (ftype (function (octets index u16) (values u16 &optional)) scrivi-u16)
         (ftype (function (octets index u32) (values u32 &optional)) scrivi-u32)
         (ftype (function (octets index u64) (values u64 &optional)) scrivi-u64))
(defun scrivi-u16 (buffer start value)
  "Pre: VALUE u16 and valid two-byte range. Post: two LE bytes written.
Signals INVALID-ARGUMENT before modification if the range is invalid."
  (check-range buffer start (+ start 2))
  (dotimes (i 2 value) (setf (aref buffer (+ start i)) (ldb (byte 8 (* i 8)) value))))

;;; REQ: REQ-FOR-003
(defun scrivi-u32 (buffer start value)
  "Pre: VALUE u32 and valid four-byte range. Post: four LE bytes written.
Signals INVALID-ARGUMENT before modification if the range is invalid."
  (check-range buffer start (+ start 4))
  (dotimes (i 4 value) (setf (aref buffer (+ start i)) (ldb (byte 8 (* i 8)) value))))

;;; REQ: REQ-FOR-003
(defun scrivi-u64 (buffer start value)
  "Pre: VALUE u64 and valid eight-byte range. Post: eight LE bytes written.
Signals INVALID-ARGUMENT before modification if the range is invalid."
  (check-range buffer start (+ start 8))
  (dotimes (i 8 value) (setf (aref buffer (+ start i)) (ldb (byte 8 (* i 8)) value))))
