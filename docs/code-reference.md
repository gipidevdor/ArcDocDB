# The code reference

The online manual includes a reference generated from the Common Lisp sources in
`src/`. It covers package declarations, exports, explicit definitions and the
generated structure operations or condition readers needed to resolve exported
symbols. Package pages lead to definitions; source-file pages include both
exported bindings and internal implementation details.

Search also indexes individual symbols and links directly to their definition
anchors, rather than requiring a second search within a source-file page.

The reference is built with **CommonDoc Codex**, the Common Lisp documentation
generator. It is separate from OpenAI Codex. The source adapter supplies the code
reference to the same CommonDoc assembly and HTML template as the prose manual.

## What comes from the code

Each definition has a stable location within its edition, a link to the source
line, its definition kind and export status. Explicit argument lists, declared
function types, source docstrings, type expansions and structure or condition
slot declarations are taken from the source. Large constant initializers remain
available through their source links rather than being duplicated in the manual.

Conditions named directly in `error`, `cerror`, `signal` or `warn` forms are listed
separately. This is a static list: calls, callbacks and re-signaling may propagate
additional conditions. It does not replace the definition's error contract.

Generated accessors, constructors, predicates, copiers and condition readers are
identified as generated and linked to their declaring structure or condition.
Inherited behavior remains governed by that declaration and its source types.
An exported name is a package interface, not an assertion of production maturity
or a concurrency guarantee. Internal definitions remain implementation details.

## Extraction and platform scope

The source adapter tokenizes Lisp syntax without interning source symbols,
executing reader evaluation, expanding product macros or starting the database.
It retains both branches of reader conditionals and displays their conditions.
Definitions specific to another operating system or CPU therefore remain visible;
their presence does not qualify them on the build host.

The adapter recognizes explicit definitions, package declarations, selected
top-level grouping forms and the standard generated operations described above.
It does not infer arbitrary macro expansion or execute initializers. A new source
construct that defines an exported binding must be supported explicitly; an export
with no resolved source definition fails publication. A missing docstring remains
visible rather than being replaced by an invented contract.

CommonDoc Codex's built-in Docparser system loader is not used to compile the
product during rendering. The static adapter preserves the complete source
inventory, including conditional definitions, and avoids depending on a loader
that can continue after compilation errors. This scope is recorded in
[ADR-0077](adr/0077-source-derived-code-reference.md).

## Coverage and verification

`make docs` inventories tracked and untracked source files, generates the
reference and verifies source hashes, export resolution, definition anchors,
navigation and search coverage. The published manifest records both the Markdown
and code inventories. Changes to product source files trigger the documentation
workflow.

A separate verification process loads the compiled product and compares its
actual package exports and exported prose contracts with the generated reference.
The [runnable Lisp example](lisp-api.md) also checks the public client against a
private temporary Unix service, including persistence across service shutdown
and reopening. These checks supplement static coverage; rendering itself does
not load or start the database.

Regression fixtures include comments and strings containing apparent definitions,
quoted data, character literals, escaped strings, nested block comments, reader
evaluation and both conditional branches. Malformed syntax is rejected. Negative
publication fixtures verify that an incomplete source inventory or an incorrect
source digest fails publication.

Source contracts are edited in the source docstrings. Editorial changes preserve
identifiers, declared types, preconditions, postconditions, error semantics,
ownership and progress claims. The [editorial policy](editorial-policy.md) also
applies to generated reference text. Publication does not prove those contracts;
their tests, reviews and qualification records remain the relevant evidence.
