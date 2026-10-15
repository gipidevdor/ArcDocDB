(require :asdf)
(let* ((p "tools/foundation-coverage.lisp") (s (uiop:read-file-string p)))
 (dolist (pair '(("cbor-item-read|cbor-minimal" . "cbor-item-read|cbor-string-read|cbor-minimal") ("\"cbor-item-read\" \"cbor-minimal\"" . "\"cbor-item-read\" \"cbor-string-read\" \"cbor-minimal\"")))
  (loop for pos = (search (car pair) s) while pos do
   (setf s (concatenate 'string (subseq s 0 pos) (cdr pair) (subseq s (+ pos (length (car pair))))))))
 (with-open-file (out p :direction :output :if-exists :supersede) (write-string s out)))

