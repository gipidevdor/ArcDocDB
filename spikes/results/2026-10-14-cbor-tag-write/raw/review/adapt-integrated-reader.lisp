(require :asdf)
(defun replace-all (text before after)
  (with-output-to-string (out)
    (loop with start = 0 for pos = (search before text :start2 start)
          do (write-string text out :start start :end pos)
          while pos do (write-string after out) (setf start (+ pos (length before))))))
(defun replace-section (text begin end replacement)
  (let ((a (search begin text)) (b (search end text)))
    (assert (and a b (< a b)))
    (concatenate 'string (subseq text 0 a) replacement (subseq text b))))
(let ((text (uiop:read-file-string
               "spikes/out/cbor-map-write-20261014/review/integrated-runtime-reading.lisp")))
  (dolist (pair
            '(("cbor.map.integrated.reading" "cbor.tag.integrated.reading")
              ("cbor-map-write-20261014" "cbor-tag-write-20261014")
              ("cbor-map" "cbor-tag") ("map-ok" "tag-ok")
              ("4000986074-command-71976-0" "4000996821-command-64571-0")
              ("4000986301-check-78781-0" "4000997101-check-82864-0")
              ("4000986108-snapshot-self-test-72655-0" "4000996874-snapshot-self-test-69641-0")
              ("4000986108-reader-self-test-72670-0" "4000996874-reader-self-test-69697-0")
              ("d7a593badeb6e6b71f28dc4e80c641b07189d0b8" "6dfad07035ac8040b2aec0a455c175ea15dfd9ad")
              ("22e814ea68e606c5bc58033c2a31e945303a9d65" "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b")
              ("a389e51f2416437d608c4f7745b9680eca27bc60" "15978d05251705387205d6468031a701ad95ec85")
              ("6ad0e9b5a48ba9c32c46d720f2f7f1821368d6c8" "df97950ec8d24157bb6566c7995262f7beea7742")
              ("6a65b58ce236b92b33772e1861dbd8c1257bee13" "def870295400af2c84ca00e7a9b5cd5b747ec315")
              ("15c458eff76896f3fc83ad7756ae922f64eb22d7" "df37306ed0e97f1665fb9f59aca79842c49d96a5")
              ("7456d4826398615c278eabcdee760ef508e33a5604b4cd72accd8356c9198240" "3a985282de01545ab18241298d3c5bb62190520963df148e34c863a66030ce33")
              ("144099" "155883") ("1143722" "1317223")
              ("260.414101" "314.315971") ("1290" "1418") ("1284" "1412") ("860" "892")
              ("207 file" "214 file") ("120 requisiti" "121 requisiti")
              ("440 file" "472 file") ("2914 link" "2988 link")
              ("TEST-REQ-CBR-006-MAP-" "TEST-REQ-CBR-007-TAG-")
              ("CBOR map" "CBOR tag") ("map20" "tag20")
              ("4D415035" "54414737") ("4d415035" "54414737")
              ("0D123435" "F8004B37") ("0d123435" "f8004b37")
              ("capacita/byte/entry/nodi/profondita/parse/source-range/count."
               "capacita/byte/high/nodi/profondita/parse/source-range/empty.")
              ("54677504/77537280" "66766848/97310720")
              ("serial283+fuzz1024+parallel8192=9499; success84+512+8192=8788, rejection199+512=711."
               "serial442+fuzz1024+parallel8192=9658; success144+512+8192=8848, rejection298+512=810.")
              ("(= 98 (getf evidence :catalogs))" "(= 102 (getf evidence :catalogs))")
              ("(= 3136 (getf evidence :artifact-references))" "(= 3237 (getf evidence :artifact-references))")
              ("(= 25236 (getf evidence :stored-files))" "(= 28687 (getf evidence :stored-files))")
              ("catalogs98 references3136 stored-files25236" "catalogs102 references3237 stored-files28687")))
    (setf text (replace-all text (first pair) (second pair))))
  (setf text (replace-section text "       (expected" "       (pins '(("
"       (expected
         (mapcar (lambda (suffix) (concatenate 'string \"ok    TEST-REQ-CBR-007-TAG-\" suffix))
                 '(\"U32-WORD-WIDTH-BOUNDARIES-AND-ALL-WIRE-SENTINELS\"
                   \"OPAQUE-SCALARS-UTF8-FLOATS-CONTAINERS-AND-PAIR-ORDER\"
                   \"CONCATENATION-NEXT-AND-EXACT-RETURN-ARITY\"
                   \"DESTINATION-TYPE-AND-RANGE-PRECEDES-EVERYTHING\"
                   \"SOURCE-TYPE-RANGE-EMPTY-AND-BACKING-ARRAY-INTACT\"
                   \"HIGH-THEN-LOW-DOMAIN-PRECEDENCE-WITHOUT-U64\"
                   \"WORKSPACE-TYPE-AND-BOTH-KINDS-ALIASES\"
                   \"CONFIGURED-LIMITS-AND-ROOT-TWO-NODE-MINIMUM\"
                   \"ALL-PREFLIGHT-PHASE-PRECEDENCES\"
                   \"CAPACITY-ACTIVE-END-AND-COMPLETE-BYTE-BUDGET\"
                   \"OVERLAP-INCLUDING-ONLY-HEADER-AND-TOUCHING-BOUNDARIES\"
                   \"FULL-16MIB-WITH-ONE-AND-NINE-BYTE-HEADER-AND-OVER\"
                   \"ROOT-AND-CONTENT-NODE-RESIDUE-LONG-TAG-CHAINS-NO-FRAME\"
                   \"DEPTH-UNCHANGED-ZERO-SCALARS-AND-100-101-CONTAINERS\"
                   \"PARSER-FAILURES-ABSOLUTE-OFFSET-AND-COMPLETE-SINGLE-ITEM\"
                   \"EVERY-TRUNCATION-NONZERO-SOURCE-START-AND-EXACT-END\"
                   \"SCRATCH-REUSE-AFTER-PARSER-AND-PREFLIGHT-ERRORS\"
                   \"SCRATCH-CONTENT-ONLY-STATISTICS-AFTER-SUCCESS\"
                   \"FIXED-SEED-1024-FUZZ-AND-FROZEN-CLASS-COUNTS\"
                   \"TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-SOURCE\")))
"))
  (setf text (replace-section text "  (assert (not (some (lambda (marker)" "  (format t \"INPUT descriptor"
"  ;; Only compiler/build diagnostics precede the exact completion marker.
  ;; Later STDOUT intentionally serializes Unhandled from two negative fixture children.
  (let* ((complete (search \"build e test: nessun avviso, tutti i controlli superati\" stdout))
         (build-stdout (progn (assert complete) (subseq stdout 0 complete))))
    (assert (not (some (lambda (marker)
                        (or (search marker build-stdout :test #'char-equal)
                            (search marker stderr :test #'char-equal)))
                      '(\"WARNING:\" \"STYLE-WARNING:\" \"COMPILE-FILE-ERROR\" \"Unhandled \")))))
"))
  (setf text (replace-all text "warning/compile markers0 and no unquoted line-start Unhandled"
                         "warning/compile/Unhandled markers0 in compiler-build phase and main STDERR"))
  (with-open-file (out "spikes/out/cbor-tag-write-20261014/review/integrated-runtime-reading.lisp"
                        :direction :output :if-exists :error :if-does-not-exist :create)
    (write-string text out)))
