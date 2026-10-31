(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (c) (unless (typep c 'sb-kernel:redefinition-warning) (error c)))))
  (asdf:load-asd (truename "arcdocdb.asd")) (asdf:load-system "arcdocdb/tests"))
(in-package #:arcdocdb.engine.tests)
(signals arcdocdb.conditions:invalid-argument
  (e:apri-motore "/never-open-this-directory/" (archive-id) (series-id) :clock (lambda () 1) :index-policy :unknown)
  :engine-index-policy)
(signals arcdocdb.conditions:invalid-argument
  (e:apri-motore "/never-open-this-directory/" (archive-id) (series-id) :clock (lambda () 1)
    :index-policy :automatic :index-image (build-option 1)) :engine-auto-legacy-conflict)
(with-root (root)
  (with-engine (engine (automatic-open root :create t :budget 2097152))
    (dotimes (n 300)
      (let ((key (automatic-key n 2048)))
        (e:scrivi-documento engine key (value 1)) (e:cancella-documento engine key)))
    (is (eq :resident (e:modo-indice-motore engine)))
    (is (< (getf (e:statistiche-indice-motore engine) :resident-charge) 32768))
    (is (null (automatic-files root)))))
(let ((original (symbol-function 'arcdocdb.hash64:xxh64)))
  (unwind-protect
       (progn
         (setf (symbol-function 'arcdocdb.hash64:xxh64)
           (lambda (key start end high low) (declare (ignore key start end high low)) (values 5 7)))
         (call-automatic-disk
           (lambda (tree directory root)
             (declare (ignore directory root))
             (let ((keys (loop for size in '(8 16 24 25 128 4096 65535) append
                           (loop for id below 4 collect (automatic-key id size))))
                   (output (make-array 5 :element-type '(unsigned-byte 64))))
               (loop for key in (reverse keys) for csn from 1 do
                 (arcdocdb.index.disk:apply-disk-index tree 1 key 0 (length key) csn #x100000080 (+ 64 (length key))))
               (arcdocdb.index.disk:verify-disk-index tree)
               (dolist (key keys)
                 (is (eq :live (arcdocdb.index.disk:lookup-disk-index tree key 0 (length key) output))))
               (is (eq :absent (arcdocdb.index.disk:lookup-disk-index tree (automatic-key 99 24) 0 24 output)))
               (is (= 28 (arcdocdb.index.disk:disk-index-count tree)))))))
    (setf (symbol-function 'arcdocdb.hash64:xxh64) original)))
(format t "~&SUPPLEMENTAL-PASS invalid-before-IO / 600 resident churn commits / 28 full-collision variable-length keys~%")
