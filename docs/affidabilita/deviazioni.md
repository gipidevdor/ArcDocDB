<a id="registro-delle-deviazioni"></a>

# Deviation register

A deviation is an approved departure from the [coding standard](standard-di-codifica.md)
or an ADR. Allowed only with all fields completed and the author's approval.

| Field | Contents |
|---|---|
| ID | `DEV-nnn`, stable |
| Rule | ID of the waived rule |
| Where | module and function |
| Why | justification, with measurement if performance-related |
| Risk | what could go wrong |
| Compensation | additional check or verification |
| Approval | date and person |

<a id="deviazioni-approvate"></a>

## Approved deviations

None.

<a id="registro-dei-percorsi-caldi-con-safety-2-speed-3"></a>

## Hot-path register for `(safety 2) (speed 3)`

A function enters this register only with a measurement (SPK) showing that `(safety 3)`
fails to meet the minimum performance of [ADR-0028](../adr/0028-target-e-obiettivi-di-latenza.md);
it retains all type and bounds checks.

No functions registered.
