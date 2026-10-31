;;; OWNER: inserimenti opportunistici dei reader sotto mutex locale senza attesa.
;;; SHARED: dati sotto seqlock; nessun writer della Serie, snapshot o file coinvolti.
(in-package #:arcdocdb.cache)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CCH-001 REQ-CCH-004 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (classe-cache cache-slot u32 u32 u32 u32 octets index boolean)
                         (values boolean boolean &optional)) scrivi-posto-cache))
(defun scrivi-posto-cache (class slot high low offset size source start scan-p)
  "Pre: local mutex, slot with credit, verified private source, and range not aliasing the arena.
Post: copy/tag published before the new even sequence; returns eviction and scan without rereading.
A nonlocal exit disables the slot before mutex release; no rollback or hidden error."
  (let* ((tags (classe-cache-tags class)) (base (* slot +cache-tag-words+))
         (sequences (classe-cache-sequences class)) (sequence (aref sequences slot))
         (evicted (plusp (aref tags (+ base 3))))
         (polluted (and evicted (plusp (aref (classe-cache-origins class) slot))
                        (zerop (aref (classe-cache-reread class) slot))))
         (target (* slot (classe-cache-size class))) (complete nil))
    (declare (type u64 sequence))
    (unwind-protect
         (progn
           (setf (aref sequences slot) (1+ sequence))
           (sb-thread:barrier (:write))
           (replace (classe-cache-arena class) source :start1 target :end1 (+ target size)
                    :start2 start :end2 (+ start size))
           (setf (aref tags base) high (aref tags (+ base 1)) low
                 (aref tags (+ base 2)) offset (aref tags (+ base 3)) size
                 (aref (classe-cache-references class) slot) (if scan-p 0 1)
                 (aref (classe-cache-origins class) slot) (if scan-p 1 0)
                 (aref (classe-cache-reread class) slot) 0
                 (aref (classe-cache-rejected class) slot) 0)
           (sb-thread:barrier (:write))
           (setf (aref sequences slot) (+ sequence 2) complete t))
      (unless complete
        (setf (aref (classe-cache-disabled class) slot) 1)
        (sb-thread:barrier (:write))))
    (values evicted polluted)))

;;; REQ: REQ-CCH-001 REQ-CCH-004 REQ-OBS-002
(declaim (ftype (function (classe-cache u32 u32 u32 u32 octets index boolean)
                         (values (member :inserted :present :busy :unavailable)
                                 boolean boolean &optional)) prova-inserimento-cache))
(defun prova-inserimento-cache (class high low offset size source start scan-p)
  "Pre: input and copy already verified; stable source. Post: exactly one local mutex attempt.
BUSY/PRESENT/UNAVAILABLE do not copy data; INSERTED returns events for worker metrics.
The CLOCK hand may advance on UNAVAILABLE; interruptions propagate with slot cleanup."
  (let* ((set (insieme-cache class high low offset))
         (locks (classe-cache-locks class)) (lock (aref locks (logand set (1- (length locks))))))
    (sb-thread:with-mutex (lock :wait-p nil)
      (when (gia-in-cache-p class set high low offset size)
        (return-from prova-inserimento-cache (values :present nil nil)))
      (let ((slot (scegli-vittima-cache class set)))
        (unless slot (return-from prova-inserimento-cache (values :unavailable nil nil)))
        (multiple-value-bind (evicted polluted)
            (scrivi-posto-cache class slot high low offset size source start scan-p)
          (return-from prova-inserimento-cache (values :inserted evicted polluted)))))
    (values :busy nil nil)))

;;; REQ: REQ-CCH-001 REQ-CCH-002 REQ-CCH-004 REQ-AFF-002 REQ-OBS-002
(declaim (ftype (function (cache-serie u32 u32 u32 u32 octets u32 u32 u8 octets index
                                     &key (:version integer) (:proof-buffer (or null octets))
                                     (:proof-start index) (:proof-end index) (:scan-p boolean))
                         (values (member :inserted :present :busy :unavailable :bypassed)
                                 boolean boolean &optional)) inserisci-record-cache))
(defun inserisci-record-cache (cache segment-high segment-low offset size key csn-high csn-low flags
                              source start &key (version 2) proof-buffer
                                                (proof-start 0) (proof-end 0) (scan-p nil))
  "Pre: private source from segment read, committed location/CSN, and authoritative proof.
Post: input verified before insertion; absent class => BYPASSED, without affecting the GET result.
CORRUPTION-DETECTED on input propagates to the segment caller: it is not cache corruption.
No waiting/retry/I/O; eviction/scan events returned, no global counter."
  (check-cache-request segment-high segment-low offset size key csn-high csn-low flags version)
  (let ((class (scegli-classe-cache cache size)))
    (unless class (return-from inserisci-record-cache (values :bypassed nil nil)))
    (check-cache-buffers class source start key proof-buffer proof-start proof-end flags size nil)
    (verifica-put-parole source start (+ start size) key csn-high csn-low flags
                         :version version :proof-buffer proof-buffer
                         :proof-start proof-start :proof-end proof-end)
    (prova-inserimento-cache class segment-high segment-low offset size source start scan-p)))
