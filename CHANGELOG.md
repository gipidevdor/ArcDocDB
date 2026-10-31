# Changelog

Format based on [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). The project
has no product releases yet; versions will follow the [roadmap](docs/roadmap.md).

<a id="non-rilasciato"></a>

## [Unreleased]

- [Automatic primary storage in M1](docs/implementazione/indice-automatico-operativo.md):
  flat resident growth while the quota permits it, bounded disk writes/replay,
  verified migration both ways, hysteresis, live-only compaction and fixed CLOSED
  resolver caching. Canonical WAL/SEAL is unchanged. The serial profile retains
  no full resident index while paged; concurrent progress and physical-RAM scale
  remain separate qualification gates (ADR-0073).

<a id="aggiunto"></a>

### Added

- [Automatic M1 delta renewal](docs/implementazione/rinnovo-automatico-m1.md)
  before PUT/DELETE: threshold and next-key capacity, finite image sequence,
  full reservation before effects, and one BUSY scope through commit (ADR-0072).

- [Self-contained M1 location delta](docs/implementazione/delta-location-m1.md):
  committed location/tombstone lookup without resident access, complete old/new
  array reservations, and publication fault injection (ADR-0071).

- [Read-only discovery of M1 images](docs/implementazione/scoperta-indice-m1.md)
  at startup: bounded inventory/candidates, canonical-source filtering,
  deterministic priority, and mandatory full verification (ADR-0070).

- [Threshold-based M1 delta maintenance](docs/implementazione/manutenzione-indice-m1.md):
  immutable key/byte policy, read-only probe, and verified renewal only
  when needed; quotas preserved and no-op without I/O (ADR-0069).

- [Serial M1 image renewal](docs/implementazione/rinnovo-indice-m1.md):
  construction, verification, and activation under continuous BUSY, total quota before
  creation, and empty delta for new writes (ADR-0068).

- Optional [serial M1 delta](docs/implementazione/delta-indice-m1.md): PUT/DELETE
  retain image; exact preallocated membership, quotas before CSN/WAL,
  and reads of touched keys from canonical resident (ADR-0067).

- Hot activation of M1 primary images ([ADR-0066](docs/adr/0066-attivazione-seriale-immagini-m1.md)):
  full verification before private swap, quota including old cache,
  previous file closure, and retirement before any WAL effect.
  [Contract and limits](docs/implementazione/attivazione-indice-m1.md).

- Paged image production from M1 engine ([ADR-0065](docs/adr/0065-costruzione-immagini-dal-motore.md)):
  canonical slot snapshot without global key copy, adaptive radix,
  seal, and read-only verification before success; local files closed on every exit.
  [Contract and limits](docs/implementazione/costruzione-indice-m1.md).

- Serial paged-index integration with M1 engine ([ADR-0064](docs/adr/0064-adozione-indice-paginato-m1.md)):
  source from canonical replay, read-only verification of selected candidate before READY,
  GET on derivative, and retirement before first admitted write. Resident and durable catalog
  remain distinct; [contract and limits](docs/implementazione/indice-paginato-m1.md).

- Sealed ARCIRF01 primary images ([ADR-0063](docs/adr/0063-immagini-sigillate-indice-primario.md)):
  canonical source, read-only verification of all entries, and serial root adoption;
  duplicates/unreachable entries rejected, cumulative budget, and SIGKILL tests.
  [Contract and limits](docs/implementazione/immagini-indice-paginato.md).

- Incremental index page construction: external keys from tail,
  flat buckets and directory with verified routing; whole-batch preflight,
  exact append, and fail-stop without offset reuse.
  [Contract and limits](docs/implementazione/costruzione-indice-paginato.md).

- Serial paged index reader: multilevel radix directory, flat
  buckets, overflow, and complete external-key comparison; cumulative budgets
  and candidates compatible with resident primary.
  [Contract](docs/implementazione/lettura-indice-paginato.md).

- First integration between index page codec and read-only I/O: serial cache
  with fixed frames, private copies, FIFO, and full verification before copy.
  [Contract and limits](docs/implementazione/cache-pagine.md). Paged backend
  and its engine adoption remain to be integrated.

<a id="verificato"></a>

### Verified

- Git history reduced to last two commits at author's request
  ([ADR-0062](docs/adr/0062-cronologia-git-due-commit.md)). First commit tree
  retained in full, second commit code unchanged; evidence links
  updated for new hashes. Previous history retained
  in an external bundle verified before lease-protected push.
- Retention: verified external snapshot of 52,277 historical files, with
  SHA-256 inventory and rereading from GitHub. Checkout retains references
  to eight relevant recent campaigns and three latest CI publications;
  previous citations anchored to original contents. Initial migration
  without Git rewrite; subsequent history reduction described above.
- CI: lossless compression of raw data over 4 KiB, retaining existing aggregate
  budgets and verifying byte recovery in boundary tests.
- CRC32C: preregistered 16/32 B comparison, measurements at 64/256 B, vector
  `123456789`, fallback, and complete GET. 16 B kernel retained:
  0.739 µs per 4112 B body; 4 KiB hot GET 9.813 µs with oracle
  and 1.647 µs in throughput driver. [Results and limits](docs/implementazione/crc32c-unroll32.md).

<a id="corretto"></a>

### Fixed

- CRC32C: common bootstrap and conditional ASDF components isolate VOP and
  ARM dependencies on other platforms/versions, even with cached FASLs.
  Fallback forceable at startup; OS/compiler/kernel decisions tested
  ([ADR-0060](docs/adr/0060-crc32c-caricamento-portabile.md)).

- M1: capacity, arena, slot credit, and index revision checked before
  CSN and durable append. Ordinary rejection leaves READY and files unchanged;
  an invariant found during preflight closes admission and retains cause.
  Reopening with same budgets, v1/v2, and two oracles against previous
  writer. Explicit Engine presence in CI catalog; integration with
  Unix session and page codec brings catalog to 57 suites.

- C4 PR publisher: GitHub-signed synthetic merge bound to run head
  and inventories equivalent to PR-associated merge. Original SHA,
  anchor, and method retained; PR producer remains untrusted. First
  reconciler receipt saved even when `runs/` directory is absent.

- CI result reading in isolated coverage process: complete trusted
  vocabulary for SKIPPED, METRICS-STATUS, and EXECUTION, without depending
  on product loading. Regressions in new processes and unknown-token
  rejection; incomplete collections still return errors.
  Coverage summary within budget: file count in compact
  result, full inventory in verified original attachments.
  Missing count distinct from measured empty inventory.

- Concurrent CBOR string-reading fixture: WALL duration and overlap
  may be zero when a wave falls within the same tick. Rendezvous,
  exact results, counts, immutability, and wait bounds preserved;
  no artificial wait or decoder change.

<a id="aggiunto-1"></a>

### Added

- ARM64 CRC32C written in Lisp/SBCL, with checked loads at safety 3,
  startup CPU detection, and slicing-by-8 fallback. 4 KiB GET cache hit
  measured at 1.68 microseconds, with independent oracle outside timing;
  original integrity path, formats, and commit semantics unchanged.

- C4 GET diagnostics: CRC, PUT verification, copies, and oracle measured separately;
  real index lookup up to 4.19 million keys, hot/uniform comparison,
  hash, budgets, and RSS distinct. Preregistered method, five replicates, and stable
  sources; no product-path or concurrency changes.

- C1 codec for derived primary index pages: 4/16/64 KiB,
  identity and CRC32C, flat buckets, radix directory, and external keys up to
  65535 bytes. Preflight before writes, independent fixtures, and
  structural corruption with valid CRCs; backend and migration remain open.

- First automatic index selector per Serie: resident if capacity permits,
  hysteretic return and migration peak preflight. ADR-0057, threshold tests,
  and C4 lifetime model with hazards and negative controls.
  Paged backend, migration, and runtime binding remain open.

- M1 Single-Series Durable Core: production entry point for startup, automatic
  recovery, and admission, reusing existing preparers, gates, publisher, runtime,
  and GET. Physical parent exclusion, one serial actor, strong PUT/GET and
  tombstones; dedicated campaign of two SIGKILLs. New features suspended
  in M1 work; Production Engine Bootstrap milestone open.
  [Evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-production-engine-bootstrap/report.md):
  2164/2164 cases, 15 engine tests, 80 primary tests, dedicated campaigns, and failed
  originals retained losslessly. Subsequent
  [M1 Unix qualification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-production-unix-m1/report.md)
  adds local profile; complete gate remains open.

- Whole-Archivio name completion: global capacity, metadata, and canonical
  gate reconfirmed before all name preflights; per-Serie
  effects and complete counts. Original cause and previous completions
  retained; functional qualification and complete Recovery Manager remain open.

- Whole recovered Serie name completion: complete preflight
  of tokens and all names before effects, then exclusive rename and
  fsync per source. Complete counts only, no new array/hash, rollback,
  or state shared between Serie; functional qualification and Recovery Manager open.

- Recovered name stabilization bound to exclusive
  publication: no target replacement, callback required only for temporary
  branch, and parent fsync retained in already-final branch. Functional
  qualification and complete Recovery Manager coordination remain open.

- Exclusive publication of an already decided temporary: relative rename
  without target replacement, name/FD identity before and after, injectable
  backend, and common fail-stop. Compilation and static checks distinct
  from functional qualification and Recovery Manager integration.

- C4 SPK-11 variant with direct recv/send on owned buffers: offsets,
  injectable backend, short I/O, waits without internal retry, and deadlines.
  Comparison of previous and native transport, saturation, and partial EOF;
  Lisp observations separate from native allocator and pool qualification.

- Synchronous visit of recovered CLOSED records: same read-only FD,
  prefix and OUTCOME/EDIT resolution verified before delivery,
  committed PUT/TOMBSTONE, and count of aborted prepared records.
  Canonical workspace reused without exposing it in public reader API;
  ACTIVE replay, grouping, publication, and dedicated qualification open.

- SPK-08 comparison of scalar, SWAR with packing, and SIMD on same bytes and variable
  queries, with bounds checks and independent oracle. Systematic
  assessment of safe SIMD on Linux x86-64 and macOS ARM64 targets,
  selection of available features, and mandatory scalar fallback;
  product integration and multiplatform qualification remain open.

- Recovered key materialization in private primary: PUT
  inserted or identical, TOMBSTONE/NONE as verified absence; no
  overwrite or removal of a different entry. Canonical writer budgets,
  reused scratch, and rejection of unrepresentable locations. Dedicated
  qualification, complete replay, and root publication still open.

- Exclusive `.tmp` creation relative to owned directory: new
  empty regular file, verified identity, append, and child-only cleanup.
  Connected to vertical test outputs; no implicit unlink, flush, or rename.

- Reusable per-key recovered version selector (ADR-0042):
  maximum CSN, same-segment offset tie-break, and provisional
  tombstone. Full CRCs, explicit prepared CSN, and blocking ambiguity;
  no per-candidate array. Dedicated qualification and index publication open.

- Name stabilization of a recovered source: exact ACTIVE/CLOSED token,
  FD, and ID before completion, collisions preserved, and parent
  fsync even in already-final branch. No reopening for writes;
  complete orchestration and dedicated functional qualification still open.

- Private full-text row directory: binary search under lease from posting
  to PUT reference, absent/preparing/sealed states distinct, and u32 keys
  without sentinels. Pre-append cancellation, protected reuse, and transferred entries
  retained; published delta map, MVCC, and reclaim still open.

- Full-text PUT physical references: preallocated capture from sealed batch
  with authoritative WAL token, header checked without body scans, and stable
  position after buffer reuse. Ordinary CSNs and prepared TXIDs remain distinct;
  no early publication or 2PC resolution.

- C4 SPK-11 extension to proposed local session: HELLO/WELCOME,
  negotiation, correlated PINGs, and reversed responses between two processes.
  Fixtures for duplicate maps, limits before body, u64 IDs, retained
  credit, and absolute deadlines; simulated gate and M16 integration still open.

- Full-text binding to exact PUT bytes: private frame for all generations,
  collective reservation, and WAL batch append after preflights. v1/v2 formats,
  ordinary/prepared, references protected from batch reuse, and fail-stop after
  incomplete transfer. CRC/spans attested in worker, constant checks, and
  body copy only under writer lease. Durable publication, 2PC outcomes, MVCC, and retirement open.

- Coordinated Archivio read: all Serie preflights and aggregate
  budgets before data; reused scratch and complete CSN plan only after
  canonical readers. Explicit byte budget, no binding or partial result;
  dedicated functional qualification still open.

- Whole-Serie semantic recovery from owned read-only sources:
  full preflight and cumulative budget before data, ACTIVE with canonical decision
  replay, all CLOSED with reused scratch, and final gate.
  No partial publication or implicit FD management; dedicated qualification open.

- Proposed M16 session contract (ADR-0056) and SPK-11 on Unix sockets:
  two real processes, partial/coalesced frames, maximum document and key,
  rejections before allocation, and occupied names preserved. Product
  listener remains subject to engine startup, recovery, and admission.

- Owned read-only acquisition of all ACTIVE/CLOSED segments from a single
  directory inventory, cumulative EOF budget, and full cleanup even
  with multiple close errors. Connected to vertical fixture; physical
  reconciliation and admission remain to be implemented.

- Cache tests with four workers inserting and reading concurrent
  records in the same set, plus deterministic cases for contention,
  odd sequence, exhausted credit, and disabled slots. Full comparison
  with independent v1/v2 records; C1 qualification still open.

- Local full-text reservations under writer lease: budgets of all generations
  checked before effects, resumable copying into owned runs, and tasks protected
  from reuse. Pre-append cancellation and transfer with retained costs;
  PUT/WAL bridge added in next increment; publication and retirement open.

- Recovered CLOSED map adoption into runtime scope: complete set,
  authority, and exact FDs checked, new wrappers, and shared immutable rows.
  Budgets before allocation; no segment rereads or primary
  publication. Functional qualification and admission remain open.

- Full-text preparation directly from CBOR documents: nested paths,
  selected types and duplicates checked, resumable analysis, and sealed run.
  Cumulative budgets and upper file-size bound before future writer binding;
  NNTP fixtures, independent scan, and cancellation at different stages.

- Priority local interface for first NNTP use (ADR-0055): default Unix
  stream socket between daemon and database, later optional TCP
  disabled by default. First M16 integration moved forward after startup,
  recovery, and admission; requirements, bounds, lifecycle, and tests traced.
  Design decision; listener and client remain to be implemented.

- Complete full-text `.idx` v2/type 5 codec: copied canonical META descriptor,
  binding to hint bytes and supplied PUT map, serialization without per-entry allocations,
  term/posting/position verification, and immutable view for all/any/phrases on file.
  Independent wire fixture, fuzz with correct CRC, and reopening in SBCL child on NNTP
  subject/body fields. I/O and durable generation publication remain to be integrated.

- First full-text core: resumable Unicode 18.0.0 analyzer with versioned data and licenses,
  in-memory positional inverted runs and all/any/phrase search per row/field,
  `.idx` v2/type 5 frame with CRC and preflight. Official corpora, independent scan,
  saturation, concurrency, allocations, and negative controls in `make check`.
  Complete persistence, writer, snapshots, and Query Engine remain to be integrated.

- Prepared ACTIVE adoption into Archivio runtime with exact scope and
  common CSN registry. Unique controller binding on canonical log,
  recoverable after interruption without reset or new per-operation cost.

- Runtime bootstrap from complete Archivio CSN plan: single
  CSN/snapshot/epoch family and new GET scope, atomic publication without reset
  and binding recovery after interruption. No new I/O or lock on
  Serie paths; traffic gate and C1 qualification still open.

- Evidence catalog verification with up to four isolated processes,
  configurable heap and time per catalog, errors reduced in serial order,
  and retained worker logs. Serial path available for comparison.

- Dedicated Archivio CSN plan suite: complete Serie set,
  Registri, replay provenance, CLOSED gate, and u64 base without increment.
  v1/v2 matrices, native chain, and test binding to existing registry;
  results and limits separate from C1 qualification and traffic admission.

- Recovery ID selection directly from owned directory: one
  attested enumeration, five budgets retained, shared selection from
  canonical plan, and no reservation. Vertical test uses canonical names
  and this product entry point instead of test-built inventory.

- Dedicated CLOSED recovery suite: reads up to CONTROL P,
  OUTCOME/EDIT resolution, writer/compaction origins, maximum CSN, and set
  gate. Independent oracles, v1/v2 matrix, and native publication;
  coverage and results retained separately from full C1 qualification.

- Archivio CSN plan: owned Serie list including Registri,
  unique UUIDs, same decision authority, and CLOSED gate for every Serie.
  Complete maximum relative to supplied canonical list and base words
  without increment; lightweight replay marker in ACTIVE result.
  No new I/O or allocator; persistent catalog, admission, and dedicated
  qualification remain to be connected.

- Direct CBOR MT2/3 string reading: type and absolute payload
  range without copies, UTF-8 checked for text, ignored tail,
  and full-window budget. Buffer shareable read-only;
  dedicated C1 qualification still open.

- Proposed new segment ID after recovery, above manifest high-water
  and every inventory name, including orphan temporaries. Owned
  plan, u64 bounds, and explicit budgets; connected to vertical test.
  No reservation, file change, or traffic admission.

- Full-text design completion (ADR-0054): Unicode 18.0.0 profile,
  query leaves, module contracts, generations and retirement, reservations before
  commit, and admission defaults. `.idx` v2/type 5 format defined with
  six sections and hint binding; four new requirements and two invariants.
  Corpus and acceptance criteria remain to be implemented in phase 8;
  no full-text code introduced.

- Maximum CSN observed by ACTIVE/CLOSED readers and decision log, with
  aggregation of all segments of the same Serie after canonical gate.
  Zero and absence distinct; writer SEAL, OUTCOME, and EDIT outcome CSNs included,
  TXIDs and invalid tails excluded. No CSN assignment or traffic
  admission; functional qualification, fault injection, and performance still open.

- Full-text documentation aligned across v1 scope, contract/catalog,
  query interfaces, roadmap, glossary, evaluation, costs, risks, and verification
  plan. ADR-0053 remains reference decision; implementation,
  binary format, and qualification remain in phase 8.

- Write resumption in v1/v2 vertical test: CSN base reconstruction,
  new consistent environment, four commits, and second SIGKILL with
  independent recovery. Negative CSN-reuse oracle before append;
  coordination still C4, development priorities updated in roadmap.

- Full-text search in v1 design (ADR-0053): dedicated inverted indexes
  per segment, words and phrases, versioned analyzers, structured filters, and
  commit/snapshot consistency. Rebuild, corruption, budgets, and NNTP case
  documented; four designed requirements and INV-I4. Implementation and qualification
  planned in phase 8, no full-text code introduced.

- Application objective confirmed: ArcDocDB as database for a future
  Common Lisp NNTP server. Article lookup, ordered overviews,
  cross-posting, retention, integration, and evaluation criteria documented;
  engine remains general-purpose, with future NNTP development.

- Vertical Serie test in v1/v2 formats: durable writes,
  updates, tombstones, and GET, real SIGKILL, recovery and checkpoint in
  a new process, second independent reopening. Includes tail without
  SEAL, unpublished checkpoint, rotation with new commits, original
  segment comparison, and negative oracle control. Coordination
  and index replay are C4; no whole-engine promotion.

- Bounded pool/Serie slice preparation: selection and one begin
  on current link, without second routing. Seven values retain original token,
  state, reason, and metadata; publication without second claim,
  CLOSING, and faults remain explicit to caller.

- Reusable evidence collection tool: explicit manifest, copies with
  four workers, completed records including failures, and independent
  closed-inventory check before positive outcome.

- Read-only CLOSED recovery from authoritative CONTROL: reads only up to P,
  checks writer/compaction and prepared resolved by OUTCOME or EDIT closure,
  without global decision log. Complete-set check before canonical
  publisher, u64 IDs without truncation; dedicated C1 qualification open.

- Dedicated Archivio decision log verification: preflight, identity,
  queries, ownership, and ACTIVE recovery binding, with native chain
  through CONTROL publication in v1/v2 formats. Separate module
  coverage and every attempt recorded in dedicated campaign.

- Integrated pool/dispatcher/Serie verification with two real workers: 32 quanta
  on one Serie while the other holds lease or batch debt, plus retirement with
  full/available ring and transfer of remaining work to another worker.
  Six synchronized scenarios; no speedup measurement or protocol change.

- Independent native checkpoint suite from old ACTIVE: v1/v2 files,
  OUTCOME/DECISION resolution, prefix and tail, budgets, CLOSED closure,
  and control log publisher binding with independent oracles.

- First minimal CBOR item reading with absolute frontier: unread
  tail, authorized-window budget, and private per-worker scratch.
  Allows deriving boundaries of concatenated items; C1 qualification
  and document profile remain open.

- Checkpoint builder from ACTIVE recovery: derives complete state
  from authoritative CONTROL, retains CLOSED/REMOVED/outcomes, closes old
  ACTIVE at P, and connects new verified ID. Budgets before arrays and
  in-memory transition verification; canonical preparer and publisher
  unchanged, dedicated C1 qualification open.

- Dedicated ACTIVE recovery tests: read-only reads, prepared
  resolution, deterministic closure, and publication on real v1/v2 files.
  Independent oracles, fault injection, coverage, and separate measurements
  retained in campaign `2026-10-15-active-verifica`.

- Bounded pool/Serie dispatcher step: selects one operation from
  new IDLE claim, CLAIMED binding, and RESCHEDULE recycling.
  Explicit origin distinguishes cursor, count, and absence of transfer;
  existing obligations do not consult pool. No implicit second claim,
  begin, or retry; active phases and first cause remain retained.

- Read-only `Registri/multiserie.log` reading: UUID/CRC/format header
  checked before body, complete replay through attested EOF, and
  owned decisions. New ACTIVE entry point bound to same canonical
  Archivio scope; formats unchanged, dedicated C1 qualification open.

- Rendezvous in remaining concurrent CBOR, UTF-8, and two-Serie fixtures:
  checkpoint after first actual work, retaining counts, sinks, and
  oracles. Diagnostics before timing assertions; fixture WALL intervals,
  including waits and checks.

- Integrated GET source lifetime verification: readers on real CLOSED FDs,
  ACTIVE publication with superset and controlled reduction, EBR retirement, and
  closure after quiescence. Includes typed error and nonlocal exit;
  durable catalog decision and complete rotation remain to be integrated.

- Rendezvous after first actually encoded item in concurrent
  CBOR float/tag tests, imposing interleaving without depending on scheduler
  startup. Intervals and checkpoints printed before assertions; fixture
  metrics distinct from encoder-only latency.

- Dedicated CONTROL reading, conservative transition, and validated
  publication tests: 84 new v1/v2 tests, finite matrix, and real files
  with four Serie. Coverage, 216 comparison windows, failed-attempt
  sources, and original outputs retained in campaign
  `2026-10-14-control-transizione`; no whole-engine promotion.

- CBOR tag composition from preencoded contents: full verification
  before writing, minimal MT6 header, and budgets including tag
  without adding container depth. Sources shareable for
  reads with private scratch; application semantics and C1 qualification open.

- Read-only recovery of old ACTIVE named by control log: header
  and prefix verified through EOF, prepared resolved by OUTCOME/DECISION,
  outcomes derived into sorted u64 arrays, and CLOSED closure serializer.
  Publication checks P and outcomes before unique publisher; no
  truncation, format change, or new CSN. C1 qualification and Recovery
  Manager gate remain open.

- Explicit start of already acquired pool obligation: current writer
  selection and one bridge begin, returning link and three
  original results. Writer-busy retains CLAIMED; Serie-busy retains
  token and explicit closure. No new gate, retry, or implicit cleanup.

- Dedicated GET ACTIVE preflight rejection cases before CSN: identity,
  OPEN/SEALED state, order, capacity, and header faults, with independent
  witnesses of bytes, tokens, roots, frontiers, and absence of I/O.
  ACTIVE suite at 42 tests and four preflight mutants detected; coverage,
  bootstrap regression, and independent full-test audits retained.

- CBOR map composition from preencoded keys and values: full
  verification before writing, pair-based MT5 header, and budgets
  including root. Sources shareable for reads with private
  scratch; key ordering and C1 qualification remain open.

- Explicit recycling from dispatcher to Serie: publishes obligation and ends
  IDLE if room; on full ring returns new CLAIMED writer's link
  after one FIFO swap. No implicit pool gate, retirement, or new
  claim; busy and faults retain existing execution boundaries.

- Read-only reading of authoritative control log, with verified header and replay
  through attested EOF. Buffer-free result bound to canonical view;
  publication subject to retaining CLOSED, outcomes, and REMOVED,
  closing old ACTIVE, and opening a new ID. No format
  or ADR change; full recovery and C1 qualification remain open.

- CBOR array composition from preencoded items: full verification
  before writing, minimal header, and budgets including root.
  Source and index shareable for reads, destination and scratch private
  per worker. Document profile and C1 qualification remain open.

- Logical dispatcher from pool to Serie binding: preallocated binding
  on same context, routing only after authorized claim, and separate entry
  point to complete already CLAIMED obligations. No implicit begin, pop, or
  retry; retirement and diagnosis retain existing C1 boundaries.

- Recovered checkpoint publication: rename anchored to prepared
  directory, leaf verification against new and old control-log FDs,
  installed-name check, and parent fsync. Unique local token with
  cleanup before CAS; terminal errors without retry, rollback, or partial
  results. Full recovery and new-call qualification remain open.

- Dedicated ordinary ACTIVE GET functional suite: 28 tests with real files,
  v1/v2 formats, independent wire oracles, payload and directory boundaries,
  cache, faults, and snapshot/EBR cleanup. Isolated coverage and CLOSED
  compatibility retained with raw evidence and independent audits; C1 qualification and
  MC/DC remain open.

- Writer claim governed by pool state: acknowledges command only
  after IDLE barrier, delegates C1 claim when active, and leaves ready and
  cursor intact when inactive. Already acquired tasks and recycles complete
  their obligations before retirement; no wait or physical thread management.

- `control.log.tmp` checkpoint preparation: Serie header, complete
  EDIT, and SEAL built without I/O, manifest checked against new
  ACTIVE, physically distinct file, block transfers, exact reread,
  and parent fsync. No CSN or implicit rename; recovery integration
  and C1 qualification remain open.

- Logical pool-controller actuation on existing workers: persistent
  requests and acknowledgment-only counting, retirement only in IDLE context
  without abandoning lease or batch, reactivation of same contexts.
  Includes 18 tests with real workers, C3 coverage without exclusions, and measurements
  without allocations after startup. Dispatcher, wakeup, and physical startup remain open.

- New writer segment preparation: effect-free preflight, read-only/append
  identity before write, durable canonical header, exact reread,
  and parent fsync. ACTIVE adapter with mandatory proof and check of
  view's CSN registry; errors without retry or partial results. EDIT
  decision, server open/rotation, and C1 qualification remain to be integrated.

- Serie GET source bridge: CLOSED directory in ACTIVE root
  contents, single controller acquisition under EBR, resolution from
  same captured root, and owner/duplicate-ID rejection before adoption.
  Retains WAL protocol and GET core's five outcomes; rotation and
  complete reclaim remain distinct.

- CBOR float writing from IEEE words: exact width reduction,
  sign and NaN payload preservation, preflight before mutation,
  and private worker destinations. C1 qualification and document profile
  remain open.

- Local compute-worker count controller: integer EWMAs,
  additive increase, multiplicative decrease, and persistent conditions.
  Injected samples and time, target distinct from actual workers,
  bounded update without allocations after startup. Thread startup, wakeup,
  and retirement remain the next pool component.

- Physical read-only/append association: exact device/inode comparison in I/O
  pool, immutable capability-bound proof, and verification without syscalls in
  ACTIVE constructor. Injectable backend extended with optional identity;
  rejections without fallback, retry, or mutation. GET path unchanged;
  server adoption and C1 qualification remain open.

- CLOSED segment GET directory: compact u32 IDs and immutable private
  references, Serie/order/budget check before copies, search
  bounded to seventeen steps, and resolver/cache/I/O binding.
  Published location without segment is a fault, never a miss.
  Publication, ACTIVE, rotation, and reclaim remain separate integrations.
  Fixed read-return comparison in CLOSED resolver: API
  returns END in buffer, even when region starts at 64.

- Minimal CBOR MT7 simple value writing: wire codes 0..23 and
  32..255, range/code/capacity preflight, and exclusive destination.
  Includes comparison over all codes, fuzz, and two reused workers;
  application profile, composition, and C1 qualification remain open.

- Preallocated routing of ready writers to Serie: immutable ordinals,
  registry with verified associations, and private per-worker table.
  Direct constant-time selection, even after full-queue recycling,
  without shared per-message writes. Includes 18 new regressions,
  two C1 readings, full coverage audit, and five local measurements;
  pool and coordinator remain open.

- ACTIVE GET resolver for ordinary batches: root acquired from Serie
  publication, immutable pages, and persistent directory with four small
  vectors per append. Preflight before CSN, verification of new batch only, and GET cache/read reuse;
  budgets, fail-stop, and boundaries documented. ACTIVE prepared/OUTCOME, concrete
  index, rotation/reclaim, and C1 qualification remain open.

- Preallocated worker/Serie binding: dual lease, monotonic tokens, batch
  debt, and Serie release before worker, with retry limited to end and
  original fault retention. Includes 26 tests, two C1 readings,
  full coverage denominator, and five local serial-path
  measurements; pool and Archivio coordinator remain to be integrated.

- CLOSED segment GET resolver: manifest frontier, sealed writer
  prefix or verified compaction, immutable u32 rows, and OUTCOME proofs
  resolved without lookup I/O. Cache and GET read binding, explicit
  budgets, and position/CSN checks; ACTIVE, EDIT proofs, directory, and
  C1 qualification remain open.

- Typed XXH64 key hashing: return in two u32s, explicit immutable
  index seed, verified physical slot maps for rebuild/split,
  internal fault propagation. Includes 46 new regressions, mutations,
  serial/parallel measurements, and structured records; seed lifecycle and integrated
  GET still open.

- GET core with preallocated per-worker context: hash with index seed and lookup under EBR,
  segment capability with verified header, cache and read-only I/O, OUTCOME
  proof read from same file, and private response until snapshot
  confirmation. Historical lookup explicitly requested for cases not resolvable
  by current index; resolver, pool, protocol, and C1 qualification open.

- Per-Serie record cache: preallocated classes, eight-way sets,
  bounded CLOCK, lookup without locks, and opportunistic insertion. Every hit
  checks CRC, key, CSN, and prepared proof; cache corruption distinct
  from segment input. Shared verifier with CSN in two u32s,
  budgets and contracts documented; integrated GET and C1 qualification open.

- In-memory v2 primary index: 16-wide Swiss control groups, binary keys
  in arena, lookup with common budget and root confirmation even on miss, upsert and
  conditional deletion/relocation in writer, arena growth, and single-use directory
  publication plans, with key hashing and verified split/rebuild builder.
  Seed lifecycle and integrated GET still open;
  includes contracts, traceability, and static evidence, C1 qualification open.

- v2 index slot bank: contiguous u64 words, private-buffer reading
  with eight attempts, publication and removal under seqlock, conditional
  relocation, write credit, and permanent freezing. Includes
  contracts, decisions to cover, and static evidence; C1 qualification open.

- Preallocated per-worker read context: single-attempt EBR entry,
  snapshot checked before and after lookup, even on miss, and pin cleanup
  before migration. Connected to CSN/snapshot/epoch registries;
  index, cache, and pool remain to be integrated, concurrent qualification open.

- EBR domain per Archivio: worker announcements spaced 128 bytes apart, single-attempt
  entry without mutex, preallocated tickets, and epoch credits before
  swap. Frontier shared by multiple retirements and exclusive reclaim claim;
  segment/pool integration and concurrent qualification remain open.

- Snapshot registry per Archivio: threshold announced before CSN capture,
  preallocated contexts with generation, read checks without mutex,
  deadlines, and budgeted expiration. Buffer interface for readers;
  concurrent qualification, controller, and EBR remain to be integrated.

- CSN registry per Archivio with monotonic horizon and finite budget;
  active implementation is `arcdocdb.csn`, with slot/high/low tokens.
- In-memory manifest reconstruction from sealed `control.log` prefix:
  ACTIVE, CLOSED with outcomes, explicit removals, and ID limit. Independent
  workspaces per Serie; no file reconciliation or writes.

- Pure UTF-8 validation on immutable spans, with maximum 16 MiB budget,
  scalar-value count, and typed errors with offsets. Usable in
  parallel by workers before writer; CBOR parser remains to be integrated.
  Seventeen tests, nine mutants detected, and zero heap in 25 local samples;
  concurrent tests and raw evidence retained.

- Preallocated local MPSC queues and writer token with cumulative quantum:
  contention and saturation distinct, FIFO, and stale-token rejection.
  Seventeen tests, including real-thread producers/consumers and overlapping
  computation between Serie; eight mutants detected and zero heap in local measurements.

- In-memory verification of v1/v2 compacted CLOSED segments: identity, CRC,
  ordinary PUT/TOMBSTONE only, authoritative valid limit, and byte/record budgets.
  Physical counts returned after full check; 15 independent tests,
  eight mutants detected, and local allocation measurements retained.

- Multiseries decision table included in ordinary compilation and tests:
  reconstruction from sealed prefix, idempotent or conflicting duplicates,
  finite budgets, scalar queries, and owned participant copies. Does not apply
  prepared records or implement full database recovery.

- SPK-08 bitmap: equivalent byte/u64 scalar kernels, independent oracles,
  90 local samples, and retained disassemblies. Packing excluded and no
  promotion to engine optimization.

- SPK-07: two readers/two slots under SC, 28 mutants detected; byte-level v1/v2
  crashes, 49,120 cases, and 303,432 equivalent interruptions/restarts. External
  frontier and model limits declared; all attempts retained.

- SPK-08: exact scalar/SWAR masks and NEON/SSE2 kernels at safety 3;
  70 serial samples on Apple M4, zero observed bytes consed in cycles.
  SSE2 and concurrent index remain to be checked; reports readable without
  loading experimental packages, originals retained in full.

- In-memory v1/v2 log recovery scanning: verified prefix, tail, and
  corruption witnessed by later SEAL, explicit EOF, and budgets distinct
  from data errors; 19 tests, including 20,256 bit-alteration cases.

- SPK-06: finite load-controller, quota, and timer model; 24 local
  comparisons between concurrent reads and copies, with full verification, overlap
  intervals, and raw samples retained. Engine compaction and real
  feedback remain to be verified.

- SPK-05: pread and mmap reads of immutable files, CRC/key/stamp checked,
  explicit I/O and worker errors; 36 local comparisons per variant and profile
  without observed allocations in final cycle. Variants and failures retained.

- SPK-04: experimental pooled writer, bounded queues, read parking
  and restart models; checks and 54 diagnostic benchmarks retained,
  with explicit limits and failed attempts.

- SPK-10: four experimental Common Lisp modules for v1/v2 codec, five-word
  index, iterative CBOR, and migration model; in-memory integration
  of maximum limits. No production code, v2 gate still open.
- Structured test and benchmark registry, including failures and diagnostics;
  before/after source blobs, decoded results, and original outputs.
  `make check` records full verification; CI retains artifacts.
- Local campaigns retained: v1 index up to 10 million documents,
  allocation profiling, and separate v2 checks/benchmarks.

- ADR-0050: index root rechecked even on miss, directory costs and budgets
  separate from slots; no promise of pause independent of Serie.
- ADR-0048: actual 16 MiB documents, depth 100, keys up to 65,535 bytes, and v2 layout; three designed requirements, verification gate, and migration. ADR-0049 proposes beyond-RAM path without claiming availability.

- Executable Phase 0 suite for SPK-01, SPK-02, SPK-03, SPK-07, and SPK-09; harness
  `tools/run-spikes.lisp`, warning-free compilation, isolated processes, commands and raw
  output; `make spikes-check` in CI and `make spikes-bench` for serial local measurements.
- ADR-0046 and INV-M6: SPK-07 finds counterexample in horizon ring; preallocated
  registry of actual pending CSNs replaces it. Engine requirements remain designed.
- ADR-0047: prepared reads with authoritative CSN proof (OUTCOME or manifest), besides
  CRC, key, and flags. A location pointing to another version of same key is rejected.

- Original specification, thematic documentation (16 documents), invariants (`INV-…`),
  glossary.
- Architectural evaluation: critical analysis, estimates, risk register, spike plan.
- Consolidated design: [architecture](docs/architettura.md),
  [on-disk formats](docs/formati-su-disco.md), [size limits](docs/limiti.md).
- 30 ADRs (0001–0030): 26 open questions closed; ADR-0028 and ADR-0030 await
  author confirmation.
- Minimal ASDF system, smoke test, `tools/check-links.lisp`, CI.
- BSD-2-Clause license.
- **Critical software (ADR-0031…0035):** priority hierarchy with reliability above
  performance; eight new invariants (INV-A1…A8); fault analysis with 24 failure modes;
  coding standard (`COD-…` rules); verification plan; deviation register.
- **Tool-checked traceability:** 90 requirements in `requisiti.lisp`, generated matrix,
  `make trace`.
- Common Lisp tools: warning-free build (`tools/build.lisp`), linter with self-test
  (`tools/lint.lisp`), traceability check (`tools/check-trace.lisp`).
- SPK-09 (reliability check cost).

- **Design analysis** ([docs/analisi-progettuale.md](docs/analisi-progettuale.md)) and ADR
  0036–0045: ten design laws — first: **parallelism is a founding principle**,
  with closed list of what Serie share — atomicity point table, sixteen
  `AP-…` findings; fourteen new invariants (INV-F2, F3, V5, M4, M5, S7, C11, I3, P5, P6,
  A9…A12), 107 requirements, 27 failure modes, residual risk RES-05.

- Segment inventory from Serie-owned directory: independent bounded
  read-only cursor, canonical u64 names, and identities without
  symlinks checked before reconciliation plan. No partial list
  on missing EOF, exhausted budget, or cleanup fault.

- Read-only opening relative to directory capability, with size
  from same FD, device/inode binding verification, and unpublished child
  cleanup. CONTROL, decision log, and ACTIVE in vertical test
  use capabilities and size from same open; existing files
  remain read-only.

<a id="cambiato"></a>

### Changed

- Reused-worker CBOR string tests use distinct signals
  per wave, preventing one worker from consuming the other's permit
  in the next wave.

- Snapshots connected to Archivio's single `arcdocdb.csn` registry; duplicate
  branch CSN allocator removed. Snapshot coordination without waits,
  provisional threshold revocation on `:csn-busy`, and terminal invalidation
  on fault. Canonical registry API and evidence retained.

- Repository guides consolidated, experiment notes standardized to technical
  method, and original specification renamed; requirements and evidence retained (ADR-0051).

- ADR-0028 and ADR-0030 confirmed by author on 2026-10-08, including revisions on minimum
  performance, backup, verified restore, offline verifier, and scrubbing.

- **Design corrections from analysis (no code touched, formats never implemented):**
  - a snapshot is born when visibility horizon reaches it: previously it could see
    an in-flight batch appear (ADR-0038);
  - log tail or corruption decided using SEAL durable frontier: previously an ordinary
    crash with multiple batches in flight made Serie `FAULTED`; recovery no longer truncates
    (ADR-0037);
  - tombstones discarded with existence filter: lineage rule resurrected
    deleted documents after MERGE of nonadjacent segments (ADR-0042);
  - multiseries outcome in same segment as records it resolves: previously CLEAN
    could lose it (ADR-0041);
  - fragmented primary index: no doubling that triples memory and stops writer; 4-word
    slots; estimate corrected to ~75–80 bytes per document (ADR-0043).
- **Simplifications:** document version is CSN; one record frame with two
  CRCs (24 bytes); four segment record types; control log with EDIT only;
  `multiserie.log` with DECISION only; no `.bloom` file, no lineage, no
  `creating` state; cache without retagging; EBR only for files (ADR 0038–0044).
- **Execution model:** run-to-completion tasks, waits as parking, every blocking
  call in I/O pool (ADR-0045).

- **Visual language redesigned** ([assets/README.md](assets/README.md)): monochrome identity with
  one color, amber, reserved for what can change; new logo; vector illustrations of
  segments and write/read path diagram, light and dark; README
  rewritten; social preview. Link checking also verifies image
  paths.

- ADR-0032 partly supersedes ADR-0015: seqlock counter increases from 8 to 64 bits, with bounded
  attempts and writer fallback, because the 8-bit argument relied on timing rather than a
  guarantee by construction. Cost: +8 bytes per entry (56 B).
- ADR-0028 (proposal) distinguishes performance objectives and binding minima; ADR-0030
  (proposal) brings backup and offline verifier into v1.
