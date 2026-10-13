(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-PRESERVATION-AUDIT :VERSION "6aca985" :PART 1 :PARTS 1
 :SOURCES
 ((:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-audit-final/audit.lisp")
   :BYTES 4359 :SHA256 "0d2b58a187f3ac446fa9dc2a14ae4ff3c0f7cbdde9cc3ee97cc16a58d7f3f51f" :GIT-BLOB
   "7452928a9493a6d59b08d6013266a7fffc16eadf" :TEXT
   ";;;; Audit in sola lettura dei soli entry del manifest pubblicato; nessuna qualifica rieseguita.
(require :asdf)
(load \"spikes/out/worker-publication-functions.lisp\")
(in-package #:cl-user)

(let* ((base (truename #p\"spikes/results/2026-10-13-pool-controller/\"))
       (manifest (merge-pathnames \"manifesto-file.lisp\" base))
       (before (worker-byte-record manifest))
       (data (arcdocdb.evidence:read-evidence manifest))
       (entries (getf data :files))
       (checked nil) (problems nil) (seen nil)
       (plain 0) (descriptors 0) (payloads 0))
  (unless (and (eql (getf data :schema-version) 1)
               (eq (getf data :kind) :pool-controller-whole-file-manifest)
               entries)
    (error \"Forma del manifest pubblicato inattesa.\"))
  (dolist (entry entries)
    (let ((relative (getf entry :relative-path)))
      (handler-case
          (progn
            (unless (and (stringp relative) (plusp (length relative))
                         (not (uiop:absolute-pathname-p (pathname relative))))
              (error \"Path relativo invalido: ~S\" relative))
            (when (member relative seen :test #'string=)
              (error \"Entry duplicato: ~A\" relative))
            (push relative seen)
            (let* ((path (truename (merge-pathnames relative base)))
                   (current (worker-byte-record path)))
              (unless (uiop:subpathp path base)
                (error \"Entry fuori namespace: ~A\" path))
              (unless (string= (getf entry :path) (namestring path))
                (error \"Path assoluto diverso dall'entry originale: ~A\" relative))
              (unless (worker-byte-records-equal-p entry current)
                (error \"Bytes/SHA256/Git blob divergenti: ~A\" relative))
              (let ((proof nil))
                (cond
                  ((equal (pathname-type path) \"lisp\")
                   (setf proof (worker-evidence-byte-proof path))
                   (if (getf proof :payload-name) (incf descriptors) (incf plain)))
                  ((equal (pathname-type path) \"gz\") (incf payloads))
                  (t nil))
                (unless (worker-byte-records-equal-p entry (worker-byte-record path))
                  (error \"Entry cambiato durante la validazione: ~A\" relative))
                (push (list :relative-path relative :status :ok
                            :expected (list :bytes (getf entry :bytes)
                                            :sha256 (getf entry :sha256)
                                            :git-blob (getf entry :git-blob))
                            :actual current :evidence-proof proof)
                      checked))))
        (error (condition)
          (push (list :relative-path relative :status :failed
                      :diagnostic (princ-to-string condition)) problems)))))
  (unless (worker-byte-records-equal-p before (worker-byte-record manifest))
    (push (list :status :failed :diagnostic \"Manifest cambiato durante l'audit.\") problems))
  (let* ((ok (null problems))
         (report (list :schema-version 1 :kind :pool-controller-final-manifest-audit
                       :status (if ok :ok :failed)
                       :manifest-before before :manifest-after (worker-byte-record manifest)
                       :manifest-base (getf data :base) :declared-entries (length entries)
                       :verified-entries (length checked) :plain-evidence plain
                       :compressed-descriptors descriptors :gzip-payload-entries payloads
                       :files (nreverse checked) :problems (nreverse problems)
                       :limits '(:only-original-manifest-entries :new-seals-outside-audit-scope
                                 :no-canonical-or-source-mutation :no-git-mutation
                                 :bytes-sha256-git-blob-and-evidence-integrity
                                 :no-qualification-or-result-reinterpretation))))
    (worker-save-data report #p\"spikes/out/pool-audit-final/report.lisp\")
    (format t \"Manifest audit ~A: ~D/~D entries, ~D plain, ~D compressed descriptors, ~D gzip payloads; ~D problems.~%\"
            (if ok \"PASS\" \"FAIL\") (length checked) (length entries) plain descriptors payloads
            (length problems))
    (dolist (problem problems) (format *error-output* \"~S~%\" problem))
    (uiop:quit (if ok 0 1))))
")
  (:PATH
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-audit-final/report.lisp")
   :BYTES 62849 :SHA256 "045010ed6c33984daff7f253c28727747211dc141441fa2c6612e02fdbd2ea33"
   :GIT-BLOB "b3b11294b46c02ef91b6ac9e60f0750a76da4b84" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-FINAL-MANIFEST-AUDIT :STATUS :OK :MANIFEST-BEFORE
 (:PATH
  #A((122) BASE-CHAR
     . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/manifesto-file.lisp\")
  :BYTES 18892 :SHA256 \"94bdb22b32518fd58069fb9fda1352505a0cf01967df51f81551480373ed62c2\" :GIT-BLOB
  \"572e57d3ee9b4be19feb08ee1ae46cd9ead67435\")
 :MANIFEST-AFTER
 (:PATH
  #A((122) BASE-CHAR
     . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/manifesto-file.lisp\")
  :BYTES 18892 :SHA256 \"94bdb22b32518fd58069fb9fda1352505a0cf01967df51f81551480373ed62c2\" :GIT-BLOB
  \"572e57d3ee9b4be19feb08ee1ae46cd9ead67435\")
 :MANIFEST-BASE \"4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3\" :DECLARED-ENTRIES 50 :VERIFIED-ENTRIES
 50 :PLAIN-EVIDENCE 30 :COMPRESSED-DESCRIPTORS 10 :GZIP-PAYLOAD-ENTRIES 10 :FILES
 ((:RELATIVE-PATH \"data/benchmark/report.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 63476 :SHA256 \"0ad946a7c195b3007e3a3a5ac736db8a59be2a1fbfb9ff5b43fa5063e33210cd\"
    :GIT-BLOB \"17412c8ded81b6f5d7010b94d07c68f457bf26fb\")
   :ACTUAL
   (:PATH
    #A((129) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/benchmark/report.lisp\")
    :BYTES 63476 :SHA256 \"0ad946a7c195b3007e3a3a5ac736db8a59be2a1fbfb9ff5b43fa5063e33210cd\"
    :GIT-BLOB \"17412c8ded81b6f5d7010b94d07c68f457bf26fb\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((129) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/benchmark/report.lisp\")
     :BYTES 63476 :SHA256 \"0ad946a7c195b3007e3a3a5ac736db8a59be2a1fbfb9ff5b43fa5063e33210cd\"
     :GIT-BLOB \"17412c8ded81b6f5d7010b94d07c68f457bf26fb\")
    :EXPANDED
    (:PATH
     #A((129) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/benchmark/report.lisp\")
     :BYTES 63476 :SHA256 \"0ad946a7c195b3007e3a3a5ac736db8a59be2a1fbfb9ff5b43fa5063e33210cd\"
     :GIT-BLOB \"17412c8ded81b6f5d7010b94d07c68f457bf26fb\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-01/SPK-01.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 27228 :SHA256 \"ca9fd018fe37a6f469b4629ad064be68e7e9df94cc214738e5b9525b364ca89c\"
    :GIT-BLOB \"0995644498f5c0f6723892642ee72752ca74d378\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-01/SPK-01.lisp\")
    :BYTES 27228 :SHA256 \"ca9fd018fe37a6f469b4629ad064be68e7e9df94cc214738e5b9525b364ca89c\"
    :GIT-BLOB \"0995644498f5c0f6723892642ee72752ca74d378\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-01/SPK-01.lisp\")
     :BYTES 27228 :SHA256 \"ca9fd018fe37a6f469b4629ad064be68e7e9df94cc214738e5b9525b364ca89c\"
     :GIT-BLOB \"0995644498f5c0f6723892642ee72752ca74d378\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-01/SPK-01.lisp\")
     :BYTES 27228 :SHA256 \"ca9fd018fe37a6f469b4629ad064be68e7e9df94cc214738e5b9525b364ca89c\"
     :GIT-BLOB \"0995644498f5c0f6723892642ee72752ca74d378\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-02/SPK-02.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 1607 :SHA256 \"04c5f0e4ba81756e5fe85a47cdd1ddc3fff9ff69b1ae4099e9cc662ea9ccc4db\"
    :GIT-BLOB \"424f396af173c3fa4ae7b2e732e0d55cc4310e9b\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-02/SPK-02.lisp\")
    :BYTES 1607 :SHA256 \"04c5f0e4ba81756e5fe85a47cdd1ddc3fff9ff69b1ae4099e9cc662ea9ccc4db\"
    :GIT-BLOB \"424f396af173c3fa4ae7b2e732e0d55cc4310e9b\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-02/SPK-02.lisp\")
     :BYTES 1607 :SHA256 \"04c5f0e4ba81756e5fe85a47cdd1ddc3fff9ff69b1ae4099e9cc662ea9ccc4db\"
     :GIT-BLOB \"424f396af173c3fa4ae7b2e732e0d55cc4310e9b\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-02/SPK-02.lisp\")
     :BYTES 1607 :SHA256 \"04c5f0e4ba81756e5fe85a47cdd1ddc3fff9ff69b1ae4099e9cc662ea9ccc4db\"
     :GIT-BLOB \"424f396af173c3fa4ae7b2e732e0d55cc4310e9b\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-03/SPK-03.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 3641 :SHA256 \"4cda249adc962d8f39b0f39e18df680ac03fe18078385b072be319454a85606c\"
    :GIT-BLOB \"9efb4048f5a4a8a1b305138a40039f808f177388\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-03/SPK-03.lisp\")
    :BYTES 3641 :SHA256 \"4cda249adc962d8f39b0f39e18df680ac03fe18078385b072be319454a85606c\"
    :GIT-BLOB \"9efb4048f5a4a8a1b305138a40039f808f177388\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-03/SPK-03.lisp\")
     :BYTES 3641 :SHA256 \"4cda249adc962d8f39b0f39e18df680ac03fe18078385b072be319454a85606c\"
     :GIT-BLOB \"9efb4048f5a4a8a1b305138a40039f808f177388\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-03/SPK-03.lisp\")
     :BYTES 3641 :SHA256 \"4cda249adc962d8f39b0f39e18df680ac03fe18078385b072be319454a85606c\"
     :GIT-BLOB \"9efb4048f5a4a8a1b305138a40039f808f177388\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-04/SPK-04.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 6752 :SHA256 \"d388a80179aec8872e40af437ba343b985469a585af9a6a291a2063479694cd4\"
    :GIT-BLOB \"8a7c9ae2a10a0370682b087e750aeb6fd27c8f0f\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-04/SPK-04.lisp\")
    :BYTES 6752 :SHA256 \"d388a80179aec8872e40af437ba343b985469a585af9a6a291a2063479694cd4\"
    :GIT-BLOB \"8a7c9ae2a10a0370682b087e750aeb6fd27c8f0f\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-04/SPK-04.lisp\")
     :BYTES 6752 :SHA256 \"d388a80179aec8872e40af437ba343b985469a585af9a6a291a2063479694cd4\"
     :GIT-BLOB \"8a7c9ae2a10a0370682b087e750aeb6fd27c8f0f\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-04/SPK-04.lisp\")
     :BYTES 6752 :SHA256 \"d388a80179aec8872e40af437ba343b985469a585af9a6a291a2063479694cd4\"
     :GIT-BLOB \"8a7c9ae2a10a0370682b087e750aeb6fd27c8f0f\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-05/SPK-05.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 10172 :SHA256 \"e7490bd29a28d2e0bcb2f849df0e18ba1e677050790abd32c2ba639c56eb7078\"
    :GIT-BLOB \"c30903b55692a23edf51c81d015c186cc812c7b1\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-05/SPK-05.lisp\")
    :BYTES 10172 :SHA256 \"e7490bd29a28d2e0bcb2f849df0e18ba1e677050790abd32c2ba639c56eb7078\"
    :GIT-BLOB \"c30903b55692a23edf51c81d015c186cc812c7b1\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-05/SPK-05.lisp\")
     :BYTES 10172 :SHA256 \"e7490bd29a28d2e0bcb2f849df0e18ba1e677050790abd32c2ba639c56eb7078\"
     :GIT-BLOB \"c30903b55692a23edf51c81d015c186cc812c7b1\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-05/SPK-05.lisp\")
     :BYTES 10172 :SHA256 \"e7490bd29a28d2e0bcb2f849df0e18ba1e677050790abd32c2ba639c56eb7078\"
     :GIT-BLOB \"c30903b55692a23edf51c81d015c186cc812c7b1\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-06/SPK-06.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 24100 :SHA256 \"6ba19b09e2de105c2427cad929cd6e97736d525f700f17b2b2f56949dcf0a34b\"
    :GIT-BLOB \"6bda74b4246aa4e0bdf1e599ad554efc591db11c\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-06/SPK-06.lisp\")
    :BYTES 24100 :SHA256 \"6ba19b09e2de105c2427cad929cd6e97736d525f700f17b2b2f56949dcf0a34b\"
    :GIT-BLOB \"6bda74b4246aa4e0bdf1e599ad554efc591db11c\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-06/SPK-06.lisp\")
     :BYTES 24100 :SHA256 \"6ba19b09e2de105c2427cad929cd6e97736d525f700f17b2b2f56949dcf0a34b\"
     :GIT-BLOB \"6bda74b4246aa4e0bdf1e599ad554efc591db11c\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-06/SPK-06.lisp\")
     :BYTES 24100 :SHA256 \"6ba19b09e2de105c2427cad929cd6e97736d525f700f17b2b2f56949dcf0a34b\"
     :GIT-BLOB \"6bda74b4246aa4e0bdf1e599ad554efc591db11c\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-07/SPK-07.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 318 :SHA256 \"701a215f9a26c14f7d63bd3a1ef3e4c28ea0d05d4560952e3f0d9400af7e4764\" :GIT-BLOB
    \"4a67cf3e794b60095d1f3fd6e900c1a0fe1002fa\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-07/SPK-07.lisp\")
    :BYTES 318 :SHA256 \"701a215f9a26c14f7d63bd3a1ef3e4c28ea0d05d4560952e3f0d9400af7e4764\" :GIT-BLOB
    \"4a67cf3e794b60095d1f3fd6e900c1a0fe1002fa\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-07/SPK-07.lisp\")
     :BYTES 318 :SHA256 \"701a215f9a26c14f7d63bd3a1ef3e4c28ea0d05d4560952e3f0d9400af7e4764\"
     :GIT-BLOB \"4a67cf3e794b60095d1f3fd6e900c1a0fe1002fa\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-DBEk7g\")
     :BYTES 28144051 :SHA256 \"d969442d7dda6367597bbaebfe5e435327373977dc99a2527e889929aaa76717\"
     :GIT-BLOB \"4529722901f1c92a9d803ba6440c32d53a831a84\")
    :PAYLOAD-NAME \"SPK-07.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((141) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-07/SPK-07.lisp.gz\")
     :BYTES 410636 :SHA256 \"6623f5dbc535957d40f771d99679a397709e3095de54d470bdf37d662651dea6\"
     :GIT-BLOB \"70435904690b37dc7f48d65f1a31c3804d0b6ada\")))
  (:RELATIVE-PATH \"data/core-spikes-SPK-07/SPK-07.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 410636 :SHA256 \"6623f5dbc535957d40f771d99679a397709e3095de54d470bdf37d662651dea6\"
    :GIT-BLOB \"70435904690b37dc7f48d65f1a31c3804d0b6ada\")
   :ACTUAL
   (:PATH
    #A((141) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-07/SPK-07.lisp.gz\")
    :BYTES 410636 :SHA256 \"6623f5dbc535957d40f771d99679a397709e3095de54d470bdf37d662651dea6\"
    :GIT-BLOB \"70435904690b37dc7f48d65f1a31c3804d0b6ada\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"data/core-spikes-SPK-08/SPK-08.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 291712 :SHA256 \"3bcaec64c3989cc32b0a912af9d481795f462527256470a32c6fd3e444f18343\"
    :GIT-BLOB \"f20be16d7e3f4b9c677686f7147cfee4144991a6\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-08/SPK-08.lisp\")
    :BYTES 291712 :SHA256 \"3bcaec64c3989cc32b0a912af9d481795f462527256470a32c6fd3e444f18343\"
    :GIT-BLOB \"f20be16d7e3f4b9c677686f7147cfee4144991a6\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-08/SPK-08.lisp\")
     :BYTES 291712 :SHA256 \"3bcaec64c3989cc32b0a912af9d481795f462527256470a32c6fd3e444f18343\"
     :GIT-BLOB \"f20be16d7e3f4b9c677686f7147cfee4144991a6\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-08/SPK-08.lisp\")
     :BYTES 291712 :SHA256 \"3bcaec64c3989cc32b0a912af9d481795f462527256470a32c6fd3e444f18343\"
     :GIT-BLOB \"f20be16d7e3f4b9c677686f7147cfee4144991a6\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-09/SPK-09.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 2472 :SHA256 \"1680e84ad184a1a0d612922fc52a7716d195c0f4e273c92bf1f66fcc55243006\"
    :GIT-BLOB \"239cd65a6496ff8fe315c4cc806274f4f1281664\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-09/SPK-09.lisp\")
    :BYTES 2472 :SHA256 \"1680e84ad184a1a0d612922fc52a7716d195c0f4e273c92bf1f66fcc55243006\"
    :GIT-BLOB \"239cd65a6496ff8fe315c4cc806274f4f1281664\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-09/SPK-09.lisp\")
     :BYTES 2472 :SHA256 \"1680e84ad184a1a0d612922fc52a7716d195c0f4e273c92bf1f66fcc55243006\"
     :GIT-BLOB \"239cd65a6496ff8fe315c4cc806274f4f1281664\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-09/SPK-09.lisp\")
     :BYTES 2472 :SHA256 \"1680e84ad184a1a0d612922fc52a7716d195c0f4e273c92bf1f66fcc55243006\"
     :GIT-BLOB \"239cd65a6496ff8fe315c4cc806274f4f1281664\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-SPK-10/SPK-10.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 22977 :SHA256 \"a2376f2cffbe94b73f6b366316e72bf44c138ad30e5d702b35718af94d4217cf\"
    :GIT-BLOB \"1438188e9e958257aede2e873c8e3ea45f87e878\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-10/SPK-10.lisp\")
    :BYTES 22977 :SHA256 \"a2376f2cffbe94b73f6b366316e72bf44c138ad30e5d702b35718af94d4217cf\"
    :GIT-BLOB \"1438188e9e958257aede2e873c8e3ea45f87e878\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-10/SPK-10.lisp\")
     :BYTES 22977 :SHA256 \"a2376f2cffbe94b73f6b366316e72bf44c138ad30e5d702b35718af94d4217cf\"
     :GIT-BLOB \"1438188e9e958257aede2e873c8e3ea45f87e878\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-SPK-10/SPK-10.lisp\")
     :BYTES 22977 :SHA256 \"a2376f2cffbe94b73f6b366316e72bf44c138ad30e5d702b35718af94d4217cf\"
     :GIT-BLOB \"1438188e9e958257aede2e873c8e3ea45f87e878\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-conservazione/conservazione.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 2294 :SHA256 \"e751c8ecdeb4e9f59ad55d7035841e9c358d75a82b0d74858869380e8745939c\"
    :GIT-BLOB \"42c99b3722cc16a54a54483c5cb87e9e0628d2a7\")
   :ACTUAL
   (:PATH
    #A((152) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-conservazione/conservazione.lisp\")
    :BYTES 2294 :SHA256 \"e751c8ecdeb4e9f59ad55d7035841e9c358d75a82b0d74858869380e8745939c\"
    :GIT-BLOB \"42c99b3722cc16a54a54483c5cb87e9e0628d2a7\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((152) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-conservazione/conservazione.lisp\")
     :BYTES 2294 :SHA256 \"e751c8ecdeb4e9f59ad55d7035841e9c358d75a82b0d74858869380e8745939c\"
     :GIT-BLOB \"42c99b3722cc16a54a54483c5cb87e9e0628d2a7\")
    :EXPANDED
    (:PATH
     #A((152) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-conservazione/conservazione.lisp\")
     :BYTES 2294 :SHA256 \"e751c8ecdeb4e9f59ad55d7035841e9c358d75a82b0d74858869380e8745939c\"
     :GIT-BLOB \"42c99b3722cc16a54a54483c5cb87e9e0628d2a7\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"data/core-spikes-report/report.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 318 :SHA256 \"cee798f131a608f6be1a9a853a643487ca7d17bf5896504d5970a589cfe81622\" :GIT-BLOB
    \"6fc6eb3f7d4e1b84278b709e937141978906a5b8\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-report/report.lisp\")
    :BYTES 318 :SHA256 \"cee798f131a608f6be1a9a853a643487ca7d17bf5896504d5970a589cfe81622\" :GIT-BLOB
    \"6fc6eb3f7d4e1b84278b709e937141978906a5b8\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-report/report.lisp\")
     :BYTES 318 :SHA256 \"cee798f131a608f6be1a9a853a643487ca7d17bf5896504d5970a589cfe81622\"
     :GIT-BLOB \"6fc6eb3f7d4e1b84278b709e937141978906a5b8\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-1tButf\")
     :BYTES 28962479 :SHA256 \"5ddd49c68a1d0de09614b1b1473b7947cd3e6a1f078abe76390f879b6d9c8b36\"
     :GIT-BLOB \"7d8c83fa7776967d1b6c4c100f4931fc750c7398\")
    :PAYLOAD-NAME \"report.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((141) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-report/report.lisp.gz\")
     :BYTES 466877 :SHA256 \"108fa5f76fa74817d8b6876f3ade243722fd5150df91822626587947bbd41acd\"
     :GIT-BLOB \"312bad9a4d45eeffa11e1ddfc2290be206d24a54\")))
  (:RELATIVE-PATH \"data/core-spikes-report/report.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 466877 :SHA256 \"108fa5f76fa74817d8b6876f3ade243722fd5150df91822626587947bbd41acd\"
    :GIT-BLOB \"312bad9a4d45eeffa11e1ddfc2290be206d24a54\")
   :ACTUAL
   (:PATH
    #A((141) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/core-spikes-report/report.lisp.gz\")
    :BYTES 466877 :SHA256 \"108fa5f76fa74817d8b6876f3ade243722fd5150df91822626587947bbd41acd\"
    :GIT-BLOB \"312bad9a4d45eeffa11e1ddfc2290be206d24a54\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"data/coverage-audit/coverage-audit.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 1960 :SHA256 \"71764ede9d7cbb456d1603baac7428aa115cfb61656e223dcaf24dfe9b88a6f8\"
    :GIT-BLOB \"0ada6ad07ab04ac1ed939be8351287769d12f7be\")
   :ACTUAL
   (:PATH
    #A((142) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/coverage-audit/coverage-audit.lisp\")
    :BYTES 1960 :SHA256 \"71764ede9d7cbb456d1603baac7428aa115cfb61656e223dcaf24dfe9b88a6f8\"
    :GIT-BLOB \"0ada6ad07ab04ac1ed939be8351287769d12f7be\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((142) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/coverage-audit/coverage-audit.lisp\")
     :BYTES 1960 :SHA256 \"71764ede9d7cbb456d1603baac7428aa115cfb61656e223dcaf24dfe9b88a6f8\"
     :GIT-BLOB \"0ada6ad07ab04ac1ed939be8351287769d12f7be\")
    :EXPANDED
    (:PATH
     #A((142) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/data/coverage-audit/coverage-audit.lisp\")
     :BYTES 1960 :SHA256 \"71764ede9d7cbb456d1603baac7428aa115cfb61656e223dcaf24dfe9b88a6f8\"
     :GIT-BLOB \"0ada6ad07ab04ac1ed939be8351287769d12f7be\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"development-evidence-1.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 1041910 :SHA256 \"4f1b4273d8a29767da84057334271b89d5763635a934a9a866f386c33fe1da5a\"
    :GIT-BLOB \"62002a1d3e0c520ed9b73814396da2489807cd69\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-evidence-1.lisp\")
    :BYTES 1041910 :SHA256 \"4f1b4273d8a29767da84057334271b89d5763635a934a9a866f386c33fe1da5a\"
    :GIT-BLOB \"62002a1d3e0c520ed9b73814396da2489807cd69\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-evidence-1.lisp\")
     :BYTES 1041910 :SHA256 \"4f1b4273d8a29767da84057334271b89d5763635a934a9a866f386c33fe1da5a\"
     :GIT-BLOB \"62002a1d3e0c520ed9b73814396da2489807cd69\")
    :EXPANDED
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-evidence-1.lisp\")
     :BYTES 1041910 :SHA256 \"4f1b4273d8a29767da84057334271b89d5763635a934a9a866f386c33fe1da5a\"
     :GIT-BLOB \"62002a1d3e0c520ed9b73814396da2489807cd69\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"development-evidence-2.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 518071 :SHA256 \"1d3e9304cd79a942e52ebb9d4b9022958f49b960a53a3d41e63924ddd1edb334\"
    :GIT-BLOB \"8d94f14fbcdc035f38772f387afe661bff355708\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-evidence-2.lisp\")
    :BYTES 518071 :SHA256 \"1d3e9304cd79a942e52ebb9d4b9022958f49b960a53a3d41e63924ddd1edb334\"
    :GIT-BLOB \"8d94f14fbcdc035f38772f387afe661bff355708\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-evidence-2.lisp\")
     :BYTES 518071 :SHA256 \"1d3e9304cd79a942e52ebb9d4b9022958f49b960a53a3d41e63924ddd1edb334\"
     :GIT-BLOB \"8d94f14fbcdc035f38772f387afe661bff355708\")
    :EXPANDED
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-evidence-2.lisp\")
     :BYTES 518071 :SHA256 \"1d3e9304cd79a942e52ebb9d4b9022958f49b960a53a3d41e63924ddd1edb334\"
     :GIT-BLOB \"8d94f14fbcdc035f38772f387afe661bff355708\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"development-large-1.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 330 :SHA256 \"cebef758ae1ef82adc27330d0688dc23c89deefb084dc28754a9e103f11c9803\" :GIT-BLOB
    \"65c584cad11c341ec83a254e7d2f4656bb676e98\")
   :ACTUAL
   (:PATH
    #A((127) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-1.lisp\")
    :BYTES 330 :SHA256 \"cebef758ae1ef82adc27330d0688dc23c89deefb084dc28754a9e103f11c9803\" :GIT-BLOB
    \"65c584cad11c341ec83a254e7d2f4656bb676e98\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((127) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-1.lisp\")
     :BYTES 330 :SHA256 \"cebef758ae1ef82adc27330d0688dc23c89deefb084dc28754a9e103f11c9803\"
     :GIT-BLOB \"65c584cad11c341ec83a254e7d2f4656bb676e98\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-1S51bh\")
     :BYTES 1967188 :SHA256 \"3858c01f5d2f2abdbe2e393b08fc104f4ddcbd2f58bddf46c1f613aba0c3f764\"
     :GIT-BLOB \"c19622696a7782f745e5f9c3270eb5bedda4c0e8\")
    :PAYLOAD-NAME \"development-large-1.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-1.lisp.gz\")
     :BYTES 280411 :SHA256 \"84688ac096aac1fe9659b0e3ab4d33245131f2ecdeb49207122326f853f94bf7\"
     :GIT-BLOB \"b3dd0da6c27d27de9b3d52c6c791632511d124e2\")))
  (:RELATIVE-PATH \"development-large-1.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 280411 :SHA256 \"84688ac096aac1fe9659b0e3ab4d33245131f2ecdeb49207122326f853f94bf7\"
    :GIT-BLOB \"b3dd0da6c27d27de9b3d52c6c791632511d124e2\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-1.lisp.gz\")
    :BYTES 280411 :SHA256 \"84688ac096aac1fe9659b0e3ab4d33245131f2ecdeb49207122326f853f94bf7\"
    :GIT-BLOB \"b3dd0da6c27d27de9b3d52c6c791632511d124e2\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"development-large-2.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 330 :SHA256 \"f9e0411263eb8417404aae550d63c896e2b87ae31948035dae85a086aec943b9\" :GIT-BLOB
    \"cc3e0e634782b51a60828454e68272acb9469af0\")
   :ACTUAL
   (:PATH
    #A((127) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-2.lisp\")
    :BYTES 330 :SHA256 \"f9e0411263eb8417404aae550d63c896e2b87ae31948035dae85a086aec943b9\" :GIT-BLOB
    \"cc3e0e634782b51a60828454e68272acb9469af0\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((127) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-2.lisp\")
     :BYTES 330 :SHA256 \"f9e0411263eb8417404aae550d63c896e2b87ae31948035dae85a086aec943b9\"
     :GIT-BLOB \"cc3e0e634782b51a60828454e68272acb9469af0\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-TznGmG\")
     :BYTES 1967188 :SHA256 \"428ece50fc9b978568875487ca5c0fdb3d8b04451acc2ece2db9a6667ff5dade\"
     :GIT-BLOB \"a1a02a8f91e297f3f905ca56ab912750aff81ecf\")
    :PAYLOAD-NAME \"development-large-2.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-2.lisp.gz\")
     :BYTES 280388 :SHA256 \"803378ff5402c21af0e93db0bcf81334367e672a9de0f94200092778b0f18dee\"
     :GIT-BLOB \"ab19b0e86f1636a34f020562de14e7d27c3d51f4\")))
  (:RELATIVE-PATH \"development-large-2.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 280388 :SHA256 \"803378ff5402c21af0e93db0bcf81334367e672a9de0f94200092778b0f18dee\"
    :GIT-BLOB \"ab19b0e86f1636a34f020562de14e7d27c3d51f4\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-2.lisp.gz\")
    :BYTES 280388 :SHA256 \"803378ff5402c21af0e93db0bcf81334367e672a9de0f94200092778b0f18dee\"
    :GIT-BLOB \"ab19b0e86f1636a34f020562de14e7d27c3d51f4\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"development-large-3.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 330 :SHA256 \"aeb8f0c36c2e94a7221a76006021fd8ef470a1ee70ee4da80a66a09b8d07864b\" :GIT-BLOB
    \"0008b919c5d3322aa177ecaef1aab7988f0238eb\")
   :ACTUAL
   (:PATH
    #A((127) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-3.lisp\")
    :BYTES 330 :SHA256 \"aeb8f0c36c2e94a7221a76006021fd8ef470a1ee70ee4da80a66a09b8d07864b\" :GIT-BLOB
    \"0008b919c5d3322aa177ecaef1aab7988f0238eb\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((127) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-3.lisp\")
     :BYTES 330 :SHA256 \"aeb8f0c36c2e94a7221a76006021fd8ef470a1ee70ee4da80a66a09b8d07864b\"
     :GIT-BLOB \"0008b919c5d3322aa177ecaef1aab7988f0238eb\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-JB9WGF\")
     :BYTES 1969284 :SHA256 \"f9d8c6ab913d3b27dd4ee1c3b59f639ed11865d181db33710e7cab0d1e4228d8\"
     :GIT-BLOB \"9121761c217e2b9b926aa6101e998063f7b44cb1\")
    :PAYLOAD-NAME \"development-large-3.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-3.lisp.gz\")
     :BYTES 280743 :SHA256 \"11e1960b5947091f7469e4841c19ffc8876035cfa809b274f7cbfd066a9dc9bc\"
     :GIT-BLOB \"6bbad9dfa415bd66be2749f466fd389dbe5b8f15\")))
  (:RELATIVE-PATH \"development-large-3.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 280743 :SHA256 \"11e1960b5947091f7469e4841c19ffc8876035cfa809b274f7cbfd066a9dc9bc\"
    :GIT-BLOB \"6bbad9dfa415bd66be2749f466fd389dbe5b8f15\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-3.lisp.gz\")
    :BYTES 280743 :SHA256 \"11e1960b5947091f7469e4841c19ffc8876035cfa809b274f7cbfd066a9dc9bc\"
    :GIT-BLOB \"6bbad9dfa415bd66be2749f466fd389dbe5b8f15\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"development-large-4.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 330 :SHA256 \"d00ca79f83d6d48e18a02da5aa25884c56e06d95be9135b72a209e676f28af00\" :GIT-BLOB
    \"bd6a0fcd71a69a4538b68fd95e578f086a0253d5\")
   :ACTUAL
   (:PATH
    #A((127) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-4.lisp\")
    :BYTES 330 :SHA256 \"d00ca79f83d6d48e18a02da5aa25884c56e06d95be9135b72a209e676f28af00\" :GIT-BLOB
    \"bd6a0fcd71a69a4538b68fd95e578f086a0253d5\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((127) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-4.lisp\")
     :BYTES 330 :SHA256 \"d00ca79f83d6d48e18a02da5aa25884c56e06d95be9135b72a209e676f28af00\"
     :GIT-BLOB \"bd6a0fcd71a69a4538b68fd95e578f086a0253d5\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-WJSCUz\")
     :BYTES 1969284 :SHA256 \"b6fb149ff1ccf5f7190a4cea6d888ea05277ec8dc4dd45295f3a457aa5c2215f\"
     :GIT-BLOB \"a92f20a044ffc72936eb4063220c778f30ee932d\")
    :PAYLOAD-NAME \"development-large-4.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-4.lisp.gz\")
     :BYTES 280802 :SHA256 \"13b1016d019afaee052ce72729555615a25f8b133db96fcc23cd9b983ee35f5e\"
     :GIT-BLOB \"a6e657b15fc0fc621d45a526dc2fa43db71aabbd\")))
  (:RELATIVE-PATH \"development-large-4.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 280802 :SHA256 \"13b1016d019afaee052ce72729555615a25f8b133db96fcc23cd9b983ee35f5e\"
    :GIT-BLOB \"a6e657b15fc0fc621d45a526dc2fa43db71aabbd\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-4.lisp.gz\")
    :BYTES 280802 :SHA256 \"13b1016d019afaee052ce72729555615a25f8b133db96fcc23cd9b983ee35f5e\"
    :GIT-BLOB \"a6e657b15fc0fc621d45a526dc2fa43db71aabbd\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"development-large-5.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 330 :SHA256 \"9c75e88715f00718afc89bc6f8883b39986ee9eda3922ef5c656182cba0f4eae\" :GIT-BLOB
    \"fb69de00d74c1e0b943f16aa57601dcd1eab69b6\")
   :ACTUAL
   (:PATH
    #A((127) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-5.lisp\")
    :BYTES 330 :SHA256 \"9c75e88715f00718afc89bc6f8883b39986ee9eda3922ef5c656182cba0f4eae\" :GIT-BLOB
    \"fb69de00d74c1e0b943f16aa57601dcd1eab69b6\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((127) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-5.lisp\")
     :BYTES 330 :SHA256 \"9c75e88715f00718afc89bc6f8883b39986ee9eda3922ef5c656182cba0f4eae\"
     :GIT-BLOB \"fb69de00d74c1e0b943f16aa57601dcd1eab69b6\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-I7EiP6\")
     :BYTES 1969284 :SHA256 \"6618ecea518ef0b12a541d33c67e88383cc69e488874e5c06fcd927c100ba711\"
     :GIT-BLOB \"f39c0013e6f34069fbfd20037b87ab873cc0da04\")
    :PAYLOAD-NAME \"development-large-5.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-5.lisp.gz\")
     :BYTES 280802 :SHA256 \"0d27441f13be56beabcb5ef4f954e6d2a5034fbc24125f7783e8ad0b9eb99270\"
     :GIT-BLOB \"7d6c617074949d909e2b7d4929931c65dcedd8a9\")))
  (:RELATIVE-PATH \"development-large-5.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 280802 :SHA256 \"0d27441f13be56beabcb5ef4f954e6d2a5034fbc24125f7783e8ad0b9eb99270\"
    :GIT-BLOB \"7d6c617074949d909e2b7d4929931c65dcedd8a9\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-5.lisp.gz\")
    :BYTES 280802 :SHA256 \"0d27441f13be56beabcb5ef4f954e6d2a5034fbc24125f7783e8ad0b9eb99270\"
    :GIT-BLOB \"7d6c617074949d909e2b7d4929931c65dcedd8a9\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"development-large-6.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 330 :SHA256 \"a479dceb76c327ba28d68d225e44307f8dae5e18c962d22e450082b65ca6e87d\" :GIT-BLOB
    \"4c26bb88d772961af0fad369b2c916e53b1ac469\")
   :ACTUAL
   (:PATH
    #A((127) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-6.lisp\")
    :BYTES 330 :SHA256 \"a479dceb76c327ba28d68d225e44307f8dae5e18c962d22e450082b65ca6e87d\" :GIT-BLOB
    \"4c26bb88d772961af0fad369b2c916e53b1ac469\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((127) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-6.lisp\")
     :BYTES 330 :SHA256 \"a479dceb76c327ba28d68d225e44307f8dae5e18c962d22e450082b65ca6e87d\"
     :GIT-BLOB \"4c26bb88d772961af0fad369b2c916e53b1ac469\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-wKD2vm\")
     :BYTES 1969284 :SHA256 \"03157e84f0197d3177a69f197a7b2f3125ea98b537e2b5e33546c8ff93847afc\"
     :GIT-BLOB \"911171c5894b9220dc77e9d3e0565845d97e9a1e\")
    :PAYLOAD-NAME \"development-large-6.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-6.lisp.gz\")
     :BYTES 280802 :SHA256 \"ec23356bcd70ec0ae94060de0a126eb9522075c778e48a1eb1e1d5ac79e908eb\"
     :GIT-BLOB \"1087f55209fb8f1b708bbe51ca6656c81f1820cb\")))
  (:RELATIVE-PATH \"development-large-6.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 280802 :SHA256 \"ec23356bcd70ec0ae94060de0a126eb9522075c778e48a1eb1e1d5ac79e908eb\"
    :GIT-BLOB \"1087f55209fb8f1b708bbe51ca6656c81f1820cb\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-6.lisp.gz\")
    :BYTES 280802 :SHA256 \"ec23356bcd70ec0ae94060de0a126eb9522075c778e48a1eb1e1d5ac79e908eb\"
    :GIT-BLOB \"1087f55209fb8f1b708bbe51ca6656c81f1820cb\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"development-large-7.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 330 :SHA256 \"2415b2174e02bff00430978beebaf7bd0954bcd1d16ce8c0631ce421c9022c8f\" :GIT-BLOB
    \"d3143e99136c5bae4c63aa7323dc0f2932c6d0fd\")
   :ACTUAL
   (:PATH
    #A((127) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-7.lisp\")
    :BYTES 330 :SHA256 \"2415b2174e02bff00430978beebaf7bd0954bcd1d16ce8c0631ce421c9022c8f\" :GIT-BLOB
    \"d3143e99136c5bae4c63aa7323dc0f2932c6d0fd\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((127) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-7.lisp\")
     :BYTES 330 :SHA256 \"2415b2174e02bff00430978beebaf7bd0954bcd1d16ce8c0631ce421c9022c8f\"
     :GIT-BLOB \"d3143e99136c5bae4c63aa7323dc0f2932c6d0fd\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-FzCEq7\")
     :BYTES 1969284 :SHA256 \"25724aba9e2f86a1467594cb8d4b697ab386cd39e1095d19c4c430da12074c89\"
     :GIT-BLOB \"9d1337254ef6023212562c1fe1c1b15b80d01d59\")
    :PAYLOAD-NAME \"development-large-7.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-7.lisp.gz\")
     :BYTES 280802 :SHA256 \"e62bb4aa2cd5e836f6efba49754e151ea19dab03ee02bda94e9a006b87e041b9\"
     :GIT-BLOB \"bec06d8a45fb24f887ab60f242d8c9847f60de74\")))
  (:RELATIVE-PATH \"development-large-7.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 280802 :SHA256 \"e62bb4aa2cd5e836f6efba49754e151ea19dab03ee02bda94e9a006b87e041b9\"
    :GIT-BLOB \"bec06d8a45fb24f887ab60f242d8c9847f60de74\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-7.lisp.gz\")
    :BYTES 280802 :SHA256 \"e62bb4aa2cd5e836f6efba49754e151ea19dab03ee02bda94e9a006b87e041b9\"
    :GIT-BLOB \"bec06d8a45fb24f887ab60f242d8c9847f60de74\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"development-large-8.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 330 :SHA256 \"e797875c442f6699ace8a6c4ac00c3582263990e8a8e5e5a5141e4476f583fb5\" :GIT-BLOB
    \"5d00868b42a6d46e9d4f21339bb3e54f139c34b7\")
   :ACTUAL
   (:PATH
    #A((127) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-8.lisp\")
    :BYTES 330 :SHA256 \"e797875c442f6699ace8a6c4ac00c3582263990e8a8e5e5a5141e4476f583fb5\" :GIT-BLOB
    \"5d00868b42a6d46e9d4f21339bb3e54f139c34b7\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((127) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-8.lisp\")
     :BYTES 330 :SHA256 \"e797875c442f6699ace8a6c4ac00c3582263990e8a8e5e5a5141e4476f583fb5\"
     :GIT-BLOB \"5d00868b42a6d46e9d4f21339bb3e54f139c34b7\")
    :EXPANDED
    (:PATH
     #A((73) BASE-CHAR
        . \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-evidence-qBTtvH\")
     :BYTES 1970715 :SHA256 \"afe0e781802f04e572f1be72194ab53e789d8ee4747b17c906b6931c96112233\"
     :GIT-BLOB \"67c8c86e88dac90f0c8f62625374858a4348b747\")
    :PAYLOAD-NAME \"development-large-8.lisp.gz\" :PAYLOAD-RECORD
    (:PATH
     #A((130) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-8.lisp.gz\")
     :BYTES 281030 :SHA256 \"28a0377371ccef0b57c60093c29f34ce5310106f90d5fe977b3ec739b4fbb13e\"
     :GIT-BLOB \"e9ec0cec95ffe8d9b9c561cc220f83d38b85b6e2\")))
  (:RELATIVE-PATH \"development-large-8.lisp.gz\" :STATUS :OK :EXPECTED
   (:BYTES 281030 :SHA256 \"28a0377371ccef0b57c60093c29f34ce5310106f90d5fe977b3ec739b4fbb13e\"
    :GIT-BLOB \"e9ec0cec95ffe8d9b9c561cc220f83d38b85b6e2\")
   :ACTUAL
   (:PATH
    #A((130) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-8.lisp.gz\")
    :BYTES 281030 :SHA256 \"28a0377371ccef0b57c60093c29f34ce5310106f90d5fe977b3ec739b4fbb13e\"
    :GIT-BLOB \"e9ec0cec95ffe8d9b9c561cc220f83d38b85b6e2\")
   :EVIDENCE-PROOF NIL)
  (:RELATIVE-PATH \"development-large-conservazione.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 6010 :SHA256 \"7cf7b717ce732e7fe3ca3185b3117b78b178aa024a8650f6b2c2cdbed467f8df\"
    :GIT-BLOB \"e9f455fa5dfc1b76f0b2888a8e1b8b70ebc7bd00\")
   :ACTUAL
   (:PATH
    #A((139) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-conservazione.lisp\")
    :BYTES 6010 :SHA256 \"7cf7b717ce732e7fe3ca3185b3117b78b178aa024a8650f6b2c2cdbed467f8df\"
    :GIT-BLOB \"e9f455fa5dfc1b76f0b2888a8e1b8b70ebc7bd00\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((139) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-conservazione.lisp\")
     :BYTES 6010 :SHA256 \"7cf7b717ce732e7fe3ca3185b3117b78b178aa024a8650f6b2c2cdbed467f8df\"
     :GIT-BLOB \"e9f455fa5dfc1b76f0b2888a8e1b8b70ebc7bd00\")
    :EXPANDED
    (:PATH
     #A((139) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-large-conservazione.lisp\")
     :BYTES 6010 :SHA256 \"7cf7b717ce732e7fe3ca3185b3117b78b178aa024a8650f6b2c2cdbed467f8df\"
     :GIT-BLOB \"e9f455fa5dfc1b76f0b2888a8e1b8b70ebc7bd00\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"development-manifest.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 572775 :SHA256 \"1546853efc63d895dcf39b539ec06effaaa82812c4db530d5dd8045694c9c285\"
    :GIT-BLOB \"3e230d6cf6cfc808ba29b3d33681730d7ce5a1f6\")
   :ACTUAL
   (:PATH
    #A((128) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-manifest.lisp\")
    :BYTES 572775 :SHA256 \"1546853efc63d895dcf39b539ec06effaaa82812c4db530d5dd8045694c9c285\"
    :GIT-BLOB \"3e230d6cf6cfc808ba29b3d33681730d7ce5a1f6\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((128) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-manifest.lisp\")
     :BYTES 572775 :SHA256 \"1546853efc63d895dcf39b539ec06effaaa82812c4db530d5dd8045694c9c285\"
     :GIT-BLOB \"3e230d6cf6cfc808ba29b3d33681730d7ce5a1f6\")
    :EXPANDED
    (:PATH
     #A((128) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/development-manifest.lisp\")
     :BYTES 572775 :SHA256 \"1546853efc63d895dcf39b539ec06effaaa82812c4db530d5dd8045694c9c285\"
     :GIT-BLOB \"3e230d6cf6cfc808ba29b3d33681730d7ce5a1f6\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"process-manifest.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 6100 :SHA256 \"a012b4cb7afbcc253251875a85d32923d9738fc851e9f0f154c080d1b2464316\"
    :GIT-BLOB \"0e2317f358c92070f33920abb3b7862c18da0ef7\")
   :ACTUAL
   (:PATH
    #A((124) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/process-manifest.lisp\")
    :BYTES 6100 :SHA256 \"a012b4cb7afbcc253251875a85d32923d9738fc851e9f0f154c080d1b2464316\"
    :GIT-BLOB \"0e2317f358c92070f33920abb3b7862c18da0ef7\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((124) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/process-manifest.lisp\")
     :BYTES 6100 :SHA256 \"a012b4cb7afbcc253251875a85d32923d9738fc851e9f0f154c080d1b2464316\"
     :GIT-BLOB \"0e2317f358c92070f33920abb3b7862c18da0ef7\")
    :EXPANDED
    (:PATH
     #A((124) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/process-manifest.lisp\")
     :BYTES 6100 :SHA256 \"a012b4cb7afbcc253251875a85d32923d9738fc851e9f0f154c080d1b2464316\"
     :GIT-BLOB \"0e2317f358c92070f33920abb3b7862c18da0ef7\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/benchmark/conservazione.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 1150 :SHA256 \"2d453f5760b95d97e733065b28c804795616274eb711325c7cd60de414ec9064\"
    :GIT-BLOB \"e4a33885c582e3127a0ae1f3004d0ac2226b6f04\")
   :ACTUAL
   (:PATH
    #A((141) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/benchmark/conservazione.lisp\")
    :BYTES 1150 :SHA256 \"2d453f5760b95d97e733065b28c804795616274eb711325c7cd60de414ec9064\"
    :GIT-BLOB \"e4a33885c582e3127a0ae1f3004d0ac2226b6f04\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((141) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/benchmark/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"2d453f5760b95d97e733065b28c804795616274eb711325c7cd60de414ec9064\"
     :GIT-BLOB \"e4a33885c582e3127a0ae1f3004d0ac2226b6f04\")
    :EXPANDED
    (:PATH
     #A((141) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/benchmark/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"2d453f5760b95d97e733065b28c804795616274eb711325c7cd60de414ec9064\"
     :GIT-BLOB \"e4a33885c582e3127a0ae1f3004d0ac2226b6f04\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/benchmark/report.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 219442 :SHA256 \"265bcaeaa1865be548888a7e24b527e3cb8b7a2a808faece4d15a5942ce3b38e\"
    :GIT-BLOB \"5db69ae978e2c3fd5da3ffbdd1fd38af19899eb2\")
   :ACTUAL
   (:PATH
    #A((134) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/benchmark/report.lisp\")
    :BYTES 219442 :SHA256 \"265bcaeaa1865be548888a7e24b527e3cb8b7a2a808faece4d15a5942ce3b38e\"
    :GIT-BLOB \"5db69ae978e2c3fd5da3ffbdd1fd38af19899eb2\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((134) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/benchmark/report.lisp\")
     :BYTES 219442 :SHA256 \"265bcaeaa1865be548888a7e24b527e3cb8b7a2a808faece4d15a5942ce3b38e\"
     :GIT-BLOB \"5db69ae978e2c3fd5da3ffbdd1fd38af19899eb2\")
    :EXPANDED
    (:PATH
     #A((134) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/benchmark/report.lisp\")
     :BYTES 219442 :SHA256 \"265bcaeaa1865be548888a7e24b527e3cb8b7a2a808faece4d15a5942ce3b38e\"
     :GIT-BLOB \"5db69ae978e2c3fd5da3ffbdd1fd38af19899eb2\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/core-cache-rejected/conservazione.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 1150 :SHA256 \"bc6d2a2235263700e2c270668d50a889c2215a238f9ff8ac7f414f6a5ab98766\"
    :GIT-BLOB \"519c040113c6591162850b237c960f58813f8683\")
   :ACTUAL
   (:PATH
    #A((151) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core-cache-rejected/conservazione.lisp\")
    :BYTES 1150 :SHA256 \"bc6d2a2235263700e2c270668d50a889c2215a238f9ff8ac7f414f6a5ab98766\"
    :GIT-BLOB \"519c040113c6591162850b237c960f58813f8683\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((151) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core-cache-rejected/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"bc6d2a2235263700e2c270668d50a889c2215a238f9ff8ac7f414f6a5ab98766\"
     :GIT-BLOB \"519c040113c6591162850b237c960f58813f8683\")
    :EXPANDED
    (:PATH
     #A((151) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core-cache-rejected/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"bc6d2a2235263700e2c270668d50a889c2215a238f9ff8ac7f414f6a5ab98766\"
     :GIT-BLOB \"519c040113c6591162850b237c960f58813f8683\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/core-cache-rejected/report.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 164619 :SHA256 \"0e421baeaf2348673249287fcadbb402f6252c998c70c5a59b6699e6020f6ed8\"
    :GIT-BLOB \"f2fa0c117d92c10b81f62f10bc054dd6abe3c187\")
   :ACTUAL
   (:PATH
    #A((144) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core-cache-rejected/report.lisp\")
    :BYTES 164619 :SHA256 \"0e421baeaf2348673249287fcadbb402f6252c998c70c5a59b6699e6020f6ed8\"
    :GIT-BLOB \"f2fa0c117d92c10b81f62f10bc054dd6abe3c187\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((144) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core-cache-rejected/report.lisp\")
     :BYTES 164619 :SHA256 \"0e421baeaf2348673249287fcadbb402f6252c998c70c5a59b6699e6020f6ed8\"
     :GIT-BLOB \"f2fa0c117d92c10b81f62f10bc054dd6abe3c187\")
    :EXPANDED
    (:PATH
     #A((144) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core-cache-rejected/report.lisp\")
     :BYTES 164619 :SHA256 \"0e421baeaf2348673249287fcadbb402f6252c998c70c5a59b6699e6020f6ed8\"
     :GIT-BLOB \"f2fa0c117d92c10b81f62f10bc054dd6abe3c187\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/core/conservazione.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 1150 :SHA256 \"afed3d9dce9672edfc65432adf947f36868e70b4fc5096a0280e321ef96706f4\"
    :GIT-BLOB \"a4580b4bd4a87070b615e178f6dc083eed3d1775\")
   :ACTUAL
   (:PATH
    #A((136) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core/conservazione.lisp\")
    :BYTES 1150 :SHA256 \"afed3d9dce9672edfc65432adf947f36868e70b4fc5096a0280e321ef96706f4\"
    :GIT-BLOB \"a4580b4bd4a87070b615e178f6dc083eed3d1775\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((136) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"afed3d9dce9672edfc65432adf947f36868e70b4fc5096a0280e321ef96706f4\"
     :GIT-BLOB \"a4580b4bd4a87070b615e178f6dc083eed3d1775\")
    :EXPANDED
    (:PATH
     #A((136) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"afed3d9dce9672edfc65432adf947f36868e70b4fc5096a0280e321ef96706f4\"
     :GIT-BLOB \"a4580b4bd4a87070b615e178f6dc083eed3d1775\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/core/report.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 830898 :SHA256 \"57d7a9ad35781625544292266909e9cf3a4118281dfbd1107418b8667d16b9e0\"
    :GIT-BLOB \"aaa30cf68615ad533addfed6fa53671db722473e\")
   :ACTUAL
   (:PATH
    #A((129) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core/report.lisp\")
    :BYTES 830898 :SHA256 \"57d7a9ad35781625544292266909e9cf3a4118281dfbd1107418b8667d16b9e0\"
    :GIT-BLOB \"aaa30cf68615ad533addfed6fa53671db722473e\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((129) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core/report.lisp\")
     :BYTES 830898 :SHA256 \"57d7a9ad35781625544292266909e9cf3a4118281dfbd1107418b8667d16b9e0\"
     :GIT-BLOB \"aaa30cf68615ad533addfed6fa53671db722473e\")
    :EXPANDED
    (:PATH
     #A((129) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/core/report.lisp\")
     :BYTES 830898 :SHA256 \"57d7a9ad35781625544292266909e9cf3a4118281dfbd1107418b8667d16b9e0\"
     :GIT-BLOB \"aaa30cf68615ad533addfed6fa53671db722473e\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/coverage/conservazione.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 1150 :SHA256 \"3bf1fab82292baaa08ae764400e2909038500daead5913fa4bfe2451dc0a1f84\"
    :GIT-BLOB \"2f0041dcfaf0cc939f7368557f7c5c3f770877fa\")
   :ACTUAL
   (:PATH
    #A((140) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/coverage/conservazione.lisp\")
    :BYTES 1150 :SHA256 \"3bf1fab82292baaa08ae764400e2909038500daead5913fa4bfe2451dc0a1f84\"
    :GIT-BLOB \"2f0041dcfaf0cc939f7368557f7c5c3f770877fa\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((140) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/coverage/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"3bf1fab82292baaa08ae764400e2909038500daead5913fa4bfe2451dc0a1f84\"
     :GIT-BLOB \"2f0041dcfaf0cc939f7368557f7c5c3f770877fa\")
    :EXPANDED
    (:PATH
     #A((140) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/coverage/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"3bf1fab82292baaa08ae764400e2909038500daead5913fa4bfe2451dc0a1f84\"
     :GIT-BLOB \"2f0041dcfaf0cc939f7368557f7c5c3f770877fa\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/coverage/report.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 155433 :SHA256 \"0d8c0402dba7862830badc9a143cb78ccbc1bf3ae01b2a2de7b51aa1c444cc20\"
    :GIT-BLOB \"d319b9ad9099f080e2b751830b70585296482b09\")
   :ACTUAL
   (:PATH
    #A((133) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/coverage/report.lisp\")
    :BYTES 155433 :SHA256 \"0d8c0402dba7862830badc9a143cb78ccbc1bf3ae01b2a2de7b51aa1c444cc20\"
    :GIT-BLOB \"d319b9ad9099f080e2b751830b70585296482b09\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((133) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/coverage/report.lisp\")
     :BYTES 155433 :SHA256 \"0d8c0402dba7862830badc9a143cb78ccbc1bf3ae01b2a2de7b51aa1c444cc20\"
     :GIT-BLOB \"d319b9ad9099f080e2b751830b70585296482b09\")
    :EXPANDED
    (:PATH
     #A((133) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/coverage/report.lisp\")
     :BYTES 155433 :SHA256 \"0d8c0402dba7862830badc9a143cb78ccbc1bf3ae01b2a2de7b51aa1c444cc20\"
     :GIT-BLOB \"d319b9ad9099f080e2b751830b70585296482b09\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/tool-selftest/conservazione.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 1150 :SHA256 \"445359ace74b4e31bdb3e9b06fdd379217ce8886b722f739531832c0d715889a\"
    :GIT-BLOB \"abf1c79d5ccf2b232c884a30df5ed77c19067572\")
   :ACTUAL
   (:PATH
    #A((145) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/tool-selftest/conservazione.lisp\")
    :BYTES 1150 :SHA256 \"445359ace74b4e31bdb3e9b06fdd379217ce8886b722f739531832c0d715889a\"
    :GIT-BLOB \"abf1c79d5ccf2b232c884a30df5ed77c19067572\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((145) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/tool-selftest/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"445359ace74b4e31bdb3e9b06fdd379217ce8886b722f739531832c0d715889a\"
     :GIT-BLOB \"abf1c79d5ccf2b232c884a30df5ed77c19067572\")
    :EXPANDED
    (:PATH
     #A((145) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/tool-selftest/conservazione.lisp\")
     :BYTES 1150 :SHA256 \"445359ace74b4e31bdb3e9b06fdd379217ce8886b722f739531832c0d715889a\"
     :GIT-BLOB \"abf1c79d5ccf2b232c884a30df5ed77c19067572\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"processes/tool-selftest/report.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 217991 :SHA256 \"6f62fd46160522d6295fe44652cce998459f49c3b6055e36562f8628cf9b8a40\"
    :GIT-BLOB \"740b313ade64f3629b5df89e29940fc0c11de9aa\")
   :ACTUAL
   (:PATH
    #A((138) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/tool-selftest/report.lisp\")
    :BYTES 217991 :SHA256 \"6f62fd46160522d6295fe44652cce998459f49c3b6055e36562f8628cf9b8a40\"
    :GIT-BLOB \"740b313ade64f3629b5df89e29940fc0c11de9aa\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/tool-selftest/report.lisp\")
     :BYTES 217991 :SHA256 \"6f62fd46160522d6295fe44652cce998459f49c3b6055e36562f8628cf9b8a40\"
     :GIT-BLOB \"740b313ade64f3629b5df89e29940fc0c11de9aa\")
    :EXPANDED
    (:PATH
     #A((138) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/processes/tool-selftest/report.lisp\")
     :BYTES 217991 :SHA256 \"6f62fd46160522d6295fe44652cce998459f49c3b6055e36562f8628cf9b8a40\"
     :GIT-BLOB \"740b313ade64f3629b5df89e29940fc0c11de9aa\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"publication-orchestration.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 54701 :SHA256 \"eeaf6c3a320d404de6d5ce32871336fa6fe2c14794f69bd3763c64a31e3be730\"
    :GIT-BLOB \"70d47049ad4002ac6ea74214730c589f0ff70ca0\")
   :ACTUAL
   (:PATH
    #A((133) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/publication-orchestration.lisp\")
    :BYTES 54701 :SHA256 \"eeaf6c3a320d404de6d5ce32871336fa6fe2c14794f69bd3763c64a31e3be730\"
    :GIT-BLOB \"70d47049ad4002ac6ea74214730c589f0ff70ca0\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((133) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/publication-orchestration.lisp\")
     :BYTES 54701 :SHA256 \"eeaf6c3a320d404de6d5ce32871336fa6fe2c14794f69bd3763c64a31e3be730\"
     :GIT-BLOB \"70d47049ad4002ac6ea74214730c589f0ff70ca0\")
    :EXPANDED
    (:PATH
     #A((133) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/publication-orchestration.lisp\")
     :BYTES 54701 :SHA256 \"eeaf6c3a320d404de6d5ce32871336fa6fe2c14794f69bd3763c64a31e3be730\"
     :GIT-BLOB \"70d47049ad4002ac6ea74214730c589f0ff70ca0\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"sources-final.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 136291 :SHA256 \"c1ff06a987efc08eec19af8e9bf9f964bad4aafb5c3a29cc159d034afff75fb0\"
    :GIT-BLOB \"593795b4094f7d29e391339cdeb1e3cc0ca68fe3\")
   :ACTUAL
   (:PATH
    #A((121) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/sources-final.lisp\")
    :BYTES 136291 :SHA256 \"c1ff06a987efc08eec19af8e9bf9f964bad4aafb5c3a29cc159d034afff75fb0\"
    :GIT-BLOB \"593795b4094f7d29e391339cdeb1e3cc0ca68fe3\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((121) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/sources-final.lisp\")
     :BYTES 136291 :SHA256 \"c1ff06a987efc08eec19af8e9bf9f964bad4aafb5c3a29cc159d034afff75fb0\"
     :GIT-BLOB \"593795b4094f7d29e391339cdeb1e3cc0ca68fe3\")
    :EXPANDED
    (:PATH
     #A((121) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/sources-final.lisp\")
     :BYTES 136291 :SHA256 \"c1ff06a987efc08eec19af8e9bf9f964bad4aafb5c3a29cc159d034afff75fb0\"
     :GIT-BLOB \"593795b4094f7d29e391339cdeb1e3cc0ca68fe3\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL))
  (:RELATIVE-PATH \"sources-qualified.lisp\" :STATUS :OK :EXPECTED
   (:BYTES 133399 :SHA256 \"c8b8ffbd3b82f88581ef6094a72e270d0d9004d9ff253e45660842c389796d3d\"
    :GIT-BLOB \"0ba71bcd24f57c3930680677ab17865799e50230\")
   :ACTUAL
   (:PATH
    #A((125) BASE-CHAR
       . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/sources-qualified.lisp\")
    :BYTES 133399 :SHA256 \"c8b8ffbd3b82f88581ef6094a72e270d0d9004d9ff253e45660842c389796d3d\"
    :GIT-BLOB \"0ba71bcd24f57c3930680677ab17865799e50230\")
   :EVIDENCE-PROOF
   (:RAW
    (:PATH
     #A((125) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/sources-qualified.lisp\")
     :BYTES 133399 :SHA256 \"c8b8ffbd3b82f88581ef6094a72e270d0d9004d9ff253e45660842c389796d3d\"
     :GIT-BLOB \"0ba71bcd24f57c3930680677ab17865799e50230\")
    :EXPANDED
    (:PATH
     #A((125) BASE-CHAR
        . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-13-pool-controller/sources-qualified.lisp\")
     :BYTES 133399 :SHA256 \"c8b8ffbd3b82f88581ef6094a72e270d0d9004d9ff253e45660842c389796d3d\"
     :GIT-BLOB \"0ba71bcd24f57c3930680677ab17865799e50230\")
    :PAYLOAD-NAME NIL :PAYLOAD-RECORD NIL)))
 :PROBLEMS NIL :LIMITS
 (:ONLY-ORIGINAL-MANIFEST-ENTRIES :NEW-SEALS-OUTSIDE-AUDIT-SCOPE :NO-CANONICAL-OR-SOURCE-MUTATION
  :NO-GIT-MUTATION :BYTES-SHA256-GIT-BLOB-AND-EVIDENCE-INTEGRITY
  :NO-QUALIFICATION-OR-RESULT-REINTERPRETATION))
")
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-audit-final/stderr.log")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-audit-final/stdout.log")
   :BYTES 102 :SHA256 "996f85bf357f65ce113cc1b2e357553f2914e676940d0bd9e145d57f5f7fc005" :GIT-BLOB
   "e6f4d8ba1edfe0ed8b4d4ae937092f607508fc96" :TEXT
   "Manifest audit PASS: 1/50 entries, 30 plain, 10 compressed descriptors, 10 gzip payloads; 0 problems.
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-audit-final/summarize.lisp")
   :BYTES 2484 :SHA256 "fdd8f81072d46c12fafabc68e0794466702ae6d597644e8790e4a9a719c5f73c" :GIT-BLOB
   "03f08d32dcff713fd313327578db5650cb015339" :TEXT
   ";;;; Proiezione del rapporto originale; non ripete audit dei canonici o qualificazione.
(require :asdf)
(load \"spikes/out/worker-publication-functions.lisp\")
(in-package #:cl-user)
(let* ((path #p\"spikes/out/pool-audit-final/report.lisp\")
       (before (worker-byte-record path))
       (report (arcdocdb.evidence:read-evidence path))
       (files (getf report :files))
       (actual-count (length files))
       (ok (and (eq (getf report :status) :ok)
                (= (getf report :declared-entries) (getf report :verified-entries) actual-count)
                (null (getf report :problems))
                (every (lambda (entry)
                         (and (eq (getf entry :status) :ok)
                              (worker-byte-records-equal-p (getf entry :expected)
                                                           (getf entry :actual)))) files)
                (worker-byte-records-equal-p (getf report :manifest-before)
                                             (getf report :manifest-after))
                (worker-byte-records-equal-p before (worker-byte-record path)))))
  (worker-save-data
   (list :schema-version 1 :kind :pool-controller-final-audit-summary
         :status (if ok :ok :failed) :original-report before
         :declared-entries (getf report :declared-entries)
         :verified-entry-field (getf report :verified-entries)
         :retained-entry-proof-count actual-count
         :plain-evidence (getf report :plain-evidence)
         :compressed-descriptors (getf report :compressed-descriptors)
         :gzip-payload-entries (getf report :gzip-payload-entries)
         :problems (getf report :problems)
         :original-stdout-displayed-verified-count 1
         :stdout-defect :destructive-nreverse-before-length-print
         :note \"Lo stdout originale mostra 1/50: NREVERSE cambia la variabile lista prima della stampa. Il report originale ha verified-entries=50 e conserva tutte le 50 prove, tutte concordi per bytes/SHA256/Git blob. Nessun output originale viene riscritto.\"
         :limits '(:derived-projection-of-original-audit :no-repeated-hashes-or-qualification
                   :original-script-stdout-stderr-report-preserved))
   #p\"spikes/out/pool-audit-final/summary.lisp\")
  (format t \"Original audit projection ~A: ~D/~D retained and verified entries; original stdout count defect preserved.~%\"
          (if ok \"PASS\" \"FAIL\") actual-count (getf report :declared-entries))
  (uiop:quit (if ok 0 1)))
")
  (:PATH
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-audit-final/summary.lisp")
   :BYTES 966 :SHA256 "c20aa0725484f1202da96792ef0e18e055556a2fef046137a7405ae070a8af20" :GIT-BLOB
   "bf980d13ffe4dc5e9f51d3b8c11dccee2314fead" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-FINAL-AUDIT-SUMMARY :STATUS :OK :ORIGINAL-REPORT
 (:PATH #A((39) BASE-CHAR . \"spikes/out/pool-audit-final/report.lisp\") :BYTES 62849 :SHA256
  \"045010ed6c33984daff7f253c28727747211dc141441fa2c6612e02fdbd2ea33\" :GIT-BLOB
  \"b3b11294b46c02ef91b6ac9e60f0750a76da4b84\")
 :DECLARED-ENTRIES 50 :VERIFIED-ENTRY-FIELD 50 :RETAINED-ENTRY-PROOF-COUNT 50 :PLAIN-EVIDENCE 30
 :COMPRESSED-DESCRIPTORS 10 :GZIP-PAYLOAD-ENTRIES 10 :PROBLEMS NIL
 :ORIGINAL-STDOUT-DISPLAYED-VERIFIED-COUNT 1 :STDOUT-DEFECT
 :DESTRUCTIVE-NREVERSE-BEFORE-LENGTH-PRINT :NOTE
 \"Lo stdout originale mostra 1/50: NREVERSE cambia la variabile lista prima della stampa. Il report originale ha verified-entries=50 e conserva tutte le 50 prove, tutte concordi per bytes/SHA256/Git blob. Nessun output originale viene riscritto.\"
 :LIMITS
 (:DERIVED-PROJECTION-OF-ORIGINAL-AUDIT :NO-REPEATED-HASHES-OR-QUALIFICATION
  :ORIGINAL-SCRIPT-STDOUT-STDERR-REPORT-PRESERVED))
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-audit-final/summary.stderr.log")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-audit-final/summary.stdout.log")
   :BYTES 109 :SHA256 "963ab276559ad8381ad549b7ca1086f5f4f24ef9b9eb5b9ed26856eb2dcc9f27" :GIT-BLOB
   "3ce629cf7dbcc792e372312b3820c4269ac3de94" :TEXT
   "Original audit projection PASS: 50/50 retained and verified entries; original stdout count defect preserved.
")))
