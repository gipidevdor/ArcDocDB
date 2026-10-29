;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003 REQ-AFF-003
(in-package #:arcdocdb.index.page.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(deftest req-idx-009-lookup-inline-tre-taglie-collisioni-e-assenza
  (dolist (size '(4096 16384 65536))
    (let* ((keys (loop for i below 20 collect (lookup-key 3 i)))
           (page (lookup-page size :bucket (bucket-body size keys :collision t) 20 (capacity size) (* size 30)))
           (reader (lookup-reader size (* size 30) (list page))) (words (lookup-words)))
      (dolist (key keys)
        (is (eq :live (lookup-candidate reader key words)))
        (is (= (aref words 0) #xffffffffffffffff))
        (is (= (aref words 1) #xffffffff00000070))
        (is (= (aref words 2) (+ (ash 1 48) (ash 2 32))))
        (is (= (aref words 3) 27)) (is (zerop (aref words 4))))
      (fill words 99)
      (is (eq :absent (lookup-candidate reader (lookup-key 3 99) words)))
      (is (every (lambda (n) (= n 99)) words)))))

(deftest req-idx-009-lookup-directory-multilivello-e-overflow
  (let* ((size 4096) (a (lookup-page size :bucket (bucket-body size (list #(1)) :collision t) 1 32 (* size 10)))
         (b (lookup-page size :bucket (bucket-body size (list #(2)) :collision t) 1 32 (* size 20)
                         :next (* size 10)))
         (lower (lookup-directory size (* size 30) 0 (* size 20) 62))
         (root (lookup-directory size (* size 40) 0 (* size 30) 63))
         (reader (lookup-reader size (* size 40) (list a b lower root))) (words (lookup-words)))
    ;; #x89abcdef: bit 63=1, bit 62=0: figlio sinistro della directory inferiore.
    (let ((body (cdr lower)))
      (ref-write body 96 (* size 20) 8) (ref-write body 104 7 8)
      (ref-write body 112 0 8) (ref-write body 120 0 8) (repair body 0 size))
    (is (eq :live (lookup-candidate reader (lookup-key 1) words)))
    (is (eq :live (lookup-candidate reader (lookup-key 2) words)))
    (fill words 99)
    (is (eq :absent (lookup-candidate reader (lookup-key 3) words)))
    (is (eq :absent (lookup-candidate reader (lookup-key 1) words #x09abcdef)))
    (is (every (lambda (n) (= n 99)) words))))

(deftest req-idx-009-lookup-radix-confini-u32
  (dolist (bits '(1 2 7 9 11))
    (loop for shift from 0 to (- 64 bits) do
      (dolist (high '(0 1 #x89abcdef #xffffffff))
        (dolist (low '(0 1 #x76543210 #xffffffff))
          (is (= (p::radix-digest-pagina high low bits shift)
                 (ldb (byte bits shift) (logior (ash high 32) low)))))))))

(deftest req-idx-009-lookup-chiave-massima-esterna-cache-un-frame
  (dolist (size '(4096 16384 65536))
    (let* ((key (bytes 65535 127)) (chunk (- size 96)) (parts (ceiling 65535 chunk))
           (pages nil) (words (lookup-words)))
      (dotimes (i parts)
        (let* ((start (* i chunk)) (end (min (+ start chunk) 65535)) (page (* size (- 100 i))))
          (push (lookup-page size :chiave (subseq key start end) 65535 start page
                             :next (if (= end 65535) 0 (- page size))) pages)))
      (push (lookup-page size :bucket (bucket-body size (list key) :external t :collision t) 1
                         (capacity size) (* size 200)) pages)
      (let ((reader (lookup-reader size (* size 200) pages)))
        (is (eq :live (lookup-candidate reader key words)))
        (is (= (aref words 2) (+ (ash 1 48) (ash 65535 32))))
        (setf (aref key 65534) 126)
        (fill words 99)
        (is (eq :absent (lookup-candidate reader key words)))
        (is (every (lambda (n) (= n 99)) words))))))

(deftest req-idx-009-lookup-budget-pagine-byte-e-ripristino
  (let* ((size 4096) (page (lookup-page size :bucket (bucket-body size (list #(1 2)) :collision t) 1 32 (* size 10)))
         (root (lookup-directory size (* size 20) 0 (* size 10) 63)) (words (lookup-words))
         (one (lookup-reader size (* size 20) (list page root) :max-pages 1))
         (short (lookup-reader size (* size 10) (list page) :max-key-bytes 1)))
    (signals arcdocdb.conditions:resource-exhausted (lookup-candidate one (lookup-key 1 2) words)
             :index-page-lookup-page-budget)
    (signals arcdocdb.conditions:resource-exhausted (lookup-candidate short (lookup-key 1 2) words)
             :index-page-lookup-key-budget)
    (is (every (lambda (n) (= n 99)) words))
    ;; Crediti ripristinati a ogni richiesta; assenza prima dei confronti resta ordinaria.
    (is (eq :absent (lookup-candidate one (lookup-key 1 2) words 0)))
    (is (eq :absent (lookup-candidate short (lookup-key 1) words)))))

(deftest req-idx-009-cache-cursore-privato-non-altera-identita-frame
  (let* ((size 4096) (page (lookup-page size :bucket (bucket-body size nil) 0 32 (* size 10)))
         (id (identita-fixture size :page (* size 10))) (target (bytes size)))
    (multiple-value-bind (reader cache) (lookup-reader size (* size 10) (list page))
      (declare (ignore reader))
      (p:copia-pagina-cache cache id target)
      (setf (p::identita-pagina-page id) (* size 20))
      (is (eq :hit (nth-value 1 (p:copia-pagina-cache cache
                                (identita-fixture size :page (* size 10)) target)))))))

(deftest req-idx-001-lookup-differenziale-primario-residente
  (let* ((size 4096) (keys (loop for i below 6 collect (lookup-key 3 i)))
         (page (lookup-page size :bucket (bucket-body size keys :collision t) 6 32 (* size 10)))
         (reader (lookup-reader size (* size 10) (list page)))
         (resident (arcdocdb.index.primary:crea-indice-primario :capacity 32 :arena-bytes 4096))
         (context (arcdocdb.index.primary:crea-contesto-indice)) (wanted (lookup-words)) (actual (lookup-words)))
    (setf (aref wanted 0) #xffffffffffffffff (aref wanted 1) #xffffffff00000070
          (aref wanted 2) (+ (ash 1 48) (ash 2 32)) (aref wanted 3) 27 (aref wanted 4) 0)
    (dolist (key keys)
      (arcdocdb.index.primary:pubblica-chiave-indice resident
        (arcdocdb.index.primary:frammento-corrente-indice resident #x89abcdef)
        key 0 2 #x89abcdef 5 wanted context))
    (dolist (key (append keys (list (lookup-key 3 99) (lookup-key 3))))
      (is (eq (lookup-candidate reader key actual)
              (arcdocdb.index.primary:leggi-indice-primario resident key 0 (length key)
                                                         #x89abcdef 5 context wanted)))
      ;; Offset arena privato del residente; gli altri bit del candidato coincidono.
      (setf (aref wanted 2) (logand (aref wanted 2) #xffffffff00000000))
      (is (equalp wanted actual)))))

(deftest req-idx-009-lookup-corruzioni-trapagine-e-output-intatto
  (let ((size 4096))
    ;; Pagine localmente valide; solo il percorso rileva i campi radix sovrapposti.
    (let* ((child (lookup-directory size (* size 20) 0 0 63))
           (root (lookup-directory size (* size 30) 0 (* size 20) 63))
           (reader (lookup-reader size (* size 30) (list child root))) (words (lookup-words)))
      (signals corruption-detected (lookup-candidate reader (lookup-key 1) words)
               :index-page-lookup-directory-order)
      (is (every (lambda (n) (= n 99)) words)))
    (let* ((child (lookup-page size :chiave #(1) 1 0 (* size 10)))
           (bucket (lookup-page size :bucket (bucket-body size nil) 0 32 (* size 20) :next (* size 10)))
           (reader (lookup-reader size (* size 20) (list child bucket))) (words (lookup-words)))
      (signals corruption-detected (lookup-candidate reader (lookup-key 1) words) :index-page-lookup-page-kind)
      (is (every (lambda (n) (= n 99)) words)))
    (let* ((key (bytes 5000 1))
           ;; Frammento finale valido, posizione diversa da quella attesa dalla entry.
           (child (lookup-page size :chiave (bytes 4000 1) 5000 1000 (* size 100)))
           (bucket (lookup-page size :bucket (bucket-body size (list key) :external t :collision t) 1 32 (* size 200)))
           (reader (lookup-reader size (* size 200) (list child bucket))) (words (lookup-words)))
      (signals corruption-detected (lookup-candidate reader key words) :index-page-lookup-key-chain)
      (is (every (lambda (n) (= n 99)) words)))))

(deftest req-idx-009-lookup-io-crc-e-nonlocal-senza-risultato
  (let* ((size 4096) (key (lookup-key 1)) (words (lookup-words)) (mode :unwind)
         (page (cdr (lookup-page size :bucket (bucket-body size (list key) :collision t) 1 32 (* size 10))))
         (cache (p:crea-cache-pagine size 1
                  (lambda (identity buffer) (declare (ignore identity))
                    (case mode
                      (:unwind (throw 'stop-lookup :stopped))
                      (:io (error 'arcdocdb.conditions:io-fault :reason :fixture-io :operation :read))
                      (:corrupt (replace buffer page) (setf (aref buffer 96) 254) size)
                      (:ok (replace buffer page) size)
                      (otherwise (error "Modalita fixture sconosciuta"))))))
         (reader (p:crea-lettore-indice-pagine cache (identita-fixture size :page (* size 10)))))
    (is (eq :stopped (catch 'stop-lookup (lookup-candidate reader key words))))
    (setf mode :io)
    (signals arcdocdb.conditions:io-fault (lookup-candidate reader key words) :fixture-io)
    (setf mode :corrupt)
    (signals corruption-detected (lookup-candidate reader key words) :index-page-body-crc)
    (is (every (lambda (n) (= n 99)) words))
    (setf mode :ok)
    (is (eq :live (lookup-candidate reader key words)))))

(deftest req-idx-009-lookup-preflight-owner-rientro-e-budget-factory
  (let* ((size 4096) (id (identita-fixture size)) (words (lookup-words)) (reader nil)
         (cache (p:crea-cache-pagine size 1
                  (lambda (identity buffer) (declare (ignore identity buffer))
                    (lookup-candidate reader (lookup-key 1) words)))))
    (dolist (budget '(0 -1 65537 1.0))
      (signals invalid-argument (p:crea-lettore-indice-pagine cache id :max-pages budget)
               :index-page-lookup-budgets))
    (dolist (budget '(0 -1 16777217 1.0))
      (signals invalid-argument (p:crea-lettore-indice-pagine cache id :max-key-bytes budget)
               :index-page-lookup-budgets))
    (setf reader (p:crea-lettore-indice-pagine cache id))
    (signals invalid-argument (lookup-candidate reader (bytes 0) words) :index-page-lookup-key-length)
    (signals invalid-argument (p:leggi-indice-pagine reader (lookup-key 1) 0 2 0 0 words) :buffer-range)
    (signals invalid-argument (p:leggi-indice-pagine reader (lookup-key 1) -1 1 0 0 words) :buffer-range)
    (signals invalid-argument (lookup-candidate reader (lookup-key 1) words) :index-page-lookup-reentry)
    (is (eq :index-page-lookup-owner
            (sb-thread:join-thread
             (sb-thread:make-thread
              (lambda ()
                (handler-case (lookup-candidate reader (lookup-key 1) words)
                  (invalid-argument (c) (error-reason c))))))))
    (is (every (lambda (n) (= n 99)) words))))

(deftest req-idx-009-lookup-empty-prima-candidato-nello-stesso-gruppo
  (let* ((size 4096) (body (bucket-body size (list #(1)) :collision t))
         (entry (subseq body 32 96)) (words (lookup-words)))
    (setf (aref body 0) 255 (aref body 7) 5)
    (fill body 0 :start 32 :end 96)
    (replace body entry :start1 (+ 32 (* 7 64)))
    (let* ((page (lookup-page size :bucket body 1 32 (* size 10)))
           (reader (lookup-reader size (* size 10) (list page))))
      (is (eq :live (lookup-candidate reader (lookup-key 1) words)))
      (fill words 99)
      (is (eq :absent (lookup-candidate reader (lookup-key 2) words)))
      (is (every (lambda (n) (= n 99)) words)))))

(deftest req-idx-009-lookup-budget-esatto-e-factory-massima
  (let* ((size 4096) (key (lookup-key 1 2)) (words (lookup-words))
         (page (lookup-page size :bucket (bucket-body size (list key) :collision t) 1 32 (* size 10)))
         (root (lookup-directory size (* size 20) 0 (* size 10) 63)))
    (multiple-value-bind (reader cache)
        (lookup-reader size (* size 20) (list page root) :max-pages 2 :max-key-bytes 2)
      (is (eq :live (lookup-candidate reader key words)))
      (is (typep (p:crea-lettore-indice-pagine cache (identita-fixture size :page (* size 20))
                                             :max-pages 65536 :max-key-bytes 16777216)
                 'p:lettore-indice-pagine)))))

(deftest req-idx-009-lookup-digest-completo-alias-e-csn-parole
  (let* ((size 4096) (key (lookup-key 1)) (words (lookup-words))
         (page (lookup-page size :bucket (bucket-body size (list key) :collision t) 1 32 (* size 10)))
         (reader (lookup-reader size (* size 10) (list page))))
    (is (eq :absent (lookup-candidate reader key words #x99abcdef)))
    (is (eq :absent (lookup-candidate reader key words #x89abcdef 6)))
    (signals invalid-argument
             (p:leggi-indice-pagine reader (p::lettore-indice-pagine-bucket reader) 0 1 0 0 words)
             :index-page-lookup-alias)
    (signals invalid-argument
             (p:leggi-indice-pagine reader (p::lettore-indice-pagine-key-page reader) 0 1 0 0 words)
             :index-page-lookup-alias)
    (is (every (lambda (n) (= n 99)) words))
    (dolist (csn '(1 4294967296))
      (ref-write (cdr page) (+ 96 32 8) csn 8)
      (repair (cdr page) 0 size)
      (let ((fresh (lookup-reader size (* size 10) (list page))))
        (is (eq :live (lookup-candidate fresh key words)))
        (is (= (aref words 0) csn))))))

(deftest req-idx-009-lookup-totale-chiave-esterno-incoerente
  (let* ((size 4096) (key (bytes 5000 1)) (words (lookup-words))
         (child (lookup-page size :chiave (bytes 4000 1) 5001 0 (* size 100) :next (* size 99)))
         (bucket (lookup-page size :bucket (bucket-body size (list key) :collision t :external t)
                             1 32 (* size 200)))
         (reader (lookup-reader size (* size 200) (list child bucket))))
    (signals corruption-detected (lookup-candidate reader key words) :index-page-lookup-key-chain)
    (is (every (lambda (n) (= n 99)) words))))
