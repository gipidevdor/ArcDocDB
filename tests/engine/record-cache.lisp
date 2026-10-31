;;;; C4: fixed-budget cache integration, canonical proofs and independent value/CSN oracles.
(in-package #:arcdocdb.engine.tests)

(defun cached-open (root &key create (version 2) (mode :resident) (budget 32768) observer (records 3))
  (e:apri-motore root (archive-id) (series-id) :create create :version version :clock (lambda () 10)
    :observer observer :record-cache-budget budget :max-file-bytes 4096 :max-record-bytes 512
    :max-records records :max-segments 16 :index-capacity 32 :key-arena-bytes 4096
    :index-policy (if (eq mode :legacy) :legacy (e:crea-politica-indice-automatico :budget 8388608 :frames 1))))
(defun cache-stats (engine field) (getf (e:statistiche-cache-motore engine) field))
(defun cache-bit-flip (engine)
  (let* ((cache (e::motore-record-cache engine))
         (class (svref (arcdocdb.cache::cache-serie-classes cache) 0))
         (tags (arcdocdb.cache::classe-cache-tags class)))
    (let ((slot (loop for i below (/ (length tags) 4) when (plusp (aref tags (+ (* i 4) 3))) return i)))
      (is slot)
      (let* ((position (+ (* slot (arcdocdb.cache::classe-cache-size class)) arcdocdb.record:+header-bytes+))
             (arena (arcdocdb.cache::classe-cache-arena class)))
        (setf (aref arena position) (logxor 1 (aref arena position)))))))
(defun cache-count-reads (function)
  (let ((original (symbol-function 'arcdocdb.io:leggi-esatto)) (calls 0))
    (unwind-protect
         (progn
           (setf (symbol-function 'arcdocdb.io:leggi-esatto)
                 (lambda (file buffer start end offset) (incf calls) (funcall original file buffer start end offset)))
           (funcall function) calls)
      (setf (symbol-function 'arcdocdb.io:leggi-esatto) original))))

;;; REQ: REQ-CCH-001 REQ-LIM-003 REQ-AFF-008
(deftest test-REQ-CCH-001-engine-cache-geometry-exact-minimum-and-zero
  (is (null (e::crea-record-cache-motore 0 65536)))
  (dolist (frame '(64 1024 1025 4096 4097 65536))
    (let* ((sizes (loop for n = 1024 then (* n 2) collect n until (>= n frame)))
           (minimum (loop for size in sizes sum (+ (* 8 size) 249)))
           (cache (e::crea-record-cache-motore minimum frame))
           (classes (arcdocdb.cache::cache-serie-classes cache)))
      (is (= minimum (arcdocdb.cache:payload-cache-serie cache)))
      (is (= (length sizes) (length classes)))
      (loop for size in sizes for class across classes do
        (is (= size (arcdocdb.cache::classe-cache-size class)))
        (is (= 1 (arcdocdb.cache::classe-cache-sets class))))
      (signals arcdocdb.conditions:resource-exhausted
        (e::crea-record-cache-motore (1- minimum) frame) :engine-record-cache-minimum)))
  (dolist (budget '(nil t -1 1.5 "32768" 1073741825))
    (signals arcdocdb.conditions:invalid-argument
      (e:apri-motore "/missing" (archive-id) (series-id) :record-cache-budget budget
        :clock (lambda () (error "Clock reached"))) :engine-record-cache-budget))
  (signals arcdocdb.conditions:resource-exhausted
    (e:apri-motore "/missing" (archive-id) (series-id) :record-cache-budget 1 :clock (lambda () 10))
    :engine-record-cache-minimum))

;;; REQ: REQ-CCH-002 REQ-CCH-004 REQ-IDX-013 REQ-REC-001
(deftest test-REQ-CCH-002-engine-active-closed-and-reopen-hits-v1-v2-all-modes
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (with-root (root)
        (with-engine (engine (cached-open root :create t :version version :mode mode))
          (rotation-force-paged engine mode)
          (is (= 1 (e:scrivi-documento engine (key 1) (value 1))))
          (is (plusp (cache-count-reads (lambda () (check-get engine 1 (value 1))))))
          (is (zerop (cache-count-reads (lambda () (check-get engine 1 (value 1))))))
          (is (= 1 (cache-stats engine :hits))) (is (= 1 (cache-stats engine :misses)))
          (loop for n from 2 to 4 do (e:scrivi-documento engine (key n) (value n)))
          (check-get engine 1 (value 1)) ; canonical CLOSED map must be reacquired even for a cached location.
          (is (zerop (cache-count-reads (lambda () (check-get engine 1 (value 1))))))
          (check-frontier engine 4))
        (with-engine (engine (cached-open root :version version :mode mode))
          (is (zerop (cache-stats engine :hits))) (is (zerop (cache-stats engine :misses)))
          (rotation-force-paged engine mode)
          (check-get engine 1 (value 1))
          (is (zerop (cache-count-reads (lambda () (check-get engine 1 (value 1))))))
          (check-frontier engine 4))))))

;;; REQ: REQ-CCH-002 REQ-CCH-004 REQ-AFF-002
(deftest test-REQ-CCH-004-engine-corrupt-cache-rereads-segment-and-notifies
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (with-root (root)
        (let ((alerts 0))
          (with-engine (engine (cached-open root :create t :version version :mode mode
                                :observer (lambda (handle phase) (declare (ignore handle))
                                            (when (eq phase :cache-verify-failed) (incf alerts)) nil)))
            (rotation-force-paged engine mode)
            (e:scrivi-documento engine (key 1) (value 1)) (check-get engine 1 (value 1))
            (let ((originals (images root)))
              (cache-bit-flip engine)
              (is (plusp (cache-count-reads (lambda () (check-get engine 1 (value 1))))))
              (is (= 1 alerts)) (is (= 1 (cache-stats engine :verify-failed)))
              (is (eq :ready (e:stato-motore engine))) (check-images root originals)
              (check-get engine 1 (value 1)) (check-frontier engine 1))))))))

;;; REQ: REQ-CCH-004 REQ-AFF-002 REQ-AFF-004
(deftest test-REQ-CCH-004-engine-cache-and-segment-corruption-never-delivered
  (with-root (root)
    (with-engine (engine (cached-open root :create t))
      (e:scrivi-documento engine (key 1) (value 1)) (check-get engine 1 (value 1))
      (cache-bit-flip engine)
      (let ((original (symbol-function 'arcdocdb.io:leggi-esatto)) (target (bytes 64 204)) (calls 0))
        (unwind-protect
             (progn
               (setf (symbol-function 'arcdocdb.io:leggi-esatto)
                     (lambda (file buffer start end offset)
                       (let ((result (funcall original file buffer start end offset)))
                         (incf calls) (setf (aref buffer (+ start 40)) (logxor 1 (aref buffer (+ start 40)))) result)))
               (signals arcdocdb.conditions:corruption-detected (e:leggi-documento engine (key 1) target))
               (is (= 1 calls)) (is (every (lambda (byte) (= byte 204)) target))
               (is (eq :faulted (e:stato-motore engine))))
          (setf (symbol-function 'arcdocdb.io:leggi-esatto) original))))))

;;; REQ: REQ-CCH-002 REQ-CMP-001 REQ-CMP-007 REQ-IDX-013
(deftest test-REQ-CCH-002-engine-cache-updates-delete-compaction-and-mode-changes
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (with-root (root)
        (with-engine (engine (cached-open root :create t :version version :mode mode :records 8))
          (rotation-force-paged engine mode)
          (let ((cache (e::motore-record-cache engine)))
            (dotimes (n 18)
              (is (= (1+ n) (e:scrivi-documento engine (key (mod n 3)) (value n))))
              (check-get engine (mod n 3) (value n)))
            (is (= 19 (e:cancella-documento engine (key 1)))) (check-get engine 1 nil)
            (check-get engine 0 (value 15)) (check-get engine 2 (value 17))
            (let ((hits (cache-stats engine :hits)))
              (is (eq :compacted (getf (e:compatta-motore engine :force t) :status)))
              (is (eq cache (e::motore-record-cache engine)))
              (check-get engine 0 (value 15)) (is (= hits (cache-stats engine :hits)))
              (check-get engine 0 (value 15)) (is (= (1+ hits) (cache-stats engine :hits))))
            (unless (eq mode :legacy)
              (e:configura-budget-indice-motore engine 8388608)
              (is (eq :resident (e:modo-indice-motore engine)))
              (check-get engine 2 (value 17))
              (is (eq cache (e::motore-record-cache engine))))
            (check-frontier engine 19)))
        (with-engine (engine (cached-open root :version version :mode mode))
          (check-get engine 0 (value 15)) (check-get engine 1 nil) (check-get engine 2 (value 17))
          (check-frontier engine 19))))))

;;; REQ: REQ-CCH-001 REQ-CCH-002 REQ-AFF-004
(deftest test-REQ-CCH-001-engine-zero-budget-and-close-release
  (dolist (budget '(0 32768))
    (with-root (root)
      (let ((engine (cached-open root :create t :budget budget)))
        (unwind-protect
             (progn (e:scrivi-documento engine (key 1) (value 1))
               (dotimes (n 3) (check-get engine 1 (value 1)))
               (is (= (if (zerop budget) 0 2) (cache-stats engine :hits)))
               (is (<= (cache-stats engine :payload) budget)))
          (e:chiudi-motore engine))
        (is (null (e::motore-record-cache engine))) (is (null (e::motore-view engine)))
        (is (null (e::motore-group engine))) (e:chiudi-motore engine)))))

;;; REQ: REQ-CCH-004 REQ-AFF-002 REQ-IDX-013 REQ-FOR-004
(deftest test-REQ-CCH-004-engine-warm-cache-never-bypasses-canonical-closed-proof
  (with-root (root)
    (with-engine (engine (cached-open root :create t :mode :paged))
      (rotation-force-paged engine :paged)
      (e:scrivi-documento engine (key 1) (value 1)) (check-get engine 1 (value 1))
      (loop for n from 2 to 4 do (e:scrivi-documento engine (key n) (value n)))
      (let ((original (symbol-function 'arcdocdb.io:leggi-esatto)) (target (bytes 64 204)) (injected nil))
        (unwind-protect
             (progn
               (setf (symbol-function 'arcdocdb.io:leggi-esatto)
                     (lambda (file buffer start end offset)
                       (let ((result (funcall original file buffer start end offset)))
                         (when (eq buffer (e::motore-scratch engine))
                           (setf injected t (aref buffer (+ start 100)) (logxor 1 (aref buffer (+ start 100)))))
                         result)))
               (signals arcdocdb.conditions:corruption-detected (e:leggi-documento engine (key 1) target))
               (is injected) (is (every (lambda (byte) (= byte 204)) target))
               (is (eq :faulted (e:stato-motore engine))))
          (setf (symbol-function 'arcdocdb.io:leggi-esatto) original))))))
