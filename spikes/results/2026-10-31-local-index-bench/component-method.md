# Supplementary GET component benchmark method

Additional existing product GET campaigns, run serially after the focused matrix:
`tools/get-throughput-bench.lisp --bench` and
`tools/get-performance-bench.lisp --bench`, each with its fixed documented
20,000-call windows, five replicas, 16/256/4096-byte values and both small/u64-max
CSN profiles. These exercise cache-hit/segment/absent component paths, selected
versus reference CRC throughput, and serial/1/2/4-worker GET timings/allocations.
They are separate lower-level campaigns, not UDS or paginated-engine results.
Their own self-tests/negative controls and scope declarations remain mandatory.

Compiler/backend comparison extension, recorded before the second campaign:
`src/io/cpu-build.lisp` qualifies native ARM64 CRC only for SBCL 2.6.9; 2.6.10
correctly falls back to Lisp. Repeat the identical focused driver and both
existing GET campaigns with installed SBCL 2.6.9. Do not change the compiler
allowlist or force native code on 2.6.10. Compare only the observed combined
runtime/backend profiles: these runs cannot attribute every difference solely
to compiler version or solely to CRC implementation. Driver code is identical;
raw metadata, selected component backend and both source snapshots identify
what ran. Service child processes use the parent runtime binary.
