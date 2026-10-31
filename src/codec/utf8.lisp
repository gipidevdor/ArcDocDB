;;;; UTF-8 rigoroso secondo RFC 3629: verifica e lettura di scalari, senza normalizzazione.
;;; OWNER: chiamante; BUFFER resta immutabile per l'intera verifica.
;;; SHARED: sola lettura del buffer; cursore e conteggio locali a ogni chiamata.
(in-package #:arcdocdb.utf8)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-SEC-007 REQ-AFF-004
(declaim (ftype (function (t t t) (values (integer 0 1114111) index &optional))
                leggi-scalare-utf8))

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-008
(defconstant +max-utf8-bytes+ 16777216)

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t) (values index &optional)) check-utf8-arguments))
(defun check-utf8-arguments (buffer start end max-bytes)
  "Pre: unverified external arguments. Post: index span within budget, possibly empty.
INVALID-ARGUMENT for type/range or budget; RESOURCE-EXHAUSTED if the span exceeds
the budget. Checks in order: range, budget, exhaustion; no bytes read."
  (unless (and (typep buffer 'octets) (typep start 'index) (typep end 'index)
               (<= start end (length buffer)))
    (error 'invalid-argument :reason :utf8-range))
  (unless (and (typep max-bytes 'index) (<= max-bytes +max-utf8-bytes+))
    (error 'invalid-argument :reason :utf8-budget))
  (let ((span (- end start)))
    (declare (type index span))
    (when (> span max-bytes)
      (error 'resource-exhausted :reason :utf8-byte-budget))
    span))

;;; REQ: REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets index index (integer 1 4))
                         (values index &optional)) verifica-suite-utf8))
(defun verifica-suite-utf8 (buffer cursor end width)
  "Pre: CURSOR at the lead and WIDTH 1..4. Post: index end and continuations verified
from left to right. INVARIANT-VIOLATION for inconsistent internal bounds;
CORRUPTION-DETECTED for a truncated sequence (offset END) or invalid continuation."
  (unless (< cursor end)
    (error 'invariant-violation :reason :utf8-continuation-range :offset cursor))
  (unless (<= end (length buffer))
    (error 'invariant-violation :reason :utf8-continuation-range :offset end))
  (when (> width (- end cursor))
    (error 'corruption-detected :reason :utf8-truncated :offset end))
  (let ((next (+ cursor width)))
    (declare (type index next))
    (dotimes (step (1- width) next)
      (let ((position (+ cursor 1 step)))
        (declare (type index position))
        (unless (<= #x80 (aref buffer position) #xbf)
          (error 'corruption-detected :reason :utf8-continuation :offset position))))))

;;; REQ: REQ-AFF-004
(declaim (ftype (function (u8 u8 index) (values null &optional)) verifica-scalare-utf8))
(defun verifica-scalare-utf8 (lead second position)
  "Pre: 3/4-byte lead and SECOND a verified continuation. Post: Unicode scalar
without overlong encodings, surrogates, or values beyond U+10FFFF; does not materialize it.
INVARIANT-VIOLATION for internal context; CORRUPTION-DETECTED at offset POSITION."
  (unless (<= #xe0 lead #xf4)
    (error 'invariant-violation :reason :utf8-scalar-context :offset position))
  (unless (<= #x80 second #xbf)
    (error 'invariant-violation :reason :utf8-scalar-context :offset position))
  (let ((minimum (if (= lead #xe0) #xa0 (if (= lead #xf0) #x90 #x80)))
        (maximum (if (= lead #xed) #x9f (if (= lead #xf4) #x8f #xbf))))
    (declare (type u8 minimum maximum))
    (unless (<= minimum second maximum)
      (error 'corruption-detected :reason :utf8-scalar :offset position)))
  nil)

;;; REQ: REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets index index) (values index &optional))
                verifica-carattere-utf8))
(defun verifica-carattere-utf8 (buffer cursor end)
  "Pre: stable nonempty span. Post: increasing cursor within END for one
verified scalar. INVARIANT-VIOLATION for bounds/progress; CORRUPTION-DETECTED
for an invalid lead (offset CURSOR); propagates ordered continuation-sequence and scalar errors."
  (unless (< cursor end)
    (error 'invariant-violation :reason :utf8-character-range :offset cursor))
  (unless (<= end (length buffer))
    (error 'invariant-violation :reason :utf8-character-range :offset end))
  (let* ((lead (aref buffer cursor))
         (width (cond ((<= lead #x7f) 1)
                      ((<= #xc2 lead #xdf) 2)
                      ((<= #xe0 lead #xef) 3)
                      ((<= #xf0 lead #xf4) 4)
                      (t (error 'corruption-detected :reason :utf8-leading
                                :offset cursor))))
         (next (verifica-suite-utf8 buffer cursor end width)))
    (declare (type u8 lead) (type (integer 1 4) width) (type index next))
    (when (>= width 3)
      (verifica-scalare-utf8 lead (aref buffer (1+ cursor)) (1+ cursor)))
    (unless (and (< cursor next) (<= next end))
      (error 'invariant-violation :reason :utf8-progress :offset cursor))
    next))

;;; REQ: REQ-SEC-007 REQ-AFF-004
(defun leggi-scalare-utf8 (buffer start end)
  "Pre: stable simple u8 span. Post: verified scalar and next cursor.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED for input/budget; CORRUPTION-DETECTED for
invalid or empty UTF-8. No allocation, modification, normalization, or locale."
  (check-utf8-arguments buffer start end +max-utf8-bytes+)
  (when (= start end) (error 'corruption-detected :reason :utf8-truncated :offset end))
  (let* ((bytes (the octets buffer)) (begin (the index start))
         (next (verifica-carattere-utf8 bytes begin end)) (width (- next begin))
         (cp (logand (aref bytes begin) (case width (1 #x7f) (2 #x1f) (3 #x0f) (4 7)
                                         (otherwise (error 'invariant-violation :reason :utf8-scalar-width))))))
    (loop for position from (1+ begin) below next do
      (setf cp (logior (ash cp 6) (logand (aref bytes position) 63))))
    (unless (<= 0 cp #x10ffff) (error 'invariant-violation :reason :utf8-scalar-result))
    (unless (< begin next) (error 'invariant-violation :reason :utf8-scalar-progress))
    (values cp next)))

;;; REQ: REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t &key (:max-bytes t)) (values index &optional))
                verifica-utf8))
(defun verifica-utf8 (buffer start end &key (max-bytes +max-utf8-bytes+))
  "Pre: immutable simple u8 BUFFER; half-open span and budget 0..16 MiB verified.
Post: scalar count only after complete verification; empty gives 0, no mutation.
Propagates INVALID-ARGUMENT, RESOURCE-EXHAUSTED, and CORRUPTION-DETECTED; INVARIANT-
VIOLATION for internal count/end. At most 16 MiB steps, without waiting or CBOR;
NUL, BOM, and noncharacters allowed; no normalization or replacement."
  (let ((span (check-utf8-arguments buffer start end max-bytes)))
    (declare (type index span))
    (let ((bytes (the octets buffer)) (begin (the index start))
          (limit (the index end)) (cursor (the index start)) (count 0))
      (declare (type octets bytes) (type index begin limit cursor count))
      (loop repeat span
            do (when (= cursor limit) (return))
               (setf cursor (verifica-carattere-utf8 bytes cursor limit))
               (incf count)
               (unless (<= count (- cursor begin))
                 (error 'invariant-violation :reason :utf8-count :offset cursor)))
      (unless (= cursor limit)
        (error 'invariant-violation :reason :utf8-result :offset cursor))
      (unless (<= count span)
        (error 'invariant-violation :reason :utf8-count :offset cursor))
      count)))
