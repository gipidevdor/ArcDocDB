;;; OWNER: controller conserva l'Archivio canonico fino al binding; candidato ancora privato.
;;; SHARED: un CAS nel bootstrap, nessun accesso al binding per lotto, documento o lettura.
(in-package #:arcdocdb.runtime)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-MVC-006 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (runtime-archivio u32 u32 ambito-get) null) verifica-runtime-iniziale))
(defun verifica-runtime-iniziale (runtime high low old-scope)
  "Pre: private candidate, no CSN assigned or snapshot registered.
Post: snapshot EQ-bound to the candidate registry, ultimo=H=M without increment.
INVARIANT-VIOLATION :ARCHIVE-RUNTIME-LINK/BASE before CAS; no source queried."
  (unless (and (not (eq old-scope (ambito-runtime-archivio runtime)))
               (eq (arcdocdb.mvcc::registro-snapshot-csns (snapshot-runtime-archivio runtime))
                   (csn-runtime-archivio runtime)))
    (error 'invariant-violation :reason :archive-runtime-link))
  (multiple-value-bind (lh ll hh hl) (leggi-frontiere-csn (csn-runtime-archivio runtime))
    (unless (and (= high lh hh) (= low ll hl))
      (error 'invariant-violation :reason :archive-runtime-base)))
  nil)

;;; REQ: REQ-REC-001 REQ-MVC-006 REQ-MVC-008 REQ-MVC-007 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (piano-csn-archivio t t
                          &key (:csn-capacity t) (:snapshot-capacity t)
                               (:worker-capacity t) (:retirement-capacity t)) runtime-archivio)
                crea-runtime-archivio))
(defun crea-runtime-archivio (plan lifetime-ticks wait-ticks
                             &key (csn-capacity 256) (snapshot-capacity 256)
                                  (worker-capacity 64) (retirement-capacity 256))
  "Pre: complete frozen plan, single catalog Archivio object; exclusive recovery.
Explicit durations in the same monotonic unit supplied to future snapshot calls.
Post: one CSN(M)/snapshot/EBR/scope family only, published with CAS without admitting traffic.
INVALID-ARGUMENT for configuration or :ARCHIVE-RUNTIME-BOUND; no losing candidate returned.
Propagates TYPE-ERROR and INVARIANT-VIOLATION for plan/binding/links/base: stop bootstrap.
No I/O or clock; uses existing private registries. Errors before CAS publish no candidates.
No rollback after CAS: TROVA-RUNTIME-ARCHIVIO retrieves the capability even after interruption."
  (verifica-configurazione-runtime csn-capacity snapshot-capacity worker-capacity
                                  retirement-capacity lifetime-ticks wait-ticks)
  (verifica-piano-runtime plan)
  (let ((archive (arcdocdb.recovery.archive.csn::piano-csn-archivio-archive plan)))
    (when (trova-runtime-archivio archive)
      (error 'invalid-argument :reason :archive-runtime-bound))
    (multiple-value-bind (high low) (parole-base-csn-archivio plan)
      (let* ((csns (crea-registro-csn :capacity csn-capacity :initial-high high :initial-low low))
             (snapshots (crea-registro-snapshot csns snapshot-capacity lifetime-ticks wait-ticks))
             (epochs (crea-registro-epoche worker-capacity retirement-capacity))
             (runtime (%make-runtime-archivio csns (crea-ambito-get epochs snapshots))))
        (verifica-runtime-iniziale runtime high low (arcdocdb.recovery.archive::archivio-recovery-scope archive))
        (sb-thread:barrier (:write))
        (unless (null (sb-ext:compare-and-swap
                       (arcdocdb.recovery.archive::archivio-recovery-runtime archive) nil runtime))
          (error 'invalid-argument :reason :archive-runtime-bound))
        runtime))))
