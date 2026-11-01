;;;; Bounded, owner-local latency observations; no clock or I/O dependency.
;;; OWNER: one worker owns each mutable histogram; configuration and captured snapshots are immutable.
;;; SHARED: immutable configuration/snapshots only; no shared writes per observation (INV-P6).
;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(defpackage #:arcdocdb.metrics
  (:use #:cl)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation)
  (:export #:+massima-latenza+ #:+massimi-campioni+
           #:configurazione-istogramma #:istogramma-latenze #:istantanea-latenze
           #:crea-configurazione-istogramma #:crea-istogramma
           #:registra-latenza #:azzera-istogramma #:istantanea-istogramma #:percentile-latenza
           #:configurazione-istogramma-bit-precisione #:configurazione-istogramma-massimo
           #:configurazione-istogramma-limite-campioni #:configurazione-istogramma-unita
           #:configurazione-istogramma-tick-al-secondo #:configurazione-istogramma-dominio
           #:configurazione-istogramma-celle #:configurazione-istogramma-byte-contatori
           #:istantanea-latenze-configurazione #:istantanea-latenze-campioni
           #:istantanea-latenze-saturata-p #:istantanea-latenze-massimo-osservato))
