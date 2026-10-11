(in-package #:arcdocdb.cbor.write.tests)

;;; REQ: REQ-CBR-001 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-CBR-001-cbor-write-two-exclusive-destinations-real-time-overlap
  (let* ((rounds 16384) (buffers (make-array 2)) (expected (make-array 2))
         (specs (make-array 2)) (limits (vector 0 0)) (finals (vector 0 0))
         (per-round (vector 0 0)) (sinks (vector 0 0))
         (ready (sb-thread:make-semaphore)) (go (sb-thread:make-semaphore))
         (starts (vector 0 0)) (ends (vector 0 0)) (threads nil))
    (dotimes (index 2)
      (multiple-value-bind (buffer start end plan after sink final) (cw-worker-plan index)
        (is (= start 3))
        (setf (svref buffers index) buffer (svref expected index) after
              (svref specs index) plan (svref limits index) end
              (svref per-round index) sink (svref finals index) final)))
    (is (not (eq (svref buffers 0) (svref buffers 1))))
    (is (not (eq (svref expected 0) (svref expected 1))))
    (unwind-protect
         (progn
           (dotimes (i 2)
             (let ((index i))
               (push (sb-thread:make-thread
                      (lambda ()
                        (handler-case
                            (progn
                              (sb-thread:signal-semaphore ready) (cbor-wait go)
                              (setf (svref starts index) (get-internal-real-time))
                              (let ((buffer (svref buffers index)) (end (svref limits index))
                                    (plan (svref specs index)) (sink 0))
                                (dotimes (round rounds)
                                  (let ((cursor 3))
                                    (dolist (spec plan)
                                      (destructuring-bind (major high low header) spec
                                        (let ((actual (multiple-value-list
                                                       (arcdocdb.cbor:scrivi-header-cbor-minimo
                                                        buffer cursor end major high low))))
                                          (is (= 1 (length actual)))
                                          (is (typep (first actual) 'fixnum))
                                          (is (= (first actual) (+ cursor (length header))))
                                          (setf cursor (first actual))
                                          (incf sink (+ cursor (first header))))))
                                    (is (= cursor (svref finals index)))))
                                (is (equalp buffer (svref expected index)))
                                (setf (svref sinks index) sink))
                              (setf (svref ends index) (get-internal-real-time)) :ok)
                          (error (condition) condition)))
                      :name "CBOR header write exclusive worker") threads)))
           (dotimes (i 2) (cbor-wait ready))
           (sb-thread:signal-semaphore go 2)
           (dolist (thread threads) (cbor-join thread))
           (dotimes (index 2)
             (is (> (svref ends index) (svref starts index)))
             (is (= (svref sinks index) (* rounds (svref per-round index))))
             (is (equalp (svref buffers index) (svref expected index))))
           (let ((overlap (- (min (svref ends 0) (svref ends 1))
                             (max (svref starts 0) (svref starts 1)))))
             (is (plusp overlap))
             (format t "  CBOR write: 2 worker, ~D header, sink ~D/~D, overlap tempo reale ~D tick, ~D tick/s; nessuna inferenza su core/scaling.~%"
                     (* 2 rounds 7) (svref sinks 0) (svref sinks 1)
                     overlap internal-time-units-per-second)))
      (sb-thread:signal-semaphore go 2)
      (cbor-stop-workers threads))))
