;;;; C4: isolated empty/suffix compaction allocations; excludes transport and envelope decoding.
(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd")) (asdf:load-system "arcdocdb/local")
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(dolist (consumed '(16 32))
  (let ((client (arcdocdb.local::make-local-client :state :ready)) (sum 0))
    (fill (arcdocdb.local::local-client-input client) #xa5)
    (sb-ext:gc :full t)
    (let ((before (sb-ext:get-bytes-consed)) (cpu (get-internal-run-time)))
      (dotimes (i 10000)
        (setf (arcdocdb.local::local-client-input-consumed client) consumed
              (arcdocdb.local::local-client-input-received client) 32)
        (incf sum (arcdocdb.local::compact-local-client-input client 65536)))
      (let ((allocated (- (sb-ext:get-bytes-consed) before)) (ticks (- (get-internal-run-time) cpu)))
        (assert (= sum (* 10000 (- 32 consumed))))
        (assert (every (lambda (n) (= n #xa5)) (arcdocdb.local::local-client-input client)))
        (format t "~S~%" (list :kind :client-input-compaction-cost :status :passed :consumed consumed :received 32
                               :operations 10000 :allocated-bytes allocated :cpu-ticks ticks
                               :ticks-per-second internal-time-units-per-second))))))
