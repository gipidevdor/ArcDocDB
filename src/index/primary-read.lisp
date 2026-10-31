;;; OWNER: worker con contesto esclusivo; il writer possiede root e frammenti.
;;; SHARED: solo load e barriere sul successo; controllo finale anche sul miss.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-003 REQ-CON-004 REQ-AFF-008
(declaim (inline esigi-contesto-libero))
(declaim (ftype (function (contesto-indice) null) esigi-contesto-libero))
(defun esigi-contesto-libero (context)
  "Pre: owning worker/controller. Post: free context, no modification.
Reentry rejected before touching scratch; does not synchronize two workers violating ownership."
  (when (contesto-indice-busy context) (error 'invalid-argument :reason :primary-context-busy))
  nil)

;;; REQ: REQ-IDX-007 REQ-AFF-004
(declaim (inline root-confermata-p))
(declaim (ftype (function (indice-primario root-indice) boolean) root-confermata-p))
(defun root-confermata-p (index original)
  "Pre: provisional hit or miss result. Post: same identity/generation after reads.
Does not make the location an EBR pin or verify the commit horizon or a snapshot."
  (sb-thread:barrier (:read))
  (let ((current (acquisisci-root index)))
    (and (eq original current) (= (root-indice-generation original) (root-indice-generation current)))))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-007 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (indice-primario octets integer integer u32 u32 contesto-indice contenuto-slot)
                         (member :live :absent :retry-limit)) leggi-indice-primario))
(defun leggi-indice-primario (index key start end high low context destination)
  "Pre: trusted key/digest consistent for the Serie, distinct private context and DESTINATION.
Post: LIVE copies payload after root confirmation; ABSENT/RETRY-LIMIT leave DESTINATION untouched.
Eight credits for slot samples/root-change restarts, no lock, waiting, or internal fallback.
Final confirmation at zero credit: if it fails, ends without restart or output copy.
Errors/nonlocal exits invalidate the result; EBR, MVCC, and forwarding to the writer belong to the caller."
  (esigi-indice-sano index)
  (esigi-chiave key start end)
  (when (eq destination (contesto-indice-words context))
    (error 'invalid-argument :reason :primary-output-alias))
  (esigi-contesto-libero context)
  (unwind-protect
       (progn
         (setf (contesto-indice-busy context) t (contesto-indice-remaining context) +lookup-budget+)
         (dotimes (attempt +lookup-budget+)
           (when (zerop (contesto-indice-remaining context)) (return))
           (let* ((root (acquisisci-root index))
                  (fragment (aref (root-indice-directory root) (prefix-hash high (root-indice-depth root)))))
             (esigi-frammento-sano index fragment)
             (let ((result (sonda-reader fragment key start end low context)))
               (esigi-frammento-sano index fragment)
               (when (= result -3) (return))
               (when (>= result -1)
                 (if (root-confermata-p index root)
                     (progn
                       (when (>= result 0) (copia-contenuto (contesto-indice-words context) destination))
                       (esigi-frammento-sano index fragment)
                       (return-from leggi-indice-primario (if (>= result 0) :live :absent)))
                     (when (plusp (contesto-indice-remaining context))
                       (decf (contesto-indice-remaining context))))))))
         (esigi-indice-sano index)
         :retry-limit)
    (setf (contesto-indice-busy context) nil)))
