;;;; Cold multiset aggregation of compatible immutable latency populations.
;;; OWNER: the caller owns the input vector and the fresh result until publication.
;;; SHARED: inputs are immutable, safely published snapshots; no source or shared writes (INV-P6).
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(defconstant +massime-istantanee-merge+ 4096)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (configurazione-istogramma configurazione-istogramma) boolean)
                %configurazioni-istogramma-compatibili-p))
(defun %configurazioni-istogramma-compatibili-p (left right)
  "Pre: immutable validated configurations. Post: exact geometry, unit, scale and domain compatibility.
Source sample caps are deliberately independent; this pure predicate signals no ordinary condition."
  ;; Decision: each equality is independently necessary. Tests cover precision and maximum
  ;; with equal cell counts, unit with equal scale, tick scale alone, and domain alone.
  (and (= (configurazione-istogramma-bit-precisione left)
          (configurazione-istogramma-bit-precisione right))
       (= (configurazione-istogramma-massimo left) (configurazione-istogramma-massimo right))
       (eq (configurazione-istogramma-unita left) (configurazione-istogramma-unita right))
       (= (configurazione-istogramma-tick-al-secondo left)
          (configurazione-istogramma-tick-al-secondo right))
       (eq (configurazione-istogramma-dominio left) (configurazione-istogramma-dominio right))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (simple-vector) configurazione-istogramma) %verifica-configurazioni-merge))
(defun %verifica-configurazioni-merge (snapshots)
  "Pre: caller-owned vector of 1..4096 entries. Post: every entry is a compatible immutable snapshot.
INVALID-ARGUMENT rejects foreign entries or mismatched configurations before any result allocation."
  (unless (istantanea-latenze-p (svref snapshots 0))
    (error 'invalid-argument :reason :metrics-merge-snapshot))
  (let ((reference (istantanea-latenze-configurazione (svref snapshots 0))))
    (loop for snapshot across snapshots
          do (unless (istantanea-latenze-p snapshot)
               (error 'invalid-argument :reason :metrics-merge-snapshot))
             (unless (%configurazioni-istogramma-compatibili-p
                      reference (istantanea-latenze-configurazione snapshot))
               (error 'invalid-argument :reason :metrics-merge-config)))
    reference))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (istantanea-latenze) campioni) %verifica-popolazione-merge))
(defun %verifica-popolazione-merge (snapshot)
  "Pre: valid immutable snapshot from owner capture or this module's merge, with trusted maximum metadata.
Post: fixed storage and exact population within its source cap; maximum/bin consistency is not revalidated.
Capture preserves max=0 for empty populations and an occupied bin for the accepted maximum; merge preserves both.
INVARIANT-VIOLATION rejects inconsistent internal populations; subtraction bounds every addition.
These checks do not certify snapshots forged through private constructors or modified private storage."
  (let* ((config (istantanea-latenze-configurazione snapshot))
         (counts (istantanea-latenze-contatori snapshot))
         (population (istantanea-latenze-campioni snapshot)) (sum 0))
    (declare (type campioni sum))
    (unless (= (length counts) (configurazione-istogramma-celle config))
      (error 'invariant-violation :reason :metrics-histogram-population))
    (when (> population (configurazione-istogramma-limite-campioni config))
      (error 'invariant-violation :reason :metrics-histogram-population))
    (loop for part across counts
          do (when (> part (- population sum))
               (error 'invariant-violation :reason :metrics-histogram-population))
             (incf sum part))
    (unless (= sum population)
      (error 'invariant-violation :reason :metrics-histogram-population))
    population))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (simple-vector (integer 1 #.+massimi-campioni+))
                         (values campioni boolean latenza)) %prepara-popolazione-merge))
(defun %prepara-popolazione-merge (snapshots limit)
  "Pre: compatible immutable snapshots and valid requested cap. Post: exact total, saturation OR and maximum.
RESOURCE-EXHAUSTED rejects any excess before addition/allocation; inconsistent sources signal INVARIANT-VIOLATION."
  (let ((total 0) (saturated nil) (maximum 0))
    (declare (type campioni total) (type boolean saturated) (type latenza maximum))
    (loop for snapshot across snapshots
          do (let ((count (%verifica-popolazione-merge snapshot)))
               (when (> count (- limit total))
                 (error 'arcdocdb.conditions:resource-exhausted :reason :metrics-merge-sample-limit))
               (incf total count)
               (setf saturated (or saturated (istantanea-latenze-saturata-p snapshot))
                     maximum (max maximum (istantanea-latenze-massimo-osservato snapshot)))))
    (values total saturated maximum)))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (celle-istogramma simple-vector campioni) celle-istogramma)
                %somma-contatori-merge))
(defun %somma-contatori-merge (target snapshots total)
  "Pre: private zeroed target, compatible immutable sources and verified total within the requested cap.
Post: exact cellwise multiset sum, including above-range counts. INVARIANT-VIOLATION rejects excess before addition."
  (loop for snapshot across snapshots
        do (let ((source (istantanea-latenze-contatori snapshot)))
             (dotimes (index (length target))
               (let ((old (aref target index)) (part (aref source index)))
                 (when (> part (- total old))
                   (error 'invariant-violation :reason :metrics-histogram-population))
                 (setf (aref target index) (+ old part))))))
  target)

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t &key (:limite-campioni t)) istantanea-latenze) unisci-istantanee-latenze))
(defun unisci-istantanee-latenze (snapshots &key (limite-campioni +massimi-campioni+))
  "Pre: caller-stable SIMPLE-VECTOR of 1..4096 safely published immutable latency snapshots.
Post: fresh private counters/configuration with the requested cap, exact population/maximum and source saturation OR.
Geometry, unit, tick scale and domain must agree; source caps may differ. Empty sources are permitted.
INVALID-ARGUMENT rejects arguments/configurations; RESOURCE-EXHAUSTED rejects an aggregate beyond the cap;
INVARIANT-VIOLATION rejects inconsistent populations. Input validation precedes result allocation.
This cold multiset operation counts repeated entries; source identity and publication belong to its caller."
  (unless (typep snapshots 'simple-vector)
    (error 'invalid-argument :reason :metrics-merge-argument))
  (unless (<= 1 (length snapshots) +massime-istantanee-merge+)
    (error 'invalid-argument :reason :metrics-merge-argument))
  (unless (typep limite-campioni '(integer 1 #.+massimi-campioni+))
    (error 'invalid-argument :reason :metrics-merge-argument))
  (let ((reference (%verifica-configurazioni-merge snapshots)))
    (multiple-value-bind (total saturated maximum)
        (%prepara-popolazione-merge snapshots limite-campioni)
      (let* ((config (crea-configurazione-istogramma
                      :bit-precisione (configurazione-istogramma-bit-precisione reference)
                      :massimo (configurazione-istogramma-massimo reference)
                      :limite-campioni limite-campioni
                      :unita (configurazione-istogramma-unita reference)
                      :tick-al-secondo (configurazione-istogramma-tick-al-secondo reference)
                      :dominio (configurazione-istogramma-dominio reference)))
             (counts (make-array (configurazione-istogramma-celle config)
                                 :element-type '(unsigned-byte 64) :initial-element 0))
             (result (%make-istantanea-latenze config (%somma-contatori-merge counts snapshots total)
                                              total saturated maximum)))
        (%verifica-popolazione-merge result)
        result))))
