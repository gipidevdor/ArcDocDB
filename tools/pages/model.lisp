(defpackage #:arcdocdb.pages
  (:use #:cl)
  (:export #:build))
(in-package #:arcdocdb.pages)

(defstruct page source route reference title group html headings text description)
(defvar *root*)
(defvar *pages*)
(defvar *current-page*)
(defvar *source-ref*)
(defvar *repository*)
(defvar *site-url*)
(defvar *local-build*)
(defvar *source-hashes*)
(defparameter *groups*
  '(("start" "Start here" "Purpose, setup and the current executable profile.")
    ("implementation" "Implementation" "Operational contracts, modules and current limits.")
    ("design" "Architecture & design" "The intended engine, its specification and persistent formats.")
    ("decisions" "Architecture decisions" "The reasoning, alternatives and scope of each decision.")
    ("verification" "Reliability & evidence" "Invariants, requirements, fault injection and evaluation.")
    ("experiments" "Experiments & reference" "Experiment guides and supporting reference material.")
    ("publication" "Publication & project" "Editorial policy, licenses, privacy, accessibility and project information.")))
(defparameter *navigation*
  '(("Start here" ("docs/README.md" "Documentation")
                  ("docs/implementazione/README.md" "Capabilities & limits")
                  ("docs/implementazione/production-unix-m1.md" "Run the M1 service"))
    ("Architecture & design" ("docs/architettura.md" "Architecture")
                             ("docs/analisi-progettuale.md" "Design analysis")
                             ("docs/specifica/specifica-originale.md" "Original specification")
                             ("docs/formati-su-disco.md" "On-disk formats")
                             ("docs/adr/README.md" "Decisions"))
    ("Engineering" ("docs/affidabilita/README.md" "Reliability")
                   ("docs/tracciabilita/README.md" "Traceability")
                   ("docs/valutazione/README.md" "Evaluation")
                   ("docs/roadmap.md" "Roadmap")
                   ("CONTRIBUTING.md" "Contributing"))
    ("Reference" ("docs/invarianti.md" "Invariants")
                 ("docs/glossario.md" "Glossary")
                 ("docs/riferimenti.md" "Source hierarchy")
                 ("spikes/README.md" "Experiments"))
    ("Publication" ("docs/editorial-policy.md" "Editorial policy")
                    ("docs/legal/README.md" "Publication information"))))

(defun read-text (path)
  (uiop:read-file-string path :external-format :utf-8))

(defun write-text (path text)
  (ensure-directories-exist path)
  (with-open-file (stream path :direction :output :if-exists :supersede
                         :external-format :utf-8)
    (write-string text stream)))

(defun git (&rest arguments)
  (string-right-trim '(#\Newline #\Return)
                     (uiop:run-program (cons "git" arguments) :directory *root*
                                       :output :string :error-output :interactive)))

(defun h (value)
  (with-output-to-string (out)
    (loop for c across (princ-to-string value) do
      (write-string (case c (#\& "&amp;") (#\< "&lt;") (#\> "&gt;")
                         (#\" "&quot;") (#\' "&#39;") (t (string c))) out))))

(defun json (value)
  "Small JSON writer for strings, numbers, lists and string-keyed hash tables."
  (with-output-to-string (out)
    (labels ((emit (x)
               (typecase x
                 (null (write-string "null" out))
                 (string
                  (write-char #\" out)
                  (loop for c across x for code = (char-code c) do
                    (case c
                      (#\" (write-string "\\\"" out))
                      (#\\ (write-string "\\\\" out))
                      (t (if (< code 32) (format out "\\u~4,'0X" code) (write-char c out)))))
                  (write-char #\" out))
                 (integer (format out "~D" x))
                 (hash-table
                  (write-char #\{ out)
                  (loop for key being the hash-keys of x using (hash-value item)
                        for first = t then nil do
                    (unless first (write-char #\, out))
                    (emit key) (write-char #\: out) (emit item))
                  (write-char #\} out))
                 (list
                  (write-char #\[ out)
                  (loop for item in x for first = t then nil do
                    (unless first (write-char #\, out)) (emit item))
                  (write-char #\] out))
                 (t (error "Unsupported JSON value: ~S" x)))))
      (emit value))))

(defun object (&rest entries)
  (let ((table (make-hash-table :test #'equal)))
    (loop for (key value) on entries by #'cddr do (setf (gethash key table) value))
    table))

(defun plain (string)
  (cl-ppcre:regex-replace-all (format nil "[\\s~C]+" (code-char #xA0)) string " "))

(defun decode-url-part (text)
  "Decode percent bytes without treating literal Unicode or + as form data."
  (let* ((input (sb-ext:string-to-octets text :external-format :utf-8))
         (output (make-array (length input) :element-type '(unsigned-byte 8)))
         (used 0) (position 0))
    (loop while (< position (length input)) do
      (let ((byte (aref input position)))
        (if (= byte 37)
            (let ((high (and (< (+ position 2) (length input))
                             (digit-char-p (code-char (aref input (1+ position))) 16)))
                  (low (and (< (+ position 2) (length input))
                            (digit-char-p (code-char (aref input (+ position 2))) 16))))
              (unless (and high low) (error "Invalid percent escape: ~A" text))
              (setf (aref output used) (+ (* high 16) low))
              (incf position 3))
            (progn (setf (aref output used) byte) (incf position)))
        (incf used)))
    (sb-ext:octets-to-string output :end used :external-format :utf-8)))

(defun group-for (path)
  (cond ((member path '("README.md" "docs/README.md" "CONTRIBUTING.md") :test #'equal) "start")
        ((or (uiop:string-prefix-p "docs/legal/" path)
             (member path '("docs/editorial-policy.md" "docs/github-pages.md" "SECURITY.md" "CHANGELOG.md" "assets/README.md") :test #'equal))
         "publication")
        ((uiop:string-prefix-p "docs/implementazione/" path) "implementation")
        ((uiop:string-prefix-p "docs/adr/" path) "decisions")
        ((some (lambda (prefix) (uiop:string-prefix-p prefix path))
               '("docs/affidabilita/" "docs/tracciabilita/" "docs/valutazione/")) "verification")
        ((uiop:string-prefix-p "docs/" path) "design")
        (t "experiments")))

(defun group-title (group)
  (second (assoc group *groups* :test #'equal)))

(defun source-files ()
  "Every tracked Markdown document, excluding raw results and GitHub templates."
  (sort (remove-if
         (lambda (path)
           (or (uiop:string-prefix-p "spikes/results/" path)
               (uiop:string-prefix-p ".github/" path)))
         (remove "" (uiop:split-string (git "ls-files" "--cached" "--others" "--exclude-standard" "--" "*.md")
                                      :separator '(#\Newline)) :test #'equal)) #'string<))

(defun route-for (source)
  (concatenate 'string (subseq source 0 (- (length source) 3)) ".html"))

(defun find-page (source)
  (or (find source *pages* :key #'page-source :test #'equal)
      (find source *pages* :key #'page-route :test #'equal)
      (error "Page missing from the documentation inventory: ~A" source)))

(defun relative-url (target &optional (from (page-route *current-page*)))
  "Compute portable links for both user and project GitHub Pages sites."
  (let ((left (butlast (uiop:split-string from :separator '(#\/))))
        (right (uiop:split-string target :separator '(#\/))))
    (loop while (and left right (equal (first left) (first right))) do
      (pop left) (pop right))
    (format nil "~{~A~^/~}" (append (loop for part in left collect "..") right))))

(defun page-url (source)
  (relative-url (page-route (find-page source))))

(defun source-url (source)
  (format nil "https://github.com/~A/blob/~A/~A" *repository* *source-ref* source))

(defun page-link (source label &optional class)
  (format nil "<a href=\"~A\"~@[ class=\"~A\"~]>~A</a>"
          (h (page-url source)) class (h label)))

(defun source-hashes ()
  (let ((table (make-hash-table :test #'equal))
        (sources (remove nil (mapcar #'page-source *pages*))))
    (dolist (line (uiop:split-string
                  (uiop:run-program (append '("shasum" "-a" "256" "--") sources)
                                    :directory *root* :output :string)
                  :separator '(#\Newline)))
      (when (> (length line) 66)
        (setf (gethash (subseq line 66) table) (subseq line 0 64))))
    (unless (= (hash-table-count table) (length sources))
      (error "Incomplete source hash inventory."))
    table))

(defun copy-assets-tree (source destination)
  (dolist (file (uiop:directory-files source))
    (let ((target (merge-pathnames (file-namestring file) destination)))
      (ensure-directories-exist target)
      (uiop:copy-file file target)))
  (dolist (directory (uiop:subdirectories source))
    (copy-assets-tree directory (merge-pathnames
                          (make-pathname :directory (list :relative (car (last (pathname-directory directory)))))
                          destination))))
