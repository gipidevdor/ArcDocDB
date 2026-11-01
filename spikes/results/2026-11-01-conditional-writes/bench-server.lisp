;;;; C4 server wrapper: exact forced paged case, product actor/strong writer unchanged.
(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd"))
(let ((*standard-output* *error-output*)) (asdf:load-system "arcdocdb/local"))
(let ((open (symbol-function 'arcdocdb.engine:apri-motore))
      (paged (member "3400000" (uiop:command-line-arguments) :test #'string=)))
  (setf (symbol-function 'arcdocdb.engine:apri-motore)
        (lambda (&rest args)
          (let ((engine (apply open args)))
            (when paged (arcdocdb.engine:configura-budget-indice-motore engine
                          (getf (arcdocdb.engine:statistiche-indice-motore engine) :reserved-fixed)))
            (unless (eq (if paged :paged :resident) (arcdocdb.engine:modo-indice-motore engine))
              (error "Benchmark primary mode mismatch")) engine)))
  (arcdocdb.local::server-cli-main (uiop:command-line-arguments)))
