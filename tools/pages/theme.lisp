(in-package #:arcdocdb.pages)

(defun navigation ()
  (with-output-to-string (out)
    (dolist (group *navigation*)
      (format out "<div class=\"nav-group\"><p>~A</p><ul>" (h (first group)))
      (dolist (entry (rest group))
        (destructuring-bind (source label) entry
          (format out "<li><a href=\"~A\"~A>~A</a></li>"
                  (h (page-url source))
                  (if (equal source (page-source *current-page*)) " aria-current=\"page\"" "")
                  (h label))))
      (write-string "</ul></div>" out))
    (format out "<a class=\"library-link\" href=\"~A\">All documents <span aria-hidden=\"true\">↗</span></a>"
            (h (relative-url "library.html")))))

(defun header ()
  (with-output-to-string (out)
    (format out "<a class=\"skip-link\" href=\"#main\">Skip to content</a>
<header class=\"site-header\"><a class=\"wordmark\" href=\"~A\">
<picture><source media=\"(prefers-color-scheme: dark)\" srcset=\"~A\"><img src=\"~A\" width=\"28\" height=\"28\" alt=\"\"></picture>ArcDocDB<span>Documentation</span></a>
<div class=\"header-actions\"><a class=\"search-trigger\" data-search-open href=\"~A\">Search<span class=\"key-hint\" aria-hidden=\"true\">Ctrl / ⌘ K</span></a>
<button class=\"theme-toggle\" type=\"button\" hidden aria-label=\"Appearance: system\">◐</button>
<a class=\"github-link\" href=\"https://github.com/~A\">GitHub <span aria-hidden=\"true\">↗</span></a></div></header>"
            (h (relative-url "index.html"))
            (h (relative-url "assets/img/mark-dark.svg"))
            (h (relative-url "assets/img/mark-light.svg"))
            (h (relative-url "search.html")) (h *repository*))
    (format out "<details class=\"mobile-navigation\"><summary>Explore documentation</summary><nav aria-label=\"Mobile documentation\">~A</nav></details>"
            (navigation))))

(defun footer ()
  (with-output-to-string (out)
    (format out "<footer class=\"site-footer\"><div><span>© 2026 Giacomo Picchiarelli · <a href=\"~A\">BSD 2-Clause</a></span><span>Built with <a href=\"https://github.com/CommonDoc/codex\">Codex</a> · ~A</span></div><nav aria-label=\"Publication\">"
            (h (relative-url "licenses/ArcDocDB-BSD-2-Clause.txt"))
            (if *local-build* "Local preview · uncommitted changes"
                (format nil "Edition ~A" (h (subseq *revision* 0 7)))))
    (dolist (entry '(("docs/legal/README.md" "Publication")
                     ("docs/legal/privacy.md" "Privacy")
                     ("docs/legal/third-party.md" "Licenses & notices")
                     ("docs/legal/accessibility.md" "Accessibility")))
      (write-string (apply #'page-link entry) out))
    (write-string "<a href=\"https://github.com/gipidevdor\">GitHub contact</a>" out)
    (write-string "</nav></footer>" out)))

(defun toc (page)
  (when (page-headings page)
    (with-output-to-string (out)
      (write-string "<aside class=\"page-toc\"><nav aria-label=\"On this page\"><p>On this page</p><ol>" out)
      (dolist (heading (page-headings page))
        (destructuring-bind (id text level) heading
          (format out "<li~A><a href=\"#~A\">~A</a></li>"
                  (if (equal level "h3") " class=\"toc-subsection\"" "") (h id) (h text))))
      (write-string "</ol></nav><a class=\"back-top\" href=\"#main\">Back to top ↑</a></aside>" out))))

(defun mobile-toc (page)
  (when (page-headings page)
    (with-output-to-string (out)
      (write-string "<details class=\"mobile-toc\"><summary>On this page</summary><ol>" out)
      (dolist (heading (page-headings page))
        (format out "<li><a href=\"#~A\">~A</a></li>" (h (first heading)) (h (second heading))))
      (write-string "</ol></details>" out))))

(defun article-footer (page)
  (let* ((siblings (remove-if-not (lambda (p) (equal (page-group p) (page-group page)))
                                  (remove-if-not #'page-source *pages*)))
         (position (position page siblings))
         (previous (and position (> position 0) (nth (1- position) siblings)))
         (next (and position (nth (1+ position) siblings))))
    (with-output-to-string (out)
      (format out "<div class=\"source-note\"><a href=\"~A\">View Markdown source ↗</a><span>~A</span></div>"
              (h (source-url (page-source page))) (h (page-source page)))
      (write-string "<nav class=\"page-neighbors\" aria-label=\"Related reading\">" out)
      (dolist (entry (list (list previous "Previous") (list next "Next")))
        (destructuring-bind (item label) entry
          (when item
            (format out "<a href=\"~A\"><span>~A</span>~A <span aria-hidden=\"true\">~A</span></a>"
                    (h (relative-url (page-route item))) label (h (page-title item))
                    (if (equal label "Next") "→" "←")))))
      (write-string "</nav>" out))))

(defun search-ui ()
  (format nil "<dialog class=\"search-dialog\" aria-labelledby=\"search-title\">
<div class=\"search-dialog-heading\"><h2 id=\"search-title\">Search the documentation</h2><button type=\"button\" data-search-close aria-label=\"Close search\">Esc</button></div>
<form class=\"search-form\"><label for=\"dialog-query\">Words, identifiers or a design decision</label><input id=\"dialog-query\" type=\"search\" maxlength=\"160\" placeholder=\"Try recovery, CRC32C or ADR 0073\" autocomplete=\"off\" disabled></form>
<p class=\"search-status\" role=\"status\" aria-live=\"polite\">Search the complete manual. Words are matched locally in your browser.</p><ol class=\"search-results\"></ol></dialog>"))

(defun shell (page content)
  (let* ((*current-page* page)
         (home (equal (page-route page) "index.html"))
         (article (page-source page))
         (canonical (concatenate 'string *site-url* (page-route page))))
    (with-output-to-string (out)
      (format out "<!doctype html><html lang=\"en\"><head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<meta http-equiv=\"Content-Security-Policy\" content=\"default-src 'none'; base-uri 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self'; connect-src 'self'; form-action 'none'; object-src 'none'\"><meta name=\"referrer\" content=\"no-referrer\">
<title>~A~A</title><meta name=\"description\" content=\"~A\"><meta name=\"generator\" content=\"CommonDoc Codex · ArcDocDB\"><meta name=\"color-scheme\" content=\"light dark\">
<link rel=\"canonical\" href=\"~A\"><meta property=\"og:title\" content=\"~A\"><meta property=\"og:description\" content=\"~A\"><meta property=\"og:type\" content=\"website\"><meta property=\"og:url\" content=\"~A\">
<link rel=\"icon\" href=\"~A\" type=\"image/svg+xml\"><link rel=\"stylesheet\" href=\"~A\"><script defer src=\"~A\"></script>"
              (h (page-title page)) (if (or home (uiop:string-prefix-p "ArcDocDB" (page-title page))) "" " — ArcDocDB")
              (h (page-description page)) (h canonical) (h (page-title page))
              (h (page-description page)) (h canonical)
              (h (relative-url "assets/img/mark-light.svg"))
              (h (relative-url "static/site.css")) (h (relative-url "static/site.js")))
      (when (search "class=\"mermaid\"" content)
        (format out "<script defer src=\"~A\"></script>" (h (relative-url "static/mermaid.min.js"))))
      (format out "</head><body~A data-root=\"~A\">~A"
              (if home " class=\"home\"" "") (h (relative-url "")) (header))
      (unless home
        (format out "<aside class=\"sidebar\"><nav aria-label=\"Documentation\">~A</nav></aside>" (navigation)))
      (format out "<main id=\"main\" tabindex=\"-1\" class=\"~A\">"
              (cond (home "home-main") (article "document-main") (t "catalog-main")))
      (when article
        (format out "<div class=\"breadcrumb\"><a href=\"~A#~A\">~A</a><span aria-hidden=\"true\">/</span><span>~A</span></div>"
                (h (relative-url "library.html")) (h (page-group page)) (h (group-title (page-group page)))
                (h (file-namestring (page-source page)))))
      (when article
        (format out "<p class=\"document-kind\">~A~A</p>"
                (h (page-classification page))
                (if (member (page-group page) '("design" "decisions") :test #'equal)
                    (format nil " · ~A" (page-link "docs/implementazione/README.md" "Current capabilities")) "")))
      (when article (write-string (or (mobile-toc page) "") out))
      (format out "<article class=\"~A\">~A</article>" (if article "prose" "editorial") content)
      (when article (write-string (article-footer page) out))
      (write-string "</main>" out)
      (when article (write-string (or (toc page) "") out))
      (write-string (footer) out)
      (write-string (search-ui) out)
      (write-string "</body></html>" out))))

(defclass arc-template (common-html.template:template)
  ((output-directory :initarg :output-directory) (options :initarg :options)))

(defmethod initialize-instance :after ((template arc-template) &key)
  (ensure-directories-exist (slot-value template 'output-directory)))

(defmethod common-html.template:render-section
    ((template arc-template) (document common-doc:document) (section common-doc:section) content)
  (declare (ignore template document))
  (let ((page (or (find (common-doc:reference section) *pages* :key #'page-reference :test #'equal)
                  (error "Codex emitted an unknown section."))))
    (shell page content)))

(setf (gethash :arc codex.tmpl:*template-database*) (find-class 'arc-template))
