;;;; Independent serial model, actual canonical bytes/frontiers and fault output oracles.
(in-package #:arcdocdb.engine.tests)
(defun conditional-group-arrays (ops flags expected)
  (let ((conditions (bytes 8)) (versions (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)))
    (replace conditions flags) (replace versions expected)
    (values ops conditions versions (make-array 8 :element-type '(unsigned-byte 64) :initial-element 999) (bytes 8 204))))
(defun conditional-group-cleared (engine)
  (let ((work (e::motore-conditional-workspace engine)))
    (is (every #'null (e::conditional-group-workspace-operations work)))
    (dolist (a (list (e::conditional-group-workspace-positions work) (e::conditional-group-workspace-applied work)
                     (e::conditional-group-workspace-tokens work) (e::conditional-group-workspace-csns work))) (is (every #'zerop a)))))
(defun conditional-group-call (engine ops flags expected wanted-tokens wanted-applied)
  (multiple-value-bind (operations conditions versions tokens applied) (conditional-group-arrays ops flags expected)
    (let ((count (length wanted-tokens)))
      (is (= (count 1 wanted-applied) (e::scrivi-gruppo-con-condizioni engine operations conditions versions tokens applied count)))
      (is (equalp wanted-tokens (subseq tokens 0 count))) (is (equalp wanted-applied (subseq applied 0 count)))
      (is (every (lambda (n) (= n 999)) (subseq tokens count))) (is (every (lambda (n) (= n 204)) (subseq applied count))))
    (conditional-group-cleared engine)))
(defun conditional-group-ops (&rest ids)
  (map 'simple-vector (lambda (id) (e:crea-operazione-scrittura :put (key id) (value id))) ids))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-WAL-006 REQ-IDX-013 REQ-MVC-006
(deftest test-REQ-TXS-002-conditional-group-mixed-ordinary-conflict-and-absent-delete
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged))
    (with-root (root)
      (with-engine (engine (rotation-open root :create t :version version :mode mode :records 16))
        (rotation-force-paged engine mode)
        (let ((ops (vector (e:crea-operazione-scrittura :put (key 1) (value 1))
                           (e:crea-operazione-scrittura :put (key 2) (value 2))
                           (e:crea-operazione-scrittura :put (key 1) (value 3))
                           (e:crea-operazione-scrittura :delete (key 3))
                           (e:crea-operazione-scrittura :put (key 4) (value 4))))
              (flushes 0) (original (symbol-function 'arcdocdb.io:durable-flush)))
          (unwind-protect
               (progn (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (fd) (incf flushes) (funcall original fd)))
                      (conditional-group-call engine ops #(1 1 0 1 0) #(0 99 0 0 0) #(1 0 2 3 4) #(1 0 1 1 1))
                      (is (= flushes 1)))
            (setf (symbol-function 'arcdocdb.io:durable-flush) original)))
        (conditional-get engine 1 (value 3) 2) (conditional-get engine 2 nil 0)
        (conditional-get engine 3 nil 0) (conditional-get engine 4 (value 4) 4) (check-frontier engine 4))))))

;;; REQ: REQ-TXS-003 REQ-LIM-003 REQ-WAL-006 REQ-IDX-013
(deftest test-REQ-TXS-003-conditional-group-all-conflicts-before-full-ACTIVE-preflight
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged))
    (with-root (root)
      (with-engine (engine (rotation-open root :create t :version version :mode mode :records 1))
        (rotation-force-paged engine mode) (e:scrivi-documento engine (key 1) (value 1))
        (let ((originals (images root)) (flushes 0) (original (symbol-function 'arcdocdb.io:durable-flush)))
          (unwind-protect
               (progn (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (fd) (incf flushes) (funcall original fd)))
                      (conditional-group-call engine (conditional-group-ops 1 2 3 4 5 6 7 8)
                        #(1 1 1 1 1 1 1 1) #(0 99 99 99 99 99 99 99) #(1 0 0 0 0 0 0 0) #(0 0 0 0 0 0 0 0))
                      (is (zerop flushes)) (check-frontier engine 1) (check-images root originals))
            (setf (symbol-function 'arcdocdb.io:durable-flush) original))))))))

;;; REQ: REQ-TXS-002 REQ-LIM-001 REQ-AFF-008
(deftest test-REQ-TXS-002-conditional-group-full-validation-before-any-probe
  (with-root (root)
    (with-engine (engine (open-engine root :create t))
      (let ((original (symbol-function 'e::versione-corrente-indice-motore)) (probes 0) (originals (images root)))
        (unwind-protect
             (progn
               (setf (symbol-function 'e::versione-corrente-indice-motore)
                     (lambda (&rest args) (incf probes) (apply original args)))
               (dolist (ops (list (conditional-group-ops 1 1) (vector (svref (conditional-group-ops 1) 0) nil)))
                 (multiple-value-bind (operations conditions expected tokens applied) (conditional-group-arrays ops #(1 1) #(0 0))
                   (signals arcdocdb.conditions:invalid-argument
                     (e::scrivi-gruppo-con-condizioni engine operations conditions expected tokens applied 2))
                   (is (every (lambda (n) (= n 999)) tokens)) (is (every (lambda (n) (= n 204)) applied))))
               (is (zerop probes)) (check-images root originals) (check-frontier engine 0) (conditional-group-cleared engine))
          (setf (symbol-function 'e::versione-corrente-indice-motore) original))))))

;;; REQ: REQ-TXS-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-LIM-003-conditional-group-unadmitted-capacity-preserves-output
  (with-root (root)
    (with-engine (engine (rotation-open root :create t :records 1))
      (multiple-value-bind (ops flags expected tokens applied) (conditional-group-arrays (conditional-group-ops 1 2) #(1 1) #(0 0))
        (let ((originals (images root)))
          (signals arcdocdb.conditions:resource-exhausted (e::scrivi-gruppo-con-condizioni engine ops flags expected tokens applied 2))
          (is (every (lambda (n) (= n 999)) tokens)) (is (every (lambda (n) (= n 204)) applied))
          (is (eq :ready (e:stato-motore engine))) (check-frontier engine 0) (check-images root originals) (conditional-group-cleared engine))))))

;;; REQ: REQ-TXS-002 REQ-AFF-001 REQ-AFF-004
(deftest test-REQ-AFF-001-conditional-group-probe-error-and-throw-clear-output
  (dolist (nonlocal '(nil t))
    (with-root (root)
      (with-engine (engine (open-engine root :create t))
        (multiple-value-bind (ops flags expected tokens applied) (conditional-group-arrays (conditional-group-ops 1 2) #(1 1) #(0 0))
          (let ((original (symbol-function 'e::sonda-indice-motore)) (calls 0)
                (cause (make-condition 'arcdocdb.conditions:io-fault :reason :conditional-group-fi :operation :test)))
            (unwind-protect
                 (progn
                   (setf (symbol-function 'e::sonda-indice-motore)
                         (lambda (&rest args) (if (= 2 (incf calls)) (if nonlocal (throw 'probe :escaped) (error cause)) (apply original args))))
                   (if nonlocal (is (eq :escaped (catch 'probe (e::scrivi-gruppo-con-condizioni engine ops flags expected tokens applied 2))))
                       (handler-case (e::scrivi-gruppo-con-condizioni engine ops flags expected tokens applied 2)
                         (error (seen) (is (eq seen cause)))))
                   (is (eq :faulted (e:stato-motore engine))) (is (not (e::motore-busy engine)))
                   (is (every (lambda (n) (= n 999)) tokens)) (is (every (lambda (n) (= n 204)) applied)) (conditional-group-cleared engine))
              (setf (symbol-function 'e::sonda-indice-motore) original))))))))

;;; REQ: REQ-TXS-002 REQ-WAL-006 REQ-REC-001 REQ-AFF-004
(deftest test-REQ-WAL-006-conditional-group-post-flush-fault-no-output-and-recovery
  (with-root (root)
    (with-engine (engine (open-engine root :create t :observer (lambda (engine phase) (declare (ignore engine))
                                                              (when (eq phase :after-flush)
                                                                (error 'arcdocdb.conditions:resource-exhausted :reason :conditional-group-after-flush)) nil)))
      (multiple-value-bind (ops flags expected tokens applied) (conditional-group-arrays (conditional-group-ops 1 2) #(1 1) #(0 0))
        (signals arcdocdb.conditions:resource-exhausted (e::scrivi-gruppo-con-condizioni engine ops flags expected tokens applied 2))
        (is (eq :faulted (e:stato-motore engine))) (is (every (lambda (n) (= n 999)) tokens))
        (is (every (lambda (n) (= n 204)) applied)) (conditional-group-cleared engine)))
    (with-engine (engine (open-engine root)) (conditional-get engine 1 (value 1) 1) (conditional-get engine 2 (value 2) 2) (check-frontier engine 2))))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-REC-001 REQ-IDX-013 REQ-MVC-006
(deftest test-REQ-TXS-002-conditional-group-independent-history-model-and-reopen
  (dolist (version '(1 2)) (dolist (mode '(:legacy :resident :paged))
    (with-root (root)
      (let ((versions (make-array 7 :initial-element 0)) (docs (make-array 7 :initial-element nil)) (csn 0))
        (with-engine (engine (rotation-open root :create t :version version :mode mode :records 8))
          (rotation-force-paged engine mode)
          (dotimes (step 24)
            (let ((ops (make-array 4)) (flags (bytes 4)) (expected (make-array 4 :initial-element 0))
                  (tokens (make-array 4 :initial-element 0)) (applied (bytes 4)))
              (dotimes (i 4)
                (let* ((id (mod (+ step i) 7)) (current (aref versions id)) (condition (/= 0 (mod (+ step i) 3)))
                       (token (if (evenp (+ step i)) current (if (zerop current) 1 (1- current))))
                       (delete (zerop (mod (+ step i) 5))))
                  (setf (svref ops i) (e:crea-operazione-scrittura (if delete :delete :put) (key id) (unless delete (value id)))
                        (aref flags i) (if condition 1 0) (aref expected i) token)
                  (if (or (not condition) (= token current))
                      (progn (incf csn) (setf (aref applied i) 1 (aref tokens i) csn
                                              (aref docs id) (unless delete (value id)) (aref versions id) (if delete 0 csn)))
                      (setf (aref tokens i) current))))
              (conditional-group-call engine ops flags expected tokens applied))
            (dotimes (id 7) (conditional-get engine id (aref docs id) (aref versions id))) (check-frontier engine csn)))
        (with-engine (engine (rotation-open root :version version :mode mode :records 8))
          (dotimes (id 7) (conditional-get engine id (aref docs id) (aref versions id))) (check-frontier engine csn)))))))

;;; REQ: REQ-TXS-002 REQ-LIM-001 REQ-AFF-008
(deftest test-REQ-TXS-002-conditional-group-aliases-rejected-before-effects
  (with-root (root)
    (with-engine (engine (open-engine root :create t))
      (multiple-value-bind (ops flags expected tokens applied) (conditional-group-arrays (conditional-group-ops 1) #(1) #(0))
        (signals arcdocdb.conditions:invalid-argument (e::scrivi-gruppo-con-condizioni engine ops flags expected expected applied 1))
        (signals arcdocdb.conditions:invalid-argument (e::scrivi-gruppo-con-condizioni engine ops flags expected tokens flags 1))
        (setf (svref ops 0) (e:crea-operazione-scrittura :put (key 1) applied))
        (signals arcdocdb.conditions:invalid-argument (e::scrivi-gruppo-con-condizioni engine ops flags expected tokens applied 1))
        (check-frontier engine 0) (is (eq :ready (e:stato-motore engine))) (conditional-group-cleared engine)))))
