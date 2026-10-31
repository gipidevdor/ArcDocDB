# Distributing ArcDocDB

This policy preserves notices; it does not replace upstream licenses or certify
an artifact's complete legal compliance. The [dated review](review-2026-10-31.md)
records the inspected sources and unresolved matters.

## License boundaries

| Material | Terms | Distribution requirement |
|---|---|---|
| Project-authored code and prose | [BSD-2-Clause](../../LICENSE), to the extent of contributors' rights | Preserve copyright, conditions and disclaimer |
| Unicode® Character Database 18.0.0, corpora and derived tables | [Unicode-3.0](../../data/unicode/18.0.0/LICENSE.txt) | Include the complete original notice with source, compiled and container distributions |
| SBCL, contribs and implementations in saved images | Actual runtime's COPYING and component terms | Preserve the notices of the version and build actually distributed |
| XXH64 algorithm reference | [xxHash BSD license and specification notice](../../legal/algorithms/xxHash-v0.8.3-NOTICES.txt) | Retain upstream attribution; no native xxHash library is linked |
| Mermaid browser bundle and incorporated components | [Component-specific licenses](third-party.md) | Retain embedded notices and the complete downloadable collection |
| Documentation build libraries and caches | Individual terms, including LGPL/LLGPL | Preserve their own licenses and source obligations when redistributing tools, caches or build images |
| Standards, papers, logos and cited works | Respective holders' rights | Link to originals; check permission before copying beyond a license or applicable exception |

ASDF's `BSD-2-Clause AND Unicode-3.0` describes the combined system, not alternative
licenses for every file. The original project license remains BSD-2-Clause.
Unicode data are licensed third-party material, not an external Lisp library.
The documentation toolchain is the exception defined in
[ADR-0075](../adr/0075-codex-documentation-toolchain.md).

Open-source licensing does not establish patent freedom or grant third-party
trademarks. No endorsement or certification is claimed. Unicode and the Unicode
Logo are registered trademarks of Unicode, Inc. in the United States and other countries.

## Source, FASL, saved image and container artifacts

The [root notices](../../THIRD-PARTY-NOTICES.txt) reproduce the full Unicode notice.
The [notice inventory](../../legal/notice-files.lisp) drives the Common Lisp tool:

```sh
make legal-check
mkdir -p release
sbcl --noinform --no-userinit --no-sysinit --script tools/legal-notices.lisp \
  --stage-new release/ArcDocDB-notices/
sbcl --noinform --no-userinit --no-sysinit --script tools/legal-notices.lisp \
  --check-artifact release/ArcDocDB-notices/
```

Staging creates a **new directory**, refuses an existing name, copies original
bytes and writes `legal-notices.lisp` with lengths and SHA256 hashes. Failure may
leave partial output for inspection; partial output must not be published.
Existing artifacts are never overwritten by staging.

Copy this directory's contents into the distribution root, preserving paths, and
run `--check-artifact` on that root. Keep notices in the final container image,
not just an intermediate build stage.

The checker detects missing, altered and stale **declared notices**. It does not
inspect executable contents, discover additional dependencies, attest the runtime,
prove source/binary identity, issue an SPDX SBOM, check export classification or
authorize release. Those limits are explicit in the manifest.

The retained [SBCL 2.6.9 COPYING](../../legal/runtime/SBCL-2.6.9-COPYING.txt) is a
reference from the exact toolchain commit. Compare it with the actual runtime's
notices before redistribution. Other versions, optional compression, native
libraries and container bases need their own inventory. SBCL must not be labeled
entirely public domain or relicensed wholesale under ArcDocDB's BSD license.

Do not distribute `_build/` as application source. Downloaded libraries, compiled
caches and build images are not covered solely by the project's BSD notice.

## Documentation site

The site publishes exact copies of the project license, root notices, Unicode
notice, reference SBCL/xxHash notices and browser notice inventory in `licenses/`.
Its integrity checks compare published bytes with their sources.

This distribution selects **Apache-2.0** from DOMPurify's offered alternatives.
Both upstream license texts and its original dual-license attribution remain in
the complete collection. Retain relevant copyright and NOTICE material and mark
modified upstream files. See [Apache-2.0 section 4](https://www.apache.org/licenses/LICENSE-2.0.html).

LGPL/LLGPL build libraries generate the manual; their implementations are not
shipped in the custom browser assets. This is not a blanket exemption for
templates or protected code copied into output. Review those boundaries again
when the theme, assets, toolchain or distribution format changes.

## Release decisions

Establish distributor identity, rights to contributions and artwork, actual
components, intended markets and commercial model. Reassess privacy, vulnerability
reporting and mandatory liability before offering hosting, paid support, a
commercial product or new data collection. A notice check does not perform that
assessment. Disclaimers do not exclude mandatory rights or obligations.
