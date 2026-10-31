# Third-party notices

Project-authored material uses the [BSD 2-Clause license](../../LICENSE), subject
to any more specific notice in a file. Third-party material retains its original
license. The generated site includes complete downloadable license and attribution
texts; the repository license does not replace them.

Download the [project license](../../LICENSE),
[complete browser notices](../../tools/pages/third-party-notices.txt),
[component inventory](../../tools/pages/third-party-notices.lisp) and
[Unicode license](../../data/unicode/18.0.0/LICENSE.txt).

## Code delivered to your browser

The site's own stylesheet and interaction script are project-authored. Mermaid
11.12.1 renders diagrams and incorporates other open-source components. Its
unmodified bundle retains its embedded notices. The accompanying notice collection
reproduces the upstream license and notice files for the packages identified from
the bundle's source map and release lock, including its nested URI/path code.

The machine-readable notice inventory records package versions, source archives
and SHA256 hashes. A build fails if the browser bundle or the notice collection
does not match that inventory. Updating the diagram renderer requires updating
the corresponding notices; a single top-level MIT label is not a substitute for
the terms of its incorporated components.

DOMPurify offers alternative Apache-2.0 and MPL-2.0 terms. The upstream license
texts and the bundle's original attribution are retained. Their inclusion does
not change ArcDocDB's license or assert ownership of third-party code.

## Documentation build tools

[CommonDoc Codex](https://github.com/CommonDoc/codex) assembles the manual.
[3bmd](https://github.com/3b/3bmd) renders Markdown. Their dependency versions are
fixed in the documentation toolchain lock. The Common Lisp build libraries are
used during generation; their implementations are not shipped as browser code.
Their downloaded source trees retain their own license files.

SBCL remains a separate compiler/runtime with its own notices. The project's
database runtime and product dependency policy are described in
[ADR-0027](../adr/0027-dipendenze-e-test.md); the documentation-only exception is
[ADR-0075](../adr/0075-codex-documentation-toolchain.md).

## Unicode and cited material

The repository retains the [Unicode data provenance and licenses](../../data/unicode/18.0.0/README.md).
The website includes the corresponding Unicode license notice; the documentation
build does not republish the full UCD data set or silently relicense it.

Quoted source material, standards, product names and other cited works retain
their rights. Links identify references; they do not imply sponsorship,
affiliation or endorsement. Where a specific file carries its own notice,
read that notice alongside the general project license.
