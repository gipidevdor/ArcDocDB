;;;; Canonical GET/cache/primary integration and client ownership at the real serial boundary.
(in-package #:arcdocdb.local.server.tests)
(defun read-test-open (root create version mode &key (cache 0) (records 64) (segments 16) (file-bytes 2097152))
  (let ((engine (e:apri-motore root (arcdocdb.engine.tests::archive-id) (arcdocdb.engine.tests::series-id)
                  :create create :version version :clock (lambda () 10) :record-cache-budget cache
                  :max-file-bytes file-bytes :max-record-bytes (min 65536 (- file-bytes 128))
                  :max-records records :max-segments segments :index-capacity 32 :key-arena-bytes 4096
                  :index-policy (if (eq mode :legacy) :legacy (e:crea-politica-indice-automatico :budget 8388608 :frames 1)))))
    (arcdocdb.engine.tests::rotation-force-paged engine mode) engine))
(defun read-connection (&optional (limit 65536))
  (l::make-local-connection :limit limit :read-groups t :state :pending :deadline 100))
(defun read-envelope (connection keys &optional (id 1))
  (let* ((buffer (l::local-connection-input connection)) (end (l::encode-local-read-group buffer id keys (length keys) 65536)))
    (l:decode-local-envelope buffer 4 end)))
(defun read-result (connection end count)
  (let ((buffer (l::local-connection-output connection)))
    (is (= (- end 4) (l:read-frame-length buffer 0 end)))
    (l::decode-local-read-group-response buffer (l:decode-local-envelope buffer 4 end)
      (l::local-connection-space connection) (make-array 8 :element-type '(unsigned-byte 64)) count)))
(defun read-dispatch (engine connection keys)
  (let ((env (read-envelope connection keys)))
    (read-result connection (l::local-dispatch engine connection env) (length keys))))
(defun read-status (engine connection keys)
  (let ((end (l::local-dispatch engine connection (read-envelope connection keys))))
    (l:envelope-code (l:decode-local-envelope (l::local-connection-output connection) 4 end))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-CCH-002 REQ-AFF-008
(deftest test-REQ-IDX-001-read-group-canonical-order-duplicates-absence-v1-v2-all-modes
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (arcdocdb.engine.tests::with-root (root)
        (let ((engine (read-test-open root t version mode)))
          (unwind-protect
               (let* ((connection (read-connection)) (flushes 0) (original (symbol-function 'arcdocdb.io:durable-flush))
                      (keys (vector (bytes 1) (bytes 9) (bytes 2) (bytes 1))))
                 (is (= 1 (e:scrivi-documento engine (bytes 1) (bytes #xf6))))
                 (is (= 2 (e:scrivi-documento engine (bytes 2) (bytes #x18 42))))
                 (let ((before (multiple-value-list (e:frontiere-motore engine))))
                   (unwind-protect
                        (progn
                          (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (file) (incf flushes) (funcall original file)))
                          (let ((result (read-dispatch engine connection keys)))
                            (is (equalp result (vector (bytes #xf6) nil (bytes #x18 42) (bytes #xf6))))
                            (is (not (eq (svref result 0) (svref result 3)))))
                          (is (zerop flushes)) (is (equal before (multiple-value-list (e:frontiere-motore engine)))))
                     (setf (symbol-function 'arcdocdb.io:durable-flush) original))) (explicit-cleared connection))
            (e:chiudi-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-IDX-001
(deftest test-REQ-IPC-002-read-group-aggregate-exact-limit-refusal-keeps-engine-ready
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (read-test-open root t 2 :resident)) (connection (read-connection 4096)))
      (unwind-protect
           (progn
             (dolist (size '(4085 4086))
               (e:scrivi-documento engine (bytes 1) (arcdocdb.local.wire.tests::get-document size))
               (if (= size 4085)
                   (let ((env (read-envelope connection (vector (bytes 1)))))
                     (is (= 4100 (l::local-dispatch engine connection env)))
                     (is (= size (length (svref (read-result connection 4100 1) 0)))))
                   (progn (is (= 5 (read-status engine connection (vector (bytes 1)))))
                          (is (eq :ready (e:stato-motore engine))))))
             (dotimes (i 8) (e:scrivi-documento engine (bytes i) (arcdocdb.local.wire.tests::get-document (if (= i 7) 550 500))))
             (let ((keys (map 'simple-vector #'bytes #(0 1 2 3 4 5 6 7))))
               (is (= 8 (length (read-dispatch engine connection keys))))
               (e:scrivi-documento engine (bytes 7) (arcdocdb.local.wire.tests::get-document 551))
               (is (= 5 (read-status engine connection keys))) (is (eq :ready (e:stato-motore engine)))
               (is (equalp #(nil) (read-dispatch engine connection (vector (bytes 99))))))
             (explicit-cleared connection))
        (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-read-group-refusal-before-get-and-unavailable
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (read-test-open root t 2 :resident)) (connection (read-connection))
          (original (symbol-function 'e:leggi-documento)) (gets 0))
      (unwind-protect
           (progn
             (setf (symbol-function 'e:leggi-documento) (lambda (&rest args) (incf gets) (apply original args)))
             (setf (l::local-connection-read-groups connection) nil)
             (is (= 4 (read-status engine connection (vector (bytes 1)))))
             (setf (l::local-connection-read-groups connection) t)
             (let* ((bad (arcdocdb.local.wire.tests::read-request (bytes 1) (bytes)))
                    (buffer (l::local-connection-input connection)))
               (replace buffer bad)
               (let ((end (l::local-dispatch engine connection (l:decode-local-envelope buffer 4 (length bad)))))
                 (is (= 1 (l:envelope-code (l:decode-local-envelope (l::local-connection-output connection) 4 end))))))
             (is (zerop gets)) (explicit-cleared connection)
             (e:chiudi-motore engine)
             (is (= 3 (read-status engine connection (vector (bytes 1))))) (is (zerop gets)))
        (setf (symbol-function 'e:leggi-documento) original) (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-IDX-001
(deftest test-REQ-IDX-001-read-group-write-barriers-and-independent-write-limit
  (with-engine (engine root :create t)
    (let* ((first (group-pending 1 1 (bytes 1) (bytes #x18 42)))
           (group (l::make-local-connection :limit 65536 :read-groups t :group-limit 1 :state :pending :deadline 100))
           (last (read-connection)))
      (setf (l::local-connection-pending group) (read-envelope group (vector (bytes 1) (bytes 9) (bytes 1)))
            (l::local-connection-pending last) (read-envelope last (vector (bytes 1))))
      (l::dispatch-local-ready engine (vector first group (group-pending 1 3 (bytes 1)) last)
                              (lambda () 10) (l::make-local-write-queue :limit 1))
      (is (= 1 (group-response first 1)))
      (is (equalp (read-result group (l::local-connection-size group) 3) (vector (bytes #x18 42) nil (bytes #x18 42))))
      (is (equalp #(nil) (read-result last (l::local-connection-size last) 1)))
      (is (equal '(0 2 0 2) (multiple-value-list (e:frontiere-motore engine)))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-read-group-every-deadline-boundary-and-cleanup
  (with-engine (engine root :create t)
    (e:scrivi-documento engine (bytes 1) (bytes 0))
    (loop for cut from 1 to 5 do
      (let* ((connection (read-connection)) (env (read-envelope connection (vector (bytes 1) (bytes 1)))) (calls 0))
        (setf (l::local-connection-deadline connection) 5)
        (signals l:protocol-error (l::local-dispatch engine connection env (lambda () (if (= cut (incf calls)) 5 0))))
        (is (= cut calls)) (explicit-cleared connection)
        (is (equal '(0 1 0 1) (multiple-value-list (e:frontiere-motore engine)))))))
  (dolist (opcode '(2 5))
    (let ((now 0))
      (with-engine (engine root :create t :observer
                           (lambda (handle phase) (declare (ignore handle)) (when (eq phase :after-flush) (setf now 10)) nil))
        (let ((first (group-pending 1 1)) (connection (if (= opcode 2) (group-pending 1 2) (read-connection))))
          (when (= opcode 5) (setf (l::local-connection-pending connection) (read-envelope connection (vector (bytes 1)))))
          (setf now 0 (l::local-connection-deadline connection) 5)
          (l::dispatch-local-ready engine (vector first connection) (lambda () now) (l::make-local-write-queue))
          (is (eq :closed (l::local-connection-state connection))) (is (= 1 (group-response first 1))))))))

;;; REQ: REQ-IPC-002 REQ-CCH-004 REQ-IDX-001 REQ-AFF-004
(deftest test-REQ-CCH-004-read-group-cache-fallback-and-middle-fault-no-partial-result
  (arcdocdb.engine.tests::with-root (root)
    (let ((engine (read-test-open root t 2 :resident :cache 1048576)) (connection (read-connection))
          (keys (vector (bytes 1) (bytes 2))) (expected (vector (bytes 0) (bytes #xf6))))
      (unwind-protect
           (progn
             (dotimes (i 2) (e:scrivi-documento engine (svref keys i) (svref expected i)))
             (is (equalp expected (read-dispatch engine connection keys)))
             (arcdocdb.engine.tests::cache-bit-flip engine)
             (is (equalp expected (read-dispatch engine connection keys)))
             (is (= 1 (getf (e:statistiche-cache-motore engine) :verify-failed)))
             (let ((original (symbol-function 'e:leggi-documento)) (calls 0) (seen nil)
                   (cause (make-condition 'arcdocdb.conditions:io-fault :operation :test :reason :middle-read)))
               (unwind-protect
                    (progn (setf (symbol-function 'e:leggi-documento)
                                 (lambda (&rest args) (when (= 2 (incf calls)) (error cause)) (apply original args)))
                      (handler-case (read-dispatch engine connection keys)
                        (arcdocdb.conditions:io-fault (observed) (is (eq cause observed)) (setf seen t)))
                      (is seen) (explicit-cleared connection)) (setf (symbol-function 'e:leggi-documento) original))))
        (e:chiudi-motore engine)))))

;;; REQ: REQ-IPC-002 REQ-CMP-001 REQ-STO-003 REQ-REC-001
(deftest test-REQ-CMP-001-read-groups-after-rotation-compaction-and-reopen-v1-v2
  (dolist (version '(1 2))
    (dolist (mode '(:resident :paged))
      (arcdocdb.engine.tests::with-root (root)
        (let ((expected (make-array 8)) (keys (map 'simple-vector #'bytes #(0 1 2 3 4 5 6 7))))
          (let ((engine (read-test-open root t version mode :records 16 :segments 4 :file-bytes 8192)))
            (unwind-protect
                 (let ((connection (read-connection)))
                   (dotimes (round 12)
                     (dotimes (i 8) (setf (svref expected i) (arcdocdb.local.wire.tests::uint (+ (* round 8) i)))
                       (e:scrivi-documento engine (svref keys i) (svref expected i)))
                     (is (equalp expected (read-dispatch engine connection keys))))
                   (is (plusp (getf (e:statistiche-compattazione-motore engine) :compactions))))
              (e:chiudi-motore engine)))
          (let ((engine (read-test-open root nil version mode :records 16 :segments 4 :file-bytes 8192)))
            (unwind-protect (is (equalp expected (read-dispatch engine (read-connection) keys))) (e:chiudi-motore engine))))))))

(defun scripted-read-client (reply &rest options) (apply #'scripted-group-client reply :read-groups t options))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-AFF-008
(deftest test-REQ-IPC-002-read-client-fragments-complete-private-results-and-prefix
  (multiple-value-bind (client stats)
      (scripted-read-client (client-group-reply (bytes #x83 #x82 #xf5 #x41 #xf6 #x82 #xf4 #xf6 #x82 #xf5 #x42 #x18 42))
                            :fragment 1 :short-io t)
    (unwind-protect
         (let ((result (l:client-get-group client (vector (bytes 1) (bytes 2) (bytes 3) :unselected) :count 3)))
           (fill (l::local-client-input client) 0)
           (is (equalp result (vector (bytes #xf6) nil (bytes #x18 42))))
           (is (eq :ready (l::local-client-state client))) (is (= 2 (l::local-client-next-id client)))
           (is (every #'zerop (l::local-client-read-spans client)))
           (multiple-value-bind (sent polls) (funcall stats) (is (plusp sent)) (is (plusp polls))))
      (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-LIM-003
(deftest test-REQ-IPC-002-read-client-errors-and-deadlines-never-expose-vector
  (dolist (reply (list (bytes 0 0) (client-group-reply (bytes #x81 #x82 #xf5 #x41 #xff))
                      (client-group-reply (bytes #x81 #x82 #xf4 #xf6) 0 2)))
    (let ((client (scripted-read-client reply)) (result :not-delivered))
      (unwind-protect
           (progn (signals l:protocol-error (setf result (l:client-get-group client (vector (bytes 1)))))
                  (is (eq :not-delivered result)) (is (eq :closed (l::local-client-state client)))
                  (is (every #'zerop (l::local-client-read-spans client)))) (l:close-local client))))
  (dolist (expire '(t :decode))
    (let ((client (scripted-read-client (client-group-reply (bytes #x81 #x82 #xf4 #xf6)) :expire expire)))
      (unwind-protect (progn (signals l:protocol-error (l:client-get-group client (vector (bytes 1))))
                            (is (eq :closed (l::local-client-state client)))) (l:close-local client)))))

;;; REQ: REQ-IPC-002 REQ-AFF-008 REQ-LIM-003
(deftest test-REQ-IPC-002-read-client-rejections-preflight-owner-and-id-boundary
  (loop for status from 1 to 5 do
    (let ((client (scripted-read-client (client-group-reply (bytes #xf6) status))))
      (unwind-protect (progn (signals l:request-rejected (l:client-get-group client (vector (bytes 1))))
                            (is (eq :ready (l::local-client-state client)))) (l:close-local client))))
  (multiple-value-bind (client stats) (scripted-read-client (bytes))
    (unwind-protect
         (progn
           (dolist (keys (list #() #(1) (vector (bytes)) (make-array 9 :initial-element (bytes 1))
                              (vector (l::local-client-output client))))
             (signals arcdocdb.conditions:invalid-argument (l:client-get-group client keys)))
           (is (zerop (funcall stats))) (is (= 1 (l::local-client-next-id client)))
           (let ((seen nil))
             (sb-thread:join-thread (sb-thread:make-thread
               (lambda () (handler-case (l:client-get-group client (vector (bytes 1)))
                            (arcdocdb.conditions:invalid-argument () (setf seen t)))))) (is seen))
           (setf (l::local-client-next-id client) 18446744073709551616)
           (signals arcdocdb.conditions:resource-exhausted (l:client-get-group client (vector (bytes 1))))
           (is (zerop (funcall stats)))) (l:close-local client)))
  (let ((client (l::make-local-client :state :ready :write-groups t)))
    (signals arcdocdb.conditions:unsupported-format (l:client-get-group client (vector (bytes 1))))))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(deftest test-REQ-AFF-004-read-client-nonlocal-exit-closes-with-original-control
  (let ((client (scripted-read-client (bytes) :throw-tag 'read-exit)))
    (unwind-protect (progn (is (eq :transferred (catch 'read-exit (l:client-get-group client (vector (bytes 1))))))
                          (is (eq :closed (l::local-client-state client)))
                          (is (every #'zerop (l::local-client-read-spans client)))) (l:close-local client))))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-LIM-003
(deftest test-REQ-AFF-004-handshake-negotiation-deadline-and-nonlocal-cleanup
  (dolist (variant '(:success :missing :late :throw))
    (let* ((out (make-array 65540 :element-type '(unsigned-byte 8)))
           (end (l:encode-local-welcome out 65536 :read-groups (not (eq variant :missing))))
           (prototype (scripted-read-client (subseq out 0 end) :expire (eq variant :late)
                                           :throw-tag (when (eq variant :throw) 'hello-exit)))
           (socket (l::local-client-socket prototype)) (connector (symbol-function 'l::connect-local-socket))
           (closer (symbol-function 'l:close-local)) (closed nil) (client nil))
      (setf (l::local-client-socket prototype) nil)
      (unwind-protect
           (progn
             (setf (symbol-function 'l::connect-local-socket) (lambda (&rest args) (declare (ignore args)) socket)
                   (symbol-function 'l:close-local) (lambda (handle) (push handle closed) (funcall closer handle)))
             (case variant
               (:success (setf client (l:connect-local "/unused" :read-groups t
                                        :clock (l::local-client-clock prototype) :io-backend (l::local-client-io-backend prototype)))
                         (is (eq :ready (l::local-client-state client))) (is (null closed)))
               (:throw (is (eq :transferred (catch 'hello-exit
                           (l:connect-local "/unused" :read-groups t :clock (l::local-client-clock prototype)
                                             :io-backend (l::local-client-io-backend prototype))))))
               (otherwise (signals l:protocol-error (l:connect-local "/unused" :read-groups t
                              :clock (l::local-client-clock prototype) :io-backend (l::local-client-io-backend prototype)))))
             (unless (eq variant :success) (is (= 1 (length closed))) (is (eq :closed (l::local-client-state (first closed))))))
        (setf (symbol-function 'l::connect-local-socket) connector (symbol-function 'l:close-local) closer)
        (when client (l:close-local client)) (l:close-local prototype)))))
