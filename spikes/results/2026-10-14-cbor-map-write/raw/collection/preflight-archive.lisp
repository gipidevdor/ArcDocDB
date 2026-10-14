;;;; C4: preflight dei soli budget dell'archivio, senza raccolta o SHA massivi.
;;;; --manifest MANIFEST --destination NEWDEST --report NEWREPORT
;;;; Replica statica di collect.lisp blob 68a9949dff6d270a6caf7d0e466bb391e946998a.
;;;; Le impronte sintetiche servono soltanto alla dimensione: non sono evidenza.
(require :asdf)
(require :sb-posix)
(let ((*standard-output* *error-output*))
  (load "tools/evidence-storage.lisp"))
(defpackage #:arcdocdb.cbor-array.archive-preflight (:use #:cl))
(in-package #:arcdocdb.cbor-array.archive-preflight)
(declaim (optimize (safety 3) (debug 3)))

(defconstant +plain-limit+ 1048576)
(defconstant +gzip-limit+ 8388608)
(defconstant +expanded-limit+ 134217728)
(defconstant +queue-limit+ 100000)
(defconstant +diagnostic-limit+ 100)
(defparameter *synthetic-sha*
  ;; Stessa costruzione di %STREAM-SHA256 trusted: MAP 'STRING poi STRING-DOWNCASE.
  (string-downcase
   (map 'string #'code-char (make-array 64 :element-type '(unsigned-byte 8) :initial-element 97))))
(defparameter *collector-source*
  (merge-pathnames "collect.lisp" (uiop:pathname-directory-pathname *load-truename*)))

(define-condition invalid-preflight (error)
  ((reason :initarg :reason :reader preflight-reason)
   (detail :initarg :detail :reader preflight-detail))
  (:report (lambda (condition stream)
             (format stream "Preflight rifiutato ~S: ~A"
                     (preflight-reason condition) (preflight-detail condition)))))

(defun reject (reason control &rest arguments)
  (error 'invalid-preflight :reason reason :detail (apply #'format nil control arguments)))

(defun demand (value reason control &rest arguments)
  (unless value (apply #'reject reason control arguments)))

(defun exists-p (path)
  "LSTAT rileva anche una destinazione symlink dangling."
  (handler-case
      (progn (sb-posix:lstat (string-right-trim "/" (namestring path))) t)
    (sb-posix:syscall-error (condition)
      (if (= sb-posix:enoent (sb-posix:syscall-errno condition)) nil (error condition)))))

(defun relative-p (value)
  "Stessa politica del collector per nomi e componenti."
  (and (stringp value) (<= 1 (length value) 4096)
       (not (find-if (lambda (character)
                       (or (< (char-code character) 32) (= (char-code character) 127)
                           (find character "\\:*?[]"))) value))
       (let ((parts (uiop:split-string value :separator "/")))
         (and (<= (length parts) 128)
              (every (lambda (part) (and (plusp (length part))
                                         (not (member part '("." "..") :test #'equal))))
                     parts)))))

(defun selected-files (directory &key lisp-and-log-only)
  "Copia della selezione collector: ordinamento e directory fasl escluse."
  (let ((files nil))
    (labels ((walk (dir)
               (dolist (file (uiop:directory-files dir))
                 (when (or (not lisp-and-log-only)
                           (member (pathname-type file) '("lisp" "log" "gz") :test #'equal))
                   (push file files)))
               (dolist (sub (uiop:subdirectories dir))
                 (unless (find "fasl" (pathname-directory sub) :test #'equal) (walk sub)))))
      (walk directory))
    (sort files #'string< :key #'namestring)))

(defun read-one (path)
  "Lettore trusted: plist, read-eval NIL, readtable standard, CL-USER, EOF."
  (let ((*package* (find-package :cl-user)))
    (handler-case
        (arcdocdb.evidence:read-evidence path :max-expanded-bytes +expanded-limit+)
      (arcdocdb.evidence:invalid-evidence (condition) (reject :data-read "~A" condition)))))

(defun proper-list-size (value)
  (demand (listp value) :data-shape "Lista richiesta: ~S" value)
  (let ((size (handler-case (list-length value)
                (type-error () (reject :data-shape "Lista propria richiesta")))))
    (demand (and size (<= size +queue-limit+)) :data-shape "Lista ciclica o oltre limite")
    size))

(defun metadata-shape (data)
  "Forma richiesta dal validator; conserva anche status di fallimento."
  (dolist (key '(:command :status :source-consistency :exit-code))
    (let ((absent (gensym "ABSENT")))
      (demand (not (eq absent (getf data key absent))) :process-metadata "Campo ~S assente" key)))
  (proper-list-size (getf data :command))
  (demand (every #'stringp (getf data :command)) :process-metadata "COMMAND non stringhe")
  (dolist (key '(:status :source-consistency))
    (demand (or (null (getf data key)) (keywordp (getf data key)))
            :process-metadata "~S non keyword/NIL" key))
  (demand (or (null (getf data :exit-code)) (integerp (getf data :exit-code)))
          :process-metadata "EXIT-CODE non intero/NIL"))

(defun plan-collection (manifest-path root)
  "Replica del piano frozen, senza creazione directory, copie o fingerprint."
  (let ((manifest (read-one manifest-path)) (tasks nil) (processes nil)
        (targets (make-hash-table :test #'equal)) (labels (make-hash-table :test #'equal))
        (source-directories nil))
    (demand (and (eql 1 (getf manifest :schema-version)) (getf manifest :processes))
            :manifest "Schema1 e almeno un processo richiesti")
    (labels ((add (source relative)
               (demand (relative-p relative) :relative-path "~S" relative)
               (demand (not (gethash relative targets)) :duplicate-target "~A" relative)
               (demand (< (hash-table-count targets) +queue-limit+) :queue-limit "Piano oltre limite")
               (setf (gethash relative targets) t)
               (push (list (truename source) (merge-pathnames relative root)) tasks)))
      (dolist (record (getf manifest :processes))
        (destructuring-bind (label report-path) record
          (demand (and (relative-p label) (not (find #\/ label))
                       (not (gethash label labels))) :process-label "~S" label)
          (setf (gethash label labels) t)
          (let* ((source (truename report-path)) (base (uiop:pathname-directory-pathname source))
                 (prefix (format nil "processes/~A/" label)) (data (read-one source))
                 (relative (concatenate 'string prefix (file-namestring source))))
            (push base source-directories)
            (demand (and (eql 1 (getf data :schema-version))
                         (eq :command-verification (getf data :kind))) :process-schema "~A" source)
            (metadata-shape data)
            (dolist (file (selected-files base))
              (add file (concatenate 'string prefix (enough-namestring file base))))
            (push (list :label label :record-path relative :status (getf data :status)
                        :exit-code (getf data :exit-code)
                        :source-consistency (getf data :source-consistency)
                        :command (getf data :command)) processes))))
      (dolist (tree (getf manifest :trees))
        (destructuring-bind (label source-directory mode) tree
          (demand (and (relative-p label) (member mode '(:all :lisp-and-log))) :tree "~S" tree)
          (let ((base (truename source-directory)) (prefix (format nil "raw/~A/" label)))
            (push base source-directories)
            (dolist (file (selected-files base :lisp-and-log-only (eq mode :lisp-and-log)))
              (add file (concatenate 'string prefix (enough-namestring file base)))))))
      (dolist (item (getf manifest :files))
        (destructuring-bind (label source) item
          (demand (relative-p label) :relative-path "~S" label)
          (add source (format nil "raw/~A" label))))
      (add manifest-path "collection-manifest.lisp")
      (add *collector-source* "collection-source.lisp"))
    (values (coerce (nreverse tasks) 'vector) (nreverse processes) source-directories)))

(defun rendered-ascii-size (datum)
  "Stesso WRITE pretty del collector; margin80, newline incluso, ASCII verificato."
  (let* ((*print-readably* t) (*print-right-margin* 80)
         (text (with-output-to-string (stream)
                 (write datum :stream stream :pretty t)
                 (terpri stream))))
    (demand (every (lambda (character) (< (char-code character) 128)) text)
            :non-ascii-render "Il rendering contiene non ASCII; nessuna stima UTF-8 approssimata")
    (length text)))

(defun index-datum (files processes)
  "Schema esatto publish-metadata, solo in memoria, mai scritto come indice."
  (list :schema-version 1 :kind :original-command-archive
        :metadata-policy :read-without-result-inference
        :processes processes
        :files (sort files #'string< :key (lambda (entry) (getf entry :path)))
        :limits '(:sha256-byte-copy-check :raw-originals-preserved
                  :fasl-excluded-from-published-mutation-trees
                  :no-requirement-or-release-promotion)))

(defun catalogue-datum (destination)
  (list :schema-version 1 :kind :evidence-catalog :date "2026-10-14"
        :path-base destination :formats nil :entries
        (list (list :kind :original-command-archive :artifact "archive-index.lisp"
                    :artifact-schema-version 1 :artifact-kind :original-command-archive))
        :pending nil))

(defun inspect-plan (tasks processes root destination report)
  "Misure stat reali; SHA solo sintetici, stesso tipo stringa lowercase64hex."
  (let ((files nil) (total 0) (plain-count 0) (gzip-count 0)
        (max-plain 0) (max-gzip 0) (violations nil) (violation-count 0))
    (loop for task across tasks
          for source = (first task)
          for target = (second task)
          for relative = (enough-namestring target root)
          for bytes = (arcdocdb.evidence:file-bytes source)
          for gzip = (equal (pathname-type target) "gz")
          for limit = (if gzip +gzip-limit+ +plain-limit+)
          do (incf total bytes)
             (if gzip (progn (incf gzip-count) (setf max-gzip (max max-gzip bytes)))
                 (progn (incf plain-count) (setf max-plain (max max-plain bytes))))
             (when (> bytes limit)
               (incf violation-count)
               (when (< (length violations) +diagnostic-limit+)
                 (push (list :path relative :source (namestring source) :bytes bytes :limit limit)
                       violations)))
             (push (list :path relative :source (namestring source)
                         :bytes bytes :sha256 *synthetic-sha*) files))
    (setf violations (nreverse violations))
    (setf (getf report :planned-files) (length tasks)
          (getf report :estimated-archive-files) (+ 2 (length tasks))
          (getf report :process-count) (length processes)
          (getf report :indexed-bytes) total
          (getf report :plain-count) plain-count (getf report :gzip-count) gzip-count
          (getf report :max-plain-bytes) max-plain (getf report :max-gzip-bytes) max-gzip
          (getf report :file-budget-violation-count) violation-count
          (getf report :file-budget-violations) violations
          (getf report :omitted-violation-details) (- violation-count (length violations)))
    (let ((index-bytes (rendered-ascii-size (index-datum (nreverse files) processes)))
          (catalogue-bytes (rendered-ascii-size (catalogue-datum destination))))
      (setf (getf report :estimated-index-bytes) index-bytes
            (getf report :estimated-catalogue-bytes) catalogue-bytes
            (getf report :estimated-archive-total-bytes) (+ total index-bytes catalogue-bytes)
            (getf report :index-budget-ok) (<= index-bytes +plain-limit+)
            (getf report :catalogue-budget-ok) (<= catalogue-bytes +plain-limit+))
      (demand (zerop violation-count) :file-budget "~D file oltre budget" violation-count)
      (demand (<= index-bytes +plain-limit+) :index-budget "Indice ~D bytes, limite ~D"
              index-bytes +plain-limit+)
      (demand (<= catalogue-bytes +plain-limit+) :catalogue-budget "Catalogo ~D bytes, limite ~D"
              catalogue-bytes +plain-limit+)))
  report)

(defun save-report-new (path report)
  "Unico artefatto scritto: report di preflight esclusivo, mai un indice sintetico."
  (let ((text (let ((*print-readably* t) (*print-right-margin* 80))
                (with-output-to-string (stream) (write report :stream stream :pretty t) (terpri stream)))))
    (demand (<= (length (sb-ext:string-to-octets text :external-format :utf-8)) +plain-limit+)
            :report-budget "Report oltre budget plain")
    (ensure-directories-exist path)
    (with-open-file (stream path :direction :output :if-exists :error :external-format :utf-8)
      (write-string text stream))))

(defun arguments ()
  (let ((args (uiop:command-line-arguments)))
    (demand (and (= 6 (length args)) (equal "--manifest" (first args))
                 (equal "--destination" (third args)) (equal "--report" (fifth args)))
            :arguments "Usare --manifest MANIFEST --destination NEWDEST --report NEWREPORT")
    (values (second args) (fourth args) (sixth args))))

(defun main ()
  (multiple-value-bind (manifest-path destination report-path) (arguments)
    (let* ((root (merge-pathnames (uiop:ensure-directory-pathname destination) (truename "./")))
           (output (merge-pathnames report-path (truename "./")))
           (report (list :schema-version 1 :kind :archive-preflight :status :running
                         :manifest (namestring (truename manifest-path))
                         :destination destination
                         ;; Chiavi preallocate: le osservazioni sopravvivono a un rifiuto nel callee.
                         :planned-files nil :estimated-archive-files nil
                         :process-count nil :indexed-bytes nil :estimated-archive-total-bytes nil
                         :plain-count nil :gzip-count nil :max-plain-bytes nil :max-gzip-bytes nil
                         :file-budget-violation-count nil :file-budget-violations nil
                         :omitted-violation-details nil :estimated-index-bytes nil
                         :estimated-catalogue-bytes nil :index-budget-ok nil :catalogue-budget-ok nil
                         :limits (list :plain-bytes +plain-limit+ :index-bytes +plain-limit+
                                       :gzip-bytes +gzip-limit+ :planned-files +queue-limit+)
                         :rendering (list :pretty t :right-margin 80 :ascii-required t
                                          :sha-placeholder-type :lowercase-hex-string
                                          :sha-placeholder-length 64 :sha-placeholders-only t)
                         :scope '(:budget-planning-only :no-archive-copies :no-index-published
                                  :no-source-hash-sweep :no-product-loaded
                                  :trusted-reader-may-authenticate-compressed-process-records
                                  :local-size-observation-not-atomic
                                  :collector-rechecks-real-bytes-and-sha))))
      (demand (not (exists-p output)) :existing-report "~A" output)
      (demand (not (uiop:subpathp output root)) :report-location
              "Il report non deve contaminare la futura root")
      (handler-case
          (progn
            (demand (not (exists-p root)) :existing-destination "~A" root)
            (multiple-value-bind (tasks processes source-directories) (plan-collection manifest-path root)
              (dolist (source-directory source-directories)
                (demand (not (uiop:subpathp output source-directory)) :report-location
                        "Il report non deve aggiungere file a un albero selezionato: ~A" source-directory))
              (inspect-plan tasks processes root destination report))
            (setf (getf report :status) :ok))
        (invalid-preflight (condition)
          ;; Non scrivere nemmeno un report fallito dentro una fonte selezionata.
          (when (eq :report-location (preflight-reason condition)) (error condition))
          (setf (getf report :status) :failed (getf report :reason) (preflight-reason condition)
                (getf report :diagnostic) (preflight-detail condition)))
        (error (condition)
          (setf (getf report :status) :failed (getf report :reason) :infrastructure
                (getf report :diagnostic) (princ-to-string condition))))
      (save-report-new output report)
      (let ((*print-readably* t)) (write report :pretty t) (terpri))
      (unless (eq :ok (getf report :status)) (uiop:quit 1)))))

(main)
