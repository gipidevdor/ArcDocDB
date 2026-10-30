<a id="lettura-diretta-delle-stringhe-cbor"></a>

# Direct reading of CBOR strings

`arcdocdb.cbor:leggi-stringa-cbor-minima` returns the MT2/3 type and
the payload range in the original buffer. The caller can thus
use bytes or verified UTF-8 text without an intermediate copy.

```lisp
(leggi-stringa-cbor-minima buffer start end :max-bytes 16777216)
;; => MAJOR, PAYLOAD-START, NEXT
```

The string must have definite length and a minimal header. MT3 text
must be valid UTF-8; MT2 bytes are opaque. The function returns
exactly three fixnums, even for an empty payload. For `61 61 FF`, with
START0 and END3, the result is `3,1,2`: byte FF stays in the tail.

MAX-BYTES limits the entire authorized window END-START, including the
tail. The maximum limit is 16MiB. The simple u8 buffer must remain stable
during the call and while the returned range is in use. Multiple
workers can read it together; the function owns no scratch.

The [preregistered method](cbor-stringa-lettura-metodo.md) specifies errors,
precedence, and limits; the [preserved results](cbor-stringa-lettura-risultati.md)
report corpus, parallelism, measurements, and coverage.
The existing minimal reader checks the header;
before UTF-8, the entire payload is checked for availability. There is no
conversion to a Common Lisp string, normalization, or document-profile
choice. REQ-CBR-009 is a local codec requirement; C1/MC/DC qualification
and overall document limits remain open.
