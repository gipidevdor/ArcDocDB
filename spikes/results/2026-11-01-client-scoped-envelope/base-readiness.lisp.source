;;; OWNER: one I/O actor owns the bounded poll array; descriptors are borrowed, never closed here.
;;; SHARED: no cross-Serie state or event handlers; pin covers only one bounded syscall.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(sb-alien:define-alien-type readiness-pollfd
  (sb-alien:struct readiness-pollfd (fd sb-alien:int) (events sb-alien:short) (revents sb-alien:short)))
;;; REQ: REQ-IPC-002 REQ-AFF-004
(sb-alien:define-alien-routine ("poll" %readiness-poll) sb-alien:int
  (fds sb-alien:system-area-pointer)
  (count #+darwin sb-alien:unsigned-int #-darwin sb-alien:unsigned-long) (milliseconds sb-alien:int))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defstruct (attesa-io (:constructor %make-attesa-io (capacity buffer backend)) (:copier nil))
  "Pre: validating factory. Post: actor-owned scratch and immutable callback; no FD ownership."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (busy nil :type boolean)
  (capacity 1 :type (integer 1 9) :read-only t)
  (buffer (make-array 8 :element-type '(unsigned-byte 8)) :type octets :read-only t)
  (backend nil :type (or null function) :read-only t))

;;; REQ: REQ-IPC-002 REQ-AFF-008 REQ-LIM-003
(declaim (ftype (function (t &key (:backend t)) attesa-io) crea-attesa-io))
(defun crea-attesa-io (capacity &key backend)
  "Pre: untrusted capacity/callback before admission. Post: 1..9 disabled slots, at most 72 payload bytes.
INVALID-ARGUMENT for domains; UNSUPPORTED-FORMAT for unqualified pollfd ABI. No descriptors acquired."
  (unless (and (typep capacity '(integer 1 9)) (typep backend '(or null function)))
    (error 'invalid-argument :reason :io-readiness-config))
  (unless (and (= sb-vm:n-word-bits 64) (= 8 (sb-alien:alien-size readiness-pollfd :bytes))
               #+(or (and darwin arm64) (and linux x86-64)) t
               #-(or (and darwin arm64) (and linux x86-64)) nil)
    (error 'unsupported-format :reason :io-readiness-abi))
  (let ((buffer (make-array (* capacity 8) :element-type '(unsigned-byte 8) :initial-element 0)))
    (dotimes (slot capacity) (arcdocdb.binary:scrivi-u32 buffer (* slot 8) #xffffffff))
    (%make-attesa-io capacity buffer backend)))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (attesa-io) null) esigi-owner-attesa-io))
(defun esigi-owner-attesa-io (wait)
  "Pre: borrowed wait handle. Post: exclusive actor and no callback reentry.
INVALID-ARGUMENT before scratch writes for another owner or an active wait."
  (unless (eq (attesa-io-owner wait) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :io-readiness-owner))
  (when (attesa-io-busy wait) (error 'invalid-argument :reason :io-readiness-reentry))
  nil)

;;; REQ: REQ-IPC-002 REQ-AFF-008
(declaim (ftype (function (attesa-io t t t) null) configura-attesa-io))
(defun configura-attesa-io (wait slot fd direction)
  "Pre: exclusive owner; FD borrowed (zero is valid), NIL disables a slot.
Post: one exact pollfd entry; INVALID-ARGUMENT before writes for slot/FD/direction."
  (esigi-owner-attesa-io wait)
  (unless (and (typep slot '(integer 0 8)) (< slot (attesa-io-capacity wait))
               (typep fd '(or null (integer 0 2147483647))) (member direction '(:input :output)))
    (error 'invalid-argument :reason :io-readiness-slot))
  (let ((buffer (attesa-io-buffer wait)) (offset (* slot 8)))
    (arcdocdb.binary:scrivi-u32 buffer offset (or fd #xffffffff))
    (arcdocdb.binary:scrivi-u16 buffer (+ offset 4) (if fd (if (eq direction :input) 1 4) 0))
    (arcdocdb.binary:scrivi-u16 buffer (+ offset 6) 0))
  nil)

;;; REQ: REQ-IPC-002 REQ-AFF-004
(declaim (ftype (function (octets (integer 1 9) (integer 0 100))
                         (values fixnum fixnum &optional)) sonde-attesa-native))
(defun sonde-attesa-native (buffer count milliseconds)
  "Pre: private pollfd bytes, ABI checked by factory; bounded wait 0..100 ms.
Post: one syscall's count/errno, captured immediately. No retry, close, allocation or event dispatch."
  (assert (= (length buffer) (* count 8)))
  (sb-sys:with-pinned-objects (buffer)
    (let ((n (%readiness-poll (sb-sys:vector-sap buffer) count milliseconds)))
      (values n (if (= n -1) (sb-alien:get-errno) 0)))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (attesa-io fixnum) (member :ready :timeout)) verifica-attesa-io))
(defun verifica-attesa-io (wait count)
  "Pre: nonnegative native count. Post: complete array agrees with count; EOF/error are readiness.
IO-FAULT for POLLNVAL, INVARIANT-VIOLATION for malformed flags/count. Never spins on an invalid FD."
  (let ((actual 0) (buffer (attesa-io-buffer wait)))
    (dotimes (i (attesa-io-capacity wait))
      (let ((flags (arcdocdb.binary:leggi-u16 buffer (+ (* i 8) 6))))
        (unless (zerop (logand flags (lognot #x3d)))
          (error 'invariant-violation :reason :io-readiness-flags))
        (when (logtest flags #x20)
          (error 'io-fault :reason :io-readiness-invalid-fd :operation :poll :errno sb-posix:ebadf))
        (when (and (plusp flags)
                   (not (zerop (logand flags (lognot (logior #x38
                     (arcdocdb.binary:leggi-u16 buffer (+ (* i 8) 4))))))))
          (error 'invariant-violation :reason :io-readiness-interest))
        (when (and (plusp flags) (= #xffffffff (arcdocdb.binary:leggi-u32 buffer (* i 8))))
          (error 'invariant-violation :reason :io-readiness-disabled))
        (unless (zerop flags) (incf actual))))
    (unless (= actual count) (error 'invariant-violation :reason :io-readiness-count))
    (if (zerop count) :timeout :ready)))


;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (attesa-io t) (member :ready :timeout :interrupted)) attendi-io))
(defun attendi-io (wait milliseconds)
  "Pre: exclusive owner, trusted callback. Post: one ready/timeout/interrupted result and scratch released.
Domains fail before writes; hard I/O faults propagate. EINTR never retries or renews a deadline.
Owner/reentry checks precede scratch writes; unwind restores availability on errors and nonlocal exits."
  (unless (typep milliseconds '(integer 0 100)) (error 'invalid-argument :reason :io-readiness-timeout))
  (esigi-owner-attesa-io wait)
  (setf (attesa-io-busy wait) t)
  (unwind-protect
       (progn
         (dotimes (i (attesa-io-capacity wait))
           (arcdocdb.binary:scrivi-u16 (attesa-io-buffer wait) (+ (* i 8) 6) 0))
         (multiple-value-bind (count errno)
             (funcall (or (attesa-io-backend wait) #'sonde-attesa-native)
                      (attesa-io-buffer wait) (attesa-io-capacity wait) milliseconds)
           (unless (and (typep count '(integer -1 9)) (<= count (attesa-io-capacity wait))
                        (typep errno '(integer 0 #.most-positive-fixnum))
                        (if (= count -1) (plusp errno) (zerop errno)))
             (error 'invariant-violation :reason :io-readiness-result))
           (cond ((>= count 0) (verifica-attesa-io wait count))
                 ((= errno sb-posix:eintr) :interrupted)
                 (t (error 'io-fault :reason :io-readiness-syscall :operation :poll :errno errno)))))
    (setf (attesa-io-busy wait) nil)))
