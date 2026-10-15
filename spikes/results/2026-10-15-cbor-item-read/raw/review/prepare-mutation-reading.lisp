;;;; Adatta solo un lettore C4 già conservato; non apre la campagna corrente.
(require :asdf)
(let* ((template "spikes/out/cbor-tag-write-20261014/review/mutation-reading-3.lisp")
       (target "spikes/out/cbor-item-read-20261015/review/mutation-reading.lisp")
       (text (uiop:read-file-string template :external-format :utf-8)))
  (labels ((replace-all (old new)
             (assert (search old text))
             (setf text
                   (with-output-to-string (out)
                     (loop with cursor = 0 for position = (search old text :start2 cursor)
                           do (write-string text out :start cursor :end position)
                           if position do (write-string new out) (setf cursor (+ position (length old)))
                           else do (return))))))
    (replace-all "tag.mutation.reading" "item.mutation.reading")
    (replace-all "cbor-tag-write-20261014" "cbor-item-read-20261015")
    (replace-all "cbor-tag-write" "cbor-item-read")
    (replace-all "ARCDOCDB.CBOR.TAG.WRITE.TESTS::" "ARCDOCDB.CBOR.ITEM.READ.TESTS::")
    (replace-all "TEST-REQ-CBR-007-TAG-" "TEST-REQ-CBR-008-ITEM-")
    (replace-all "df37306ed0e97f1665fb9f59aca79842c49d96a5" "46aee8b920d447aafae4a4e47a44d13631c47cb1")
    (replace-all "(defparameter *wrapper* \"spikes/out/4000997059-command-81284-0/report.lisp\")"
                 "(defparameter *wrapper*
  (let ((arguments (rest sb-ext:*posix-argv*)))
    (unless (= 1 (length arguments)) (error \"Fornire il record wrapper CONCLUSO.\"))
    (first arguments)))")
    (replace-all "(defparameter *names* '(\"physical-capacity\" \"wrong-major\" \"swapped-words\" \"scan-omitted\"
                        \"overlap-without-header\" \"root-node-excluded\" \"tag-depth-charged\" \"extra-return-value\"))"
                 "(defparameter *names* '(\"generic-scan\" \"drain-on-physical-end\" \"next-equals-end\"
                        \"node-budget-ignored\" \"depth-budget-ignored\" \"byte-budget-ignored\"
                        \"start-skipped\" \"extra-return-value\"))")
    (replace-all "((\"src/codec/cbor-tag-input.lisp\" \"6dfad07035ac8040b2aec0a455c175ea15dfd9ad\")
    (\"src/codec/cbor-item-read.lisp\" \"16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b\")"
                 "((\"src/codec/cbor-item-read.lisp\" \"b9099dc8a8c96281063811e686deb4dcb2b1d39b\")")
    (replace-all "15978d05251705387205d6468031a701ad95ec85" "0326100362a1c4b24d2c7e511e45357f09a56d33")
    (replace-all "df97950ec8d24157bb6566c7995262f7beea7742" "b2cbdcb4255c51d9da4fe73b28939c1cb923fefe")
    (replace-all "def870295400af2c84ca00e7a9b5cd5b747ec315" "a0da65545ed80ede0a967cadbb337731f6fe1ce9")
    (replace-all "60b7970c18a1d17642d1efc39f5068b5e10f181d" "72fd332903fa222ceb2caaa7bbf9f546d44525aa")
    (replace-all "2275bd6ebba11cfe24e57ac0c6d2c257631a71d8" "8489ea798f0d83477e30e33b2ba34146296f9f66")
    (replace-all "(= 892 (hash-table-count outer-before) (hash-table-count outer-after))"
                 "(= 931 (hash-table-count outer-before) (hash-table-count outer-after))")
    (replace-all "sources892" "sources931")
    (replace-all "(check (equal (first physical-before) (list *wrapper* 281339 \"9650446564e6df96e30e9c66bae4b244611d42c59a2a9195584490f7b26dc8f9\")) :explicit-wrapper-bytes)"
                 "(check (and (plusp (second (first physical-before))) (= 64 (length (third (first physical-before))))) :wrapper-physical-input)")
    (replace-all "(check (equal (second physical-before) (list report-path 92977 \"05d7af6f9b351c29dc2f23886229ce7567a3ee5bdfda224b9323c5d3a2fd72a7\")) :explicit-inner-bytes)"
                 "(check (and (plusp (second (second physical-before))) (= 64 (length (third (second physical-before))))) :inner-physical-input)")
    (replace-all "(check (= 286.719013d0 (getf wrapper :wall-seconds)) :campaign-wall)"
                 "(check (plusp (getf wrapper :wall-seconds)) :positive-campaign-wall)")
    (replace-all "(= 20 (length names)" "(= 17 (length names)")
    (replace-all "(= 20 (length (getf catalogue :frozen-def-test-functions))" "(= 17 (length (getf catalogue :frozen-def-test-functions))")
    (replace-all "twenty-real-corpus-names" "seventeen-real-corpus-names")
    (replace-all "(= 1412 (count-if" "(= 1545 (count-if")
    (replace-all "(= 1414 (count-if" "(= 1547 (count-if")
    (replace-all "(= 20 (count-if" "(= 17 (count-if")
    (replace-all "baseline1412+2" "baseline1545+2+17item")
    (replace-all "(null completion) origins" "(null completion) (= 1 (length origins))")
    (replace-all "(values index null &optional)) scrivi-tag-cbor-minimo"
                 "(values index (integer 0 100) index null &optional)) leggi-item-cbor-minimo")
    (replace-all "(values result nil)" "(values nodes peak position nil)")
    (replace-all "(values index &optional)) scrivi-tag-cbor-minimo"
                 "(values index (integer 0 100) index &optional)) leggi-item-cbor-minimo")
    (replace-all "FIVE-PINS" "FOUR-PINS")
    (replace-all "five-pins" "four-pins")
    (replace-all "physical-five-pins" "physical-four-pins")
    (with-open-file (out target :direction :output :if-exists :error :external-format :utf-8)
      (write-string text out)))
  (format t "Preparato ~A; nessuna campagna corrente letta o eseguita.~%" target))
