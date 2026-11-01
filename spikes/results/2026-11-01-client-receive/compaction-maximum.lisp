;;;; C4: maximum retained suffix allocation, separate process; no CPU/latency claim during qualification.
(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd")) (asdf:load-system "arcdocdb/local")
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(let ((client (arcdocdb.local::make-local-client :state :ready)) (sum 0))
  (fill (arcdocdb.local::local-client-input client) #xa5)
  (sb-ext:gc :full t)
  (let ((before (sb-ext:get-bytes-consed)))
    (dotimes (i 10000)
      (setf (arcdocdb.local::local-client-input-consumed client) 16
            (arcdocdb.local::local-client-input-received client) 65540)
      (incf sum (arcdocdb.local::compact-local-client-input client 65536)))
    (let ((allocated (- (sb-ext:get-bytes-consed) before)))
      (assert (= sum 655240000))
      (assert (every (lambda (n) (= n #xa5)) (arcdocdb.local::local-client-input client)))
      (format t "~S~%" (list :kind :client-maximum-suffix-allocation :status :passed :operations 10000
                             :suffix-bytes 65524 :allocated-bytes allocated :scope :allocation-only)))))
