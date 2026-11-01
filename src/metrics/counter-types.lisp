;;;; Fixed owner-local event accounting and immutable source provenance.
;;; OWNER: constructing thread, using the private request histogram's existing scope.
;;; SHARED: immutable published snapshots only; no cross-Serie update (INV-P6).
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +massime-fonti-metriche+ 4096)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +numero-contatori-metriche+ 10)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +numero-code-metriche+ 2)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +numero-celle-code+ (* 2 +numero-code-metriche+))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +contatore-richieste+ 0)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +contatore-errori+ 1)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +primo-contatore-cache+ 2)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +contatore-wal-append+ 6)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +contatore-wal-byte+ 7)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +contatore-wal-flush+ 8)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +contatore-wal-record+ 9)
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype identita-serie-metrica () '(unsigned-byte 128))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype indice-contatore-metrico () '(integer 0 #.(1- +numero-contatori-metriche+)))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype contatori-metrici () '(simple-array (unsigned-byte 64) (#.+numero-contatori-metriche+)))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype celle-code () '(simple-array (unsigned-byte 64) (#.+numero-celle-code+)))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype maschera-contatori-metrici () '(unsigned-byte #.+numero-contatori-metriche+))
;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftype maschera-code-metriche () '(unsigned-byte #.+numero-code-metriche+))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(defstruct (fonte-metriche (:constructor %make-fonte-metriche (serie worker)) (:copier nil))
  "Pre: validated immutable identities. Post: original partition identity; private constructor checks types."
  (serie 0 :type identita-serie-metrica :read-only t)
  (worker 0 :type campioni :read-only t))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(defstruct (metriche-serie
             (:constructor %make-metriche-serie (serie worker inizio fonte contatori code latenza-richieste latenza-flush))
             (:copier nil))
  "Pre: fresh bounded arrays and two histograms on this owner. Post: private fixed event state.
The request histogram owns the whole partition's fault/reentry scope; no child is exposed."
  (serie 0 :type identita-serie-metrica :read-only t)
  (worker 0 :type campioni :read-only t)
  (inizio 0 :type latenza)
  (fonte (error 'invalid-argument :reason :metrics-source) :type fonte-metriche :read-only t)
  (contatori (make-array +numero-contatori-metriche+ :element-type '(unsigned-byte 64)) :type contatori-metrici :read-only t)
  (code (make-array +numero-celle-code+ :element-type '(unsigned-byte 64)) :type celle-code :read-only t)
  (code-note 0 :type maschera-code-metriche)
  (incompleti 0 :type maschera-contatori-metrici)
  (latenza-richieste (error 'invalid-argument :reason :metrics-histogram-config)
                    :type istogramma-latenze :read-only t)
  (latenza-flush (error 'invalid-argument :reason :metrics-histogram-config)
                :type istogramma-latenze :read-only t))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(defstruct (istantanea-metriche
             (:constructor %make-istantanea-metriche
                 (serie worker inizio fine origini contatori code code-note incompleti latenza-richieste latenza-flush))
             (:copier nil))
  "Pre: validated cut, disjoint bounded immutable origins and independent copied arrays.
Post: immutable metric image; private constructor type checks apply, publication belongs to caller."
  (serie nil :type (or null identita-serie-metrica) :read-only t)
  (worker nil :type (or null campioni) :read-only t)
  (inizio 0 :type latenza :read-only t)
  (fine 0 :type latenza :read-only t)
  (origini #() :type simple-vector :read-only t)
  (contatori (make-array +numero-contatori-metriche+ :element-type '(unsigned-byte 64)) :type contatori-metrici :read-only t)
  (code (make-array +numero-celle-code+ :element-type '(unsigned-byte 64)) :type celle-code :read-only t)
  (code-note 0 :type maschera-code-metriche :read-only t)
  (incompleti 0 :type maschera-contatori-metrici :read-only t)
  (latenza-richieste (error 'invalid-argument :reason :metrics-histogram-config)
                    :type istantanea-latenze :read-only t)
  (latenza-flush (error 'invalid-argument :reason :metrics-histogram-config)
                :type istantanea-latenze :read-only t))
