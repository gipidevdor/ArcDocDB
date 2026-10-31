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
  (format t "Documentation bootstrap checks: ~D passed.~%" (+ 8 (test-download-cache))))

(defun fetch (url target)
  (command "curl" "--fail" "--location" "--silent" "--show-error"
           "--proto" "=https" "--proto-redir" "=https"
           "--connect-timeout" "20" "--max-time" "180"
           "--retry" "2" "--max-filesize" "33554432"
           "--output" (namestring target) url))

(defun download (entry &optional (fetcher #'fetch))
  (let* ((sha256 (getf entry :sha256)) (url (getf entry :url))
         ;; RENAME-FILE merges a NIL destination type with the source type.
         ;; :UNSPECIFIC keeps this extensionless cache name from inheriting .tmp.
         (file (make-pathname :type :unspecific
                              :defaults (merge-pathnames (concatenate 'string "archives/" sha256) *work*))))
    (unless (and (digest-p sha256) (uiop:string-prefix-p "https://" url))
      (error "Documentation lock: invalid digest or URL in ~S" entry))
    (ensure-directories-exist file)
    (unless (and (probe-file file) (equal (digest file) sha256))
      (let ((temporary (make-pathname :type "tmp" :defaults file)))
        (unwind-protect
             (progn
               (funcall fetcher url temporary)
               (unless (equal (digest temporary) sha256)
                 (error "Documentation dependency SHA256 mismatch: ~A" url))
               (when (probe-file file) (delete-file file))
               (rename-file temporary file))
          (when (probe-file temporary) (delete-file temporary)))))
    file))

(defun test-download-cache ()
  (uiop:with-temporary-file (:pathname marker :prefix "arcdocdb-docs-bootstrap-")
    (let* ((*work* (uiop:ensure-directory-pathname (concatenate 'string (namestring marker) "-cache/")))
           (fixture (merge-pathnames "fixture" *work*)) (calls 0) (count 0)
           (sha256 "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
           (entry (list :url "https://example.invalid/fixture" :sha256 sha256))
           (expected (merge-pathnames (concatenate 'string "archives/" sha256) *work*)))
      (ensure-directories-exist fixture)
      (unwind-protect
           (flet ((check (truth) (incf count) (assert truth))
                  (fixture-fetch (url target)
                    (declare (ignore url)) (incf calls) (uiop:copy-file fixture target)))
             (with-open-file (out fixture :direction :output) (write-string "abc" out))
             (download entry #'fixture-fetch)
             (check (= calls 1))
             (check (probe-file expected))
             (check (equal (digest expected) sha256))
             (check (not (probe-file (make-pathname :type "tmp" :defaults expected))))
             (download entry (lambda (&rest args) (declare (ignore args)) (error "Cache hit fetched again.")))
             (check (= calls 1))
             (with-open-file (out expected :direction :output :if-exists :supersede) (write-string "corrupt" out))
             (download entry #'fixture-fetch)
             (check (and (= calls 2) (equal (digest expected) sha256)))
             (let* ((bad-sha (make-string 64 :initial-element #\b))
                    (bad-entry (list :url "https://example.invalid/bad" :sha256 bad-sha))
                    (bad-path (merge-pathnames (concatenate 'string "archives/" bad-sha) *work*)))
               (check (handler-case (progn (download bad-entry #'fixture-fetch) nil) (simple-error () t)))
               (check (and (not (probe-file bad-path))
                           (not (probe-file (make-pathname :type "tmp" :defaults bad-path)))))
               (check (handler-case
                          (progn (download bad-entry (lambda (url target) (fixture-fetch url target)
                                                         (error "Injected transfer failure."))) nil)
                        (simple-error () t)))
               (check (and (not (probe-file bad-path))
                           (not (probe-file (make-pathname :type "tmp" :defaults bad-path)))
                           (equal (digest expected) sha256))))
             count)
        (uiop:delete-directory-tree *work* :validate t)))))

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
