;;;; Exact group dependencies, whole copied responses, bounded credit and strong completion.
(in-package #:arcdocdb.local.server.tests)

(defun grouped-read-pending (keys &optional (limit 65536) backend)
  (let ((connection (l::make-local-connection :limit limit :read-groups t :state :pending :deadline 100 :io-backend backend)))
    (setf (l::local-connection-pending connection) (read-envelope connection keys)) connection))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-WAL-002 REQ-AFF-004
(deftest test-REQ-IPC-002-unnegotiated-group-drains-before-expiry-check
  (with-engine (engine root :create t)
    (let ((a (group-pending 1 1)) (read (grouped-read-pending (vector (bytes 2))))
          (b (group-pending 3 1 (bytes 3))) (samples 0))
      (setf (l::local-connection-read-groups read) nil (l::local-connection-deadline read) 5)
      ;; The first post-gate sample expires the read. Rejection must still drain
      ;; the preceding write before sampling, preserving the existing barrier.
      (with-disjoint-flush-count (flushes)
        (conditional-turn engine (vector a read b) :clock (lambda () (if (<= (incf samples) 3) 0 5)))
        (is (= 2 flushes)))
      (is (= 1 (group-response a 1))) (is (= 2 (group-response b 1)))
      (is (eq :closed (l::local-connection-state read))) (explicit-cleared read))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-IDX-013 REQ-CCH-002 REQ-WAL-002
(deftest test-REQ-IPC-002-disjoint-read-group-copies-one-view-v1-v2-all-profiles
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged))
    (arcdocdb.engine.tests::with-root (root)
      (let ((engine (read-test-open root t version mode :cache 1048576)))
        (unwind-protect
             (progn
               (e:scrivi-documento engine (bytes 2) (bytes #x18 42))
               (let* ((a (group-pending 1 1 (bytes 1 0)))
                      (read (grouped-read-pending (vector (bytes 2) (bytes 9) (bytes 2) (bytes 1))))
                      (b (group-pending 3 1 (bytes 2) (bytes #xf6))))
                 (with-disjoint-flush-count (flushes)
                   (conditional-turn engine (vector a read b)) (is (= 1 flushes)))
                 (is (= 2 (group-response a 1))) (is (= 3 (group-response b 1)))
                 (is (equalp (vector (bytes #x18 42) nil (bytes #x18 42) nil)
                             (read-result read (l::local-connection-size read) 4)))
                 (explicit-cleared read) (arcdocdb.engine.tests::check-frontier engine 3)))
          (e:chiudi-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-WAL-006
(deftest test-REQ-IPC-002-read-group-any-member-any-queued-key-is-barrier
  (dolist (kind '(:put :delete :condition :conflict))
    (dotimes (position 8)
      (with-engine (engine root :create t)
        (e:scrivi-documento engine (bytes 1) (bytes #xf6))
        (let* ((a (group-pending 1 1 (bytes 3)))
               (dependent (case kind (:put (group-pending 2 1)) (:delete (group-pending 2 3))
                                (otherwise (conditional-pending (bytes 1) (if (eq kind :conflict) 0 1)))))
               (keys (make-array 8 :initial-element (bytes 9)))
               (b (group-pending 4 1 (bytes 4))))
          (setf (svref keys position) (bytes 1))
          (let ((read (grouped-read-pending keys)))
            (with-disjoint-flush-count (flushes)
              (conditional-turn engine (vector a dependent read b)) (is (= 2 flushes)))
            (let ((result (read-result read (l::local-connection-size read) 8)))
              (dotimes (i 8)
                (is (equalp (svref result i)
                            (when (= i position) (case kind (:delete nil) (:put (bytes 0)) (otherwise (bytes #xf6))))))))))))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-WAL-002
(deftest test-REQ-IPC-002-read-group-credit-validation-and-negotiation-barriers
  (dolist (gate '(:credit :unnegotiated :malformed :late-invalid))
    (with-engine (engine root :create t)
      (let* ((a (group-pending 1 1))
             (read (grouped-read-pending (vector (bytes 2) (bytes 3)) (if (eq gate :credit) 65535 65536)))
             (b (group-pending 3 1 (bytes 4))))
        (case gate
          (:unnegotiated (setf (l::local-connection-read-groups read) nil))
          (:malformed (let ((env (l::local-connection-pending read)))
                        (setf (aref (l::local-connection-input read) (l:envelope-payload-start env)) #xf6)))
          (:late-invalid (let* ((input (l::local-connection-input read))
                               (frame (arcdocdb.local.wire.tests::read-request (bytes 2) (bytes))))
                           (replace input frame)
                           (setf (l::local-connection-pending read) (l:decode-local-envelope input 4 (length frame))))))
        (with-disjoint-flush-count (flushes)
          (conditional-turn engine (vector a read b)) (is (= 2 flushes)))
        (is (= 1 (group-response a 1))) (is (= 2 (group-response b 1)))
        (let ((env (l:decode-local-envelope (l::local-connection-output read) 4 (l::local-connection-size read))))
          (is (= (case gate (:credit 0) (:unnegotiated 4) (otherwise 1)) (l:envelope-code env))))
        (explicit-cleared read)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-WAL-002 REQ-IDX-001
(deftest test-REQ-IPC-002-disjoint-read-group-overflow-is-whole-rejection
  (with-engine (engine root :create t)
    (e:scrivi-documento engine (bytes 2) (arcdocdb.local.wire.tests::get-document 40000))
    (let ((a (group-pending 1 1)) (read (grouped-read-pending (vector (bytes 2) (bytes 2))))
          (b (group-pending 3 1 (bytes 3))))
      (with-disjoint-flush-count (flushes)
        (conditional-turn engine (vector a read b)) (is (= 1 flushes)))
      (is (= 2 (group-response a 1))) (is (= 3 (group-response b 1)))
      (signals l:request-rejected (read-result read (l::local-connection-size read) 2))
      (is (eq :ready (e:stato-motore engine))) (explicit-cleared read))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004 REQ-WAL-002
(deftest test-REQ-IPC-002-disjoint-read-group-fresh-deadlines-and-single-decode
  (dolist (phase '(:none :decode :first :last))
    (let ((now 0) (decodes 0) (gets 0) (decode (symbol-function 'l::decode-local-read-group))
          (get (symbol-function 'e:leggi-documento)))
      (with-engine (engine root :create t)
        (let ((a (group-pending 1 1)) (read (grouped-read-pending (vector (bytes 2) (bytes 9))))
              (b (group-pending 3 1 (bytes 3))))
          (setf (l::local-connection-deadline read) 5)
          (unwind-protect
               (progn
                 (setf (symbol-function 'l::decode-local-read-group)
                       (lambda (&rest args) (incf decodes)
                         (multiple-value-prog1 (apply decode args) (when (eq phase :decode) (setf now 5))))
                       (symbol-function 'e:leggi-documento)
                       (lambda (&rest args) (incf gets)
                         (multiple-value-prog1 (apply get args)
                           (when (or (eq phase :first) (and (eq phase :last) (= gets 2))) (setf now 5)))))
                 (with-disjoint-flush-count (flushes)
                   (conditional-turn engine (vector a read b) :clock (lambda () now)) (is (= 1 flushes)))
                 (is (= 1 decodes)) (is (= (case phase (:decode 0) (:first 1) (otherwise 2)) gets))
                 (is (eq (if (eq phase :none) :response :closed) (l::local-connection-state read)))
                 (explicit-cleared read))
            (setf (symbol-function 'l::decode-local-read-group) decode (symbol-function 'e:leggi-documento) get)))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-REC-001 REQ-IDX-001
(deftest test-REQ-IPC-002-disjoint-read-group-copy-survives-rotation-and-capacity-fallback
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (e:apri-motore root (id 73) (id 41) :create t :clock (lambda () 10) :max-records 1)))
      (unwind-protect
           (progn
             (e:scrivi-documento engine (bytes 2) (bytes #x18 42))
             (let ((a (group-pending 1 1)) (read (grouped-read-pending (vector (bytes 2) (bytes 9))))
                   (b (group-pending 3 1 (bytes 2) (bytes #xf6))))
               (conditional-turn engine (vector a read b))
               (is (= 2 (group-response a 1))) (is (= 3 (group-response b 1)))
               (is (equalp (vector (bytes #x18 42) nil) (read-result read (l::local-connection-size read) 2)))
               (explicit-cleared read)))
        (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004 REQ-REC-001
(deftest test-REQ-IPC-002-disjoint-read-group-no-send-before-strong-or-after-failed-turn
  (dolist (exit '(:success :error :throw))
    (let ((armed nil) (read nil) (observed nil) (sends 0))
      (with-engine (engine root :create t :observer
                    (lambda (handle phase) (declare (ignore handle))
                      (when (and armed (eq phase :after-flush))
                        (is (eq :response (l::local-connection-state read))) (is (zerop sends))
                        (explicit-cleared read) (setf observed t)
                        (case exit (:error (error 'arcdocdb.conditions:io-fault :reason :grouped-read-flush :operation :test))
                                   (:throw (throw 'grouped-read-stop :stopped)))) nil))
        (setf read (grouped-read-pending (vector (bytes 2) (bytes 9)) 65536
                     (l::make-native-backend :send (lambda (fd buffer start count) (declare (ignore fd buffer start))
                                                    (incf sends) (values count 0)))))
        (let ((queue (l::make-local-write-queue)))
          (setf armed t)
          (let ((result (catch 'grouped-read-stop
                          (handler-case
                              (progn (l::dispatch-local-ready engine (vector (group-pending 1 1) read (group-pending 3 1 (bytes 3)))
                                                               (lambda () 10) queue) :ok)
                            (arcdocdb.conditions:io-fault () :fault)))))
            (is (eq result (case exit (:success :ok) (:error :fault) (otherwise :stopped)))))
          (is observed) (is (zerop sends)) (conditional-queue-cleared queue))))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-disjoint-read-group-all-eight-queued-keys-and-state-gates
  (with-engine (engine root :create t)
    (let ((queue (l::make-local-write-queue)) (keys (make-array 8 :initial-element (bytes 99))))
      (dotimes (i 8)
        (l::dispatch-local-pending engine (group-pending (1+ i) 1 (bytes i)) queue (lambda () 10)))
      (unwind-protect
           (dotimes (i 8)
             (setf (svref keys 7) (bytes i))
             (let* ((read (grouped-read-pending keys)) (work (l::local-connection-group-workspace read)))
               (multiple-value-bind (status count)
                   (l::decode-local-read-group (l::local-connection-input read) (l::local-connection-pending read) work)
                 (is (zerop status)) (is (= 8 count))
                 (is (not (l::independent-local-read-group-p engine read queue status count)))
                 (setf (svref (l::local-group-workspace-operations work) 7) (bytes i 0))
                 (is (l::independent-local-read-group-p engine read queue status count))
                 (is (not (l::independent-local-read-group-p engine read queue 1 count)))
                 (is (not (l::independent-local-read-group-p engine read queue 0 0)))
                 (setf (e::motore-state engine) :faulted)
                 (unwind-protect (is (not (l::independent-local-read-group-p engine read queue status count)))
                   (setf (e::motore-state engine) :ready)))
               (l::clear-local-group-workspace work)))
        (l::clear-local-write-queue queue)))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-CCH-002 REQ-WAL-002
(deftest test-REQ-IPC-002-disjoint-read-group-mixed-conditions-and-cache-fallback
  (dolist (damaged '(nil t))
    (arcdocdb.engine.tests::with-root (root)
      (let ((engine (read-test-open root t 2 :paged :cache 1048576)))
        (unwind-protect
             (progn
               (e:scrivi-documento engine (bytes 9) (bytes #xf6))
               (e:leggi-documento engine (bytes 9) (bytes 0))
               (when damaged (arcdocdb.engine.tests::cache-bit-flip engine))
               (let ((a (conditional-pending (bytes 1) 0)) (conflict (conditional-pending (bytes 2) 99))
                     (read (grouped-read-pending (vector (bytes 9) (bytes 9)))) (b (group-pending 3 1 (bytes 3))))
                 (with-disjoint-flush-count (flushes)
                   (conditional-turn engine (vector a conflict read b)) (is (= 1 flushes)))
                 (is (equal '(:applied 2) (multiple-value-list (conditional-response a))))
                 (is (equal '(:conflict 0) (multiple-value-list (conditional-response conflict))))
                 (is (= 3 (group-response b 1)))
                 (is (equalp (vector (bytes #xf6) (bytes #xf6)) (read-result read (l::local-connection-size read) 2)))
                 (is (= (if damaged 1 0) (getf (e:statistiche-cache-motore engine) :verify-failed)))
                 (explicit-cleared read)))
          (e:chiudi-motore engine))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-WAL-002 REQ-AFF-004
(deftest test-REQ-IPC-002-disjoint-read-group-limit-one-and-expired-writer
  (dolist (variant '(:limit :expired :read-expired))
    (with-engine (engine root :create t)
      (let ((a (group-pending 1 1)) (read (grouped-read-pending (vector (bytes 2))))
            (b (group-pending 3 1 (bytes 3))))
        (case variant
          (:expired (setf (l::local-connection-deadline a) 10))
          (:read-expired (setf (l::local-connection-deadline read) 10)))
        (with-disjoint-flush-count (flushes)
          (conditional-turn engine (vector a read b) :limit (if (eq variant :limit) 1 8))
          (is (= (if (eq variant :limit) 2 1) flushes)))
        (is (= (if (eq variant :expired) 1 2) (group-response b 1)))
        (if (eq variant :read-expired)
            (is (eq :closed (l::local-connection-state read)))
            (is (equalp #(nil) (read-result read (l::local-connection-size read) 1))))
        (explicit-cleared read)))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-AFF-004 REQ-REC-001 REQ-WAL-006
(deftest test-REQ-IPC-002-disjoint-read-group-read-fault-before-any-write-admission
  (arcdocdb.engine.tests::with-root (root)
    (let* ((armed nil) (cause (make-condition 'arcdocdb.conditions:io-fault :reason :group-read-fi :operation :test))
           (engine (e:apri-motore root (id 73) (id 41) :create t :clock (lambda () (if armed (error cause) 10)))))
      (unwind-protect
           (let ((a (group-pending 1 1)) (read (grouped-read-pending (vector (bytes 2) (bytes 9))))
                 (queue (l::make-local-write-queue)))
             (e:scrivi-documento engine (bytes 2) (bytes #xf6))
             (setf armed t)
             (handler-case (progn (l::dispatch-local-ready engine (vector a read) (lambda () 10) queue)
                                  (error "Missing grouped read fault"))
               (arcdocdb.conditions:io-fault (seen) (is (eq cause seen))))
             (is (eq :faulted (e:stato-motore engine)))
             (is (eq :pending (l::local-connection-state a))) (is (eq :pending (l::local-connection-state read)))
             (explicit-cleared read) (conditional-queue-cleared queue))
        (e:chiudi-motore engine)))
    (let ((engine (engine root)))
      (unwind-protect
           (progn (arcdocdb.engine.tests::check-frontier engine 1)
                  (is (eq :absent (e:leggi-documento engine (bytes 1) (bytes 0)))))
        (e:chiudi-motore engine)))))
