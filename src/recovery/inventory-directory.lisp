;;;; Inventario completo del namespace segments, ancorato alla directory posseduta.
;;; OWNER: il controller mantiene directory e namespace esclusivi fino al ritorno.
;;; SHARED: nomi, descrittori e mappa delle identità privati; nessuna mutazione fra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-AFF-008
(declaim (ftype (function (simple-string simple-string) boolean)
                inventory-name-suffix-p))
(defun inventory-name-suffix-p (name suffix)
  "Pre: stable names with bytes represented without conversion. Post: case-insensitive ASCII suffix match.
The loop has length(SUFFIX) steps; no normalization of the original name."
  (let ((start (- (length name) (length suffix))))
    (and (not (minusp start))
         (loop for i below (length suffix)
               for code = (char-code (schar name (+ start i)))
               always (= (if (<= 65 code 90) (+ code 32) code)
                         (char-code (schar suffix i)))))))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-AFF-008
(declaim (ftype (function (simple-string)
                         (values u64 (member nil :temporary :final) &optional))
                parse-inventory-segment-name))
(defun parse-inventory-segment-name (name)
  "Pre: leaf name owned by the complete inventory. Post: u64 ID and form, or 0/NIL if unrelated.
Only 16 lowercase ASCII digits followed by .seg/.seg.tmp; zero allowed.
CORRUPTION-DETECTED for a segment suffix with noncanonical case, length, or digits.
At most 16 parsing steps; no Lisp reader, path, or ID narrowing."
  (let* ((form (cond ((inventory-name-suffix-p name ".seg.tmp") :temporary)
                     ((inventory-name-suffix-p name ".seg") :final)
                     (t nil)))
         (suffix (if (eq form :temporary) ".seg.tmp" ".seg"))
         (id 0))
    (unless form (return-from parse-inventory-segment-name (values 0 nil)))
    (unless (and (= (length name) (+ 16 (length suffix)))
                 (string= name suffix :start1 16))
      (error 'corruption-detected :reason :inventory-segment-name))
    (dotimes (i 16)
      (let* ((code (char-code (schar name i)))
             (digit (cond ((<= 48 code 57) (- code 48))
                          ((<= 97 code 102) (- code 87))
                          (t (error 'corruption-detected :reason :inventory-segment-name)))))
        (setf id (+ (ash id 4) digit))))
    (values id form)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (manifest arcdocdb.io:file-io integer integer t t t) null)
                check-directory-inventory-preflight))
(defun check-directory-inventory-preflight
    (manifest directory max-files max-segments max-names max-total-name-bytes max-name-bytes)
  "Pre: manifest and controller capabilities. Post: modes, callbacks, and budgets verified without I/O.
Propagates typed errors; missing entry-identity does not fall back to the native backend."
  (arcdocdb.io::esigi-aperto directory :directory)
  (let ((backend (arcdocdb.io::file-backend directory)))
    (when (and backend (null (arcdocdb.io::backend-entry-identity backend)))
      (error 'arcdocdb.conditions:unsupported-format :reason :io-entry-identity-unavailable)))
  (check-inventory-budgets manifest #() max-files max-segments)
  (arcdocdb.io::verifica-budget-directory max-names max-total-name-bytes max-name-bytes)
  nil)

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-001 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (arcdocdb.io:file-io simple-vector index)
                         (values simple-vector &optional)) collect-directory-segments))
(defun collect-directory-segments (directory names max-files)
  "Pre: complete/stable inventory, private names validated by I/O. Post: owned descriptors.
One relative nofollow check per candidate within budget; aliases between distinct names are corruption.
No segment FD opened, no namespace effects; no partial result."
  (let ((files nil) (count 0) (identities (make-hash-table :test 'equal)))
    (dotimes (i (length names))
      (let ((name (aref names i)))
        (multiple-value-bind (id form) (parse-inventory-segment-name name)
          (when form
            (when (>= count max-files)
              (error 'resource-exhausted :reason :inventory-file-budget))
            (multiple-value-bind (device inode) (arcdocdb.io::leggi-identita-entry directory name)
              (let ((identity (cons device inode)))
                (multiple-value-bind (previous present) (gethash identity identities)
                  (when (and present (not (string= previous name)))
                    (error 'corruption-detected :reason :inventory-physical-alias)))
                (setf (gethash identity identities) name)))
            (push (file-segmento id form) files)
            (incf count)))))
    (coerce (nreverse files) 'simple-vector)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-REC-004 REQ-AFF-001 REQ-AFF-008 REQ-AFF-017 REQ-AFF-018
(declaim (ftype (function (manifest arcdocdb.io:file-io
                          &key (:max-files integer) (:max-segmenti integer) (:max-names t)
                               (:max-total-name-bytes t) (:max-name-bytes t))
                         (values reconciliation-plan &optional)) pianifica-riconciliazione-directory))
(defun pianifica-riconciliazione-directory
    (manifest directory &key (max-files 65536) (max-segmenti 65536) (max-names 65536)
                            (max-total-name-bytes 16777216) (max-name-bytes 255))
  "Pre: complete manifest, open segments directory, and exclusive/stable namespace until return.
Post: owned plan after actual EOF, with canonical names and distinct regular-file identities verified.
All names consume I/O budgets; MAX-FILES limits only .seg/.seg.tmp candidates.
Original conditions propagated, no partial plan; no opening/writing of segments.
Does not execute plan actions or verify content/CRC, and :READY does not authorize traffic."
  (check-directory-inventory-preflight
   manifest directory max-files max-segmenti max-names max-total-name-bytes max-name-bytes)
  (multiple-value-bind (names complete)
      (arcdocdb.io:elenca-directory directory :max-names max-names
                                  :max-total-name-bytes max-total-name-bytes
                                  :max-name-bytes max-name-bytes)
    (unless (and (typep names 'simple-vector) (eq complete t))
      (error 'invariant-violation :reason :inventory-directory-incomplete))
    (let* ((files (collect-directory-segments directory names max-files))
           (plan (pianifica-riconciliazione manifest files
                                           :max-files max-files :max-segmenti max-segmenti)))
      (arcdocdb.io::esigi-aperto directory :directory)
      plan)))
