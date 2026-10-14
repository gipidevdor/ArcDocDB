(:schema-version 1 :kind :cbor-map-materialized-catalogue
 :status :awaiting-frozen-product-and-corpus
 :method-blob "636dd2706c2903542978606cf029e7198bf4dbb3"
 :semantic-catalogue-blob "89900f1bebaf66af3b3b8e19e17596d438cbf936"
 :api "scrivi-mappa-cbor-minima"
 :planned-mutant-names
 ("physical-capacity" "wrong-major" "wrong-count" "scan-omitted"
  "overlap-without-header" "item-ends-unchecked" "root-node-excluded" "extra-return-value")
 :source-files nil :corpus-files nil :targets nil
 :frozen-def-test-functions nil :cold-origin-frame nil
 :limits (:no-new-map-product-read :no-new-map-corpus-read :no-execution
          :semantic-eight-fixed :actual-unique-fragments-await-freeze
          :extra-nil-requires-public-ftype-consistent-copy-only-edit))
