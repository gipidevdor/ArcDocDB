;;;; Scratch CBOR fisso; creazione soltanto prima del percorso caldo.
;;; OWNER: chiamante esclusivo; ogni worker usa un proprio spazio, mai concorrente.
;;; SHARED: nessuno stato scrivibile condiviso tra Serie o worker (INV-P6).
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-008
(defconstant +cbor-scan-max-bytes+ 16777216)
;;; REQ: REQ-LIM-002 REQ-AFF-008
(defconstant +cbor-scan-max-depth+ 100)
;;; REQ: REQ-LIM-002 REQ-AFF-008
(defconstant +cbor-scan-frames+ 102)

;;; REQ: REQ-LIM-002 REQ-AFF-008
(defstruct (spazio-cbor (:constructor %crea-spazio-cbor ()) (:copier nil))
  "Exclusive scratch: 102 frames, no buffer reference; reusable after error.
KINDS: 0 root, 1/2 definite array/map, 3/4 indefinite, 5/6 indefinite bytes/text.
REMAINING: remaining children; for indefinite map, 0 key, 1 value expected."
  (kinds (make-array +cbor-scan-frames+ :element-type '(unsigned-byte 8)
                    :initial-element 0)
         :type (simple-array (unsigned-byte 8) (102)) :read-only t)
  (remaining (make-array +cbor-scan-frames+ :element-type '(unsigned-byte 32)
                        :initial-element 0)
             :type (simple-array (unsigned-byte 32) (102)) :read-only t)
  (cursor 0 :type index)
  (top 0 :type (integer 0 101))
  (nodes 0 :type (integer 0 16777216))
  (depth 0 :type (integer 0 100))
  (peak-depth 0 :type (integer 0 100))
  (pending-tag nil :type boolean))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function () (values spazio-cbor &optional))
                %crea-spazio-cbor crea-spazio-cbor))
(defun crea-spazio-cbor ()
  "Pre: worker cold path. Post: fixed private workspace without retained buffer.
Allocates structure and two arrays only here; INVARIANT-VIOLATION for incorrect initial shape.
The caller does not share the workspace between concurrent verifications."
  (let ((space (%crea-spazio-cbor)))
    (unless (and (= +cbor-scan-frames+ (length (spazio-cbor-kinds space)))
                 (= +cbor-scan-frames+ (length (spazio-cbor-remaining space))))
      (error 'invariant-violation :reason :cbor-workspace-capacity))
    (unless (and (zerop (spazio-cbor-top space)) (zerop (spazio-cbor-depth space))
                 (not (eq (spazio-cbor-kinds space) (spazio-cbor-remaining space))))
      (error 'invariant-violation :reason :cbor-workspace-initial))
    space))

;;; REQ: REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (spazio-cbor index) (values null &optional)) azzera-spazio-cbor))
(defun azzera-spazio-cbor (space start)
  "Pre: complete preflight and exclusive scratch. Post: all frames zeroed, root=1.
No allocation or buffer reference; INVARIANT-VIOLATION for incorrect capacity."
  (unless (= +cbor-scan-frames+ (length (spazio-cbor-kinds space)))
    (error 'invariant-violation :reason :cbor-workspace-capacity))
  (unless (= +cbor-scan-frames+ (length (spazio-cbor-remaining space)))
    (error 'invariant-violation :reason :cbor-workspace-capacity))
  (fill (spazio-cbor-kinds space) 0)
  (fill (spazio-cbor-remaining space) 0)
  (setf (aref (spazio-cbor-remaining space) 0) 1
        (spazio-cbor-cursor space) start (spazio-cbor-top space) 0
        (spazio-cbor-nodes space) 0 (spazio-cbor-depth space) 0
        (spazio-cbor-peak-depth space) 0 (spazio-cbor-pending-tag space) nil)
  nil)
