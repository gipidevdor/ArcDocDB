;;; OWNER: solo worker del pool I/O legge segmenti; output/prova esclusivi del compito.
;;; SHARED: capacità readonly mantenute aperte entro EBR; cache locale alla vista della Serie.
(in-package #:arcdocdb.get)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-004 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get u32 u8 (or null u32)) boolean) verifica-prova-target-get))
(defun verifica-prova-target-get (context valid-bytes flags outcome-offset)
  "Pre: valid target, proof offset from the authoritative table of the same segment.
Post: boolean PREPARED; mandatory proof, within the prefix and disjoint from PUT.
INVALID-ARGUMENT for a missing/unexpected offset; inconsistent proof location makes it FAULTED."
  (let ((prepared (not (zerop (logand flags +prepared+)))))
    (if prepared
        (progn
          (unless outcome-offset (error 'invalid-argument :reason :get-outcome-required))
          (let ((offset (ldb (byte 32 0) (aref (contesto-get-content context) 1)))
                (size (ldb (byte 32 0) (aref (contesto-get-content context) 3))))
            (unless (and (<= +segment-header-bytes+ outcome-offset
                             (+ outcome-offset +get-proof-bytes+) valid-bytes)
                         (or (<= (+ outcome-offset +get-proof-bytes+) offset)
                             (<= (+ offset size) outcome-offset)))
              (guasto-get context :get-outcome-location))))
        (when outcome-offset (error 'invalid-argument :reason :get-unexpected-outcome)))
    prepared))

;;; REQ: REQ-FOR-004 REQ-AFF-002
(declaim (ftype (function (contesto-get segmento-get u32) null) leggi-prova-get))
(defun leggi-prova-get (context segment offset)
  "Pre: I/O pool, proof within the committed prefix, capability for the same segment as PUT.
Post: private proof, CRC/type/CSN verified before querying the cache.
IO-FAULT/CORRUPTION-DETECTED propagate as source faults; TXID will be compared with PUT."
  (let ((proof (contesto-get-proof context)) (content (contesto-get-content context)))
    (unless (= (leggi-esatto (segmento-get-file segment) proof 0 +get-proof-bytes+ offset)
               +get-proof-bytes+)
      (guasto-get context :get-outcome-read))
    (multiple-value-bind (next kind flags ks ke vs ve)
        (verifica-cornice proof 0 +get-proof-bytes+ :version (segmento-get-version segment))
      (unless (and (= next +get-proof-bytes+) (= kind +outcome+) (zerop flags)
                   (= ks ke vs +header-bytes+) (= ve +get-proof-bytes+)
                   (= (leggi-u32 proof +header-bytes+) (ldb (byte 32 0) (aref content 0)))
                   (= (leggi-u32 proof (+ +header-bytes+ 4)) (ldb (byte 32 32) (aref content 0))))
        (error 'corruption-detected :reason :get-outcome-mismatch :offset offset))))
  nil)

;;; REQ: REQ-CCH-002 REQ-FOR-004 REQ-AFF-002
(declaim (ftype (function (contesto-get segmento-get u8 boolean) null) leggi-put-get))
(defun leggi-put-get (context segment flags prepared)
  "Pre: I/O pool, target/buffer/proof ready, committed data protected by EBR.
Post: PUT read exactly and VERIFIED after CRC/key/flags/CSN or TXID+proof.
Propagates every source fault; no partial or unverified bytes may be delivered."
  (let* ((content (contesto-get-content context)) (bytes (contesto-get-bytes context))
         (size (ldb (byte 32 0) (aref content 3))))
    (unless (= (leggi-esatto (segmento-get-file segment) bytes 0 size
                            (ldb (byte 32 0) (aref content 1))) size)
      (guasto-get context :get-record-read))
    (multiple-value-bind (start end)
        (verifica-put-parole bytes 0 size (contesto-get-key context)
                             (ldb (byte 32 32) (aref content 0)) (ldb (byte 32 0) (aref content 0))
                             flags :version (segmento-get-version segment)
                             :proof-buffer (if prepared (contesto-get-proof context) nil)
                             :proof-start 0 :proof-end (if prepared +get-proof-bytes+ 0))
      (marca-valore-get context start end)))
  nil)

;;; REQ: REQ-CCH-001 REQ-CCH-004 REQ-FOR-004 REQ-OBS-002
(declaim (ftype (function (contesto-get segmento-get u8 boolean)
                         (values (member :inserted :present :busy :unavailable :bypassed :not-attempted)
                                 boolean boolean &optional)) inserisci-cache-get))
(defun inserisci-cache-get (context segment flags prepared)
  "Pre: verified PUT in the private buffer; same authoritative proof for prepared records.
Post: opportunistic insertion, enum and eviction/scan metrics; contention does not wait.
The cache verifier rechecks input; its conditions propagate to the task boundary."
  (let ((cache (vista-get-serie-cache (segmento-get-owner segment)))
        (content (contesto-get-content context)))
    (unless cache (return-from inserisci-cache-get (values :not-attempted nil nil)))
    (multiple-value-bind (status evicted scan)
        (inserisci-record-cache
         cache (segmento-get-high segment) (segmento-get-low segment)
         (ldb (byte 32 0) (aref content 1)) (ldb (byte 32 0) (aref content 3))
         (contesto-get-key context) (ldb (byte 32 32) (aref content 0))
         (ldb (byte 32 0) (aref content 0)) flags (contesto-get-bytes context) 0
         :version (segmento-get-version segment)
         :proof-buffer (if prepared (contesto-get-proof context) nil)
         :proof-start 0 :proof-end (if prepared +get-proof-bytes+ 0))
      (case status
        ((:inserted :present :busy :unavailable :bypassed) (values status evicted scan))
        (otherwise (guasto-get context :get-cache-insertion))))))

;;; REQ: REQ-CON-004 REQ-CCH-002 REQ-CCH-004 REQ-FOR-004 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get segmento-get u32 u8 &key (:outcome-offset (or null u32)))
                         (values (member :cache :segment :buffer-required)
                                 (member :hit :miss :verify-failed :disabled :not-attempted)
                                 (member :inserted :present :busy :unavailable :bypassed :not-attempted)
                                 boolean boolean &optional)) leggi-record-get))
(defun leggi-record-get (context segment valid-bytes flags &key outcome-offset)
  "Pre: CANDIDATE after new AVVIA-GET in the I/O pool; resolver rerun under the new epoch.
Post: VERIFIED from cache/segment; five values: source, cache, insertion, eviction, scan.
BUFFER-REQUIRED performs no I/O and leaves CANDIDATE. Prepared reads OUTCOME from the same FD before
the cache. Errors/nonlocal exits release EBR; every outcome requires completion or abandonment."
  (esigi-stato-get context :candidate)
  (let ((completed nil))
    (unwind-protect
         (progn
           (verifica-target-get context segment valid-bytes flags)
           (when (> (aref (contesto-get-content context) 3) (length (contesto-get-bytes context)))
             (setf completed t)
             (return-from leggi-record-get (values :buffer-required :not-attempted :not-attempted nil nil)))
           (let ((prepared (verifica-prova-target-get context valid-bytes flags outcome-offset)))
             (setf (contesto-get-state context) :loading)
             (when prepared (leggi-prova-get context segment outcome-offset))
             (multiple-value-bind (status start end) (verifica-cache-get context segment flags prepared)
               (case status
                 (:hit
                  (marca-valore-get context start end)
                  (setf completed t)
                  (values :cache status :not-attempted nil nil))
                 ((:miss :verify-failed :disabled)
                  (leggi-put-get context segment flags prepared)
                  (multiple-value-bind (inserted evicted scan) (inserisci-cache-get context segment flags prepared)
                    (setf completed t)
                    (values :segment status inserted evicted scan)))
                 (otherwise (guasto-get context :get-cache-result))))))
      (unless completed (abbandona-get context)))))
