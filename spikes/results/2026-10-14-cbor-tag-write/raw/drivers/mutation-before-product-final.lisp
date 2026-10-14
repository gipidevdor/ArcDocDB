;;;; Mutazioni tag CBOR: catalogo reale congelato; esecuzione soltanto dopo letture C1.
;;;; Uso dopo freeze e due letture C1: --self-test oppure --run NUOVA-DIRECTORY
;;; REQ: REQ-CBR-007 REQ-AFF-004 REQ-AFF-008
(require :asdf)
(require :sb-posix)
(require :sb-md5)
(defpackage #:arcdocdb.ctw.mutation (:use #:cl))
(in-package #:arcdocdb.ctw.mutation)
(declaim (optimize (safety 3) (debug 3)))

;;; Semantica preregistrata; target/whitelist materializzati dopo freeze prodotto e corpus.
;;; Catalogo semantico freddo. Target e whitelist restano NIL prima del freeze prodotto/corpus.
(defparameter *planned-mutant-names*
  '("physical-capacity" "wrong-major" "swapped-words" "scan-omitted"
    "overlap-without-header" "root-node-excluded" "tag-depth-charged" "extra-return-value"))
(defparameter *catalogue-source-blob* nil)
(defparameter *catalogue-source-files* nil)
(defparameter *catalogue-corpus-files* nil)
(defparameter *catalogue-data-blob* nil)
(defparameter *catalogue-raw-fingerprints* nil)
(defparameter *mutants* nil)
(defparameter *semantic-catalogue-blob* "3c410448af31a28e99fe39f93261ced04f15860d")
(defparameter *method-blob* "3175390e496173398781bf8b39170cb33892125f")
(defparameter *corpus-plan-blob* nil)
(defparameter *corpus-plan-declared-api-calls* nil)
(defparameter *expected-corpus-count* nil)
(defparameter *corpus-frame-functions* nil)
(defparameter *cold-origin-frame* nil)
(defparameter *origin-namespace-prefix* "ARCDOCDB.CBOR.TAG.WRITE.TESTS::")

(defun catalogue-ready-p ()
  "Nessuna lettura sorgenti/copertura/child prima dei pin e dei nomi nominali congelati."
  (and (stringp *catalogue-source-blob*) (= 40 (length *catalogue-source-blob*))
       (stringp *catalogue-data-blob*) (= 40 (length *catalogue-data-blob*))
       (= 2 (length *catalogue-source-files*)) (= 3 (length *catalogue-corpus-files*))
       *catalogue-raw-fingerprints* (= 8 (length *mutants*))
       (integerp *expected-corpus-count*) (plusp *expected-corpus-count*)
       (= *expected-corpus-count* (length *corpus-frame-functions*))
       (= *expected-corpus-count*
          (length (remove-duplicates *corpus-frame-functions* :test #'string=)))
       (every (lambda (name)
                (and (stringp name)
                     (<= (length *origin-namespace-prefix*) (length name))
                     (string= *origin-namespace-prefix* name :end2 (length *origin-namespace-prefix*))
                     (search "REQ-CBR-007" name)))
              *corpus-frame-functions*)
       (stringp *cold-origin-frame*)))

(define-condition invalid-options (error)
  ((arguments :initarg :arguments :reader invalid-options-arguments))
  (:report (lambda (condition stream)
             (format stream "Opzioni mutazioni CBOR invalide: ~S."
                     (invalid-options-arguments condition)))))

(defun parse-options (arguments)
  "Dispatcher puro: self-test oppure run con directory; rifiuto prima di creare output."
  (cond ((equal arguments '("--self-test")) (values :self-test nil))
        ((and (= 2 (length arguments)) (string= (first arguments) "--run"))
         (values :run (second arguments)))
        (t (error 'invalid-options :arguments arguments))))

(defun dispatch-self-test ()
  "Due chiamate valide e sei negative; nessun I/O o directory creata."
  (dolist (fixture '((("--self-test") (:self-test nil))
                     (("--run" "new/") (:run "new/"))))
    (unless (equal (second fixture) (multiple-value-list (parse-options (first fixture))))
      (error "Dispatcher scrittura CBOR: chiamata valida interpretata diversamente.")))
  (let ((negative '(nil ("--run") ("--self-test" "extra") ("--run" "x" "extra")
                    ("--unknown") ("--scan" "--self-test"))))
    (dolist (arguments negative)
      (let ((rejected nil))
        (handler-case (parse-options arguments)
          (invalid-options () (setf rejected t)))
        (unless rejected (error "Dispatcher scrittura CBOR accetta ~S." arguments))))
    (list :status :ok :valid 2 :negative-rejected (length negative)
          :rejection-before-directory-creation t)))

(define-condition target-invalido (error)
  ((motivo :initarg :motivo :reader motivo-target))
  (:report (lambda (condizione flusso)
             (format flusso "Bersaglio della mutazione CBOR invalido: ~S."
                     (motivo-target condizione)))))

(defun source-files ()
  "Tutti i file richiesti dall'ASD, test e build; nessuna evidenza o checkout Git copiato."
  (append '(#p"arcdocdb.asd" #p"tools/build.lisp")
          (sort (append (directory "src/**/*.lisp") (directory "tests/**/*.lisp"))
                #'string< :key #'namestring)))

(defun fingerprints ()
  "MD5 dei file realmente copiati e del driver, per confrontare prima e dopo."
  (loop for file in (append (source-files)
                           '(#p"spikes/out/cbor-tag-write-20261014/drivers/mutation.lisp"
                             #p"spikes/out/cbor-tag-write-20261014/drivers/catalogue-materialized.lisp"
                             #p"spikes/out/cbor-tag-write-20261014/drivers/fixtures-and-mutations.lisp"
                             #p"spikes/out/cbor-tag-write-20261014/drivers/bench.lisp"
                             #p"spikes/out/cbor-tag-write-20261014/drivers/audit.lisp"))
        collect (list :file (enough-namestring file)
                      :md5 (format nil "~(~{~2,'0X~}~)"
                                   (coerce (sb-md5:md5sum-file file) 'list)))))

(defun read-text (path)
  "Legge esclusivamente sorgenti e log come dati CBOR."
  (uiop:read-file-string path :external-format :utf-8))

(defun substitute-first (text before after)
  "Sostituisce solo la prima occorrenza, senza riscrivere il testo sorgente originale."
  (let ((pos (search before text)))
    (unless pos (error 'target-invalido :motivo :assente))
    (concatenate 'string (subseq text 0 pos) after (subseq text (+ pos (length before))))))

(defun unique-position (text before)
  "Ogni bersaglio della campagna deve essere presente e non ambiguo."
  (let ((pos (search before text)))
    (unless pos (error 'target-invalido :motivo :assente))
    (when (search before text :start2 (1+ pos)) (error 'target-invalido :motivo :ambiguo))
    pos))

(defun validate-mutants ()
  "Ogni frammento bersaglio deve apparire una sola volta nel proprio file congelato."
  (unless (and (catalogue-ready-p)
               (= 8 (length *mutants*))
               (equal *planned-mutant-names* (mapcar #'second *mutants*)))
    (error "Catalogo mutazioni tag CBOR non allineato al prodotto congelato."))
  (dolist (pin *catalogue-raw-fingerprints*)
    (unless (string= (second pin)
                     (format nil "~(~{~2,'0X~}~)" (coerce (sb-md5:md5sum-file (first pin)) 'list)))
      (error 'target-invalido :motivo :frozen-source-mismatch)))
  (dolist (mutant *mutants*)
    (destructuring-bind (path name before after) mutant
      (unless (and (assoc path *catalogue-source-files* :test #'string=)
                   (stringp before) (plusp (length before))
                   (stringp after) (not (string= before after)))
        (error "Mutazione tag CBOR ~A: sostituzione fuori catalogo." name))
      (handler-case (unique-position (read-text path) before)
        (target-invalido (condizione)
          (error "Mutazione CBOR ~A in ~A: ~A." name path condizione)))))
  nil)

(defun compilation-failure-p (text)
  "Avvisi o diagnostiche del compilatore invalidano la copia, mai un rilevamento."
  (or (search "compilation aborted" text :test #'char-equal)
      (search "COMPILE-FILE-ERROR" text :test #'char-equal)
      (search "COMPILE-FILE-WARNED" text :test #'char-equal)
      (search "WARNING:" text :test #'char-equal)
      (search "STYLE-WARNING:" text :test #'char-equal)))

(defun line-position (text expected)
  "Posizione di riga esatta; ammette solo CR del terminatore CRLF, non citazioni."
  (loop with start = 0
        for end = (position #\Newline text :start start)
        for stop = (or end (length text))
        for line = (string-right-trim '(#\Return) (subseq text start stop))
        when (string= line expected) return start
        while end do (setf start (1+ end))))

(defun smoke-position (text)
  "Lo smoke deve essere una riga esatta precedente al rifiuto runtime."
  (line-position text "ok    ARCDOCDB:*VERSION* è una stringa"))

(defun completion-position (text)
  "Fine della build completa su riga esatta, non stringa citata nel backtrace."
  (line-position text "build e test: nessun avviso, tutti i controlli superati"))

(defun smoke-started-p (text)
  "Presenza del marker smoke esatto, anche se posto in posizione zero."
  (not (null (smoke-position text))))

(defun build-completed-p (text)
  "Presenza del marker di fine esatto."
  (not (null (completion-position text))))

(defun unhandled-position (text)
  "Accetta il solo marker SBCL a inizio riga, non citato dopo altri caratteri."
  (loop with start = 0
        for end = (position #\Newline text :start start)
        for stop = (or end (length text))
        when (and (<= (+ start 10) stop)
                  (string= "Unhandled " text :start2 start :end2 (+ start 10)))
          return start
        while end do (setf start (1+ end))))

(defun frame-start-p (line)
  "Inizio frame SBCL numerico N: (, senza accettare marker citati o testo libero."
  (let ((colon (position #\: line)))
    (and colon (plusp colon) (< (+ colon 2) (length line))
         (every #'digit-char-p (subseq line 0 colon))
         (string= ": (" line :start2 colon :end2 (+ colon 3)))))

(defun frame-whitespace-p (character)
  "Separatore Lisp ammesso nei frame ordinari e pretty-printed."
  (not (null (member character '(#\Space #\Tab #\Newline #\Return)))))

(defun corpus-frame-p (body)
  "Funzione DEFTEST nominale esatta subito dopo N: (, con zero argomenti.
Non accetta nomi citati, helper CTW, prefissi parziali o wrapper SB-KERNEL.
Le funzioni nominali ammesse sono congelate nel corpus prima delle campagne."
  (let* ((newline (position #\Newline body))
         (head (subseq body 0 newline)))
    (when (frame-start-p head)
      (let* ((start (+ 3 (position #\: head)))
             (end (position-if (lambda (character)
                                 (or (frame-whitespace-p character) (char= #\) character)))
                               body :start start))
             (closing (and end (position-if-not #'frame-whitespace-p body :start end))))
        (and end closing
             (member (subseq body start end) *corpus-frame-functions* :test #'string=)
             (char= #\) (char body closing))
             (every #'frame-whitespace-p (subseq body (1+ closing))))))))

(defun frame-string-state (line quoted escaped)
  "Conserva lo stato delle stringhe nei frame: righe citate non avviano altri frame."
  (loop for character across line
        do (cond (escaped (setf escaped nil))
                 ((and quoted (char= #\\ character)) (setf escaped t))
                 ((char= #\" character) (setf quoted (not quoted)))))
  (values quoted escaped))

(defun corpus-backtrace-p (text unhandled)
  "Un frame reale con funzione nominale congelata; citazioni multilinea escluse."
  (let ((frame nil) (quoted nil) (escaped nil))
    (flet ((corpus-p (lines)
             (corpus-frame-p (format nil "~{~A~%~}" (reverse lines)))))
      (dolist (line (uiop:split-string (subseq text unhandled) :separator '(#\Newline)))
        (when (and (not quoted) (frame-start-p line))
          (when (and frame (corpus-p frame)) (return-from corpus-backtrace-p t))
          (setf frame nil quoted nil escaped nil))
        (when (or frame (frame-start-p line))
          (push line frame)
          (multiple-value-setq (quoted escaped) (frame-string-state line quoted escaped))))
      (not (null (and frame (corpus-p frame)))))))

(defun classify-baseline-result (text exit &optional signal)
  "Baseline OK solo dopo smoke e fine ordinati, exit zero e assenza di avvisi/rifiuti."
  (let ((smoke (smoke-position text)) (completion (completion-position text)))
    (cond (signal (values :worker-error :process-signal))
          ((and (integerp exit) (not (zerop exit)) completion)
           (values :worker-error :after-build-completion))
          ((compilation-failure-p text) (values :invalid :compilation-failure))
          ((or (not (integerp exit)) (not (zerop exit))) (values :invalid :baseline-exit))
          ((null smoke) (values :invalid :before-smoke))
          ((null completion) (values :invalid :missing-build-completion))
          ((>= smoke completion) (values :invalid :reversed-build-markers))
          ((unhandled-position text) (values :invalid :unexpected-unhandled))
          (t (values :ok nil)))))

(defun classify-result (text exit &optional signal)
  "Rilevamento solo con smoke prima di Unhandled e frame REQ-CBR-007 del corpus."
  (let ((smoke (smoke-position text)) (completion (completion-position text))
        (unhandled (unhandled-position text)))
    (cond (signal (values :worker-error :process-signal))
          ((and (integerp exit) (not (zerop exit)) completion)
           (values :worker-error :after-build-completion))
          ((compilation-failure-p text) (values :invalid :compilation-failure))
          ((or (not (integerp exit)) (null smoke)) (values :invalid :before-smoke))
          ((zerop exit)
           (multiple-value-bind (status reason) (classify-baseline-result text exit)
             (if (eq status :ok) (values :survived nil) (values :invalid reason))))
          ((not (eql exit 1)) (values :invalid :mutant-exit))
          ((null unhandled) (values :invalid :missing-unhandled))
          ((>= smoke unhandled) (values :invalid :reversed-runtime-markers))
          ((not (corpus-backtrace-p text unhandled)) (values :invalid :unrelated-runtime))
          (t (values :detected nil)))))

(defun detected-p (text exit &optional signal)
  "Rilevato solo da un rifiuto runtime attribuito al corpus congelato."
  (eq :detected (classify-result text exit signal)))

(defun esigi-target-invalido (funzione motivo)
  "Verifica il self-test dei bersagli, distinguendo assenza e ambiguità."
  (let ((rilevato nil))
    (handler-case (funcall funzione)
      (target-invalido (condizione)
        (unless (eq motivo (motivo-target condizione)) (error condizione))
        (setf rilevato t)))
    (unless rilevato (error "Self-test: bersaglio invalido non rilevato."))))

(declaim (ftype (function () (values string &optional)) self-test-process-signal))
(declaim (ftype (function () (values list &optional)) worker-report-reader-self-test))

(defun classification-fixtures ()
  "Dati sintetici da nome nominale reale congelato; esiti e motivi specifici."
  (let* ((smoke "ok    ARCDOCDB:*VERSION* è una stringa")
         (end "build e test: nessun avviso, tutti i controlli superati")
         (function (first *corpus-frame-functions*))
         (frame *cold-origin-frame*)
         (failure (format nil "Unhandled SIMPLE-ERROR~%~A~%" frame))
         (runtime (format nil "~A~%~A" smoke failure))
         (full (format nil "~A~%~A~%" smoke end))
         (cases
           (list (list runtime 1 nil '(:detected nil))
                 (list full 0 nil '(:survived nil))
                 (list runtime 0 nil '(:invalid :missing-build-completion))
                 (list runtime 2 nil '(:invalid :mutant-exit))
                 (list runtime nil nil '(:invalid :before-smoke))
                 (list smoke 1 nil '(:invalid :missing-unhandled))
                 (list failure 1 nil '(:invalid :before-smoke))
                 (list (format nil "~A~A~%" failure smoke) 1 nil '(:invalid :reversed-runtime-markers))
                 (list (format nil "; ~A~%~A" smoke failure) 1 nil '(:invalid :before-smoke))
                 (list (format nil "  ~A~%~A" smoke failure) 1 nil '(:invalid :before-smoke))
                 (list (format nil "~A citato~%~A" smoke failure) 1 nil '(:invalid :before-smoke))
                 (list (format nil "0: (SEARCH ~S LOG)~%~A" smoke failure) 1 nil '(:invalid :before-smoke))
                 (list (format nil "~A~%; Unhandled SIMPLE-ERROR~%~A" smoke frame) 1 nil
                       '(:invalid :missing-unhandled))
                 (list (format nil "~A~%WARNING: foo~%~A" smoke failure) 1 nil '(:invalid :compilation-failure))
                 (list (format nil "~A~%STYLE-WARNING: foo~%~A" smoke failure) 1 nil '(:invalid :compilation-failure))
                 (list (format nil "~Acompilation aborted~%" runtime) 1 nil '(:invalid :compilation-failure))
                 (list (format nil "~ACOMPILE-FILE-ERROR~%" runtime) 1 nil '(:invalid :compilation-failure))
                 (list (format nil "~ACOMPILE-FILE-WARNED~%" runtime) 1 nil '(:invalid :compilation-failure))
                 (list full 7 nil '(:worker-error :after-build-completion))
                 (list (format nil "~AWARNING: x~%" full) 7 nil '(:worker-error :after-build-completion))
                 (list (format nil "~A~A" full failure) 1 nil '(:worker-error :after-build-completion))
                 (list runtime 1 sb-posix:sigkill '(:worker-error :process-signal))
                 (list full 0 sb-posix:sigkill '(:worker-error :process-signal))
                 (list (format nil "~A~C~%Unhandled SIMPLE-ERROR~C~%~A~C~%"
                               smoke #\Return #\Return frame #\Return) 1 nil '(:detected nil))
                 (list (format nil "~A~%Unhandled SIMPLE-ERROR~%27: (~A~%  )~%" smoke function)
                       1 nil '(:detected nil))
                 (list (format nil "~A~%Unhandled SIMPLE-ERROR~%0: (UNRELATED)~%~A~%" smoke frame)
                       1 nil '(:detected nil)))))
    (dolist (fake
              (list "0: (UNRELATED)"
                    "0: (REQ-CBR-007)"
                    "0: (ARCDOCDB.CBOR.TAG.WRITE.TESTS::OTHER)"
                    "0: (ARCDOCDB.CBOR.TAG.WRITE.TESTS::CTW-ACCEPT \"REQ-CBR-007\" NIL)"
                    "0: (UNRELATED \"ARCDOCDB.CBOR.TAG.WRITE.TESTS::CTW-ACCEPT REQ-CBR-007\")"
                    (format nil "0: (UNRELATED ~S)" function)
                    (format nil "0: (UNRELATED ~A)" function)
                    (format nil "0: (SB-KERNEL::FUNCALL ~A)" function)
                    (format nil "0: (~S)" function)
                    (format nil "0: ('~A)" function)
                    (format nil "0: (#'~A)" function)
                    (format nil "0: (~A-OTHER)" function)
                    (format nil "0: (~A NIL)" function)
                    (format nil "0: (~A ~S)" function "REQ-CBR-007")
                    (format nil "0: (ARCDOCDB.CBOR.TAG.WRITE.TESTS::TEST-REQ-CBR-007-MAP-UNREGISTERED)")
                    (format nil "not-a-number: (~A)" function)
                    (format nil " 27: (~A)" function)
                    (format nil "; ~A" frame)
                    (format nil "0: (UNRELATED ~S)~%1: (UNRELATED ~S)" function "REQ-CBR-007")
                    (format nil "0: (UNRELATED ~Cquoted~%~A~%~C)" #\" frame #\")
                    (format nil "0: (UNRELATED ~S)~%~S" function frame)))
      (push (list (format nil "~A~%Unhandled SIMPLE-ERROR~%~A~%" smoke fake)
                  1 nil '(:invalid :unrelated-runtime)) cases))
    (dolist (case cases)
      (unless (equal (fourth case) (multiple-value-list
                                    (classify-result (first case) (second case) (third case))))
        (error "Classificatore tag CBOR: caso non rispettato ~S." case)))
    (dolist (case (list (list full 0 nil '(:ok nil))
                       (list (format nil "~A~%~A~%" end smoke) 0 nil '(:invalid :reversed-build-markers))
                       (list runtime 0 nil '(:invalid :missing-build-completion))
                       (list (format nil "~A~A" full failure) 0 nil '(:invalid :unexpected-unhandled))
                       (list full 7 nil '(:worker-error :after-build-completion))
                       (list full 0 sb-posix:sigkill '(:worker-error :process-signal))
                       (list (format nil "~A~C~%~A~C~%" smoke #\Return end #\Return) 0 nil '(:ok nil))))
      (unless (equal (fourth case) (multiple-value-list
                                    (classify-baseline-result (first case) (second case) (third case))))
        (error "Baseline tag CBOR: caso non rispettato ~S." case)))
    (unless (and (= *expected-corpus-count* (length *corpus-frame-functions*))
                 (= *expected-corpus-count* (length (remove-duplicates *corpus-frame-functions* :test #'string=)))
                 (corpus-frame-p *cold-origin-frame*))
      (error "Self-test CBOR: whitelist nominale o frame freddo incoerente."))
    (list :status :ok :mutant-fixtures (length cases) :baseline-fixtures 7
          :frozen-def-test-functions *expected-corpus-count* :cold-frame *cold-origin-frame*
          :exact-marker-order-required t :corpus-req-frame-required t
          :exact-frame-function-required t :zero-argument-nominal-tests-required t
          :quoted-namespace-and-unrelated-symbol-rejected t :quoted-multiline-frame-rejected t
          :warning-or-unrelated-runtime-rejected t :reason-specific-rejection t)))

(defun self-test ()
  "Sostituzione unica, motivi specifici, classificazioni e trasporto child conservato."
  (unless (string= "xAxB" (substitute-first "xBxB" "B" "A"))
    (error "Mutazioni tag CBOR: sostituzione fuori dalla prima occorrenza."))
  (esigi-target-invalido (lambda () (substitute-first "abc" "Z" "A")) :assente)
  (esigi-target-invalido (lambda () (unique-position "xBxB" "B")) :ambiguo)
  (esigi-target-invalido (lambda () (unique-position "abc" "Z")) :assente)
  (validate-mutants)
  (list :status :ok :substitution :first-only :dispatch (dispatch-self-test)
        :classification (classification-fixtures)
        :worker-report-reader (worker-report-reader-self-test)
        :invalid-targets '(:missing :ambiguous)
        :signal-fixture-report (self-test-process-signal)
        :applicable-mutants (length *mutants*)))

(defun new-directory (name)
  "Crea con mkdir esclusivo, dopo aver creato solo i genitori; non riutilizza directory."
  (let* ((directory (merge-pathnames (uiop:ensure-directory-pathname name) (truename "./")))
         (parent (make-pathname :defaults directory :directory (butlast (pathname-directory directory))
                                :name "segnaposto" :type nil)))
    (ensure-directories-exist parent)
    (sb-posix:mkdir directory #o700)
    directory))

(defun copy-test-system (directory)
  "Copia ASD, sorgenti, test e build; ogni destinazione è nuova e appartiene alla campagna."
  (dolist (file (source-files))
    (let ((target (merge-pathnames (enough-namestring file) directory)))
      (ensure-directories-exist target)
      (uiop:copy-file file target))))

(defun isolated-runner (directory)
  "Salva il runner della copia; output ASDF in fasl locale, distinto dalle altre prove."
  (let ((runner (merge-pathnames "tools/cbor-tag-write-isolated-build.lisp" directory)))
    (with-open-file (stream runner :direction :output :if-exists :error :if-does-not-exist :create)
      (write-line ";;;; Runner della copia isolata; avvia la build rigorosa originale." stream)
      (write '(require :asdf) :stream stream) (terpri stream)
      (write `(asdf:initialize-output-translations
               '(:output-translations (,(namestring directory)
                                      ,(namestring (merge-pathnames "fasl/" directory)))
                                      :ignore-inherited-configuration)) :stream stream)
      (terpri stream)
      (write '(load "tools/build.lisp") :stream stream) (terpri stream))
    runner))

(defun execute-runner (directory)
  "Conserva log, exit code e segnale OS del runner preparato, compresa la fixture."
  (let* ((log (merge-pathnames "test.log" directory))
         (process (uiop:launch-program
                   '("sbcl" "--noinform" "--no-userinit" "--no-sysinit"
                     "--disable-debugger" "--script" "tools/cbor-tag-write-isolated-build.lisp")
                   :directory directory :output log :error-output :output)))
    (multiple-value-bind (exit signal) (uiop:wait-process process)
      (values (read-text log) exit log signal))))

(defun execute-copy (directory)
  "Esegue la build rigorosa della copia con cache locale e log conservato."
  (isolated-runner directory)
  (execute-runner directory))

(defun preserve-setup-error (log condition)
  "Conserva anche la diagnostica di setup, senza troncare un log eventualmente già scritto."
  (with-open-file (stream log :direction :output :if-exists :append :if-does-not-exist :create
                              :external-format :utf-8)
    (format stream "~&Errore di infrastruttura della campagna: ~A~%" condition)))

(defun run-baseline (directory)
  "Conserva anche guasti di setup/trasporto; nessun exit o segnale viene inventato."
  (let ((log (merge-pathnames "test.log" directory)))
    (handler-case
        (progn
          (copy-test-system directory)
          (multiple-value-bind (text exit path-log signal) (execute-copy directory)
            (multiple-value-bind (result diagnostic) (classify-baseline-result text exit signal)
              (list :status result :result result :exit-code exit :signal signal
                    :log (namestring path-log) :diagnostic diagnostic))))
      (error (condition)
        (preserve-setup-error log condition)
        (list :status :worker-error :result :worker-error :exit-code nil :signal nil
              :diagnostic :infrastructure-error :detail (princ-to-string condition)
              :log (namestring log))))))

(defun run-mutant (mutant directory)
  "Conserva copia e log anche in caso di sopravvivenza, errore di setup o compilazione."
  (destructuring-bind (path name before after) mutant
    (let ((log (merge-pathnames "test.log" directory)))
      (handler-case
          (progn
            (copy-test-system directory)
            (let* ((source (merge-pathnames path directory)) (text (read-text source)))
              (unique-position text before)
              (with-open-file (stream source :direction :output :if-exists :supersede
                                            :external-format :utf-8)
                (write-string (substitute-first text before after) stream)))
            (multiple-value-bind (text exit path-log signal) (execute-copy directory)
              (multiple-value-bind (result diagnostic) (classify-result text exit signal)
                (list :name name :source-file path :detected (eq result :detected) :exit-code exit
                      :signal signal :result result :diagnostic diagnostic :log (namestring path-log)))))
        (error (condizione)
          (preserve-setup-error log condizione)
          (list :name name :source-file path :detected nil :exit-code nil :signal nil :result :worker-error
                :diagnostic :infrastructure-error :detail (princ-to-string condizione)
                :log (namestring log)))))))

(defun save-report (report directory)
  "Aggiorna solo il report della directory esclusiva; nessun risultato tentato viene perduto."
  (when directory
    (with-open-file (stream (merge-pathnames "report.lisp" directory)
                           :direction :output :if-exists :supersede :if-does-not-exist :create)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))))

(defun record-baseline-result (report result)
  "Conserva la baseline e conta i suoi guasti worker prima di interrompere la campagna."
  (setf (getf report :baseline) result)
  (when (eq :worker-error (getf result :status))
    (incf (getf report :worker-errors 0)))
  report)

(defun append-mutation-result (report result)
  "Registra ogni risultato e conta i guasti worker separatamente dai mutanti rilevati."
  (setf (getf report :mutants) (append (getf report :mutants) (list result)))
  (when (eq :worker-error (getf result :result))
    (incf (getf report :worker-errors 0)))
  report)

(defun write-worker-fixture (directory mode)
  "Scrive un child che emette marker reali e termina solo se stesso, senza caricare il prodotto."
  (let ((runner (merge-pathnames "tools/cbor-tag-write-isolated-build.lisp" directory)))
    (ensure-directories-exist runner)
    (with-open-file (output runner :direction :output :if-exists :error :external-format :utf-8)
      (dolist (form (append '((require :sb-posix)
                             (format t "ok    ARCDOCDB:*VERSION* è una stringa~%"))
                           (when (eq mode :completion-exit)
                             '((format t "build e test: nessun avviso, tutti i controlli superati~%")))
                           '((finish-output))
                           (ecase mode
                             (:signal '((sb-posix:kill (sb-posix:getpid) sb-posix:sigkill)))
                             (:completion-exit '((sb-ext:exit :code 7))))))
        (write form :stream output :pretty t) (terpri output)))
    (namestring runner)))

(defun execute-worker-fixture (directory mode)
  "Usa il trasporto reale; restituisce tutte le osservazioni prima delle asserzioni del parent."
  (let ((runner (write-worker-fixture directory mode)))
    (multiple-value-bind (text exit log signal) (execute-runner directory)
      (multiple-value-bind (result diagnostic) (classify-result text exit signal)
        (multiple-value-bind (baseline baseline-diagnostic) (classify-baseline-result text exit signal)
          (list :name mode :result result :detected (eq result :detected)
                :baseline-status baseline :baseline-diagnostic baseline-diagnostic
                :exit-code exit :signal signal :diagnostic diagnostic
                :runner runner :log (namestring log)))))))

(defun check-worker-fixture (entry)
  "Valida osservazioni già salvate: entrambi i classificatori rifiutano i due guasti reali."
  (let* ((mode (getf entry :name)) (text (read-text (getf entry :log)))
         (expected (ecase mode (:signal :process-signal) (:completion-exit :after-build-completion)))
         (counter-report (list :worker-errors 0)))
    (setf counter-report
          (record-baseline-result counter-report (list :status (getf entry :baseline-status))))
    (unless (and (eq :worker-error (getf entry :result))
                 (eq :worker-error (getf entry :baseline-status))
                 (eq expected (getf entry :diagnostic)) (eq expected (getf entry :baseline-diagnostic))
                 (= 1 (getf counter-report :worker-errors)) (smoke-started-p text)
                 (ecase mode
                   (:signal (and (eql (getf entry :signal) sb-posix:sigkill)
                                 (not (eql (getf entry :exit-code) 0)) (not (build-completed-p text))))
                   (:completion-exit (and (eql (getf entry :exit-code) 7)
                                          (null (getf entry :signal)) (build-completed-p text)))))
      (error "Self-test CBOR: segnale/guasto finale perso o contato come rilevamento.")))
  nil)

(define-condition invalid-worker-report (error)
  ((reason :initarg :reason :reader worker-report-reason))
  (:report (lambda (condition stream)
             (format stream "Report worker CBOR invalido: ~S." (worker-report-reason condition)))))

(defun read-worker-report-stream (input)
  "Una sola forma e EOF non rappresentabile; nessuna dipendenza dal lettore del chiamante."
  (let ((*read-eval* nil) (*readtable* (copy-readtable nil)) (*read-base* 10)
        (*read-suppress* nil) (*package* (find-package :cl-user)) (eof (gensym "EOF")))
    (handler-case
        (let ((data (read input nil eof)))
          (when (eq data eof) (error 'invalid-worker-report :reason :empty))
          (unless (eq eof (read input nil eof))
            (error 'invalid-worker-report :reason :trailing))
          data)
      (invalid-worker-report (condition) (error condition))
      (error () (error 'invalid-worker-report :reason :reader)))))

(defun worker-report-reader-self-test ()
  "Rifiuti specifici: anche una forma letterale :EOF dopo il report è trailing."
  (let ((accepted '(:worker-errors 2 :mutants nil)) (negative 0))
    (with-input-from-string (input "(:worker-errors 2 :mutants nil)")
      (unless (equal accepted (read-worker-report-stream input))
        (error "Self-test CBOR: dati del report alterati dal lettore.")))
    (dolist (fixture '(("(:worker-errors 2 :mutants nil) :eof" :trailing)
                       ("(:worker-errors 2 :mutants nil) nil" :trailing)
                       ("(:worker-errors 2 :mutants nil) (:extra 1)" :trailing)
                       ("#.(list :worker-errors 2)" :reader)
                       ("" :empty)))
      (let ((observed nil))
        (with-input-from-string (input (first fixture))
          (handler-case (read-worker-report-stream input)
            (invalid-worker-report (condition) (setf observed (worker-report-reason condition)))))
        (unless (eq observed (second fixture))
          (error "Self-test CBOR: motivo reader atteso ~S, osservato ~S." (second fixture) observed))
        (incf negative)))
    (let ((*readtable* (copy-readtable nil)))
      (set-macro-character #\( (lambda (stream character)
                                (declare (ignore stream character))
                                (error "Readtable del chiamante eseguita.")))
      (with-input-from-string (input "(:worker-errors 2 :mutants nil)")
        (unless (equal accepted (read-worker-report-stream input))
          (error "Self-test CBOR: readtable standard non ripristinata."))))
    (list :status :ok :positive 2 :negative negative :literal-eof-rejected t
          :read-eval-disabled t :standard-readtable-required t :specific-reasons-required t)))

(defun verify-worker-fixture-report (directory report)
  "Rilegge dati con EOF univoco; due guasti, nessun rilevamento, exit/segnale conservati."
  (let* ((saved (with-open-file (input (merge-pathnames "report.lisp" directory) :external-format :utf-8)
                  (read-worker-report-stream input)))
         (entries (getf saved :mutants))
         (signal-entry (first entries)) (completion-entry (second entries)))
    (unless (and (= 2 (getf saved :worker-errors)) (= 2 (length entries))
                 (equal entries (getf report :mutants))
                 (every (lambda (entry) (and (eq :worker-error (getf entry :result))
                                            (not (getf entry :detected)))) entries)
                 (eql sb-posix:sigkill (getf signal-entry :signal))
                 (not (eql 0 (getf signal-entry :exit-code)))
                 (null (getf completion-entry :signal)) (eql 7 (getf completion-entry :exit-code)))
      (error "Self-test CBOR: esiti, exit, segnale o contatori non conservati.")))
  nil)

(defun self-test-baseline-infrastructure (directory)
  "Inietta rifiuti dichiarati prima/dopo la copia; non compila prodotto o avvia altri child."
  (let ((copy-function (symbol-function 'copy-test-system))
        (execute-function (symbol-function 'execute-copy)) (paths nil))
    (unwind-protect
         (dolist (mode '(:copy :transport))
           (let* ((child (new-directory (merge-pathnames (format nil "baseline-~(~A~)/" mode) directory)))
                  (report (list :schema-version 1 :kind :baseline-infrastructure-self-test :status :running
                                :stage :setup :worker-errors 0 :injected-boundary mode)))
             (setf (symbol-function 'copy-test-system)
                   (if (eq mode :copy)
                       (lambda (target) (declare (ignore target)) (error "Fixture baseline copy refusal."))
                       (lambda (target) (declare (ignore target)) nil))
                   (symbol-function 'execute-copy)
                   (lambda (target) (declare (ignore target)) (error "Fixture baseline transport refusal.")))
             (setf report (record-baseline-result report (run-baseline child)))
             (save-report report child)
             (let ((baseline (getf report :baseline)))
               (unless (and (eq :worker-error (getf baseline :status))
                            (eq :worker-error (getf baseline :result))
                            (eq :infrastructure-error (getf baseline :diagnostic))
                            (null (getf baseline :exit-code)) (null (getf baseline :signal))
                            (= 1 (getf report :worker-errors))
                            (search "Fixture baseline" (read-text (getf baseline :log))))
                 (error "Self-test CBOR: guasto baseline senza log/esito/contatore.")))
             (setf (getf report :status) :passed (getf report :stage) :complete)
             (save-report report child)
             (push (namestring (merge-pathnames "report.lisp" child)) paths)))
      (setf (symbol-function 'copy-test-system) copy-function
            (symbol-function 'execute-copy) execute-function))
    (nreverse paths)))

(defun self-test-process-signal ()
  "Conserva runner/log/report di SIGKILL ed exit7 reali; soltanto i child vengono terminati."
  (let* ((directory (new-directory
                     (format nil "spikes/out/cbor-tag-write-20261014/drivers/selftests/~D-worker-~D/"
                             (get-universal-time) (sb-posix:getpid))))
         (report (list :schema-version 1 :kind :process-signal-self-test :scope :cbor-tag-write
                       :status :running :stage :runner :worker-errors 0 :mutants nil)))
    (save-report report directory)
    (handler-case
        (progn
          (dolist (mode '(:signal :completion-exit))
            (let ((entry (execute-worker-fixture
                          (new-directory (merge-pathnames (format nil "~(~A~)/" mode) directory)) mode)))
              (setf report (append-mutation-result report entry))
              (save-report report directory)
              (check-worker-fixture entry)))
          (verify-worker-fixture-report directory report)
          (setf (getf report :baseline-fixture-reports) (self-test-baseline-infrastructure directory))
          (setf (getf report :status) :passed (getf report :stage) :complete)
          (save-report report directory))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (save-report report directory)
        (error condition)))
    (format t "~&Scrittura CBOR: self-test worker superato; ~A~%"
            (merge-pathnames "report.lisp" directory))
    (namestring (merge-pathnames "report.lisp" directory))))

(defun initial-report (before)
  "Rapporto del solo catalogo congelato della scrittura, prima di qualunque child."
  (list :schema-version 1 :kind :cbor-tag-write-mutations :status :running
        :worker-errors 0 :mutants nil
        :catalogue-source-blob *catalogue-source-blob*
        :catalogue-source-files *catalogue-source-files*
        :catalogue-corpus-files *catalogue-corpus-files*
        :catalogue-data-blob *catalogue-data-blob*
        :catalogue-raw-fingerprints *catalogue-raw-fingerprints*
        :corpus-frame-functions *corpus-frame-functions* :cold-origin-frame *cold-origin-frame*
        :frozen-other-driver-blobs
        '(("bench.lisp" "eeaa1a0d34d6bd94d5cf7c1d62e9c4027b0f5027")
          ("audit.lisp" "f6f08f777e8115e626f39e90f3722a72658d9750"))
        :semantic-catalogue-blob *semantic-catalogue-blob*
        :method-blob *method-blob* :corpus-plan-blob *corpus-plan-blob*
        :corpus-plan-declared-api-calls *corpus-plan-declared-api-calls*
        :expected-corpus-count *expected-corpus-count*
        :planned-mutant-names *planned-mutant-names*
        :catalogue-status (if (and *catalogue-source-blob* (= 8 (length *mutants*)))
                              :aligned :awaiting-frozen-product)
        :recorded-at (get-universal-time) :sbcl (lisp-implementation-version)
        :source-fingerprints-before before
        :targets (loop for (path name old new) in *mutants*
                       collect (list :source-file path :name name :before old :after new))
        :limits '(:targeted-mutants-only :prevalidated-tag-composition
                  :compile-failure-not-detection :warning-not-detection
                  :ordered-smoke-and-runtime-markers :exact-frozen-nominal-test-frame :zero-argument-frozen-origin
                  :full-asdf-private-baseline
                  :whole-destination-preserved-on-public-error
                  :raw-hash-declarations-not-authenticity-proof :ignored-drivers-not-in-outer-tracked-inventory
                  :no-durability-engine-or-release-qualification)))

(defun main ()
  "Self-test o otto copie nuove; plist finale e exit nonzero per campagna non valida."
  (let* ((args (rest sb-ext:*posix-argv*)) (before nil) (directory nil)
         (action nil) (output nil)
         (report (initial-report before)))
    (handler-case
        (progn
          (multiple-value-setq (action output) (parse-options args))
          (unless (catalogue-ready-p)
            (error 'target-invalido :motivo :awaiting-frozen-product-and-corpus))
          (setf before (fingerprints)
                (getf report :source-fingerprints-before) before)
          (setf (getf report :self-test) (self-test))
          (when (eq action :run)
            (setf directory (new-directory output))
            (save-report report directory)
            (setf report (record-baseline-result
                          report (run-baseline (new-directory (merge-pathnames "baseline/" directory)))))
            (save-report report directory)
            (unless (eq (getf (getf report :baseline) :status) :ok)
              (error "Mutazioni CBOR: baseline invariata non riuscita."))
            (loop for mutant in *mutants* for i from 0
                  do (let* ((child (new-directory (merge-pathnames (format nil "~D/" i) directory)))
                            (result (run-mutant mutant child)))
                       (setf report (append-mutation-result report result))
                       (save-report report directory)))
            (unless (and (= 8 (length (getf report :mutants)))
                         (every (lambda (result) (getf result :detected)) (getf report :mutants)))
              (error "Mutazioni CBOR: sopravvivenza, worker-error o errore prima dello smoke.")))
          (setf (getf report :status) :ok))
      (error (condizione) (setf (getf report :status) :failed
                               (getf report :diagnostic)
                               (format nil "spikes/out/cbor-tag-write-20261014/drivers/mutation.lisp: ~A" condizione))))
    (let ((after (and before (fingerprints))))
      (setf (getf report :source-fingerprints-after) after
            (getf report :source-consistency) (cond ((null before) :not-observed)
                                                    ((equal before after) :stable)
                                                    (t :changed)))
      (when (and (eq (getf report :status) :ok) (not (equal before after)))
        (setf (getf report :status) :source-changed
              (getf report :diagnostic)
              "spikes/out/cbor-tag-write-20261014/drivers/mutation.lisp: sorgenti cambiati durante l'esecuzione.")))
    (save-report report directory)
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq (getf report :status) :ok) (sb-ext:exit :code 1))))

(main)
