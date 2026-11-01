;;; OWNER: one service connection/actor; fixed cold workspace, no peer-controlled allocation dimensions.
;;; SHARED: none; request references are cleared on every dispatch exit.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(deftype local-group-csns () '(simple-array (unsigned-byte 64) (*)))
;;; REQ: REQ-IPC-002 REQ-LIM-003
(deftype local-read-spans () '(simple-array (unsigned-byte 64) (*)))
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +group-span-words+ 5)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +group-kind+ 0)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +group-key-start+ 1)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +group-key-size+ 2)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +group-doc-start+ 3)
;;; REQ: REQ-IPC-002 REQ-LIM-003
(defconstant +group-doc-size+ 4)

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-AFF-008
(defstruct (local-group-workspace (:constructor make-local-group-workspace ()) (:copier nil))
  "Pre: cold connection construction. Post: bounded eight-operation storage, exclusively owned by the actor.
No engine capability; write descriptors or read-key copies remain only through dispatch and are cleared on every exit."
  (operations (make-array 8 :initial-element nil) :type simple-vector :read-only t)
  (csns (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0) :type local-group-csns :read-only t)
  (spans (make-array 40 :element-type '(unsigned-byte 32) :initial-element 0)
         :type (simple-array (unsigned-byte 32) (*)) :read-only t))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(declaim (ftype (function (local-group-workspace) null) clear-local-group-workspace))
(defun clear-local-group-workspace (work)
  "Pre: owning actor after last use, no asynchronous borrower. Post: no retained request or decoded CSN/span.
Fixed arrays reused; no I/O, allocation, publication or retry."
  (fill (local-group-workspace-operations work) nil)
  (fill (local-group-workspace-csns work) 0) (fill (local-group-workspace-spans work) 0) nil)
