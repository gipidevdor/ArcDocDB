;;;; MT6 minimo e contenuto wire completo, senza interpretazione dei tag.
;;; OWNER: destinazione/scratch privati; sorgente stabile fino al ritorno.
;;; SHARED: sorgente condivisibile in lettura, nessuna scrittura/attesa/I/O (INV-P6).
(in-package #:arcdocdb.cbor)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CBR-007 REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (octets index index spazio-cbor index index (integer 0 100))
                         (values null &optional)) verifica-contenuto-tag-cbor))
(defun verifica-contenuto-tag-cbor (source start end space span max-nodes max-depth)
  "Pre: nonempty content, exclusive scratch, valid budgets including root.
Post: one exact/minimal item, child nodes <= MAX-NODES-1 and peak <= MAX-DEPTH.
The tag adds no depth or frame. Propagates scanner errors with SOURCE offset;
data intact, scratch reusable. INVARIANT-VIOLATION for the internal contract."
  (unless (and (< start end) (<= end (length source)))
    (error 'invariant-violation :reason :cbor-tag-child-range))
  (unless (= span (- end start))
    (error 'invariant-violation :reason :cbor-tag-child-span))
  (unless (<= 2 max-nodes +cbor-scan-max-bytes+)
    (error 'invariant-violation :reason :cbor-tag-child-budget))
  (multiple-value-bind (nodes peak next)
      (verifica-struttura-cbor-minima source start end space
                                   :max-bytes span :max-nodes (1- max-nodes) :max-depth max-depth)
    (unless (= next end)
      (error 'invariant-violation :reason :cbor-tag-child-progress))
    (unless (<= 1 nodes (1- max-nodes))
      (error 'invariant-violation :reason :cbor-tag-child-nodes))
    (unless (<= peak max-depth)
      (error 'invariant-violation :reason :cbor-tag-child-depth)))
  nil)

;;; REQ: REQ-CBR-007 REQ-LIM-001 REQ-LIM-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t t t t t t
                          &key (:max-bytes t) (:max-nodes t) (:max-depth t))
                         (values index &optional)) scrivi-tag-cbor-minimo))
(defun scrivi-tag-cbor-minimo (buffer start end source source-start source-end high low space
                              &key (max-bytes +cbor-scan-max-bytes+)
                                (max-nodes +cbor-scan-max-bytes+) (max-depth +cbor-scan-max-depth+))
  "Pre: simple u8, half-open spans, nonempty/minimal content, stable u32 words;
exclusive destination/scratch. Post: minimal MT6 header and exact content,
one NEXT only, only [START,NEXT) changes. Byte/node budgets include the tag;
MAX-DEPTH counts only arrays/maps and remains unchanged for the content.
All public errors precede writing and preserve entire arrays;
offset NIL in preflight or absolute SOURCE in the scanner. Preflight preserves
SPACE; failed parsing may dirty it, reusable after reset. On success,
describes the content without the added tag node. BUFFER=SOURCE only disjoint
from the complete footprint; scratch aliases rejected. No tag semantics.
Internal INVARIANT-VIOLATION without rollback, including from the MT2/3 copy.
Work bounded to SPAN*102; no AST, thread, waiting, I/O, or publication."
  (multiple-value-bind (span header-size item-size)
      (check-input-tag-cbor buffer start end source source-start source-end high low space
                            max-bytes max-nodes max-depth)
    (let ((bytes (the octets buffer)) (begin (the index start))
          (src (the octets source)) (source-begin (the index source-start))
          (source-limit (the index source-end)) (scratch (the spazio-cbor space))
          (hi (the u32 high)) (lo (the u32 low)) (next (+ (the index start) item-size)))
      (declare (type index next))
      (verifica-contenuto-tag-cbor src source-begin source-limit scratch span max-nodes max-depth)
      (let ((payload-start (scrivi-header-cbor-minimo bytes begin next 6 hi lo)))
        (declare (type index payload-start))
        (unless (= payload-start (+ begin header-size))
          (error 'invariant-violation :reason :cbor-tag-header-progress))
        (unless (= (- next payload-start) span)
          (error 'invariant-violation :reason :cbor-tag-payload-span))
        (let ((result (copia-stringa-cbor-write bytes payload-start next src source-begin source-limit)))
          (unless (= result next)
            (error 'invariant-violation :reason :cbor-tag-write-progress))
          result)))))
