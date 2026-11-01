;;;; C4: fixed-shape timing validation, complete vectors retained separately.
;;; REQ: REQ-VAL-001 REQ-AFF-014
(require :asdf)
(load "tools/evidence-storage.lisp")
(defun comparison-median (numbers)
  (let* ((ordered (sort (copy-list numbers) #'<)) (n (length ordered)) (mid (floor n 2)))
    (unless (plusp n) (error "No timing samples."))
    (if (oddp n) (nth mid ordered) (/ (+ (nth (1- mid) ordered) (nth mid ordered)) 2d0))))
(defun comparison-valid (data)
  (unless (and (eq :ok (getf data :status)) (eql 1 (getf data :schema-version))
               (eq :backup-comparison-benchmark (getf data :kind))
               (= 5 (getf data :rounds)) (= 8 (getf data :iterations-per-window))
               (= 16777253 (getf data :file-bytes)) (eq t (getf data :baseline-body-verified))
               (member (getf data :order) '((:scalar :product :product :scalar)
                                          (:product :scalar :scalar :product)) :test #'equal)
               (= 60 (length (getf data :rows)))) (error "Invalid benchmark envelope."))
  (loop for buffer in '(4096 65536 1048576) for group from 0 do
    (dotimes (round 5)
      (loop for variant in (getf data :order) for phase from 0
            for row = (nth (+ (* group 20) (* round 4) phase) (getf data :rows))
            for window = (getf row :window) do
              (unless (and (= buffer (getf row :buffer-bytes)) (= round (getf row :round))
                           (eq variant (getf row :variant))
                           (typep (getf window :seconds) '(real (0) *))
                           (typep (getf window :cpu-seconds) '(real 0 *))
                           (typep (getf window :managed-bytes) '(integer 0 *))
                           (= 134218024 (getf window :useful-bytes))
                           (= 268436048 (getf window :physical-read-bytes)))
                (error "Invalid window: ~D/~D/~D" buffer round phase)))))
  t)
(defun comparison-summary (data)
  (comparison-valid data)
  (loop for buffer in '(4096 65536 1048576) collect
    (let ((variants nil) (times nil))
      (dolist (variant '(:scalar :product))
        (let* ((rows (remove-if-not (lambda (row) (and (= buffer (getf row :buffer-bytes))
                                                      (eq variant (getf row :variant)))) (getf data :rows)))
               (seconds (comparison-median (mapcar (lambda (row) (getf (getf row :window) :seconds)) rows))))
          (push seconds times)
          (push (list :variant variant :samples (length rows) :median-seconds seconds
                      :useful-mb-per-second (/ 134.218024d0 seconds)
                      :maximum-managed-bytes (reduce #'max rows :key (lambda (row) (getf (getf row :window) :managed-bytes))))
                variants)))
      (list :buffer-bytes buffer :product-speedup (/ (second times) (first times))
            :variants (nreverse variants)))))
(defun comparison-fixture ()
  (list :schema-version 1 :kind :backup-comparison-benchmark :status :ok
        :rounds 5 :iterations-per-window 8 :file-bytes 16777253 :baseline-body-verified t
        :order '(:scalar :product :product :scalar)
        :rows (loop for buffer in '(4096 65536 1048576) append
                (loop for round below 5 append
                  (loop for variant in '(:scalar :product :product :scalar) collect
                    (list :buffer-bytes buffer :round round :variant variant
                          :window (list :seconds (if (eq variant :scalar) 2d0 1d0)
                                        :cpu-seconds 1d0 :managed-bytes 0
                                        :useful-bytes 134218024 :physical-read-bytes 268436048)))))))
(let ((arguments (uiop:command-line-arguments)))
  (cond ((equal arguments '("--self-test"))
         (assert (= 2.5d0 (comparison-median '(4d0 1d0 3d0 2d0))))
         (assert (= 2 (comparison-median '(3 1 2))))
         (assert (handler-case (progn (comparison-median nil) nil) (error () t)))
         (assert (handler-case (progn (comparison-valid '(:status :failed)) nil) (error () t)))
         (assert (every (lambda (row) (= 2d0 (getf row :product-speedup)))
                        (comparison-summary (comparison-fixture))))
         (dolist (damage '(:zero-time :missing-row :wrong-variant :wrong-bytes :unverified-baseline))
           (let* ((data (comparison-fixture)) (row (first (getf data :rows))))
             (ecase damage
               (:zero-time (setf (getf (getf row :window) :seconds) 0d0))
               (:missing-row (pop (getf data :rows)))
               (:wrong-variant (setf (getf row :variant) :product))
               (:wrong-bytes (incf (getf (getf row :window) :useful-bytes)))
               (:unverified-baseline (setf (getf data :baseline-body-verified) nil)))
             (assert (handler-case (progn (comparison-valid data) nil) (error () t)))))
         (format t "Comparison analysis self-tests passed.~%"))
        ((and (= 3 (length arguments)) (string= "--analyze" (first arguments)))
         (let* ((source (second arguments)) (data (arcdocdb.evidence:read-evidence source))
                (result (list :schema-version 1 :kind :backup-comparison-analysis :status :ok
                              :input-sha256 (arcdocdb.evidence:file-sha256 source)
                              :rows (comparison-summary data))))
           (with-open-file (out (third arguments) :direction :output :if-exists :error)
             (write result :stream out :readably t :pretty t) (terpri out))
           (write result :readably t :pretty t) (terpri)))
        (t (error "Use --self-test or --analyze INPUT NEW-OUTPUT"))))
