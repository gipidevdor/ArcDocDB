<a id="linguaggio-visivo"></a>

# Visual language

The repository's identity, images and entry pages follow these rules.

<a id="principi"></a>
## Principles

1. **One color, one meaning.** The identity is monochrome. Amber is the only
   accent and always denotes *what can change*: the `ACTIVE` segment in drawings,
   or the project phase in a badge. Immutable elements use ink.
2. **Only what serves a purpose.** Every element communicates something about
   the system. No decoration, shadows, gradients or borders.
3. **The page is the material.** Images have transparent backgrounds and sit on
   GitHub's light or dark page. Each image has both variants.
4. **One shape.** The capsule: a line with rounded ends. It represents a segment.
   The mark, illustrations and diagrams use capsules, arcs and thin lines.
5. **Numbers are text.** Keep numbers in text where they can be read and corrected.
   Do not turn them into badges.

<a id="colori"></a>
## Colors

| Name | Light | Dark | Use |
|---|---|---|---|
| Ink | `#1d1d1f` | `#f5f5f7` | Mark, immutable segments, node text |
| Graphite | `#6e6e73` | `#a1a1a6` | Descriptions, labels, diagram connections |
| Mist | `#d2d2d7` | `#48484a` | Outlines, brackets, dashed lines |
| **Amber** | `#c9892f` | `#e9a84c` | What changes: `ACTIVE`, current phase |

No other colors. Green and red appear only where GitHub supplies them, such as CI status.

<a id="tipografia"></a>
## Typography

Use system fonts in this order: `-apple-system`, `BlinkMacSystemFont`, `SF Pro Text`,
`Helvetica Neue`, `Helvetica`, `Arial`, `sans-serif`.

| Role | Size | Weight | Spacing |
|---|---|---|---|
| Diagram node | 14 | 500 | Normal |
| Description | 13 | 400 | Normal |
| Label, uppercase | 9.5–10 | 600 | +1.2 – +1.5 |

The project name is actual README text, not an image. Spaced uppercase labels
are reserved for state names and properties (`ACTIVE`, `IMMUTABLE`).

<a id="marchio"></a>
## Mark

An arc above three segments: the Archivio and what it holds. The first segment is amber.

| Construction | Value |
|---|---|
| Grid | 64 × 64 |
| Stroke | 5, rounded ends, for arc and segments |
| Arc | Semicircle of radius 21, centered at (32, 30) |
| Segments | From x = 11 to x = 53, at y = 39, 48, 57, spaced by 9 |
| Clear space | One and a half stroke widths on each side |
| Minimum size | 16 px |

Do not rotate, distort or recolor the mark, or combine it with the name in one image.

<a id="file"></a>

## Files

| File | Contents |
|---|---|
| [`img/mark-light.svg`](img/mark-light.svg) · [`img/mark-dark.svg`](img/mark-dark.svg) | The mark |
| [`img/hero-light.svg`](img/hero-light.svg) · [`img/hero-dark.svg`](img/hero-dark.svg) | The segments of a Serie |
| [`img/flow-light.svg`](img/flow-light.svg) · [`img/flow-dark.svg`](img/flow-dark.svg) | Write and read paths |
| [`img/social.svg`](img/social.svg) · [`img/social.png`](img/social.png) | Social preview, 1280 × 640 |

The dark variant replaces the four colors according to the table above;
geometry stays identical. Every image has `title` and `desc` for readers who cannot see it.

Upload `img/social.png` under *Settings → General → Social preview*.
The social preview is not configured from the command line.

<a id="pagine-di-ingresso"></a>
## Entry pages

The README uses a small mark, the name as text, one sentence about the product
and its current status. The start command and a few useful links follow.
No badge row, cards, duplicate navigation or introductory illustrations.

Section indexes start directly with their title. A page has one purpose:
orient the reader, describe a contract or retain evidence. Complete catalogs
and history remain accessible one level below the entry pages.
Hierarchy and space make the content readable.

<a id="che-cosa-non-si-fa"></a>
## What to avoid

- Adding a color.
- Using amber for something that does not change.
- Putting text inside an image when it can be on the page.
- Adding a badge for a number.
- Using an image with a background.

<a id="il-repository-come-prodotto"></a>
## The repository as a product

The README presents purpose, operation and maturity. The documentation index
orients readers by question; section indexes link to related paths. The
contribution guide describes work that can be done now and the checks available.

- Preserve the mark, palette, geometry, and light and dark variants.
- Use descriptive titles and explicit headers in comparison tables.
- Distinguish a designed guarantee from a verified result; make status readable.
- Link documents with meaningful labels, without repeating the mark on every page.
- Keep technical details in dedicated documents and provide access from the README.
