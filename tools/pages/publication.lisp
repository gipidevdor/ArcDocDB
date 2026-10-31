(in-package #:arcdocdb.pages)

(defvar *notice-data*)
(defvar *revision*)
(defparameter *publication-copies*
  '(("LICENSE" "licenses/ArcDocDB-BSD-2-Clause.txt")
    ("data/unicode/18.0.0/LICENSE.txt" "licenses/Unicode-LICENSE.txt")
    ("tools/pages/third-party-notices.txt" "licenses/third-party-notices.txt")
    ("tools/pages/third-party-notices.lisp" "licenses/browser-components.lisp")))
(defparameter *diagram-descriptions*
  '(("docs/03-storage.md"
     "Segment lifecycle in the design: the writer creates ACTIVE; rotation closes it. CLEAN or MERGE can also create CLOSED segments. A replaced or empty CLOSED segment becomes OBSOLETE. It becomes RECLAIMABLE only after readers, snapshots and transactions stop using it, then DELETED. No transition returns to ACTIVE.")
    ("docs/05-transazioni.md"
     "Designed multiseries commit: the transaction manager prepares Serie A and B in parallel. Each verifies versions, appends prepared records and flushes. After both report prepared, a durable COMMIT decision is written to multiserie.log. Outcomes are applied on both participants. The client receives committed only after both report applied.")
    ("docs/implementazione/ci-statistiche.md"
     "CI evidence flow: a plan identifies the source and expected jobs. Verification runs on Linux and macOS; audit checks documentation and C4 tools; coverage checks product sources on Linux; the eligible benchmark runs on Linux. Their results feed a sealing step, including failures. A trusted publisher validates the sealed data before updating main.")))

(defun read-publication-data (path)
  (with-open-file (in path :external-format :utf-8)
    (let ((*read-eval* nil))
      (let ((value (read in)))
        (unless (eq (read in nil :end) :end) (error "Extra form in publication data: ~A" path))
        value))))

(defun path-sha256 (path)
  (subseq (uiop:run-program (list "shasum" "-a" "256" "--" (namestring path)) :output :string) 0 64))

(defun notice-header-present-p (component text)
  (search (format nil "~A — ~A~%License: ~A~%Source: ~A~%"
                  (getf component :name) (getf component :version)
                  (getf component :license) (getf component :source)) text))

(defun prepare-publication ()
  (setf *notice-data* (read-publication-data (merge-pathnames "tools/pages/third-party-notices.lisp" *root*)))
  (unless (= (getf *notice-data* :schema) 1) (error "Unsupported browser-notice inventory."))
  (unless (equal (getf (getf *notice-data* :bundle) :sha256)
                 (path-sha256 (merge-pathnames "_build/docs/vendor/mermaid.min.js" *root*)))
    (error "Browser bundle changed: refresh the complete third-party notices before publishing."))
  (unless (equal (getf *notice-data* :notices-sha256)
                 (path-sha256 (merge-pathnames "tools/pages/third-party-notices.txt" *root*)))
    (error "Third-party notice collection changed without its inventory."))
  (let ((text (read-text (merge-pathnames "tools/pages/third-party-notices.txt" *root*))))
    (dolist (component (getf *notice-data* :components))
      (unless (notice-header-present-p component text)
        (error "Browser component metadata differs from its notice: ~A" (getf component :name))))))

(defun notice-table ()
  (with-output-to-string (out)
    (write-string "<h2>Browser component inventory</h2><table><caption>Components covered by the downloadable notices</caption><thead><tr><th scope=\"col\">Component</th><th scope=\"col\">Version</th><th scope=\"col\">License</th></tr></thead><tbody>" out)
    (dolist (component (getf *notice-data* :components))
      (format out "<tr><td>~A</td><td>~A</td><td>~A</td></tr>"
              (h (getf component :name)) (h (getf component :version)) (h (getf component :license))))
    (write-string "</tbody></table>" out)))

(defun publication-copy-url (source)
  (second (assoc source *publication-copies* :test #'equal)))

(defun page-classification (page)
  (cond ((equal (page-group page) "publication") "Publication & project")
        ((equal (page-group page) "design") "Design reference")
        ((equal (page-group page) "decisions") "Architecture decision")
        ((and (page-source page)
              (cl-ppcre:scan "(metodo|revisione|risultati|decisioni|dati|method|review)" (page-source page)))
         "Engineering record")
        ((equal (page-group page) "implementation") "Implementation notes")
        (t (group-title (page-group page)))))

(defun copy-publication-files (output)
  (dolist (entry *publication-copies*)
    (let ((target (merge-pathnames (second entry) output)))
      (ensure-directories-exist target)
      (uiop:copy-file (merge-pathnames (first entry) *root*) target))))
