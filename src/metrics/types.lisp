;;;; Histogram geometry and ownership, independent of engine/scheduler/protocol.
;;; OWNER: the constructing thread owns each histogram until destruction; no owner transfer.
;;; SHARED: immutable configuration and snapshots only; mutable counters remain private.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +massima-latenza+ #x0fffffffffffffff)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +massimi-campioni+ #x0fffffffffffffff)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype latenza () '(integer 0 #.+massima-latenza+))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype campioni () '(integer 0 #.+massimi-campioni+))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype precisione () '(integer 4 10))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype celle-istogramma () '(simple-array (unsigned-byte 64) (*)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(defstruct (configurazione-istogramma
             (:constructor %make-configurazione-istogramma
                 (bit-precisione massimo limite-campioni unita tick-al-secondo dominio celle byte-contatori)) (:copier nil))
  "Pre: validated bounded geometry. Post: immutable configuration; counters are not shared.
Private constructor type checks apply; no clock or runtime resource is acquired."
  (bit-precisione 7 :type precisione :read-only t)
  (massimo 60000000000 :type latenza :read-only t)
  (limite-campioni +massimi-campioni+ :type (integer 1 #.+massimi-campioni+) :read-only t)
  (unita :nanosecondi :type (member :nanosecondi :microsecondi :tick) :read-only t)
  (tick-al-secondo 1000000000 :type (integer 1 #.+massima-latenza+) :read-only t)
  (dominio :monotono :type keyword :read-only t)
  (celle 2 :type (integer 2 65536) :read-only t)
  (byte-contatori 16 :type (integer 16 524288) :read-only t))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(defstruct (istogramma-latenze
             (:constructor %make-istogramma-latenze (configurazione contatori owner)) (:copier nil))
  "Pre: fresh zeroed counters, validated configuration and current owner.
Post: fixed counter storage; only the owner records, resets or captures. Private type checks apply."
  (configurazione (error 'invalid-argument :reason :metrics-histogram-config)
                 :type configurazione-istogramma :read-only t)
  (contatori (make-array 0 :element-type '(unsigned-byte 64)) :type celle-istogramma :read-only t)
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (campioni 0 :type campioni)
  (guasto-p nil :type boolean)
  (saturato-p nil :type boolean)
  (massimo-osservato 0 :type latenza))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(defstruct (istantanea-latenze
             (:constructor %make-istantanea-latenze
                 (configurazione contatori campioni saturata-p massimo-osservato)) (:copier nil))
  "Pre: independent counter copy captured by its writer. Post: immutable observation image.
No array accessor is exported; readers may use a safely published image on any thread."
  (configurazione (error 'invalid-argument :reason :metrics-histogram-config)
                 :type configurazione-istogramma :read-only t)
  (contatori (make-array 0 :element-type '(unsigned-byte 64)) :type celle-istogramma :read-only t)
  (campioni 0 :type campioni :read-only t)
  (saturata-p nil :type boolean :read-only t)
  (massimo-osservato 0 :type latenza :read-only t))
