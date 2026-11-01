;;;; Compact descriptive rates and paired overheads; no claim about prior-revision regressions or tails.
(require :asdf)
(let* ((*read-eval* nil) (root (uiop:pathname-directory-pathname *load-truename*))
       (metrics (with-open-file (in (merge-pathnames "metrics.lisp" root)) (read in))))
  (labels ((median (values)
             (let* ((v (sort (copy-list values) #'<)) (n (length v)))
               (if (oddp n) (nth (floor n 2) v) (/ (+ (nth (1- (/ n 2)) v) (nth (/ n 2) v)) 2)))))
    (dolist (runtime (getf metrics :runtimes))
      (format t "runtime ~A: ~D samples, ~D operations, ~D timed engine flushes~%"
              (getf runtime :runtime) (getf runtime :samples) (getf runtime :operations) (getf runtime :timed-engine-flushes))
      (dolist (layer '(:engine :unix))
        (let* ((cases (remove-if-not (lambda (r) (eq layer (first (getf r :case)))) (getf runtime :cases)))
          (dolist (comparison '(:version-get-over-get :conditional-put-over-put))
            (let ((ratios (mapcar (lambda (r) (getf r comparison)) cases)))
              (format t "~A ~A cost ratio: median ~,6Fx; range ~,6F..~,6Fx~%" layer comparison (median ratios) (apply #'min ratios) (apply #'max ratios))))
          (dolist (kind '(:get :version-get :put :conditional-put :conflict))
            (let ((costs (mapcar (lambda (r) (getf (getf r :median-microseconds) kind)) cases)))
              (format t "~A ~A median across cases ~,4F us/op; range ~,4F..~,4F; peak ~,0F ops/s~%"
                      layer kind (median costs) (apply #'min costs) (apply #'max costs) (/ 1000000d0 (apply #'min costs)))))))))))
