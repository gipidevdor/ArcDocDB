<a id="decisioni-del-pianificatore-di-inventario"></a>

# Inventory-planner decisions

Read with [contract](inventario.md) and [method](inventario-metodo.md).
Missing forms and branches, including private guards, remain in the
raw `sb-cover` denominator. The table claims neither MC/DC nor approved exceptions.

| Function / check | Cases |
|---|---|
| `check-inventory-budgets`: each `index` budget | valid, zero, negative, beyond fixnum, separately |
| physical files `> max-files` | equal, greater; precedence over invalid entries/duplicates |
| required `1+CLOSED > max-segments` | equal, greater; missing CLOSED included |
| sum of `index` counts | internal arithmetic guard, no exclusion |
| `inventory-presence`: descriptor, form, repeated name | valid/invalid; tmp/final; equal duplicate/two forms |
| presence cardinality within physical files | guard after coalescing |
| `inventory-ids`: positive ACTIVE, valid CLOSED, bound, mask | private guards; union of missing live IDs; ID0/high/max |
| `single-file-action`: state/name | ACTIVE/CLOSED/REMOVED/UNKNOWN × temporary/final; next-id irrelevant |
| `check-single-file-action`: delete ⇒ removed or unknown temporary; rename ⇒ live | individual states in matrix; proof guards, internal errors not excluded |
| `inventory-entry`: four masks | absent only live; tmp, final, both; conflict takes precedence |
| `inventory-entry`: ID, state, and entry form equal verified inputs | decision ownership/consistency guard, no exclusion |
| `entry-severity`: missing or conflict, state | ACTIVE2, CLOSED1, others0; use/rename/delete/anomaly0 |
| `entry-severity`: missing ⇒ live; positive severity ⇒ missing/conflict | consistency guards, no exclusion |
| `pianifica-riconciliazione`: maximum severity and consumption | FAULTED dominates DEGRADED; all permutations; consumption guard |
| `azione-riconciliazione`: interval0..count−1 | valid first/last, invalid negative and count |

Membership conditions `:active`/`:closed` and `:missing`/`:conflict`
are tested separately in the matrix. Chained comparisons
check range and bound. Argument/slot types are always-active pre/postconditions;
guards check relations among cardinalities and transitions.
