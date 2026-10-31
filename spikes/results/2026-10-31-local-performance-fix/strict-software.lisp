;;; C4: private ASDF cache prevents mixed native/software compilation during independent checks.
(pushnew :arcdocdb-crc32c-software *features*)
(require :asdf)
(let ((path (first (uiop:command-line-arguments))))
  (assert path)
  (asdf:initialize-output-translations
   (list :output-translations (list t (list path :implementation)) :ignore-inherited-configuration)))
(load "tools/build.lisp")
(assert (eq :lisp (arcdocdb.binary:backend-crc32c)))
(assert (not (fboundp (find-symbol "CRC32C-ARM64" "ARCDOCDB.BINARY"))))
(assert (not (find-package "SB-SIMD-NEON")))
(format t "~&~S~%" (list :kind :strict-software-qualification :status :passed
                           :runtime (lisp-implementation-version) :backend :lisp :force t))
