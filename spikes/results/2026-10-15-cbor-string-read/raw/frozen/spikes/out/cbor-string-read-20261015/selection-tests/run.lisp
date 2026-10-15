;;;; Fixture C4 del solo preparatore ignored; nessun collector o prodotto.
(require :asdf)
(require :sb-posix)
(load "tools/evidence-storage.lisp")
(defpackage #:arcdocdb.selection.fixtures (:use #:cl))
(in-package #:arcdocdb.selection.fixtures)
(defparameter *root* (uiop:pathname-directory-pathname *load-truename*))
(defparameter *helper* (truename (merge-pathnames "../selection/prepare.lisp" *root*)))
(defparameter *expected-blob* "97331bd62bbed68375eeaeac00c7a137fd7544da")
(defvar *checks* 0)

(defun ck (truth text)
  (unless truth (error "Fixture preparatore: ~A" text))
  (incf *checks*) t)

(defun blob (path)
  (string-trim '(#\Space #\Return #\Newline)
               (uiop:run-program (list "git" "hash-object" "--" (namestring path))
                                 :output :string :error-output :string)))

(defun syntax-forms ()
  (let ((*read-eval* nil) (*readtable* (copy-readtable nil))
        (end (gensym "EOF")) (count 0))
    (with-open-file (stream *helper*)
      (loop for form = (read stream nil end) until (eq form end) do (incf count)))
    (ck (= count 7) "Sette forme DATA del preparatore fino a EOF") count))

(defun directory-new (path)
  (ck (not (probe-file path)) "Directory fixture nuova")
  (ensure-directories-exist (uiop:pathname-parent-directory-pathname path))
  (sb-posix:mkdir (namestring path) #o700) path)

(defun write-data (path value)
  (with-open-file (stream path :direction :output :if-exists :error)
    (let ((*print-readably* t) (*print-circle* t))
      (write value :stream stream :pretty t) (terpri stream))) path)

(defun write-bytes (path values)
  (with-open-file (stream path :direction :output :if-exists :error
                              :element-type '(unsigned-byte 8))
    (write-sequence (make-array (length values) :element-type '(unsigned-byte 8)
                               :initial-contents values) stream)) path)

(defun write-text (path value)
  (write-bytes path (sb-ext:string-to-octets value :external-format :utf-8)))

(defun fingerprint (path)
  (list :path (namestring (truename path)) :bytes (arcdocdb.evidence:file-bytes path)
        :sha256 (arcdocdb.evidence:file-sha256 path)))

(defun child (plan directory)
  (let* ((stdout (merge-pathnames "stdout.lisp" directory))
         (stderr (merge-pathnames "stderr.log" directory))
         (argv (list (namestring sb-ext:*runtime-pathname*) "--noinform" "--no-userinit"
                     "--no-sysinit" "--disable-debugger" "--script"
                     (namestring *helper*) (namestring plan)))
         (process nil))
    (unwind-protect
         (progn
           (setf process (uiop:launch-program argv :output stdout :error-output stderr
                            :if-output-exists :error :if-error-output-exists :error
                            :force-shell nil))
           (multiple-value-bind (exit signal)
               (sb-ext:with-timeout 20 (uiop:wait-process process))
             (list :argv argv :exit-code exit :signal signal
                   :stdout (namestring stdout) :stderr (namestring stderr))))
      (when process
        (when (uiop:process-alive-p process) (uiop:terminate-process process :urgent t))
        (sb-ext:with-timeout 5 (uiop:wait-process process))
        (uiop:close-streams process)))))

(defun run-case (name type)
  (let* ((directory (directory-new (merge-pathnames (concatenate 'string name "/") *root*)))
         (source (directory-new (merge-pathnames "source/" directory)))
         (manifest (merge-pathnames "manifest.lisp" directory))
         (plan (merge-pathnames "plan.lisp" directory))
         (before-count *checks*) (sources nil) (snapshot nil) (execution nil) (result nil))
    (handler-case
        (progn
          (ecase type
            (:positive
             (push (write-text (merge-pathnames "note.md" source) "Documento di fixture") sources)
             (push (write-text (merge-pathnames "plain.txt" source) "Testo invariato") sources)
             (push (write-bytes (merge-pathnames ".hidden.bin" source) '(0 255 128 10)) sources))
            (:collision
             (push (write-text (merge-pathnames "foo.md" source) "Markdown") sources)
             (push (write-text (merge-pathnames "foo.md.txt" source) "Target concorrente") sources))
            (:symlink
             (let ((target (directory-new (merge-pathnames "owned-target/" directory)))
                   (link (merge-pathnames "linked-directory" source)))
               (push (write-text (merge-pathnames "payload.txt" target) "Target posseduto dalla fixture") sources)
               (sb-posix:symlink (namestring target) (namestring link))))
            (:depth
             (let ((cursor source))
               (dotimes (index 33)
                 (setf cursor (directory-new (merge-pathnames (format nil "d~2,'0D/" (1+ index)) cursor)))))))
          (setf snapshot (mapcar #'fingerprint sources))
          (write-data plan (list :records nil :roots (list (list name (namestring source)))
                                :frozen nil :destination (namestring manifest)))
          (setf execution (child plan directory))
          (ck (null (getf execution :signal)) "Child senza segnale")
          (if (eq type :positive)
              (let* ((stdout (arcdocdb.evidence:read-evidence (getf execution :stdout)))
                     (data (arcdocdb.evidence:read-evidence manifest))
                     (files (getf data :files))
                     (expected (mapcar (lambda (leaf) (format nil "raw/~A/~A" name leaf))
                                       '(".hidden.bin" "note.md.txt" "plain.txt"))))
                (ck (eql 0 (getf execution :exit-code)) "Positivo exit0")
                (ck (eq :ok (getf stdout :status)) "Riepilogo positivo OK")
                (ck (= 3 (getf stdout :explicit-files) (getf stdout :indexed-before-automatic-files)
                       (length files)) "Tre file anche dopo SORT, hidden incluso")
                (ck (and (eql 1 (getf data :schema-version))
                         (eq :command-archive-manifest (getf data :kind))
                         (null (getf data :processes))) "Manifest sintetico senza processi")
                (ck (equal expected (mapcar (lambda (row) (getf row :path)) files)) "Mapping MD e ordine esatti")
                (loop for row in files for leaf in '(".hidden.bin" "note.md" "plain.txt") do
                  (ck (equal (namestring (truename (merge-pathnames leaf source))) (getf row :source))
                      "Fonte esplicita esatta"))
                (ck (zerop (arcdocdb.evidence:file-bytes (getf execution :stderr))) "Positivo stderr vuoto"))
              (let ((stderr (uiop:read-file-string (getf execution :stderr))))
                (ck (and (integerp (getf execution :exit-code)) (plusp (getf execution :exit-code)))
                    "Negativo exit nonzero")
                (ck (not (probe-file manifest)) "Nessun manifest pubblicato dal negativo")
                (ck (plusp (length stderr)) "Diagnostico negativo conservato")
                (ecase type
                  (:collision (ck (search "GETHASH" stderr :test #'char-equal) "Rifiuto per target duplicato"))
                  (:symlink (ck (search "S-ISDIR" stderr :test #'char-equal) "Rifiuto lstat directory symlink"))
                  (:depth (ck (and (search "(<= DEPTH 32)" stderr :test #'char-equal)
                                   (search "DEPTH = 33" stderr :test #'char-equal))
                              "Rifiuto preciso profondita33")))))
          (ck (equal snapshot (mapcar #'fingerprint sources)) "Fonti fixture immutate")
          (ck (string= *expected-blob* (blob *helper*)) "Helper immutato dopo child")
          (setf result (list :name name :status :ok :expected type :execution execution
                            :plan (namestring plan) :manifest (namestring manifest)
                            :source-snapshots snapshot :checks (- *checks* before-count))))
      (error (condition)
        (setf result (list :name name :status :failed :expected type :execution execution
                          :plan (namestring plan) :manifest (namestring manifest)
                          :checks (- *checks* before-count) :diagnostic (princ-to-string condition)))))
    (write-data (merge-pathnames "result.lisp" directory) result) result))

(let* ((started (get-universal-time))
       (before (blob *helper*))
       (forms (syntax-forms))
       (cases nil))
  (ck (string= *expected-blob* before) "Pin helper atteso prima dei child")
  (dolist (entry '(("01-positive" :positive) ("02-collision" :collision)
                   ("03-symlink" :symlink) ("04-depth33" :depth)))
    (push (run-case (first entry) (second entry)) cases))
  (let ((report (list :schema-version 1 :kind :selection-preparer-fixtures
                      :status (if (every (lambda (row) (eq :ok (getf row :status))) cases) :ok :failed)
                      :started-at-universal-time started :finished-at-universal-time (get-universal-time)
                      :helper-blob-before before :helper-blob-after (blob *helper*)
                      :helper-data-forms forms :read-eval nil :eof t
                      :checks *checks* :cases (nreverse cases)
                      :limits '(:synthetic-plans-without-processes :collector-not-invoked
                                :no-product-load-or-compilation :no-production-campaigns
                                :owned-symlink-and-depth-fixtures-preserved))))
    (write-data (merge-pathnames "report.lisp" *root*) report)
    (write report :pretty t) (terpri)
    (unless (eq :ok (getf report :status)) (sb-ext:exit :code 1))))
