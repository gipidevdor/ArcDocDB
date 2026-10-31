(in-package #:arcdocdb.pages)

(defun home-content ()
  (with-output-to-string (out)
    (write-string "<div class=\"home-hero\"><p class=\"eyebrow\">The ArcDocDB manual</p><h1>Write once.<br>Read with confidence.</h1><p class=\"hero-description\">An append-only document database,<br class=\"desktop-break\"> written in Common Lisp.</p>" out)
    (format out "<p class=\"hero-status\"><span class=\"phase-dot\" aria-hidden=\"true\"></span>In development · M1 durable core</p><div class=\"hero-links\">~A~A</div></div>"
            (page-link "docs/implementazione/production-unix-m1.md" "Get started →" "primary-link")
            (page-link "docs/architettura.md" "Explore the architecture"))
    (write-string "<section class=\"home-introduction\"><h2>A small surface.<br>A considered foundation.</h2><div><p>One writer per Serie. Immutable closed segments. Integrity checks on every read.</p><p>The current M1 profile provides a durable, single-Serie core over a local Unix socket. The primary index stays in RAM while its assigned budget permits, then uses a bounded disk cache.</p>" out)
    (format out "<p>~A describes what runs today. Design documents retain the contracts of the complete engine.</p></div></section>"
            (page-link "docs/implementazione/README.md" "Capabilities and limits"))
    (write-string "<section class=\"reading-paths\" aria-labelledby=\"reading-heading\"><div class=\"section-heading\"><h2 id=\"reading-heading\">Find your way in.</h2>" out)
    (format out "<a href=\"~A\">All ~D documents ↗</a></div>" (h (relative-url "library.html"))
            (count-if #'page-source *pages*))
    (loop for (number title description links) in
      '(("01" "Use the system" "Build, start the local service and understand its operational limits."
         (("docs/implementazione/production-unix-m1.md" "Server & client") ("docs/implementazione/README.md" "Implementation")))
        ("02" "Understand the design" "Follow the architecture from first principles to bytes on disk."
         (("docs/architettura.md" "Architecture") ("docs/analisi-progettuale.md" "Design analysis") ("docs/specifica/specifica-originale.md" "Specification")))
        ("03" "Read the decisions" "See the alternatives, reasoning and consequences behind the engine."
         (("docs/adr/README.md" "Architecture decisions") ("docs/roadmap.md" "Roadmap")))
        ("04" "Examine the evidence" "Trace requirements, invariants, fault injection and measured results."
         (("docs/affidabilita/README.md" "Reliability") ("docs/tracciabilita/README.md" "Traceability") ("docs/valutazione/README.md" "Evaluation")))) do
      (format out "<div class=\"reading-path\"><span class=\"path-number\">~A</span><h3>~A</h3><div><p>~A</p><div class=\"path-links\">" number title description)
      (dolist (link links) (write-string (apply #'page-link link) out))
      (write-string "</div></div></div>" out))
    (write-string "</section><section class=\"home-build\"><div><p class=\"eyebrow\">Start with the source</p><h2>Build. Verify. Explore.</h2><p>SBCL 2.6.9 · Linux x86-64 or macOS ARM64</p>" out)
    (write-string (page-link "CONTRIBUTING.md" "Build environment →") out)
    (format out "</div><pre><code>git clone https://github.com/~A.git~%cd ~A~%make check</code></pre></section>"
            (h *repository*) (h (second (uiop:split-string *repository* :separator '(#\/)))))))

(defun catalog-content ()
  (with-output-to-string (out)
    (format out "<p class=\"eyebrow\">The complete collection</p><h1>All documents.</h1><p class=\"catalog-intro\">~D documents. One source of truth. Implementation, design and evidence retain their stated scope.</p>"
            (count-if #'page-source *pages*))
    (write-string "<nav class=\"catalog-jump\" aria-label=\"Document sections\">" out)
    (dolist (group *groups*)
      (format out "<a href=\"#~A\">~A</a>" (first group) (h (second group))))
    (write-string "</nav>" out)
    (dolist (group *groups*)
      (let ((members (remove-if-not (lambda (p) (and (page-source p) (equal (page-group p) (first group)))) *pages*)))
        (format out "<section class=\"catalog-section\" id=\"~A\"><h2>~A <span>~D</span></h2><p>~A</p><ul>"
                (first group) (h (second group)) (length members) (h (third group)))
        (dolist (page members)
          (format out "<li><a href=\"~A\">~A</a><span>~A</span></li>"
                  (h (relative-url (page-route page))) (h (page-title page)) (h (page-source page))))
        (write-string "</ul></section>" out)))))

(defun search-content ()
  (format nil "<p class=\"eyebrow\">Every page, one search</p><h1>What are you looking for?</h1><form class=\"search-form page-search\" role=\"search\"><label for=\"page-query\">Search words, API identifiers or decisions</label><input id=\"page-query\" type=\"search\" maxlength=\"160\" placeholder=\"Try recovery, CRC32C or ADR 0073\" autocomplete=\"off\" disabled><button type=\"submit\" disabled>Search</button></form><p class=\"search-status\" role=\"status\" aria-live=\"polite\">Search words are matched locally in your browser.</p><ol class=\"search-results\"></ol><noscript><p>Search requires JavaScript. The <a href=\"~A\">complete document index</a> works without it.</p></noscript>"
          (h (relative-url "library.html"))))

(defun synthetic-page (route title description)
  (make-page :route route :title title :description description :group "start"))

(defun prepare-pages ()
  (let ((sources (source-files)))
    (setf *pages* (loop for source in sources collect
                   (make-page :source source :route (route-for source) :group (group-for source)))))
  (setf *source-hashes* (source-hashes))
  (mapc #'render-markdown *pages*)
  (let* ((home (synthetic-page "index.html" "ArcDocDB — Write once. Read with confidence."
                               "The complete ArcDocDB manual: an append-only Common Lisp document database. Implementation, architecture, specifications, decisions and evidence."))
         (catalog (synthetic-page "library.html" "All documents" "The complete ArcDocDB documentation, including architecture, specification, ADRs, implementation contracts and verification."))
         (search (synthetic-page "search.html" "Search" "Search the complete ArcDocDB documentation locally in your browser.")))
    (setf *pages* (append (list home catalog search) *pages*))
    (let ((*current-page* home)) (setf (page-html home) (home-content)))
    (let ((*current-page* catalog)) (setf (page-html catalog) (catalog-content)))
    (let ((*current-page* search)) (setf (page-html search) (search-content))))
  (loop for page in *pages* for n from 0 do
    (setf (page-reference page) (format nil "page-~4,'0D" n))))

(defun write-codex-manifest (stage)
  (let ((manual (with-output-to-string (out)
                  (dolist (page *pages*)
                    ;; The numeric section title is internal; the custom template
                    ;; emits the original Markdown title and stable public route.
                    (format out "@begin[ref=~A](section)~%@title(~A)~%@arc:page[path=\"~A\"]()~%@end(section)~%~%"
                            (page-reference page) (page-reference page)
                            (or (page-source page) (page-route page)))))))
    (write-text (merge-pathnames "manual.scr" stage) manual)
    (with-open-file (out (merge-pathnames "manifest.lisp" stage) :direction :output :if-exists :supersede)
      (let ((*print-pretty* t))
        (write '(:docstring-markup-format :scriba :systems nil
                 :documents ((:title "ArcDocDB documentation" :authors ("Giacomo Picchiarelli")
                              :output-format (:type :multi-html :template :arc)
                              :sources ("manual.scr")))) :stream out)))))

(defun publish-output (stage output)
  (dolist (page *pages*)
    (write-text (merge-pathnames (page-route page) output)
                (read-text (merge-pathnames
                            (format nil "build/arcdocdb-documentation/html/~A.html" (page-reference page)) stage))))
  (let ((search (loop for page in *pages* when (page-source page) collect
                 (object "title" (page-title page) "url" (page-route page) "group" (group-title (page-group page))
                         "path" (page-source page) "text" (page-text page)))))
    (write-text (merge-pathnames "search-index.json" output) (json search)))
  (let ((hashes (source-hashes)))
    (maphash (lambda (source digest)
               (unless (equal digest (gethash source hashes))
                 (error "Documentation source changed during rendering: ~A" source))) *source-hashes*)
    (write-text (merge-pathnames "manifest.json" output)
              (json (object "generator" "CommonDoc Codex" "revision" *revision*
                            "workingTree" (if *local-build* "local-preview" "clean")
                              "pages" (loop for page in *pages* when (page-source page) collect
                                        (object "source" (page-source page) "url" (page-route page)
                                                "sha256" (gethash (page-source page) hashes)))))))
  (write-text (merge-pathnames ".nojekyll" output) "")
  (write-text (merge-pathnames "robots.txt" output) (format nil "User-agent: *~%Allow: /~%Sitemap: ~Asitemap.xml~%" *site-url*))
  (write-text (merge-pathnames "sitemap.xml" output)
              (with-output-to-string (out)
                (write-string "<?xml version=\"1.0\" encoding=\"UTF-8\"?><urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">" out)
                (dolist (page *pages*)
                  (format out "<url><loc>~A~A</loc></url>" (h *site-url*) (h (page-route page))))
                (write-string "</urlset>" out)))
  (let ((missing (synthetic-page "404.html" "Page not found" "Find your way back to the ArcDocDB documentation.")))
    (write-text (merge-pathnames "404.html" output)
                (cl-ppcre:regex-replace
                 "<head>"
                 (shell missing (format nil "<div class=\"not-found\"><p class=\"eyebrow\">404</p><h1>A page out of place.</h1><p>The document may have moved. The complete index will help you find it.</p><a href=\"~Alibrary.html\">Explore all documents →</a></div>" (h *site-url*)))
                 (format nil "<head><base href=\"~A\">" (h *site-url*)))))
  (copy-assets-tree (merge-pathnames "assets/" *root*) (merge-pathnames "assets/" output))
  (copy-publication-files output)
  (dolist (name '("site.css" "site.js"))
    (let ((target (merge-pathnames (concatenate 'string "static/" name) output)))
      (ensure-directories-exist target)
      (uiop:copy-file (merge-pathnames (concatenate 'string "tools/pages/" name) *root*) target)))
  (dolist (name '("mermaid.min.js"))
    (uiop:copy-file (merge-pathnames (concatenate 'string "_build/docs/vendor/" name) *root*)
                    (merge-pathnames (concatenate 'string "static/" name) output))))

(defun build (root arguments)
  (let* ((*root* root)
         (*repository* (or (uiop:getenv "GITHUB_REPOSITORY") "gipidevdor/ArcDocDB"))
         (*local-build* (plusp (length (git "status" "--porcelain"))))
         (*revision* (git "rev-parse" "HEAD"))
         (*source-ref* (if *local-build* "main" *revision*))
         (*site-url* (or (uiop:getenv "DOCS_SITE_URL") "https://gipidevdor.github.io/ArcDocDB/"))
         (*pages* nil)
         (*source-hashes* nil)
         (*notice-data* nil)
         (stage (merge-pathnames "_build/docs/codex/" root))
         (output (merge-pathnames "_build/site/" root)))
    (unless (or (null arguments) (equal arguments '("--test"))) (error "Usage: build.lisp [--test]"))
    (unless (and (cl-ppcre:scan "^https://[A-Za-z0-9.-]+(?::[0-9]+)?/[A-Za-z0-9_./-]*/?$" *site-url*)
                 (char= (char *site-url* (1- (length *site-url*))) #\/))
      (error "DOCS_SITE_URL must be an HTTPS site URL ending in /."))
    (unless (cl-ppcre:scan "^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$" *repository*)
      (error "Invalid GITHUB_REPOSITORY."))
    (prepare-publication)
    (check-editorial-sources)
    (prepare-pages)
    (when arguments
      (load (merge-pathnames "tools/pages/tests.lisp" root))
      (run-tests))
    ;; Codex resolves a system's manifest through ASDF. This documentation-only
    ;; system has no product dependency and is registered only in this process.
    (write-text (merge-pathnames "arcdocdb-manual.asd" stage)
                (format nil "(asdf:defsystem \"arcdocdb-manual\" :pathname ~S)~%" root))
    (asdf:load-asd (merge-pathnames "arcdocdb-manual.asd" stage))
    (write-codex-manifest stage)
    (codex:document :arcdocdb-manual :manifest-path (merge-pathnames "manifest.lisp" stage))
    ;; Delete only this builder's fixed output, after Codex completed successfully.
    (when (probe-file output) (uiop:delete-directory-tree output :validate t))
    (ensure-directories-exist output)
    (publish-output stage output)
    (format t "~&Codex: ~D source documents; site written to ~A~%" (count-if #'page-source *pages*) output)
    (when arguments
      (verify-site output)
      (verify-publication-gates output))))
