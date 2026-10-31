;;;; Errori di confine: nessuna gestione del ciclo di vita di Serie in questo strato.
(in-package #:arcdocdb.conditions)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-AFF-004
(define-condition arcdocdb-error (error)
  ((reason :initarg :reason :reader error-reason :type keyword)
   (offset :initarg :offset :initform nil :reader error-offset
           :type (or null (integer 0 *))))
  (:documentation "Typed error; reason contains no document data.")
  (:report (lambda (condition stream)
             (format stream "ArcDocDB: ~A~@[ all'offset ~D~]"
                     (error-reason condition) (error-offset condition)))))

;;; REQ: REQ-AFF-004
(define-condition invalid-argument (arcdocdb-error) ()
  (:documentation "Invalid argument or range; no write performed."))
;;; REQ: REQ-AFF-004 REQ-AFF-002
(define-condition corruption-detected (arcdocdb-error) ()
  (:documentation "Inconsistent record or proof; no verified data returned."))
;;; REQ: REQ-FOR-002
(define-condition unsupported-format (arcdocdb-error) ()
  (:documentation "Unknown version; no trial interpretation."))
;;; REQ: REQ-LIM-001 REQ-LIM-003
(define-condition resource-exhausted (arcdocdb-error) ()
  (:documentation "Configured budget exhausted; rejection before writing."))
;;; REQ: REQ-AFF-004
(define-condition invariant-violation (arcdocdb-error) ()
  (:documentation "Internal invariant violated; the owner applies fail-stop."))

;;; REQ: REQ-MVC-004 REQ-AFF-004
(define-condition snapshot-too-old (arcdocdb-error) ()
  (:documentation "Expired or ended snapshot, or reused identity; no result returned."))

;;; REQ: REQ-AFF-001 REQ-AFF-004
(define-condition io-fault (arcdocdb-error)
  ((operation :initarg :operation :reader error-operation :type keyword)
   (errno :initarg :errno :initform nil :reader error-errno :type (or null fixnum))
   (cleanup-errno :initarg :cleanup-errno :initform nil :reader error-cleanup-errno
                  :type (or null fixnum))
   (transferred :initarg :transferred :initform 0 :reader error-transferred
                :type (integer 0 *)))
  (:documentation "Declared I/O fault, with errno and known progress; no retry."))
