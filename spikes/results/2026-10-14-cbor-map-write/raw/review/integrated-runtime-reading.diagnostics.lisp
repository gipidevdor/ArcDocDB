;;;; C4 diagnostic DATA reading only, no product call.
(load "tools/evidence-storage.lisp")
(let ((record (arcdocdb.evidence:read-evidence "spikes/out/4000986074-command-71976-0/report.lisp")))
  (dolist (field '(:stdout :stderr))
    (let ((text (getf record field)))
      (dolist (token '("WARNING:" "STYLE-WARNING:" "Unhandled " "COMPILE-FILE-ERROR"))
        (loop with cursor = 0
              for pos = (search token text :start2 cursor :test #'char-equal)
              while pos
              do (format t "~S ~A pos~D context~S~%" field token pos
                         (subseq text (max 0 (- pos 90)) (min (length text) (+ pos 180))))
                 (setf cursor (+ pos (length token))))))))
