# Accessibility

The manual is designed to support keyboard navigation, screen magnification,
different color preferences and reading without JavaScript. WCAG 2.2 Level AA
is the editorial target. This edition does not claim audited WCAG conformance.

## Reading features

- A skip link moves focus to the main content.
- Each page has one main heading, descriptive navigation and an English language
  declaration. API identifiers and established domain names retain their spelling.
- Contents lists provide direct section links, including a collapsible list on
  small screens.
- Search has a label and announces results. It is an enhancement; the complete
  document index remains available without JavaScript.
- Appearance can follow the system or use a light or dark theme. Focus indicators
  do not depend on animation.
- The stylesheet respects reduced-motion preferences and provides a print layout.
- Tables retain header cells. Code, tables and wide diagrams can scroll horizontally
  rather than making text unreadably small.
- Mermaid diagrams retain their source and an authored text description.

## Verification and known limits

The build checks page structure, headings, local links and anchors, the presence
of image alternative attributes, form-label associations, required publication notices and the presence of
text descriptions for Mermaid diagrams. It also checks the approved text and
focus color pairs. These checks cover specific defects, not every WCAG success
criterion.

Manual screen-reader testing, interactive browser testing and a complete
zoom/reflow review remain required before a conformance claim. Historical
ASCII diagrams and dense technical tables may require additional interpretation.
A missing diagram renderer leaves its text description and source available.

For the standard and assessment guidance, see
[WCAG 2.2](https://www.w3.org/TR/WCAG22/) and
[Evaluating Web Accessibility](https://www.w3.org/WAI/test-evaluate/).

## Report a barrier

Use the [project's editorial contact](README.md#contact-and-corrections).
Include the page URL, the task you could not complete and, if you choose,
the browser or assistive technology involved. An alternative description of
the affected content can be requested through the same channel. Keep sensitive
information out of public issues.
