;;;; Manifesto C4: conserva input espliciti; non avvia raccolta o prodotto.
;;;; CLI: --write NEWMANIFEST [--process LABEL REPORT] [--tree LABEL DIR all|lisp-and-log]
;;;;      [--file RELATIVE SOURCE]. Gli extra devono essere congelati dal coordinatore.
(require :asdf)
(let ((*load-verbose* nil) (*load-print* nil) (*standard-output* *error-output*))
  (load "tools/evidence-storage.lisp"))
(defpackage #:arcdocdb.cbor-map.collection-manifest (:use #:cl))
(in-package #:arcdocdb.cbor-map.collection-manifest)
(declaim (optimize (safety 3) (debug 3)))

(defparameter *base* "spikes/out/cbor-map-write-20261014/")
(defparameter *initial-processes* nil)
(defparameter *initial-trees* nil)
(defparameter *initial-files* nil)

(defun relative-label-p (value)
  "Etichetta collector relativa semplice; nessun attraversamento o glob."
  (and (stringp value) (<= 1 (length value) 4096)
       (not (find-if (lambda (character)
                       (or (< (char-code character) 32) (= (char-code character) 127)
                           (find character "\\:*?[]"))) value))
       (every (lambda (part) (and (plusp (length part))
                                 (not (member part '("." "..") :test #'string=))))
              (uiop:split-string value :separator "/"))))

(defun tree-mode (word)
  "Due modalità nominali soltanto, senza lettura di forme dalla CLI."
  (cond ((string= word "all") :all)
        ((string= word "lisp-and-log") :lisp-and-log)
        (t (error "Modalità albero non ammessa: ~S." word))))

(defun parse-options (arguments)
  "Selezione esplicita: nessuna directory latest e nessun albero review/collection live."
  (unless (and (>= (length arguments) 2) (string= "--write" (first arguments)))
    (error "Usare --write NEWMANIFEST e opzionali --process/--tree/--file."))
  (let ((output (second arguments)) (rest (cddr arguments)) (processes nil) (trees nil) (files nil))
    (loop while rest
          for option = (pop rest)
          do (cond ((and (string= option "--process") (>= (length rest) 2))
                    (push (list (pop rest) (pop rest)) processes))
                   ((and (string= option "--tree") (>= (length rest) 3))
                    (let ((label (pop rest)) (directory (pop rest)) (mode (pop rest)))
                      (push (list label directory (tree-mode mode)) trees)))
                   ((and (string= option "--file") (>= (length rest) 2))
                    (push (list (pop rest) (pop rest)) files))
                   (t (error "Argomenti manifesto incompleti o sconosciuti: ~S." option))))
    (values output (nreverse processes) (nreverse trees) (nreverse files))))

(defun selected-files (directory mode)
  "Stessa selezione collector, esclusi i percorsi fasl; file compilati osservati nel piano."
  (let ((files nil))
    (labels ((walk (dir)
               (dolist (file (uiop:directory-files dir))
                 (when (or (eq mode :all)
                           (member (pathname-type file) '("lisp" "log" "gz") :test #'string=))
                   (push file files)))
               (dolist (sub (uiop:subdirectories dir))
                 (unless (find "fasl" (pathname-directory sub) :test #'equal) (walk sub)))))
      (walk directory))
    (sort files #'string< :key #'namestring)))

(defun md-source-p (path)
  "Il suffisso Markdown viene rinominato solo nella destinazione dati."
  (string-equal "md" (or (pathname-type path) "")))

(defun fasl-source-p (path)
  "Cache compilata esclusa, anche quando un self-test lascia il file fuori da fasl/."
  (string-equal "fasl" (or (pathname-type path) "")))

(defun data-label (label source)
  "Ogni origine MD diventa TXT senza modificarne i byte o creare copie preliminari."
  (unless (relative-label-p label) (error "Etichetta relativa invalida: ~S." label))
  (if (and (md-source-p source) (not (string-equal "txt" (or (pathname-type label) ""))))
      (concatenate 'string label ".txt") label))

(defun read-process (entry)
  "Registri soltanto come dati: conserva anche FAILED, richiede processo terminato."
  (destructuring-bind (label path) entry
    (unless (and (relative-label-p label) (not (find #\/ label)))
      (error "Etichetta processo invalida: ~S." label))
    (let ((data (arcdocdb.evidence:read-evidence path :max-expanded-bytes 67108864)))
      (unless (and (eql 1 (getf data :schema-version))
                   (eq :command-verification (getf data :kind))
                   (member (getf data :status) '(:ok :failed))
                   (integerp (getf data :finished-at-universal-time))
                   (integerp (getf data :exit-code)) (stringp (getf data :stdout)))
        (error "Registro assente, invalido o non terminato: ~A." path))
      data)))

(defun referenced-selftest-directories (text)
  "Inventario dai percorsi realmente citati nei report selezionati, mai dalla recenza."
  (let ((cursor 0) (directories nil) (prefix "spikes/out/")
        (worker-prefix "spikes/out/cbor-map-write-20261014/drivers/selftests/"))
    (loop for start = (search prefix text :start2 cursor)
          while start
          for stem-start = (+ start (length prefix))
          for slash = (position #\/ text :start stem-start)
          do (setf cursor (+ start (length prefix)))
             (when slash
               (let* ((stem (subseq text stem-start slash))
                      (worker-p (and (<= (+ start (length worker-prefix)) (length text))
                                     (string= worker-prefix text :start2 start
                                              :end2 (+ start (length worker-prefix)))))
                      (end (if worker-p (position #\/ text :start (+ start (length worker-prefix))) slash)))
                 (when (and end
                            (or worker-p (search "-snapshot-self-test-" stem)
                                (search "-reader-self-test-" stem)
                                (search "-cbor-map-write-worker-self-test-" stem)))
                   (pushnew (subseq text start (1+ end)) directories :test #'string=)))))
    (sort directories #'string<)))

(defun main ()
  "Prepara solo il manifesto. Le copie, i tre SHA e la pubblicazione sono del collector."
  (multiple-value-bind (output extra-processes extra-trees extra-files)
      (parse-options (rest sb-ext:*posix-argv*))
    (let* ((root (truename "./")) (base (merge-pathnames *base* root))
           (processes (append (copy-tree *initial-processes*) extra-processes))
           (requested-trees (append (copy-tree *initial-trees*) extra-trees))
           (fixed-files (loop for (label relative) in *initial-files*
                              collect (list label (namestring (merge-pathnames relative base)))))
           (files (append fixed-files extra-files)) (trees nil) (expanded-files nil)
           (process-labels (make-hash-table :test #'equal)) (targets (make-hash-table :test #'equal))
           (records nil) (tree-inventory nil) (selftest-directories nil) (compiled-excluded nil)
           (destination (merge-pathnames output root)))
      (when (probe-file destination) (error "Manifesto già presente: ~A." destination))
      (labels ((add-target (relative)
                 (unless (relative-label-p relative) (error "Target invalido: ~S." relative))
                 (when (gethash relative targets) (error "Target duplicato: ~A." relative))
                 (setf (gethash relative targets) t))
               (add-file (label path)
                 (let* ((source (truename path)) (name (data-label label source)))
                   (when (fasl-source-p source) (error "File compilato esplicito non ammesso: ~A." source))
                   (add-target (concatenate 'string "raw/" name))
                   (push (list name (namestring source)) expanded-files))))
        (dolist (entry processes)
          (when (gethash (first entry) process-labels) (error "Processo duplicato: ~A." (first entry)))
          (setf (gethash (first entry) process-labels) t)
          (let* ((data (read-process entry)) (source (truename (second entry)))
                 (directory (uiop:pathname-directory-pathname source)))
            (push (list :label (first entry) :path (namestring source) :status (getf data :status)
                        :exit-code (getf data :exit-code) :source-consistency (getf data :source-consistency))
                  records)
            (dolist (file (selected-files directory :all))
              (add-target (format nil "processes/~A/~A" (first entry) (enough-namestring file directory))))
            (dolist (directory (referenced-selftest-directories (getf data :stdout)))
              (pushnew directory selftest-directories :test #'string=))))
        (dolist (tree requested-trees)
          (destructuring-bind (label path mode) tree
            (unless (and (relative-label-p label) (member mode '(:all :lisp-and-log)))
              (error "Albero invalido: ~S." tree))
            (let* ((directory (truename path)) (selected (selected-files directory mode))
                   (rewrite (some (lambda (file) (or (md-source-p file) (fasl-source-p file))) selected)))
              (unless (uiop:directory-pathname-p directory) (error "Albero non directory: ~A." path))
              (when (or (equal directory base)
                        (uiop:subpathp directory (merge-pathnames "review/" base))
                        (and (uiop:subpathp directory (merge-pathnames "collection/" base))
                             (not (uiop:subpathp directory (merge-pathnames "collection/self-test/" base)))))
                (error "Albero live review/collection non ammesso: ~A." directory))
              (push (list :label label :source (namestring directory) :mode mode
                          :selected-files (length selected) :expanded-into-files (not (null rewrite)))
                    tree-inventory)
              (if rewrite
                  (dolist (file selected)
                    (if (fasl-source-p file) (push (namestring file) compiled-excluded)
                        (add-file (format nil "~A/~A" label (enough-namestring file directory)) file)))
                  (progn
                    (push (list label (namestring directory) mode) trees)
                    (dolist (file selected)
                      (add-target (format nil "raw/~A/~A" label (enough-namestring file directory)))))))))
        (dolist (directory selftest-directories)
          (let ((source (truename (merge-pathnames directory root))))
            (unless (some (lambda (tree)
                            (uiop:subpathp source (truename (second tree)))) requested-trees)
              (error "Directory self-test citata ma esclusa dal piano: ~A." source))))
        (dolist (file files) (add-file (first file) (second file))))
      (let ((manifest
              (list :schema-version 1 :processes processes :trees (nreverse trees)
                    :files (sort expanded-files #'string< :key #'first)
                    :preparation-inventory
                    (list :processes (nreverse records) :trees (nreverse tree-inventory)
                          :referenced-selftest-directories (sort selftest-directories #'string<)
                          :compiled-files-excluded (sort compiled-excluded #'string<))
                    :preparation-limits
                    '(:explicit-frozen-inputs :failed-processes-preserved :no-latest-directory-selection
                      :no-live-review-or-collection-tree :markdown-destinations-txt
                      :fasl-directories-and-compiled-files-excluded :no-product-execution
                      :no-collection-or-publication :inventory-not-byte-authentication))))
        (ensure-directories-exist destination)
        (with-open-file (stream destination :direction :output :if-exists :error :external-format :utf-8)
          (let ((*print-readably* t)) (write manifest :stream stream :pretty t) (terpri stream)))
        (let ((*print-readably* t))
          (write (list :schema-version 1 :kind :cbor-map-collection-manifest-preparation
                       :status :ok :manifest (namestring destination)
                       :process-count (length processes) :tree-count (length (getf manifest :trees))
                       :explicit-file-count (length expanded-files)
                       :referenced-selftest-directories (getf (getf manifest :preparation-inventory)
                                                             :referenced-selftest-directories))
                 :pretty t)
          (terpri))))))

(main)
