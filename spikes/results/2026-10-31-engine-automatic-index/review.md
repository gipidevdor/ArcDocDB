# C1 readings and compound decisions

Two readings were performed by the implementation author. No independent reviewer
or formal whole-engine qualification is implied.

1. Structure and memory: binary fields, complete backward references, exact key
   comparison, cache tail invalidation, AVL rotations/deletion, fixed batch/path
   bounds, flat maintenance peaks and absence of retained cardinality-sized roots.
2. Publication and failure: canonical SEAL versus volatile roots, unchanged source
   witnesses, errors/nonlocal exits, both file closes, reserved-name proofs and
   live grant changes. This reading found and fixed retirement-descriptor leaks
   and an immutable factory ceiling that could retain an earlier grant.

Regression oracles are in `tests/engine/index-automatic.lisp`,
`tests/engine/index-auto-disk.lisp` and `tests/local/server.lisp`; supplemental
and argument drivers are preserved beside the original records. The field tests
independently perturb geometry, descriptor, counters and references. Forced full
hash collisions cover exact keys and length ordering. Both mode directions,
compaction, quota boundaries, postpublication errors, nonlocal exits, real process
kills and independent canonical replay are exercised. Existing GET, primary,
resolver, I/O and Unix suites preserve their legacy contracts.

The inventory below includes existing compound guards in changed entry points as
context. Each row identifies an exact Boolean expression, source and function;
positive/negative cases are assessed in the referenced test families. It is not
an automated MC/DC certificate: whole-engine coverage, concurrent progress,
Linux execution and physical-RAM-scale qualification remain separate gates.

Safety: no frame pointer escapes; referenced bytes are copied into owner scratch.
Published nodes/keys are immutable and checksummed. Complete references precede
nodes, traversal height decreases and every loop has a fixed/validated bound.
The 128-level path permits at most 384 emitted rotation nodes (49,152 bytes)
plus one at-most-65,568-byte key per mutation, below the 262,144-byte batch.
Canonical data is never removed. Private namespace ownership is an explicit
assumption of removal proofs; stat/unlink is not presented as race-free against
a noncooperating process with access to that private directory.

Linearization: M1 serial admission excludes overlapping operations. A disk root
changes after exact append; data durability still linearizes through the existing
WAL/SEAL/controller protocol. Full-source witnesses precede publication. Cleanup
owns retired sources even if the observer exits after the swap.

Liveness: bounded owner steps are not a formal whole-runtime lock-free proof.
Cache misses, writes, compaction, recovery and full GET may perform blocking I/O;
GC pauses and runtime progress are not assumed away. A suspended M1 owner halts
its Serie. No hazard-pointer/RCU claim is made for this private copying cache.

| ID | Source:line | Function | Compound expression |
|---|---|---|---|
| D001 | `src/engine/adopt.lisp:82` | `adotta-runtime-motore` | `(and (eq (motore-state engine) :recovering) (equal stamp (automatic-startup-stamp engine)) (arcdocdb.index.page::stessa-fonte-indice-p source (fonte-canonica-indice-motore engine)))` |
| D002 | `src/engine/config.lisp:11` | `verifica-configurazione-motore` | `(and (= (length archive-id) 16) (= (length series-id) 16) (member version '(1 2)) (functionp clock) (typep observer '(or null function)))` |
| D003 | `src/engine/config.lisp:12` | `verifica-configurazione-motore` | `(or null function)` |
| D004 | `src/engine/config.lisp:14` | `verifica-configurazione-motore` | `(and (typep bytes '(integer 4096 268435456)) (typep records '(integer 1 65536)) (typep segments '(integer 2 65536)) (typep frame '(integer 64 16777216)) (<= (+ frame w::+seal-total+ f:+segment-header-bytes+) bytes))` |
| D005 | `src/engine/image-source.lisp:13` | `registra-fonte-indice-motore` | `(and (plusp segment) (plusp bytes) (or (zerop (b:leggi-u64 (motore-source-token engine) 8)) (> csn (motore-source-csn engine))))` |
| D006 | `src/engine/image-source.lisp:14` | `registra-fonte-indice-motore` | `(or (zerop (b:leggi-u64 (motore-source-token engine) 8)) (> csn (motore-source-csn engine)))` |
| D007 | `src/engine/image-source.lisp:34` | `fonte-canonica-indice-motore` | `(and (zerop (p::root-indice-depth root)) (= (length directory) 1))` |
| D008 | `src/engine/image-source.lisp:69` | `sonda-indice-motore` | `(and (motore-delta engine) (null paged))` |
| D009 | `src/engine/index-auto-api.lisp:30` | `configura-budget-indice-motore` | `(and auto (typep budget '(integer 1 #.most-positive-fixnum)))` |
| D010 | `src/engine/index-auto-api.lisp:36` | `configura-budget-indice-motore` | `(and (motore-index engine) (> (+ (automatic-index-controller-fixed auto) (automatic-index-controller-resident-charge auto)) budget))` |
| D011 | `src/engine/index-auto-apply.lisp:23` | `prepare-automatic-index` | `(or (motore-busy engine) (eq (motore-state engine) :recovering))` |
| D012 | `src/engine/index-auto-apply.lisp:25` | `prepare-automatic-index` | `(and (null (automatic-index-controller-disk auto)) (not (prepare-automatic-resident engine (motore-index engine) kind key start end)))` |
| D013 | `src/engine/index-auto-apply.lisp:38` | `publish-automatic-index` | `(and (<= 1 segment #xffffffff) (<= offset #xffffffff) (<= bytes #xffffffff))` |
| D014 | `src/engine/index-auto-files.lisp:26` | `remove-automatic-orphans` | `(and (motore-automatic-index engine) (eq (motore-state engine) :recovering))` |
| D015 | `src/engine/index-auto-files.lisp:63` | `compact-automatic-disk` | `(and (eq old (automatic-index-controller-disk auto)) (= (d:disk-index-count new) (automatic-index-controller-count auto)))` |
| D016 | `src/engine/index-auto-files.lisp:66` | `compact-automatic-disk` | `(and (= source-root (d:disk-index-root old)) (= source-frontier (d:disk-index-frontier old)))` |
| D017 | `src/engine/index-auto-files.lisp:70` | `compact-automatic-disk` | `(and new (not published))` |
| D018 | `src/engine/index-auto-files.lisp:81` | `reserve-automatic-disk` | `(or (> (d:disk-index-frontier tree) (max 4194304 (* 4 (d:disk-index-live-bytes tree)))) (> (+ (d:disk-index-frontier tree) (d:disk-index-batch-limit)) maximum))` |
| D019 | `src/engine/index-auto-files.lisp:93` | `require-automatic-admission` | `(or (eq (motore-state engine) :recovering) (and (eq (motore-state engine) :ready) (motore-busy engine) (eq :healthy (s:stato-controllore-serie (motore-controller engine)))))` |
| D020 | `src/engine/index-auto-files.lisp:94` | `require-automatic-admission` | `(and (eq (motore-state engine) :ready) (motore-busy engine) (eq :healthy (s:stato-controllore-serie (motore-controller engine))))` |
| D021 | `src/engine/index-auto-memory.lisp:24` | `initialize-automatic-index` | `(and (<= 16 capacity 65536) (zerop (logand capacity (1- capacity))) (<= 1 arena #x100000000))` |
| D022 | `src/engine/index-auto-memory.lisp:104` | `apply-automatic-resident` | `(and (plusp csn) (plusp (ldb (byte 32 32) location)))` |
| D023 | `src/engine/index-auto-migrate.lisp:42` | `page-automatic-index` | `(and (= count (automatic-index-controller-count auto)) (= count (d:disk-index-count new)) (= (automatic-index-controller-key-bytes auto) (d:disk-index-key-bytes new)) (= revision (p::indice-primario-revision old)) (eq old (motore-index engine)))` |
| D024 | `src/engine/index-auto-migrate.lisp:48` | `page-automatic-index` | `(and (eq old (motore-index engine)) (= revision (p::indice-primario-revision old)))` |
| D025 | `src/engine/index-auto-migrate.lisp:55` | `page-automatic-index` | `(and new (not published))` |
| D026 | `src/engine/index-auto-migrate.lisp:75` | `return-automatic-resident` | `(and (build-automatic-resident engine candidate tree) (<= (* 4 (automatic-resident-charge candidate)) (* 3 available)))` |
| D027 | `src/engine/index-auto-migrate.lisp:80` | `return-automatic-resident` | `(and (eq tree (automatic-index-controller-disk auto)) (= source-root (d:disk-index-root tree)) (= source-frontier (d:disk-index-frontier tree)))` |
| D028 | `src/engine/index-auto-migrate.lisp:97` | `automatic-return-allowed-p` | `(and (not (null (automatic-index-controller-disk auto))) (or force (<= (* cost 4) (* 3 (automatic-index-controller-return-cost auto)))) (<= (* 4 estimate) (* 3 available)))` |
| D029 | `src/engine/index-auto-migrate.lisp:98` | `automatic-return-allowed-p` | `(or force (<= (* cost 4) (* 3 (automatic-index-controller-return-cost auto))))` |
| D030 | `src/engine/index-auto-migrate.lisp:122` | `verify-automatic-resident-copy` | `(and (eq :live (d:lookup-disk-index tree key start end output)) (= (aref words 0) (aref output 0)) (= (aref words 1) (aref output 1)) (= (aref words 3) (aref output 3)) (= (- end start) (ldb (byte 16 32) (aref output 2))))` |
| D031 | `src/engine/index-auto-resolver.lisp:54` | `read-automatic-record` | `(and active (= (ldb (byte 32 32) (aref (g::contesto-get-content context) 1)) (g::segmento-get-low (r::sorgente-get-attiva-segment (r::radice-get-attiva-source active)))))` |
| D032 | `src/engine/index-auto-types.lisp:21` | `crea-politica-indice-automatico` | `(and (typep budget '(integer 1 #.most-positive-fixnum)) (typep max-file-bytes '(integer 262272 #.(1- (ash 1 60)))))` |
| D033 | `src/engine/index-auto-types.lisp:44` | `crea-politica-indice-automatico` | `(or null r:mappa-segmento-get)` |
| D034 | `src/engine/index-auto-types.lisp:45` | `crea-politica-indice-automatico` | `(or null r:mappa-segmento-get)` |
| D035 | `src/engine/index-auto-types.lisp:46` | `crea-politica-indice-automatico` | `(or null d:disk-index)` |
| D036 | `src/engine/index.lisp:34` | `pubblica-location-motore` | `(and (<= 1 segment #xffffffff) (<= offset #xffffffff) (<= bytes #xffffffff))` |
| D037 | `src/engine/index.lisp:70` | `ricostruisci-indice-motore` | `(and (= next end) (zerop flags))` |
| D038 | `src/engine/index.lisp:73` | `ricostruisci-indice-motore` | `(and previous (<= csn previous))` |
| D039 | `src/engine/read.lisp:28` | `leggi-documento-corrente-motore` | `(and (eq status :absent) (zerop size))` |
| D040 | `src/engine/read.lisp:41` | `leggi-documento-corrente-motore` | `(and (eq status :found) (= size copied) (plusp size))` |
| D041 | `src/engine/read.lisp:78` | `leggi-documento` | `(and (motore-busy engine) (eq (motore-state engine) :ready) (eq (s:stato-controllore-serie (motore-controller engine)) :healthy))` |
| D042 | `src/engine/read.lisp:88` | `leggi-documento` | `(or complete cause)` |
| D043 | `src/engine/startup.lisp:36` | `avvia-recovery-motore` | `(or string pathname)` |
| D044 | `src/engine/startup.lisp:41` | `avvia-recovery-motore` | `(or null opzione-indice-paginato)` |
| D045 | `src/engine/startup.lisp:42` | `avvia-recovery-motore` | `(or null opzione-scoperta-indice)` |
| D046 | `src/engine/startup.lisp:48` | `apri-motore` | `(or index-image index-discovery)` |
| D047 | `src/engine/startup.lisp:55` | `apri-motore` | `(or (member index-policy '(:legacy :automatic)) (typep index-policy 'politica-indice-automatico))` |
| D048 | `src/engine/startup.lisp:57` | `apri-motore` | `(and (not (eq index-policy :legacy)) (or index-image index-discovery))` |
| D049 | `src/engine/startup.lisp:57` | `apri-motore` | `(or index-image index-discovery)` |
| D050 | `src/engine/startup.lisp:59` | `apri-motore` | `(and create index-image)` |
| D051 | `src/engine/startup.lisp:60` | `apri-motore` | `(and create index-discovery)` |
| D052 | `src/engine/startup.lisp:61` | `apri-motore` | `(and index-image index-discovery)` |
| D053 | `src/engine/startup.lisp:62` | `apri-motore` | `(or null function)` |
| D054 | `src/engine/write.lisp:41` | `commetti-record-motore` | `(and (eq (w:stato-lotto batch) :open) (zerop (w:lunghezza-lotto batch)) (eq (w:stato-csn-lotto batch) :libero) (eq (w:stato-gruppo group) :building))` |
| D055 | `src/engine/write.lisp:74` | `commetti-record-motore` | `(and (= high published-high) (= low published-low))` |
| D056 | `src/engine/write.lisp:105` | `scrivi-record-motore` | `(and (motore-busy engine) (eq (motore-state engine) :ready) (eq (s:stato-controllore-serie (motore-controller engine)) :healthy))` |
| D057 | `src/engine/write.lisp:118` | `scrivi-record-motore` | `(or complete cause)` |
| D058 | `src/get/build.lisp:7` | `<configuration>` | `(or null indice-primario)` |
| D059 | `src/get/build.lisp:7` | `<configuration>` | `(or null cache-serie)` |
| D060 | `src/get/build.lisp:8` | `<configuration>` | `(or null function)` |
| D061 | `src/get/build.lisp:18` | `crea-vista-get-serie` | `(or primary lookup)` |
| D062 | `src/get/build.lisp:29` | `crea-contesto-get` | `(and (<= 1 record-bytes +max-record-bytes+) (<= 0 budget-payload most-positive-fixnum))` |
| D063 | `src/get/build.lisp:47` | `crea-segmento-get` | `(and (plusp segment-id) (eq (mode-file file) :input) (eq (stato-file file) :open))` |
| D064 | `src/get/build.lisp:57` | `crea-segmento-get` | `(and (= next +segment-header-bytes+) (< created-offset next))` |
| D065 | `src/get-resolver/read.lisp:32` | `verifica-parole-resolver` | `(and (= (aref rows (+ base +row-size+)) (ldb (byte 32 0) (aref content 3))) (zerop (ldb (byte 32 32) (aref content 3))))` |
| D066 | `src/get-resolver/read.lisp:35` | `verifica-parole-resolver` | `(and (= (aref rows (+ base +row-csn-low+)) (ldb (byte 32 0) (aref content 0))) (= (aref rows (+ base +row-csn-high+)) (ldb (byte 32 32) (aref content 0))))` |
| D067 | `src/get-resolver/read.lisp:42` | `verifica-parole-resolver` | `(or null u32)` |
| D068 | `src/get-resolver/read.lisp:50` | `verifica-riga-resolver` | `(and (typep flags 'u8) (zerop (logand flags (logxor 255 (allowed-flags +put+)))))` |
| D069 | `src/get-resolver/read.lisp:64` | `verifica-riga-resolver` | `(or null u32)` |
| D070 | `src/get-resolver/read.lisp:78` | `risolvi-candidato-get` | `(and (zerop (segmento-get-high segment)) (= (segmento-get-low segment) (ldb (byte 32 32) location)))` |
| D071 | `src/get-resolver/read.lisp:81` | `risolvi-candidato-get` | `(and (eq (mode-file (segmento-get-file segment)) :input) (eq (stato-file (segmento-get-file segment)) :open))` |
| D072 | `src/index-disk/api.lisp:40` | `lookup-disk-index` | `(or (eq key (disk-index-key tree)) (eq key (disk-index-frames tree)))` |
| D073 | `src/index-disk/api.lisp:57` | `apply-disk-index` | `(and (<= 1 (- end start) 65535) (plusp csn) (plusp (ldb (byte 32 32) location)))` |
| D074 | `src/index-disk/build.lisp:10` | `initialize-disk-header` | `(and (= (length header) 128) (= (length archive) 16) (= (length series) 16))` |
| D075 | `src/index-disk/build.lisp:12` | `initialize-disk-header` | `(and (<= 1 id (1- (ash 1 60))) (member size '(4096 16384 65536)))` |
| D076 | `src/index-disk/build.lisp:48` | `create-disk-index` | `(and (typep max-bytes '(integer 262272 #.(1- (ash 1 60)))) (typep memory-budget '(integer 0 #.(1- (ash 1 60)))))` |
| D077 | `src/index-disk/cache.lisp:20` | `cached-page` | `(and (plusp (aref tags (disk-index-cursor tree))) (< (disk-index-cache-evictions tree) most-positive-fixnum))` |
| D078 | `src/index-disk/cache.lisp:37` | `copy-disk-bytes` | `(and (disk-index-busy tree) (<= 128 offset) (<= (+ offset count) (max (disk-index-frontier tree) (+ (disk-index-batch-base tree) (disk-index-used tree)))))` |
| D079 | `src/index-disk/cache.lisp:41` | `copy-disk-bytes` | `(and (< offset (disk-index-frontier tree)) (> (+ offset count) (disk-index-frontier tree)))` |
| D080 | `src/index-disk/copy.lisp:31` | `copy-disk-index` | `(and (not (eq source target)) (= (disk-index-seed-high source) (disk-index-seed-high target)) (= (disk-index-seed-low source) (disk-index-seed-low target)))` |
| D081 | `src/index-disk/copy.lisp:34` | `copy-disk-index` | `(and (zerop (disk-index-root target)) (= 128 (disk-index-frontier target)))` |
| D082 | `src/index-disk/copy.lisp:42` | `copy-disk-index` | `(and (= (disk-index-count source) (disk-index-count target)) (= (disk-index-key-bytes source) (disk-index-key-bytes target)))` |
| D083 | `src/index-disk/copy.lisp:62` | `verify-disk-copy` | `(and (eq :live (lookup-disk-index target key start end output)) (equalp words output))` |
| D084 | `src/index-disk/mutate.lisp:32` | `mutate-disk-subtree` | `(and (zerop comparison) (<= csn (b:leggi-u64 work (+ at +node-csn+))))` |
| D085 | `src/index-disk/read.lisp:11` | `validate-disk-node-fields` | `(and (<= 1 (b:leggi-u32 target (+ at +node-height+)) +height-limit+) (<= 1 length 65535) (plusp (b:leggi-u64 target (+ at +node-csn+))) (plusp (b:leggi-u32 target (+ at +node-segment+))))` |
| D086 | `src/index-disk/read.lisp:14` | `validate-disk-node-fields` | `(and (<= (+ arcdocdb.record:+header-bytes+ length 1) (b:leggi-u32 target (+ at +node-record-bytes+)) arcdocdb.record:+max-record-bytes+) (<= 1 (b:leggi-u64 target (+ at +node-count+)) (1- (ash 1 60))) (<= length (b:leggi-u64 target (+ at +node-key-bytes+)) (1- (ash 1 60))) (zerop (b:leggi-u32 target (+ at +node-reserved+))))` |
| D087 | `src/index-disk/read.lisp:29` | `validate-disk-node-links` | `(and (<= 128 key) (<= (+ key +key-header+ (* 8 (ceiling length 8))) offset) (zerop (mod key 8)))` |
| D088 | `src/index-disk/read.lisp:33` | `validate-disk-node-links` | `(or (zerop child) (and (<= 128 child) (<= (+ child +node-size+) offset) (zerop (mod child 8))))` |
| D089 | `src/index-disk/read.lisp:33` | `validate-disk-node-links` | `(and (<= 128 child) (<= (+ child +node-size+) offset) (zerop (mod child 8)))` |
| D090 | `src/index-disk/read.lisp:42` | `read-disk-node` | `(and (>= offset 128) (zerop (mod offset 8)))` |
| D091 | `src/index-disk/read.lisp:45` | `read-disk-node` | `(and (= (b:leggi-u32 target at) +node-magic+) (= (b:leggi-u64 target (+ at +node-self+)) offset) (= (b:leggi-u64 target (+ at +node-generation+)) (disk-index-id tree)) (= (b:leggi-u32 target (+ at +node-crc+)) (b:crc32c target at (+ at +node-crc+))))` |
| D092 | `src/index-disk/read.lisp:61` | `read-external-disk-key` | `(and (= (b:leggi-u32 header +key-magic-offset+) +key-magic+) (= (b:leggi-u32 header +key-length+) length) (= (b:leggi-u64 header +key-self+) ref) (= (b:leggi-u64 header +key-generation+) (disk-index-id tree)) (zerop (b:leggi-u32 header +key-reserved+)))` |
| D093 | `src/index-disk/types.lisp:117` | `disk-index-charge` | `(and (member size '(4096 16384 65536)) (typep frames '(integer 1 4096)))` |
| D094 | `src/index-disk/types.lisp:131` | `require-disk-index` | `(and (eq (disk-index-state tree) :open) (not (disk-index-busy tree)))` |
| D095 | `src/index-disk/types.lisp:139` | `require-disk-index` | `(or null condition)` |
| D096 | `src/index-disk/types.lisp:144` | `require-disk-index` | `(or null io:file-io)` |
| D097 | `src/index-disk/types.lisp:144` | `require-disk-index` | `(or null io:file-io)` |
| D098 | `src/index-disk/types.lisp:144` | `require-disk-index` | `(or null condition)` |
| D099 | `src/index-disk/visit.lisp:15` | `visit-disk-node` | `(and (= high actual-high) (= low actual-low))` |
| D100 | `src/index-disk/visit.lisp:36` | `verify-disk-statistics` | `(and (<= (abs (- lh rh)) 1) (= (b:leggi-u32 work (+ at +node-height+)) (1+ (max lh rh))))` |
| D101 | `src/index-disk/visit.lisp:38` | `verify-disk-statistics` | `(and (= (b:leggi-u64 work (+ at +node-count+)) (+ 1 lc rc)) (= (b:leggi-u64 work (+ at +node-key-bytes+)) (+ (b:leggi-u32 work (+ at +node-key-length+)) lb rb)))` |
| D102 | `src/index-disk/visit.lisp:71` | `visit-disk-index` | `(and (= root (disk-index-root tree)) (= frontier (disk-index-frontier tree)))` |
| D103 | `src/index-disk/visit.lisp:74` | `visit-disk-index` | `(and (= height (disk-index-height tree)) (= count (disk-index-count tree)) (= bytes (disk-index-key-bytes tree)))` |
| D104 | `src/index-disk/write.lisp:10` | `allocate-disk-batch` | `(and (disk-index-busy tree) (plusp bytes) (zerop (mod bytes 8)))` |
| D105 | `src/index-disk/write.lisp:58` | `emit-disk-node` | `(and (<= height +height-limit+) (< count (ash 1 60)) (< bytes (ash 1 60)))` |
| D106 | `src/index-disk/write.lisp:74` | `initialize-disk-leaf` | `(and (plusp csn) (plusp (ldb (byte 32 32) location)))` |
| D107 | `src/io/derived-remove.lisp:20` | `nome-derivato-automatico-p` | `(and (= (length name) 30) (string= name "autoindex-" :end1 10) (string= name ".tmp" :start1 26) (loop for i from 10 below 26 always (find (char name i) "0123456789abcdef")))` |
| D108 | `src/io/derived-remove.lisp:30` | `prova-derivato-rimovibile` | `(and (nome-derivato-automatico-p name) (eq (file-backend file) (file-backend directory)))` |
| D109 | `src/io/derived-remove.lisp:33` | `prova-derivato-rimovibile` | `(and backend (null (backend-unlink-relative backend)))` |
| D110 | `src/io/derived-remove.lisp:41` | `prova-derivato-rimovibile` | `(or darwin linux)` |
| D111 | `src/io/derived-remove.lisp:60` | `rimuovi-derivato` | `(or darwin linux)` |
| D112 | `src/io/derived-remove.lisp:61` | `rimuovi-derivato` | `(or darwin linux)` |
| D113 | `src/io/derived-remove.lisp:62` | `rimuovi-derivato` | `(and (null backend) (eql result -1))` |
