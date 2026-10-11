(:schema-version 1
 :kind :cbor-string-write-audit-helper-fix
 :client-date "2026-10-11"
 :failed-record "spikes/out/4000708581-command-2576-0/report.lisp"
 :failed-record-status :failed
 :failed-record-exit-code 1
 :failed-record-source-consistency :stable
 :original-tool "spikes/out/cbor-string-write-20261011/frozen/tools/cbor-string-write-audit.lisp"
 :original-tool-blob "1e0fe5b87a3bb0e3a553ee24887d2545a13d78c7"
 :corrected-tool "tools/cbor-string-write-audit.lisp"
 :corrected-tool-blob "ae591bf0f2b37d0ed2ae08f16d0270568268a048"
 :original-diagnostic "The function (SETF FIRST-SAMPLE) is undefined."
 :cause "GETF nelle fixture usa FIRST-SAMPLE e FIRST-CELL come place. Il place aggiornato deve essere riscritto dal SETF expander; erano definiti soltanto i getter."
 :fix "Aggiunti soltanto i due setter: sostituiscono il CAR rispettivamente delle liste :campaigns e :samples. Formato, formule e attesi delle fixture invariati."
 :diff "spikes/out/cbor-string-write-20261011/audit-accessor-setter-fix.diff"
 :verification :static-only
 :self-test-executed-by-fix-author nil
 :product-blob "a2c5c77dd51bff760bff4508e998d94370921eda"
 :benchmark-driver-blob "c4bd98e145d13deb47b7eedb0f4581a241f1d0e1"
 :limits (:helper-failure-not-product-failure :retry-still-required))
