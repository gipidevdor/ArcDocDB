;;;; C4: independent state model and physical WAL/frontier oracles, both formats and every M1 index profile.
(in-package #:arcdocdb.engine.tests)

(defun conditional-result (expected form) (is (equal expected form)))
(defun conditional-get (engine id document version)
  (let ((out (bytes 64 204)))
    (is (equal (list (if document :found :absent) (if document (length document) 0) version)
               (multiple-value-list (e:leggi-documento-con-versione engine (key id) out :start 3))))
    (if document (is (equalp document (subseq out 3 (+ 3 (length document)))))
        (is (every (lambda (v) (= v 204)) out)))
    (is (every (lambda (v) (= v 204)) (subseq out 0 3)))))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-MVC-006 REQ-REC-001 REQ-IDX-013
(deftest test-REQ-TXS-002-conditional-ABA-rotation-reopen-and-legacy-arity
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (with-root (root)
        (with-engine (engine (rotation-open root :create t :version version :mode mode :records 2))
          (rotation-force-paged engine mode) (conditional-get engine 1 nil 0)
          (conditional-result '(:applied 1) (multiple-value-list (e:scrivi-documento-se-versione engine (key 1) (value 1) 0)))
          (conditional-get engine 1 (value 1) 1)
          (is (equal '(:found 23) (multiple-value-list (e:leggi-documento engine (key 1) (bytes 64)))))
          (conditional-result '(:applied 2) (multiple-value-list (e:cancella-documento-se-versione engine (key 1) 1)))
          (conditional-get engine 1 nil 0)
          (conditional-result '(:applied 3) (multiple-value-list (e:scrivi-documento-se-versione engine (key 1) (value 3) 0)))
          (conditional-result '(:conflict 3) (multiple-value-list (e:scrivi-documento-se-versione engine (key 1) (value 1) 1)))
          (conditional-result '(:conflict 3) (multiple-value-list (e:cancella-documento-se-versione engine (key 1) 1)))
          (conditional-get engine 1 (value 3) 3) (check-frontier engine 3))
        (with-engine (engine (rotation-open root :version version :mode mode :records 2))
          (rotation-force-paged engine mode) (conditional-get engine 1 (value 3) 3)
          (is (= 4 (e:scrivi-documento engine (key 1) (value 4))))
          (conditional-result '(:conflict 4) (multiple-value-list (e:cancella-documento-se-versione engine (key 1) 3)))
          (conditional-result '(:applied 5) (multiple-value-list (e:cancella-documento-se-versione engine (key 1) 4)))
          (conditional-result '(:applied 6) (multiple-value-list (e:cancella-documento-se-versione engine (key 1) 0)))
          (conditional-get engine 1 nil 0) (check-frontier engine 6))))))

;;; REQ: REQ-TXS-003 REQ-LIM-003 REQ-WAL-006 REQ-IDX-005
(deftest test-REQ-TXS-003-conditional-conflicts-before-capacity-rotation-and-flush
  (dolist (mode '(:legacy :resident :paged))
    (with-root (root)
      (with-engine (engine (rotation-open root :create t :mode mode :records 1))
        (rotation-force-paged engine mode) (e:scrivi-documento engine (key 1) (value 1))
        (let ((originals (images root)) (original (symbol-function 'arcdocdb.io:durable-flush)) (flushes 0))
          (unwind-protect
               (progn
                 (setf (symbol-function 'arcdocdb.io:durable-flush) (lambda (file) (incf flushes) (funcall original file)))
                 (dotimes (n 20)
                   (conditional-result '(:conflict 1) (multiple-value-list (e:scrivi-documento-se-versione engine (key 1) (value 2) 0)))
                   (conditional-result '(:conflict 0) (multiple-value-list (e:cancella-documento-se-versione engine (key 9) 1))))
                 (is (zerop flushes)) (check-frontier engine 1) (check-images root originals))
            (setf (symbol-function 'arcdocdb.io:durable-flush) original))))))
  (with-root (root)
    (with-engine (engine (open-engine root :create t))
      (loop for n from 1 to 28 do (e:scrivi-documento engine (key n) (value n)))
      (let ((originals (images root)))
        (conditional-result '(:conflict 0) (multiple-value-list (e:scrivi-documento-se-versione engine (key 29) (value 1) 99)))
        (signals arcdocdb.conditions:resource-exhausted (e:scrivi-documento-se-versione engine (key 29) (value 1) 0))
        (check-images root originals) (check-frontier engine 28) (is (eq :ready (e:stato-motore engine)))))))

;;; REQ: REQ-TXS-002 REQ-TXS-003 REQ-MVC-006 REQ-IDX-013 REQ-REC-001
(deftest test-REQ-TXS-002-conditional-independent-model-with-compaction
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (with-root (root)
        (let ((versions (make-array 5 :initial-element 0)) (documents (make-array 5 :initial-element nil)) (csn 0))
          (with-engine (engine (rotation-open root :create t :version version :mode mode :records 4))
            (rotation-force-paged engine mode)
            (dotimes (step 95)
              (let* ((id (mod (+ (* step 7) (floor step 5)) 5)) (current (aref versions id))
                     (expected (case (mod step 4) (0 0) (1 current) (2 (max 0 (1- current))) (3 #xffffffffffffffff)))
                     (delete (= 0 (mod step 3)))
                     (result (multiple-value-list
                              (if delete (e:cancella-documento-se-versione engine (key id) expected)
                                  (e:scrivi-documento-se-versione engine (key id) (value id) expected)))))
                (if (= expected current)
                    (progn (incf csn) (conditional-result (list :applied csn) result)
                           (setf (aref documents id) (unless delete (value id)) (aref versions id) (if delete 0 csn)))
                    (conditional-result (list :conflict current) result)))
              (dotimes (id 5) (conditional-get engine id (aref documents id) (aref versions id)))
              (check-frontier engine csn)))
          (with-engine (engine (rotation-open root :version version :mode mode :records 4))
            (dotimes (id 5) (conditional-get engine id (aref documents id) (aref versions id)))
            (check-frontier engine csn)))))))

;;; REQ: REQ-TXS-002 REQ-LIM-001 REQ-AFF-004
(deftest test-REQ-TXS-002-conditional-invalid-input-before-lookup
  (with-root (root)
    (with-engine (engine (open-engine root :create t))
      (let ((originals (images root)))
        (dolist (token '(-1 18446744073709551616 nil :version))
          (signals arcdocdb.conditions:invalid-argument (e:scrivi-documento-se-versione engine (key 1) (value 1) token))
          (signals arcdocdb.conditions:invalid-argument (e:cancella-documento-se-versione engine (key 1) token)))
        (signals arcdocdb.conditions:invalid-argument (e:scrivi-documento-se-versione engine (key 1) (bytes 0) 99))
        (signals arcdocdb.conditions:invalid-argument (e:cancella-documento-se-versione engine (bytes 0) 0))
        (is (eq :ready (e:stato-motore engine))) (check-frontier engine 0) (check-images root originals)))))

;;; REQ: REQ-TXS-002 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-001-conditional-lookup-error-and-nonlocal-exit-fault
  (dolist (nonlocal '(nil t))
    (with-root (root)
      (with-engine (engine (open-engine root :create t))
        (let ((original (symbol-function 'e::sonda-indice-motore))
              (cause (make-condition 'arcdocdb.conditions:io-fault :reason :conditional-fi :operation :test)))
          (unwind-protect
               (progn
                 (setf (symbol-function 'e::sonda-indice-motore)
                       (lambda (&rest args) (declare (ignore args)) (if nonlocal (throw 'probe :escaped) (error cause))))
                 (if nonlocal (is (eq :escaped (catch 'probe (e:cancella-documento-se-versione engine (key 1) 0))))
                     (handler-case (e:cancella-documento-se-versione engine (key 1) 0)
                       (error (seen) (is (eq seen cause)))))
                 (is (eq :faulted (e:stato-motore engine))) (is (not (e::motore-busy engine))))
            (setf (symbol-function 'e::sonda-indice-motore) original)))))))

;;; REQ: REQ-TXS-002 REQ-WAL-006 REQ-REC-001 REQ-AFF-004
(deftest test-REQ-WAL-006-conditional-admitted-fault-never-confirms-and-reopens
  (dolist (phase '(:before-append :after-flush :after-commit))
    (with-root (root)
      (let ((cause (make-condition 'arcdocdb.conditions:io-fault :reason :conditional-write-fi :operation :test)))
        (with-engine (engine (open-engine root :create t :observer (lambda (engine now) (declare (ignore engine))
                                                                  (when (eq phase now) (error cause)) nil)))
          (let ((caught nil))
            (handler-case (e:scrivi-documento-se-versione engine (key 1) (value 1) 0)
              (error (seen) (is (eq seen cause)) (setf caught t)))
            (is caught) (is (eq :faulted (e:stato-motore engine)))))
        (with-engine (engine (open-engine root))
          (conditional-get engine 1 (unless (eq phase :before-append) (value 1)) (if (eq phase :before-append) 0 1)))))))

;;; REQ: REQ-TXS-002 REQ-CON-002 REQ-AFF-008
(deftest test-REQ-CON-002-conditional-maintenance-callback-cannot-change-version
  (with-root (root)
    (let ((callbacks 0))
      (with-engine (engine (rotation-open root :create t :records 1 :observer
                                         (lambda (engine phase)
                                           (when (member phase '(:rotation-ready :before-append :after-commit))
                                             (incf callbacks)
                                             (signals arcdocdb.conditions:invalid-argument
                                               (e:cancella-documento-se-versione engine (key 1) 0))) nil)))
        (conditional-result '(:applied 1) (multiple-value-list (e:scrivi-documento-se-versione engine (key 1) (value 1) 0)))
        (conditional-result '(:applied 2) (multiple-value-list (e:scrivi-documento-se-versione engine (key 1) (value 2) 1)))
        (conditional-get engine 1 (value 2) 2) (is (>= callbacks 5))))))

;;; REQ: REQ-TXS-002 REQ-MVC-006 REQ-LIM-001
(deftest test-REQ-MVC-006-conditional-full-u64-version-carry
  (with-root (root)
    (with-engine (engine (open-engine root :create t))
      (let ((registry (e::motore-registry engine)))
        (setf (arcdocdb.csn::registro-csn-last-low registry) #xffffffff
              (arcdocdb.csn::registro-csn-horizon-low registry) #xffffffff)
        (conditional-result '(:applied 4294967296)
                            (multiple-value-list (e:scrivi-documento-se-versione engine (key 1) (value 1) 0)))
        (conditional-get engine 1 (value 1) 4294967296)
        (conditional-result '(:conflict 4294967296) (multiple-value-list (e:cancella-documento-se-versione engine (key 1) 1)))
        (conditional-result '(:applied 4294967297)
                            (multiple-value-list (e:cancella-documento-se-versione engine (key 1) 4294967296)))))))
