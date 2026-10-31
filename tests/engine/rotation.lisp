;;;; Integration of canonical checkpoint with a continuously admitted serial engine.
(in-package #:arcdocdb.engine.tests)

(defun rotation-open (root &key create (version 2) observer (mode :resident) (records 3) (segments 16))
  (e:apri-motore root (archive-id) (series-id) :create create :version version :clock (lambda () 10)
    :observer observer :max-file-bytes 4096 :max-record-bytes 512 :max-records records :max-segments segments
    :index-capacity 32 :key-arena-bytes 4096
    :index-policy (if (eq mode :legacy) :legacy (e:crea-politica-indice-automatico :budget 8388608 :frames 1))))
(defun rotation-force-paged (engine mode)
  (when (eq mode :paged)
    (e:configura-budget-indice-motore engine (getf (e:statistiche-indice-motore engine) :reserved-fixed))
    (is (eq :paged (e:modo-indice-motore engine)))))
(defun rotation-closed-images (root engine)
  (let ((active (arcdocdb.wal::log-io-file-id (arcdocdb.active:log-segmento-attivo-preparato (e::motore-active engine)))))
    (remove-if-not (lambda (entry) (< (parse-integer (car entry) :end 16 :radix 16) active)) (images root t))))

;;; REQ: REQ-STO-002 REQ-STO-003 REQ-STO-004 REQ-REC-001 REQ-IDX-013 REQ-MVC-006
(deftest test-REQ-STO-003-live-rotation-record-quota-all-index-profiles-v1-v2
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (with-root (root)
        (let ((expected (make-array 5 :initial-element nil)) (rotations 0))
          (with-engine (engine (rotation-open root :create t :version version :mode mode
                                :observer (lambda (engine phase) (declare (ignore engine))
                                            (when (member phase '(:rotation-ready :compaction-relocated)) (incf rotations)) nil)))
            (rotation-force-paged engine mode)
            (let ((registry (e::motore-registry engine)) (scope (e::motore-scope engine)))
              (dotimes (n 18)
                (let ((id (mod n 5)) (retired (rotation-closed-images root engine)))
                  (if (= (mod n 4) 3)
                      (progn (is (= (1+ n) (e:cancella-documento engine (key id)))) (setf (aref expected id) nil))
                      (progn (is (= (1+ n) (e:scrivi-documento engine (key id) (value n))))
                             (setf (aref expected id) (value n))))
                  (is (eq registry (e::motore-registry engine))) (is (eq scope (e::motore-scope engine)))
                  (dotimes (id 5) (check-get engine id (aref expected id)))
                  (check-frontier engine (1+ n))
                  (dolist (entry retired)
                    (if (probe-file (merge-pathnames (car entry) root))
                        (check-images root (list entry))
                        (is (plusp (e::motore-compactions engine)))))))
              (is (= 5 rotations))
              (is (= 1 (length (e::motore-recovery-sets engine))))
              (is (= 3 (length (e::motore-fds engine))))
              (when (eq mode :paged) (is (eq :paged (e:modo-indice-motore engine))))))
          (with-engine (engine (rotation-open root :version version :mode mode))
            (dotimes (id 5) (check-get engine id (aref expected id)))
            (check-frontier engine 18)
            (is (= 19 (e:scrivi-documento engine (key 1) (value 19))))))))))

;;; REQ: REQ-STO-003 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-STO-003-live-rotation-segment-limit-refuses-before-effects
  (with-root (root)
    (with-engine (engine (rotation-open root :create t :records 1 :segments 3))
      (is (= 1 (e:scrivi-documento engine (key 1) (value 1))))
      (is (= 2 (e:scrivi-documento engine (key 2) (value 2))))
      (let ((originals (images root)) (fds (length (e::motore-fds engine))))
        (dotimes (n 8)
          (signals arcdocdb.conditions:resource-exhausted
            (e:scrivi-documento engine (key 3) (value 3)) :engine-rotation-segment-budget)
          (check-frontier engine 2) (check-images root originals)
          (is (= fds (length (e::motore-fds engine)))))))))

;;; REQ: REQ-STO-003 REQ-WAL-006 REQ-REC-001
(deftest test-REQ-STO-003-live-rotation-byte-quota-v1-v2
  (dolist (version '(1 2))
    (with-root (root)
      (let ((rotations 0))
        (with-engine (engine (rotation-open root :create t :version version :records 64
                              :observer (lambda (engine phase) (declare (ignore engine))
                                          (when (eq phase :rotation-ready) (incf rotations)) nil)))
          (dotimes (n 14) (is (= (1+ n) (e:scrivi-documento engine (key 1) (bytes 350 n)))))
          (is (plusp rotations)) (check-frontier engine 14))
        (with-engine (engine (rotation-open root :version version :records 64))
          (let ((target (bytes 350)))
            (is (equal '(:found 350) (multiple-value-list (e:leggi-documento engine (key 1) target))))
            (is (equalp target (bytes 350 13))))
          (check-frontier engine 14))))))

;;; REQ: REQ-STO-003 REQ-REC-001 REQ-WAL-006 REQ-AFF-004
(deftest test-REQ-STO-003-live-rotation-fail-stop-before-next-data-CSN
  (dolist (phase '(:rotation-starting :checkpoint-prepared :checkpoint-published :rotation-canonical-ready :rotation-ready))
    (dolist (version '(1 2))
      (with-root (root)
        (let ((armed nil) (fired nil) (cause (make-condition 'arcdocdb.conditions:io-fault :reason :rotation-fi :operation :test)))
          (with-engine (engine (rotation-open root :create t :version version :records 2
                                :observer (lambda (engine step) (declare (ignore engine))
                                            (when (and armed (eq phase step)) (setf fired t) (error cause)) nil)))
            (is (= 1 (e:scrivi-documento engine (key 1) (value 1))))
            (is (= 2 (e:scrivi-documento engine (key 2) (value 2))))
            (setf armed t)
            (handler-case (progn (e:scrivi-documento engine (key 3) (value 3)) (error "Missing FI"))
              (arcdocdb.conditions:io-fault (condition) (is (eq condition cause))))
            (is fired) (is (eq :faulted (e:stato-motore engine)))
            (is (equal '(0 2 0 2) (multiple-value-list (arcdocdb.csn:leggi-frontiere-csn (e::motore-registry engine))))))
          (with-engine (engine (rotation-open root :version version :records 2))
            (check-get engine 1 (value 1)) (check-get engine 2 (value 2)) (check-get engine 3 nil)
            (check-frontier engine 2) (is (= 3 (e:scrivi-documento engine (key 3) (value 3))))))))))

(defun rotation-child-main (arguments)
  (destructuring-bind (mode path format stage) arguments
    (let* ((root (uiop:ensure-directory-pathname path)) (version (parse-integer format)) (armed nil)
           (phase (intern (string-upcase stage) :keyword)) (originals (images root t)))
      (with-engine (engine (rotation-open root :create (string= mode "rotate-crash") :version version :records 2
                            :observer (lambda (engine step) (declare (ignore engine))
                                        (when (and armed (eq step phase)) (crash phase)) nil)))
        (cond ((string= mode "rotate-crash")
               (is (= 1 (e:scrivi-documento engine (key 1) (value 1))))
               (is (= 2 (e:scrivi-documento engine (key 2) (value 2))))
               (setf armed t)
               (e:scrivi-documento engine (key 3) (value 3))
               (error "Rotation crash point not reached: ~A" stage))
              ((string= mode "rotate-verify")
               (check-frontier engine 2) (check-get engine 1 (value 1)) (check-get engine 2 (value 2))
               (check-get engine 3 nil) (check-segment-images root originals)
               (is (= 3 (e:scrivi-documento engine (key 3) (value 3))))
               (check-get engine 1 (value 1)) (check-get engine 3 (value 3)))
              ((string= mode "rotate-final")
               (check-frontier engine 3) (check-get engine 1 (value 1)) (check-get engine 2 (value 2))
               (check-get engine 3 (value 3)) (check-segment-images root originals))
              (t (error "Unknown rotation child mode"))))
      (format t "~&ROTATION-VERIFIED v~D ~A ~A~%" version mode stage))))

;;; REQ: REQ-STO-003 REQ-REC-001 REQ-WAL-006 REQ-MVC-006 REQ-AFF-018
(deftest test-REQ-STO-003-live-rotation-real-SIGKILL-publish-and-reopen-v1-v2
  (dolist (version '(1 2))
    (dolist (stage '("rotation-starting" "checkpoint-prepared" "checkpoint-published"
                     "rotation-canonical-ready" "rotation-ready"))
      (with-root (root)
        (child root version "rotate-crash" stage :signaled sb-posix:sigkill)
        (child root version "rotate-verify" stage :exited 0)
        (child root version "rotate-final" stage :exited 0)))))

;;; REQ: REQ-STO-003 REQ-IDX-010 REQ-IDX-011 REQ-IDX-012 REQ-WAL-006
(deftest test-REQ-STO-003-live-rotation-sealed-image-delta-and-auto-renewal-v1-v2
  (dolist (version '(1 2))
    (with-root (root)
      (with-engine (engine (rotation-open root :create t :version version :mode :legacy :records 2))
        (let ((first (build-option 1)) (expected (make-array 4 :initial-element nil)) (renewals 0))
          (is (= 1 (e:scrivi-documento engine (key 1) (value 1)))) (setf (aref expected 1) (value 1))
          (is (= 2 (e:scrivi-documento engine (key 2) (value 2)))) (setf (aref expected 2) (value 2))
          (e:costruisci-indice-paginato-motore engine first)
          (activate-delta engine first :keys 2 :bytes 32)
          (install-auto engine 2 :max-renewals 8)
          (let ((original (image (build-path root first))))
            (dotimes (n 9)
              (let ((id (mod n 4)))
                (if (= (mod n 3) 2)
                    (progn (is (= (+ n 3) (e:cancella-documento engine (key id)))) (setf (aref expected id) nil))
                    (progn (is (= (+ n 3) (e:scrivi-documento engine (key id) (value (+ n 3)))))
                           (setf (aref expected id) (value (+ n 3)))))
                (dotimes (id 4) (check-get engine id (aref expected id)))
                (setf renewals (max renewals (e::motore-auto-renewals-used engine)))
                (is (eq (if (plusp (e::motore-compactions engine)) :resident :paged)
                        (e:modo-indice-motore engine)))))
            (is (plusp renewals)) (is (plusp (e::motore-compactions engine)))
            (is (equalp original (image (build-path root first)))))
          (check-frontier engine 11))))))

;;; REQ: REQ-STO-003 REQ-REC-001 REQ-AFF-004
(deftest test-REQ-STO-003-live-rotation-nonlocal-exit-closes-admission
  (with-root (root)
    (let ((armed nil))
      (with-engine (engine (rotation-open root :create t :records 1
                            :observer (lambda (engine phase) (declare (ignore engine))
                                        (when (and armed (eq :rotation-canonical-ready phase))
                                          (throw :rotation-exit :cancelled)) nil)))
        (is (= 1 (e:scrivi-documento engine (key 1) (value 1)))) (setf armed t)
        (is (eq :cancelled (catch :rotation-exit (e:scrivi-documento engine (key 2) (value 2)))))
        (is (eq :faulted (e:stato-motore engine))) (is (null (e::motore-busy engine))))
      (with-engine (engine (rotation-open root :records 1))
        (check-get engine 1 (value 1)) (check-get engine 2 nil)
        (check-frontier engine 1) (is (= 2 (e:scrivi-documento engine (key 2) (value 2))))))))

;;; REQ: REQ-STO-003 REQ-REC-001 REQ-AFF-002
(deftest test-REQ-STO-003-live-rotation-corrupt-closed-refused-before-checkpoint
  (with-root (root)
    (with-engine (engine (rotation-open root :create t :records 1))
      (is (= 1 (e:scrivi-documento engine (key 1) (value 1))))
      (is (= 2 (e:scrivi-documento engine (key 2) (value 2))))
      ;; Explicit fixture damage: an immutable historical header, not a product writer operation.
      (with-open-file (stream (merge-pathnames "0000000000000002.seg" root)
                              :direction :io :if-exists :overwrite :element-type '(unsigned-byte 8))
        (file-position stream 80)
        (let ((byte (read-byte stream))) (file-position stream 80) (write-byte (logxor byte 1) stream)))
      (let ((originals (images root)))
        (signals arcdocdb.conditions:corruption-detected (e:scrivi-documento engine (key 3) (value 3)))
        (is (eq :faulted (e:stato-motore engine)))
        (is (equal '(0 2 0 2) (multiple-value-list (arcdocdb.csn:leggi-frontiere-csn (e::motore-registry engine)))))
        (check-images root originals)))
    (signals arcdocdb.conditions:corruption-detected (rotation-open root :records 1))))
