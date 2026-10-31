;;;; C4: fixed serial allocation windows; startup, fixtures, reports and GC are outside measurement.
(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(asdf:load-asd (truename "arcdocdb.asd"))
(asdf:load-system "arcdocdb/tests")
(in-package #:arcdocdb.engine.tests)

(defun location-lookup-cycle (engine input expected state count destination)
  (declare (type fixnum count)
           (type (simple-array (unsigned-byte 64) (5)) expected destination))
  (dotimes (i count)
    (unless (eq state (e::sonda-indice-motore engine input 0 (length input) (e::motore-index-context engine) destination))
      (error "Wrong overlay outcome."))
    (dotimes (word 5)
      (unless (= (aref expected word) (aref destination word)) (error "Wrong descriptor word ~D." word))))
  count)

(defun location-allocation-windows (engine input expected state version name)
  (let ((destination (make-array 5 :element-type '(unsigned-byte 64) :initial-element 77)))
    (dotimes (window 5)
      (fill destination 77)
      (location-lookup-cycle engine input expected state 1000 destination)
      (sb-ext:gc :full t)
      (sb-ext:get-bytes-consed)
      (let* ((before (sb-ext:get-bytes-consed))
             (matched (location-lookup-cycle engine input expected state 100000 destination))
             (allocated (- (sb-ext:get-bytes-consed) before)))
        (format t "~&~S~%" (list :schema-version 1 :kind :m1-delta-allocation-window :format version
                                :case name :window window :calls matched :bytes-consed allocated))
        (assert (= matched 100000)) (assert (zerop allocated))))))

(sb-ext:with-timeout 120
  (dolist (version '(1 2))
    (with-root (root)
      (with-engine (engine (open-build-engine root :create t :version version))
        (initial-workload engine)
        (let* ((option (build-option 1)) (resident (e::motore-index engine))
               (live (key 1)) (tombstone (key 3)) (base (key 4))
               (live-words (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0))
               (base-words (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0))
               (absent-words (make-array 5 :element-type '(unsigned-byte 64) :initial-element 77)))
          ;; Independent location expectations from the known pre-append frontier.
          (let ((start (arcdocdb.io:posizione-scritta (e::motore-append engine)))
                (segment (arcdocdb.wal::log-io-file-id
                          (arcdocdb.active:log-segmento-attivo-preparato (e::motore-active engine)))))
            (assert (= 6 (e:scrivi-documento engine base (value 4))))
            (setf (aref base-words 0) 6 (aref base-words 1) (logior (ash segment 32) start)
                  (aref base-words 2) #x1001000000000 (aref base-words 3) 63))
          (e:costruisci-indice-paginato-motore engine option) (activate-delta engine option)
          (let ((start (arcdocdb.io:posizione-scritta (e::motore-append engine)))
                (segment (arcdocdb.wal::log-io-file-id
                          (arcdocdb.active:log-segmento-attivo-preparato (e::motore-active engine)))))
            (assert (= 7 (e:scrivi-documento engine live (value 9))))
            (setf (aref live-words 0) 7 (aref live-words 1) (logior (ash segment 32) start)
                  (aref live-words 2) #x1001000000000 (aref live-words 3) 63))
          (assert (= 8 (e:cancella-documento engine tombstone)))
          (unwind-protect
               (progn
                 (setf (e::motore-busy engine) t (e::motore-index engine) nil)
                 (location-allocation-windows engine live live-words :live version :delta-live)
                 (location-allocation-windows engine tombstone absent-words :absent version :delta-tombstone)
                 (location-allocation-windows engine base base-words :live version :base-live))
            (setf (e::motore-busy engine) nil (e::motore-index engine) resident)))))))
(format t "~&~S~%" '(:schema-version 1 :kind :m1-location-delta-allocation :status :passed
                      :windows 30 :calls-per-window 100000 :measured-lookups 3000000
                      :scope :serial-preallocated-lookup :rss-qualified nil :throughput-claim nil))
