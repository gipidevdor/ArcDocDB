(:schema-version 1 :kind :get-directory-development-history :status :recorded
 :limits (:attempts-not-promoted :static-findings-distinct-from-executed-failures
          :source-freeze-per-command :no-whole-engine-qualification)
 :static-fix (:file "src/get-resolver/build.lisp" :finding :exact-read-returns-end-not-count
              :introduced-before-first-run t :regression "TEST-REQ-STO-003-DIRECTORY-NATIVE-READ-NONZERO-BUFFER-START")
 :revisions
 ((:freeze "8c56e5d" :observed :fixture-and-mutation-form-eof
   :records ("4000715783-command-78361-0-report.lisp" "4000715783-command-78332-0-report.lisp")
   :fix "676d514")
  (:freeze "676d514" :observed :fixture-key-arena-exhausted-and-unreadable-child-report
   :records ("4000715845-command-79536-0-report.lisp" "4000715868-command-80508-0-report.lisp"
             "4000715868-command-80509-0-report.lisp") :fix "880c3be")
  (:freeze "880c3be" :observed :fixture-output-sentinels-and-child-base-char-array-printing
   :records ("4000715910-command-81210-0-report.lisp" "4000715910-command-81187-0-report.lisp"
             "4000715910-command-81188-0-report.lisp") :fix "2719180")
  (:freeze "2719180" :observed :benchmark-protected-body-eof
   :records ("4000716071-command-86800-0-report.lisp" "4000716071-command-86801-0-report.lisp")
   :fix "824be59")
  (:freeze "824be59" :observed :checkpoint-read-package-does-not-resolve-base-char
   :records ("4000716214-command-88432-0-report.lisp" "4000716214-command-88433-0-report.lisp")
   :fix "c51874e")
  (:freeze "c51874e" :observed :benchmark-and-self-test-complete
   :records ("4000716264-command-88836-0-report.lisp" "4000716309-command-89228-0-report.lisp"))
  (:freeze "c51874e" :observed :expected-negative-missing-completed
   :records ("4000716264-command-88837-0-report.lisp") :expected-exit-code 1
   :fixture-origin :synthetic-negative-fixture)
  (:freeze "7a9158e" :observed :latest-main-cbor-integration
   :base "79f08d6" :new-campaigns :registered-separately)))
