;;;; C4: raccolta concorrente derivata da collect-original.lisp f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81.
;;;; --collect MANIFEST NEWDEST --jobs 4 | --self-test NEWDIR
;;;; Quattro worker, tre SHA per copia, nessuna inferenza dei risultati.
(require :asdf)
(require :sb-posix)
(load "tools/evidence-storage.lisp")
(defpackage #:cbor-minimal.parallel-collection (:use #:cl))
(in-package #:cbor-minimal.parallel-collection)
(declaim (optimize (safety 3) (debug 3)))

(defconstant +jobs+ 4)
(defconstant +queue-limit+ 100000)
(defconstant +join-budget+ 1800)
(defparameter *collector-source* (truename *load-truename*))
(defparameter *support-directory* (uiop:pathname-directory-pathname *collector-source*))

(define-condition invalid-collection (error)
  ((reason :initarg :reason :reader collection-reason)
   (detail :initarg :detail :reader collection-detail))
  (:report (lambda (condition stream)
             (format stream "Raccolta rifiutata ~S: ~A."
                     (collection-reason condition) (collection-detail condition)))))

(defun reject (reason control &rest arguments)
  (error 'invalid-collection :reason reason :detail (apply #'format nil control arguments)))

(defun demand (value reason control &rest arguments)
  (unless value (apply #'reject reason control arguments)))

(defun read-one (path)
  "Dati soltanto: lettore trusted, plist propria, READ-EVAL NIL ed EOF obbligatorio."
  (handler-case (arcdocdb.evidence:read-evidence path)
    (arcdocdb.evidence:invalid-evidence (condition) (reject :data-read "~A" condition))))

(defun save-one (path datum)
  (ensure-directories-exist path)
  (with-open-file (stream path :direction :output :if-exists :error :external-format :utf-8)
    (let ((*print-readably* t)) (write datum :stream stream :pretty t) (terpri stream))))

(defun fingerprint (path)
  (list :bytes (arcdocdb.evidence:file-bytes path)
        :sha256 (arcdocdb.evidence:file-sha256 path)))

(defun exists-p (path)
  "LSTAT rileva anche symlink dangling; non segue una destinazione già occupata."
  (handler-case
      (progn (sb-posix:lstat (string-right-trim "/" (namestring path))) t)
    (sb-posix:syscall-error (condition)
      (if (= sb-posix:enoent (sb-posix:syscall-errno condition)) nil (error condition)))))

(defun relative-p (value)
  "Percorso relativo semplice, senza componenti vuote, escape o caratteri di glob."
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
  "Politica originale: selezione ordinata; tutte le directory fasl sono escluse."
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

(defun copy-verified (source target root &optional after-copy)
  "SHA origine prima/dopo e destinazione, tutti osservati anche se un confronto fallisce."
  (let ((before (fingerprint source)))
    (demand (not (exists-p target)) :existing-target "~A" target)
    (uiop:copy-file source target)
    (when after-copy (funcall after-copy target))
    (let ((after-source (fingerprint source)) (after-target (fingerprint target)))
      (demand (equal before after-source) :source-changed "~A" source)
      (demand (equal before after-target) :copied-bytes "~A" target)
      (append (list :path (enough-namestring target root) :source (namestring source)) before))))

(defun plan-collection (manifest-path root)
  "Piano sequenziale limitato; rifiuta duplicati prima di creare destinazioni."
  (let ((manifest (read-one manifest-path)) (tasks nil) (processes nil)
        (targets (make-hash-table :test #'equal)) (labels (make-hash-table :test #'equal)))
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
            (demand (and (eql 1 (getf data :schema-version))
                         (eq :command-verification (getf data :kind))) :process-schema "~A" source)
            (dolist (file (selected-files base))
              (add file (concatenate 'string prefix (enough-namestring file base))))
            (push (list :source source :data data :metadata
                        (list :label label :record-path relative :status (getf data :status)
                              :exit-code (getf data :exit-code)
                              :source-consistency (getf data :source-consistency)
                              :command (getf data :command))) processes))))
      (dolist (tree (getf manifest :trees))
        (destructuring-bind (label source-directory mode) tree
          (demand (and (relative-p label) (member mode '(:all :lisp-and-log))) :tree "~S" tree)
          (let ((base (truename source-directory)) (prefix (format nil "raw/~A/" label)))
            (dolist (file (selected-files base :lisp-and-log-only (eq mode :lisp-and-log)))
              (add file (concatenate 'string prefix (enough-namestring file base)))))))
      (dolist (item (getf manifest :files))
        (destructuring-bind (label source) item
          (demand (relative-p label) :relative-path "~S" label)
          (add source (format nil "raw/~A" label))))
      (add manifest-path "collection-manifest.lisp")
      (add *collector-source* "collection-source.lisp"))
    (values (coerce (nreverse tasks) 'vector) (nreverse processes))))

(defun create-root-and-directories (root tasks)
  "MKDIR esclusivo, poi tutte le directory sequenzialmente; niente mkdir nei worker."
  (demand (not (exists-p root)) :existing-destination "~A" root)
  (ensure-directories-exist
   (make-pathname :defaults root :directory (butlast (pathname-directory root))
                             :name "placeholder" :type nil))
  (sb-posix:mkdir root #o700)
  (loop for task across tasks do (ensure-directories-exist (second task))))

(defun remaining-seconds (deadline)
  (max 0d0 (/ (- deadline (get-internal-real-time))
             (float internal-time-units-per-second 1d0))))

(defun copy-plan (tasks root &key corrupt-index)
  "Coda vettoriale <=100000; primo task privato per worker, poi claim mutex e join limitati."
  (let* ((count (length tasks)) (cursor (min +jobs+ count))
         (mutex (sb-thread:make-mutex :name "cbor-collection-queue"))
         (ready (sb-thread:make-semaphore :count 0)) (go (sb-thread:make-semaphore :count 0))
         (results (make-array count :initial-element nil))
         (statistics (make-array +jobs+ :initial-element 0))
         (worker-errors (make-array +jobs+ :initial-element nil))
         (threads nil) (joined nil) (defaults *default-pathname-defaults*)
         (deadline (+ (get-internal-real-time) (* +join-budget+ internal-time-units-per-second))))
    (labels ((take ()
               (sb-thread:with-mutex (mutex)
                 (when (< cursor count) (prog1 cursor (incf cursor)))))
             (perform (index worker)
               (let ((task (aref tasks index)))
                 (setf (aref results index)
                       (handler-case
                           (list :status :ok :entry
                                 (copy-verified (first task) (second task) root
                                                (when (eql index corrupt-index)
                                                  (lambda (path)
                                                    (with-open-file (stream path :direction :io
                                                                           :if-exists :overwrite
                                                                           :if-does-not-exist :error
                                                                           :element-type '(unsigned-byte 8))
                                                      (let ((byte (read-byte stream)))
                                                        (file-position stream 0)
                                                        (write-byte (logxor byte 1) stream)))))))
                         (invalid-collection (condition)
                           (list :status :failed :reason (collection-reason condition)
                                 :detail (collection-detail condition)))
                         (error (condition)
                           (list :status :failed :reason :copy-error :detail (princ-to-string condition)))))
                 (incf (aref statistics worker))))
             (work (worker)
               (let ((*default-pathname-defaults* defaults))
                 (handler-case
                     (progn
                       (sb-thread:signal-semaphore ready)
                       (demand (sb-thread:wait-on-semaphore go :timeout (remaining-seconds deadline))
                               :worker-timeout "GO worker ~D" worker)
                       (when (< worker count) (perform worker worker))
                       (loop for index = (take) while index do (perform index worker)))
                   (error (condition)
                     (setf (aref worker-errors worker) (princ-to-string condition)))))))
      (unwind-protect
           (progn
             (dotimes (worker +jobs+)
               (let ((id worker))
                 (push (sb-thread:make-thread (lambda () (work id))
                                              :name (format nil "cbor-collection-~D" id)) threads)))
             (setf threads (nreverse threads))
             (dotimes (i +jobs+)
               (demand (sb-thread:wait-on-semaphore ready :timeout (remaining-seconds deadline))
                       :worker-timeout "READY worker ~D" i))
             (sb-thread:signal-semaphore go :n +jobs+)
             (dolist (thread threads)
               (let ((marker (gensym "TIMEOUT")))
                 (demand (not (eq marker (sb-thread:join-thread
                                         thread :timeout (remaining-seconds deadline) :default marker)))
                         :worker-timeout "JOIN ~A" (sb-thread:thread-name thread))))
             (setf joined t))
        (unless joined
          (sb-thread:signal-semaphore go :n +jobs+)
          (dolist (thread threads)
            (when (sb-thread:thread-alive-p thread) (sb-thread:terminate-thread thread)))
          (dolist (thread threads) (ignore-errors (sb-thread:join-thread thread :timeout 5 :default nil)))))
      (values results statistics worker-errors))))

(defun verify-processes (processes root)
  "Tutti i dati decodificati originali vengono confrontati dopo i join, prima dell'indice."
  (dolist (process processes)
    (demand (equalp (getf process :data)
                    (read-one (merge-pathnames (getf (getf process :metadata) :record-path) root)))
            :decoded-record "~A" (getf process :source))))

(defun publish-metadata (root destination files processes)
  "Schema, policy, limiti, ordine e catalogo del collector originale."
  (save-one (merge-pathnames "archive-index.lisp" root)
            (list :schema-version 1 :kind :original-command-archive
                  :metadata-policy :read-without-result-inference
                  :processes (mapcar (lambda (process) (getf process :metadata)) processes)
                  :files (sort files #'string< :key (lambda (entry) (getf entry :path)))
                  :limits '(:sha256-byte-copy-check :raw-originals-preserved
                            :fasl-excluded-from-published-mutation-trees
                            :no-requirement-or-release-promotion)))
  (save-one (merge-pathnames "catalogo.lisp" root)
            (list :schema-version 1 :kind :evidence-catalog :date "2026-10-11"
                  :path-base destination :formats nil :entries
                  (list (list :kind :original-command-archive :artifact "archive-index.lisp"
                              :artifact-schema-version 1 :artifact-kind :original-command-archive))
                  :pending nil)))

(defun new-observation-path (stem type)
  (loop for attempt from 0
        for path = (merge-pathnames
                    (format nil "~A-~D-~D-~D.~A" stem (get-universal-time)
                            (sb-posix:getpid) attempt type) *support-directory*)
        unless (exists-p path) return path))

(defun independent-closure (root)
  "Validator trusted in nuovo processo; log fuori dall'archivio per inventario chiuso."
  (let* ((log (new-observation-path "closed-check" "log"))
         (process (uiop:launch-program
                   (list "sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
                         "tools/check-command-archive.lisp" "--archive" (namestring root))
                   :output log :error-output :output)))
    (multiple-value-bind (exit signal) (uiop:wait-process process)
      (demand (and (eql 0 exit) (null signal)) :closed-check "Exit ~S signal ~S log ~A" exit signal log)
      (list :exit-code exit :signal signal :log (namestring log)))))

(defun collect (manifest-path destination &key corrupt-index)
  "Piano, quattro worker, join, autenticazione locale e pubblicazione; conserva anche fallimenti."
  (let* ((root (merge-pathnames (uiop:ensure-directory-pathname destination) (truename "./")))
         (report-path (new-observation-path "collection-observation" "lisp"))
         (report (list :schema-version 1 :kind :parallel-collection-observation :status :running
                       :destination (namestring root) :workers +jobs+ :sha-per-copy 3 :phase :planning)))
    (handler-case
        (multiple-value-bind (tasks processes) (plan-collection manifest-path root)
          (setf (getf report :planned-files) (length tasks) (getf report :phase) :create-directories)
          (create-root-and-directories root tasks)
          (setf (getf report :phase) :copy)
          (multiple-value-bind (results statistics errors) (copy-plan tasks root :corrupt-index corrupt-index)
            (setf (getf report :worker-copied-counts) (coerce statistics 'list)
                  (getf report :worker-errors) (coerce errors 'list)
                  (getf report :copy-results) (coerce results 'list) (getf report :phase) :joined)
            (demand (every #'null errors) :worker-error "~S" (coerce errors 'list))
            (demand (every #'identity results) :missing-result "Risultati mancanti dopo join")
            (let ((failed (find :failed results :key (lambda (result) (getf result :status)))))
              (when failed (reject (getf failed :reason) "~A" (getf failed :detail))))
            (verify-processes processes root)
            (publish-metadata root destination
                              (map 'list (lambda (result) (getf result :entry)) results) processes))
          (setf (getf report :phase) :published
                (getf report :independent-closure) (independent-closure root)
                (getf report :phase) :complete (getf report :status) :ok)
          (save-one report-path report)
          (values report (namestring report-path)))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition)
              (getf report :reason) (if (typep condition 'invalid-collection)
                                        (collection-reason condition) :infrastructure))
        (save-one report-path report)
        (error condition)))))

(defun expect-rejection (function reason)
  "Negativi specifici: nessun errore generico può far passare il self-test."
  (let ((observed nil))
    (handler-case (funcall function)
      (invalid-collection (condition)
        (demand (eq reason (collection-reason condition)) :self-test-reason
                "Atteso ~S, osservato ~S" reason (collection-reason condition))
        (setf observed t)))
    (demand observed :self-test-accepted "Negativo ~S accettato" reason)))

(defun write-octets-new (path octets)
  (ensure-directories-exist path)
  (with-open-file (stream path :direction :output :if-exists :error :element-type '(unsigned-byte 8))
    (write-sequence octets stream)))

(defun self-test (destination)
  "Diciotto copie, quattro worker reali, chiusura trusted, tre rifiuti con motivo esatto."
  (let* ((root (merge-pathnames (uiop:ensure-directory-pathname destination) (truename "./")))
         (process (merge-pathnames "input/process/report.lisp" root))
         (manifest (merge-pathnames "input/manifest.lisp" root))
         (archive (merge-pathnames "valid/" root))
         (corrupt (merge-pathnames "corrupt/" root)))
    (demand (not (exists-p root)) :existing-destination "~A" root)
    (sb-posix:mkdir root #o700)
    (save-one process (list :schema-version 1 :kind :command-verification :status :ok :exit-code 0
                            :source-consistency :stable :command '("synthetic-self-test" "no-product")))
    (dotimes (i 15)
      (write-octets-new (merge-pathnames (format nil "input/tree/file~2,'0D.bin" i) root)
                       (make-array (+ 17 i) :element-type '(unsigned-byte 8) :initial-element (+ 40 i))))
    (save-one manifest
              (list :schema-version 1 :processes (list (list "synthetic" (namestring process)))
                    :trees (list (list "fixtures" (namestring (merge-pathnames "input/tree/" root)) :all))
                    :files nil))
    (multiple-value-bind (report observation) (collect manifest (namestring archive))
      (demand (and (= 18 (getf report :planned-files))
                   (= 18 (reduce #'+ (getf report :worker-copied-counts)))
                   (every #'plusp (getf report :worker-copied-counts)))
              :self-test-workers "Quattro worker e18file richiesti")
      (let ((index (read-one (merge-pathnames "archive-index.lisp" archive))))
        (demand (= 18 (length (getf index :files))) :self-test-index "Diciotto entry richieste")
        (dolist (entry (getf index :files))
          (demand (equal (list :bytes (getf entry :bytes) :sha256 (getf entry :sha256))
                         (fingerprint (merge-pathnames (getf entry :path) archive)))
                  :self-test-copy "Copia non verificata ~A" (getf entry :path))))
      (expect-rejection (lambda () (collect manifest (namestring corrupt) :corrupt-index 0)) :copied-bytes)
      (demand (and (not (exists-p (merge-pathnames "archive-index.lisp" corrupt)))
                   (not (exists-p (merge-pathnames "catalogo.lisp" corrupt)))
                   (uiop:directory-files (merge-pathnames "processes/synthetic/" corrupt)))
              :self-test-publication "Fallimento deve lasciare copie parziali senza indice/catalogo")
      (expect-rejection (lambda () (collect manifest (namestring archive))) :existing-destination)
      (let ((duplicate (merge-pathnames "input/duplicate.lisp" root))
            (duplicate-dest (merge-pathnames "duplicate/" root)))
        (save-one duplicate
                  (list :schema-version 1 :processes (list (list "synthetic" (namestring process)))
                        :trees nil :files (list (list "same.bin" (namestring process))
                                                (list "same.bin" (namestring process)))))
        (expect-rejection (lambda () (collect duplicate (namestring duplicate-dest))) :duplicate-target)
        (demand (not (exists-p duplicate-dest)) :self-test-planning "Destinazione duplicata creata"))
      (let ((result (list :schema-version 1 :kind :parallel-collection-self-test :status :ok
                          :workers 4 :copied-files 18 :sha-per-copy 3
                          :worker-copied-counts (getf report :worker-copied-counts)
                          :positive-observation observation
                          :independent-closure (getf report :independent-closure)
                          :negative-reasons '(:copied-bytes :duplicate-target :existing-destination)
                          :specific-reasons-required t :failure-files-preserved t
                          :index-published-only-after-join-and-checks t
                          :benchmark-or-scaling-claim nil)))
        (save-one (merge-pathnames "report.lisp" root) result)
        result))))

(defun main ()
  (let ((args (uiop:command-line-arguments)))
    (cond ((and (= 5 (length args)) (string= "--collect" (first args))
                (string= "--jobs" (fourth args)) (string= "4" (fifth args)))
           (multiple-value-bind (report path) (collect (second args) (third args))
             (format t "Raccolta: ~D file originali verificati, quattro worker; ~A~%"
                     (getf report :planned-files) path)))
          ((and (= 2 (length args)) (string= "--self-test" (first args)))
           (let ((*print-readably* t)) (write (self-test (second args)) :pretty t) (terpri)))
          (t (reject :arguments "Usare --collect manifest NEWDEST --jobs 4 oppure --self-test NEWDIR")))))

(main)

