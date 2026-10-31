;;; C4: actual native/software qualification in fresh processes, not feature simulation.
(require :asdf)
(asdf:load-asd (truename "arcdocdb.asd"))
(asdf:load-system "arcdocdb/tests")
(defun crc-opcode-count (text opcode)
  (loop for line in (uiop:split-string text :separator '(#\Newline))
        for tokens = (remove "" (uiop:split-string line :separator '(#\Space #\Tab)) :test #'string=)
        for raw = (third tokens)
        count (and raw (= 8 (length raw)) (every (lambda (c) (digit-char-p c 16)) raw)
                   (= opcode (logand #xffe0fc00
                       (loop for i below 4 sum
                         (ash (parse-integer raw :start (* i 2) :end (+ 2 (* i 2)) :radix 16) (* i 8))))))))
(assert (= 1 (crc-opcode-count "; 000: 405CC09A BYTE" #x9ac05c00)))
(assert (= 1 (crc-opcode-count "; 000: 4050C01A BYTE" #x1ac05000)))
(assert (zerop (crc-opcode-count "; 000: 00000000 BYTE" #x9ac05c00)))
(let ((software (equal (first (uiop:command-line-arguments)) "--software")))
  (assert (eq (if software :lisp :arm64-crc32c) (arcdocdb.binary:backend-crc32c)))
  (if software
      (progn
        (assert (not (fboundp (find-symbol "CRC32C-ARM64" "ARCDOCDB.BINARY"))))
        (assert (not (find-package "SB-SIMD-NEON"))))
      (let ((text (with-output-to-string (s)
                    (let ((*standard-output* s)) (disassemble 'arcdocdb.binary::crc32c-arm64)))))
        (assert (>= (crc-opcode-count text #x9ac05c00) 2))
        (assert (>= (crc-opcode-count text #x1ac05000) 1))
        (format t "~&~A~%" text)))
  (arcdocdb.io.tests:run)
  (arcdocdb.foundation.tests:run)
  (arcdocdb.local.server.tests:run)
  (arcdocdb.local.native.tests:run)
  (arcdocdb.local.process.tests:run)
  (format t "~&~S~%" (list :kind :readiness-crc-qualification :status :passed
                            :runtime (lisp-implementation-version) :backend (arcdocdb.binary:backend-crc32c)
                            :crc-span-cases (* 32 33 4) :incremental-split-per-case t
                            :disassembly (if software :native-absent :decoded-crc32cx-and-crc32cb-present)
                            :source-scope :local-worktree :power-loss nil)))
