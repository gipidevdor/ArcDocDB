(:SCHEMA-VERSION 1 :KIND :ROUTING-LATEST-METADATA-PROJECTION :COMMAND
 (:REPORT
  #A((148) BASE-CHAR
     . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713646-command-11645-0/report.lisp")
  :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :SOURCE-COUNT 683
  :WALL-SECONDS 185.668746d0 :COMMAND
  (#A((3) BASE-CHAR . "env")
   #A((200) BASE-CHAR
      . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/latest-fasl/\") :ignore-inherited-configuration)")
   #A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core"))
  :NAMED-TESTS 854 :SMOKE 2 :SUITE-SUMMARIES
  ("28 test XXH64 superati." "28 test delle fondazioni superati."
   "17 test UTF-8 superati." "17 test degli header CBOR superati."
   "15 test delle testate CBOR minime superati."
   "24 test della struttura CBOR superati."
   "22 test della struttura CBOR minima superati."
   "17 test della scrittura degli header CBOR minimi superati."
   "21 test della scrittura delle stringhe CBOR minime superati."
   "20 test del registro CSN superati." "43 test snapshot/CSN superati."
   "34 test epoche/reclaim superati."
   "30 test dei compiti di lettura superati."
   "19 test del contratto GET per benchmark superati."
   "89 test delle code writer superati."
   "44 test dei metadati storage superati." "18 test I/O superati."
   "95 test recovery superati." "48 test WAL superati."
   "88 test del controller Serie superati."
   "64 test degli slot indice v2 superati."
   "73 test dell'indice primario superati.")
  :GATE-LINES
  ("build e test: nessun avviso, tutti i controlli superati"
   "Snapshot: fixture processi conservate in /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713667-snapshot-self-test-12113-0/report.lisp"
   "Reader: fixture processi conservate in /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713667-reader-self-test-12119-0/report.lisp"
   "10 spike completati; risultati: /private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/")
  :STDOUT-BYTES 221811 :STDERR-BYTES 407320 :STDERR-WARNING-LINES NIL)
 :AUXILIARY
 ((:REPORT
   #A((159) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713667-snapshot-self-test-12113-0/report.lisp")
   :KIND :SNAPSHOT-PROCESS-SELF-TEST :STATUS :PASSED :WORKER-ERRORS 2 :CHILDREN
   ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT
     NIL)
    (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXIT-CODE 7 :SIGNAL NIL
     :TIMED-OUT NIL)))
  (:REPORT
   #A((157) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713667-reader-self-test-12119-0/report.lisp")
   :KIND :READER-PROCESS-SELF-TEST :STATUS :PASSED :WORKER-ERRORS 2 :CHILDREN
   ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT
     NIL)
    (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXIT-CODE 7 :SIGNAL NIL
     :TIMED-OUT NIL))))
 :SPIKES
 ((:REPORT
   #A((146) BASE-CHAR
      . "/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/report.lisp")
   :STATUS :COMPLETE :RUNS
   ((:ID "SPK-01" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-02" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-03" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-04" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-05" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-06" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-07" :STATUS :PASS :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-08" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-09" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)
    (:ID "SPK-10" :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE
     :STDERR-BYTES 0)))))
