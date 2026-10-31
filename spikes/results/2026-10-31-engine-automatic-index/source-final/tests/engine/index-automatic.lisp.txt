;;;; C4: independent values, canonical frontiers, bounded modes and physical process restarts.
(in-package #:arcdocdb.engine.tests)

(defun automatic-key (n &optional (size 128))
  (let ((key (bytes size 19))) (arcdocdb.binary:scrivi-u32 key (- size 4) n) key))
(defun automatic-open (root &key create (version 2) observer (budget 8388608) (size 4096) (disk-limit 1099511627776))
  (e:apri-motore root (archive-id) (series-id) :create create :version version :clock (lambda () 10) :observer observer
    :max-file-bytes 4194304 :max-record-bytes 131072 :max-records 2048 :max-segments 64
    :index-capacity 16 :key-arena-bytes 128
    :index-policy (e:crea-politica-indice-automatico :budget budget :page-size size :frames 1 :max-file-bytes disk-limit)))
(defun automatic-fixed (engine) (getf (e:statistiche-indice-motore engine) :reserved-fixed))
(defun automatic-check (engine count &key (deleted 0) (key-size 128))
  (dotimes (n count)
    (let ((target (bytes 64 204)))
      (multiple-value-bind (status size) (e:leggi-documento engine (automatic-key n key-size) target :start 3)
        (is (eq status (if (< n deleted) :absent :found)))
        (is (= size (if (< n deleted) 0 23)))
        (is (every (lambda (v) (= v (if (< n deleted) 204 (+ 128 (mod n 100)))))
                   (subseq target 3 26))))
      (is (every (lambda (v) (= v 204)) (subseq target 26))))))
(defun automatic-write (engine count &optional (key-size 128))
  (dotimes (n count) (e:scrivi-documento engine (automatic-key n key-size) (value (mod n 100)))))
(defun automatic-page (engine)
  (e:configura-budget-indice-motore engine (+ (automatic-fixed engine) 16384))
  (is (eq :paged (e:modo-indice-motore engine)))
  (is (null (e::motore-index engine)))
  (is (null (arcdocdb.get::vista-get-serie-primary (e::motore-view engine)))))
(defun automatic-files (root)
  (remove-if-not (lambda (p) (arcdocdb.io:nome-derivato-automatico-p (file-namestring p))) (uiop:directory-files root)))

(deftest test-REQ-IDX-013-fit-remains-resident-with-flat-splits-and-no-index-IO
  (with-root (root)
    (with-engine (engine (automatic-open root :create t))
      (automatic-write engine 180) (automatic-check engine 180)
      (is (eq :resident (e:modo-indice-motore engine))) (is (null (automatic-files root)))
      (is (> (arcdocdb.index.primary::root-indice-depth
               (arcdocdb.index.primary::indice-primario-root (e::motore-index engine))) 0))
      (is (= 0 (getf (e:statistiche-indice-motore engine) :transitions))))
    (with-engine (engine (automatic-open root))
      (automatic-check engine 180) (is (eq :resident (e:modo-indice-motore engine))))))

(deftest test-REQ-IDX-013-transitions-replay-delete-and-return-v1-v2-three-page-sizes
  (dolist (version '(1 2))
    (dolist (size '(4096 16384 65536))
      (with-root (root)
        (let ((budget 0))
          (with-engine (engine (automatic-open root :create t :version version :size size))
            (automatic-write engine 90) (automatic-page engine) (automatic-check engine 90)
            (setf budget (+ (automatic-fixed engine) 16384))
            (is (= 1 (length (automatic-files root)))))
          (is (null (automatic-files root)))
          (with-engine (engine (automatic-open root :version version :size size :budget budget))
            (is (eq :paged (e:modo-indice-motore engine))) (automatic-check engine 90)
            (dotimes (n 20) (e:cancella-documento engine (automatic-key n)))
            (automatic-check engine 90 :deleted 20)
            (e:configura-budget-indice-motore engine 8388608)
            (is (eq :resident (e:modo-indice-motore engine))) (automatic-check engine 90 :deleted 20)
            (is (null (automatic-files root)))
            (automatic-page engine) (automatic-check engine 90 :deleted 20)
            (e:configura-budget-indice-motore engine 8388608)
            (is (eq :resident (e:modo-indice-motore engine)))))))))

(deftest test-REQ-IDX-013-growth-pages-and-deletion-returns-without-manual-mode
  (with-root (root)
    (with-engine (engine (automatic-open root :create t :budget 2097152))
      (automatic-write engine 150 4096)
      (is (eq :paged (e:modo-indice-motore engine)))
      (automatic-check engine 150 :key-size 4096)
      (dotimes (n 145) (e:cancella-documento engine (automatic-key n 4096)))
      (is (eq :resident (e:modo-indice-motore engine)))
      (automatic-check engine 150 :deleted 145 :key-size 4096)
      (is (null (automatic-files root))))))

(deftest test-REQ-IDX-013-quota-boundaries-and-invalid-policy-preserve-canonical
  (signals arcdocdb.conditions:invalid-argument (e:crea-politica-indice-automatico :budget nil) :engine-auto-budget)
  (signals arcdocdb.conditions:invalid-argument (e:crea-politica-indice-automatico :page-size 8192) :disk-index-cache-geometry)
  (signals arcdocdb.conditions:resource-exhausted (e:crea-politica-indice-automatico :budget 1) :engine-auto-fixed-budget)
  (with-root (root)
    (with-engine (engine (automatic-open root :create t))
      (automatic-write engine 20)
      (let ((before (images root)) (frontier (multiple-value-list (e:frontiere-motore engine))) (fixed (automatic-fixed engine)))
        (signals arcdocdb.conditions:invalid-argument (e:configura-budget-indice-motore engine nil) :engine-auto-budget)
        (signals arcdocdb.conditions:resource-exhausted (e:configura-budget-indice-motore engine (1- fixed)) :engine-auto-fixed-budget)
        (check-images root before) (is (equal frontier (multiple-value-list (e:frontiere-motore engine))))
        (e:configura-budget-indice-motore engine fixed) (is (eq :paged (e:modo-indice-motore engine)))
        (automatic-check engine 20)))))

(deftest test-REQ-IDX-013-automatic-compaction-bounded-history-and-canonical-values
  (with-root (root)
    (let ((compactions 0) (budget 0))
      (with-engine (engine (automatic-open root :create t :disk-limit 589824
                            :observer (lambda (engine phase) (declare (ignore engine))
                                        (when (eq phase :auto-compact-published) (incf compactions)) nil)))
        (automatic-write engine 30) (automatic-page engine)
        (setf budget (+ (automatic-fixed engine) 16384))
        (dotimes (n 1200) (e:scrivi-documento engine (automatic-key (mod n 30)) (value (mod n 30))))
        (automatic-check engine 30) (is (> compactions 1)) (is (= 1 (length (automatic-files root))))
        (is (<= (getf (e:statistiche-indice-motore engine) :disk-bytes) 589824)))
      (with-engine (engine (automatic-open root :budget budget :disk-limit 589824)) (automatic-check engine 30)))))

(deftest test-REQ-IDX-013-maximum-key-exact-identity-and-absent-delete
  (with-root (root)
    (with-engine (engine (automatic-open root :create t))
      (let ((first (automatic-key 1 65535)) (other (automatic-key 2 65535)) (target (bytes 64)))
        (e:scrivi-documento engine first (value 1)) (e:scrivi-documento engine other (value 2))
        (automatic-page engine)
        (e:cancella-documento engine (automatic-key 3 65535))
        (is (eq :found (e:leggi-documento engine first target)))
        (is (equalp (value 1) (subseq target 0 23)))
        (e:cancella-documento engine first) (is (eq :absent (e:leggi-documento engine first target)))
        (is (eq :found (e:leggi-documento engine other target)))
        (is (equalp (value 2) (subseq target 0 23)))))))

(deftest test-REQ-IDX-013-index-failure-after-SEAL-no-ACK-replay-restores-document
  (with-root (root)
    (let ((armed nil))
      (with-engine (engine (automatic-open root :create t :observer
                            (lambda (engine phase) (declare (ignore engine))
                              (when (and armed (eq phase :auto-index-updated)) (error "FI-after-SEAL")) nil)))
        (automatic-write engine 20) (automatic-page engine) (setf armed t)
        (signals simple-error (e:scrivi-documento engine (automatic-key 20) (value 20)))
        (is (eq :faulted (e:stato-motore engine)))))
    (with-engine (engine (automatic-open root)) (automatic-check engine 21) (check-frontier engine 21))))

(deftest test-REQ-IDX-013-derived-corruption-fails-without-resident-fallback
  (with-root (root)
    (with-engine (engine (automatic-open root :create t))
      (automatic-write engine 30) (automatic-page engine)
      (let* ((auto (e::motore-automatic-index engine)) (tree (e::automatic-index-controller-disk auto))
             (path (merge-pathnames (arcdocdb.index.disk:disk-index-name tree) root)))
        (with-open-file (out path :direction :output :element-type '(unsigned-byte 8) :if-exists :overwrite)
          (file-position out (+ (arcdocdb.index.disk:disk-index-root tree) 124)) (write-byte 253 out))
        (fill (arcdocdb.index.disk::disk-index-tags tree) 0)
        (signals arcdocdb.conditions:corruption-detected (e:leggi-documento engine (automatic-key 0) (bytes 64)))
        (is (eq :faulted (e:stato-motore engine)))))
    (with-engine (engine (automatic-open root)) (automatic-check engine 30))))

(deftest test-REQ-IDX-013-resolver-metadata-only-and-fixed-cache-across-reopens
  (with-root (root)
    (with-engine (engine (automatic-open root :create t)) (automatic-write engine 120))
    (with-engine (engine (automatic-open root))
      (let* ((sources (e::motore-sources engine))
             (maps (arcdocdb.get.directory::directory-get-serie-maps
                     (arcdocdb.get.directory::fonti-get-serie-directory sources))))
        (is (every (lambda (map) (zerop (arcdocdb.get.resolver:payload-mappa-segmento-get map))) maps)))
      (automatic-check engine 120)
      (is (= (* 6 2048) (length (e::automatic-index-controller-rows (e::motore-automatic-index engine)))))
      (let ((before (e::automatic-index-controller-map (e::motore-automatic-index engine))))
        (automatic-check engine 120)
        (is (eq before (e::automatic-index-controller-map (e::motore-automatic-index engine))))))))

(deftest test-REQ-IDX-013-reentry-and-incomplete-mode-publication-fail-stop
  (dolist (phase '(:auto-page-created :auto-page-verified :auto-page-published))
    (with-root (root)
      (let ((armed nil))
        (with-engine (engine (automatic-open root :create t :observer
                              (lambda (engine step)
                                (when (and armed (eq phase step))
                                  (signals arcdocdb.conditions:invalid-argument (e:cancella-documento engine (key 1))
                                           :engine-request-in-progress)
                                  (throw 'interrupted :interrupted)) nil)))
          (automatic-write engine 30) (setf armed t)
          (is (eq :interrupted (catch 'interrupted (automatic-page engine))))
          (is (eq :faulted (e:stato-motore engine)))))
      (with-engine (engine (automatic-open root)) (automatic-check engine 30)))))

(defun automatic-mode-child-main (arguments)
  (destructuring-bind (mode path format stage) arguments
    (let ((root (uiop:ensure-directory-pathname path)) (version (parse-integer format)) (armed nil))
      (with-engine (engine (automatic-open root :create (string= mode "mode-write") :version version
                            :observer (lambda (engine phase) (declare (ignore engine))
                                        (when (and armed (string-equal stage (symbol-name phase))) (crash phase)) nil)))
        (cond ((string= mode "mode-write")
               (automatic-write engine 40)
               (setf armed (search "auto-page-" stage))
               (automatic-page engine)
               (setf armed t)
               (cond ((search "auto-resident-" stage) (e:configura-budget-indice-motore engine 8388608))
                     ((search "auto-compact-" stage)
                      (setf (e::motore-busy engine) t) (e::compact-automatic-disk engine))
                     (t (e:scrivi-documento engine (automatic-key 40) (value 40))))
               (error "Missing automatic-mode crash."))
              ((string= mode "mode-verify")
               (let ((committed (member stage '("after-flush" "auto-index-updated" "after-commit") :test #'string=)))
                 (automatic-check engine (if committed 41 40)) (check-frontier engine (if committed 41 40))))
              ((string= mode "mode-wrong") (check-frontier engine 999))
              (t (error "Unknown mode child."))))
      (format t "~&MODE-VERIFIED v~D ~A~%" version stage))))

(deftest test-REQ-IDX-013-SIGKILL-migrations-compaction-and-commit-v1-v2
  (dolist (version '(1 2))
    (dolist (stage '("auto-page-created" "auto-page-verified" "auto-page-published"
                     "auto-compact-created" "auto-compact-copied" "auto-compact-published"
                     "auto-resident-created" "auto-resident-verified" "auto-resident-published"
                     "before-append" "after-flush" "auto-index-updated" "after-commit"))
      (with-root (root)
        (child root version "mode-write" stage :signaled sb-posix:sigkill)
        (child root version "mode-verify" stage :exited 0)))))

(deftest test-REQ-IDX-013-startup-stamp-catches-altered-private-root
  (with-root (root)
    (with-engine (engine (automatic-open root :create t)) (automatic-write engine 10))
    (signals arcdocdb.conditions:invariant-violation
      (automatic-open root :observer
        (lambda (engine phase)
          (when (eq phase :before-admission)
            (incf (arcdocdb.index.primary::indice-primario-revision (e::motore-index engine)))) nil))
      :engine-auto-startup-source)
    (with-engine (engine (automatic-open root)) (automatic-check engine 10))))

(deftest test-REQ-IDX-013-process-oracle-detects-wrong-frontier
  (with-root (root)
    (child root 2 "mode-write" "after-commit" :signaled sb-posix:sigkill)
    (child root 2 "mode-wrong" "after-commit" :exited 1)))

(deftest test-REQ-IDX-013-retired-file-closed-after-postpublication-error-or-nonlocal-exit
  (dolist (phase '(:auto-resident-published :auto-compact-published))
    (dolist (exit '(:error :nonlocal))
      (with-root (root)
        (let ((armed nil) (old nil))
          (unwind-protect
               (with-engine (engine (automatic-open root :create t :disk-limit 589824
                                     :observer (lambda (engine step) (declare (ignore engine))
                                       (when (and armed (eq phase step))
                                         (if (eq exit :error) (error "FI-retired-source")
                                             (throw 'retired-exit :retired-exit))) nil)))
                 (automatic-write engine 30) (automatic-page engine)
                 (setf old (e::automatic-index-controller-disk (e::motore-automatic-index engine)) armed t)
                 (flet ((action ()
                          (if (eq phase :auto-resident-published)
                              (e:configura-budget-indice-motore engine 8388608)
                              (dotimes (n 1200)
                                (e:scrivi-documento engine (automatic-key (mod n 30)) (value (mod n 30)))))))
                   (if (eq exit :error) (signals simple-error (action))
                       (is (eq :retired-exit (catch 'retired-exit (action))))))
                 (is (eq :faulted (e:stato-motore engine)))
                 (is (eq :closed (arcdocdb.index.disk:disk-index-state old)))
                 (is (eq :closed (arcdocdb.io:stato-file (arcdocdb.index.disk::disk-index-input old))))
                 (is (eq :closed (arcdocdb.io:stato-file (arcdocdb.index.disk::disk-index-append old)))))
            (when old (arcdocdb.index.disk:close-disk-index old))))
        (with-engine (engine (automatic-open root)) (automatic-check engine 30))))))

(deftest test-REQ-IDX-013-increased-grant-on-resident-handle-permits-new-maintenance-peak
  (with-root (root)
    (with-engine (engine (automatic-open root :create t :budget 2097152))
      (automatic-write engine 6 65535)
      (is (eq :resident (e:modo-indice-motore engine)))
      (e:configura-budget-indice-motore engine 8388608)
      (loop for n from 6 below 12 do (e:scrivi-documento engine (automatic-key n 65535) (value n)))
      (automatic-check engine 12 :key-size 65535)
      (is (eq :resident (e:modo-indice-motore engine)))
      (is (= 0 (getf (e:statistiche-indice-motore engine) :transitions)))
      (is (null (automatic-files root))))))
