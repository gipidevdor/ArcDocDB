<a id="unicode-1800--provenienza"></a>

# Unicode 18.0.0 — provenance

Original Unicode data, acquired on October 16, 2026 from the official
[UCD.zip](https://www.unicode.org/Public/18.0.0/ucd/UCD.zip) archive.
Paths in the table are relative to
[`https://www.unicode.org/Public/18.0.0/ucd/`](https://www.unicode.org/Public/18.0.0/ucd/).
`LICENSE.txt` comes from [Unicode License V3](https://www.unicode.org/license.txt).
Original files retain their contents and copyright notices; they are not application data.

| File | SHA256 |
|---|---|
| `UnicodeData.txt` | `0736451de439ae7baf1425136617da495e09ee5afbe6e394374db7009ea08950` |
| `CaseFolding.txt` | `a004797658a457bec4dc11683e39f69249ea3b595b752dbea6721c4c9f587b0d` |
| `DerivedNormalizationProps.txt` | `98ac7f67d985fe781e317f6182e885e94cabb0c314769e6dd73e48b226931ccd` |
| `NormalizationTest.txt` | `25a50d816764b04abfb4a646d3eb2b2a803284c3873d9a06757b94fe4513dde3` |
| `ReadMe.txt` | `b0ea442f29dee90584aacd3665a6e1ce87ffc917a4d31f34e1916d2d6f7f9205` |
| `auxiliary/WordBreakProperty.txt` | `8dbfa17063e11084201f33c3e76d485d3b9166930c71db8e39ed1c9234171aec` |
| `auxiliary/WordBreakTest.txt` | `3dd70c071781276067c680d87303f60434adce7b067bd063194af374edad86a5` |
| `emoji/emoji-data.txt` | `80d00f8e616a0ef27fd6b8de3b758c06383b5d917e2977709578e68baf733bf1` |
| `LICENSE.txt` | `e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96` |

The Common Lisp generator [fulltext-unicode-tables.lisp](../../../tools/fulltext-unicode-tables.lisp)
produces [unicode-tables.lisp](../../../src/fulltext/unicode-tables.lisp), SHA256
`334d8f05af5ebdd5bbcfddc96af61af95e02208b23eeebf381269a9e4cbe14a9`.
This command verifies reproducibility without changing source:

```sh
sbcl --script tools/fulltext-unicode-tables.lisp --check data/unicode/18.0.0/ src/fulltext/unicode-tables.lisp
```

Tables include L/N categories, combining classes, canonical decompositions,
composition exclusions, C/F case folding, Word_Break, and Extended_Pictographic.
Hangul uses the standard's algorithm. Normalization and Word_Break corpora are read
by ASDF tests; running them requires neither downloading data nor network access.
