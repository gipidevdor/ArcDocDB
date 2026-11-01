;;;; C4: real production CLI; only primary storage pressure is selected before READY.
(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd"))
(let ((*standard-output* *error-output*)) (asdf:load-system "arcdocdb/local"))
(handler-case
    (let* ((args (uiop:command-line-arguments)) (mode (car (last args)))
           (open (symbol-function 'arcdocdb.engine:apri-motore)))
      (unless (member mode '("resident" "paged") :test #'equal) (error "Invalid C4 mode"))
      (setf (symbol-function 'arcdocdb.engine:apri-motore)
            (lambda (&rest values)
              (let ((engine (apply open values)))
                (when (equal mode "paged")
                  (arcdocdb.engine:configura-budget-indice-motore engine
                    (getf (arcdocdb.engine:statistiche-indice-motore engine) :reserved-fixed)))
                (unless (eq (if (equal mode "paged") :paged :resident) (arcdocdb.engine:modo-indice-motore engine))
                  (error "Wrong actual primary mode"))
                (with-standard-io-syntax
                  (write (list :kind :buffered-server :mode (arcdocdb.engine:modo-indice-motore engine)) :stream *error-output*)
                  (terpri *error-output*) (finish-output *error-output*)) engine)))
      (arcdocdb.local::server-cli-main (butlast args)))
  (error (cause) (format *error-output* "BUFFERED-SERVER-FAIL ~A~%" cause) (sb-ext:exit :code 1)))
