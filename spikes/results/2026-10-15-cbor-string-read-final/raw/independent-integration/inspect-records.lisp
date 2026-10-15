(require :asdf)
(load "tools/evidence-storage.lisp")
(dolist (path '("spikes/out/4001085841-command-55587-0/report.lisp" "spikes/out/4001086070-command-61411-0/report.lisp"
                "spikes/out/4001086038-command-60740-0/report.lisp" "spikes/out/4001085907-command-57424-0/report.lisp"))
  (let* ((record (arcdocdb.evidence:read-evidence path))
         (stdout (getf record :stdout)) (stderr (getf record :stderr))
         (lines (uiop:split-string stdout :separator '(#\Newline))))
    (format t "~%RECORD ~A ~S/exit~S/stable~S/sources~D/HEAD~A command~S~%"
            path (getf record :status) (getf record :exit-code) (getf record :source-consistency)
            (length (getf record :source-blobs-before)) (getf (getf record :environment) :commit) (getf record :command))
    (dolist (line lines)
      (when (and (< (length line) 600)
                 (or (search "build e test:" line) (search " violazioni" line) (search " rotti" line)
                     (search "sbcl --script tools/" line) (search "REQ-" line) (search "Tracci" line)
                     (search "requisit" line :test #'char-equal)))
        (unless (uiop:string-prefix-p "ok    " line) (write-line line))))
    (format t "STDOUT-LAST~%~{~A~%~}STDERR chars~D LAST~%~A~%"
            (last lines 8) (length stderr) (subseq stderr (max 0 (- (length stderr) 1400))))))
