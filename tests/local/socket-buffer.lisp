;;;; Full-frame kernel grants: deterministic boundaries and actual qualified native acquisition.
(in-package #:arcdocdb.local.native.tests)

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-socket-buffer-invalid-capability-before-effects
  (let* ((calls 0) (backend (n::make-native-backend :control
                            (lambda (&rest args) (declare (ignore args)) (incf calls) (values 0 0)))))
    (dolist (fd '(-1 2147483648 nil "fd"))
      (rejects arcdocdb.conditions:invalid-argument (n::%native-configure-buffers fd backend)))
    (rejects arcdocdb.conditions:invalid-argument (n::%native-configure-buffers 0 :invalid))
    (is (zerop calls))))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(deftest test-REQ-LIM-003-socket-buffer-independent-thresholds-and-doubled-readback
  (dolist (factor '(1 2))
    (dolist (send '(1 8192 65539 65540 65541 2147483647))
      (dolist (receive '(1 8192 65539 65540 65541 2147483647))
        (let* ((grants (vector send receive)) (calls nil) (sets 0)
               (backend (n::make-native-backend :control
                 (lambda (operation arguments)
                   (push operation calls) (is (eql 0 (first arguments)))
                   (case operation
                     (:send-buffer (values (svref grants 0) 0))
                     (:receive-buffer (values (svref grants 1) 0))
                     ((:set-send-buffer :set-receive-buffer)
                      (is (= 65540 (second arguments))) (incf sets)
                      (setf (svref grants (if (eq operation :set-send-buffer) 0 1)) (* factor 65540)) (values 0 0))
                     (otherwise (error "Unexpected buffer operation")))))))
          (n::%native-configure-buffers 0 backend)
          (let ((small (+ (if (< send 65540) 1 0) (if (< receive 65540) 1 0))))
            (is (= sets small)) (is (= (length calls) (+ 2 (* small 2)))))
          (is (= (svref grants 0) (if (< send 65540) (* factor 65540) send)))
          (is (= (svref grants 1) (if (< receive 65540) (* factor 65540) receive))))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-socket-buffer-invalid-initial-grant-stops-before-setting
  (dolist (direction '(:send-buffer :receive-buffer))
    (dolist (grant '(0 -2 nil "size" 2147483648))
      (let* ((calls nil) (backend (n::make-native-backend :control
                (lambda (operation arguments) (declare (ignore arguments)) (push operation calls)
                  (values (if (eq operation direction) grant 65540) 0)))))
        (rejects n::native-error (n::%native-configure-buffers 0 backend))
        (is (equal (reverse calls) (if (eq direction :send-buffer) '(:send-buffer) '(:send-buffer :receive-buffer))))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-socket-buffer-set-and-readback-rejected-without-retry
  (dolist (direction '(:send-buffer :receive-buffer))
    (dolist (case '(:get-error :set-error :set-result :readback-small :readback-type :readback-error))
      (let* ((calls nil) (gets 0) (set-op (if (eq direction :send-buffer) :set-send-buffer :set-receive-buffer))
             (backend (n::make-native-backend :control
               (lambda (operation arguments)
                 (declare (ignore arguments)) (push operation calls)
                 (cond
                   ((eq operation direction)
                    (incf gets)
                    (cond ((eq case :get-error) (values -1 sb-posix:eintr))
                          ((= gets 1) (values 8192 0))
                          ((eq case :readback-error) (values -1 sb-posix:eintr))
                          (t (values (if (eq case :readback-type) nil 65539) 0))))
                   ((eq operation set-op) (if (eq case :set-error) (values -1 sb-posix:eintr)
                                             (values (if (eq case :set-result) 1 0) 0)))
                   (t (is (eq operation :send-buffer)) (values 65540 0)))))))
        (rejects n::native-error (n::%native-configure-buffers 0 backend))
        (is (= (count set-op calls) (if (eq case :get-error) 0 1)))
        (is (= gets (if (member case '(:readback-small :readback-type :readback-error)) 2 1)))
        (when (eq direction :send-buffer) (is (not (member :receive-buffer calls))))))))

;;; REQ: REQ-IPC-003 REQ-AFF-004
(deftest test-REQ-IPC-003-socket-buffer-failure-consumes-new-or-accepted-fd-once
  (dolist (kind '(:new :accepted))
    (dolist (close-error '(nil t))
      (let ((calls nil) (backend nil) (seen nil))
        (setf backend (n::make-native-backend :control
          (lambda (operation arguments)
            (push (cons operation arguments) calls)
            (case operation
              ((:socket :accept) (values 0 0))
              (:configure (n::%native-configure-buffers (first arguments) backend) (values 0 0))
              (:send-buffer (values 8192 0))
              (:set-send-buffer (values -1 sb-posix:eintr))
              (:close (if close-error (values -1 sb-posix:eio) (values 0 0)))
              (otherwise (error "Unexpected configuration step"))))))
        (handler-case
            (if (eq kind :new) (n::native-socket-new :backend backend) (n::native-accept 9 :backend backend))
          (n::native-error (condition)
            (setf seen t) (is (typep (n::native-error-primary condition) 'n::native-error))
            (is (= (length (n::native-error-cleanup condition)) (if close-error 1 0)))))
        (is seen) (is (= 1 (count :close calls :key #'car)))
        (is (= 1 (count :set-send-buffer calls :key #'car)))
        (is (equal '(0) (cdr (find :close calls :key #'car))))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-socket-buffer-native-int-option-size-and-result
  (let ((original (symbol-function 'n::%native-getsockopt)))
    (unwind-protect
      (dolist (spec '((0 4 65540) (0 0 65540) (0 8 65540) (1 4 65540)))
        (destructuring-bind (result length grant) spec
          (setf (symbol-function 'n::%native-getsockopt)
            (lambda (fd level option value size)
              (is (= fd 0)) (is (= level n::+native-sol-socket+)) (is (= option n::+native-so-send-buffer+))
              (setf (sb-alien:deref value) grant (sb-alien:deref size) length) result))
          (if (equal spec '(0 4 65540))
              (is (equal '(65540 0) (multiple-value-list (n::%native-buffer-size 0 n::+native-so-send-buffer+))))
              (rejects n::native-error (n::%native-buffer-size 0 n::+native-so-send-buffer+)))))
      (setf (symbol-function 'n::%native-getsockopt) original)))
  (let ((original (symbol-function 'n::%native-setsockopt)) (calls 0))
    (unwind-protect
      (progn
        (setf (symbol-function 'n::%native-setsockopt)
          (lambda (fd level option value size)
            (incf calls) (is (= fd 0)) (is (= level n::+native-sol-socket+))
            (is (= option n::+native-so-receive-buffer+)) (is (= 4 size))
            (is (= 65540 (sb-alien:deref value))) 0))
        (is (equal '(0 0) (multiple-value-list (n::%native-set-buffer 0 n::+native-so-receive-buffer+ 65540))))
        (is (= calls 1)))
      (setf (symbol-function 'n::%native-setsockopt) original))))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(deftest test-REQ-IPC-002-socket-buffer-native-failure-preserves-errno
  (dolist (direction (list n::+native-so-send-buffer+ n::+native-so-receive-buffer+))
    (is (equal (list -1 sb-posix:ebadf)
               (multiple-value-list (n::%native-buffer-size 2147483647 direction))))
    (is (equal (list -1 sb-posix:ebadf)
               (multiple-value-list (n::%native-set-buffer 2147483647 direction 65540))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-IPC-002-real-socket-full-frame-grants-flags-and-larger-grant-preserved
  (let ((fd (n::native-socket-new)))
    (unwind-protect
      (progn
        (is (not (zerop (logand n::+native-fd-cloexec+ (sb-posix:fcntl fd sb-posix:f-getfd)))))
        (is (not (zerop (logand sb-posix:o-nonblock (sb-posix:fcntl fd sb-posix:f-getfl)))))
        (dolist (direction '(:send-buffer :receive-buffer))
          (is (>= (n::%native-required nil direction fd) 65540)))
        (is (zerop (n::%native-required nil :set-send-buffer fd 131080)))
        (let ((larger (n::%native-required nil :send-buffer fd)))
          (is (>= larger 131080)) (n::%native-configure-buffers fd)
          (is (= larger (n::%native-required nil :send-buffer fd)))))
      (n::close-local-socket fd))))
