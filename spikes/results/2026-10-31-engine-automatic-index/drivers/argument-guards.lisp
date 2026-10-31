(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd")) (asdf:load-system "arcdocdb/tests")
(in-package #:arcdocdb.engine.tests)
(with-root (root)
  (with-engine (engine (automatic-open root :create t))
    (signals arcdocdb.conditions:invalid-argument
      (arcdocdb.get:crea-vista-get-serie (e::motore-scope engine) nil nil (series-id)) :get-missing-lookup)
    (signals arcdocdb.conditions:invalid-argument
      (e:costruisci-indice-paginato-motore engine (build-option 1)) :engine-legacy-profile-required)
    (signals arcdocdb.conditions:invalid-argument
      (e:attiva-indice-paginato-motore engine (build-option 1)) :engine-legacy-profile-required)
    (let ((auto (e::motore-automatic-index engine)))
      (unwind-protect
           (progn
             (setf (e::motore-busy engine) t (e::automatic-index-controller-transitions auto) most-positive-fixnum)
             (signals arcdocdb.conditions:resource-exhausted (e::reserve-automatic-transition engine)
                      :engine-auto-transition-exhausted))
        (setf (e::motore-busy engine) nil (e::automatic-index-controller-transitions auto) 0)))))
(format t "~&ARGUMENT-GUARDS-PASS NIL primary / incompatible maintenance / nonwrapping transition counter~%")
