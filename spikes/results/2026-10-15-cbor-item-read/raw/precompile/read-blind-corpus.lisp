(defun stub (name symbols)
  (let ((package (or (find-package name) (make-package name :use '("CL")))))
    (dolist (symbol symbols) (export (intern symbol package) package))))
(stub "ARCDOCDB.FOUNDATION.TESTS" '("IS" "BYTES"))
(stub "ARCDOCDB.CONDITIONS"
      '("ARCDOCDB-ERROR" "INVALID-ARGUMENT" "RESOURCE-EXHAUSTED"
        "CORRUPTION-DETECTED" "ERROR-REASON" "ERROR-OFFSET"))
(stub "ARCDOCDB.CBOR.STRUCTURE.TESTS"
      '("CS-SNAPSHOT" "CS-UNCHANGED-P" "CS-WAIT" "CS-JOIN" "CS-STOP-WORKERS"))
(stub "ARCDOCDB.CBOR.MINIMAL.SCAN.TESTS" nil)
(stub "ARCDOCDB.CBOR"
      '("LEGGI-ITEM-CBOR-MINIMO" "CREA-SPAZIO-CBOR"
        "VERIFICA-STRUTTURA-CBOR-MINIMA" "VERIFICA-STRUTTURA-CBOR"))
(let ((*read-eval* nil) (total 0) (names nil))
  (dolist (path '("tests/codec/cbor-item-read-support.lisp"
                  "tests/codec/cbor-item-read.lisp"
                  "tests/codec/cbor-item-read-threads.lisp"))
    (let ((count 0) (local 0))
      (with-open-file (stream path)
        (loop for form = (read stream nil :eof) until (eq form :eof)
              do (incf count)
                 (when (and (consp form) (symbolp (first form))
                            (string= "DEFTEST" (symbol-name (first form))))
                   (incf local)
                   (assert (not (member (second form) names)))
                   (push (second form) names))))
      (incf total count)
      (format t "~&~A: DATA-EOF, ~D forme, ~D nominali.~%" path count local)))
  (assert (= 17 (length names)))
  (format t "~&Totale ~D forme, ~D nominali unici; nessun LOAD o COMPILE del corpus/prodotto.~%"
          total (length names)))
(let ((state #x49544538))
  (dotimes (iteration 1024)
    (setf state (logand #xffffffff (+ (* state 1664525) 1013904223))))
  (assert (= state #x6cb25938))
  (format t "~&LCG freddo: seme49544538, finale~8,'0X dopo1024 passi.~%" state))
(let* ((prefix 7) (contents '(#xc0 #xa1 #x61 #x61 #x82 #xf4 #xf5))
       (tail '(#xff #x1c #x18 0)) (end (+ prefix (length contents) (length tail)))
       (buffer (make-array (+ end 5) :element-type '(unsigned-byte 8))))
  (dotimes (i (length buffer)) (setf (aref buffer i) (mod (+ #xa7 (* i 37)) 256)))
  (replace buffer contents :start1 prefix)
  (replace buffer tail :start1 (+ prefix (length contents)))
  (let ((token (+ (* 17 6) (* 31 2) 14
                  (loop for i below (length buffer) sum (* (1+ i) (aref buffer i))))))
    (assert (= token 36196)) (assert (= (* 2048 token) 74129408))
    (format t "~&Fixture fredda: start7/end18/fisico23, valori6/2/14, token~D, sink~D.~%"
            token (* 2048 token))))
(let* ((accepts '(144 360 6 8 0 0 0 2 5 17 0 4 0 3 2))
       (rejects '(0 0 1 8 16 5 22 4 4 3 18 44 5 2 2))
       (nominal-accepts (reduce #'+ accepts)) (nominal-rejects (reduce #'+ rejects)))
  (assert (= nominal-accepts 551)) (assert (= nominal-rejects 134))
  (assert (= (+ nominal-accepts nominal-rejects 1024 8192) 9901))
  (format t "~&Denominatore freddo: non-fuzz ~D successi/~D rifiuti; fuzz512/512; parallelo8192/0; totale9901 (~D/~D).~%"
          nominal-accepts nominal-rejects (+ nominal-accepts 512 8192) (+ nominal-rejects 512)))
