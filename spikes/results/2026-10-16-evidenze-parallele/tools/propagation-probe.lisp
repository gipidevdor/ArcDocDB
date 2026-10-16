(require :asdf)
(let ((*features* (cons :arcdocdb-evidence-check-library *features*)))
  (load "tools/check-evidence.lisp"))
(load "tools/check-evidence-parallel-tests.lisp")
(let ((root (uiop:ensure-directory-pathname
             (sb-posix:mkdtemp (namestring (merge-pathnames "spikes/out/evidence-propagation-probe-XXXXXX"))))))
  (arcdocdb.evidence.check::ept-scan-propagates (merge-pathnames "generic/" root) nil)
  (arcdocdb.evidence.check::ept-scan-propagates (merge-pathnames "timeout/" root) t)
  (write (list :schema-version 1 :kind :evidence-propagation-probe :status :ok
               :root (namestring root) :checks arcdocdb.evidence.check::*ept-checks*))
  (terpri))
