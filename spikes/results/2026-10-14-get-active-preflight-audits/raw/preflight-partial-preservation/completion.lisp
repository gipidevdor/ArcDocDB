(:schema-version 1 :kind :opaque-partial-preservation-completion :status :ok
 :qualification :partial-unqualified :reason :collector-r2-stopped-for-batch-digest-replacement
 :commit "8c0866711c50d047f87b9c484ce56d42a87ba19c"
 :source-sha256 "6358b9e37914b2e6da45d9889a5109f23344c880b58161350456941dc9472fe1"
 :batch-library-sha256 "130f428551e1aa17a946c2614db5dc14adf9ae35309ec2b21c3be5b2d59be1da"
 :manifest "manifest-R2.lisp" :payload-directory "payloads-R2/"
 :preservation-native "spikes/out/4000988575-command-31943-0/report.lisp" :preservation-status :ok
 :payloads (:gzip-parts 15 :gzip-bytes 23001127 :largest-gzip-bytes 1956990
            :max-expanded-part-bytes 4194304 :gzip-limit-bytes 8388608
            :mutation (:parts 8 :files 1382 :directories 600 :source-bytes 29268100
                       :tar-bytes 30624768 :gzip-bytes 11712139)
            :bootstrap (:parts 7 :files 1374 :directories 472 :source-bytes 27423847
                        :tar-bytes 28713472 :gzip-bytes 11288988))
 :source-after-before-and-extracted :exact-path-byte-sha-match
 :tar-native-full-sha-and-byte-roundtrip :exact-match
 :tar-members :canonical-regular-files-and-directories-only
 :symlinks-or-special-files nil :partial-report-content-read nil :fasl-or-content-loaded nil
 :successful-staging "spikes/out/preflight-partial-preservation-staging-R2/" :successful-staging-removed t
 :attempts
 ((:native "spikes/out/4000988352-command-26972-0/report.lisp" :status :failed
   :reason :single-gzip-exceeded-8mib :gzip-bytes 11700087)
  (:native "spikes/out/4000988495-command-30795-0/report.lisp" :status :failed
   :reason :move-helper-relative-new-path :rename-completed nil)
  (:native "spikes/out/4000988594-command-32457-0/report.lisp" :status :ok
   :reason :move-helper-absolute-path :bytes-sha-dev-ino-unchanged t))
 :failed-oversized-payload
 (:path "spikes/out/preflight-partial-preservation-staging-R1/mutation/failed-mutation-partial-unqualified.tar.gz"
  :publication-group-included nil :preserved-outside-group-for-final-worktree-backup t)
 :failed-staging "spikes/out/preflight-partial-preservation-staging-R1/" :failed-staging-preserved t
 :limits (:not-a-qualified-collector-result :gzip-parts-of-private-own-generated-tar
          :decompression-size-checked-after-write :no-general-untrusted-decompressor-qualification
          :batch-hash-input-limit-16mib :large-tar-sha-via-native-evidence-oracle
          :non-atomic-two-pass-observation))
