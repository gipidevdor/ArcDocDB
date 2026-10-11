(:schema-version 1 :kind :benchmark-selection :status :preregistered
 :commit "344e8fb" :selection-before-performance-clock t
 :base-count 100000 :replicas 5 :warmup 256 :workers (1 2 4)
 :lengths (0 1 7 8 16 31 32 33 64 256 1024 65535)
 :seed-cases (:zero :max)
 :iterations-divisors ((:up-to-64 1) (256 4) (1024 16) (65535 1024))
 :rationale "Massimo preregistrato per ridurre il rumore del timer senza adattamento ai risultati."
 :limits (:external-host-load-uncontrolled :primitive-only :no-p99 :no-engine-qualification))
