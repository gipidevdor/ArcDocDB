;;; OWNER: controller esclusivo della Serie, insieme stabile mantenuto aperto fino al termine.
;;; SHARED: sole query dei risultati readonly; nessun accesso al registro CSN dell'Archivio.
(in-package #:arcdocdb.recovery.closed)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-STO-006 REQ-AFF-008
(declaim (ftype (function (active-recuperato simple-vector &key (:max-segmenti index))
                         (values boolean u64 &optional)) massimo-csn-serie-recuperata))
(defun massimo-csn-serie-recuperata (active closed &key (max-segmenti 65536))
  "Pre: exclusive recovery; ACTIVE and all CLOSED from the same CONTROL, stable sources and vector.
Post: complete observed maximum for these segments, after the canonical set gate.
Budget/count/authority/duplicates/lifetime verified; original conditions propagate.
Includes no other Serie or DECISION without local prepared records, assigns no CSN, and admits no traffic."
  (let ((control (arcdocdb.recovery.active::active-recuperato-control active))
        (input (arcdocdb.get::segmento-get-file (arcdocdb.recovery.active:segmento-active-recuperato active))))
    (arcdocdb.io::esigi-aperto input :input)
    (verifica-closed-completi control closed :max-segmenti max-segmenti)
    (multiple-value-bind (present maximum) (arcdocdb.recovery.active:massimo-csn-active-recuperato active)
      (loop for item across closed
            do (multiple-value-bind (found csn) (massimo-csn-closed-recuperato (the closed-recuperato item))
                 (when found (setf present t maximum (max maximum csn)))))
      (arcdocdb.io::esigi-aperto input :input)
      (arcdocdb.io::esigi-aperto (arcdocdb.control::control-recuperato-input control) :input)
      (values present maximum))))
