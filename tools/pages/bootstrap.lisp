;;;; Install the hash-locked documentation toolchain without modifying Quicklisp.
(require :asdf)
(declaim (optimize (safety 3) (debug 2)))
(defpackage #:arcdocdb.pages.bootstrap (:use #:cl))
(in-package #:arcdocdb.pages.bootstrap)

(defparameter *root*
  (uiop:pathname-parent-directory-pathname
   (uiop:pathname-parent-directory-pathname
    (uiop:pathname-directory-pathname *load-truename*))))
(defparameter *work* (merge-pathnames "_build/docs/" *root*))

(defun command (&rest arguments)
  (uiop:run-program arguments :output :string :error-output :interactive))

(defun digest (file)
  (subseq (command "shasum" "-a" "256" "--" (namestring file)) 0 64))

(defun simple-name-p (name)
  (and (stringp name) (plusp (length name))
       (not (member name '("." "..") :test #'equal))
       (every (lambda (c) (or (find c "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-"))) name)))

(defun digest-p (text)
  (and (stringp text) (= (length text) 64)
       (every (lambda (c) (find c "0123456789abcdef")) text)))

(defun member-safe-p (name directory)
  (let ((parts (uiop:split-string name :separator '(#\/))))
    (and (equal (first parts) directory)
         (not (member ".." parts :test #'equal))
         (not (find #\Return name))
         (not (find #\Newline name)))))

(defun self-test ()
  (assert (simple-name-p "codex-20241012-git"))
  (assert (not (simple-name-p "../outside")))
  (assert (not (simple-name-p "..")))
  (assert (digest-p (make-string 64 :initial-element #\a)))
  (assert (not (digest-p (make-string 64 :initial-element #\z))))
  (assert (member-safe-p "codex/src/main.lisp" "codex"))
  (assert (not (member-safe-p "codex/../outside" "codex")))
  (assert (not (member-safe-p "/codex/src" "codex")))
  (format t "Documentation bootstrap checks: 8 passed.~%"))

(defun download (entry)
  (let* ((sha256 (getf entry :sha256)) (url (getf entry :url))
         (file (merge-pathnames (concatenate 'string "archives/" sha256) *work*)))
    (unless (and (digest-p sha256) (uiop:string-prefix-p "https://" url))
      (error "Documentation lock: invalid digest or URL in ~S" entry))
    (ensure-directories-exist file)
    (unless (and (probe-file file) (equal (digest file) sha256))
      (let ((temporary (make-pathname :type "tmp" :defaults file)))
        (unwind-protect
             (progn
               (command "curl" "--fail" "--location" "--silent" "--show-error"
                        "--proto" "=https" "--proto-redir" "=https"
                        "--connect-timeout" "20" "--max-time" "180"
                        "--retry" "2" "--max-filesize" "33554432"
                        "--output" (namestring temporary) url)
               (unless (equal (digest temporary) sha256)
                 (error "Documentation dependency SHA256 mismatch: ~A" url))
               (when (probe-file file) (delete-file file))
               (rename-file temporary file))
          (when (probe-file temporary) (delete-file temporary)))))
    file))

(defun extract (archive directory destination)
  (unless (simple-name-p directory) (error "Invalid documentation archive root: ~A" directory))
  (dolist (name (uiop:split-string (command "tar" "-tzf" (namestring archive)) :separator '(#\Newline)))
    (unless (or (equal name "") (member-safe-p name directory))
      (error "Unsafe documentation archive member: ~A" name)))
  (dolist (line (uiop:split-string (command "tar" "-tvzf" (namestring archive)) :separator '(#\Newline)))
    (unless (or (equal line "") (find (char line 0) "-d"))
      (error "Only regular files/directories are allowed in documentation archives: ~A" line)))
  (command "tar" "--no-same-owner" "--no-same-permissions" "-xzf" (namestring archive)
           "-C" (namestring destination)))

(defun setup ()
  (let* ((*read-eval* nil)
         (lock (with-open-file (in (merge-pathnames "tools/pages/dependencies.lock.lisp" *root*))
                 (read in)))
         (sources (getf lock :archives)) (assets (getf lock :assets))
         (software (merge-pathnames "software/" *work*))
         (staging (merge-pathnames "software-next/" *work*)))
    (unless (= (getf lock :schema) 1) (error "Unsupported documentation lock schema."))
    ;; Always unpack verified archives again. A locally modified cached source
    ;; must not silently change a future build. Compiled files live elsewhere.
    (when (probe-file staging) (uiop:delete-directory-tree staging :validate t))
    (ensure-directories-exist staging)
    (unwind-protect
         (progn
           (loop for entry in sources for n from 1 do
             (extract (download entry) (getf entry :directory) staging)
             (when (zerop (mod n 10)) (format t "Verified ~D documentation archives.~%" n)))
           (when (probe-file software) (uiop:delete-directory-tree software :validate t))
           (rename-file staging software)
           (dolist (entry assets)
             (unless (simple-name-p (getf entry :name)) (error "Invalid browser asset name."))
             (let ((target (merge-pathnames (concatenate 'string "vendor/" (getf entry :name)) *work*)))
               (ensure-directories-exist target)
               (uiop:copy-file (download entry) target))))
      (when (probe-file staging) (uiop:delete-directory-tree staging :validate t)))
    (format t "Documentation toolchain verified: ~D Lisp archives, ~D browser assets.~%" (length sources) (length assets))))

(let ((arguments (uiop:command-line-arguments)))
  (cond ((equal arguments '("--self-test")) (self-test))
        ((null arguments) (setup))
        (t (error "Usage: bootstrap.lisp [--self-test]"))))
