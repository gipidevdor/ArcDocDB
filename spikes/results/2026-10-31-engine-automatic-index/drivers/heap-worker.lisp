(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (c) (unless (typep c 'sb-kernel:redefinition-warning) (error c)))))
  (asdf:load-asd (truename "arcdocdb.asd")) (asdf:load-system "arcdocdb"))
(let* ((args (uiop:command-line-arguments)) (mode (first args)) (root (second args))
       (batch (parse-integer (third args)))
       (archive (make-array 16 :element-type '(unsigned-byte 8) :initial-element 41))
       (series (make-array 16 :element-type '(unsigned-byte 8) :initial-element 73))
       (key (make-array 32768 :element-type '(unsigned-byte 8) :initial-element 19))
       (value (make-array 23 :element-type '(unsigned-byte 8) :initial-element 1))
       (target (make-array 32 :element-type '(unsigned-byte 8) :initial-element 0))
       (engine (arcdocdb.engine:apri-motore root archive series :create (and (string= mode "write") (= batch 0))
                 :clock (lambda () 10) :index-capacity 16 :key-arena-bytes 1024
                 :max-file-bytes 16777216 :max-record-bytes 33000 :max-records 512 :max-segments 64
                 :index-policy (arcdocdb.engine:crea-politica-indice-automatico :budget 8388608 :frames 4))))
  (unwind-protect
       (progn
         (if (string= mode "write")
             (loop for n from (* batch 450) below (min 4096 (* (1+ batch) 450)) do
               (arcdocdb.binary:scrivi-u32 key 32764 n) (fill value (mod n 251))
               (assert (= (1+ n) (arcdocdb.engine:scrivi-documento engine key value))))
             (progn
               (assert (eq :paged (arcdocdb.engine:modo-indice-motore engine)))
               (assert (null (arcdocdb.engine::motore-index engine)))
               (assert (null (arcdocdb.get::vista-get-serie-primary (arcdocdb.engine::motore-view engine))))
               (dotimes (n 4096)
                 (arcdocdb.binary:scrivi-u32 key 32764 n) (fill target 253)
                 (multiple-value-bind (status bytes) (arcdocdb.engine:leggi-documento engine key target)
                   (assert (and (eq status :found) (= bytes 23)))
                   (assert (loop for i below 23 always (= (aref target i) (mod n 251))))))))
         (format t "~&HEAP-BOUND ~S~%" (list :mode mode :batch batch :dynamic-space (sb-ext:dynamic-space-size)
                   :managed-heap-used (sb-kernel:dynamic-usage) :key-bytes (* 4096 32768)
                   :stats (arcdocdb.engine:statistiche-indice-motore engine))))
    (arcdocdb.engine:chiudi-motore engine)))
