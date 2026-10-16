;;;; arcdocdb.asd — definizione di sistema ASDF.
;;;;
;;;; Fondazioni dello storage, autorizzate dall'autore il 2026-10-08.

(in-package #:asdf-user)

(defsystem "arcdocdb"
  :description "Database server documentale general-purpose, append-only, in Common Lisp (SBCL)."
  :author "Giacomo Picchiarelli"
  :license "BSD-2-Clause"
  :version "0.0.0"
  :pathname "src/"
  :serial t
  :depends-on ("sb-posix")
  :components ((:file "package")
               (:module "foundation"
                :serial t
                :components ((:file "package") (:file "conditions")
                             (:file "binary") (:file "crc32c")
                             (:file "record") (:file "batch")))
               (:module "hash" :serial t
                :components ((:file "package") (:file "arithmetic") (:file "blocks") (:file "hash64")))
               (:module "codec" :serial t
                :components ((:file "package") (:file "utf8")
                             (:file "cbor-package") (:file "cbor-header")
                             (:file "cbor-float-minimal") (:file "cbor-minimal")
                             (:file "cbor-space") (:file "cbor-scan-input")
                             (:file "cbor-scan-stack") (:file "cbor-scan-items")
                             (:file "cbor-scan") (:file "cbor-scan-minimal")
                             (:file "cbor-write") (:file "cbor-string-write")
                             (:file "cbor-simple-write")
                             (:file "cbor-float-narrow") (:file "cbor-float-write")
                             (:file "cbor-array-input") (:file "cbor-array-write")
                             (:file "cbor-map-input") (:file "cbor-map-write")
                             (:file "cbor-tag-input") (:file "cbor-tag-write")
                             (:file "cbor-item-read") (:file "cbor-string-read")))
               (:module "csn" :serial t
                :components ((:file "package") (:file "registry")))
               (:module "cache" :serial t
                :components ((:file "package") (:file "types") (:file "build") (:file "core")
                             (:file "read") (:file "clock") (:file "write")))
               (:module "execution" :serial t
                :components ((:file "package") (:file "queue") (:file "writer")
                             (:file "handoff") (:file "ready-types") (:file "ready")
                             (:file "ready-recycle")
                             (:file "worker-types") (:file "worker-boundary") (:file "worker-claim") (:file "worker-run")))
               (:module "scheduler" :serial t
                :components ((:file "package") (:file "types") (:file "build")
                             (:file "read") (:file "policy") (:file "update")
                             (:file "lifecycle-types") (:file "lifecycle-read")
                             (:file "lifecycle-build") (:file "lifecycle-worker")
                             (:file "lifecycle-update") (:file "pool-claim")))
               (:module "storage"
                :serial t
                :components ((:file "package") (:file "formats") (:file "segment-header")
                             (:file "log-header") (:file "compaction-scan")
                             (:file "control-payload") (:file "payload-record")
                             (:file "payload-write")))
               (:module "io" :serial t
                :components ((:file "package") (:file "types") (:file "identity-types")
                             (:file "native") (:file "native-namespace") (:file "native-directory")
                             (:file "lifecycle") (:file "identity") (:file "directory")
                             (:file "rename") (:file "namespace") (:file "transfer") (:file "flush")))
               (:module "wal" :serial t
                :components ((:file "package") (:file "types") (:file "builder")
                             (:file "group") (:file "executor") (:file "csn")))
               (:module "series" :serial t
                :components ((:file "package") (:file "types") (:file "ownership")
                             (:file "events") (:file "io-events") (:file "publication")
                             (:file "query") (:file "retirement")
                             (:file "worker-package") (:file "worker-types")
                             (:file "worker-boundary") (:file "worker-run")
                             (:file "routing-types") (:file "routing-build") (:file "routing-select")))
               (:module "dispatch" :serial t
                :components ((:file "package") (:file "types") (:file "build") (:file "claim")
                             (:file "recycle") (:file "begin") (:file "step") (:file "start")))
               (:module "index" :serial t
                :components ((:file "package") (:file "types") (:file "core")
                             (:file "validation") (:file "read") (:file "write") (:file "relocate")
                             (:file "primary-package") (:file "primary-types") (:file "primary-core")
                             (:file "primary-build") (:file "primary-probe") (:file "primary-read")
                             (:file "primary-write") (:file "primary-relocate")
                             (:file "primary-arena") (:file "primary-directory")
                             (:file "rebuild-scan") (:file "rebuild-budget")
                             (:file "rebuild-copy") (:file "rebuild")
                             (:file "hash-seed") (:file "hash-digests")))
               (:module "mvcc" :serial t
                :components ((:file "package") (:file "types")
                             (:file "snapshots-types") (:file "snapshots-core") (:file "snapshots-csn")
                             (:file "snapshots-register") (:file "snapshots-lifecycle")
                             (:file "snapshots-read")))
               (:module "epochs" :serial t
                :components ((:file "package") (:file "types") (:file "core")
                             (:file "read") (:file "retire") (:file "reclaim")))
               (:module "read" :serial t
                :components ((:file "package") (:file "types") (:file "core")
                             (:file "task")))
               (:module "get" :serial t
                :components ((:file "package") (:file "types") (:file "build")
                             (:file "lifecycle") (:file "lookup") (:file "target") (:file "segment")))
               (:module "recovery"
                :serial t
                :components ((:file "package") (:file "scan")
                             (:file "decisions-package") (:file "decisions-types")
                             (:file "decisions-sort") (:file "decisions-radix") (:file "decisions-build")
                             (:file "decisions-query")
                             (:file "manifest-package") (:file "manifest-types")
                             (:file "manifest-decode") (:file "manifest-fold")
                             (:file "manifest-build") (:file "manifest-query") (:file "manifest-transition")
                             (:file "inventory-types") (:file "inventory-build")
                             (:file "inventory-query") (:file "inventory-id")
                             (:file "inventory-directory") (:file "inventory-directory-id")))
               (:module "get-resolver" :serial t
                :components ((:file "package") (:file "types") (:file "scan") (:file "sort")
                             (:file "rows") (:file "build") (:file "read")
                             (:file "active-types") (:file "active-directory")
                             (:file "active-scan") (:file "active-build") (:file "active-init")
                             (:file "active-preflight") (:file "active-read")))
               (:module "get-directory" :serial t
                :components ((:file "package") (:file "types") (:file "build") (:file "read")
                             (:file "sources-types") (:file "sources-read")))
               (:module "active" :serial t
                :components ((:file "package") (:file "types") (:file "preflight")
                             (:file "prepare") (:file "source")))
               (:module "control" :serial t
                :components ((:file "package") (:file "types") (:file "dependency")
                             (:file "build") (:file "preflight") (:file "transfer") (:file "prepare")
                             (:file "publication") (:file "publication-read")
                             (:file "recovery-types") (:file "recovery-read") (:file "recovery-publication")))
               (:module "recovery-active" :serial t
                :components ((:file "package") (:file "types") (:file "read") (:file "csn") (:file "frames")
                             (:file "resolve") (:file "build") (:file "query")
                             (:file "closure") (:file "publication")))
               (:module "recovery-archive" :serial t
                :components ((:file "package") (:file "types") (:file "read")
                             (:file "build") (:file "query") (:file "active")))
               (:module "recovery-checkpoint" :serial t
                :components ((:file "package") (:file "preflight") (:file "order")
                             (:file "sections") (:file "build")))
               (:module "recovery-closed" :serial t
                :components ((:file "package") (:file "types") (:file "read") (:file "verify")
                             (:file "resolve") (:file "csn") (:file "build") (:file "publication")
                             (:file "csn-serie"))))
  :in-order-to ((test-op (test-op "arcdocdb/tests"))))

(defsystem "arcdocdb/tests"
  :description "Test di ArcDocDB."
  :author "Giacomo Picchiarelli"
  :license "BSD-2-Clause"
  :depends-on ("arcdocdb")
  :pathname "tests/"
  :serial t
  :components ((:file "smoke")
               (:module "hash" :serial t
                :components ((:file "support") (:file "hash64") (:file "guards") (:file "threads")))
               (:module "foundation"
                :serial t
                :components ((:file "support") (:file "binary")
                             (:file "record") (:file "batch")))
               (:module "codec" :serial t
                :components ((:file "support") (:file "utf8") (:file "threads")
                             (:file "cbor-support") (:file "cbor-header") (:file "cbor-threads")
                             (:file "cbor-minimal-support") (:file "cbor-minimal")
                             (:file "cbor-minimal-threads") (:file "cbor-minimal-edges")
                             (:file "cbor-structure-support") (:file "cbor-structure")
                             (:file "cbor-structure-threads")
                             (:file "cbor-minimal-scan-support") (:file "cbor-minimal-scan")
                             (:file "cbor-minimal-scan-threads")
                             (:file "cbor-write-support") (:file "cbor-write")
                             (:file "cbor-write-threads") (:file "cbor-write-roundtrip")
                             (:file "cbor-string-write-support") (:file "cbor-string-write")
                             (:file "cbor-string-write-threads")
                             (:file "cbor-simple-write-support") (:file "cbor-simple-write")
                             (:file "cbor-simple-write-threads")
                             (:file "cbor-float-write-support") (:file "cbor-float-write")
                             (:file "cbor-float-write-threads")
                             (:file "cbor-array-write-support") (:file "cbor-array-write")
                             (:file "cbor-array-write-threads")
                             (:file "cbor-map-write-support") (:file "cbor-map-write")
                             (:file "cbor-map-write-threads")
                             (:file "cbor-tag-write-support") (:file "cbor-tag-write")
                             (:file "cbor-tag-write-threads")
                             (:file "cbor-item-read-support") (:file "cbor-item-read")
                             (:file "cbor-item-read-threads")
                             (:file "cbor-string-read-support") (:file "cbor-string-read")
                             (:file "cbor-string-read-threads")))
               (:module "csn" :serial t
                :components ((:file "support") (:file "registry") (:file "threads")))
               (:module "mvcc" :serial t
                :components ((:file "support") (:file "lifecycle") (:file "capture")))
               (:module "epochs" :serial t
                :components ((:file "support") (:file "lifecycle") (:file "threads")))
               (:module "read" :serial t
                :components ((:file "support") (:file "lifecycle") (:file "threads")))
               (:module "get" :serial t
                :components ((:file "support") (:file "lifecycle") (:file "segment")))
               (:module "get-performance" :serial t
                :components ((:file "support") (:file "paths") (:file "guards") (:file "threads")))
               (:module "get-directory" :serial t
                :components ((:file "support") (:file "construction") (:file "read") (:file "threads")
                             (:file "series-support") (:file "series-read")
                             (:file "lifetime-support") (:file "lifetime")))
               (:module "get-resolver" :serial t
                :components ((:file "support") (:file "sort") (:file "construction") (:file "read")))
               (:module "get-active" :serial t
                :components ((:file "support") (:file "construction") (:file "preflight")
                             (:file "directory") (:file "read")))
               (:module "execution" :serial t
                :components ((:file "support") (:file "queue") (:file "threads")
                             (:file "handoff") (:file "ready") (:file "ready-recycle") (:file "worker")))
               (:module "scheduler" :serial t
                :components ((:file "support") (:file "controller") (:file "lifecycle")
                             (:file "pool-claim") (:file "dispatch") (:file "pool-recycle")
                             (:file "pool-begin") (:file "pool-step")
                             (:file "pool-chain-support") (:file "pool-chain") (:file "pool-start")))
               (:module "storage"
                :serial t
                :components ((:file "support") (:file "segment-header") (:file "log-header")
                             (:file "compaction-scan")
                             (:file "control-payload")))
               (:module "io" :serial t
                :components ((:file "support") (:file "transfer") (:file "native")
                             (:file "rename") (:file "rename-native") (:file "flush-failure")
                             (:file "transfer-failure")))
               (:module "control" :serial t
                :components ((:file "support") (:file "publication") (:file "native")
                             (:file "recovery-read") (:file "recovery-publication") (:file "recovery-guards")))
               (:module "recovery"
                :serial t
                :components ((:file "support") (:file "scan") (:file "corruption")
                             (:file "decisions-support") (:file "decisions")
                             (:file "decisions-audit") (:file "decisions-radix") (:file "manifest-support")
                             (:file "manifest") (:file "manifest-audit") (:file "manifest-transition")
                             (:file "inventory-support") (:file "inventory")
                             (:file "inventory-id")
                             (:file "inventory-directory-support") (:file "inventory-directory")
                             (:file "inventory-directory-native") (:file "inventory-directory-id")))
               (:module "recovery-active" :serial t
                :components ((:file "support") (:file "read") (:file "semantics") (:file "publication")))
               (:module "recovery-archive" :serial t
                :components ((:file "support") (:file "read") (:file "query")
                             (:file "active") (:file "native") (:file "guards")))

               (:module "recovery-active-checkpoint" :serial t
                :components ((:file "support") (:file "semantics") (:file "guards")
                             (:file "publication")))
               (:module "wal" :serial t
                :components ((:file "support") (:file "builder") (:file "group") (:file "fault")
                             (:file "native") (:file "csn") (:file "csn-threads")))
               (:module "series" :serial t
                :components ((:file "support") (:file "controller") (:file "boundaries") (:file "threads")
                             (:file "worker-bridge") (:file "worker-routing")))
               (:module "index" :serial t
                :components ((:file "slot-support") (:file "slots") (:file "slot-threads")
                             (:file "primary-support") (:file "primary") (:file "primary-threads")
                             (:file "rebuild") (:file "hash-digests")))
               (:module "vertical" :serial t
                :components ((:file "support") (:file "scenarios") (:file "resume") (:file "processes"))))
  :perform (test-op (o c)
             (uiop:symbol-call '#:arcdocdb.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.hash64.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.foundation.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.utf8.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.structure.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.scan.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.string.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.simple.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.float.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.array.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.map.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tag.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.item.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.string.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.performance.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.directory.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.resolver.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.active.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.scheduler.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.storage.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.io.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.control.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.active.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.archive.tests '#:run)

             (uiop:symbol-call '#:arcdocdb.recovery.active.checkpoint.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.wal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.series.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.slots.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.primary.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.vertical.tests '#:run)))
