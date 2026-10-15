(require :asdf)
(defun replace-all (text before after)
  (with-output-to-string (out)
    (loop with start = 0 for pos = (search before text :start2 start)
          do (write-string text out :start start :end pos)
          while pos do (write-string after out) (setf start (+ pos (length before))))))
(defun section (text begin end replacement)
  (let ((a (search begin text)) (b (search end text)))
    (assert (and a b (< a b)))
    (concatenate 'string (subseq text 0 a) replacement (subseq text b))))
(let ((text (uiop:read-file-string "spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.lisp")))
  (setf text (replace-all text "cbor.tag.integrated.reading" "cbor.item.integrated.reading"))
  (setf text (replace-all text "(let* ((path \"spikes/out/4000997101-check-82864-0/report.lisp\")"
"(let* ((path (reference-path stdout \"10 spike completati; risultati: \"))"))
  (setf text (section text "(let* ((path \"spikes/out/4000996821-command-64571-0/report.lisp\")" "  (let ((data-pins nil))"
                     (uiop:read-file-string "spikes/out/cbor-item-read-20261015/review/integrated-reader-main.fragment.txt")))
  (setf text (replace-all text "stdout \"spikes/out/4000996874-snapshot-self-test-69641-0/report.lisp\""
"stdout (reference-path stdout \"Snapshot: fixture processi conservate in \")"))
  (setf text (replace-all text "stdout \"spikes/out/4000996874-reader-self-test-69697-0/report.lisp\""
"stdout (reference-path stdout \"Reader: fixture processi conservate in \")"))
  (setf text (section text "  (assert (string= descriptor-sha" "  (format t \"FINAL descriptor/payload/reader stable;"
"  (dolist (pin physical-pins) (assert (string= (cdr pin) (arcdocdb.evidence:file-sha256 (car pin)))))
  (assert (string= self-sha (arcdocdb.evidence:file-sha256 self)))
"))
  (setf text (replace-all text "(defun check-selftest"
"(defun reference-path (stdout marker)
  (let* ((start (search marker stdout))
         (a (and start (+ start (length marker))))
         (b (and a (position #\\Newline stdout :start a))))
    (assert a)
    (let ((path (string-trim '(#\\Space #\\Tab #\\Return #\\.) (subseq stdout a b))))
      (assert (probe-file path)) path)))

(defun check-selftest"))
  (setf text (replace-all text "(= sources (length (getf metadata :source-fingerprints-before)))"
"(let ((actual (length (getf metadata :source-fingerprints-before)))) (and (plusp actual) (or (null sources) (= sources actual))))"))
  (setf text (replace-all text "kind sources count (getf metadata :limits)"
"kind (length (getf metadata :source-fingerprints-before)) count (getf metadata :limits)"))
  (setf text (replace-all text ":snapshot-mutation-child 10 21 data-pins" ":snapshot-mutation-child 10 nil data-pins"))
  (setf text (replace-all text ":reader-mutation-child 8 34 data-pins" ":reader-mutation-child 8 nil data-pins"))
  (with-open-file (out "spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading.lisp"
                       :direction :output :if-exists :error :if-does-not-exist :create :external-format :utf-8)
    (write-string text out)))
