(:schema-version 1 :kind :ci-collection-counts :status :observed
 :archive "spikes/results/2026-10-17-ci-implementazione/"
 :user-selected-files 134 :indexed-files 136 :actual-files 138 :processes 19
 :authoritative-source "collection/report.lisp"
 :independent-source "collection/closed-check.log"
 :preparation-stdout (:files 1 :processes 1 :status :non-authoritative)
 :explanation "Il preparatore stampa la lunghezza delle teste dopo NREVERSE: il display vale 1. Il manifesto passato al collector contiene l'intera lista; il collector e il checker indipendente verificano 136 file indicizzati, 138 presenti e 19 processi. Gli originali non sono riscritti."
 :limits (:counts-from-closed-collector :preparation-display-bug-observed))
