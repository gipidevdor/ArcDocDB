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
(defun read-fragment (name)
  (uiop:read-file-string (concatenate 'string "spikes/out/cbor-item-read-20261015/drivers/" name)))
(let ((text (uiop:read-file-string "spikes/out/cbor-tag-write-20261014/drivers/audit.lisp")))
  (dolist (pair '(("cbor-tag-write-20261014" "cbor-item-read-20261015")
                  ("cbor-tag-write" "cbor-item-read") ("arcdocdb.ctw" "arcdocdb.cir")
                  ("cbor-tag-metodo" "cbor-item-metodo")
                  ("<input-blob> <write-blob>" "<item-blob>")
                  ("REQ-CBR-007" "REQ-CBR-008") ("tag CBOR" "primo item CBOR")
                  ("2026-10-14" "2026-10-15")
                  ("4f4e2ac97f2f9d903dfebfdc6b15553b40e59a84" "702c8172ae1ebad30c683fe5eb5ad66f88e434ea")
                  ("6a8a3180a812088c238f3493fa957cc0" "559682b05cfde7088d738eda0ad7e7a8")
                  ("3175390e496173398781bf8b39170cb33892125f" "a67a79bf4fefe11c4778cd881eb5279a006966ca")
                  ("3c410448af31a28e99fe39f93261ced04f15860d" "c6a22e6751cab0eff88dd1173ed81543d595a659")
                  ("5c0dbc229bfcc07c2d9c9e581affe2ae" "8dfd03d8510d882e533d68b79bab1073")
                  (":cold-arity 1" ":cold-arity 3")))
    (setf text (replace-all text (first pair) (second pair))))
  (setf text (section text ";;; Impronte attese" "(define-condition audit-rejection"
                      (read-fragment "audit-preamble.fragment.txt")))
  (setf text (section text "(defun word-bytes" "(defun independent-sink"
                      (read-fragment "audit-reference.fragment.txt")))
  (setf text (section text "(defun audit-self-controls" "(defun audit-benchmark"
                      (read-fragment "audit-controls.fragment.txt")))
  (setf text (section text "    (require-check (hex-string-p (gethash \"src/codec/cbor-tag-input.lisp\"" "    (require-check (nth-value 1"
"    (require-check (hex-string-p (gethash *item-source* table) 32) :fingerprint-item)
"))
  (setf text (section text "    (require-check (and (hex-string-p *input-blob*" "    (require-check (equal +method-blob+"
"    (require-check (and (hex-string-p *item-blob* 40)
                        (equal *item-blob* (gethash *item-source* table))) :wrapper-item-blob)
"))
  (setf text (section text "(defun synthetic-report" "(defun expected-rejection"
                      (read-fragment "audit-synthetic.fragment.txt")))
  (setf text (section text "(defun reference-self-test" "(defun file-observation"
                      (read-fragment "audit-selftest.fragment.txt")))
  (setf text (section text "(defun main ()" "(main)"
                      (read-fragment "audit-main.fragment.txt")))
  (with-open-file (out "spikes/out/cbor-item-read-20261015/drivers/audit.lisp"
                       :direction :output :if-exists :error :if-does-not-exist :create)
    (write-string text out)))
