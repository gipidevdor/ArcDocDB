;;;; C4: lettura nativa senza reset, esclusioni o modifica dei bit.
(require :asdf)
(defun recovery-id-native-counts (row)
  (let ((paths (second row)) (bits (cddr row))
        (forms 0) (covered 0) (branches 0) (taken 0) (missing nil))
    (unless (and (vectorp paths) (typep bits 'bit-vector) (= (length paths) (length bits)))
      (error "Forma nativa non valida."))
    (loop for path across paths for bit across bits for index from 0 do
      (if (member (first path) '(:then :else))
          (progn (incf branches) (incf taken bit))
          (progn (incf forms) (incf covered bit)))
      (when (zerop bit) (push (list index path) missing)))
    (list :forms covered :total-forms forms :branches taken :total-branches branches
          :missing (nreverse missing))))
(defun recovery-id-audit-self-test ()
  (unless (equal (recovery-id-native-counts '("fixture" #((0) (:then 1) (:else 1)) . #*110))
                 '(:forms 1 :total-forms 1 :branches 1 :total-branches 2 :missing ((2 (:else 1)))))
    (error "Oracolo nativo del lettore fallito."))
  (let ((rejected nil))
    (handler-case (recovery-id-native-counts '("fixture" #((0)) . #*10))
      (error () (setf rejected t)))
    (unless rejected (error "Mismatch nativo non rifiutato."))))
(recovery-id-audit-self-test)
(let* ((*read-eval* nil)
       (rows (with-open-file (input "spikes/out/recovery-id-coverage/coverage-state.lisp") (read input)))
       (selected (remove-if-not (lambda (row) (uiop:string-suffix-p
                                             (first row) "/src/recovery/inventory-id.lisp")) rows)))
  (unless (= 1 (length selected)) (error "Sorgente assente o ambiguo."))
  (let* ((counts (recovery-id-native-counts (first selected)))
         (html (uiop:read-file-string "spikes/out/recovery-id-coverage/cover-index.html"))
         (position (search "inventory-id.lisp</a>" html))
         (start (and position (search "<tr" html :end2 position :from-end t)))
         (end (and position (search "</tr>" html :start2 position)))
         (row (and start end (subseq html start (+ end 5)))))
    (unless (equal counts '(:forms 71 :total-forms 77 :branches 10 :total-branches 10
                           :missing ((0 (0)) (1 (1)) (2 (2)) (32 (4))
                                     (85 (3 2 5)) (86 (4 2 5)))))
      (error "Copertura nuova o inattesa: ~S" counts))
    (unless (and row (search "<td>71</td><td>77</td>" row)
                     (search "<td>10</td><td>10</td>" row))
      (error "HTML e contatori nativi discordanti."))
    (with-open-file (output "spikes/out/recovery-id-audit/coverage-audit-result.lisp"
                            :direction :output :if-exists :error)
      (write (list :schema-version 1 :kind :recovery-id-coverage-audit :status :ok
                   :self-test :passed :scope '("src/recovery/inventory-id.lisp")
                   :counts counts :exclusions nil :qualification :open
                   :missing-kind '(:in-package :optimize-declaim :ftype-declaim
                                   :ftype-declaim :max-files-default :max-segmenti-default)
                   :native "spikes/out/recovery-id-coverage/coverage-state.lisp"
                   :html-row row) :stream output :pretty t)
      (terpri output))
    (format t "Nuovo file: ~D/~D forme, ~D/~D rami; sei forme non marcate conservate.~%"
            (getf counts :forms) (getf counts :total-forms)
            (getf counts :branches) (getf counts :total-branches))))
