;;; OWNER: runner seriale; il worker negativo non accede ai frame dell'owner.
;;; SHARED: nessuno stato fra Serie; fixture indipendenti dal codec di prodotto.
;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-003
(in-package #:arcdocdb.index.page.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

(deftest req-idx-009-cache-hit-copie-private-e-riuso-limitato
  (dolist (size '(4096 16384 65536))
    (let ((calls 0) (target (bytes (+ size 10) 123)))
      (let ((cache (p:crea-cache-pagine size 1
                    (lambda (identity frame)
                      (incf calls)
                      (multiple-value-bind (raw start end)
                          (raw-page size :chiave #(1 2 3) 3 0
                                    :page (p::identita-pagina-page identity))
                        (replace frame raw :start2 start :end2 end)) size))))
        (let ((first (identita-fixture size)) (second (identita-fixture size :page (* size 4097))))
          (is (eq :miss (nth-value 1 (p:copia-pagina-cache cache first target :start 5))))
          (is (= (+ size 5) (p:copia-pagina-cache cache first target :start 5)))
          (is (= calls 1))
          (let ((saved (copy-seq target)))
            (fill target 7)
            (is (eq :hit (nth-value 1 (p:copia-pagina-cache cache first target :start 5))))
            (is (equalp (subseq target 5 (+ size 5)) (subseq saved 5 (+ size 5))))
            (p:copia-pagina-cache cache second target :start 5)
            (is (= calls 2))
            (is (= 123 (aref saved 0)))
            (is (eq :miss (nth-value 1 (p:copia-pagina-cache cache first target :start 5))))
            (is (= calls 3))))))))

(deftest req-idx-009-cache-identita-completa-e-fallimento-non-pubblicato
  (multiple-value-bind (raw start end identity) (raw-page 4096 :chiave #(1) 1 0)
    (let ((calls 0) (target (bytes 4096 99)))
      (let ((cache (p:crea-cache-pagine 4096 1
                    (lambda (id frame) (declare (ignore id))
                      (incf calls) (replace frame raw :start2 start :end2 end) 4096))))
        (p:copia-pagina-cache cache identity target)
        (dolist (wrong (list (identita-fixture 4096 :image 92)
                            (identita-fixture 4096 :generation 8)
                            (p:crea-identita-pagina (bytes 16) 91 (* 4096 4096) 7)))
          (fill target 99)
          (signals corruption-detected (p:copia-pagina-cache cache wrong target) :index-page-identity)
          (is (every (lambda (b) (= b 99)) target)))
        (is (= calls 4))
        (is (eq :miss (nth-value 1 (p:copia-pagina-cache cache identity target))))))))

(deftest req-idx-009-cache-corruzione-short-read-e-ripresa
  (multiple-value-bind (raw start end identity) (raw-page 4096 :chiave #(1) 1 0)
    (let ((mode :short) (target (bytes 4096 99)))
      (let ((cache (p:crea-cache-pagine 4096 1
                    (lambda (id frame) (declare (ignore id))
                      (replace frame raw :start2 start :end2 end)
                      (when (eq mode :corrupt) (setf (aref frame 96) 255))
                      (if (eq mode :short) 4095 4096)))))
        (signals arcdocdb.conditions:io-fault (p:copia-pagina-cache cache identity target)
                 :index-page-cache-short-read)
        (setf mode :corrupt)
        (signals corruption-detected (p:copia-pagina-cache cache identity target) :index-page-body-crc)
        (is (every (lambda (b) (= b 99)) target))
        (setf mode :ok)
        (is (eq :miss (nth-value 1 (p:copia-pagina-cache cache identity target))))))))

(deftest req-idx-009-cache-preflight-owner-rientro-e-nonlocal
  (let* ((id (identita-fixture 4096)) (target (bytes 4096 99)) (cache nil) (mode :unwind))
    (setf cache (p:crea-cache-pagine 4096 1
                 (lambda (identity frame) (declare (ignore identity frame))
                   (if (eq mode :unwind) (throw 'interrompi :interrotto)
                       (p:copia-pagina-cache cache id target)))))
    (signals invalid-argument (p:copia-pagina-cache cache id (bytes 4095)) :buffer-range)
    (signals invalid-argument
             (p:copia-pagina-cache cache (p:crea-identita-pagina (series) 91 1 7) target)
             :index-page-cache-alignment)
    (is (eq :interrotto (catch 'interrompi (p:copia-pagina-cache cache id target))))
    (setf mode :reentry)
    (signals invalid-argument (p:copia-pagina-cache cache id target) :index-page-cache-reentry)
    (let ((result (sb-thread:join-thread
                   (sb-thread:make-thread
                    (lambda ()
                      (handler-case (p:copia-pagina-cache cache id target)
                        (invalid-argument (c) (error-reason c))))))))
      (is (eq :index-page-cache-owner result)))
    (is (every (lambda (b) (= b 99)) target))))

(deftest req-idx-009-cache-domini-e-budget
  (dolist (args '((4095 1) (4096 0) (4096 65537) (4096 1.0)))
    (signals invalid-argument (p:crea-cache-pagine (first args) (second args) #'identity)
             :index-page-cache-configuration))
  (signals invalid-argument (p:crea-cache-pagine 4096 1 nil) :index-page-cache-configuration)
  (signals arcdocdb.conditions:resource-exhausted (p:crea-cache-pagine 65536 4097 #'identity)
           :index-page-cache-budget))

(deftest req-idx-009-cache-file-pread-corto-e-lifetime
  (multiple-value-bind (raw start end id) (raw-page 4096 :chiave #(1 2 3) 3 0)
    (declare (ignore end))
    (let* ((calls 0)
           (file (arcdocdb.io:apri-lettura "cache-page-fixture"
                   :backend (arcdocdb.io.tests::backend
                     :reader (lambda (fd buffer dest count offset)
                               (is (= fd 7))
                               (is (= offset (+ (* 4096 4096) (* calls 1024))))
                               (let ((n (min 1024 count)))
                                 (replace buffer raw :start1 dest
                                          :start2 (+ start (* calls 1024))
                                          :end2 (+ start (* calls 1024) n))
                                 (incf calls) n)))))
           (target (bytes 4096)))
      (unwind-protect
           (let ((cache (p:crea-cache-pagine-file 4096 2 file)))
             (is (eq :miss (nth-value 1 (p:copia-pagina-cache cache id target))))
             (is (= calls 4))
             (is (equalp target (subseq raw start (+ start 4096))))
             (is (eq :hit (nth-value 1 (p:copia-pagina-cache cache id target))))
             (is (= calls 4))
             (arcdocdb.io:chiudi file)
             ;; Il contratto mantiene il file vivo anche se un hit non richiede I/O.
             (signals arcdocdb.conditions:io-fault
                      (p:copia-pagina-cache cache (identita-fixture 4096 :page (* 4096 4097)) target)
                      :io-unavailable))
        (arcdocdb.io:chiudi file)))))

(deftest req-idx-009-cache-fifo-due-frame
  (let* ((calls 0) (size 4096) (target (bytes size))
         (cache (p:crea-cache-pagine size 2
                  (lambda (identity frame)
                    (incf calls)
                    (multiple-value-bind (raw start end)
                        (raw-page size :chiave #(1) 1 0 :page (p::identita-pagina-page identity))
                      (replace frame raw :start2 start :end2 end)) size)))
         (a (identita-fixture size)) (b (identita-fixture size :page (* size 4097)))
         (c (identita-fixture size :page (* size 4098))))
    (p:copia-pagina-cache cache a target)
    (p:copia-pagina-cache cache b target)
    (is (eq :hit (nth-value 1 (p:copia-pagina-cache cache a target))))
    (p:copia-pagina-cache cache c target)
    (is (eq :hit (nth-value 1 (p:copia-pagina-cache cache b target))))
    (is (eq :miss (nth-value 1 (p:copia-pagina-cache cache a target))))
    (is (= calls 4))))
