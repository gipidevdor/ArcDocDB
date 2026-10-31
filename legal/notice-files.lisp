;;;; Read as data with READ-EVAL NIL. These are notices, not an artifact SBOM.
(:schema-version 1 :kind :distribution-notice-files
 :files ("LICENSE" "THIRD-PARTY-NOTICES.txt"
         "data/unicode/18.0.0/LICENSE.txt" "legal/runtime/SBCL-2.6.9-COPYING.txt"
         "legal/algorithms/xxHash-v0.8.3-NOTICES.txt")
 :originals
 ((:path "LICENSE" :sha256 "cb78af11de1c5609fad7ea686ac2150d67fabdf80850bd2d379e75d2cf7e3318")
  (:path "data/unicode/18.0.0/LICENSE.txt"
   :sha256 "e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96")
  (:path "legal/runtime/SBCL-2.6.9-COPYING.txt"
   :sha256 "7e6aa753502bdfcf764c3817db3c2ede928dddab9a12cf1ccf68fe4a0c0326f4")
  (:path "legal/algorithms/xxHash-v0.8.3-NOTICES.txt"
   :sha256 "cf5bc990ac7324f65da77a76956ca63ee985029f0609e1ab780373df796fb534"))
 :runtime-reference
 (:name "SBCL" :version "2.6.9" :source-commit "68a6b27d7ec8a8be45024d5e62db4f316e5ac7ea"
  :url "https://raw.githubusercontent.com/sbcl/sbcl/68a6b27d7ec8a8be45024d5e62db4f316e5ac7ea/COPYING"
  :sha256 "7e6aa753502bdfcf764c3817db3c2ede928dddab9a12cf1ccf68fe4a0c0326f4")
 :limits (:actual-runtime-not-attested :additional-components-not-discovered
          :not-legal-approval))
