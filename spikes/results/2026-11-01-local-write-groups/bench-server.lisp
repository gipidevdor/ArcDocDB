;;;; C4 child: real public server, choose backend only after READY engine and before listen.
(require :asdf)
(require :sb-posix)
(asdf:load-asd (truename "arcdocdb.asd"))
(asdf:load-system "arcdocdb/local" :verbose nil)
(let ((open (symbol-function 'arcdocdb.engine:apri-motore))
      (serve (symbol-function 'arcdocdb.local:serve-local))
      (paged (member "--index-budget" (uiop:command-line-arguments) :test #'string=)))
  (setf (symbol-function 'arcdocdb.engine:apri-motore)
        (lambda (&rest options)
          (let ((engine (apply open options)))
            (when paged
              (arcdocdb.engine:configura-budget-indice-motore engine
                (getf (arcdocdb.engine:statistiche-indice-motore engine) :reserved-fixed)))
            (unless (eq (arcdocdb.engine:modo-indice-motore engine) (if paged :paged :resident))
              (error "Unexpected initial benchmark backend"))
            (format *error-output* "PROFILE ~A~%" (if paged :paged :resident)) (finish-output *error-output*) engine))
        (symbol-function 'arcdocdb.local:serve-local)
        (lambda (directory archive series path &rest options)
          (apply serve directory archive series path
            :observer (lambda (engine phase)
              (when (eq phase :after-flush)
                (format *error-output* "GROUP-FLUSH ~D~%"
                  (arcdocdb.wal::gruppo-count (arcdocdb.engine::motore-group engine)))
                (finish-output *error-output*)) nil)
            options)))
  (arcdocdb.local::server-cli-main (uiop:command-line-arguments)))
