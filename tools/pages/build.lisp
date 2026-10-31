;;;; Standalone documentation builder. The storage engine is never loaded.
(require :asdf)
(declaim (optimize (safety 3) (debug 2)))
(defparameter *pages-root*
  (uiop:pathname-parent-directory-pathname
   (uiop:pathname-parent-directory-pathname
    (uiop:pathname-directory-pathname *load-truename*))))
(let ((software (merge-pathnames "_build/docs/software/" *pages-root*))
      (cache (merge-pathnames "_build/docs/cache/" *pages-root*)))
  (unless (probe-file software)
    (error "Run make docs-setup before building the documentation."))
  (asdf:initialize-source-registry
   `(:source-registry (:tree ,software) :ignore-inherited-configuration))
  (asdf:initialize-output-translations
   `(:output-translations (t (,cache :implementation)) :ignore-inherited-configuration)))
(asdf:load-system :codex)
(asdf:load-system :3bmd-ext-tables)
(asdf:load-system :3bmd-ext-code-blocks)
(asdf:load-system :yason)
(dolist (name '("model" "publication" "markdown" "theme" "editorial" "check" "generate"))
  (load (merge-pathnames (format nil "tools/pages/~A.lisp" name) *pages-root*)))
(arcdocdb.pages:build *pages-root* (uiop:command-line-arguments))
