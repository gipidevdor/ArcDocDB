(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-DEVELOPMENT :VERSION "2026-10-13" :PART 2 :PARTS 2
 :SOURCES
 ((:PATH
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/coverage-attempt-08/dd4bf8b2b8edd81119c4be3fc81516a4.html")
   :BYTES 12442 :SHA256 "c502165111601e88997aa1d1368f54de508e05c74dae3afa92d87d4a16855ee4"
   :GIT-BLOB "7f0a127825332998afff98320550ca6932bf6d58" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/read.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>46</td><td>46</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>10</td><td>10</td><td>100.0</td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;lettura&#160;e&#160;controllo&#160;esclusivi&#160;del&#160;thread&#160;scheduler&#160;creatore&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;nessuno&#59;&#160;il&#160;risultato&#160;non&#160;pubblica&#160;uno&#160;stato&#160;mutabile&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008&#160;REQ&#45;AFF&#45;013</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;controllore&#45;pool&#41;&#160;null&#41;&#160;&#37;check&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;&#37;check&#45;pool&#160;&#40;controller&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;oggetto&#160;locale&#46;&#160;Post&#58;&#160;owner&#44;&#160;target&#160;e&#160;clock&#160;coerenti&#160;senza&#160;mutazione&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>INVALID&#45;ARGUMENT&#160;&#58;POOL&#45;OWNER&#59;&#160;INVARIANT&#45;VIOLATION&#160;&#58;POOL&#45;STATE&#160;per&#160;stato&#160;interno&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;controllore&#45;pool&#45;owner&#160;controller&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>sb&#45;thread&#58;&#42;current&#45;thread&#42;</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;owner&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;&#60;&#61;&#160;</span><span class='state-1'>&#40;controllore&#45;pool&#45;minimum&#160;controller&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>&#40;controllore&#45;pool&#45;target&#160;controller&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span><span class='state-5'>&#160;&#160;&#160;&#160;</span><span class='state-1'>&#40;controllore&#45;pool&#45;maximum&#160;controller&#41;</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;&#60;&#61;&#160;</span><span class='state-1'>&#40;controllore&#45;pool&#45;since&#160;controller&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>&#40;controllore&#45;pool&#45;last&#160;controller&#41;</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>&#160;&#160;nil&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008&#160;REQ&#45;AFF&#45;013</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;controllore&#45;pool&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;pool&#45;workers&#160;pool&#45;signal&#160;pool&#45;signal&#160;pool&#45;signal</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;or&#160;null&#160;pool&#45;tick&#41;&#160;pool&#45;direction&#160;&#40;or&#160;null&#160;pool&#45;tick&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#38;optional&#41;&#41;&#160;leggi&#45;controllore&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;leggi&#45;controllore&#45;pool&#160;&#40;controller&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;esclusivo&#46;&#160;Post&#58;&#160;target&#44;&#160;EWMA&#160;queue&#47;CPU&#47;P99&#160;scala&#160;256&#44;&#160;last&#44;&#160;candidate&#44;&#160;since&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>Clock&#160;NIL&#160;prima&#160;del&#160;primo&#160;campione&#59;&#160;nessuna&#160;allocazione&#160;di&#160;snapshot&#160;o&#160;mutazione&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>Propaga&#160;controllo&#160;tipizzato&#160;dell&#39;owner&#160;e&#160;delle&#160;invarianti&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#37;check&#45;pool&#160;controller&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;values&#160;&#40;controllore&#45;pool&#45;target&#160;controller&#41;&#160;&#40;controllore&#45;pool&#45;queue&#160;controller&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>31</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;controllore&#45;pool&#45;cpu&#160;controller&#41;&#160;&#40;controllore&#45;pool&#45;p99&#160;controller&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>32</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;if&#160;</span><span class='state-5'>&#40;controllore&#45;pool&#45;initialized&#160;controller&#41;</span><span class='state-1'>&#160;&#40;controllore&#45;pool&#45;last&#160;controller&#41;&#160;nil&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>33</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;controllore&#45;pool&#45;candidate&#160;controller&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>34</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;if&#160;</span><span class='state-5'>&#40;controllore&#45;pool&#45;initialized&#160;controller&#41;</span><span class='state-1'>&#160;&#40;controllore&#45;pool&#45;since&#160;controller&#41;&#160;nil&#41;&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/coverage-experiment.lisp")
   :BYTES 2731 :SHA256 "c693aad373006fd99fb37a31af13cb71b663e78676c1a8f77c8c52e6ba3849c2" :GIT-BLOB
   "2c060bbc50f386c23e650d7c0fa8e36a1af9ba9b" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :pool-coverage-reader-library *features*)
(let* ((args (uiop:command-line-arguments))
       (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool coverage runner: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (c) (error c))) (style-warning (lambda (c) (error c))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-measure/pool-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure))
        (error \"COD-01 pool coverage reader: compilation failed.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.POOL.COVERAGE.READER\" \"COVERAGE-READER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (c)
                           (unless (typep c 'sb-kernel:redefinition-warning) (error c)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t)
    ;; Startup sorgente misurato una volta: include definizioni e defaults nello stesso scope.
    ;; Nessun contatore SB-COVER viene scritto o escluso dal denominatore.
    (dolist (path '(\"src/scheduler/package.lisp\" \"src/scheduler/types.lisp\"
                    \"src/scheduler/build.lisp\" \"src/scheduler/read.lisp\"
                    \"src/scheduler/policy.lisp\" \"src/scheduler/update.lisp\"))
      (load (merge-pathnames path root))))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path) (search \"/src/scheduler/\" path)))))
    (unless html (error \"COD-60 pool coverage runner: source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.POOL.COVERAGE.READER\" \"AUDIT-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory))))
")
  (:PATH
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/coverage-inspect-branches.lisp")
   :BYTES 3895 :SHA256 "505325d6bd5afe2dab0d2593e45053c59a131fc670488f8d9a3c159742699834" :GIT-BLOB
   "4d6047e0e1fa97d3a9b947fb677fb91a4a37ccf3" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :pool-coverage-reader-library *features*)
;; SBCL2.6.9 conserva weak references ai code-component: le definizioni startup
;; gia eseguite possono sparire nel GC ASDF prima di REPORT. Il checkpoint pubblico
;; trasferisce i mark osservati, senza scrivere bit, cancellarli o cambiare scope.
(defvar *pool-compile-coverage* nil)
(defmethod asdf:perform :after ((operation asdf:compile-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/scheduler/\" (namestring (asdf:component-pathname component)))
    (setf *pool-compile-coverage* (sb-cover:save-coverage))))
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/scheduler/\" (namestring (asdf:component-pathname component)))
    (when *pool-compile-coverage* (sb-cover:merge-coverage *pool-compile-coverage*))
    (when (search \"/types.lisp\" (namestring (asdf:component-pathname component)))
      (dolist (weak (cdr sb-c::*code-coverage-info*))
        (dotimes (index (sb-int:weak-vector-len weak))
          (let ((code (sb-int:weak-vector-ref weak index)))
            (when code
              (multiple-value-bind (map ignored) (sb-cover::%find-coverage-map code)
                (declare (ignore ignored))
                (when (some (lambda (paths) (member '(:then 3 6 6) paths :test #'equal)) map)
                  (format t \"~&BRANCH-COMPONENT name=~S map=~S hit=~S~%\"
                          (sb-kernel:%simple-fun-name (sb-kernel:%code-entry-point code 0))
                          map (sb-cover:get-coverage code)))))))))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments))
       (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool coverage runner: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (c) (error c))) (style-warning (lambda (c) (error c))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-measure/pool-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure))
        (error \"COD-01 pool coverage reader: compilation failed.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.POOL.COVERAGE.READER\" \"COVERAGE-READER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (c)
                           (unless (typep c 'sb-kernel:redefinition-warning) (error c)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path) (search \"/src/scheduler/\" path)))))
    (unless html (error \"COD-60 pool coverage runner: source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.POOL.COVERAGE.READER\" \"AUDIT-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory))))
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/coverage-inspect.lisp")
   :BYTES 3931 :SHA256 "726e7ba33b06612537c833bc7af7b52c8f6030482feb945089c3ff1baf1f827f" :GIT-BLOB
   "93ec5fbe4d02f041db290db4d99fcf91d9079a5d" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :pool-coverage-reader-library *features*)
;; SBCL2.6.9 conserva weak references ai code-component: le definizioni startup
;; gia eseguite possono sparire nel GC ASDF prima di REPORT. Il checkpoint pubblico
;; trasferisce i mark osservati, senza scrivere bit, cancellarli o cambiare scope.
(defvar *pool-compile-coverage* nil)
(defmethod asdf:perform :after ((operation asdf:compile-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/scheduler/\" (namestring (asdf:component-pathname component)))
    (setf *pool-compile-coverage* (sb-cover:save-coverage))))
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/scheduler/\" (namestring (asdf:component-pathname component)))
    (when *pool-compile-coverage* (sb-cover:merge-coverage *pool-compile-coverage*))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments))
       (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool coverage runner: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (c) (error c))) (style-warning (lambda (c) (error c))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-measure/pool-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure))
        (error \"COD-01 pool coverage reader: compilation failed.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.POOL.COVERAGE.READER\" \"COVERAGE-READER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (c)
                           (unless (typep c 'sb-kernel:redefinition-warning) (error c)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (dolist (name '(\"%MAKE-CONTROLLORE-POOL\" \"CONTROLLLORE-POOL-CPU\" \"CONTROLLORE-POOL-P99\"))
    (let ((symbol (find-symbol name \"ARCDOCDB.SCHEDULER\")))
      (when (and symbol (fboundp symbol))
        (multiple-value-bind (map code)
            (funcall (symbol-function (find-symbol \"%FIND-COVERAGE-MAP\" \"SB-COVER\")) symbol)
          (declare (ignore code))
          (format t \"~&MAP ~A ~S~%HIT ~S~%\" name map (sb-cover:get-coverage symbol))))))
  (let ((symbol (find-symbol \"CONTROLLORE-POOL-CPU\" \"ARCDOCDB.SCHEDULER\")))
    (multiple-value-bind (map code)
        (funcall (symbol-function (find-symbol \"%FIND-COVERAGE-MAP\" \"SB-COVER\"))
                 (fdefinition (list 'setf symbol)))
      (declare (ignore code)) (format t \"~&MAP SETF CPU ~S~%\" map)))
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path) (search \"/src/scheduler/\" path)))))
    (unless html (error \"COD-60 pool coverage runner: source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.POOL.COVERAGE.READER\" \"AUDIT-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory))))
")
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/coverage-run.lisp")
   :BYTES 2775 :SHA256 "712915d5f5579940f502533d9864bc76be96cde11f2f910473d6dd4ae09de505" :GIT-BLOB
   "470b0cf16d37f4fc4a728ca562ef074136839d0a" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :pool-coverage-reader-library *features*)
;; SBCL2.6.9 conserva weak references ai code-component: le definizioni startup
;; gia eseguite possono sparire nel GC ASDF prima di REPORT. Il checkpoint pubblico
;; trasferisce i mark osservati, senza scrivere bit, cancellarli o cambiare scope.
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/scheduler/\" (namestring (asdf:component-pathname component)))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments))
       (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool coverage runner: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (c) (error c))) (style-warning (lambda (c) (error c))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-measure/pool-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure))
        (error \"COD-01 pool coverage reader: compilation failed.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.POOL.COVERAGE.READER\" \"COVERAGE-READER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (c)
                           (unless (typep c 'sb-kernel:redefinition-warning) (error c)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path) (search \"/src/scheduler/\" path)))))
    (unless html (error \"COD-60 pool coverage runner: source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.POOL.COVERAGE.READER\" \"AUDIT-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory))))
")
  (:PATH
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/pool-coverage-reader.lisp")
   :BYTES 13784 :SHA256 "c8e43520ad2a71d406069c6f5692f52a9e80198f7c60e4d0b9109a8b121db55b"
   :GIT-BLOB "c4550d1601f4d739bbf47ddf788a6971e31000a6" :TEXT
   ";;;; C4: native/HTML concordance for whole Scheduler, no exclusions or missing-path removal.
;;;; Preserves every missing native index/path; no inference of MC/DC.
;;;; --self-test | --audit native-state.lisp cover-index.html new-report.lisp
;;;; Library feature: :pool-coverage-reader-library. All inputs are trusted recorder data.
(eval-when (:compile-toplevel :load-toplevel :execute) (require :asdf))
(defpackage #:arcdocdb.pool.coverage.reader (:use #:cl))
(in-package #:arcdocdb.pool.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))

(defparameter +scope-files+
  '(\"src/scheduler/package.lisp\" \"src/scheduler/types.lisp\" \"src/scheduler/build.lisp\"
    \"src/scheduler/read.lisp\" \"src/scheduler/policy.lisp\" \"src/scheduler/update.lisp\"))

(defun reader-require (predicate detail)
  \"A malformed sensor input is a COD-60 failure, never a discarded native row.\"
  (unless predicate (error \"COD-60 pool-coverage-reader.lisp: ~A.\" detail)))

(defun source-identity (path)
  \"Keeps module namespaces; NIL means outside the explicit whole-module scope.\"
  (reader-require (stringp path) \"source path is not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (uiop:string-prefix-p \"src/scheduler/\" identity)
          identity)))))

(defun native-row (entry)
  \"Counts every native datum and preserves unhit expression/branch identities, with positions.\"
  (reader-require (and (consp entry) (consp (cdr entry))) \"native entry shape\")
  (reader-require (and (vectorp (cadr entry)) (vectorp (cddr entry))) \"native arrays missing\")
  (reader-require (= (length (cadr entry)) (length (cddr entry))) \"native path/bit length mismatch\")
  (let ((eh 0) (et 0) (bh 0) (bt 0) (missing nil))
    (loop for path across (cadr entry) for bit across (cddr entry) for index from 0
          do (reader-require (listp path) \"native path is not a list\")
             (reader-require (member bit '(0 1)) \"native coverage value is not a bit\")
             (if (member (car path) '(:then :else))
                 (progn (incf bt) (incf bh bit))
                 (progn (incf et) (incf eh bit)))
             (when (= bit 0)
               (push (list :native-index index
                           :kind (if (member (car path) '(:then :else)) :branch :expression)
                           :path path) missing)))
    (list :file (or (source-identity (car entry)) (car entry))
          :expressions-hit eh :expressions-total et :branches-hit bh :branches-total bt
          :missing (nreverse missing))))

(defun row-counts (row)
  \"A row retains its full source identity plus hit/total counts, without rounding.\"
  (list (getf row :file) (getf row :expressions-hit) (getf row :expressions-total)
        (getf row :branches-hit) (getf row :branches-total)))

(defun read-native (path)
  \"One trusted native datum only; reader evaluation is always disabled.\"
  (let ((*read-eval* nil) (eof (gensym \"EOF\")))
    (with-open-file (stream path :external-format :utf-8)
      (let ((value (read stream nil eof)))
        (reader-require (and (not (eq value eof)) (listp value)) \"native top-level list missing\")
        (reader-require (eq eof (read stream nil eof)) \"trailing native datum\")
        value))))

(defun scope-native-rows (raw)
  \"Every file in either scope is included; duplicate canonical identities are rejected.\"
  (let ((rows nil) (seen (make-hash-table :test 'equal)))
    (dolist (entry raw)
      (reader-require (and (consp entry) (stringp (car entry))) \"native source identity missing\")
      (let ((identity (source-identity (car entry))))
        (when identity
          (reader-require (not (gethash identity seen)) \"duplicate native source identity\")
          (setf (gethash identity seen) t)
          (push (native-row entry) rows))))
    (sort rows #'string< :key (lambda (row) (getf row :file)))))

(defun html-cells (row)
  \"Strict extraction of bounded TD cells from one trusted SB-COVER TR fragment.\"
  (let ((cursor 0) (cells nil))
    (loop for start = (search \"<td\" row :start2 cursor) while start
          do (let ((body (position #\\> row :start start))
                   (close (search \"</td>\" row :start2 start)))
               (reader-require (and body close (< body close)) \"HTML TD delimiters missing\")
               (push (subseq row (1+ body) close) cells)
               (setf cursor (+ close 5))))
    (nreverse cells)))

(defun html-source-name (cell)
  \"Requires exactly one source link; returns its undecorated basename.\"
  (let* ((start (search \"<a \" cell))
         (body (when start (position #\\> cell :start start)))
         (close (when body (search \"</a>\" cell :start2 body))))
    (reader-require (and start body close (< body close)) \"HTML source link missing\")
    (reader-require (not (search \"<a \" cell :start2 (+ close 4))) \"duplicate HTML source link\")
    (let ((name (subseq cell (1+ body) close)))
      (reader-require (and (plusp (length name)) (not (find #\\/ name))
                           (not (find #\\< name)) (not (find #\\> name))) \"HTML source basename invalid\")
      name)))

(defun html-count (cell)
  \"Only a nonnegative decimal integer is a coverage count; percentages are not read.\"
  (let ((clean (string-trim '(#\\Space #\\Tab #\\Return #\\Newline) cell)))
    (reader-require (and (plusp (length clean)) (every (lambda (c) (digit-char-p c 10)) clean))
                    \"HTML count is not a decimal integer\")
    (parse-integer clean :radix 10)))

(defun html-data-counts (row directory)
  \"SB-COVER summary schema: source, expression covered/total/percent, branch covered/total/percent.\"
  (let ((cells (html-cells row)))
    (reader-require (= 7 (length cells)) \"HTML summary row does not have seven cells\")
    (let ((result (list (concatenate 'string directory (html-source-name (first cells)))
                        (html-count (second cells)) (html-count (third cells))
                        (html-count (fifth cells)) (html-count (sixth cells)))))
      (reader-require (and (<= (second result) (third result)) (<= (fourth result) (fifth result)))
                      \"HTML covered count exceeds denominator\")
      result)))

(defun html-count-rows (html)
  \"Reads actual HTML counts by module heading; equal basenames in two scopes stay distinct.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (html-cells row))
                           (identity (and (= 1 (length cells)) (source-identity (first cells)))))
                      (setf directory (when (member identity '(\"src/scheduler/\")
                                                    :test #'equal) identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (html-data-counts row directory)) (identity (first counts)))
                      (reader-require (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (push counts rows)))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun count-total (counts)
  \"Sums all four exact integer columns; no approved exclusion or estimated denominator.\"
  (loop for column from 1 to 4 collect (loop for row in counts sum (nth column row))))

(defun select-counts (counts prefix)
  \"Selects a named entire module/subset after the full inventory has been validated.\"
  (remove-if-not (lambda (row) (uiop:string-prefix-p prefix (first row))) counts))

(defun c3-pass-p (totals)
  \"Gate senza arrotondamenti: denominatori nonzero, percentuale inclusiva95.\"
  (and (plusp (second totals)) (plusp (fourth totals))
       (>= (* 100 (first totals)) (* 95 (second totals)))
       (>= (* 100 (third totals)) (* 95 (fourth totals)))))

(defun audit-coverage (native-path html-path output-path)
  \"Intero package: concordanza nativo/HTML, gate95% esatto, mancanti conservati.\"
  (let* ((raw (read-native native-path)) (rows (scope-native-rows raw))
         (counts (mapcar #'row-counts rows))
         (html-counts (html-count-rows (uiop:read-file-string html-path :external-format :utf-8)))
         (files (mapcar #'first counts)) (expected (sort (copy-list +scope-files+) #'string<))
         (totals (count-total counts)))
    (reader-require (equal files expected) \"native full-scope file inventory differs\")
    (reader-require (equal counts html-counts) \"native/HTML file identity or counts differ\")
    (reader-require (and (plusp (second totals)) (plusp (fourth totals))) \"zero denominator\")
    (let* ((passed (c3-pass-p totals))
           (report (list :schema-version 1 :kind :pool-coverage-audit
                         :status (if passed :ok :failed) :scope :entire-scheduler
                         :native-path (namestring (pathname native-path))
                         :html-path (namestring (pathname html-path))
                         :files rows :scheduler-total totals :minimum-percent 95
                         :html-counts html-counts :html-counts-origin :parsed-sb-cover-index
                         :self-test :passed :exclusions nil :mcdc-inferred nil)))
      (with-open-file (stream output-path :direction :output :if-exists :error :external-format :utf-8)
        (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
      (reader-require passed \"C3 expressions or branches below 95%; exact missing paths in report\")
      (format t \"~&Coverage audit PASS: ~D files; scheduler ~S~%\" (length files) totals)
      report)))

(defun expect-rejection (thunk)
  \"A negative fixture must signal; silent acceptance is a sensor defect.\"
  (reader-require (handler-case (progn (funcall thunk) nil) (error () t)) \"negative fixture accepted\"))

(defun native-self-test ()
  \"Independent hit/denominator/missing-path oracle plus malformed length/bit fixtures.\"
  (let ((row (native-row (list* \"/fixture/src/scheduler/types.lisp\"
                               #((0) (1) (:then 2) (:else 2)) #*1010))))
    (reader-require (equal (row-counts row) '(\"src/scheduler/types.lisp\" 1 2 1 2)) \"native count oracle\")
    (reader-require (equal (getf row :missing)
                           '((:native-index 1 :kind :expression :path (1))
                             (:native-index 3 :kind :branch :path (:else 2)))) \"native missing-path oracle\"))
  (dolist (entry (list (list* \"bad-length\" #((0)) #*00)
                      (list* \"bad-bit\" #((0) (1)) #(0 2))
                      (list* \"bad-path\" #(1) #*0)))
    (expect-rejection (lambda () (native-row entry))))
  (expect-rejection
   (lambda () (scope-native-rows (list (list* \"/a/src/scheduler/types.lisp\" #((0)) #*0)
                                      (list* \"/b/src/scheduler/types.lisp\" #((1)) #*1)))))
  :passed)

(defun html-self-test ()
  \"Conteggi precisi nel modulo intero; input duplicato o difforme rifiutato.\"
  (let* ((heading \"<tr class='subheading'><td colspan='7'>/fixture/src/scheduler/</td></tr>\")
         (row \"<tr class='odd'><td class='text-cell'><a href='fixture.html'>types.lisp</a></td><td>1</td><td>2</td><td>50.0</td><td>3</td><td>4</td><td>75.0</td></tr>\")
         (expected '((\"src/scheduler/types.lisp\" 1 2 3 4))))
    (reader-require (equal (html-count-rows (concatenate 'string heading row)) expected)
                    \"HTML count/namespace oracle\")
    (expect-rejection (lambda () (html-count-rows (concatenate 'string heading row row))))
    (expect-rejection (lambda () (html-count-rows \"<tr class='subheading'>\")))
    (expect-rejection (lambda () (html-data-counts \"<td>missing</td>\" \"src/scheduler/\")))
    (expect-rejection (lambda () (html-count \"-1\")))
    (expect-rejection (lambda () (html-count \"1.5\")))
    (expect-rejection (lambda () (html-source-name \"<a href='f'>nested/file.lisp</a>\"))))
  :passed)

(defun coverage-reader-self-test ()
  \"All fixtures must detect malformed input before any campaign report is written.\"
  (native-self-test) (html-self-test)
  (reader-require (and (c3-pass-p '(95 100 95 100)) (c3-pass-p '(19 20 19 20))
                       (not (c3-pass-p '(94 100 100 100)))
                       (not (c3-pass-p '(100 100 94 100)))
                       (not (c3-pass-p '(0 0 0 0)))) \"C3 gate positive/negative exact oracle\")
  (reader-require (equal (count-total '((\"one\" 1 2 3 4) (\"two\" 5 6 7 8))) '(6 8 10 12))
                  \"aggregate count oracle\")
  :passed)

(defun coverage-reader-main ()
  \"CLI C4: explicit diagnostics and nonzero exit for every failed verification.\"
  (handler-case
      (let ((args (uiop:command-line-arguments)))
        (coverage-reader-self-test)
        (cond ((equal args '(\"--self-test\")) (format t \"~&Coverage reader self-test PASS~%\"))
              ((and (= 4 (length args)) (string= \"--audit\" (first args)))
               (audit-coverage (second args) (third args) (fourth args)))
              (t (error \"COD-61 pool-coverage-reader.lisp: use --self-test or --audit native html new-report.\"))))
    (error (condition)
      (format *error-output* \"~&pool-coverage-reader.lisp: ~A~%\" condition)
      (uiop:quit 1))))

(unless (member :pool-coverage-reader-library *features*) (coverage-reader-main))
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/reader-attempt-01.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/reader-attempt-01.stdout")
   :BYTES 320 :SHA256 "8c7c5262d3fa59f99920c26e6a648d904cc44636049537a4cc0ab7da07cd520d" :GIT-BLOB
   "4739c597e8bbb2fdff689812e799077d39fb840e" :TEXT
   "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/pool-coverage-reader.lisp\" (written 13 OCT 2026 08:32:16 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/reader-attempt-01.fasl
; compilation finished in 0:00:00.142
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/reader-attempt-02.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/reader-attempt-02.stdout")
   :BYTES 320 :SHA256 "cdd24bdaff1c69b59c210d8590fb3d306ee473867edf319c250954edf6e8785b" :GIT-BLOB
   "f5a368b316da5441186204c3284606c7d76d552f" :TEXT
   "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/pool-coverage-reader.lisp\" (written 13 OCT 2026 08:38:58 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/reader-attempt-02.fasl
; compilation finished in 0:00:00.154
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/tool-attempt-01.stderr")
   :BYTES 47772 :SHA256 "93089dd9207f7f2829676f7e596a90ffc03617149b18c0194bca19a5bfc984c5"
   :GIT-BLOB "0ccf6c88276f67374a38d2d3f688c3feb44d77b9" :TEXT "
; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/pool-controller-bench.lisp
; in: DEFUN FINGERPRINTS
;     (COERCE (SB-MD5:MD5SUM-FILE ARCDOCDB.POOL-CONTROLLER.BENCH::PATH) 'LIST)
; 
; note: unable to
;   optimize
; because:
;   upgraded array element type not known at compile time

; in: DEFUN REFERENCE-TRACE
;     (= ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET 1)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a DOUBLE-FLOAT.
; 
; note: unable to open code because: The operands might not be the same type.

;     (+ ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN 4 17 4 11)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.

;     (= ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET 8)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a DOUBLE-FLOAT.
; 
; note: unable to open code because: The operands might not be the same type.

;     (= ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET 1)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a DOUBLE-FLOAT.
; 
; note: unable to open code because: The operands might not be the same type.

;     (1+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a RATIONAL.

;     (MIN 8 (1+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a (OR (REAL * 9) (INTEGER 10)), not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a (OR (REAL * 9) (INTEGER 10)), not a DOUBLE-FLOAT.

;     (* 3 ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET)
; 
; note: unable to
;   convert x*2^k to shift
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a INTEGER.

;     (FLOOR (* 3 ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET) 4)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR (REAL * 24) (INTEGER 27)), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR (REAL * 24) (INTEGER 27)), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR (REAL * 24) (INTEGER 27)), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR (REAL * 24) (INTEGER 27)), not a RATIONAL.
; 
; note: unable to
;   convert division by 2^k to shift
; due to type uncertainty:
;   The first argument is a (OR (REAL * 24) (INTEGER 27)), not a INTEGER.

;     (+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;        (ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION-TOKEN
;         ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;        ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8)
;                               (INTEGER 9)), not a RATIONAL.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR (REAL * 39) (INTEGER 40)), not a RATIONAL.

;     (INCF ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN
;           (+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;              (ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION-TOKEN
;               ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;              ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE))
; ==>
;   (+
;    (+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;       (ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION-TOKEN
;        ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;       ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE)
;    ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a REAL, not a RATIONAL.
;   The second argument is a REAL, not a RATIONAL.

;     (* 7 ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -7) (INTEGER 0 0) (INTEGER 7))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -7) (INTEGER 0 0) (INTEGER 7))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ (* 7 ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE)
;        (* 256 ARCDOCDB.POOL-CONTROLLER.BENCH::VALUE))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER * -7) (INTEGER 0 0) (INTEGER 7)), not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR (INTEGER * -7) (INTEGER 0 0) (INTEGER 7)), not a (UNSIGNED-BYTE
;                                                                                     64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (< ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE 256)
; 
; note: forced to do <-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.

;     (* 3 ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8) (INTEGER 9)), not a FIXNUM.
;       The result is a (VALUES (OR (REAL * 24) (INTEGER 27)) &OPTIONAL), not a (VALUES
;                                                                                FIXNUM
;                                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8) (INTEGER 9)), not a FIXNUM.
;       The result is a (VALUES (OR (REAL * 24) (INTEGER 27)) &OPTIONAL), not a (VALUES
;                                                                                FIXNUM
;                                                                                &OPTIONAL).
;       etc.

;     (MAX 1 (FLOOR (* 3 ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET) 4))
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.

;     (1+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8) (INTEGER 9)), not a FIXNUM.
;       The result is a (VALUES (OR (REAL * 9) (INTEGER 10)) &OPTIONAL), not a (VALUES
;                                                                               FIXNUM
;                                                                               &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8) (INTEGER 9)), not a (UNSIGNED-BYTE
;                                                                                       64).
;       The result is a (VALUES (OR (REAL * 9) (INTEGER 10)) &OPTIONAL), not a (VALUES
;                                                                               (UNSIGNED-BYTE
;                                                                                64)
;                                                                               &OPTIONAL).
;       etc.

;     (MIN 8 (1+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (OR (REAL * 9) (INTEGER 10)), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (OR (REAL * 9) (INTEGER 10)), not a (UNSIGNED-BYTE
;                                                                    64).
;       etc.

;     (+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;        (ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION-TOKEN
;         ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;        ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8) (INTEGER 9)), not a FIXNUM.
;       The result is a (VALUES (OR (REAL * 39) (INTEGER 40)) &OPTIONAL), not a (VALUES
;                                                                                FIXNUM
;                                                                                &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR (FLOAT * (8.0)) (RATIONAL * 8) (INTEGER 9)), not a (UNSIGNED-BYTE
;                                                                                       64).
;       The result is a (VALUES (OR (REAL * 39) (INTEGER 40)) &OPTIONAL), not a (VALUES
;                                                                                (UNSIGNED-BYTE
;                                                                                 64)
;                                                                                &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (REAL * 39) (INTEGER 40)), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR (REAL * 39) (INTEGER 40)), not a (UNSIGNED-BYTE
;                                                                     64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN
;           (+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;              (ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION-TOKEN
;               ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;              ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE))
; ==>
;   (+
;    (+ ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;       (ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION-TOKEN
;        ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;       ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE)
;    ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN)
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a REAL, not a SINGLE-FLOAT.
;       The second argument is a REAL, not a SINGLE-FLOAT.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                              &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The second argument is a REAL, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN 4 17 4 11)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a REAL, not a FIXNUM.
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a REAL, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES REAL &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFUN VERIFY-STATE
;     (FUNCALL READ ARCDOCDB.POOL-CONTROLLER.BENCH::CONTROLLER)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   READ is not known to be a function

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::A ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a SINGLE-FLOAT.
;   The second argument is a T, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a DOUBLE-FLOAT.
;   The second argument is a T, not a DOUBLE-FLOAT.

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::B ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a SINGLE-FLOAT.
;   The second argument is a T, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a DOUBLE-FLOAT.
;   The second argument is a T, not a DOUBLE-FLOAT.

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::C ARCDOCDB.POOL-CONTROLLER.BENCH::CPU)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a SINGLE-FLOAT.
;   The second argument is a T, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a DOUBLE-FLOAT.
;   The second argument is a T, not a DOUBLE-FLOAT.

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::D ARCDOCDB.POOL-CONTROLLER.BENCH::P99)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a SINGLE-FLOAT.
;   The second argument is a T, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a DOUBLE-FLOAT.
;   The second argument is a T, not a DOUBLE-FLOAT.

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::E ARCDOCDB.POOL-CONTROLLER.BENCH::TICK)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a SINGLE-FLOAT.
;   The second argument is a T, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a DOUBLE-FLOAT.
;   The second argument is a T, not a DOUBLE-FLOAT.

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::G ARCDOCDB.POOL-CONTROLLER.BENCH::SINCE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a SINGLE-FLOAT.
;   The second argument is a T, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a DOUBLE-FLOAT.
;   The second argument is a T, not a DOUBLE-FLOAT.

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::A ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (SIGNED-BYTE 64).
;       The second argument is a T, not a (SIGNED-BYTE 64).

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::B ARCDOCDB.POOL-CONTROLLER.BENCH::QUEUE)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (SIGNED-BYTE 64).
;       The second argument is a T, not a (SIGNED-BYTE 64).

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::C ARCDOCDB.POOL-CONTROLLER.BENCH::CPU)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (SIGNED-BYTE 64).
;       The second argument is a T, not a (SIGNED-BYTE 64).

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::D ARCDOCDB.POOL-CONTROLLER.BENCH::P99)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (SIGNED-BYTE 64).
;       The second argument is a T, not a (SIGNED-BYTE 64).

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::E ARCDOCDB.POOL-CONTROLLER.BENCH::TICK)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (SIGNED-BYTE 64).
;       The second argument is a T, not a (SIGNED-BYTE 64).

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::G ARCDOCDB.POOL-CONTROLLER.BENCH::SINCE)
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (SIGNED-BYTE 64).
;       The second argument is a T, not a (SIGNED-BYTE 64).

; in: DEFUN CREATE-CYCLE
;     (LENGTH ARCDOCDB.POOL-CONTROLLER.BENCH::ROWS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;          (SVREF ARCDOCDB.POOL-CONTROLLER.BENCH::ROW 1))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a SINGLE-FLOAT.
;   The second argument is a T, not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a T, not a DOUBLE-FLOAT.
;   The second argument is a T, not a DOUBLE-FLOAT.
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       unable to do inline (signed-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (SIGNED-BYTE 64).
;       The second argument is a T, not a (SIGNED-BYTE 64).

;     (+ (THE FIXNUM ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET)
;        (ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION-TOKEN
;         ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;        (THE FIXNUM (SVREF ARCDOCDB.POOL-CONTROLLER.BENCH::ROW 3)))
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -4611686018427387893 4611686018427387934), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775797 9223372036854775837)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -4611686018427387893 4611686018427387934), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775797 9223372036854775837)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (LET* ((ARCDOCDB.POOL-CONTROLLER.BENCH::ROW
;             (SVREF ARCDOCDB.POOL-CONTROLLER.BENCH::ROWS
;                    ARCDOCDB.POOL-CONTROLLER.BENCH::INDEX))
;            (ARCDOCDB.POOL-CONTROLLER.BENCH::TICK
;             (+ ARCDOCDB.POOL-CONTROLLER.BENCH::OFFSET
;                ARCDOCDB.POOL-CONTROLLER.BENCH::INDEX 1))
;            (ARCDOCDB.POOL-CONTROLLER.BENCH::VALUE
;             (IF (< ARCDOCDB.POOL-CONTROLLER.BENCH::INDEX
;                    ARCDOCDB.POOL-CONTROLLER.BENCH::+PHASE-LENGTH+)
;                 128
;                 0))
;            (ARCDOCDB.POOL-CONTROLLER.BENCH::SINCE
;             (+ ARCDOCDB.POOL-CONTROLLER.BENCH::OFFSET (THE FIXNUM #))))
;       (MULTIPLE-VALUE-BIND
;           (ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;            ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;           (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::UPDATE
;                    ARCDOCDB.POOL-CONTROLLER.BENCH::MAIN
;                    ARCDOCDB.POOL-CONTROLLER.BENCH::TICK
;                    ARCDOCDB.POOL-CONTROLLER.BENCH::VALUE 100 900
;                    (SVREF ARCDOCDB.POOL-CONTROLLER.BENCH::ROW 0))
;         (UNLESS
;             (AND (EQL ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET #)
;                  (EQ ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION #))
;           (ERROR
;            \"COD-60 tools/pool-controller-bench.lisp: decisione difforme al tick ~D.\"
;            ARCDOCDB.POOL-CONTROLLER.BENCH::TICK))
;         (ARCDOCDB.POOL-CONTROLLER.BENCH::VERIFY-STATE READ
;          ARCDOCDB.POOL-CONTROLLER.BENCH::MAIN
;          ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;          (SVREF ARCDOCDB.POOL-CONTROLLER.BENCH::ROW 3) 25600 230400
;          ARCDOCDB.POOL-CONTROLLER.BENCH::TICK
;          (SVREF ARCDOCDB.POOL-CONTROLLER.BENCH::ROW 4)
;          ARCDOCDB.POOL-CONTROLLER.BENCH::SINCE)
;         (INCF ARCDOCDB.POOL-CONTROLLER.BENCH::SINK
;               (+ (THE FIXNUM ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET)
;                  (ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION-TOKEN
;                   ARCDOCDB.POOL-CONTROLLER.BENCH::ACTION)
;                  (THE FIXNUM #)))))
; 
; note: doing signed word to integer coercion (cost 20) to TICK

;     (ARCDOCDB.POOL-CONTROLLER.BENCH::VERIFY-STATE READ
;      ARCDOCDB.POOL-CONTROLLER.BENCH::MAIN ARCDOCDB.POOL-CONTROLLER.BENCH::TARGET
;      (SVREF ARCDOCDB.POOL-CONTROLLER.BENCH::ROW 3) 25600 230400
;      ARCDOCDB.POOL-CONTROLLER.BENCH::TICK
;      (SVREF ARCDOCDB.POOL-CONTROLLER.BENCH::ROW 4)
;      ARCDOCDB.POOL-CONTROLLER.BENCH::SINCE)
; 
; note: doing signed word to integer coercion (cost 20)

; in: DEFUN SAMPLE-RECORD
;     (1- ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (/
;      (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;         (1- ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS))
;      2)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.
;   The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES INTEGER &REST T).
; 
; note: unable to
;   convert x/2^k to shift
; due to type uncertainty:
;   The first argument is a NUMBER, not a INTEGER.

;     (+
;      (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;         ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN)
;      (/
;       (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;          (1- ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS))
;       2))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;        ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (1- ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;        (1- ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+
;      (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;         ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN)
;      (/
;       (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;          (1- ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS))
;       2))
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a SINGLE-FLOAT.
;       The second argument is a NUMBER, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       The second argument is a NUMBER, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (LOGAND MOST-POSITIVE-FIXNUM
;             (+
;              (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;                 ARCDOCDB.POOL-CONTROLLER.BENCH::TOKEN)
;              (/
;               (* ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS
;                  (1- ARCDOCDB.POOL-CONTROLLER.BENCH::ITERATIONS))
;               2)))
; 
; note: forced to do LOGAND-WORD-MASK/INTEGER-UNSIGNED-C (cost 10)
;       unable to do inline fixnum arithmetic (cost 1) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       etc.

; in: DEFUN SAMPLE
;     (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::CLOCK)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   CLOCK is not known to be a function
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   CLOCK is not known to be a function

;     (- (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::CLOCK)
;        ARCDOCDB.POOL-CONTROLLER.BENCH::BEFORE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.
;   The second argument is a NUMBER, not a RATIONAL.

;     (ZEROP ARCDOCDB.POOL-CONTROLLER.BENCH::TICKS)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (PLUSP ARCDOCDB.POOL-CONTROLLER.BENCH::TICKS)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (>= ARCDOCDB.POOL-CONTROLLER.BENCH::TICKS 0)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (= ARCDOCDB.POOL-CONTROLLER.BENCH::SINK
;        (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::PROGRESS :EXPECTED-SINK))
; 
; note: unable to open code because: The operands might not be the same type.

;     (FUNCALL FUNCTION)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   FUNCTION is not known to be a function
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   FUNCTION is not known to be a function

;     (- (GET-BYTES-CONSED) ARCDOCDB.POOL-CONTROLLER.BENCH::HEAP-BEFORE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (- (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::CLOCK)
;        ARCDOCDB.POOL-CONTROLLER.BENCH::BEFORE)
; 
; note: forced to do full call
;       unable to do inline float arithmetic (cost 2) because:
;       The first argument is a T, not a SINGLE-FLOAT.
;       The second argument is a T, not a SINGLE-FLOAT.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES SINGLE-FLOAT
;                                                                &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The second argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (PLUSP ARCDOCDB.POOL-CONTROLLER.BENCH::TICKS)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (/ ARCDOCDB.POOL-CONTROLLER.BENCH::TICKS
;        (FLOAT INTERNAL-TIME-UNITS-PER-SECOND 1.0d0))
; 
; note: forced to do full call
;       unable to do inline float coercion (cost 2) because:
;       The first argument is a (OR (FLOAT (0.0)) (RATIONAL (0))), not a SINGLE-FLOAT.
;       unable to do inline float coercion (cost 5) because:
;       The first argument is a (OR (FLOAT (0.0)) (RATIONAL (0))), not a (UNSIGNED-BYTE
;                                                                         64).
;       etc.

;     (>= ARCDOCDB.POOL-CONTROLLER.BENCH::HEAP 0)
; 
; note: forced to do <-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.

;     (/ ARCDOCDB.POOL-CONTROLLER.BENCH::TICKS
;        (FLOAT INTERNAL-TIME-UNITS-PER-SECOND 1.0d0))
; 
; note: doing float to pointer coercion (cost 13)

; in: DEFUN CAMPAIGN
;     (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::CHECKPOINT)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   CHECKPOINT is not known to be a function
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   CHECKPOINT is not known to be a function

;     (ZEROP (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::PROGRESS :HEAP-BYTES))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

; in: DEFUN RUN-DRIVER
;     (LENGTH ARCDOCDB.POOL-CONTROLLER.BENCH::ARGS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (STRING= \"--bench\" (FIRST ARCDOCDB.POOL-CONTROLLER.BENCH::ARGS))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a (OR STRING SYMBOL CHARACTER), not a (SIMPLE-ARRAY
;                                                                 CHARACTER (*)).

;     (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::PRODUCT-LOADER)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   PRODUCT-LOADER is not known to be a function

;     (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::TESTER)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   TESTER is not known to be a function

;     (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::RUNNER
;              ARCDOCDB.POOL-CONTROLLER.BENCH::REPORT
;              (LAMBDA ()
;                (ARCDOCDB.POOL-CONTROLLER.BENCH::WRITE-REPORT
;                 ARCDOCDB.POOL-CONTROLLER.BENCH::REPORT DIRECTORY)))
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   RUNNER is not known to be a function

; in: DEFUN FRESH-SELF-TEST-DIRECTORY
;     (= SB-POSIX:EEXIST (SB-POSIX:SYSCALL-ERRNO CONDITION))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (LOOP ARCDOCDB.POOL-CONTROLLER.BENCH::FOR ARCDOCDB.POOL-CONTROLLER.BENCH::ATTEMPT ARCDOCDB.POOL-CONTROLLER.BENCH::BELOW 1000
;           ARCDOCDB.POOL-CONTROLLER.BENCH::FOR DIRECTORY = (MERGE-PATHNAMES
;                                                            (FORMAT NIL
;                                                                    \"arcdocdb-pool-controller-bench-~D-~D-~D/\"
;                                                                    (GET-UNIVERSAL-TIME)
;                                                                    (SB-POSIX:GETPID)
;                                                                    ARCDOCDB.POOL-CONTROLLER.BENCH::ATTEMPT)
;                                                            (UIOP/STREAM:TEMPORARY-DIRECTORY))
;           DO (HANDLER-CASE
;               (PROGN
;                (SB-POSIX:MKDIR (NAMESTRING DIRECTORY) 448)
;                (RETURN-FROM
;                    ARCDOCDB.POOL-CONTROLLER.BENCH::FRESH-SELF-TEST-DIRECTORY
;                  DIRECTORY))
;               (SB-POSIX:SYSCALL-ERROR (CONDITION)
;                                       (UNLESS (= SB-POSIX:EEXIST #)
;                                         (ERROR CONDITION)))))
; --> LET LET TAGBODY SB-LOOP::LOOP-DESETQ SETQ THE 1+ 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFUN SELF-TEST-REPORTER
;     (FUNCALL ARCDOCDB.POOL-CONTROLLER.BENCH::CHECKPOINT)
; 
; note: unable to
;   optimize away possible call to FDEFINITION at runtime
; because:
;   CHECKPOINT is not known to be a function

;     (= 1 (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::SAVED :CURRENT-REPLICA))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (LENGTH ARCDOCDB.POOL-CONTROLLER.BENCH::SAMPLES)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (= 7 (GETF (SECOND ARCDOCDB.POOL-CONTROLLER.BENCH::SAMPLES) :RAW-TICKS))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (= 11 (GETF (SECOND ARCDOCDB.POOL-CONTROLLER.BENCH::SAMPLES) :HEAP-BYTES))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

; in: DEFUN SELF-TEST-PARTIAL-SAMPLE
;     (= 1 (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::PROGRESS :COMPLETED-ITERATIONS))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (= 0 (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::PROGRESS :SINK))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (= 7 (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::PROGRESS :RAW-TICKS))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (>= (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::PROGRESS :HEAP-BYTES) 0)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (INCF ARCDOCDB.POOL-CONTROLLER.BENCH::CALLS)
; ==>
;   (+ 1 ARCDOCDB.POOL-CONTROLLER.BENCH::CALLS)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.POOL-CONTROLLER.BENCH::CLOCK 7)
; ==>
;   (+ 7 ARCDOCDB.POOL-CONTROLLER.BENCH::CLOCK)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 7) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 7) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

; in: DEFUN SELF-TEST-INVALID-INPUT
;     (TYPEP CONDITION (FIND-SYMBOL \"INVALID-ARGUMENT\" \"ARCDOCDB.CONDITIONS\"))
; 
; note: unable to optimize because: can't open-code test of non-constant type

; in: DEFUN SELF-TEST
;     (ZEROP (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::BASELINE :HEAP-BYTES))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (>= (GETF ARCDOCDB.POOL-CONTROLLER.BENCH::POSITIVE :HEAP-BYTES)
;         (* 16 1048576))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
; 
; compilation unit finished
;   printed 152 notes
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/tool-attempt-01.stdout")
   :BYTES 302 :SHA256 "7ce47a5f238f5e5cd0ce9bcdb9c364d6acd12a0c1c1c74fbe589d9afb02fc645" :GIT-BLOB
   "232d1c9621fc94b33b24a21d02178bf54489d87c" :TEXT
   "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/pool-controller-bench.lisp\" (written 13 OCT 2026 08:30:04 PM):


; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/tool-attempt-01.fasl
; compilation finished in 0:00:00.290
")
  (:PATH
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/tool-run.lisp")
   :BYTES 779 :SHA256 "fc1f08b150f6b6a9c417a53f8c5ed3e70671dbeaf12b9c937eb4ce23eb9a5cea" :GIT-BLOB
   "ba51868b595c46387791d663bf3a1cfdf34361a8" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-controller-bench-library *features*)
(asdf:initialize-output-translations
 `(:output-translations
   (,(merge-pathnames \"**/*.*\" (truename \"./\"))
    ,(merge-pathnames \"spikes/out/pool-measure/tool-cache/**/*.*\" (truename \"./\")))
   :ignore-inherited-configuration))
(handler-bind ((warning (lambda (c) (error c))) (style-warning (lambda (c) (error c))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/pool-controller-bench.lisp\"
                    :output-file \"spikes/out/pool-measure/tool-run.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01 tools/pool-controller-bench.lisp: compile-file failed.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-CONTROLLER.BENCH\" \"MAIN\")
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/tool-selftest-attempt-01.stderr")
   :BYTES 61 :SHA256 "c4e5211871cdfeebb03ab5c9a7b6e875c15d4efea704ba67ee86efd5267acbdb" :GIT-BLOB
   "b067add3c6a52a492bd5fd6a472ec48d6404e080" :TEXT
   "tools/pool-controller-bench.lisp: COD-61: sorgenti cambiati.
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-measure/tool-selftest-attempt-01.stdout")
   :BYTES 62117 :SHA256 "b3731c0ec6df514e9375fbf37989115f6ec16201857a3ad3c5a8806d909d8b68"
   :GIT-BLOB "6f5cb71af58d18e6ded23496f4e847cde6990998" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-BENCHMARK :STATUS :SOURCE-CHANGED
 :STAGE :COMPLETE :DIAGNOSTIC \"COD-61: sorgenti cambiati.\" :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((11) BASE-CHAR . \"--self-test\"))
 :TOOL-ARGUMENTS (#A((11) BASE-CHAR . \"--self-test\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"5bb9f8f4bd3fd41e9dc920de146b2994\"))
  (:FILE \"tools/pool-controller-bench.lisp\" :MD5
   #A((32) BASE-CHAR . \"a806e02bf65db453ca7ec1e11d4366c4\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3f19ffb4aacfdfe502c5e8b12a234f2\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"4233eef9d87bdec712d4f690bcb699a9\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8d26428a4e17ad18990b8ee7d5f5b53a\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3da469a7aa1e682dd8f2e516ee451de1\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"bd7182e9871fe82530d0c828e473ccde\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbfb17bf1f65698fb7c7889953d02d1e\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"716866194d6b9f076e102e84187229c0\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"9500cfb800603de002d6d2b24f1bf056\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c9380ad46a1d7acf41655aaed20db478\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"a5e7108e80664eb3b562fbd7e680801f\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"db8497f9cff35b1ee261f1f410f46ca6\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"37ace42844c11b52446ee1fc500b8e0b\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0c66cf5a309b86e055337a8e6213c2d\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"59e3c59c90d8d0fc5731b87496a785aa\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"056d2c6a67c9d9f2bf9fe2d2c348d53c\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0dfa785451fcfe573019531e00600cc6\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9a6a26ae45747211bb795bc323b13770\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"948bfe5924482cccb6624f91be6770e6\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4793e5b0e0192c0fe222351d6f1b599\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6acef83c6cda7e326fd10b4a1d6d6fa6\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"8abc0529f331d1fabdec79507cf296ef\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f38848c55b050dae335b0a37657c1f5c\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7d61509b2ce749fb2331ceeaeeca76\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4926899e278afdd9577e5ef8262ba835\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a71504598cda8e99cd50e229ddd5275b\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b6a6578f526b7d4bcc3a1665a8c6e6\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f868ebe4307ad4238b314c37eceed9a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"f452e0b5992689feac0d355859c83eca\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9dc4bd9590e323e5d717d96d37844b71\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"179fc8c8f9021b3e10d982be12215a01\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce845c57c825657e95c105d4a8fbfe9a\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d581e4d3087fb92a47e80b7c32d877ae\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"5bb9f8f4bd3fd41e9dc920de146b2994\"))
  (:FILE \"tools/pool-controller-bench.lisp\" :MD5
   #A((32) BASE-CHAR . \"a806e02bf65db453ca7ec1e11d4366c4\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3f19ffb4aacfdfe502c5e8b12a234f2\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"4233eef9d87bdec712d4f690bcb699a9\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8d26428a4e17ad18990b8ee7d5f5b53a\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3da469a7aa1e682dd8f2e516ee451de1\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"bd7182e9871fe82530d0c828e473ccde\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbfb17bf1f65698fb7c7889953d02d1e\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"716866194d6b9f076e102e84187229c0\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"9500cfb800603de002d6d2b24f1bf056\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c9380ad46a1d7acf41655aaed20db478\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"a5e7108e80664eb3b562fbd7e680801f\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"db8497f9cff35b1ee261f1f410f46ca6\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"37ace42844c11b52446ee1fc500b8e0b\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0c66cf5a309b86e055337a8e6213c2d\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"59e3c59c90d8d0fc5731b87496a785aa\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"056d2c6a67c9d9f2bf9fe2d2c348d53c\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0dfa785451fcfe573019531e00600cc6\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9a6a26ae45747211bb795bc323b13770\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"948bfe5924482cccb6624f91be6770e6\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4793e5b0e0192c0fe222351d6f1b599\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6acef83c6cda7e326fd10b4a1d6d6fa6\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"8abc0529f331d1fabdec79507cf296ef\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f38848c55b050dae335b0a37657c1f5c\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7d61509b2ce749fb2331ceeaeeca76\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4926899e278afdd9577e5ef8262ba835\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a71504598cda8e99cd50e229ddd5275b\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b6a6578f526b7d4bcc3a1665a8c6e6\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f868ebe4307ad4238b314c37eceed9a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"315df47f6ad75bf984a2dac29859e718\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a0224d0f0bb49ba73a82b9a6e6a71fa1\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"179fc8c8f9021b3e10d982be12215a01\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce845c57c825657e95c105d4a8fbfe9a\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d581e4d3087fb92a47e80b7c32d877ae\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\")))
 :SOURCE-CONSISTENCY :CHANGED :RECORDED-AT 4000905057 :SELF-TEST
 (:STATUS :OK :BASELINE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
   128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 40 :SECONDS 4.0d-5
   :TIME-QUALITY :MEASURED :SINK 8386560 :DIAGNOSTIC NIL :EXPECTED-SINK
   8386560)
  :POSITIVE-CONTROL
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 16 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 16 :HEAP-BYTES 16777472 :RAW-TICKS 64 :SECONDS 6.4d-5
   :TIME-QUALITY :MEASURED :SINK 16777336 :DIAGNOSTIC NIL :EXPECTED-SINK
   16777336)
  :WRONG-SINK-PROBE
  (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 2
   :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 1
   :SECONDS 1.0d-6 :TIME-QUALITY :MEASURED :SINK 3 :DIAGNOSTIC
   #A((50) BASE-CHAR . \"COD-60: heap/clock negativo o sink 3 diverso da 1.\")
   :EXPECTED-SINK 1)
  :ZERO-CLOCK-PROBE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 2 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 0 :SECONDS NIL
   :TIME-QUALITY :BELOW-RESOLUTION :SINK 1 :DIAGNOSTIC NIL :EXPECTED-SINK 1)
  :COMPOSED-API-PROBE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 93 :SECONDS 9.3d-5
   :TIME-QUALITY :MEASURED :SINK 10495254 :DIAGNOSTIC NIL :EXPECTED-SINK
   10495254)
  :INVALID-CLI :REJECTED :TARGET-ORACLE-POSITIVE-NEGATIVE :PASSED
  :INVALID-NON-HOT :PASSED :EXISTING-DESTINATION-AND-PARTIAL-RAW :PASSED
  :MEASURED-PARTIAL-RAW
  (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 4
   :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 1 :HEAP-BYTES 0 :RAW-TICKS 7
   :SECONDS 7.0d-6 :TIME-QUALITY :MEASURED :SINK 0 :DIAGNOSTIC
   #A((26) BASE-CHAR . \"fixture: misura interrotta\") :EXPECTED-SINK 6))
 :SAMPLES NIL :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :CONTROLLERS 3 :OWNER-THREADS 1 :CORES-INPUT 4
 :MINIMUM 1 :MAXIMUM 8 :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS 5
 :SAMPLES-PER-CYCLE 162 :TIMER-UNITS-PER-SECOND 1000000 :EXPECTED-CYCLE-TOKEN
 NIL :TRACE
 (:GROW-SAMPLES 80 :QUEUE 128 :CPU 100 :P99 900 :SHRINK-SAMPLES 80 :QUEUE 0
  :PENDING-ACTUAL 1 :PENDING-TARGET 4 :HOLD-CPU 900 :HOLD-TARGET 4)
 :TOKEN-FORMULA
 \"sum(target+action-token+queue-scaled) on 160 rows; pending=4+17; hold=4+11; sample=N*token+N*(N-1)/2\"
 :LIMITS
 (:SERIAL-OWNER :INJECTED-INPUTS :PREALLOCATED-TRACE :STARTUP-ERRORS-EXCLUDED
  :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF :EXTERNAL-LOAD-UNCONTROLLED
  :CLOCK-ZERO-IS-BELOW-RESOLUTION :NO-TIME-THRESHOLD-NO-TUNING-CLAIM
  :NO-POOL-WORKER-PARK-WAKE-CONTENTION-IO-DURABILITY-OR-RELEASE-QUALIFICATION))
")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/pre-coverage-tests.sha256")
   :BYTES 193 :SHA256 "54b96bc1c6ddefa4663ed3edfc8d54fbe169c3653f623f6908f99c10dc48e576" :GIT-BLOB
   "6df812f5ce9b582f551b0a5df3fa6b096513995e" :TEXT
   "d8aeec53062cccf036c693ff709baf1086e331f8a247a5693b82c0ff1c7a4401  tests/scheduler/support.lisp
04a223429449e26eae1a651e74b7b736e5952a08f1cee6aacf066c53c7ab0c7d  tests/scheduler/controller.lisp
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/scoped-attempt-1.log")
   :BYTES 202111 :SHA256 "e0ab699b0c8215182ddc8483675ee72b69466177cf3b4b40f5ebc6ab3a93c816"
   :GIT-BLOB "ab53344312d91aea70f59bc69a04950f124c81cd" :TEXT
   "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/package-tmpGHU3ALSV.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/package.lisp\" (written 11 OCT 2026 01:29:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/package-tmpAAURSO1.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/conditions.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/conditions-tmp5GEXGEG5.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/binary.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/binary-tmpAR3FSGEY.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/crc32c.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/crc32c-tmpJAIDFZTC.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/record.lisp\" (written 11 OCT 2026 01:29:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/record-tmp8V3J6PE9.fasl
; compilation finished in 0:00:00.123
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/batch.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/foundation/batch-tmp9V47YWQF.fasl
; compilation finished in 0:00:00.026
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/package.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/package-tmp9BN22RMA.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/arithmetic.lisp\" (written 11 OCT 2026 01:50:28 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/arithmetic.lisp
; in: DEFUN READ64
;     (DEFUN ARCDOCDB.HASH64::READ64 (ARCDOCDB.HASH64::BUFFER POSITION)
;       \"Pre: otto byte nello span verificato. Post: parola LE nativa nel codice inline.
;   Non restituita attraverso il confine pubblico; nessuna modifica del buffer.\"
;       (LOGIOR (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER POSITION)
;               (ASH
;                (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER (+ POSITION 4))
;                32)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::READ64
;         (ARCDOCDB.HASH64::BUFFER POSITION)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: otto byte nello span verificato. Post: parola LE nativa nel codice inline.
; Non restituita attraverso il confine pubblico; nessuna modifica del buffer.\"
;       (BLOCK ARCDOCDB.HASH64::READ64
;         (LOGIOR (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER POSITION)
;                 (ASH (ARCDOCDB.HASH64::READ32 ARCDOCDB.HASH64::BUFFER #) 32))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN ROTATE64
;     (DEFUN ARCDOCDB.HASH64::ROTATE64 (ARCDOCDB.HASH64::VALUE COUNT)
;       \"Pre: u64 e rotazione tra 1 e 63. Post: rotazione circolare modulo 2^64.
;   Helper inline; i chiamanti fissano COUNT a una costante dell'algoritmo.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (LOGIOR (ASH ARCDOCDB.HASH64::VALUE COUNT)
;                       (ASH ARCDOCDB.HASH64::VALUE (- COUNT 64)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::ROTATE64
;         (ARCDOCDB.HASH64::VALUE COUNT)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: u64 e rotazione tra 1 e 63. Post: rotazione circolare modulo 2^64.
; Helper inline; i chiamanti fissano COUNT a una costante dell'algoritmo.\"
;       (BLOCK ARCDOCDB.HASH64::ROTATE64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (LOGIOR (ASH ARCDOCDB.HASH64::VALUE COUNT)
;                         (ASH ARCDOCDB.HASH64::VALUE #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN ROUND64
;     (DEFUN ARCDOCDB.HASH64::ROUND64
;            (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       \"Pre: due u64. Post: round XXH64 modulo 2^64, puro e inline.
;   Overflow modulari intenzionali; nessun valore u64 attraversa la API pubblica.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (*
;                (ARCDOCDB.HASH64::ROTATE64 (LOGAND ARCDOCDB.HASH64::+MASK64+ #)
;                 31)
;                ARCDOCDB.HASH64::+PRIME1+)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::ROUND64
;         (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: due u64. Post: round XXH64 modulo 2^64, puro e inline.
; Overflow modulari intenzionali; nessun valore u64 attraversa la API pubblica.\"
;       (BLOCK ARCDOCDB.HASH64::ROUND64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (* (ARCDOCDB.HASH64::ROTATE64 # 31)
;                    ARCDOCDB.HASH64::+PRIME1+))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN MERGE64
;     (DEFUN ARCDOCDB.HASH64::MERGE64
;            (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       \"Pre: accumulatori u64. Post: convergenza XXH64 modulo 2^64, pura e inline.
;   Non segnala condizioni su argomenti conformi; non possiede risorse.\"
;       (LOGAND ARCDOCDB.HASH64::+MASK64+
;               (+
;                (* (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR #)
;                   ARCDOCDB.HASH64::+PRIME1+)
;                ARCDOCDB.HASH64::+PRIME4+)))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::MERGE64
;         (ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::LANE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: accumulatori u64. Post: convergenza XXH64 modulo 2^64, pura e inline.
; Non segnala condizioni su argomenti conformi; non possiede risorse.\"
;       (BLOCK ARCDOCDB.HASH64::MERGE64
;         (LOGAND ARCDOCDB.HASH64::+MASK64+
;                 (+ (* # ARCDOCDB.HASH64::+PRIME1+) ARCDOCDB.HASH64::+PRIME4+))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN AVALANCHE64
;     (DEFUN ARCDOCDB.HASH64::AVALANCHE64 (ARCDOCDB.HASH64::VALUE)
;       \"Pre: u64. Post: diffusione finale XXH64 modulo 2^64, pura e inline.
;   Non segnala condizioni su argomenti conformi; nessun risultato boxed pubblico.\"
;       (LET ((ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::VALUE))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;         (SETF ARCDOCDB.HASH64::ACCUMULATOR (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;         (SETF ARCDOCDB.HASH64::ACCUMULATOR (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;         (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR
;                 (ASH ARCDOCDB.HASH64::ACCUMULATOR -32))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::AVALANCHE64
;         (ARCDOCDB.HASH64::VALUE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: u64. Post: diffusione finale XXH64 modulo 2^64, pura e inline.
; Non segnala condizioni su argomenti conformi; nessun risultato boxed pubblico.\"
;       (BLOCK ARCDOCDB.HASH64::AVALANCHE64
;         (LET ((ARCDOCDB.HASH64::ACCUMULATOR ARCDOCDB.HASH64::VALUE))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #)
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #)
;           (LOGXOR ARCDOCDB.HASH64::ACCUMULATOR
;                   (ASH ARCDOCDB.HASH64::ACCUMULATOR -32)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/arithmetic-tmp1CXFJSK9.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/blocks.lisp\" (written 11 OCT 2026 01:50:28 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/blocks.lisp
; in: DEFUN HASH-BLOCKS
;     (= POSITION (+ ARCDOCDB.HASH64::START (* 32 (ASH ARCDOCDB.HASH64::SIZE -5))))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (DEFUN ARCDOCDB.HASH64::HASH-BLOCKS
;            (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE
;             ARCDOCDB.HASH64::SEED)
;       #<(SIMPLE-ARRAY CHARACTER
;          (264)) Pre: span verificato, SIZE>=32, seme u64. Post: digest dei blocchi completi da 32 byte.
;   Al massimo floor(65535/32) iterazioni; helper inline, input immutato, nessuna risorsa.
;   INVARIANT-VIOLATION :hash... {80073866BF}>
;       (UNLESS
;           (AND (>= ARCDOCDB.HASH64::SIZE 32)
;                (<= (+ ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE)
;                    (LENGTH ARCDOCDB.HASH64::BUFFER)))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                :HASH-BLOCK-SPAN))
;       (LET ((ARCDOCDB.HASH64::V1 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (ARCDOCDB.HASH64::V2 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::SEED)
;             (ARCDOCDB.HASH64::V4 (LOGAND ARCDOCDB.HASH64::+MASK64+ #))
;             (POSITION ARCDOCDB.HASH64::START))
;         (DECLARE
;          (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::V1 ARCDOCDB.HASH64::V2
;           ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::V4)
;          (TYPE ARCDOCDB.BINARY:INDEX POSITION))
;         (DOTIMES (ARCDOCDB.HASH64::I (ASH ARCDOCDB.HASH64::SIZE -5))
;           (SETF ARCDOCDB.HASH64::V1 #
;                 ARCDOCDB.HASH64::V2 #
;                 ARCDOCDB.HASH64::V3 #
;                 ARCDOCDB.HASH64::V4 #)
;           (INCF POSITION 32))
;         (UNLESS (= POSITION (+ ARCDOCDB.HASH64::START #))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-BLOCK-PROGRESS))
;         (LET ((ARCDOCDB.HASH64::ACCUMULATOR #))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::ACCUMULATOR))
;           (SETF ARCDOCDB.HASH64::ACCUMULATOR #
;                 ARCDOCDB.HASH64::ACCUMULATOR #
;                 ARCDOCDB.HASH64::ACCUMULATOR #)
;           (ARCDOCDB.HASH64::MERGE64 ARCDOCDB.HASH64::ACCUMULATOR
;                                     ARCDOCDB.HASH64::V4))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::HASH-BLOCKS
;         (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::SIZE
;          ARCDOCDB.HASH64::SEED)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          264) Pre: span verificato, SIZE>=32, seme u64. Post: digest dei blocchi completi da 32 byte.
; Al massimo floor(65535/32) iterazioni; helper inline, input immutato, nessuna risorsa.
; INVARIANT-VIOLATION :hash... {80073898FF}>
;       (BLOCK ARCDOCDB.HASH64::HASH-BLOCKS
;         (UNLESS (AND (>= ARCDOCDB.HASH64::SIZE 32) (<= # #))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-BLOCK-SPAN))
;         (LET ((ARCDOCDB.HASH64::V1 #)
;               (ARCDOCDB.HASH64::V2 #)
;               (ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::SEED)
;               (ARCDOCDB.HASH64::V4 #)
;               (POSITION ARCDOCDB.HASH64::START))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::V1 ARCDOCDB.HASH64::V2
;             ARCDOCDB.HASH64::V3 ARCDOCDB.HASH64::V4)
;            (TYPE ARCDOCDB.BINARY:INDEX POSITION))
;           (DOTIMES (ARCDOCDB.HASH64::I #) (SETF #) (INCF POSITION 32))
;           (UNLESS (= POSITION #)
;             (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                    :HASH-BLOCK-PROGRESS))
;           (LET (#)
;             (DECLARE #)
;             (SETF #)
;             (ARCDOCDB.HASH64::MERGE64 ARCDOCDB.HASH64::ACCUMULATOR
;                                       ARCDOCDB.HASH64::V4)))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN HASH-TAIL
;     (DEFUN ARCDOCDB.HASH64::HASH-TAIL
;            (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;             ARCDOCDB.HASH64::ACCUMULATOR)
;       #<(SIMPLE-ARRAY CHARACTER
;          (252)) Pre: span residuo verificato, da 0 a 31 byte; accumulatore include lunghezza totale.
;   Post: coda XXH64, pura e inline. Al massimo tre lane da 8, una da 4 e tre byte.
;   INVARIANT-VIOLATION :hash-tail-span... {800791DBFF}>
;       (UNLESS
;           (AND
;            (<= ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;                (LENGTH ARCDOCDB.HASH64::BUFFER))
;            (<= (- ARCDOCDB.HASH64::END ARCDOCDB.HASH64::START) 31))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :HASH-TAIL-SPAN))
;       (LET ((POSITION ARCDOCDB.HASH64::START)
;             (ARCDOCDB.HASH64::VALUE ARCDOCDB.HASH64::ACCUMULATOR))
;         (DECLARE (TYPE ARCDOCDB.BINARY:INDEX POSITION)
;                  (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::VALUE))
;         (DOTIMES (ARCDOCDB.HASH64::I (ASH # -3))
;           (SETF ARCDOCDB.HASH64::VALUE #
;                 ARCDOCDB.HASH64::VALUE #)
;           (INCF POSITION 8))
;         (WHEN (<= 4 (- ARCDOCDB.HASH64::END POSITION))
;           (SETF ARCDOCDB.HASH64::VALUE #
;                 ARCDOCDB.HASH64::VALUE #)
;           (INCF POSITION 4))
;         (LOOP ARCDOCDB.HASH64::WHILE (< POSITION ARCDOCDB.HASH64::END)
;               DO (SETF ARCDOCDB.HASH64::VALUE #
;                        ARCDOCDB.HASH64::VALUE #) (INCF POSITION))
;         (UNLESS (= POSITION ARCDOCDB.HASH64::END)
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-TAIL-PROGRESS))
;         ARCDOCDB.HASH64::VALUE))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.HASH64::HASH-TAIL
;         (ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END
;          ARCDOCDB.HASH64::ACCUMULATOR)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          252) Pre: span residuo verificato, da 0 a 31 byte; accumulatore include lunghezza totale.
; Post: coda XXH64, pura e inline. Al massimo tre lane da 8, una da 4 e tre byte.
; INVARIANT-VIOLATION :hash-tail-span... {800791E2AF}>
;       (BLOCK ARCDOCDB.HASH64::HASH-TAIL
;         (UNLESS
;             (AND (<= ARCDOCDB.HASH64::START ARCDOCDB.HASH64::END #) (<= # 31))
;           (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                  :HASH-TAIL-SPAN))
;         (LET ((POSITION ARCDOCDB.HASH64::START)
;               (ARCDOCDB.HASH64::VALUE ARCDOCDB.HASH64::ACCUMULATOR))
;           (DECLARE (TYPE ARCDOCDB.BINARY:INDEX POSITION)
;                    (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.HASH64::VALUE))
;           (DOTIMES (ARCDOCDB.HASH64::I #) (SETF #) (INCF POSITION 8))
;           (WHEN (<= 4 #) (SETF #) (INCF POSITION 4))
;           (LOOP ARCDOCDB.HASH64::WHILE (< POSITION ARCDOCDB.HASH64::END)
;                 DO (SETF #) (INCF POSITION))
;           (UNLESS (= POSITION ARCDOCDB.HASH64::END)
;             (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                    :HASH-TAIL-PROGRESS))
;           ARCDOCDB.HASH64::VALUE)))
; 
; note: doing unsigned word to integer coercion (cost 20) from VALUE to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/blocks-tmpX4BRKI0R.fasl
; compilation finished in 0:00:00.025
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/hash64.lisp\" (written 11 OCT 2026 01:50:28 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/hash64.lisp
; in: DEFUN XXH64
;     (ARCDOCDB.HASH64::HASH-BLOCKS ARCDOCDB.HASH64::BUFFER ARCDOCDB.HASH64::START
;                                   ARCDOCDB.HASH64::SIZE ARCDOCDB.HASH64::SEED)
; --> BLOCK LET UNLESS IF = 
; ==>
;   1
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/hash/hash64-tmpQ371UGST.fasl
; compilation finished in 0:00:00.030
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/package-tmp2OWI3Q7U.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/utf8.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/utf8.lisp
; in: DEFUN VERIFICA-UTF8
;     (LOOP ARCDOCDB.UTF8::REPEAT ARCDOCDB.UTF8::SPAN
;           DO (WHEN (= ARCDOCDB.UTF8::CURSOR ARCDOCDB.UTF8::LIMIT)
;                (RETURN)) (SETF ARCDOCDB.UTF8::CURSOR
;                                  (ARCDOCDB.UTF8::VERIFICA-CARATTERE-UTF8
;                                   ARCDOCDB.UTF8::BYTES ARCDOCDB.UTF8::CURSOR
;                                   ARCDOCDB.UTF8::LIMIT)) (INCF COUNT) (UNLESS
;                                                                           (<=
;                                                                            COUNT
;                                                                            (-
;                                                                             ARCDOCDB.UTF8::CURSOR
;                                                                             ARCDOCDB.UTF8::BEGIN))
;                                                                         (ERROR
;                                                                          'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION
;                                                                          :REASON
;                                                                          :UTF8-COUNT
;                                                                          :OFFSET
;                                                                          ARCDOCDB.UTF8::CURSOR)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/utf8-tmp9KKTJMYV.fasl
; compilation finished in 0:00:00.021
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-package.lisp\" (written 13 OCT 2026 08:20:19 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-package-tmpJU0JWO19.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-header.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-header.lisp
; in: DEFUN LEGGI-INDEFINITO-HEADER-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MAJOR :OFFSET
;            ARCDOCDB.CBOR::START)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-header-tmpZX2WN8N4.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-float-minimal.lisp\" (written 09 OCT 2026 06:21:35 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-float-minimal.lisp
; in: DEFUN BINARY32-ACCORCIABILE-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT32-FIELDS)
; 
; note: deleting unreachable code

; in: DEFUN BINARY64-ALLINEATO-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT64-SHIFT)
; 
; note: deleting unreachable code

; in: DEFUN BINARY64-ACCORCIABILE-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-FLOAT64-FIELDS)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-float-minimal-tmpOU81XRV0.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-minimal.lisp\" (written 09 OCT 2026 06:21:35 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-minimal.lisp
; in: DEFUN ARGOMENTO-MINIMO-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MINIMAL-AI)
; 
; note: deleting unreachable code

; in: DEFUN FLOAT-ACCORCIABILE-HEADER-CBOR-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-MINIMAL-AI)
; 
; note: deleting unreachable code

; in: DEFUN LEGGI-HEADER-CBOR-MINIMO
;     (< ARCDOCDB.CBOR::START ARCDOCDB.CBOR::NEXT)
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a T, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-minimal-tmpY2ML9CFA.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-space.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-space.lisp
; in: DEFUN CREA-SPAZIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-WORKSPACE-CAPACITY)
; 
; note: deleting unreachable code

; in: DEFUN AZZERA-SPAZIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-WORKSPACE-CAPACITY)
; 
; note: deleting unreachable code
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-space-tmpX2JYJDQE.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-input.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-input.lisp
; in: DEFUN CHECK-INPUT-STRUTTURA-CBOR
;     (> ARCDOCDB.CBOR::SPAN ARCDOCDB.CBOR::MAX-BYTES)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The second argument is a T, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The second argument is a T, not a (UNSIGNED-BYTE 64).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-input-tmpOPCILR65.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-stack.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-stack.lisp
; in: DEFUN TIPO-FRAME-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-STACK-TOP)
; 
; note: deleting unreachable code

; in: DEFUN INIZIA-FIGLIO-CBOR
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :CBOR-CHILD-KIND)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-stack-tmpRV9F8A9A.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-items.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-items-tmpK2ZAJT4I.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan.lisp
; in: DEFUN VERIFICA-STRUTTURA-CBOR-INTERNA
;     (LOOP ARCDOCDB.CBOR::REPEAT ARCDOCDB.CBOR::SPAN
;           DO (WHEN
;                  (ARCDOCDB.CBOR::SVUOTA-FRAME-CBOR ARCDOCDB.CBOR::SCRATCH
;                                                    ARCDOCDB.CBOR::LIMIT)
;                (RETURN)) (ARCDOCDB.CBOR::PASSO-STRUTTURA-CBOR
;                           ARCDOCDB.CBOR::BYTES ARCDOCDB.CBOR::SCRATCH
;                           ARCDOCDB.CBOR::LIMIT ARCDOCDB.CBOR::NODE-LIMIT
;                           ARCDOCDB.CBOR::DEPTH-LIMIT ARCDOCDB.CBOR::MINIMAL))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-tmpUX5S4ADN.fasl
; compilation finished in 0:00:00.014
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-minimal.lisp\" (written 11 OCT 2026 12:35:07 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-scan-minimal-tmp10401X32.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-write.lisp\" (written 11 OCT 2026 01:29:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-write-tmpZ7CBRM0G.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-string-write.lisp\" (written 11 OCT 2026 02:56:31 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-string-write.lisp
; in: DEFUN CHECK-SPAN-STRING-CBOR-WRITE
;     (= (+ ARCDOCDB.CBOR::START ARCDOCDB.CBOR::SPAN) ARCDOCDB.CBOR::END)
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the second argument of IF-EQ

; in: DEFUN CHECK-INPUT-STRING-CBOR-WRITE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :CBOR-STRING-SELECTION)
; 
; note: deleting unreachable code

; in: DEFUN COPIA-STRINGA-CBOR-WRITE
;     (LOOP ARCDOCDB.CBOR::REPEAT ARCDOCDB.CBOR::SPAN
;           DO (SETF (AREF ARCDOCDB.CBOR::BUFFER ARCDOCDB.CBOR::CURSOR)
;                      (AREF ARCDOCDB.CBOR::SOURCE
;                            ARCDOCDB.CBOR::READ-CURSOR)) (INCF
;                                                          ARCDOCDB.CBOR::CURSOR) (INCF
;                                                                                  ARCDOCDB.CBOR::READ-CURSOR))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; in: DEFUN SCRIVI-STRINGA-CBOR-MINIMA
;     (= ARCDOCDB.CBOR::PAYLOAD-START
;        (+ ARCDOCDB.CBOR::BEGIN ARCDOCDB.CBOR::HEADER-SIZE))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-string-write-tmp9OZEQ0G2.fasl
; compilation finished in 0:00:00.033
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-simple-write.lisp\" (written 13 OCT 2026 08:20:19 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-simple-write.lisp
; in: DEFUN CHECK-INPUT-SIMPLE-CBOR-WRITE
;     (= (+ ARCDOCDB.CBOR::START ARCDOCDB.CBOR::SPAN) ARCDOCDB.CBOR::END)
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the second argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/codec/cbor-simple-write-tmpB2JTL1W9.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/csn/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/csn/package-tmpP3BI68WQ.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/csn/registry.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/csn/registry.lisp
; in: DEFUN %CHECK-TOKEN-CSN
;     (=
;      (AREF (ARCDOCDB.CSN::REGISTRO-CSN-HIGHS ARCDOCDB.CSN::REGISTRY)
;            ARCDOCDB.CSN::SLOT)
;      ARCDOCDB.CSN::HIGH)
; 
; note: unable to open code because: The operands might not be the same type.

;     (=
;      (AREF (ARCDOCDB.CSN::REGISTRO-CSN-LOWS ARCDOCDB.CSN::REGISTRY)
;            ARCDOCDB.CSN::SLOT)
;      ARCDOCDB.CSN::LOW)
; 
; note: unable to open code because: The operands might not be the same type.

; in: DEFUN %FRONTIERA-RISOLTA-CSN
;     (INCF COUNT)
; ==>
;   (+ 1 COUNT)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/csn/registry-tmpQDARA81Z.fasl
; compilation finished in 0:00:00.041
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/package.lisp\" (written 11 OCT 2026 01:29:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/package-tmpYEMMM7SE.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/types.lisp\" (written 11 OCT 2026 01:29:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/types-tmp73HU0RPK.fasl
; compilation finished in 0:00:00.030
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/build.lisp\" (written 11 OCT 2026 01:29:38 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/build.lisp
; in: DEFUN POTENZA-DUE-CACHE-P
;     (PLUSP NUMBER)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.

;     (1- NUMBER)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (LOGAND NUMBER (1- NUMBER))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; in: DEFUN PAYLOAD-CLASSE-CACHE
;     (* ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::+CACHE-WAYS+
;        (+ ARCDOCDB.CACHE::SIZE 29))
; 
; note: forced to do full call
;       unable to do inline ASH (cost 1) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline ASH (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+ ARCDOCDB.CACHE::SIZE 29)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (* ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::+CACHE-WAYS+
;        (+ ARCDOCDB.CACHE::SIZE 29))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8)), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8)), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       etc.

;     (+
;      (* ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::+CACHE-WAYS+
;         (+ ARCDOCDB.CACHE::SIZE 29))
;      ARCDOCDB.CACHE::SETS
;      (* 8 (MIN ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES)))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (MIN ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (* 8 (MIN ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES))
; 
; note: forced to do full call
;       unable to do inline ASH (cost 1) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline ASH (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8))
;                               &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (+
;      (* ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::+CACHE-WAYS+
;         (+ ARCDOCDB.CACHE::SIZE 29))
;      ARCDOCDB.CACHE::SETS
;      (* 8 (MIN ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES)))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8)), not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a (OR (INTEGER * -8) (INTEGER 0 0) (INTEGER 8)), not a (UNSIGNED-BYTE
;                                                                                      64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFUN PREFLIGHT-CACHE
;     (INCF ARCDOCDB.CACHE::ACTIVE)
; ==>
;   (+ 1 ARCDOCDB.CACHE::ACTIVE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (+ 8
;        (ARCDOCDB.CACHE::PAYLOAD-CLASSE-CACHE ARCDOCDB.CACHE::SIZE
;         ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (INCF ARCDOCDB.CACHE::PAYLOAD
;           (+ 8
;              (ARCDOCDB.CACHE::PAYLOAD-CLASSE-CACHE ARCDOCDB.CACHE::SIZE
;               ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES)))
; ==>
;   (+
;    (+ 8
;       (ARCDOCDB.CACHE::PAYLOAD-CLASSE-CACHE ARCDOCDB.CACHE::SIZE
;        ARCDOCDB.CACHE::SETS ARCDOCDB.CACHE::STRIPES))
;    ARCDOCDB.CACHE::PAYLOAD)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (<= ARCDOCDB.CACHE::PAYLOAD ARCDOCDB.CACHE::BUDGET)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/build-tmpIO5N7K88.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/core.lisp\" (written 11 OCT 2026 01:29:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/core-tmpCM21U60Z.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/read.lisp\" (written 11 OCT 2026 03:20:19 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/read-tmp9DT7SEFG.fasl
; compilation finished in 0:00:00.039
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/clock.lisp\" (written 11 OCT 2026 01:29:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/clock-tmp8065ESJT.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/write.lisp\" (written 11 OCT 2026 01:29:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/cache/write-tmp7S8Z6FGF.fasl
; compilation finished in 0:00:00.023
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/package.lisp\" (written 11 OCT 2026 02:47:54 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/package-tmpSIT3QPKP.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/queue.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/queue-tmpE0PA0714.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/writer.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/writer-tmpJRWHHVG0.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/handoff.lisp\" (written 11 OCT 2026 02:49:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/handoff.lisp
; in: DEFUN %CHECK-PROGRAMMABILE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WRITER-SCHEDULING)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/handoff-tmp4WZVROCX.fasl
; compilation finished in 0:00:00.018
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/ready-types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/ready-types-tmpA0I3UKX8.fasl
; compilation finished in 0:00:00.022
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/ready.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/ready.lisp
; in: DEFUN PRELEVA-WRITER-PRONTO
;     (1+ ARCDOCDB.EXECUTION::CURSOR)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                               (INTEGER 35184372088832
;                                4611686018427387903)), not a RATIONAL.

;     (MOD (1+ ARCDOCDB.EXECUTION::CURSOR) ARCDOCDB.EXECUTION::SIZE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a RATIONAL.

;     (1+ ARCDOCDB.EXECUTION::CURSOR)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                               (INTEGER 35184372088832
;                                4611686018427387903)), not a RATIONAL.

;     (MOD (1+ ARCDOCDB.EXECUTION::CURSOR) ARCDOCDB.EXECUTION::SIZE)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a SINGLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a DOUBLE-FLOAT.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a INTEGER.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR FLOAT (RATIONAL 1 35184372088832)
;                               (INTEGER 35184372088833
;                                4611686018427387904)), not a RATIONAL.

;     (1+ ARCDOCDB.EXECUTION::CURSOR)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                                   (INTEGER 35184372088832 4611686018427387903)), not a FIXNUM.
;       The result is a (VALUES
;                        (OR FLOAT (RATIONAL 1 35184372088832)
;                            (INTEGER 35184372088833 4611686018427387904))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                                   (INTEGER 35184372088832 4611686018427387903)), not a (UNSIGNED-BYTE
;                                                                                         64).
;       The result is a (VALUES
;                        (OR FLOAT (RATIONAL 1 35184372088832)
;                            (INTEGER 35184372088833 4611686018427387904))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                                   (INTEGER 35184372088832 4611686018427387903)), not a FIXNUM.
;       The result is a (VALUES
;                        (OR FLOAT (RATIONAL 1 35184372088832)
;                            (INTEGER 35184372088833 4611686018427387904))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (OR FLOAT (RATIONAL 0 35184372088831)
;                                   (INTEGER 35184372088832 4611686018427387903)), not a (UNSIGNED-BYTE
;                                                                                         64).
;       The result is a (VALUES
;                        (OR FLOAT (RATIONAL 1 35184372088832)
;                            (INTEGER 35184372088833 4611686018427387904))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :READY-QUEUE-INVARIANT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/ready-tmp267Y2N80.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/ready-recycle.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/ready-recycle-tmpOUPE5FSJ.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-types.lisp\" (written 09 OCT 2026 06:21:35 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-types-tmpIGHCU6ZA.fasl
; compilation finished in 0:00:00.026
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-boundary.lisp\" (written 09 OCT 2026 06:21:35 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-boundary-tmpBO0TUGLK.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-claim.lisp\" (written 09 OCT 2026 06:21:35 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-claim.lisp
; in: DEFUN PRENDI-WRITER-WORKER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-STATE)
; 
; note: deleting unreachable code

; in: DEFUN RICIRCOLA-WORKER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-STATE)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-claim-tmpIIXPIQNW.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-run.lisp\" (written 09 OCT 2026 06:23:38 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-run.lisp
; in: DEFUN PRELEVA-LAVORI-WORKER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-STATE)
; 
; note: deleting unreachable code

; in: DEFUN %CONCLUDI-WORKER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-STATE)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/execution/worker-run-tmpOHM494YR.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/package.lisp\" (written 13 OCT 2026 08:27:32 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/package-tmpOVFB07XF.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/types.lisp\" (written 13 OCT 2026 08:27:32 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/types-tmpG6VFGMYP.fasl
; compilation finished in 0:00:00.025
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/build.lisp\" (written 13 OCT 2026 08:27:54 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/build-tmp4QIPRMOF.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/read.lisp\" (written 13 OCT 2026 08:27:32 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/read-tmpGW0QV22K.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/policy.lisp\" (written 13 OCT 2026 08:29:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/policy-tmp2K9J0HSR.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/update.lisp\" (written 13 OCT 2026 08:27:32 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/update.lisp
; in: DEFUN %POOL-SAMPLE
;     (- ARCDOCDB.SCHEDULER::TICK
;        (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (>=
;      (- ARCDOCDB.SCHEDULER::TICK
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST
;          ARCDOCDB.SCHEDULER::CONTROLLER))
;      (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-PERIOD ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (- ARCDOCDB.SCHEDULER::TICK
;        (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

; in: DEFUN AGGIORNA-CONTROLLORE-POOL
;     (- ARCDOCDB.SCHEDULER::TICK
;        (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (>
;      (- ARCDOCDB.SCHEDULER::TICK
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST
;          ARCDOCDB.SCHEDULER::CONTROLLER))
;      (* 2
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-PERIOD
;          ARCDOCDB.SCHEDULER::CONTROLLER)))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (/= ARCDOCDB.SCHEDULER::ACTUAL
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-TARGET
;          ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (- ARCDOCDB.SCHEDULER::TICK
;        (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (>
;      (- ARCDOCDB.SCHEDULER::TICK
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST
;          ARCDOCDB.SCHEDULER::CONTROLLER))
;      (* 2
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-PERIOD
;          ARCDOCDB.SCHEDULER::CONTROLLER)))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/update-tmpP44I4E0Y.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/package-tmp63LQ7EX6.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/formats.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/formats-tmp86F1A8FB.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/segment-header.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/segment-header-tmpH7D4HL98.fasl
; compilation finished in 0:00:00.040
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/log-header.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/log-header-tmpCDM7YXYI.fasl
; compilation finished in 0:00:00.022
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/compaction-scan.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/compaction-scan-tmpLM57P5P.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/control-payload.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/control-payload-tmpZE69DN33.fasl
; compilation finished in 0:00:00.031
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/payload-record.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/payload-record-tmpG8099TO3.fasl
; compilation finished in 0:00:00.021
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/payload-write.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/payload-write-tmpTASQCYAW.fasl
; compilation finished in 0:00:00.046
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/package-tmp35U57IV6.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/types-tmpTZOONXRW.fasl
; compilation finished in 0:00:00.014
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/native.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/native.lisp
; in: SB-ALIEN:DEFINE-ALIEN-ROUTINE (\"pread\" %PREAD)
;     (DEFINE-ALIEN-ROUTINE (\"pread\" ARCDOCDB.IO::%PREAD) LONG
;                           (ARCDOCDB.IO::FD INT)
;                           (ARCDOCDB.IO::BUFFER SYSTEM-AREA-POINTER)
;                           (COUNT UNSIGNED-LONG) (ARCDOCDB.IO::OFFSET LONG))
; --> DEFUN PROGN SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::%PREAD
;         (ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT ARCDOCDB.IO::OFFSET)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.IO::%PREAD
;         (WITH-ALIEN ((#:%PREAD # :EXTERN \"pread\"))
;           (VALUES
;            (ALIEN-FUNCALL #:%PREAD ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT
;                           ARCDOCDB.IO::OFFSET)))))
; 
; note: doing signed word to integer coercion (cost 20) to \"<return value>\"

; in: SB-ALIEN:DEFINE-ALIEN-ROUTINE (\"write\" %WRITE)
;     (DEFINE-ALIEN-ROUTINE (\"write\" ARCDOCDB.IO::%WRITE) LONG
;                           (ARCDOCDB.IO::FD INT)
;                           (ARCDOCDB.IO::BUFFER SYSTEM-AREA-POINTER)
;                           (COUNT UNSIGNED-LONG))
; --> DEFUN PROGN SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::%WRITE
;         (ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.IO::%WRITE
;         (WITH-ALIEN ((#:%WRITE # :EXTERN \"write\"))
;           (VALUES
;            (ALIEN-FUNCALL #:%WRITE ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER
;                           COUNT)))))
; 
; note: doing signed word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN NATIVE-OPEN
;     (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI)
; 
; note: deleting unreachable code

;     (DEFUN ARCDOCDB.IO::NATIVE-OPEN (ARCDOCDB.IO::NAME ARCDOCDB.IO::MODE)
;       \"Pre: nome non vuoto/NUL-free. Post: FD CLOEXEC/NOFOLLOW e modo richiesto.
;   SYSCALL-ERROR esplicito; ABI non 64 bit UNSUPPORTED-FORMAT, senza apertura.\"
;       (UNLESS (= SB-VM:N-WORD-BITS 64)
;         (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI))
;       (LET ((ARCDOCDB.IO::FD (SB-POSIX:OPEN ARCDOCDB.IO::NAME # 384)))
;         (HANDLER-CASE
;          (LET (#)
;            (UNLESS # #)
;            ARCDOCDB.IO::FD)
;          (SB-POSIX:SYSCALL-ERROR (ARCDOCDB.IO::C)
;                                  (ARCDOCDB.IO::CLEANUP-OPEN ARCDOCDB.IO::FD
;                                   :IO-SYSCALL #))
;          (ARCDOCDB.CONDITIONS:IO-FAULT (ARCDOCDB.IO::C)
;           (ARCDOCDB.IO::CLEANUP-OPEN ARCDOCDB.IO::FD # #)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::NATIVE-OPEN
;         (ARCDOCDB.IO::NAME ARCDOCDB.IO::MODE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: nome non vuoto/NUL-free. Post: FD CLOEXEC/NOFOLLOW e modo richiesto.
; SYSCALL-ERROR esplicito; ABI non 64 bit UNSUPPORTED-FORMAT, senza apertura.\"
;       (BLOCK ARCDOCDB.IO::NATIVE-OPEN
;         (UNLESS (= SB-VM:N-WORD-BITS 64)
;           (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI))
;         (LET ((ARCDOCDB.IO::FD #))
;           (HANDLER-CASE
;            (LET #
;              #
;              ARCDOCDB.IO::FD)
;            (SB-POSIX:SYSCALL-ERROR # #) (ARCDOCDB.CONDITIONS:IO-FAULT # #)))))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (UNSIGNED-BYTE 31) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (UNSIGNED-BYTE 31) &OPTIONAL).

;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :IO-OPEN-MODE)
; 
; note: deleting unreachable code

;     (SB-POSIX:S-ISREG ARCDOCDB.IO::KIND)
; --> BLOCK LET ALIEN-FUNCALL 
; ==>
;   1
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (SB-POSIX:S-ISDIR ARCDOCDB.IO::KIND)
; --> BLOCK LET ALIEN-FUNCALL 
; ==>
;   1
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; in: DEFUN NATIVE-READ
;     (LET ((ARCDOCDB.IO::N
;            (ARCDOCDB.IO::%PREAD ARCDOCDB.IO::FD
;             (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT ARCDOCDB.IO::OFFSET)))
;       (WHEN (= ARCDOCDB.IO::N -1)
;         (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME
;                'ARCDOCDB.IO::PREAD))
;       ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

; in: DEFUN NATIVE-WRITE
;     (LET ((ARCDOCDB.IO::N
;            (ARCDOCDB.IO::%WRITE ARCDOCDB.IO::FD
;             (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT)))
;       (WHEN (= ARCDOCDB.IO::N -1)
;         (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME 'WRITE))
;       ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/native-tmpWN0UKDSV.fasl
; compilation finished in 0:00:00.017
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/lifecycle.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/lifecycle.lisp
; in: DEFUN NOME-FILE
;     (PATHNAME ARCDOCDB.IO::PATH)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR STRING PATHNAME), not a PATHNAME.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR STRING PATHNAME), not a STRING.

;     (LENGTH ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (FIND #\\Nul ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a (OR CONS VECTOR
;                                SB-KERNEL:EXTENDED-SEQUENCE), not a (OR LIST
;                                                                        VECTOR).

;     (FIND-IF (LAMBDA (ARCDOCDB.IO::C) (CHAR/= ARCDOCDB.IO::C #\\/))
;              ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a (OR CONS VECTOR
;                                SB-KERNEL:EXTENDED-SEQUENCE), not a (OR LIST
;                                                                        VECTOR).

;     (STRING-RIGHT-TRIM \"/\" ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a STRING, not a SIMPLE-STRING.

;     (LENGTH ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR CONS VECTOR
;                               SB-KERNEL:EXTENDED-SEQUENCE), not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR CONS VECTOR
;                               SB-KERNEL:EXTENDED-SEQUENCE), not a VECTOR.

;     (STRING= ARCDOCDB.IO::NAME \".tmp\" :START1 (- (LENGTH ARCDOCDB.IO::NAME) 4))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a STRING, not a (SIMPLE-ARRAY CHARACTER (*)).


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/lifecycle-tmpBF3HHBTQ.fasl
; compilation finished in 0:00:00.024
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/transfer.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/transfer.lisp
; in: DEFUN LEGGI-ESATTO
;     (LOOP ARCDOCDB.IO::REPEAT
;           COUNT
;           ARCDOCDB.IO::UNTIL (= ARCDOCDB.IO::DONE COUNT)
;           DO (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;                     (ARCDOCDB.IO::N
;                      (IF ARCDOCDB.IO:BACKEND
;                          #
;                          #)))
;                (INCF ARCDOCDB.IO::DONE
;                      (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;                       ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE))))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;            (ARCDOCDB.IO::N
;             (IF ARCDOCDB.IO:BACKEND
;                 (FUNCALL # # ARCDOCDB.IO::BUFFER # ARCDOCDB.IO::REMAINING #)
;                 (ARCDOCDB.IO::NATIVE-READ # ARCDOCDB.IO::BUFFER #
;                                           ARCDOCDB.IO::REMAINING #))))
;       (INCF ARCDOCDB.IO::DONE
;             (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;              ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE)))
; 
; note: doing signed word to integer coercion (cost 20) to REMAINING

;     (ARCDOCDB.IO::NATIVE-READ (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE)
;                               ARCDOCDB.IO::BUFFER
;                               (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE)
;                               ARCDOCDB.IO::REMAINING
;                               (+ ARCDOCDB.IO::OFFSET ARCDOCDB.IO::DONE))
; --> BLOCK SB-SYS:WITH-PINNED-OBJECTS LET 
; ==>
;   (LET ((ARCDOCDB.IO::N
;          (ARCDOCDB.IO::%PREAD ARCDOCDB.IO::FD
;                               (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT
;                               ARCDOCDB.IO::OFFSET)))
;     (WHEN (= ARCDOCDB.IO::N -1)
;       (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME
;              'ARCDOCDB.IO::PREAD))
;     ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

;     (INCF ARCDOCDB.IO::DONE
;           (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;            ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE))
; 
; note: doing signed word to integer coercion (cost 20) to DONE

;     (FUNCALL (ARCDOCDB.IO::BACKEND-READER ARCDOCDB.IO:BACKEND)
;              (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE) ARCDOCDB.IO::BUFFER
;              (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE) ARCDOCDB.IO::REMAINING
;              (+ ARCDOCDB.IO::OFFSET ARCDOCDB.IO::DONE))
; 
; note: doing unsigned word to integer coercion (cost 20)
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN APPEND-ESATTO
;     (LOOP ARCDOCDB.IO::REPEAT
;           COUNT
;           ARCDOCDB.IO::UNTIL (= ARCDOCDB.IO::DONE COUNT)
;           DO (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;                     (ARCDOCDB.IO::N
;                      (IF ARCDOCDB.IO:BACKEND
;                          #
;                          #))
;                     (ARCDOCDB.IO::PROGRESS
;                      (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;                       ARCDOCDB.IO::REMAINING :WRITE ARCDOCDB.IO::DONE)))
;                (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
;                (INCF (ARCDOCDB.IO::FILE-WRITTEN ARCDOCDB.IO::FILE)
;                      ARCDOCDB.IO::PROGRESS)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;            (ARCDOCDB.IO::N
;             (IF ARCDOCDB.IO:BACKEND
;                 (FUNCALL # # ARCDOCDB.IO::BUFFER # ARCDOCDB.IO::REMAINING)
;                 (ARCDOCDB.IO::NATIVE-WRITE # ARCDOCDB.IO::BUFFER #
;                                            ARCDOCDB.IO::REMAINING)))
;            (ARCDOCDB.IO::PROGRESS
;             (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;              ARCDOCDB.IO::REMAINING :WRITE ARCDOCDB.IO::DONE)))
;       (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
;       (INCF (ARCDOCDB.IO::FILE-WRITTEN ARCDOCDB.IO::FILE) ARCDOCDB.IO::PROGRESS))
; 
; note: doing signed word to integer coercion (cost 20) to REMAINING

;     (ARCDOCDB.IO::NATIVE-WRITE (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE)
;                                ARCDOCDB.IO::BUFFER
;                                (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE)
;                                ARCDOCDB.IO::REMAINING)
; --> BLOCK SB-SYS:WITH-PINNED-OBJECTS LET 
; ==>
;   (LET ((ARCDOCDB.IO::N
;          (ARCDOCDB.IO::%WRITE ARCDOCDB.IO::FD
;                               (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT)))
;     (WHEN (= ARCDOCDB.IO::N -1)
;       (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME 'WRITE))
;     ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

;     (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
; 
; note: doing signed word to integer coercion (cost 20) to DONE

;     (FUNCALL (ARCDOCDB.IO::BACKEND-WRITER ARCDOCDB.IO:BACKEND)
;              (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE) ARCDOCDB.IO::BUFFER
;              (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE) ARCDOCDB.IO::REMAINING)
; 
; note: doing unsigned word to integer coercion (cost 20)


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/transfer-tmpGYUNPZCY.fasl
; compilation finished in 0:00:00.022
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/flush.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/flush-tmpD68Q8WCA.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/package-tmp7MK9KM9C.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/types.lisp
; in: DEFSTRUCT LOG-IO
;     (ARCDOCDB.WAL::FILE-ID 0 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.WAL::LOG-IO-FILE-ID
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.WAL::LOG-IO-FILE-ID
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.WAL:LOG-IO SB-KERNEL:INSTANCE) 3))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFSTRUCT LOTTO
;     (ARCDOCDB.WAL::FILE-ID 0 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.WAL::LOTTO-FILE-ID
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.WAL::LOTTO-FILE-ID
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.WAL:LOTTO SB-KERNEL:INSTANCE) 2))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/types-tmpJJ71X849.fasl
; compilation finished in 0:00:00.056
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/builder.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/builder-tmp1VUK6SR2.fasl
; compilation finished in 0:00:00.018
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/group.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/group.lisp
; in: DEFUN VERIFICA-IDENTITA-LOTTO
;     (= (ARCDOCDB.WAL::LOTTO-START ARCDOCDB.WAL:LOTTO)
;        (+ (ARCDOCDB.WAL::GRUPPO-START ARCDOCDB.WAL::GROUP)
;           (ARCDOCDB.WAL::GRUPPO-BYTES ARCDOCDB.WAL::GROUP)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/group-tmpR2FIHSUG.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/executor.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/executor.lisp
; in: DEFUN SCRIVI-GRUPPO
;     (= ARCDOCDB.WAL::END
;        (+ (ARCDOCDB.WAL::LOTTO-START ARCDOCDB.WAL:LOTTO)
;           (ARCDOCDB.WAL::LOTTO-USED ARCDOCDB.WAL:LOTTO)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; in: DEFUN SINCRONIZZA-GRUPPO
;     (= ARCDOCDB.WAL::END
;        (+ (ARCDOCDB.WAL::GRUPPO-START ARCDOCDB.WAL::GROUP)
;           (ARCDOCDB.WAL::GRUPPO-BYTES ARCDOCDB.WAL::GROUP)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/executor-tmp8PYELRKX.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/csn.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/csn.lisp
; in: DEFUN VERIFICA-FILE-CSN
;     (LET* ((ARCDOCDB.WAL::FILE (ARCDOCDB.WAL::LOG-IO-FILE LOG))
;            (ARCDOCDB.WAL::WRITTEN
;             (ARCDOCDB.IO:POSIZIONE-SCRITTA ARCDOCDB.WAL::FILE))
;            (ARCDOCDB.WAL::SIZE
;             (+ (ARCDOCDB.WAL::LOTTO-USED ARCDOCDB.WAL:LOTTO)
;                ARCDOCDB.WAL::+SEAL-TOTAL+)))
;       (UNLESS (<= ARCDOCDB.WAL::WRITTEN ARCDOCDB.WAL::FILE-START)
;         (ERROR 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :REASON
;                :LOTTO-WRITTEN-OFFSET))
;       (ARCDOCDB.IO:VERIFICA-CAPIENZA-APPEND ARCDOCDB.WAL::FILE
;                                             (+
;                                              (- ARCDOCDB.WAL::FILE-START
;                                                 ARCDOCDB.WAL::WRITTEN)
;                                              ARCDOCDB.WAL::SIZE)
;                                             ARCDOCDB.WAL::SIZE)
;       (UNLESS
;           (<= ARCDOCDB.WAL::DURABLE
;               (ARCDOCDB.IO:POSIZIONE-DUREVOLE ARCDOCDB.WAL::FILE))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :REASON
;                :LOTTO-FUTURE-DURABLE)))
; 
; note: doing signed word to integer coercion (cost 20) to SIZE

;     (ARCDOCDB.IO:VERIFICA-CAPIENZA-APPEND ARCDOCDB.WAL::FILE
;                                           (+
;                                            (- ARCDOCDB.WAL::FILE-START
;                                               ARCDOCDB.WAL::WRITTEN)
;                                            ARCDOCDB.WAL::SIZE)
;                                           ARCDOCDB.WAL::SIZE)
; 
; note: doing unsigned word to integer coercion (cost 20)


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/csn-tmpEHTOKYT0.fasl
; compilation finished in 0:00:00.018
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/package-tmpS6U1VHI9.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/types-tmpVTFK6ZJW.fasl
; compilation finished in 0:00:00.041
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/ownership.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/ownership.lisp
; in: DEFUN %MARK-FAULT
;     (SETF (ARCDOCDB.SERIES::CONTROLLORE-SERIE-STATE ARCDOCDB.SERIES::CONTROLLER)
;             :ARCHIVE-FAULTED)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/ownership-tmp75WVSJEW.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/events.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/events.lisp
; in: DEFUN %CHECK-LOTTO-RELEASE
;     (ARCDOCDB.SERIES::%SERIE-INVARIANT ARCDOCDB.SERIES::CONTROLLER
;                                        :SERIE-RELEASE-KIND)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/events-tmpBU5UM3S4.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/io-events.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/io-events-tmpOBHVA3CD.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/publication.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/publication-tmpJ6ELVFLF.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/query.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/query.lisp
; in: DEFUN AMBITO-FAULT-SERIE
;     (ARCDOCDB.SERIES::%SERIE-INVARIANT ARCDOCDB.SERIES::CONTROLLER :SERIE-HEALTH)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/query-tmpULDB0RG.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/retirement.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/retirement-tmpUTZ0UUTE.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-package.lisp\" (written 11 OCT 2026 02:47:54 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-package-tmpOOSRA8PZ.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-types.lisp\" (written 11 OCT 2026 01:38:17 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-types-tmpDMIL0RVK.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-boundary.lisp\" (written 11 OCT 2026 01:48:03 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-boundary-tmp8MR9IMIO.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-run.lisp\" (written 11 OCT 2026 01:48:03 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-run-tmpJQDKAVAY.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-types.lisp\" (written 11 OCT 2026 02:49:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-types-tmp3I8CEEQY.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-build.lisp\" (written 11 OCT 2026 02:47:54 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-build.lisp
; in: DEFUN CREA-REGISTRO-WORKER-SERIE
;     (COPY-SEQ ARCDOCDB.EXECUTION.SERIES::WRITERS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a LIST.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a SB-KERNEL:EXTENDED-SEQUENCE.

;     (COPY-SEQ ARCDOCDB.EXECUTION.SERIES::CONTROLLERS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a LIST.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a SB-KERNEL:EXTENDED-SEQUENCE.

; in: DEFUN CREA-TABELLA-WORKER-SERIE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-SERIE-ROUTING)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-build-tmpA3RHFLWZ.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-select.lisp\" (written 11 OCT 2026 02:49:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-select-tmpYZIB7VXO.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/package-tmpR8PK79V8.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/types.lisp
; in: DEFUN CREA-BANCO-SLOT
;     (PLUSP ARCDOCDB.INDEX.SLOTS::BUDGET-BYTES)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/types-tmpN1ZVB1HZ.fasl
; compilation finished in 0:00:00.016
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/core-tmpZGRRPISB.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/validation.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/validation-tmpFNKDE5XP.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/read.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/read.lisp
; in: DEFUN LEGGI-SLOT-V2
;     (ARCDOCDB.INDEX.SLOTS::GUASTO-SLOT ARCDOCDB.INDEX.SLOTS::BANK
;                                        :INDEX-SLOT-READ-STATE)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/read-tmpRJTU435C.fasl
; compilation finished in 0:00:00.018
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/write.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/write-tmpI9WG87JK.fasl
; compilation finished in 0:00:00.054
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/relocate.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/relocate-tmpYDE6I9E6.fasl
; compilation finished in 0:00:00.019
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-package.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-package-tmp319UV2V8.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-types.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-types-tmpLYQINFYS.fasl
; compilation finished in 0:00:00.029
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-core.lisp
; in: DEFUN ESIGI-CHIAVE
;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-core-tmpGA31XWNO.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-build.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-build-tmp5HT23M6C.fasl
; compilation finished in 0:00:00.034
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-probe.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-probe.lisp
; in: DEFUN SONDA-GRUPPO
;     (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-OWNER
;      ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-probe-tmpA60KLDKY.fasl
; compilation finished in 0:00:00.047
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-read.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-read.lisp
; in: DEFUN LEGGI-INDICE-PRIMARIO
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-read-tmpD801X3GJ.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-write.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-write.lisp
; in: DEFUN PREPARA-CHIAVE-WRITER
;     (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
; 
; note: forced to do +/UNSIGNED-SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (INTEGER -9223372036854775807
;                                 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743103)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a (INTEGER -9223372036854775807
;                                 9223372036854775807), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743103)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (> (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
;        (LENGTH
;         (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-ARENA
;          ARCDOCDB.INDEX.PRIMARY::FRAGMENT)))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743103), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743103), not a (UNSIGNED-BYTE
;                                                                                          64).
;       etc.

;     (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
; 
; note: forced to do */SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -4294967296)
;                            (INTEGER 0 0)
;                            (INTEGER 4294967296 39614081257132168792477007872))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -4294967296)
;                            (INTEGER 0 0)
;                            (INTEGER 4294967296 39614081257132168792477007872))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (LOGIOR ARCDOCDB.INDEX.PRIMARY::OFFSET (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
;             (ASH 1 48))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (OR
;                                 (INTEGER -39614081257132168792477007872
;                                  -4294967296)
;                                 (INTEGER 0 0)
;                                 (INTEGER 4294967296
;                                  39614081257132168792477007872)), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -39614081257132168792477007872
;                         39614081257132168796771975167)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The second argument is a (OR
;                                 (INTEGER -39614081257132168792477007872
;                                  -4294967296)
;                                 (INTEGER 0 0)
;                                 (INTEGER 4294967296
;                                  39614081257132168792477007872)), not a (UNSIGNED-BYTE
;                                                                          64).
;       The result is a (VALUES
;                        (INTEGER -39614081257132168792477007872
;                         39614081257132168796771975167)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -39614081257132168792477007872
;                                39614081257132168796771975167), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -1)
;                            (INTEGER 281474976710656
;                             39614081257132168796771975167))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (INTEGER -39614081257132168792477007872
;                                39614081257132168796771975167), not a (UNSIGNED-BYTE
;                                                                       64).
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -1)
;                            (INTEGER 281474976710656
;                             39614081257132168796771975167))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of */SIGNED=>S128

;     (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of +/UNSIGNED-SIGNED=>S128

; in: DEFUN PUBBLICA-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFUN RIMUOVI-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-write-tmpGOW1GC70.fasl
; compilation finished in 0:00:00.022
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-relocate.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-relocate.lisp
; in: DEFUN RILOCA-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-relocate-tmpPQ1X28TL.fasl
; compilation finished in 0:00:00.017
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-arena.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-arena.lisp
; in: DEFUN PAYLOAD-ROOT
;     (INCF ARCDOCDB.INDEX.PRIMARY::SUM
;           (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;            ARCDOCDB.INDEX.PRIMARY::FRAGMENT))
; ==>
;   (+
;    (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;    ARCDOCDB.INDEX.PRIMARY::SUM)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (INTEGER * 4611686018427387903), not a FIXNUM.
;       The result is a (VALUES (INTEGER * 9223372036854775806) &OPTIONAL), not a (VALUES
;                                                                                  FIXNUM
;                                                                                  &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The second argument is a (INTEGER * 4611686018427387903), not a (UNSIGNED-BYTE
;                                                                        64).
;       The result is a (VALUES (INTEGER * 9223372036854775806) &OPTIONAL), not a (VALUES
;                                                                                  (UNSIGNED-BYTE
;                                                                                   64)
;                                                                                  &OPTIONAL).
;       etc.

;     (> ARCDOCDB.INDEX.PRIMARY::SUM MOST-POSITIVE-FIXNUM)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER * 9223372036854775806), not a FIXNUM.

; in: DEFUN ESTENDI-ARENA-INDICE
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;        (IF ARCDOCDB.INDEX.PRIMARY::BUILDING
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;             ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;            0)
;        ARCDOCDB.INDEX.PRIMARY::NEW-SIZE)
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775808 9223372036854775806), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743102)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775808 9223372036854775806), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743102)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (>
;      (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;         (IF ARCDOCDB.INDEX.PRIMARY::BUILDING
;             (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;              ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;             0)
;         ARCDOCDB.INDEX.PRIMARY::NEW-SIZE)
;      ARCDOCDB.INDEX.PRIMARY::TRANSIENT-BUDGET-BYTES)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743102), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743102), not a (UNSIGNED-BYTE
;                                                                                          64).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-arena-tmpE92ECU7O.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-directory.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-directory.lisp
; in: DEFUN VERIFICA-PIANO-DIRECTORY
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;        ARCDOCDB.INDEX.PRIMARY::BYTES
;        (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;        (IF SECOND
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;            0))
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -4611686018427387896 4611686027017322495), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775800 9223372045444710398)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -4611686018427387896 4611686027017322495), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775800 9223372045444710398)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do +/S128+SIGNED=>S128 (cost 11)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775800 9223372045444710398), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -13835058055282163704 13835058063872098301)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775800 9223372045444710398), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -13835058055282163704 13835058063872098301)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (>
;      (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;         ARCDOCDB.INDEX.PRIMARY::BYTES
;         (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;         (IF SECOND
;             (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;             0))
;      ARCDOCDB.INDEX.PRIMARY::TRANSIENT-BUDGET)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -13835058055282163704
;                                13835058063872098301), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -13835058055282163704
;                                13835058063872098301), not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;        ARCDOCDB.INDEX.PRIMARY::BYTES
;        (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;        (IF SECOND
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;            0))
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of +/S128+SIGNED=>S128


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-directory-tmp8S0II570.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-scan.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-scan.lisp
; in: DEFUN MISURA-RICOSTRUZIONE
;     (INCF ARCDOCDB.INDEX.PRIMARY::LIVE)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY::LIVE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF SECOND ARCDOCDB.INDEX.PRIMARY::SIZE)
; ==>
;   (+ ARCDOCDB.INDEX.PRIMARY::SIZE SECOND)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (INCF FIRST ARCDOCDB.INDEX.PRIMARY::SIZE)
; ==>
;   (+ ARCDOCDB.INDEX.PRIMARY::SIZE FIRST)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-scan-tmpJE88A12F.fasl
; compilation finished in 0:00:00.019
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-budget.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-budget.lisp
; in: DEFUN BUDGET-RICOSTRUZIONE
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;        DIRECTORY ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST
;        (IF ARCDOCDB.INDEX.PRIMARY::SPLIT
;            (+ ARCDOCDB.INDEX.PRIMARY::SLOTS SECOND)
;            0))
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -4611686018427387240 4611686035609944063), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775144 9223372054037331966)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -4611686018427387240 4611686035609944063), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775144 9223372054037331966)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do +/S128+SIGNED=>S128 (cost 11)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775144 9223372054037331966), not a FIXNUM.
;       The second argument is a (INTEGER -4611686018427387248
;                                 4611686018430074879), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -13835058055282162392 13835058072467406845)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775144 9223372054037331966), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a (INTEGER -4611686018427387248
;                                 4611686018430074879), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -13835058055282162392 13835058072467406845)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (> ARCDOCDB.INDEX.PRIMARY::PAYLOAD ARCDOCDB.INDEX.PRIMARY::BUDGET)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -13835058055282162392
;                                13835058072467406845), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -13835058055282162392
;                                13835058072467406845), not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (LET* ((ARCDOCDB.INDEX.PRIMARY::DEPTH
;             (MAX
;              (ARCDOCDB.INDEX.PRIMARY::ROOT-INDICE-DEPTH
;               ARCDOCDB.INDEX.PRIMARY::ROOT)
;              (+ # #)))
;            (DIRECTORY (* 8 (ASH 1 ARCDOCDB.INDEX.PRIMARY::DEPTH)))
;            (ARCDOCDB.INDEX.PRIMARY::SLOTS
;             (* 41
;                (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-CAPACITY
;                 ARCDOCDB.INDEX.PRIMARY::INDEX)))
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD
;             (+
;              (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;              DIRECTORY ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST
;              (IF ARCDOCDB.INDEX.PRIMARY::SPLIT
;                  #
;                  0))))
;       (WHEN
;           (> DIRECTORY
;              (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-DIRECTORY-BUDGET
;               ARCDOCDB.INDEX.PRIMARY::INDEX))
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-DIRECTORY-MEMORY-BUDGET))
;       (WHEN
;           (OR
;            (> (+ ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST)
;               (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-FRAGMENT-BUDGET
;                ARCDOCDB.INDEX.PRIMARY::INDEX))
;            (AND ARCDOCDB.INDEX.PRIMARY::SPLIT (> # #)))
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-FRAGMENT-MEMORY-BUDGET))
;       (WHEN (> ARCDOCDB.INDEX.PRIMARY::PAYLOAD ARCDOCDB.INDEX.PRIMARY::BUDGET)
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-DIRECTORY-TRANSIENT-BUDGET))
;       (ARCDOCDB.INDEX.PRIMARY::CREDITO-RICOSTRUZIONE
;        ARCDOCDB.INDEX.PRIMARY::INDEX ARCDOCDB.INDEX.PRIMARY::ROOT
;        ARCDOCDB.INDEX.PRIMARY::SOURCE)
;       (VALUES ARCDOCDB.INDEX.PRIMARY::DEPTH ARCDOCDB.INDEX.PRIMARY::PAYLOAD))
; 
; note: doing signed 128 to integer coercion (cost 30) to PAYLOAD


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-budget-tmpA5FNLPLT.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-copy.lisp\" (written 11 OCT 2026 12:35:07 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-copy-tmpHKCV9TP8.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild.lisp
; in: DEFUN RICOSTRUISCI-FRAMMENTO-INDICE
;     (ASH 1 ARCDOCDB.INDEX.PRIMARY::GLOBAL)
; 
; note: forced to do full call
;       unable to do inline ASH (cost 2) because:
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline ASH (cost 3) because:
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-tmpZ18MA7XE.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-seed.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-seed-tmp6LQJ9T0C.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-digests.lisp\" (written 11 OCT 2026 01:50:28 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-digests.lisp
; in: DEFUN CALCOLA-DIGESTS-FRAMMENTO
;     (= ARCDOCDB.INDEX.PRIMARY::EXPECTED-HIGH ARCDOCDB.INDEX.PRIMARY::SEED-HIGH)
; 
; note: unable to open code because: The operands might not be the same type.

;     (= ARCDOCDB.INDEX.PRIMARY::EXPECTED-LOW ARCDOCDB.INDEX.PRIMARY::SEED-LOW)
; 
; note: unable to open code because: The operands might not be the same type.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-digests-tmpTX7OA81T.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/package-tmpWOTC3PB7.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/types-tmpHQE95SAC.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-types.lisp
; in: DEFSTRUCT REGISTRO-SNAPSHOT
;     (ARCDOCDB.MVCC::LIFETIME 1 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-LIFETIME
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-LIFETIME
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.MVCC:REGISTRO-SNAPSHOT
;                               SB-KERNEL:INSTANCE)
;                          2))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

;     (ARCDOCDB.MVCC::WAIT 1 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WAIT
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WAIT
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.MVCC:REGISTRO-SNAPSHOT
;                               SB-KERNEL:INSTANCE)
;                          3))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN CREA-REGISTRO-SNAPSHOT
;     (<= 1 ARCDOCDB.MVCC::WAIT-TICKS ARCDOCDB.MVCC::LIFETIME-TICKS
;         ARCDOCDB.MVCC::+MAX-CSN+)
; 
; note: forced to do <-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-types-tmpO87FP9NR.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-core.lisp
; in: DEFUN RICALCOLA-SOGLIA-SNAPSHOT
;     (INCF COUNT)
; ==>
;   (+ 1 COUNT)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-core-tmpP6A3E92I.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-csn.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-csn.lisp
; in: DEFUN FRONTIERE-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT (ARCDOCDB.MVCC::REGISTRY)
;       #<(SIMPLE-ARRAY CHARACTER
;          (287)) Pre: mutex snapshot posseduto, registro sano dell'Archivio. Post: H e ultimo CSN coerenti.
;   RESOURCE-EXHAUSTED :CSN-BUSY senza attesa. Guasto CSN invalida gli snapshot e rilancia la condizione.
;   Convers... {80079E074F}>
;       (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;       (HANDLER-CASE
;        (MULTIPLE-VALUE-BIND
;            (ARCDOCDB.MVCC::LAST-HIGH ARCDOCDB.MVCC::LAST-LOW
;             ARCDOCDB.MVCC::HORIZON-HIGH ARCDOCDB.MVCC::HORIZON-LOW)
;            (ARCDOCDB.CSN:LEGGI-FRONTIERE-CSN
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-CSNS ARCDOCDB.MVCC::REGISTRY))
;          (DECLARE
;           (TYPE ARCDOCDB.BINARY:U32 ARCDOCDB.MVCC::LAST-HIGH
;            ARCDOCDB.MVCC::LAST-LOW ARCDOCDB.MVCC::HORIZON-HIGH
;            ARCDOCDB.MVCC::HORIZON-LOW))
;          (LET (# #)
;            (DECLARE #)
;            (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;            (WHEN # #)
;            (VALUES ARCDOCDB.MVCC::HORIZON LAST)))
;        (ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION (CONDITION)
;         (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;         (ERROR CONDITION))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT
;         (ARCDOCDB.MVCC::REGISTRY)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          287) Pre: mutex snapshot posseduto, registro sano dell'Archivio. Post: H e ultimo CSN coerenti.
; RESOURCE-EXHAUSTED :CSN-BUSY senza attesa. Guasto CSN invalida gli snapshot e rilancia la condizione.
; Convers... {80079E1F8F}>
;       (BLOCK ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (HANDLER-CASE
;          (MULTIPLE-VALUE-BIND
;              (ARCDOCDB.MVCC::LAST-HIGH ARCDOCDB.MVCC::LAST-LOW
;               ARCDOCDB.MVCC::HORIZON-HIGH ARCDOCDB.MVCC::HORIZON-LOW)
;              (ARCDOCDB.CSN:LEGGI-FRONTIERE-CSN #)
;            (DECLARE #)
;            (LET #
;              #
;              #
;              #
;              #))
;          (ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION (CONDITION)
;           (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;           (ERROR CONDITION)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from HORIZON to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) from LAST to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-csn-tmpUSHT8RIL.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-register.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-register.lisp
; in: DEFUN REGISTRA-SNAPSHOT-SOTTO-MUTEX
;     (LET* ((ARCDOCDB.MVCC::REGISTRY
;             (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-REGISTRY ARCDOCDB.MVCC::CONTEXT))
;            (ARCDOCDB.MVCC::SLOT
;             (ARCDOCDB.MVCC::PREPARA-REGISTRAZIONE-SNAPSHOT ARCDOCDB.MVCC::CONTEXT
;              ARCDOCDB.MVCC::NOW))
;            (ARCDOCDB.MVCC::WORDS
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY))
;            (ARCDOCDB.MVCC::GENERATION (1+ (AREF ARCDOCDB.MVCC::WORDS 0)))
;            (ARCDOCDB.MVCC::ANNOUNCEMENT
;             (ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT ARCDOCDB.MVCC::REGISTRY))
;            (ARCDOCDB.MVCC::PREVIOUS (AREF ARCDOCDB.MVCC::WORDS 1))
;            (ARCDOCDB.MVCC::COMPLETE NIL))
;       (DECLARE
;        (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::GENERATION
;         ARCDOCDB.MVCC::ANNOUNCEMENT ARCDOCDB.MVCC::PREVIOUS))
;       (UNWIND-PROTECT
;           (PROGN
;            (SETF # #)
;            (SB-THREAD:BARRIER (:MEMORY))
;            (MULTIPLE-VALUE-BIND
;                (ARCDOCDB.MVCC::CAPTURED ARCDOCDB.MVCC::HORIZON
;                 ARCDOCDB.MVCC::CSN)
;                (ARCDOCDB.MVCC::TENTA-CATTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;              (DECLARE #)
;              (UNLESS ARCDOCDB.MVCC::CAPTURED # # # # # #)
;              (UNLESS # #)
;              (LET #
;                #
;                #
;                #)))
;         (UNLESS ARCDOCDB.MVCC::COMPLETE
;           (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY))))
; 
; note: doing unsigned word to integer coercion (cost 20) to GENERATION


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-register-tmp7YCPD44Y.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-lifecycle.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-lifecycle.lisp
; in: DEFUN ATTIVA-SNAPSHOT
;     (ARCDOCDB.MVCC::ORIZZONTE-SNAPSHOT-RAGGIUNTO-P ARCDOCDB.MVCC::REGISTRY
;                                                    (AREF
;                                                     (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-CSNS-ARRAY
;                                                      ARCDOCDB.MVCC::REGISTRY)
;                                                     ARCDOCDB.MVCC::SLOT))
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN SCADI-SNAPSHOT
;     (INCF ARCDOCDB.MVCC::EXPIRED)
; ==>
;   (+ 1 ARCDOCDB.MVCC::EXPIRED)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-lifecycle-tmpQXR7SNXD.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-read.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-read.lisp
; in: DEFUN VERIFICA-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;            (ARCDOCDB.MVCC::CONTEXT ARCDOCDB.MVCC::EXPECTED-GENERATION
;             ARCDOCDB.MVCC::NOW)
;       #<(SIMPLE-ARRAY CHARACTER
;          (269)) Pre: generazione originale, NOW fresco e base monotona comune; epoca già acquisita.
;   Post: CSN solo se attivo e non scaduto; chiamare PRIMA e DOPO la ricerca, anche sul miss.
;   Identità cambiata/fine/sca... {80085447FF}>
;       (LET* ((ARCDOCDB.MVCC::REGISTRY
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-REGISTRY ARCDOCDB.MVCC::CONTEXT))
;              (ARCDOCDB.MVCC::WORD
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-WORD ARCDOCDB.MVCC::CONTEXT))
;              (ARCDOCDB.MVCC::CONTEXT-GENERATION
;               (SB-THREAD:BARRIER #
;                 #))
;              (ARCDOCDB.MVCC::SLOT
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-SLOT ARCDOCDB.MVCC::CONTEXT)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CONTEXT-GENERATION))
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (UNLESS
;             (AND (PLUSP ARCDOCDB.MVCC::EXPECTED-GENERATION)
;                  (= ARCDOCDB.MVCC::CONTEXT-GENERATION
;                     ARCDOCDB.MVCC::EXPECTED-GENERATION))
;           (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                  :SNAPSHOT-STALE-IDENTITY))
;         (UNLESS (< ARCDOCDB.MVCC::SLOT (LENGTH #))
;           (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;            :SNAPSHOT-SLOT-RANGE))
;         (UNLESS
;             (= ARCDOCDB.MVCC::EXPECTED-GENERATION
;                (SB-THREAD:BARRIER #
;                  #))
;           (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                  :SNAPSHOT-STALE-IDENTITY))
;         (LET ((ARCDOCDB.MVCC::CSN #)
;               (ARCDOCDB.MVCC::CONTEXT-CSN #)
;               (ARCDOCDB.MVCC::STATE #)
;               (ARCDOCDB.MVCC::DEADLINE #)
;               (ARCDOCDB.MVCC::WAIT-DEADLINE #))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CSN
;             ARCDOCDB.MVCC::CONTEXT-CSN ARCDOCDB.MVCC::DEADLINE
;             ARCDOCDB.MVCC::WAIT-DEADLINE))
;           (SB-THREAD:BARRIER (:READ))
;           (UNLESS (AND # #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           (UNLESS (= ARCDOCDB.MVCC::CSN ARCDOCDB.MVCC::CONTEXT-CSN)
;             (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;              :SNAPSHOT-CSN-IDENTITY))
;           (COND (# # ARCDOCDB.MVCC::CSN) (# # #) (# #) (T #)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;         (ARCDOCDB.MVCC::CONTEXT ARCDOCDB.MVCC::EXPECTED-GENERATION
;          ARCDOCDB.MVCC::NOW)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-ARRAY CHARACTER
;          (269)) Pre: generazione originale, NOW fresco e base monotona comune; epoca già acquisita.
; Post: CSN solo se attivo e non scaduto; chiamare PRIMA e DOPO la ricerca, anche sul miss.
; Identità cambiata/fine/sca... {80085447FF}>
;       (BLOCK ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;         (LET* ((ARCDOCDB.MVCC::REGISTRY #)
;                (ARCDOCDB.MVCC::WORD #)
;                (ARCDOCDB.MVCC::CONTEXT-GENERATION #)
;                (ARCDOCDB.MVCC::SLOT #))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CONTEXT-GENERATION))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           (UNLESS (AND # #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (UNLESS (< ARCDOCDB.MVCC::SLOT #)
;             (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;              :SNAPSHOT-SLOT-RANGE))
;           (UNLESS (= ARCDOCDB.MVCC::EXPECTED-GENERATION #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (LET (# # # # #)
;             (DECLARE #)
;             (SB-THREAD:BARRIER #)
;             (UNLESS # #)
;             (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;             (UNLESS # #)
;             (COND # # # #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from CSN to \"<return value>\"

; in: DEFUN SOGLIA-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC:SOGLIA-SNAPSHOT (ARCDOCDB.MVCC::REGISTRY)
;       \"Pre: registro sano. Post: soglia acquire, conservativa; MAX-U64 se nessuno la abbassa.
;   È un limite logico, non autorizza da sola il reclaim di un segmento referenziato da EBR.\"
;       (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;       (LET ((ARCDOCDB.MVCC::THRESHOLD
;              (SB-THREAD:BARRIER #
;                #)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::THRESHOLD))
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         ARCDOCDB.MVCC::THRESHOLD))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC:SOGLIA-SNAPSHOT
;         (ARCDOCDB.MVCC::REGISTRY)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: registro sano. Post: soglia acquire, conservativa; MAX-U64 se nessuno la abbassa.
; È un limite logico, non autorizza da sola il reclaim di un segmento referenziato da EBR.\"
;       (BLOCK ARCDOCDB.MVCC:SOGLIA-SNAPSHOT
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (LET ((ARCDOCDB.MVCC::THRESHOLD #))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::THRESHOLD))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           ARCDOCDB.MVCC::THRESHOLD)))
; 
; note: doing unsigned word to integer coercion (cost 20) from THRESHOLD to \"<return value>\"

; in: DEFUN LEGGI-REGISTRO-SNAPSHOT
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-MUTEX
;                             ARCDOCDB.MVCC::REGISTRY)
;                            :WAIT-P NIL)
;       (SETF ARCDOCDB.MVCC::ACQUIRED T)
;       (ARCDOCDB.MVCC::VERIFICA-CONTATORI-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;       (VALUES (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-COUNT ARCDOCDB.MVCC::REGISTRY)
;               (AREF
;                (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;                1)
;               (AREF
;                (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;                0)))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL (SETF ARCDOCDB.MVCC::ACQUIRED T)
;    (ARCDOCDB.MVCC::VERIFICA-CONTATORI-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;    (VALUES (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-COUNT ARCDOCDB.MVCC::REGISTRY)
;            (AREF
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY) 1)
;            (AREF
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;             0)))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-read-tmp6FLI1OC3.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/package-tmpWBK8JTS9.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/types-tmpUVEUD2ZN.fasl
; compilation finished in 0:00:00.032
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/core-tmpOWNJOEU.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/read.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/read-tmpVT5BMTA5.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/retire.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/retire.lisp
; in: DEFUN PRENOTA-RITIRO
;     (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED ARCDOCDB.EPOCHS::REGISTRY)
;        (- ARCDOCDB.EPOCHS::+MAX-EPOCA+ ARCDOCDB.EPOCHS::EPOCH))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET* ((ARCDOCDB.EPOCHS::WORDS
;               (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY))
;              (ARCDOCDB.EPOCHS::CAPACITY (LENGTH #))
;              (LAST
;               (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-GENERATION+))
;              (ARCDOCDB.EPOCHS::EPOCH
;               (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 LAST ARCDOCDB.EPOCHS::EPOCH))
;         (WHEN
;             (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;                ARCDOCDB.EPOCHS::CAPACITY)
;           (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                  :RETIREMENT-CAPACITY))
;         (WHEN (OR (= LAST ARCDOCDB.EPOCHS::+MAX-EPOCA+) (= # #))
;           (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                  :RETIREMENT-SEQUENCE-EXHAUSTED))
;         (LET ((ARCDOCDB.EPOCHS::SLOT #)
;               (ARCDOCDB.EPOCHS::GENERATION #)
;               (ARCDOCDB.EPOCHS::COMPLETE NIL))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.EPOCHS::GENERATION))
;           (UNWIND-PROTECT (PROGN # # # # #)
;             (UNLESS ARCDOCDB.EPOCHS::COMPLETE #)))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET* ((ARCDOCDB.EPOCHS::WORDS
;            (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY))
;           (ARCDOCDB.EPOCHS::CAPACITY (LENGTH #))
;           (LAST
;            (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-GENERATION+))
;           (ARCDOCDB.EPOCHS::EPOCH
;            (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)))
;      (DECLARE (TYPE ARCDOCDB.BINARY:U64 LAST ARCDOCDB.EPOCHS::EPOCH))
;      (WHEN
;          (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;             ARCDOCDB.EPOCHS::CAPACITY)
;        (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;               :RETIREMENT-CAPACITY))
;      (WHEN (OR (= LAST ARCDOCDB.EPOCHS::+MAX-EPOCA+) (= # #))
;        (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;               :RETIREMENT-SEQUENCE-EXHAUSTED))
;      (LET ((ARCDOCDB.EPOCHS::SLOT #)
;            (ARCDOCDB.EPOCHS::GENERATION #)
;            (ARCDOCDB.EPOCHS::COMPLETE NIL))
;        (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.EPOCHS::GENERATION))
;        (UNWIND-PROTECT (PROGN # # # # #)
;          (UNLESS ARCDOCDB.EPOCHS::COMPLETE #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from GENERATION to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/retire-tmpN3CFVWZF.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/reclaim.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/reclaim.lisp
; in: DEFUN AGGIORNA-SOGLIA-RECLAIM
;     (MAX (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;          ARCDOCDB.EPOCHS::MINIMUM)
; 
; note: doing unsigned word to integer coercion (cost 20) from MINIMUM to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN LEGGI-RITIRO
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET* ((ARCDOCDB.EPOCHS::SLOT
;               (ARCDOCDB.EPOCHS::ESIGI-IDENTITA-RITIRO ARCDOCDB.EPOCHS::TICKET
;                                                       ARCDOCDB.EPOCHS::EXPECTED-GENERATION))
;              (ARCDOCDB.EPOCHS::STATE (AREF # ARCDOCDB.EPOCHS::SLOT)))
;         (VALUES
;          (COND (# :RESERVED) (# :RETIRED) (# :CLAIMED) (# :CANCELLED)
;                (# :COMPLETED) (T #))
;          (AREF
;           (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-EPOCHS ARCDOCDB.EPOCHS::REGISTRY)
;           ARCDOCDB.EPOCHS::SLOT))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET* ((ARCDOCDB.EPOCHS::SLOT
;            (ARCDOCDB.EPOCHS::ESIGI-IDENTITA-RITIRO ARCDOCDB.EPOCHS::TICKET
;                                                    ARCDOCDB.EPOCHS::EXPECTED-GENERATION))
;           (ARCDOCDB.EPOCHS::STATE (AREF # ARCDOCDB.EPOCHS::SLOT)))
;      (VALUES
;       (COND (# :RESERVED) (# :RETIRED) (# :CLAIMED) (# :CANCELLED)
;             (# :COMPLETED) (T #))
;       (AREF (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-EPOCHS ARCDOCDB.EPOCHS::REGISTRY)
;             ARCDOCDB.EPOCHS::SLOT))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN LEGGI-REGISTRO-EPOCHE
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET ((ARCDOCDB.EPOCHS::WORDS
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY)))
;         (VALUES (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)
;                 (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;                 (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT
;                  ARCDOCDB.EPOCHS::REGISTRY)
;                 (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED
;                  ARCDOCDB.EPOCHS::REGISTRY))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET ((ARCDOCDB.EPOCHS::WORDS
;           (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY)))
;      (VALUES (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)
;              (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED
;               ARCDOCDB.EPOCHS::REGISTRY))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/reclaim-tmpNK27C0R1.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/package-tmp3BPE71HR.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/types-tmp758YUXMV.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/core-tmpGMQXK1HK.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/task.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/task.lisp
; in: DEFUN ABBANDONA-LETTURA
;     (ARCDOCDB.READ::GUASTO-CONTESTO-LETTURA ARCDOCDB.READ::CONTEXT
;                                             :READ-CONTEXT-STATE)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/task-tmp49Q238TW.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/package.lisp\" (written 11 OCT 2026 02:04:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/package-tmpMXPMJ5KG.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/types.lisp\" (written 11 OCT 2026 02:04:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/types-tmpB69313KI.fasl
; compilation finished in 0:00:00.033
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/build.lisp\" (written 11 OCT 2026 02:04:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/build-tmp9ZT99EEA.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lifecycle.lisp\" (written 11 OCT 2026 02:04:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lifecycle-tmpW045U8V2.fasl
; compilation finished in 0:00:00.022
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lookup.lisp\" (written 11 OCT 2026 02:04:23 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lookup.lisp
; in: DEFUN SCEGLI-CANDIDATO-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-PRIMARY-RESULT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lookup-tmp6XOIRI3N.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/target.lisp\" (written 11 OCT 2026 02:04:23 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/target.lisp
; in: DEFUN SONDA-CACHE-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-RESULT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/target-tmp9ZHTLHSG.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/segment.lisp\" (written 11 OCT 2026 02:04:23 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/segment.lisp
; in: DEFUN INSERISCI-CACHE-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-INSERTION)
; 
; note: deleting unreachable code

; in: DEFUN LEGGI-RECORD-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-RESULT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/segment-tmpRW73Q691.fasl
; compilation finished in 0:00:00.016
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/package-tmp4TM0ME1F.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/scan.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/scan-tmpU2IL9N4.fasl
; compilation finished in 0:00:00.037
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-package-tmpOPW41KDL.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-types-tmpIPVWLON2.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-sort.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-sort-tmpO0LCOIDS.fasl
; compilation finished in 0:00:00.034
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-radix.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-radix.lisp
; in: DEFUN RADIX-ENTRY-STARTS
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :DECISION-RADIX-COUNT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-radix-tmpP264WQ6O.fasl
; compilation finished in 0:00:00.019
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-build.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-build-tmpESC43OCR.fasl
; compilation finished in 0:00:00.035
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-query.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-query.lisp
; in: DEFUN PARTICIPANT-PRESENT-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :DECISION-PARTICIPANT-ORDER)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-query-tmpWCAM54ZJ.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-package.lisp\" (written 09 OCT 2026 06:21:35 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-package-tmpVTMW561L.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-types-tmpUNNGT9CF.fasl
; compilation finished in 0:00:00.019
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-decode.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-decode-tmp4L3W83SU.fasl
; compilation finished in 0:00:00.016
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-fold.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-fold-tmpGE7QNNEE.fasl
; compilation finished in 0:00:00.019
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-build.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-build-tmp9B0UZGT4.fasl
; compilation finished in 0:00:00.032
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-query.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-query-tmpAJ5U325P.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-types.lisp\" (written 09 OCT 2026 06:21:35 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-types-tmpAOF1CYAS.fasl
; compilation finished in 0:00:00.025
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-build.lisp\" (written 09 OCT 2026 06:21:35 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-build.lisp
; in: DEFUN INVENTORY-PRESENCE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-FORM)
; 
; note: deleting unreachable code

; in: DEFUN SINGLE-FILE-ACTION
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-STATE)
; 
; note: deleting unreachable code

; in: DEFUN INVENTORY-ENTRY
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-PRESENCE)
; 
; note: deleting unreachable code

; in: DEFUN ENTRY-SEVERITY
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-STATE)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-build-tmpIXCQTSHA.fasl
; compilation finished in 0:00:00.034
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-query.lisp\" (written 09 OCT 2026 06:21:35 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-query-tmp5E6VIEMS.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/package.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/package-tmpI0PODGVV.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/types.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/types-tmp1Z95I17K.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/scan.lisp\" (written 11 OCT 2026 02:56:31 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/scan.lisp
; in: DEFUN VERIFICA-PREFISSO-WRITER
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT ARCDOCDB.GET.RESOLVER::MAX-BATCHES
;           DO (WHEN (= ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END)
;                (RETURN-FROM ARCDOCDB.GET.RESOLVER::VERIFICA-PREFISSO-WRITER
;                  NIL)) (MULTIPLE-VALUE-BIND
;                            (ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::STAMP
;                             ARCDOCDB.GET.RESOLVER::DURABLE COUNT)
;                            (ARCDOCDB.RECORD:VERIFICA-LOTTO
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END
;                             ARCDOCDB.GET.RESOLVER::ID :VERSION
;                             ARCDOCDB.GET.RESOLVER::VERSION :LOG-KIND :SEGMENT
;                             :MAX-RECORDS ARCDOCDB.GET.RESOLVER::BATCH-RECORDS
;                             :MAX-BYTES ...)
;                          (UNLESS
;                              (AND
;                               (< ARCDOCDB.GET.RESOLVER::POS
;                                  ARCDOCDB.GET.RESOLVER::NEXT)
;                               (<= ARCDOCDB.GET.RESOLVER::NEXT
;                                   ARCDOCDB.GET.RESOLVER::END)
;                               (TYPEP ARCDOCDB.GET.RESOLVER::STAMP
;                                      'ARCDOCDB.BINARY:U64)
;                               (<= ARCDOCDB.GET.RESOLVER::DURABLE
;                                   ARCDOCDB.GET.RESOLVER::POS))
;                            (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION
;                                   :REASON :RESOLVER-BATCH-RESULT :OFFSET
;                                   ARCDOCDB.GET.RESOLVER::POS))
;                          (WHEN
;                              (> COUNT
;                                 (- ARCDOCDB.GET.RESOLVER::MAX-RECORDS
;                                    ARCDOCDB.GET.RESOLVER::RECORDS))
;                            (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                                   :RESOLVER-RECORD-BUDGET :OFFSET
;                                   ARCDOCDB.GET.RESOLVER::POS))
;                          (INCF ARCDOCDB.GET.RESOLVER::RECORDS COUNT)
;                          (SETF ARCDOCDB.GET.RESOLVER::POS
;                                  ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; in: DEFUN CONTA-VOCI-RESOLVER
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT (1+
;                                          (FLOOR
;                                           (- ARCDOCDB.GET.RESOLVER::END
;                                              ARCDOCDB.STORAGE.FORMAT:+SEGMENT-HEADER-BYTES+)
;                                           ARCDOCDB.RECORD:+HEADER-BYTES+))
;           DO (WHEN (= ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END)
;                (RETURN-FROM ARCDOCDB.GET.RESOLVER::CONTA-VOCI-RESOLVER
;                  (VALUES ARCDOCDB.GET.RESOLVER::PUTS
;                          ARCDOCDB.GET.RESOLVER::PROOFS))) (MULTIPLE-VALUE-BIND
;                                                               (ARCDOCDB.GET.RESOLVER::NEXT
;                                                                ARCDOCDB.GET.RESOLVER::KIND
;                                                                ARCDOCDB.GET.RESOLVER::FLAGS)
;                                                               (ARCDOCDB.GET.RESOLVER::PROSSIMA-CORNICE-RESOLVER
;                                                                ARCDOCDB.GET.RESOLVER::BUFFER
;                                                                ARCDOCDB.GET.RESOLVER::POS
;                                                                ARCDOCDB.GET.RESOLVER::END
;                                                                ARCDOCDB.GET.RESOLVER::VERSION)
;                                                             (DECLARE
;                                                              (IGNORE
;                                                               ARCDOCDB.GET.RESOLVER::FLAGS))
;                                                             (UNLESS
;                                                                 (=
;                                                                  ARCDOCDB.GET.RESOLVER::KIND
;                                                                  ARCDOCDB.RECORD:+SEAL+)
;                                                               (WHEN
;                                                                   (=
;                                                                    ARCDOCDB.GET.RESOLVER::RECORDS
;                                                                    ARCDOCDB.GET.RESOLVER::MAX-RECORDS)
;                                                                 (ERROR
;                                                                  'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED
;                                                                  :REASON
;                                                                  :RESOLVER-RECORD-BUDGET
;                                                                  :OFFSET
;                                                                  ARCDOCDB.GET.RESOLVER::POS))
;                                                               (INCF
;                                                                ARCDOCDB.GET.RESOLVER::RECORDS))
;                                                             (CASE
;                                                                 ARCDOCDB.GET.RESOLVER::KIND
;                                                               (1
;                                                                (INCF
;                                                                 ARCDOCDB.GET.RESOLVER::PUTS))
;                                                               (4
;                                                                (INCF
;                                                                 ARCDOCDB.GET.RESOLVER::PROOFS))
;                                                               ((2 3) NIL)
;                                                               (OTHERWISE
;                                                                (ERROR
;                                                                 'ARCDOCDB.CONDITIONS:CORRUPTION-DETECTED
;                                                                 :REASON
;                                                                 :RESOLVER-FRAME-KIND
;                                                                 :OFFSET
;                                                                 ARCDOCDB.GET.RESOLVER::POS)))
;                                                             (SETF ARCDOCDB.GET.RESOLVER::POS
;                                                                     ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; in: DEFUN COPIA-PROVE-RESOLVER
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT (1+
;                                          (FLOOR
;                                           (- ARCDOCDB.GET.RESOLVER::END
;                                              ARCDOCDB.STORAGE.FORMAT:+SEGMENT-HEADER-BYTES+)
;                                           ARCDOCDB.RECORD:+HEADER-BYTES+))
;           DO (WHEN (= ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END)
;                (UNLESS
;                    (= ARCDOCDB.GET.RESOLVER::USED
;                       (LENGTH ARCDOCDB.GET.RESOLVER::PROOFS))
;                  (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                         :RESOLVER-PROOF-COUNT))
;                (RETURN-FROM ARCDOCDB.GET.RESOLVER::COPIA-PROVE-RESOLVER
;                  NIL)) (MULTIPLE-VALUE-BIND
;                            (ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::KIND
;                             ARCDOCDB.GET.RESOLVER::FLAGS)
;                            (ARCDOCDB.GET.RESOLVER::PROSSIMA-CORNICE-RESOLVER
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END
;                             ARCDOCDB.GET.RESOLVER::VERSION)
;                          (DECLARE (IGNORE ARCDOCDB.GET.RESOLVER::FLAGS))
;                          (WHEN
;                              (= ARCDOCDB.GET.RESOLVER::KIND
;                                 ARCDOCDB.RECORD:+OUTCOME+)
;                            (ARCDOCDB.GET.RESOLVER::COPIA-PROVA-RESOLVER
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS
;                             ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::VERSION
;                             ARCDOCDB.GET.RESOLVER::PROOFS
;                             ARCDOCDB.GET.RESOLVER::USED)
;                            (INCF ARCDOCDB.GET.RESOLVER::USED
;                                  ARCDOCDB.GET.RESOLVER::+PROOF-WORDS+))
;                          (SETF ARCDOCDB.GET.RESOLVER::POS
;                                  ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/scan-tmpCFVK1AC1.fasl
; compilation finished in 0:00:00.024
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/sort.lisp\" (written 11 OCT 2026 02:56:31 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/sort-tmpHHRR8E8N.fasl
; compilation finished in 0:00:00.030
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/rows.lisp\" (written 11 OCT 2026 02:56:31 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/rows.lisp
; in: DEFUN COPIA-RIGHE-RESOLVER
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT (1+
;                                          (FLOOR
;                                           (- ARCDOCDB.GET.RESOLVER::END
;                                              ARCDOCDB.STORAGE.FORMAT:+SEGMENT-HEADER-BYTES+)
;                                           ARCDOCDB.RECORD:+HEADER-BYTES+))
;           DO (WHEN (= ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END)
;                (UNLESS
;                    (= ARCDOCDB.GET.RESOLVER::USED
;                       (LENGTH ARCDOCDB.GET.RESOLVER::ROWS))
;                  (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                         :RESOLVER-ROW-COUNT))
;                (RETURN-FROM ARCDOCDB.GET.RESOLVER::COPIA-RIGHE-RESOLVER
;                  NIL)) (MULTIPLE-VALUE-BIND
;                            (ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::KIND
;                             ARCDOCDB.GET.RESOLVER::FLAGS)
;                            (ARCDOCDB.GET.RESOLVER::PROSSIMA-CORNICE-RESOLVER
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END
;                             ARCDOCDB.GET.RESOLVER::VERSION)
;                          (WHEN
;                              (= ARCDOCDB.GET.RESOLVER::KIND
;                                 ARCDOCDB.RECORD:+PUT+)
;                            (ARCDOCDB.GET.RESOLVER::COPIA-RIGA-RESOLVER
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS
;                             ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::FLAGS
;                             ARCDOCDB.GET.RESOLVER::PROOFS
;                             ARCDOCDB.GET.RESOLVER::ROWS
;                             ARCDOCDB.GET.RESOLVER::USED)
;                            (INCF ARCDOCDB.GET.RESOLVER::USED
;                                  ARCDOCDB.GET.RESOLVER::+ROW-WORDS+))
;                          (SETF ARCDOCDB.GET.RESOLVER::POS
;                                  ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/rows-tmpWWJ02E3I.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/build.lisp\" (written 13 OCT 2026 08:20:19 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/build.lisp
; in: DEFUN VERIFICA-SORGENTE-RESOLVER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :RESOLVER-SEGMENT-ORIGIN)
; 
; note: deleting unreachable code

;     (= COUNT (+ ARCDOCDB.GET.RESOLVER::PUTS ARCDOCDB.GET.RESOLVER::TOMBSTONES))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/build-tmpONTOHUJ2.fasl
; compilation finished in 0:00:00.021
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/read.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/read-tmpQT9APWMH.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-types.lisp\" (written 11 OCT 2026 03:36:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-types.lisp
; in: DEFUN PAYLOAD-RADICE-GET-ATTIVA
;     (* ARCDOCDB.GET.RESOLVER::+ACTIVE-NODE-PAYLOAD+
;        (ARCDOCDB.GET.RESOLVER::RADICE-GET-ATTIVA-NODES
;         ARCDOCDB.GET.RESOLVER::ROOT))
; 
; note: forced to do */SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0) (INTEGER 128 590295810358705651584))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0) (INTEGER 128 590295810358705651584))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of */SIGNED=>S128


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-types-tmp6LYQXY0L.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-directory.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-directory-tmpNKVDR0J1.fasl
; compilation finished in 0:00:00.025
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-scan.lisp\" (written 11 OCT 2026 03:36:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-scan.lisp
; in: DEFUN VERIFICA-LOTTO-ATTIVO
;     (= (ARCDOCDB.WAL::LOTTO-FILE-ID ARCDOCDB.GET.RESOLVER::BATCH)
;        (ARCDOCDB.GET::SEGMENTO-GET-LOW ARCDOCDB.GET.RESOLVER::SEGMENT))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the second argument of IF-EQ

; in: DEFUN COPIA-PUT-ATTIVI
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT (1+
;                                          (ARCDOCDB.WAL::LOTTO-COUNT
;                                           ARCDOCDB.GET.RESOLVER::BATCH))
;           DO (MULTIPLE-VALUE-BIND
;                  (ARCDOCDB.GET.RESOLVER::NEXT ARCDOCDB.GET.RESOLVER::KIND
;                   ARCDOCDB.GET.RESOLVER::FLAGS)
;                  (ARCDOCDB.GET.RESOLVER::PROSSIMA-CORNICE-RESOLVER
;                   ARCDOCDB.GET.RESOLVER::BUFFER ARCDOCDB.GET.RESOLVER::POS
;                   ARCDOCDB.GET.RESOLVER::END ARCDOCDB.GET.RESOLVER::VERSION)
;                (WHEN (= ARCDOCDB.GET.RESOLVER::KIND ARCDOCDB.RECORD:+SEAL+)
;                  (UNLESS (AND # #)
;                    (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                           :ACTIVE-ROW-COUNT))
;                  (RETURN-FROM ARCDOCDB.GET.RESOLVER::COPIA-PUT-ATTIVI NIL))
;                (WHEN (= ARCDOCDB.GET.RESOLVER::KIND ARCDOCDB.RECORD:+PUT+)
;                  (UNLESS (<= # #)
;                    (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                           :ACTIVE-ROW-COUNT))
;                  (SETF # #
;                        # #
;                        # ARCDOCDB.GET.RESOLVER::FLAGS
;                        # #
;                        # #)
;                  (INCF ARCDOCDB.GET.RESOLVER::USED
;                        ARCDOCDB.GET.RESOLVER::+ROW-WORDS+))
;                (SETF ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-scan-tmp6F83SDCV.fasl
; compilation finished in 0:00:00.014
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-build.lisp\" (written 11 OCT 2026 03:36:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-build.lisp
; in: DEFUN CREA-SORGENTE-GET-ATTIVA
;     (= (ARCDOCDB.GET::SEGMENTO-GET-LOW ARCDOCDB.GET.RESOLVER::SEGMENT)
;        (ARCDOCDB.WAL::LOG-IO-FILE-ID LOG))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; in: DEFUN COSTRUISCI-DELTA-ATTIVO
;     (LET* ((ARCDOCDB.GET.RESOLVER::ROWS
;             (MAKE-ARRAY
;              (* ARCDOCDB.GET.RESOLVER::PUTS ARCDOCDB.GET.RESOLVER::+ROW-WORDS+)
;              :ELEMENT-TYPE '(UNSIGNED-BYTE 32) :INITIAL-ELEMENT 0))
;            (ARCDOCDB.GET.RESOLVER::END
;             (+ (ARCDOCDB.WAL:INIZIO-LOTTO ARCDOCDB.GET.RESOLVER::BATCH)
;                (ARCDOCDB.WAL:LUNGHEZZA-LOTTO ARCDOCDB.GET.RESOLVER::BATCH)))
;            (ARCDOCDB.GET.RESOLVER::RANK
;             (IF ARCDOCDB.GET.RESOLVER::PREVIOUS
;                 (ARCDOCDB.GET.RESOLVER::RADICE-GET-ATTIVA-COUNT
;                  ARCDOCDB.GET.RESOLVER::PREVIOUS)
;                 0)))
;       (ARCDOCDB.GET.RESOLVER::COPIA-PUT-ATTIVI ARCDOCDB.GET.RESOLVER::SOURCE
;                                                ARCDOCDB.GET.RESOLVER::BATCH
;                                                ARCDOCDB.GET.RESOLVER::ROWS)
;       (MULTIPLE-VALUE-BIND (DIRECTORY ARCDOCDB.GET.RESOLVER::ADDED)
;           (ARCDOCDB.GET.RESOLVER::APPENDI-PAGINA-ATTIVA
;            (IF ARCDOCDB.GET.RESOLVER::PREVIOUS
;                (ARCDOCDB.GET.RESOLVER::RADICE-GET-ATTIVA-DIRECTORY
;                 ARCDOCDB.GET.RESOLVER::PREVIOUS)
;                NIL)
;            ARCDOCDB.GET.RESOLVER::RANK
;            (ARCDOCDB.GET.RESOLVER::%MAKE-MAPPA-SEGMENTO-GET
;             (ARCDOCDB.GET.RESOLVER::SORGENTE-GET-ATTIVA-SEGMENT
;              ARCDOCDB.GET.RESOLVER::SOURCE)
;             ARCDOCDB.GET.RESOLVER::END ARCDOCDB.GET.RESOLVER::ROWS)
;            ARCDOCDB.GET.RESOLVER::+ACTIVE-DIRECTORY-SHIFT+)
;         (ARCDOCDB.GET.RESOLVER::%MAKE-RADICE-GET-ATTIVA
;          ARCDOCDB.GET.RESOLVER::SOURCE DIRECTORY (1+ ARCDOCDB.GET.RESOLVER::RANK)
;          (+ ARCDOCDB.GET.RESOLVER::PUTS
;             (IF ARCDOCDB.GET.RESOLVER::PREVIOUS
;                 #
;                 0))
;          (+ ARCDOCDB.GET.RESOLVER::ADDED
;             (IF ARCDOCDB.GET.RESOLVER::PREVIOUS
;                 #
;                 0))
;          ARCDOCDB.GET.RESOLVER::END ARCDOCDB.GET.RESOLVER::CONTENT)))
; 
; note: doing signed word to integer coercion (cost 20) to END


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-build-tmpEJNPPMJY.fasl
; compilation finished in 0:00:00.022
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-preflight.lisp\" (written 11 OCT 2026 03:36:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-preflight.lisp
; in: DEFUN VERIFICA-MISURE-APERTE-ATTIVE
;     (= (ARCDOCDB.WAL::LOTTO-FILE-ID ARCDOCDB.GET.RESOLVER::BATCH)
;        (ARCDOCDB.GET::SEGMENTO-GET-LOW ARCDOCDB.GET.RESOLVER::SEGMENT))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the second argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-preflight-tmp31RWPSX2.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-read.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-read-tmp1HKLMSTH.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/package.lisp\" (written 13 OCT 2026 08:20:19 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/package-tmpEWG5XJ53.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/types.lisp\" (written 13 OCT 2026 08:20:19 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/types-tmpXHL60MUV.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/build.lisp\" (written 13 OCT 2026 08:20:19 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/build.lisp
; in: DEFUN CREA-DIRECTORY-GET-SERIE
;     (COPY-SEQ ARCDOCDB.GET.DIRECTORY::MAPS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a LIST.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a SB-KERNEL:EXTENDED-SEQUENCE.

;     (LENGTH ARCDOCDB.GET.DIRECTORY::OWNED)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR LIST (SIMPLE-ARRAY * (*))
;                               SB-KERNEL:EXTENDED-SEQUENCE), not a VECTOR.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/build-tmpB7NPDQCW.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/read.lisp\" (written 13 OCT 2026 08:20:19 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/read-tmpGZ70QILE.fasl
; compilation finished in 0:00:00.006
; 
; compilation unit finished
;   printed 212 notes
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/foundation/support.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-foundation.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/support.lisp\" (written 13 OCT 2026 08:28:08 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-scheduler.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/controller.lisp\" (written 13 OCT 2026 08:29:21 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/controller-scheduler.fasl
; compilation finished in 0:00:00.039
ok    TEST-REQ-THR-001-POOL-CONSTRUCTION-DEFAULTS-AND-VALID-BOUNDS
ok    TEST-REQ-AFF-008-POOL-INVALID-CONFIGURATION-HAS-TYPED-REASONS
ok    TEST-REQ-THR-001-POOL-FIRST-SAMPLE-SEEDS-EXACT-FIXED-POINT-SIGNALS
ok    TEST-REQ-AFF-013-POOL-EWMA-INDEPENDENT-ORACLE-AND-NEGATIVE-ROUNDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-PRESERVE-ENTIRE-PUBLIC-STATE
ok    TEST-REQ-AFF-008-POOL-SAMPLE-UPPER-BOUNDS-AND-CLOCK-EXHAUSTION
ok    TEST-REQ-THR-001-POOL-ADDITIVE-GROWTH-NEEDS-COMPLETE-DWELL
ok    TEST-REQ-THR-001-POOL-MULTIPLICATIVE-DECREASE-FLOORS-AND-CLAMPS
ok    TEST-REQ-THR-001-POOL-HYSTERESIS-THRESHOLDS-ARE-INCLUSIVE-AS-SPECIFIED
ok    TEST-REQ-THR-001-POOL-CONFIGURABLE-QUEUE-THRESHOLD-AND-CUSTOM-PERIOD
ok    TEST-REQ-THR-001-POOL-BOUNDS-DO-NOT-EMIT-ZERO-CHANGE-COMMANDS
ok    TEST-REQ-THR-001-POOL-HOLD-REGION-BREAKS-CONTINUOUS-DWELL
ok    TEST-REQ-THR-001-POOL-DIRECTION-CHANGE-RESTARTS-DWELL
ok    TEST-REQ-THR-001-POOL-LONG-GAP-RESETS-EWMA-AND-DWELL
ok    TEST-REQ-THR-001-POOL-GAP-EXACTLY-TWO-PERIODS-KEEPS-EXISTING-DWELL
ok    TEST-REQ-THR-001-POOL-PENDING-TARGET-IS-RETAINED-AND-SENSORS-ADVANCE
ok    TEST-REQ-THR-001-POOL-FIRST-PENDING-SAMPLE-AND-COMPLETED-COMMAND-DWELL
ok    TEST-REQ-CON-005-POOL-CROSS-THREAD-ACCESS-REJECTED-WITHOUT-OWNER-MUTATION
ok    TEST-REQ-AFF-008-POOL-PRIVATE-BOUND-AND-CLOCK-FAULTS-ARE-DETECTED
ok    TEST-REQ-CON-005-POOL-INDEPENDENT-CONTROLLERS-HAVE-DETERMINISTIC-PARALLEL-TRACES
20 test del controllore pool superati.
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/scoped-attempt-2.log")
   :BYTES 2364 :SHA256 "b13d407145e81f306acd4914ca7e555723eed39524df2b069d1b933f2fdcd8e2" :GIT-BLOB
   "d349536210ccb941bb9dd94cff08e924f20494ca" :TEXT
   "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/foundation/support.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-foundation.fasl
; compilation finished in 0:00:00.021
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/support.lisp\" (written 13 OCT 2026 08:28:08 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-scheduler.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/controller.lisp\" (written 13 OCT 2026 08:29:57 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/controller-scheduler.fasl
; compilation finished in 0:00:00.030
ok    TEST-REQ-THR-001-POOL-CONSTRUCTION-DEFAULTS-AND-VALID-BOUNDS
ok    TEST-REQ-AFF-008-POOL-INVALID-CONFIGURATION-HAS-TYPED-REASONS
ok    TEST-REQ-THR-001-POOL-FIRST-SAMPLE-SEEDS-EXACT-FIXED-POINT-SIGNALS
ok    TEST-REQ-AFF-013-POOL-EWMA-INDEPENDENT-ORACLE-AND-NEGATIVE-ROUNDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-PRESERVE-ENTIRE-PUBLIC-STATE
ok    TEST-REQ-AFF-008-POOL-SAMPLE-UPPER-BOUNDS-AND-CLOCK-EXHAUSTION
ok    TEST-REQ-THR-001-POOL-ADDITIVE-GROWTH-NEEDS-COMPLETE-DWELL
ok    TEST-REQ-THR-001-POOL-MULTIPLICATIVE-DECREASE-FLOORS-AND-CLAMPS
ok    TEST-REQ-THR-001-POOL-HYSTERESIS-THRESHOLDS-ARE-INCLUSIVE-AS-SPECIFIED
ok    TEST-REQ-THR-001-POOL-CONFIGURABLE-QUEUE-THRESHOLD-AND-CUSTOM-PERIOD
ok    TEST-REQ-THR-001-POOL-BOUNDS-DO-NOT-EMIT-ZERO-CHANGE-COMMANDS
ok    TEST-REQ-THR-001-POOL-HOLD-REGION-BREAKS-CONTINUOUS-DWELL
ok    TEST-REQ-THR-001-POOL-DIRECTION-CHANGE-RESTARTS-DWELL
ok    TEST-REQ-THR-001-POOL-LONG-GAP-RESETS-EWMA-AND-DWELL
ok    TEST-REQ-THR-001-POOL-GAP-EXACTLY-TWO-PERIODS-KEEPS-EXISTING-DWELL
ok    TEST-REQ-THR-001-POOL-PENDING-TARGET-IS-RETAINED-AND-SENSORS-ADVANCE
ok    TEST-REQ-THR-001-POOL-FIRST-PENDING-SAMPLE-AND-COMPLETED-COMMAND-DWELL
ok    TEST-REQ-CON-005-POOL-CROSS-THREAD-ACCESS-REJECTED-WITHOUT-OWNER-MUTATION
ok    TEST-REQ-AFF-008-POOL-PRIVATE-BOUND-AND-CLOCK-FAULTS-ARE-DETECTED
ok    TEST-REQ-CON-005-POOL-INDEPENDENT-CONTROLLERS-HAVE-DETERMINISTIC-PARALLEL-TRACES
20 test del controllore pool superati.
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/scoped-attempt-3.log")
   :BYTES 2364 :SHA256 "5591881d7f3b9998096b59d27160dc2f5a940f4abf6ec50ac0c294847ad10ae5" :GIT-BLOB
   "53aeffd4eb46b7a16d1df335be3083a98f76ef3f" :TEXT
   "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/foundation/support.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-foundation.fasl
; compilation finished in 0:00:00.021
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/support.lisp\" (written 13 OCT 2026 08:31:08 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-scheduler.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/controller.lisp\" (written 13 OCT 2026 08:31:08 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/controller-scheduler.fasl
; compilation finished in 0:00:00.045
ok    TEST-REQ-THR-001-POOL-CONSTRUCTION-DEFAULTS-AND-VALID-BOUNDS
ok    TEST-REQ-AFF-008-POOL-INVALID-CONFIGURATION-HAS-TYPED-REASONS
ok    TEST-REQ-THR-001-POOL-FIRST-SAMPLE-SEEDS-EXACT-FIXED-POINT-SIGNALS
ok    TEST-REQ-AFF-013-POOL-EWMA-INDEPENDENT-ORACLE-AND-NEGATIVE-ROUNDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-PRESERVE-ENTIRE-PUBLIC-STATE
ok    TEST-REQ-AFF-008-POOL-SAMPLE-UPPER-BOUNDS-AND-CLOCK-EXHAUSTION
ok    TEST-REQ-THR-001-POOL-ADDITIVE-GROWTH-NEEDS-COMPLETE-DWELL
ok    TEST-REQ-THR-001-POOL-MULTIPLICATIVE-DECREASE-FLOORS-AND-CLAMPS
ok    TEST-REQ-THR-001-POOL-HYSTERESIS-THRESHOLDS-ARE-INCLUSIVE-AS-SPECIFIED
ok    TEST-REQ-THR-001-POOL-CONFIGURABLE-QUEUE-THRESHOLD-AND-CUSTOM-PERIOD
ok    TEST-REQ-THR-001-POOL-BOUNDS-DO-NOT-EMIT-ZERO-CHANGE-COMMANDS
ok    TEST-REQ-THR-001-POOL-HOLD-REGION-BREAKS-CONTINUOUS-DWELL
ok    TEST-REQ-THR-001-POOL-DIRECTION-CHANGE-RESTARTS-DWELL
ok    TEST-REQ-THR-001-POOL-LONG-GAP-RESETS-EWMA-AND-DWELL
ok    TEST-REQ-THR-001-POOL-GAP-EXACTLY-TWO-PERIODS-KEEPS-EXISTING-DWELL
ok    TEST-REQ-THR-001-POOL-PENDING-TARGET-IS-RETAINED-AND-SENSORS-ADVANCE
ok    TEST-REQ-THR-001-POOL-FIRST-PENDING-SAMPLE-AND-COMPLETED-COMMAND-DWELL
ok    TEST-REQ-CON-005-POOL-CROSS-THREAD-ACCESS-REJECTED-WITHOUT-OWNER-MUTATION
ok    TEST-REQ-AFF-008-POOL-PRIVATE-BOUND-AND-CLOCK-FAULTS-ARE-DETECTED
ok    TEST-REQ-CON-005-POOL-INDEPENDENT-CONTROLLERS-HAVE-DETERMINISTIC-PARALLEL-TRACES
20 test del controllore pool superati.
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/scoped-attempt-4.log")
   :BYTES 2516 :SHA256 "2c7e3ccfffa54d91dd3629ebd11313d269ce9f55cf0b8405a9520ce75def5036" :GIT-BLOB
   "e52079358af70f3b391beeef745a4661b5f40ff6" :TEXT
   "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/foundation/support.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-foundation.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/support.lisp\" (written 13 OCT 2026 08:31:08 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-scheduler.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/controller.lisp\" (written 13 OCT 2026 08:35:52 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/controller-scheduler.fasl
; compilation finished in 0:00:00.044
ok    TEST-REQ-THR-001-POOL-CONSTRUCTION-DEFAULTS-AND-VALID-BOUNDS
ok    TEST-REQ-AFF-008-POOL-PRIVATE-CONSTRUCTION-DEFAULTS-AND-EXPLICIT-STATE
ok    TEST-REQ-AFF-008-POOL-DECLARED-INTEGER-DOMAINS-AND-DIRECTION-MEMBERS
ok    TEST-REQ-AFF-008-POOL-INVALID-CONFIGURATION-HAS-TYPED-REASONS
ok    TEST-REQ-THR-001-POOL-FIRST-SAMPLE-SEEDS-EXACT-FIXED-POINT-SIGNALS
ok    TEST-REQ-AFF-013-POOL-EWMA-INDEPENDENT-ORACLE-AND-NEGATIVE-ROUNDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-PRESERVE-ENTIRE-PUBLIC-STATE
ok    TEST-REQ-AFF-008-POOL-SAMPLE-UPPER-BOUNDS-AND-CLOCK-EXHAUSTION
ok    TEST-REQ-THR-001-POOL-ADDITIVE-GROWTH-NEEDS-COMPLETE-DWELL
ok    TEST-REQ-THR-001-POOL-MULTIPLICATIVE-DECREASE-FLOORS-AND-CLAMPS
ok    TEST-REQ-THR-001-POOL-HYSTERESIS-THRESHOLDS-ARE-INCLUSIVE-AS-SPECIFIED
ok    TEST-REQ-THR-001-POOL-CONFIGURABLE-QUEUE-THRESHOLD-AND-CUSTOM-PERIOD
ok    TEST-REQ-THR-001-POOL-BOUNDS-DO-NOT-EMIT-ZERO-CHANGE-COMMANDS
ok    TEST-REQ-THR-001-POOL-HOLD-REGION-BREAKS-CONTINUOUS-DWELL
ok    TEST-REQ-THR-001-POOL-DIRECTION-CHANGE-RESTARTS-DWELL
ok    TEST-REQ-THR-001-POOL-LONG-GAP-RESETS-EWMA-AND-DWELL
ok    TEST-REQ-THR-001-POOL-GAP-EXACTLY-TWO-PERIODS-KEEPS-EXISTING-DWELL
ok    TEST-REQ-THR-001-POOL-PENDING-TARGET-IS-RETAINED-AND-SENSORS-ADVANCE
ok    TEST-REQ-THR-001-POOL-FIRST-PENDING-SAMPLE-AND-COMPLETED-COMMAND-DWELL
ok    TEST-REQ-CON-005-POOL-CROSS-THREAD-ACCESS-REJECTED-WITHOUT-OWNER-MUTATION
ok    TEST-REQ-AFF-008-POOL-PRIVATE-BOUND-AND-CLOCK-FAULTS-ARE-DETECTED
ok    TEST-REQ-CON-005-POOL-INDEPENDENT-CONTROLLERS-HAVE-DETERMINISTIC-PARALLEL-TRACES
22 test del controllore pool superati.
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/scoped-attempt-5.log")
   :BYTES 145489 :SHA256 "f90003a5484364f7cd46933e8d7f54a1c473486ef2a9f1eb0608503824fd17da"
   :GIT-BLOB "ed3984c36b67acf88b4c339ae1d1804e9a7e4816" :TEXT
   "; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/types.lisp\" (written 13 OCT 2026 08:46:04 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/types-tmpGHU3ALSV.fasl
; compilation finished in 0:00:00.028
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/build.lisp\" (written 13 OCT 2026 08:27:54 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/build-tmpAAURSO1.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/read.lisp\" (written 13 OCT 2026 08:46:04 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/read-tmp5GEXGEG5.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/policy.lisp\" (written 13 OCT 2026 08:29:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/policy-tmpAR3FSGEY.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/update.lisp\" (written 13 OCT 2026 08:27:32 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/update.lisp
; in: DEFUN %POOL-SAMPLE
;     (- ARCDOCDB.SCHEDULER::TICK
;        (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (>=
;      (- ARCDOCDB.SCHEDULER::TICK
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST
;          ARCDOCDB.SCHEDULER::CONTROLLER))
;      (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-PERIOD ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (- ARCDOCDB.SCHEDULER::TICK
;        (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

; in: DEFUN AGGIORNA-CONTROLLORE-POOL
;     (- ARCDOCDB.SCHEDULER::TICK
;        (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a NUMBER, not a RATIONAL.

;     (>
;      (- ARCDOCDB.SCHEDULER::TICK
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST
;          ARCDOCDB.SCHEDULER::CONTROLLER))
;      (* 2
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-PERIOD
;          ARCDOCDB.SCHEDULER::CONTROLLER)))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a REAL, not a DOUBLE-FLOAT.

;     (/= ARCDOCDB.SCHEDULER::ACTUAL
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-TARGET
;          ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a SINGLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a DOUBLE-FLOAT.
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX SINGLE-FLOAT).
; 
; note: unable to
;   open-code FLOAT to RATIONAL comparison
; due to type uncertainty:
;   The first argument is a NUMBER, not a (COMPLEX DOUBLE-FLOAT).
; 
; note: unable to open code because: The operands might not be the same type.

;     (- ARCDOCDB.SCHEDULER::TICK
;        (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST ARCDOCDB.SCHEDULER::CONTROLLER))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a T, not a FIXNUM.
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a T, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES NUMBER &OPTIONAL), not a (VALUES
;                                                         (UNSIGNED-BYTE 64)
;                                                         &OPTIONAL).
;       etc.

;     (>
;      (- ARCDOCDB.SCHEDULER::TICK
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-LAST
;          ARCDOCDB.SCHEDULER::CONTROLLER))
;      (* 2
;         (ARCDOCDB.SCHEDULER::CONTROLLORE-POOL-PERIOD
;          ARCDOCDB.SCHEDULER::CONTROLLER)))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a NUMBER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a NUMBER, not a (UNSIGNED-BYTE 64).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/update-tmpJAIDFZTC.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/package-tmp8V3J6PE9.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/formats.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/formats-tmp9V47YWQF.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/segment-header.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/segment-header-tmp9BN22RMA.fasl
; compilation finished in 0:00:00.046
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/log-header.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/log-header-tmp1CXFJSK9.fasl
; compilation finished in 0:00:00.022
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/compaction-scan.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/compaction-scan-tmpX4BRKI0R.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/control-payload.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/control-payload-tmpQ371UGST.fasl
; compilation finished in 0:00:00.032
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/payload-record.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/payload-record-tmp2OWI3Q7U.fasl
; compilation finished in 0:00:00.023
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/payload-write.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/storage/payload-write-tmp9KKTJMYV.fasl
; compilation finished in 0:00:00.048
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/package-tmpJU0JWO19.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/types-tmpZX2WN8N4.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/native.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/native.lisp
; in: SB-ALIEN:DEFINE-ALIEN-ROUTINE (\"pread\" %PREAD)
;     (DEFINE-ALIEN-ROUTINE (\"pread\" ARCDOCDB.IO::%PREAD) LONG
;                           (ARCDOCDB.IO::FD INT)
;                           (ARCDOCDB.IO::BUFFER SYSTEM-AREA-POINTER)
;                           (COUNT UNSIGNED-LONG) (ARCDOCDB.IO::OFFSET LONG))
; --> DEFUN PROGN SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::%PREAD
;         (ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT ARCDOCDB.IO::OFFSET)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.IO::%PREAD
;         (WITH-ALIEN ((#:%PREAD # :EXTERN \"pread\"))
;           (VALUES
;            (ALIEN-FUNCALL #:%PREAD ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT
;                           ARCDOCDB.IO::OFFSET)))))
; 
; note: doing signed word to integer coercion (cost 20) to \"<return value>\"

; in: SB-ALIEN:DEFINE-ALIEN-ROUTINE (\"write\" %WRITE)
;     (DEFINE-ALIEN-ROUTINE (\"write\" ARCDOCDB.IO::%WRITE) LONG
;                           (ARCDOCDB.IO::FD INT)
;                           (ARCDOCDB.IO::BUFFER SYSTEM-AREA-POINTER)
;                           (COUNT UNSIGNED-LONG))
; --> DEFUN PROGN SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::%WRITE
;         (ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER COUNT)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.IO::%WRITE
;         (WITH-ALIEN ((#:%WRITE # :EXTERN \"write\"))
;           (VALUES
;            (ALIEN-FUNCALL #:%WRITE ARCDOCDB.IO::FD ARCDOCDB.IO::BUFFER
;                           COUNT)))))
; 
; note: doing signed word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN NATIVE-OPEN
;     (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI)
; 
; note: deleting unreachable code

;     (DEFUN ARCDOCDB.IO::NATIVE-OPEN (ARCDOCDB.IO::NAME ARCDOCDB.IO::MODE)
;       \"Pre: nome non vuoto/NUL-free. Post: FD CLOEXEC/NOFOLLOW e modo richiesto.
;   SYSCALL-ERROR esplicito; ABI non 64 bit UNSUPPORTED-FORMAT, senza apertura.\"
;       (UNLESS (= SB-VM:N-WORD-BITS 64)
;         (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI))
;       (LET ((ARCDOCDB.IO::FD (SB-POSIX:OPEN ARCDOCDB.IO::NAME # 384)))
;         (HANDLER-CASE
;          (LET (#)
;            (UNLESS # #)
;            ARCDOCDB.IO::FD)
;          (SB-POSIX:SYSCALL-ERROR (ARCDOCDB.IO::C)
;                                  (ARCDOCDB.IO::CLEANUP-OPEN ARCDOCDB.IO::FD
;                                   :IO-SYSCALL #))
;          (ARCDOCDB.CONDITIONS:IO-FAULT (ARCDOCDB.IO::C)
;           (ARCDOCDB.IO::CLEANUP-OPEN ARCDOCDB.IO::FD # #)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.IO::NATIVE-OPEN
;         (ARCDOCDB.IO::NAME ARCDOCDB.IO::MODE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: nome non vuoto/NUL-free. Post: FD CLOEXEC/NOFOLLOW e modo richiesto.
; SYSCALL-ERROR esplicito; ABI non 64 bit UNSUPPORTED-FORMAT, senza apertura.\"
;       (BLOCK ARCDOCDB.IO::NATIVE-OPEN
;         (UNLESS (= SB-VM:N-WORD-BITS 64)
;           (ERROR 'ARCDOCDB.CONDITIONS:UNSUPPORTED-FORMAT :REASON :IO-ABI))
;         (LET ((ARCDOCDB.IO::FD #))
;           (HANDLER-CASE
;            (LET #
;              #
;              ARCDOCDB.IO::FD)
;            (SB-POSIX:SYSCALL-ERROR # #) (ARCDOCDB.CONDITIONS:IO-FAULT # #)))))
; 
; note: Type assertion too complex to check efficiently:
; (VALUES (UNSIGNED-BYTE 31) &REST T).
; It allows an unknown number of values, consider using
; (VALUES (UNSIGNED-BYTE 31) &OPTIONAL).

;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :IO-OPEN-MODE)
; 
; note: deleting unreachable code

;     (SB-POSIX:S-ISREG ARCDOCDB.IO::KIND)
; --> BLOCK LET ALIEN-FUNCALL 
; ==>
;   1
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (SB-POSIX:S-ISDIR ARCDOCDB.IO::KIND)
; --> BLOCK LET ALIEN-FUNCALL 
; ==>
;   1
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; in: DEFUN NATIVE-READ
;     (LET ((ARCDOCDB.IO::N
;            (ARCDOCDB.IO::%PREAD ARCDOCDB.IO::FD
;             (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT ARCDOCDB.IO::OFFSET)))
;       (WHEN (= ARCDOCDB.IO::N -1)
;         (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME
;                'ARCDOCDB.IO::PREAD))
;       ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

; in: DEFUN NATIVE-WRITE
;     (LET ((ARCDOCDB.IO::N
;            (ARCDOCDB.IO::%WRITE ARCDOCDB.IO::FD
;             (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT)))
;       (WHEN (= ARCDOCDB.IO::N -1)
;         (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME 'WRITE))
;       ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/native-tmpOU81XRV0.fasl
; compilation finished in 0:00:00.017
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/lifecycle.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/lifecycle.lisp
; in: DEFUN NOME-FILE
;     (PATHNAME ARCDOCDB.IO::PATH)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR STRING PATHNAME), not a PATHNAME.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR STRING PATHNAME), not a STRING.

;     (LENGTH ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.

;     (FIND #\\Nul ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a (OR CONS VECTOR
;                                SB-KERNEL:EXTENDED-SEQUENCE), not a (OR LIST
;                                                                        VECTOR).

;     (FIND-IF (LAMBDA (ARCDOCDB.IO::C) (CHAR/= ARCDOCDB.IO::C #\\/))
;              ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a (OR CONS VECTOR
;                                SB-KERNEL:EXTENDED-SEQUENCE), not a (OR LIST
;                                                                        VECTOR).

;     (STRING-RIGHT-TRIM \"/\" ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The second argument is a STRING, not a SIMPLE-STRING.

;     (LENGTH ARCDOCDB.IO::NAME)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR CONS VECTOR
;                               SB-KERNEL:EXTENDED-SEQUENCE), not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR CONS VECTOR
;                               SB-KERNEL:EXTENDED-SEQUENCE), not a VECTOR.

;     (STRING= ARCDOCDB.IO::NAME \".tmp\" :START1 (- (LENGTH ARCDOCDB.IO::NAME) 4))
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a STRING, not a (SIMPLE-ARRAY CHARACTER (*)).


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/lifecycle-tmpY2ML9CFA.fasl
; compilation finished in 0:00:00.024
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/transfer.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/transfer.lisp
; in: DEFUN LEGGI-ESATTO
;     (LOOP ARCDOCDB.IO::REPEAT
;           COUNT
;           ARCDOCDB.IO::UNTIL (= ARCDOCDB.IO::DONE COUNT)
;           DO (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;                     (ARCDOCDB.IO::N
;                      (IF ARCDOCDB.IO:BACKEND
;                          #
;                          #)))
;                (INCF ARCDOCDB.IO::DONE
;                      (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;                       ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE))))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;            (ARCDOCDB.IO::N
;             (IF ARCDOCDB.IO:BACKEND
;                 (FUNCALL # # ARCDOCDB.IO::BUFFER # ARCDOCDB.IO::REMAINING #)
;                 (ARCDOCDB.IO::NATIVE-READ # ARCDOCDB.IO::BUFFER #
;                                           ARCDOCDB.IO::REMAINING #))))
;       (INCF ARCDOCDB.IO::DONE
;             (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;              ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE)))
; 
; note: doing signed word to integer coercion (cost 20) to REMAINING

;     (ARCDOCDB.IO::NATIVE-READ (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE)
;                               ARCDOCDB.IO::BUFFER
;                               (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE)
;                               ARCDOCDB.IO::REMAINING
;                               (+ ARCDOCDB.IO::OFFSET ARCDOCDB.IO::DONE))
; --> BLOCK SB-SYS:WITH-PINNED-OBJECTS LET 
; ==>
;   (LET ((ARCDOCDB.IO::N
;          (ARCDOCDB.IO::%PREAD ARCDOCDB.IO::FD
;                               (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT
;                               ARCDOCDB.IO::OFFSET)))
;     (WHEN (= ARCDOCDB.IO::N -1)
;       (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME
;              'ARCDOCDB.IO::PREAD))
;     ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

;     (INCF ARCDOCDB.IO::DONE
;           (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;            ARCDOCDB.IO::REMAINING :READ ARCDOCDB.IO::DONE))
; 
; note: doing signed word to integer coercion (cost 20) to DONE

;     (FUNCALL (ARCDOCDB.IO::BACKEND-READER ARCDOCDB.IO:BACKEND)
;              (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE) ARCDOCDB.IO::BUFFER
;              (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE) ARCDOCDB.IO::REMAINING
;              (+ ARCDOCDB.IO::OFFSET ARCDOCDB.IO::DONE))
; 
; note: doing unsigned word to integer coercion (cost 20)
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN APPEND-ESATTO
;     (LOOP ARCDOCDB.IO::REPEAT
;           COUNT
;           ARCDOCDB.IO::UNTIL (= ARCDOCDB.IO::DONE COUNT)
;           DO (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;                     (ARCDOCDB.IO::N
;                      (IF ARCDOCDB.IO:BACKEND
;                          #
;                          #))
;                     (ARCDOCDB.IO::PROGRESS
;                      (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;                       ARCDOCDB.IO::REMAINING :WRITE ARCDOCDB.IO::DONE)))
;                (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
;                (INCF (ARCDOCDB.IO::FILE-WRITTEN ARCDOCDB.IO::FILE)
;                      ARCDOCDB.IO::PROGRESS)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (LET* ((ARCDOCDB.IO::REMAINING (- COUNT ARCDOCDB.IO::DONE))
;            (ARCDOCDB.IO::N
;             (IF ARCDOCDB.IO:BACKEND
;                 (FUNCALL # # ARCDOCDB.IO::BUFFER # ARCDOCDB.IO::REMAINING)
;                 (ARCDOCDB.IO::NATIVE-WRITE # ARCDOCDB.IO::BUFFER #
;                                            ARCDOCDB.IO::REMAINING)))
;            (ARCDOCDB.IO::PROGRESS
;             (ARCDOCDB.IO::PROGRESSO ARCDOCDB.IO::FILE ARCDOCDB.IO::N
;              ARCDOCDB.IO::REMAINING :WRITE ARCDOCDB.IO::DONE)))
;       (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
;       (INCF (ARCDOCDB.IO::FILE-WRITTEN ARCDOCDB.IO::FILE) ARCDOCDB.IO::PROGRESS))
; 
; note: doing signed word to integer coercion (cost 20) to REMAINING

;     (ARCDOCDB.IO::NATIVE-WRITE (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE)
;                                ARCDOCDB.IO::BUFFER
;                                (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE)
;                                ARCDOCDB.IO::REMAINING)
; --> BLOCK SB-SYS:WITH-PINNED-OBJECTS LET 
; ==>
;   (LET ((ARCDOCDB.IO::N
;          (ARCDOCDB.IO::%WRITE ARCDOCDB.IO::FD
;                               (SB-SYS:SAP+ # ARCDOCDB.IO::START) COUNT)))
;     (WHEN (= ARCDOCDB.IO::N -1)
;       (ERROR 'SB-POSIX:SYSCALL-ERROR :ERRNO (GET-ERRNO) :NAME 'WRITE))
;     ARCDOCDB.IO::N)
; 
; note: doing signed word to integer coercion (cost 20) to N

;     (INCF ARCDOCDB.IO::DONE ARCDOCDB.IO::PROGRESS)
; 
; note: doing signed word to integer coercion (cost 20) to DONE

;     (FUNCALL (ARCDOCDB.IO::BACKEND-WRITER ARCDOCDB.IO:BACKEND)
;              (ARCDOCDB.IO::FILE-FD ARCDOCDB.IO::FILE) ARCDOCDB.IO::BUFFER
;              (+ ARCDOCDB.IO::START ARCDOCDB.IO::DONE) ARCDOCDB.IO::REMAINING)
; 
; note: doing unsigned word to integer coercion (cost 20)


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/transfer-tmpX2JYJDQE.fasl
; compilation finished in 0:00:00.014
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/flush.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/io/flush-tmpOPCILR65.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/package-tmpRV9F8A9A.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/types.lisp
; in: DEFSTRUCT LOG-IO
;     (ARCDOCDB.WAL::FILE-ID 0 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.WAL::LOG-IO-FILE-ID
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.WAL::LOG-IO-FILE-ID
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.WAL:LOG-IO SB-KERNEL:INSTANCE) 3))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFSTRUCT LOTTO
;     (ARCDOCDB.WAL::FILE-ID 0 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.WAL::LOTTO-FILE-ID
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.WAL::LOTTO-FILE-ID
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.WAL:LOTTO SB-KERNEL:INSTANCE) 2))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/types-tmpK2ZAJT4I.fasl
; compilation finished in 0:00:00.077
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/builder.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/builder-tmpUX5S4ADN.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/group.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/group.lisp
; in: DEFUN VERIFICA-IDENTITA-LOTTO
;     (= (ARCDOCDB.WAL::LOTTO-START ARCDOCDB.WAL:LOTTO)
;        (+ (ARCDOCDB.WAL::GRUPPO-START ARCDOCDB.WAL::GROUP)
;           (ARCDOCDB.WAL::GRUPPO-BYTES ARCDOCDB.WAL::GROUP)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/group-tmp10401X32.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/executor.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/executor.lisp
; in: DEFUN SCRIVI-GRUPPO
;     (= ARCDOCDB.WAL::END
;        (+ (ARCDOCDB.WAL::LOTTO-START ARCDOCDB.WAL:LOTTO)
;           (ARCDOCDB.WAL::LOTTO-USED ARCDOCDB.WAL:LOTTO)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; in: DEFUN SINCRONIZZA-GRUPPO
;     (= ARCDOCDB.WAL::END
;        (+ (ARCDOCDB.WAL::GRUPPO-START ARCDOCDB.WAL::GROUP)
;           (ARCDOCDB.WAL::GRUPPO-BYTES ARCDOCDB.WAL::GROUP)))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/executor-tmpZ7CBRM0G.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/csn.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/csn.lisp
; in: DEFUN VERIFICA-FILE-CSN
;     (LET* ((ARCDOCDB.WAL::FILE (ARCDOCDB.WAL::LOG-IO-FILE LOG))
;            (ARCDOCDB.WAL::WRITTEN
;             (ARCDOCDB.IO:POSIZIONE-SCRITTA ARCDOCDB.WAL::FILE))
;            (ARCDOCDB.WAL::SIZE
;             (+ (ARCDOCDB.WAL::LOTTO-USED ARCDOCDB.WAL:LOTTO)
;                ARCDOCDB.WAL::+SEAL-TOTAL+)))
;       (UNLESS (<= ARCDOCDB.WAL::WRITTEN ARCDOCDB.WAL::FILE-START)
;         (ERROR 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :REASON
;                :LOTTO-WRITTEN-OFFSET))
;       (ARCDOCDB.IO:VERIFICA-CAPIENZA-APPEND ARCDOCDB.WAL::FILE
;                                             (+
;                                              (- ARCDOCDB.WAL::FILE-START
;                                                 ARCDOCDB.WAL::WRITTEN)
;                                              ARCDOCDB.WAL::SIZE)
;                                             ARCDOCDB.WAL::SIZE)
;       (UNLESS
;           (<= ARCDOCDB.WAL::DURABLE
;               (ARCDOCDB.IO:POSIZIONE-DUREVOLE ARCDOCDB.WAL::FILE))
;         (ERROR 'ARCDOCDB.CONDITIONS:INVALID-ARGUMENT :REASON
;                :LOTTO-FUTURE-DURABLE)))
; 
; note: doing signed word to integer coercion (cost 20) to SIZE

;     (ARCDOCDB.IO:VERIFICA-CAPIENZA-APPEND ARCDOCDB.WAL::FILE
;                                           (+
;                                            (- ARCDOCDB.WAL::FILE-START
;                                               ARCDOCDB.WAL::WRITTEN)
;                                            ARCDOCDB.WAL::SIZE)
;                                           ARCDOCDB.WAL::SIZE)
; 
; note: doing unsigned word to integer coercion (cost 20)


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/wal/csn-tmp9OZEQ0G2.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/package-tmpB2JTL1W9.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/types-tmpP3BI68WQ.fasl
; compilation finished in 0:00:00.058
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/ownership.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/ownership.lisp
; in: DEFUN %MARK-FAULT
;     (SETF (ARCDOCDB.SERIES::CONTROLLORE-SERIE-STATE ARCDOCDB.SERIES::CONTROLLER)
;             :ARCHIVE-FAULTED)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/ownership-tmpQDARA81Z.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/events.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/events.lisp
; in: DEFUN %CHECK-LOTTO-RELEASE
;     (ARCDOCDB.SERIES::%SERIE-INVARIANT ARCDOCDB.SERIES::CONTROLLER
;                                        :SERIE-RELEASE-KIND)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/events-tmpYEMMM7SE.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/io-events.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/io-events-tmp73HU0RPK.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/publication.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/publication-tmpIO5N7K88.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/query.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/query.lisp
; in: DEFUN AMBITO-FAULT-SERIE
;     (ARCDOCDB.SERIES::%SERIE-INVARIANT ARCDOCDB.SERIES::CONTROLLER :SERIE-HEALTH)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/query-tmpCM21U60Z.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/retirement.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/retirement-tmp9DT7SEFG.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-package.lisp\" (written 11 OCT 2026 02:47:54 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-package-tmp8065ESJT.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-types.lisp\" (written 11 OCT 2026 01:38:17 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-types-tmp7S8Z6FGF.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-boundary.lisp\" (written 11 OCT 2026 01:48:03 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-boundary-tmpSIT3QPKP.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-run.lisp\" (written 11 OCT 2026 01:48:03 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/worker-run-tmpE0PA0714.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-types.lisp\" (written 11 OCT 2026 02:49:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-types-tmpJRWHHVG0.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-build.lisp\" (written 11 OCT 2026 02:47:54 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-build.lisp
; in: DEFUN CREA-REGISTRO-WORKER-SERIE
;     (COPY-SEQ ARCDOCDB.EXECUTION.SERIES::WRITERS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a LIST.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a SB-KERNEL:EXTENDED-SEQUENCE.

;     (COPY-SEQ ARCDOCDB.EXECUTION.SERIES::CONTROLLERS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a LIST.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a SB-KERNEL:EXTENDED-SEQUENCE.

; in: DEFUN CREA-TABELLA-WORKER-SERIE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :WORKER-SERIE-ROUTING)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-build-tmp4WZVROCX.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-select.lisp\" (written 11 OCT 2026 02:49:38 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/series/routing-select-tmpA0I3UKX8.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/package-tmp267Y2N80.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/types.lisp
; in: DEFUN CREA-BANCO-SLOT
;     (PLUSP ARCDOCDB.INDEX.SLOTS::BUDGET-BYTES)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/types-tmpOUPE5FSJ.fasl
; compilation finished in 0:00:00.016
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/core-tmpIGHCU6ZA.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/validation.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/validation-tmpBO0TUGLK.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/read.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/read.lisp
; in: DEFUN LEGGI-SLOT-V2
;     (ARCDOCDB.INDEX.SLOTS::GUASTO-SLOT ARCDOCDB.INDEX.SLOTS::BANK
;                                        :INDEX-SLOT-READ-STATE)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/read-tmpIIXPIQNW.fasl
; compilation finished in 0:00:00.017
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/write.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/write-tmpOHM494YR.fasl
; compilation finished in 0:00:00.031
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/relocate.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/relocate-tmpOVFB07XF.fasl
; compilation finished in 0:00:00.022
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-package.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-package-tmpG6VFGMYP.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-types.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-types-tmp4QIPRMOF.fasl
; compilation finished in 0:00:00.025
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-core.lisp
; in: DEFUN ESIGI-CHIAVE
;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-core-tmpGW0QV22K.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-build.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-build-tmp2K9J0HSR.fasl
; compilation finished in 0:00:00.032
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-probe.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-probe.lisp
; in: DEFUN SONDA-GRUPPO
;     (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-OWNER
;      ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-probe-tmpP44I4E0Y.fasl
; compilation finished in 0:00:00.038
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-read.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-read.lisp
; in: DEFUN LEGGI-INDICE-PRIMARIO
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-read-tmp63LQ7EX6.fasl
; compilation finished in 0:00:00.014
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-write.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-write.lisp
; in: DEFUN PREPARA-CHIAVE-WRITER
;     (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
; 
; note: forced to do +/UNSIGNED-SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (INTEGER -9223372036854775807
;                                 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743103)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a (INTEGER -9223372036854775807
;                                 9223372036854775807), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743103)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (> (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
;        (LENGTH
;         (ARCDOCDB.INDEX.PRIMARY::FRAMMENTO-INDICE-ARENA
;          ARCDOCDB.INDEX.PRIMARY::FRAGMENT)))
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743103), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743103), not a (UNSIGNED-BYTE
;                                                                                          64).
;       etc.

;     (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
; 
; note: forced to do */SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -4294967296)
;                            (INTEGER 0 0)
;                            (INTEGER 4294967296 39614081257132168792477007872))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372036854775807), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -4294967296)
;                            (INTEGER 0 0)
;                            (INTEGER 4294967296 39614081257132168792477007872))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.

;     (LOGIOR ARCDOCDB.INDEX.PRIMARY::OFFSET (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
;             (ASH 1 48))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (OR
;                                 (INTEGER -39614081257132168792477007872
;                                  -4294967296)
;                                 (INTEGER 0 0)
;                                 (INTEGER 4294967296
;                                  39614081257132168792477007872)), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -39614081257132168792477007872
;                         39614081257132168796771975167)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The second argument is a (OR
;                                 (INTEGER -39614081257132168792477007872
;                                  -4294967296)
;                                 (INTEGER 0 0)
;                                 (INTEGER 4294967296
;                                  39614081257132168792477007872)), not a (UNSIGNED-BYTE
;                                                                          64).
;       The result is a (VALUES
;                        (INTEGER -39614081257132168792477007872
;                         39614081257132168796771975167)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -39614081257132168792477007872
;                                39614081257132168796771975167), not a FIXNUM.
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -1)
;                            (INTEGER 281474976710656
;                             39614081257132168796771975167))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 3) because:
;       The first argument is a (INTEGER -39614081257132168792477007872
;                                39614081257132168796771975167), not a (UNSIGNED-BYTE
;                                                                       64).
;       The result is a (VALUES
;                        (OR (INTEGER -39614081257132168792477007872 -1)
;                            (INTEGER 281474976710656
;                             39614081257132168796771975167))
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (ASH ARCDOCDB.INDEX.PRIMARY::SIZE 32)
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of */SIGNED=>S128

;     (+ ARCDOCDB.INDEX.PRIMARY::OFFSET ARCDOCDB.INDEX.PRIMARY::SIZE)
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of +/UNSIGNED-SIGNED=>S128

; in: DEFUN PUBBLICA-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

; in: DEFUN RIMUOVI-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-write-tmp86F1A8FB.fasl
; compilation finished in 0:00:00.021
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-relocate.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-relocate.lisp
; in: DEFUN RILOCA-CHIAVE-INDICE
;     (ARCDOCDB.INDEX.PRIMARY::ESIGI-CHIAVE ARCDOCDB.INDEX.PRIMARY::KEY
;                                           ARCDOCDB.INDEX.PRIMARY::START
;                                           ARCDOCDB.INDEX.PRIMARY::END)
; --> BLOCK UNLESS IF <= 
; ==>
;   1
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.

;     (- ARCDOCDB.INDEX.PRIMARY::END ARCDOCDB.INDEX.PRIMARY::START)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM
;                                                                 &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (UNSIGNED-BYTE 64)
;                                                          &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-relocate-tmpH7D4HL98.fasl
; compilation finished in 0:00:00.018
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-arena.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-arena.lisp
; in: DEFUN PAYLOAD-ROOT
;     (INCF ARCDOCDB.INDEX.PRIMARY::SUM
;           (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;            ARCDOCDB.INDEX.PRIMARY::FRAGMENT))
; ==>
;   (+
;    (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;    ARCDOCDB.INDEX.PRIMARY::SUM)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a (INTEGER * 4611686018427387903), not a FIXNUM.
;       The result is a (VALUES (INTEGER * 9223372036854775806) &OPTIONAL), not a (VALUES
;                                                                                  FIXNUM
;                                                                                  &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The second argument is a (INTEGER * 4611686018427387903), not a (UNSIGNED-BYTE
;                                                                        64).
;       The result is a (VALUES (INTEGER * 9223372036854775806) &OPTIONAL), not a (VALUES
;                                                                                  (UNSIGNED-BYTE
;                                                                                   64)
;                                                                                  &OPTIONAL).
;       etc.

;     (> ARCDOCDB.INDEX.PRIMARY::SUM MOST-POSITIVE-FIXNUM)
; 
; note: forced to do >-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER * 9223372036854775806), not a FIXNUM.

; in: DEFUN ESTENDI-ARENA-INDICE
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;        (IF ARCDOCDB.INDEX.PRIMARY::BUILDING
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;             ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;            0)
;        ARCDOCDB.INDEX.PRIMARY::NEW-SIZE)
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775808 9223372036854775806), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743102)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775808 9223372036854775806), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775807 9223372041149743102)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (>
;      (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;         (IF ARCDOCDB.INDEX.PRIMARY::BUILDING
;             (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO
;              ARCDOCDB.INDEX.PRIMARY::FRAGMENT)
;             0)
;         ARCDOCDB.INDEX.PRIMARY::NEW-SIZE)
;      ARCDOCDB.INDEX.PRIMARY::TRANSIENT-BUDGET-BYTES)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743102), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -9223372036854775807 9223372041149743102), not a (UNSIGNED-BYTE
;                                                                                          64).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-arena-tmpCDM7YXYI.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-directory.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-directory.lisp
; in: DEFUN VERIFICA-PIANO-DIRECTORY
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;        ARCDOCDB.INDEX.PRIMARY::BYTES
;        (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;        (IF SECOND
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;            0))
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -4611686018427387896 4611686027017322495), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775800 9223372045444710398)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -4611686018427387896 4611686027017322495), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775800 9223372045444710398)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do +/S128+SIGNED=>S128 (cost 11)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775800 9223372045444710398), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -13835058055282163704 13835058063872098301)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775800 9223372045444710398), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -13835058055282163704 13835058063872098301)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (>
;      (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;         ARCDOCDB.INDEX.PRIMARY::BYTES
;         (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;         (IF SECOND
;             (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;             0))
;      ARCDOCDB.INDEX.PRIMARY::TRANSIENT-BUDGET)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -13835058055282163704
;                                13835058063872098301), not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -13835058055282163704
;                                13835058063872098301), not a (UNSIGNED-BYTE 64).
;       etc.

;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::OLD)
;        ARCDOCDB.INDEX.PRIMARY::BYTES
;        (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO FIRST)
;        (IF SECOND
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-FRAMMENTO SECOND)
;            0))
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of +/S128+SIGNED=>S128


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/primary-directory-tmpLM57P5P.fasl
; compilation finished in 0:00:00.017
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-scan.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-scan.lisp
; in: DEFUN MISURA-RICOSTRUZIONE
;     (INCF ARCDOCDB.INDEX.PRIMARY::LIVE)
; ==>
;   (+ 1 ARCDOCDB.INDEX.PRIMARY::LIVE)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.

;     (INCF SECOND ARCDOCDB.INDEX.PRIMARY::SIZE)
; ==>
;   (+ ARCDOCDB.INDEX.PRIMARY::SIZE SECOND)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

;     (INCF FIRST ARCDOCDB.INDEX.PRIMARY::SIZE)
; ==>
;   (+ ARCDOCDB.INDEX.PRIMARY::SIZE FIRST)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The second argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The second argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-scan-tmpZE69DN33.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-budget.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-budget.lisp
; in: DEFUN BUDGET-RICOSTRUZIONE
;     (+ (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;        DIRECTORY ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST
;        (IF ARCDOCDB.INDEX.PRIMARY::SPLIT
;            (+ ARCDOCDB.INDEX.PRIMARY::SLOTS SECOND)
;            0))
; 
; note: forced to do +/SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -4611686018427387240 4611686035609944063), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -9223372036854775144 9223372054037331966)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -4611686018427387240 4611686035609944063), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -9223372036854775144 9223372054037331966)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.
; 
; note: forced to do +/S128+SIGNED=>S128 (cost 11)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER -9223372036854775144 9223372054037331966), not a FIXNUM.
;       The second argument is a (INTEGER -4611686018427387248
;                                 4611686018430074879), not a FIXNUM.
;       The result is a (VALUES
;                        (INTEGER -13835058055282162392 13835058072467406845)
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER -9223372036854775144 9223372054037331966), not a (UNSIGNED-BYTE
;                                                                                          64).
;       The second argument is a (INTEGER -4611686018427387248
;                                 4611686018430074879), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES
;                        (INTEGER -13835058055282162392 13835058072467406845)
;                        &OPTIONAL), not a (VALUES (UNSIGNED-BYTE 64) &OPTIONAL).
;       etc.

;     (> ARCDOCDB.INDEX.PRIMARY::PAYLOAD ARCDOCDB.INDEX.PRIMARY::BUDGET)
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER -13835058055282162392
;                                13835058072467406845), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER -13835058055282162392
;                                13835058072467406845), not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.

;     (LET* ((ARCDOCDB.INDEX.PRIMARY::DEPTH
;             (MAX
;              (ARCDOCDB.INDEX.PRIMARY::ROOT-INDICE-DEPTH
;               ARCDOCDB.INDEX.PRIMARY::ROOT)
;              (+ # #)))
;            (DIRECTORY (* 8 (ASH 1 ARCDOCDB.INDEX.PRIMARY::DEPTH)))
;            (ARCDOCDB.INDEX.PRIMARY::SLOTS
;             (* 41
;                (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-CAPACITY
;                 ARCDOCDB.INDEX.PRIMARY::INDEX)))
;            (ARCDOCDB.INDEX.PRIMARY::PAYLOAD
;             (+
;              (ARCDOCDB.INDEX.PRIMARY::PAYLOAD-ROOT ARCDOCDB.INDEX.PRIMARY::ROOT)
;              DIRECTORY ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST
;              (IF ARCDOCDB.INDEX.PRIMARY::SPLIT
;                  #
;                  0))))
;       (WHEN
;           (> DIRECTORY
;              (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-DIRECTORY-BUDGET
;               ARCDOCDB.INDEX.PRIMARY::INDEX))
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-DIRECTORY-MEMORY-BUDGET))
;       (WHEN
;           (OR
;            (> (+ ARCDOCDB.INDEX.PRIMARY::SLOTS FIRST)
;               (ARCDOCDB.INDEX.PRIMARY::INDICE-PRIMARIO-FRAGMENT-BUDGET
;                ARCDOCDB.INDEX.PRIMARY::INDEX))
;            (AND ARCDOCDB.INDEX.PRIMARY::SPLIT (> # #)))
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-FRAGMENT-MEMORY-BUDGET))
;       (WHEN (> ARCDOCDB.INDEX.PRIMARY::PAYLOAD ARCDOCDB.INDEX.PRIMARY::BUDGET)
;         (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                :PRIMARY-DIRECTORY-TRANSIENT-BUDGET))
;       (ARCDOCDB.INDEX.PRIMARY::CREDITO-RICOSTRUZIONE
;        ARCDOCDB.INDEX.PRIMARY::INDEX ARCDOCDB.INDEX.PRIMARY::ROOT
;        ARCDOCDB.INDEX.PRIMARY::SOURCE)
;       (VALUES ARCDOCDB.INDEX.PRIMARY::DEPTH ARCDOCDB.INDEX.PRIMARY::PAYLOAD))
; 
; note: doing signed 128 to integer coercion (cost 30) to PAYLOAD


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-budget-tmpG8099TO3.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-copy.lisp\" (written 11 OCT 2026 12:35:07 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-copy-tmpTASQCYAW.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild.lisp\" (written 11 OCT 2026 12:35:07 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild.lisp
; in: DEFUN RICOSTRUISCI-FRAMMENTO-INDICE
;     (ASH 1 ARCDOCDB.INDEX.PRIMARY::GLOBAL)
; 
; note: forced to do full call
;       unable to do inline ASH (cost 2) because:
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline ASH (cost 3) because:
;       The second argument is a FIXNUM, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/rebuild-tmp35U57IV6.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-seed.lisp\" (written 11 OCT 2026 01:50:28 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-seed-tmpTZOONXRW.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-digests.lisp\" (written 11 OCT 2026 01:50:28 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-digests.lisp
; in: DEFUN CALCOLA-DIGESTS-FRAMMENTO
;     (= ARCDOCDB.INDEX.PRIMARY::EXPECTED-HIGH ARCDOCDB.INDEX.PRIMARY::SEED-HIGH)
; 
; note: unable to open code because: The operands might not be the same type.

;     (= ARCDOCDB.INDEX.PRIMARY::EXPECTED-LOW ARCDOCDB.INDEX.PRIMARY::SEED-LOW)
; 
; note: unable to open code because: The operands might not be the same type.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/index/hash-digests-tmpWN0UKDSV.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/package-tmpBF3HHBTQ.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/types-tmpGYUNPZCY.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-types.lisp
; in: DEFSTRUCT REGISTRO-SNAPSHOT
;     (ARCDOCDB.MVCC::LIFETIME 1 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-LIFETIME
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-LIFETIME
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.MVCC:REGISTRO-SNAPSHOT
;                               SB-KERNEL:INSTANCE)
;                          2))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

;     (ARCDOCDB.MVCC::WAIT 1 :TYPE ARCDOCDB.BINARY:U64 :READ-ONLY T)
; --> SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WAIT
;         (SB-KERNEL:INSTANCE)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       (BLOCK ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WAIT
;         (SB-KERNEL:THE* (ARCDOCDB.BINARY:U64 :DERIVE-TYPE-ONLY T)
;                         (SB-KERNEL:%RAW-INSTANCE-REF/WORD
;                          (THE ARCDOCDB.MVCC:REGISTRO-SNAPSHOT
;                               SB-KERNEL:INSTANCE)
;                          3))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN CREA-REGISTRO-SNAPSHOT
;     (<= 1 ARCDOCDB.MVCC::WAIT-TICKS ARCDOCDB.MVCC::LIFETIME-TICKS
;         ARCDOCDB.MVCC::+MAX-CSN+)
; 
; note: forced to do <-INTEGER-FIXNUM (cost 10)
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a INTEGER, not a FIXNUM.
; 
; note: forced to do full call
;       unable to do inline fixnum comparison (cost 4) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The second argument is a INTEGER, not a FIXNUM.
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The second argument is a INTEGER, not a (UNSIGNED-BYTE 64).
;       etc.
; 
; note: forced to do full call
;       unable to do inline (unsigned-byte 64) comparison (cost 6) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-types-tmpD68Q8WCA.fasl
; compilation finished in 0:00:00.015
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-core.lisp
; in: DEFUN RICALCOLA-SOGLIA-SNAPSHOT
;     (INCF COUNT)
; ==>
;   (+ 1 COUNT)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-core-tmp7MK9KM9C.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-csn.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-csn.lisp
; in: DEFUN FRONTIERE-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT (ARCDOCDB.MVCC::REGISTRY)
;       #<(SIMPLE-ARRAY CHARACTER
;          (287)) Pre: mutex snapshot posseduto, registro sano dell'Archivio. Post: H e ultimo CSN coerenti.
;   RESOURCE-EXHAUSTED :CSN-BUSY senza attesa. Guasto CSN invalida gli snapshot e rilancia la condizione.
;   Convers... {8006E4AC2F}>
;       (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;       (HANDLER-CASE
;        (MULTIPLE-VALUE-BIND
;            (ARCDOCDB.MVCC::LAST-HIGH ARCDOCDB.MVCC::LAST-LOW
;             ARCDOCDB.MVCC::HORIZON-HIGH ARCDOCDB.MVCC::HORIZON-LOW)
;            (ARCDOCDB.CSN:LEGGI-FRONTIERE-CSN
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-CSNS ARCDOCDB.MVCC::REGISTRY))
;          (DECLARE
;           (TYPE ARCDOCDB.BINARY:U32 ARCDOCDB.MVCC::LAST-HIGH
;            ARCDOCDB.MVCC::LAST-LOW ARCDOCDB.MVCC::HORIZON-HIGH
;            ARCDOCDB.MVCC::HORIZON-LOW))
;          (LET (# #)
;            (DECLARE #)
;            (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;            (WHEN # #)
;            (VALUES ARCDOCDB.MVCC::HORIZON LAST)))
;        (ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION (CONDITION)
;         (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;         (ERROR CONDITION))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT
;         (ARCDOCDB.MVCC::REGISTRY)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-BASE-STRING
;          287) Pre: mutex snapshot posseduto, registro sano dell'Archivio. Post: H e ultimo CSN coerenti.
; RESOURCE-EXHAUSTED :CSN-BUSY senza attesa. Guasto CSN invalida gli snapshot e rilancia la condizione.
; Convers... {8006E4C46F}>
;       (BLOCK ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (HANDLER-CASE
;          (MULTIPLE-VALUE-BIND
;              (ARCDOCDB.MVCC::LAST-HIGH ARCDOCDB.MVCC::LAST-LOW
;               ARCDOCDB.MVCC::HORIZON-HIGH ARCDOCDB.MVCC::HORIZON-LOW)
;              (ARCDOCDB.CSN:LEGGI-FRONTIERE-CSN #)
;            (DECLARE #)
;            (LET #
;              #
;              #
;              #
;              #))
;          (ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION (CONDITION)
;           (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;           (ERROR CONDITION)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from HORIZON to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) from LAST to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-csn-tmpJJ71X849.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-register.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-register.lisp
; in: DEFUN REGISTRA-SNAPSHOT-SOTTO-MUTEX
;     (LET* ((ARCDOCDB.MVCC::REGISTRY
;             (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-REGISTRY ARCDOCDB.MVCC::CONTEXT))
;            (ARCDOCDB.MVCC::SLOT
;             (ARCDOCDB.MVCC::PREPARA-REGISTRAZIONE-SNAPSHOT ARCDOCDB.MVCC::CONTEXT
;              ARCDOCDB.MVCC::NOW))
;            (ARCDOCDB.MVCC::WORDS
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY))
;            (ARCDOCDB.MVCC::GENERATION (1+ (AREF ARCDOCDB.MVCC::WORDS 0)))
;            (ARCDOCDB.MVCC::ANNOUNCEMENT
;             (ARCDOCDB.MVCC::FRONTIERE-SNAPSHOT ARCDOCDB.MVCC::REGISTRY))
;            (ARCDOCDB.MVCC::PREVIOUS (AREF ARCDOCDB.MVCC::WORDS 1))
;            (ARCDOCDB.MVCC::COMPLETE NIL))
;       (DECLARE
;        (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::GENERATION
;         ARCDOCDB.MVCC::ANNOUNCEMENT ARCDOCDB.MVCC::PREVIOUS))
;       (UNWIND-PROTECT
;           (PROGN
;            (SETF # #)
;            (SB-THREAD:BARRIER (:MEMORY))
;            (MULTIPLE-VALUE-BIND
;                (ARCDOCDB.MVCC::CAPTURED ARCDOCDB.MVCC::HORIZON
;                 ARCDOCDB.MVCC::CSN)
;                (ARCDOCDB.MVCC::TENTA-CATTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;              (DECLARE #)
;              (UNLESS ARCDOCDB.MVCC::CAPTURED # # # # # #)
;              (UNLESS # #)
;              (LET #
;                #
;                #
;                #)))
;         (UNLESS ARCDOCDB.MVCC::COMPLETE
;           (ARCDOCDB.MVCC:INVALIDA-REGISTRO-SNAPSHOT ARCDOCDB.MVCC::REGISTRY))))
; 
; note: doing unsigned word to integer coercion (cost 20) to GENERATION


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-register-tmp1VUK6SR2.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-lifecycle.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-lifecycle.lisp
; in: DEFUN ATTIVA-SNAPSHOT
;     (ARCDOCDB.MVCC::ORIZZONTE-SNAPSHOT-RAGGIUNTO-P ARCDOCDB.MVCC::REGISTRY
;                                                    (AREF
;                                                     (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-CSNS-ARRAY
;                                                      ARCDOCDB.MVCC::REGISTRY)
;                                                     ARCDOCDB.MVCC::SLOT))
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN SCADI-SNAPSHOT
;     (INCF ARCDOCDB.MVCC::EXPIRED)
; ==>
;   (+ 1 ARCDOCDB.MVCC::EXPIRED)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a UNSIGNED-BYTE, not a FIXNUM.
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES FIXNUM
;                                                                     &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a UNSIGNED-BYTE, not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES (INTEGER 1) &OPTIONAL), not a (VALUES
;                                                              (UNSIGNED-BYTE 64)
;                                                              &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-lifecycle-tmpR2FIHSUG.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-read.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-read.lisp
; in: DEFUN VERIFICA-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;            (ARCDOCDB.MVCC::CONTEXT ARCDOCDB.MVCC::EXPECTED-GENERATION
;             ARCDOCDB.MVCC::NOW)
;       #<(SIMPLE-ARRAY CHARACTER
;          (269)) Pre: generazione originale, NOW fresco e base monotona comune; epoca già acquisita.
;   Post: CSN solo se attivo e non scaduto; chiamare PRIMA e DOPO la ricerca, anche sul miss.
;   Identità cambiata/fine/sca... {80079ACF7F}>
;       (LET* ((ARCDOCDB.MVCC::REGISTRY
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-REGISTRY ARCDOCDB.MVCC::CONTEXT))
;              (ARCDOCDB.MVCC::WORD
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-WORD ARCDOCDB.MVCC::CONTEXT))
;              (ARCDOCDB.MVCC::CONTEXT-GENERATION
;               (SB-THREAD:BARRIER #
;                 #))
;              (ARCDOCDB.MVCC::SLOT
;               (ARCDOCDB.MVCC::CONTESTO-SNAPSHOT-SLOT ARCDOCDB.MVCC::CONTEXT)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CONTEXT-GENERATION))
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (UNLESS
;             (AND (PLUSP ARCDOCDB.MVCC::EXPECTED-GENERATION)
;                  (= ARCDOCDB.MVCC::CONTEXT-GENERATION
;                     ARCDOCDB.MVCC::EXPECTED-GENERATION))
;           (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                  :SNAPSHOT-STALE-IDENTITY))
;         (UNLESS (< ARCDOCDB.MVCC::SLOT (LENGTH #))
;           (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;            :SNAPSHOT-SLOT-RANGE))
;         (UNLESS
;             (= ARCDOCDB.MVCC::EXPECTED-GENERATION
;                (SB-THREAD:BARRIER #
;                  #))
;           (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                  :SNAPSHOT-STALE-IDENTITY))
;         (LET ((ARCDOCDB.MVCC::CSN #)
;               (ARCDOCDB.MVCC::CONTEXT-CSN #)
;               (ARCDOCDB.MVCC::STATE #)
;               (ARCDOCDB.MVCC::DEADLINE #)
;               (ARCDOCDB.MVCC::WAIT-DEADLINE #))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CSN
;             ARCDOCDB.MVCC::CONTEXT-CSN ARCDOCDB.MVCC::DEADLINE
;             ARCDOCDB.MVCC::WAIT-DEADLINE))
;           (SB-THREAD:BARRIER (:READ))
;           (UNLESS (AND # #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           (UNLESS (= ARCDOCDB.MVCC::CSN ARCDOCDB.MVCC::CONTEXT-CSN)
;             (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;              :SNAPSHOT-CSN-IDENTITY))
;           (COND (# # ARCDOCDB.MVCC::CSN) (# # #) (# #) (T #)))))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;         (ARCDOCDB.MVCC::CONTEXT ARCDOCDB.MVCC::EXPECTED-GENERATION
;          ARCDOCDB.MVCC::NOW)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       #<(SIMPLE-ARRAY CHARACTER
;          (269)) Pre: generazione originale, NOW fresco e base monotona comune; epoca già acquisita.
; Post: CSN solo se attivo e non scaduto; chiamare PRIMA e DOPO la ricerca, anche sul miss.
; Identità cambiata/fine/sca... {80079ACF7F}>
;       (BLOCK ARCDOCDB.MVCC:VERIFICA-SNAPSHOT
;         (LET* ((ARCDOCDB.MVCC::REGISTRY #)
;                (ARCDOCDB.MVCC::WORD #)
;                (ARCDOCDB.MVCC::CONTEXT-GENERATION #)
;                (ARCDOCDB.MVCC::SLOT #))
;           (DECLARE
;            (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::CONTEXT-GENERATION))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           (UNLESS (AND # #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (UNLESS (< ARCDOCDB.MVCC::SLOT #)
;             (ARCDOCDB.MVCC::GUASTO-LETTURA-SNAPSHOT ARCDOCDB.MVCC::REGISTRY
;              :SNAPSHOT-SLOT-RANGE))
;           (UNLESS (= ARCDOCDB.MVCC::EXPECTED-GENERATION #)
;             (ERROR 'ARCDOCDB.CONDITIONS:SNAPSHOT-TOO-OLD :REASON
;                    :SNAPSHOT-STALE-IDENTITY))
;           (LET (# # # # #)
;             (DECLARE #)
;             (SB-THREAD:BARRIER #)
;             (UNLESS # #)
;             (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;             (UNLESS # #)
;             (COND # # # #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from CSN to \"<return value>\"

; in: DEFUN SOGLIA-SNAPSHOT
;     (DEFUN ARCDOCDB.MVCC:SOGLIA-SNAPSHOT (ARCDOCDB.MVCC::REGISTRY)
;       \"Pre: registro sano. Post: soglia acquire, conservativa; MAX-U64 se nessuno la abbassa.
;   È un limite logico, non autorizza da sola il reclaim di un segmento referenziato da EBR.\"
;       (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;       (LET ((ARCDOCDB.MVCC::THRESHOLD
;              (SB-THREAD:BARRIER #
;                #)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::THRESHOLD))
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         ARCDOCDB.MVCC::THRESHOLD))
; --> SB-IMPL::%DEFUN SB-IMPL::%DEFUN SB-INT:NAMED-LAMBDA 
; ==>
;   #'(SB-INT:NAMED-LAMBDA ARCDOCDB.MVCC:SOGLIA-SNAPSHOT
;         (ARCDOCDB.MVCC::REGISTRY)
;       (DECLARE (SB-C::TOP-LEVEL-FORM))
;       \"Pre: registro sano. Post: soglia acquire, conservativa; MAX-U64 se nessuno la abbassa.
; È un limite logico, non autorizza da sola il reclaim di un segmento referenziato da EBR.\"
;       (BLOCK ARCDOCDB.MVCC:SOGLIA-SNAPSHOT
;         (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;         (LET ((ARCDOCDB.MVCC::THRESHOLD #))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.MVCC::THRESHOLD))
;           (ARCDOCDB.MVCC::ESIGI-SNAPSHOT-SANO ARCDOCDB.MVCC::REGISTRY)
;           ARCDOCDB.MVCC::THRESHOLD)))
; 
; note: doing unsigned word to integer coercion (cost 20) from THRESHOLD to \"<return value>\"

; in: DEFUN LEGGI-REGISTRO-SNAPSHOT
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-MUTEX
;                             ARCDOCDB.MVCC::REGISTRY)
;                            :WAIT-P NIL)
;       (SETF ARCDOCDB.MVCC::ACQUIRED T)
;       (ARCDOCDB.MVCC::VERIFICA-CONTATORI-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;       (VALUES (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-COUNT ARCDOCDB.MVCC::REGISTRY)
;               (AREF
;                (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;                1)
;               (AREF
;                (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;                0)))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL (SETF ARCDOCDB.MVCC::ACQUIRED T)
;    (ARCDOCDB.MVCC::VERIFICA-CONTATORI-SNAPSHOT ARCDOCDB.MVCC::REGISTRY)
;    (VALUES (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-COUNT ARCDOCDB.MVCC::REGISTRY)
;            (AREF
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY) 1)
;            (AREF
;             (ARCDOCDB.MVCC::REGISTRO-SNAPSHOT-WORDS ARCDOCDB.MVCC::REGISTRY)
;             0)))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/mvcc/snapshots-read-tmp8PYELRKX.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/package-tmpEHTOKYT0.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/types-tmpS6U1VHI9.fasl
; compilation finished in 0:00:00.046
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/core-tmpVTFK6ZJW.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/read.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/read-tmp75WVSJEW.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/retire.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/retire.lisp
; in: DEFUN PRENOTA-RITIRO
;     (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED ARCDOCDB.EPOCHS::REGISTRY)
;        (- ARCDOCDB.EPOCHS::+MAX-EPOCA+ ARCDOCDB.EPOCHS::EPOCH))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET* ((ARCDOCDB.EPOCHS::WORDS
;               (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY))
;              (ARCDOCDB.EPOCHS::CAPACITY (LENGTH #))
;              (LAST
;               (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-GENERATION+))
;              (ARCDOCDB.EPOCHS::EPOCH
;               (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)))
;         (DECLARE (TYPE ARCDOCDB.BINARY:U64 LAST ARCDOCDB.EPOCHS::EPOCH))
;         (WHEN
;             (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;                ARCDOCDB.EPOCHS::CAPACITY)
;           (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                  :RETIREMENT-CAPACITY))
;         (WHEN (OR (= LAST ARCDOCDB.EPOCHS::+MAX-EPOCA+) (= # #))
;           (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                  :RETIREMENT-SEQUENCE-EXHAUSTED))
;         (LET ((ARCDOCDB.EPOCHS::SLOT #)
;               (ARCDOCDB.EPOCHS::GENERATION #)
;               (ARCDOCDB.EPOCHS::COMPLETE NIL))
;           (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.EPOCHS::GENERATION))
;           (UNWIND-PROTECT (PROGN # # # # #)
;             (UNLESS ARCDOCDB.EPOCHS::COMPLETE #)))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET* ((ARCDOCDB.EPOCHS::WORDS
;            (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY))
;           (ARCDOCDB.EPOCHS::CAPACITY (LENGTH #))
;           (LAST
;            (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-GENERATION+))
;           (ARCDOCDB.EPOCHS::EPOCH
;            (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)))
;      (DECLARE (TYPE ARCDOCDB.BINARY:U64 LAST ARCDOCDB.EPOCHS::EPOCH))
;      (WHEN
;          (= (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;             ARCDOCDB.EPOCHS::CAPACITY)
;        (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;               :RETIREMENT-CAPACITY))
;      (WHEN (OR (= LAST ARCDOCDB.EPOCHS::+MAX-EPOCA+) (= # #))
;        (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;               :RETIREMENT-SEQUENCE-EXHAUSTED))
;      (LET ((ARCDOCDB.EPOCHS::SLOT #)
;            (ARCDOCDB.EPOCHS::GENERATION #)
;            (ARCDOCDB.EPOCHS::COMPLETE NIL))
;        (DECLARE (TYPE ARCDOCDB.BINARY:U64 ARCDOCDB.EPOCHS::GENERATION))
;        (UNWIND-PROTECT (PROGN # # # # #)
;          (UNLESS ARCDOCDB.EPOCHS::COMPLETE #)))))
; 
; note: doing unsigned word to integer coercion (cost 20) from GENERATION to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/retire-tmpBU5UM3S4.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/reclaim.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/reclaim.lisp
; in: DEFUN AGGIORNA-SOGLIA-RECLAIM
;     (MAX (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;          ARCDOCDB.EPOCHS::MINIMUM)
; 
; note: doing unsigned word to integer coercion (cost 20) from MINIMUM to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20)

; in: DEFUN LEGGI-RITIRO
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET* ((ARCDOCDB.EPOCHS::SLOT
;               (ARCDOCDB.EPOCHS::ESIGI-IDENTITA-RITIRO ARCDOCDB.EPOCHS::TICKET
;                                                       ARCDOCDB.EPOCHS::EXPECTED-GENERATION))
;              (ARCDOCDB.EPOCHS::STATE (AREF # ARCDOCDB.EPOCHS::SLOT)))
;         (VALUES
;          (COND (# :RESERVED) (# :RETIRED) (# :CLAIMED) (# :CANCELLED)
;                (# :COMPLETED) (T #))
;          (AREF
;           (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-EPOCHS ARCDOCDB.EPOCHS::REGISTRY)
;           ARCDOCDB.EPOCHS::SLOT))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET* ((ARCDOCDB.EPOCHS::SLOT
;            (ARCDOCDB.EPOCHS::ESIGI-IDENTITA-RITIRO ARCDOCDB.EPOCHS::TICKET
;                                                    ARCDOCDB.EPOCHS::EXPECTED-GENERATION))
;           (ARCDOCDB.EPOCHS::STATE (AREF # ARCDOCDB.EPOCHS::SLOT)))
;      (VALUES
;       (COND (# :RESERVED) (# :RETIRED) (# :CLAIMED) (# :CANCELLED)
;             (# :COMPLETED) (T #))
;       (AREF (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-EPOCHS ARCDOCDB.EPOCHS::REGISTRY)
;             ARCDOCDB.EPOCHS::SLOT))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"

; in: DEFUN LEGGI-REGISTRO-EPOCHE
;     (SB-THREAD:WITH-MUTEX ((ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-MUTEX
;                             ARCDOCDB.EPOCHS::REGISTRY))
;       (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;       (LET ((ARCDOCDB.EPOCHS::WORDS
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY)))
;         (VALUES (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)
;                 (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;                 (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT
;                  ARCDOCDB.EPOCHS::REGISTRY)
;                 (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED
;                  ARCDOCDB.EPOCHS::REGISTRY))))
; --> FLET 
; ==>
;   (SB-THREAD::WITH-MUTEX-THUNK NIL
;    (ARCDOCDB.EPOCHS::VERIFICA-CONTATORI-EPOCHE ARCDOCDB.EPOCHS::REGISTRY)
;    (LET ((ARCDOCDB.EPOCHS::WORDS
;           (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-WORDS ARCDOCDB.EPOCHS::REGISTRY)))
;      (VALUES (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-EPOCH+)
;              (AREF ARCDOCDB.EPOCHS::WORDS ARCDOCDB.EPOCHS::+WORD-THRESHOLD+)
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-COUNT ARCDOCDB.EPOCHS::REGISTRY)
;              (ARCDOCDB.EPOCHS::REGISTRO-EPOCHE-RESERVED
;               ARCDOCDB.EPOCHS::REGISTRY))))
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"
; 
; note: doing unsigned word to integer coercion (cost 20) to \"<return value>\"


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/epochs/reclaim-tmpOBHVA3CD.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/package.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/package-tmpJ6ELVFLF.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/types.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/types-tmpULDB0RG.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/core.lisp\" (written 09 OCT 2026 06:43:12 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/core-tmpUTZ0UUTE.fasl
; compilation finished in 0:00:00.005
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/task.lisp\" (written 09 OCT 2026 06:43:12 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/task.lisp
; in: DEFUN ABBANDONA-LETTURA
;     (ARCDOCDB.READ::GUASTO-CONTESTO-LETTURA ARCDOCDB.READ::CONTEXT
;                                             :READ-CONTEXT-STATE)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/read/task-tmpOOSRA8PZ.fasl
; compilation finished in 0:00:00.017
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/package.lisp\" (written 11 OCT 2026 02:04:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/package-tmpDMIL0RVK.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/types.lisp\" (written 11 OCT 2026 02:04:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/types-tmp8MR9IMIO.fasl
; compilation finished in 0:00:00.028
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/build.lisp\" (written 11 OCT 2026 02:04:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/build-tmpJQDKAVAY.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lifecycle.lisp\" (written 11 OCT 2026 02:04:23 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lifecycle-tmp3I8CEEQY.fasl
; compilation finished in 0:00:00.024
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lookup.lisp\" (written 11 OCT 2026 02:04:23 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lookup.lisp
; in: DEFUN SCEGLI-CANDIDATO-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-PRIMARY-RESULT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/lookup-tmpA3RHFLWZ.fasl
; compilation finished in 0:00:00.020
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/target.lisp\" (written 11 OCT 2026 02:04:23 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/target.lisp
; in: DEFUN SONDA-CACHE-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-RESULT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/target-tmpYZIB7VXO.fasl
; compilation finished in 0:00:00.008
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/segment.lisp\" (written 11 OCT 2026 02:04:23 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/segment.lisp
; in: DEFUN INSERISCI-CACHE-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-INSERTION)
; 
; note: deleting unreachable code

; in: DEFUN LEGGI-RECORD-GET
;     (ARCDOCDB.GET::GUASTO-GET ARCDOCDB.GET::CONTEXT :GET-CACHE-RESULT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get/segment-tmpR8PK79V8.fasl
; compilation finished in 0:00:00.016
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/package-tmpN1ZVB1HZ.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/scan.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/scan-tmpZGRRPISB.fasl
; compilation finished in 0:00:00.037
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-package.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-package-tmpFNKDE5XP.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-types-tmpRJTU435C.fasl
; compilation finished in 0:00:00.006
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-sort.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-sort-tmpI9WG87JK.fasl
; compilation finished in 0:00:00.036
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-radix.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-radix.lisp
; in: DEFUN RADIX-ENTRY-STARTS
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :DECISION-RADIX-COUNT)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-radix-tmpYDE6I9E6.fasl
; compilation finished in 0:00:00.019
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-build.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-build-tmp319UV2V8.fasl
; compilation finished in 0:00:00.035
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-query.lisp\" (written 09 OCT 2026 04:38:49 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-query.lisp
; in: DEFUN PARTICIPANT-PRESENT-P
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :DECISION-PARTICIPANT-ORDER)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-query-tmpLYQINFYS.fasl
; compilation finished in 0:00:00.009
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-package.lisp\" (written 09 OCT 2026 06:21:35 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-package-tmpGA31XWNO.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-types.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-types-tmp5HT23M6C.fasl
; compilation finished in 0:00:00.019
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-decode.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-decode-tmpA60KLDKY.fasl
; compilation finished in 0:00:00.016
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-fold.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-fold-tmpD801X3GJ.fasl
; compilation finished in 0:00:00.024
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-build.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-build-tmpGOW1GC70.fasl
; compilation finished in 0:00:00.032
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-query.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-query-tmpPQ1X28TL.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-types.lisp\" (written 09 OCT 2026 06:21:35 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-types-tmpE92ECU7O.fasl
; compilation finished in 0:00:00.024
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-build.lisp\" (written 09 OCT 2026 06:21:35 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-build.lisp
; in: DEFUN INVENTORY-PRESENCE
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-FORM)
; 
; note: deleting unreachable code

; in: DEFUN SINGLE-FILE-ACTION
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-STATE)
; 
; note: deleting unreachable code

; in: DEFUN INVENTORY-ENTRY
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-PRESENCE)
; 
; note: deleting unreachable code

; in: DEFUN ENTRY-SEVERITY
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON :INVENTORY-STATE)
; 
; note: deleting unreachable code


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-build-tmp8S0II570.fasl
; compilation finished in 0:00:00.033
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-query.lisp\" (written 09 OCT 2026 06:21:35 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-query-tmpJE88A12F.fasl
; compilation finished in 0:00:00.002
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/package.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/package-tmpA5FNLPLT.fasl
; compilation finished in 0:00:00.001
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/types.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/types-tmpHKCV9TP8.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/scan.lisp\" (written 11 OCT 2026 02:56:31 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/scan.lisp
; in: DEFUN VERIFICA-PREFISSO-WRITER
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT ARCDOCDB.GET.RESOLVER::MAX-BATCHES
;           DO (WHEN (= ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END)
;                (RETURN-FROM ARCDOCDB.GET.RESOLVER::VERIFICA-PREFISSO-WRITER
;                  NIL)) (MULTIPLE-VALUE-BIND
;                            (ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::STAMP
;                             ARCDOCDB.GET.RESOLVER::DURABLE COUNT)
;                            (ARCDOCDB.RECORD:VERIFICA-LOTTO
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END
;                             ARCDOCDB.GET.RESOLVER::ID :VERSION
;                             ARCDOCDB.GET.RESOLVER::VERSION :LOG-KIND :SEGMENT
;                             :MAX-RECORDS ARCDOCDB.GET.RESOLVER::BATCH-RECORDS
;                             :MAX-BYTES ...)
;                          (UNLESS
;                              (AND
;                               (< ARCDOCDB.GET.RESOLVER::POS
;                                  ARCDOCDB.GET.RESOLVER::NEXT)
;                               (<= ARCDOCDB.GET.RESOLVER::NEXT
;                                   ARCDOCDB.GET.RESOLVER::END)
;                               (TYPEP ARCDOCDB.GET.RESOLVER::STAMP
;                                      'ARCDOCDB.BINARY:U64)
;                               (<= ARCDOCDB.GET.RESOLVER::DURABLE
;                                   ARCDOCDB.GET.RESOLVER::POS))
;                            (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION
;                                   :REASON :RESOLVER-BATCH-RESULT :OFFSET
;                                   ARCDOCDB.GET.RESOLVER::POS))
;                          (WHEN
;                              (> COUNT
;                                 (- ARCDOCDB.GET.RESOLVER::MAX-RECORDS
;                                    ARCDOCDB.GET.RESOLVER::RECORDS))
;                            (ERROR 'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :REASON
;                                   :RESOLVER-RECORD-BUDGET :OFFSET
;                                   ARCDOCDB.GET.RESOLVER::POS))
;                          (INCF ARCDOCDB.GET.RESOLVER::RECORDS COUNT)
;                          (SETF ARCDOCDB.GET.RESOLVER::POS
;                                  ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; in: DEFUN CONTA-VOCI-RESOLVER
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT (1+
;                                          (FLOOR
;                                           (- ARCDOCDB.GET.RESOLVER::END
;                                              ARCDOCDB.STORAGE.FORMAT:+SEGMENT-HEADER-BYTES+)
;                                           ARCDOCDB.RECORD:+HEADER-BYTES+))
;           DO (WHEN (= ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END)
;                (RETURN-FROM ARCDOCDB.GET.RESOLVER::CONTA-VOCI-RESOLVER
;                  (VALUES ARCDOCDB.GET.RESOLVER::PUTS
;                          ARCDOCDB.GET.RESOLVER::PROOFS))) (MULTIPLE-VALUE-BIND
;                                                               (ARCDOCDB.GET.RESOLVER::NEXT
;                                                                ARCDOCDB.GET.RESOLVER::KIND
;                                                                ARCDOCDB.GET.RESOLVER::FLAGS)
;                                                               (ARCDOCDB.GET.RESOLVER::PROSSIMA-CORNICE-RESOLVER
;                                                                ARCDOCDB.GET.RESOLVER::BUFFER
;                                                                ARCDOCDB.GET.RESOLVER::POS
;                                                                ARCDOCDB.GET.RESOLVER::END
;                                                                ARCDOCDB.GET.RESOLVER::VERSION)
;                                                             (DECLARE
;                                                              (IGNORE
;                                                               ARCDOCDB.GET.RESOLVER::FLAGS))
;                                                             (UNLESS
;                                                                 (=
;                                                                  ARCDOCDB.GET.RESOLVER::KIND
;                                                                  ARCDOCDB.RECORD:+SEAL+)
;                                                               (WHEN
;                                                                   (=
;                                                                    ARCDOCDB.GET.RESOLVER::RECORDS
;                                                                    ARCDOCDB.GET.RESOLVER::MAX-RECORDS)
;                                                                 (ERROR
;                                                                  'ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED
;                                                                  :REASON
;                                                                  :RESOLVER-RECORD-BUDGET
;                                                                  :OFFSET
;                                                                  ARCDOCDB.GET.RESOLVER::POS))
;                                                               (INCF
;                                                                ARCDOCDB.GET.RESOLVER::RECORDS))
;                                                             (CASE
;                                                                 ARCDOCDB.GET.RESOLVER::KIND
;                                                               (1
;                                                                (INCF
;                                                                 ARCDOCDB.GET.RESOLVER::PUTS))
;                                                               (4
;                                                                (INCF
;                                                                 ARCDOCDB.GET.RESOLVER::PROOFS))
;                                                               ((2 3) NIL)
;                                                               (OTHERWISE
;                                                                (ERROR
;                                                                 'ARCDOCDB.CONDITIONS:CORRUPTION-DETECTED
;                                                                 :REASON
;                                                                 :RESOLVER-FRAME-KIND
;                                                                 :OFFSET
;                                                                 ARCDOCDB.GET.RESOLVER::POS)))
;                                                             (SETF ARCDOCDB.GET.RESOLVER::POS
;                                                                     ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.

; in: DEFUN COPIA-PROVE-RESOLVER
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT (1+
;                                          (FLOOR
;                                           (- ARCDOCDB.GET.RESOLVER::END
;                                              ARCDOCDB.STORAGE.FORMAT:+SEGMENT-HEADER-BYTES+)
;                                           ARCDOCDB.RECORD:+HEADER-BYTES+))
;           DO (WHEN (= ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END)
;                (UNLESS
;                    (= ARCDOCDB.GET.RESOLVER::USED
;                       (LENGTH ARCDOCDB.GET.RESOLVER::PROOFS))
;                  (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                         :RESOLVER-PROOF-COUNT))
;                (RETURN-FROM ARCDOCDB.GET.RESOLVER::COPIA-PROVE-RESOLVER
;                  NIL)) (MULTIPLE-VALUE-BIND
;                            (ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::KIND
;                             ARCDOCDB.GET.RESOLVER::FLAGS)
;                            (ARCDOCDB.GET.RESOLVER::PROSSIMA-CORNICE-RESOLVER
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END
;                             ARCDOCDB.GET.RESOLVER::VERSION)
;                          (DECLARE (IGNORE ARCDOCDB.GET.RESOLVER::FLAGS))
;                          (WHEN
;                              (= ARCDOCDB.GET.RESOLVER::KIND
;                                 ARCDOCDB.RECORD:+OUTCOME+)
;                            (ARCDOCDB.GET.RESOLVER::COPIA-PROVA-RESOLVER
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS
;                             ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::VERSION
;                             ARCDOCDB.GET.RESOLVER::PROOFS
;                             ARCDOCDB.GET.RESOLVER::USED)
;                            (INCF ARCDOCDB.GET.RESOLVER::USED
;                                  ARCDOCDB.GET.RESOLVER::+PROOF-WORDS+))
;                          (SETF ARCDOCDB.GET.RESOLVER::POS
;                                  ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/scan-tmpZ18MA7XE.fasl
; compilation finished in 0:00:00.030
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/sort.lisp\" (written 11 OCT 2026 02:56:31 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/sort-tmp6LQJ9T0C.fasl
; compilation finished in 0:00:00.030
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/rows.lisp\" (written 11 OCT 2026 02:56:31 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/rows.lisp
; in: DEFUN COPIA-RIGHE-RESOLVER
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT (1+
;                                          (FLOOR
;                                           (- ARCDOCDB.GET.RESOLVER::END
;                                              ARCDOCDB.STORAGE.FORMAT:+SEGMENT-HEADER-BYTES+)
;                                           ARCDOCDB.RECORD:+HEADER-BYTES+))
;           DO (WHEN (= ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END)
;                (UNLESS
;                    (= ARCDOCDB.GET.RESOLVER::USED
;                       (LENGTH ARCDOCDB.GET.RESOLVER::ROWS))
;                  (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                         :RESOLVER-ROW-COUNT))
;                (RETURN-FROM ARCDOCDB.GET.RESOLVER::COPIA-RIGHE-RESOLVER
;                  NIL)) (MULTIPLE-VALUE-BIND
;                            (ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::KIND
;                             ARCDOCDB.GET.RESOLVER::FLAGS)
;                            (ARCDOCDB.GET.RESOLVER::PROSSIMA-CORNICE-RESOLVER
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::END
;                             ARCDOCDB.GET.RESOLVER::VERSION)
;                          (WHEN
;                              (= ARCDOCDB.GET.RESOLVER::KIND
;                                 ARCDOCDB.RECORD:+PUT+)
;                            (ARCDOCDB.GET.RESOLVER::COPIA-RIGA-RESOLVER
;                             ARCDOCDB.GET.RESOLVER::BUFFER
;                             ARCDOCDB.GET.RESOLVER::POS
;                             ARCDOCDB.GET.RESOLVER::NEXT
;                             ARCDOCDB.GET.RESOLVER::FLAGS
;                             ARCDOCDB.GET.RESOLVER::PROOFS
;                             ARCDOCDB.GET.RESOLVER::ROWS
;                             ARCDOCDB.GET.RESOLVER::USED)
;                            (INCF ARCDOCDB.GET.RESOLVER::USED
;                                  ARCDOCDB.GET.RESOLVER::+ROW-WORDS+))
;                          (SETF ARCDOCDB.GET.RESOLVER::POS
;                                  ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/rows-tmpTX7OA81T.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/build.lisp\" (written 13 OCT 2026 08:20:19 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/build.lisp
; in: DEFUN VERIFICA-SORGENTE-RESOLVER
;     (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;            :RESOLVER-SEGMENT-ORIGIN)
; 
; note: deleting unreachable code

;     (= COUNT (+ ARCDOCDB.GET.RESOLVER::PUTS ARCDOCDB.GET.RESOLVER::TOMBSTONES))
; 
; note: doing signed word to integer coercion (cost 20), for:
;       the first argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/build-tmpWOTC3PB7.fasl
; compilation finished in 0:00:00.021
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/read.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/read-tmpHQE95SAC.fasl
; compilation finished in 0:00:00.010
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-types.lisp\" (written 11 OCT 2026 03:36:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-types.lisp
; in: DEFUN PAYLOAD-RADICE-GET-ATTIVA
;     (* ARCDOCDB.GET.RESOLVER::+ACTIVE-NODE-PAYLOAD+
;        (ARCDOCDB.GET.RESOLVER::RADICE-GET-ATTIVA-NODES
;         ARCDOCDB.GET.RESOLVER::ROOT))
; 
; note: forced to do */SIGNED=>S128 (cost 10)
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0) (INTEGER 128 590295810358705651584))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The result is a (VALUES
;                        (OR (INTEGER 0 0) (INTEGER 128 590295810358705651584))
;                        &OPTIONAL), not a (VALUES FIXNUM &OPTIONAL).
;       etc.
; 
; note: doing signed 128 to integer coercion (cost 30), for:
;       the first result of */SIGNED=>S128


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-types-tmpO87FP9NR.fasl
; compilation finished in 0:00:00.011
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-directory.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-directory-tmpP6A3E92I.fasl
; compilation finished in 0:00:00.012
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-scan.lisp\" (written 11 OCT 2026 03:36:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-scan.lisp
; in: DEFUN VERIFICA-LOTTO-ATTIVO
;     (= (ARCDOCDB.WAL::LOTTO-FILE-ID ARCDOCDB.GET.RESOLVER::BATCH)
;        (ARCDOCDB.GET::SEGMENTO-GET-LOW ARCDOCDB.GET.RESOLVER::SEGMENT))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the second argument of IF-EQ

; in: DEFUN COPIA-PUT-ATTIVI
;     (LOOP ARCDOCDB.GET.RESOLVER::REPEAT (1+
;                                          (ARCDOCDB.WAL::LOTTO-COUNT
;                                           ARCDOCDB.GET.RESOLVER::BATCH))
;           DO (MULTIPLE-VALUE-BIND
;                  (ARCDOCDB.GET.RESOLVER::NEXT ARCDOCDB.GET.RESOLVER::KIND
;                   ARCDOCDB.GET.RESOLVER::FLAGS)
;                  (ARCDOCDB.GET.RESOLVER::PROSSIMA-CORNICE-RESOLVER
;                   ARCDOCDB.GET.RESOLVER::BUFFER ARCDOCDB.GET.RESOLVER::POS
;                   ARCDOCDB.GET.RESOLVER::END ARCDOCDB.GET.RESOLVER::VERSION)
;                (WHEN (= ARCDOCDB.GET.RESOLVER::KIND ARCDOCDB.RECORD:+SEAL+)
;                  (UNLESS (AND # #)
;                    (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                           :ACTIVE-ROW-COUNT))
;                  (RETURN-FROM ARCDOCDB.GET.RESOLVER::COPIA-PUT-ATTIVI NIL))
;                (WHEN (= ARCDOCDB.GET.RESOLVER::KIND ARCDOCDB.RECORD:+PUT+)
;                  (UNLESS (<= # #)
;                    (ERROR 'ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION :REASON
;                           :ACTIVE-ROW-COUNT))
;                  (SETF # #
;                        # #
;                        # ARCDOCDB.GET.RESOLVER::FLAGS
;                        # #
;                        # #)
;                  (INCF ARCDOCDB.GET.RESOLVER::USED
;                        ARCDOCDB.GET.RESOLVER::+ROW-WORDS+))
;                (SETF ARCDOCDB.GET.RESOLVER::POS ARCDOCDB.GET.RESOLVER::NEXT)))
; --> LET TAGBODY IF DECF SETQ THE SB-IMPL::XSUBTRACT BLOCK 
; ==>
;   (- SB-IMPL::B SB-IMPL::A)
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 2) because:
;       The first argument is a (INTEGER 1), not a FIXNUM.
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES FIXNUM
;                                                                       &OPTIONAL).
;       unable to do inline (unsigned-byte 64) arithmetic (cost 5) because:
;       The first argument is a (INTEGER 1), not a (UNSIGNED-BYTE 64).
;       The result is a (VALUES UNSIGNED-BYTE &OPTIONAL), not a (VALUES
;                                                                (UNSIGNED-BYTE
;                                                                 64)
;                                                                &OPTIONAL).
;       etc.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-scan-tmpUSHT8RIL.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-build.lisp\" (written 11 OCT 2026 03:36:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-build.lisp
; in: DEFUN CREA-SORGENTE-GET-ATTIVA
;     (= (ARCDOCDB.GET::SEGMENTO-GET-LOW ARCDOCDB.GET.RESOLVER::SEGMENT)
;        (ARCDOCDB.WAL::LOG-IO-FILE-ID LOG))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the first argument of IF-EQ

; in: DEFUN COSTRUISCI-DELTA-ATTIVO
;     (LET* ((ARCDOCDB.GET.RESOLVER::ROWS
;             (MAKE-ARRAY
;              (* ARCDOCDB.GET.RESOLVER::PUTS ARCDOCDB.GET.RESOLVER::+ROW-WORDS+)
;              :ELEMENT-TYPE '(UNSIGNED-BYTE 32) :INITIAL-ELEMENT 0))
;            (ARCDOCDB.GET.RESOLVER::END
;             (+ (ARCDOCDB.WAL:INIZIO-LOTTO ARCDOCDB.GET.RESOLVER::BATCH)
;                (ARCDOCDB.WAL:LUNGHEZZA-LOTTO ARCDOCDB.GET.RESOLVER::BATCH)))
;            (ARCDOCDB.GET.RESOLVER::RANK
;             (IF ARCDOCDB.GET.RESOLVER::PREVIOUS
;                 (ARCDOCDB.GET.RESOLVER::RADICE-GET-ATTIVA-COUNT
;                  ARCDOCDB.GET.RESOLVER::PREVIOUS)
;                 0)))
;       (ARCDOCDB.GET.RESOLVER::COPIA-PUT-ATTIVI ARCDOCDB.GET.RESOLVER::SOURCE
;                                                ARCDOCDB.GET.RESOLVER::BATCH
;                                                ARCDOCDB.GET.RESOLVER::ROWS)
;       (MULTIPLE-VALUE-BIND (DIRECTORY ARCDOCDB.GET.RESOLVER::ADDED)
;           (ARCDOCDB.GET.RESOLVER::APPENDI-PAGINA-ATTIVA
;            (IF ARCDOCDB.GET.RESOLVER::PREVIOUS
;                (ARCDOCDB.GET.RESOLVER::RADICE-GET-ATTIVA-DIRECTORY
;                 ARCDOCDB.GET.RESOLVER::PREVIOUS)
;                NIL)
;            ARCDOCDB.GET.RESOLVER::RANK
;            (ARCDOCDB.GET.RESOLVER::%MAKE-MAPPA-SEGMENTO-GET
;             (ARCDOCDB.GET.RESOLVER::SORGENTE-GET-ATTIVA-SEGMENT
;              ARCDOCDB.GET.RESOLVER::SOURCE)
;             ARCDOCDB.GET.RESOLVER::END ARCDOCDB.GET.RESOLVER::ROWS)
;            ARCDOCDB.GET.RESOLVER::+ACTIVE-DIRECTORY-SHIFT+)
;         (ARCDOCDB.GET.RESOLVER::%MAKE-RADICE-GET-ATTIVA
;          ARCDOCDB.GET.RESOLVER::SOURCE DIRECTORY (1+ ARCDOCDB.GET.RESOLVER::RANK)
;          (+ ARCDOCDB.GET.RESOLVER::PUTS
;             (IF ARCDOCDB.GET.RESOLVER::PREVIOUS
;                 #
;                 0))
;          (+ ARCDOCDB.GET.RESOLVER::ADDED
;             (IF ARCDOCDB.GET.RESOLVER::PREVIOUS
;                 #
;                 0))
;          ARCDOCDB.GET.RESOLVER::END ARCDOCDB.GET.RESOLVER::CONTENT)))
; 
; note: doing signed word to integer coercion (cost 20) to END


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-build-tmp7YCPD44Y.fasl
; compilation finished in 0:00:00.026
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-preflight.lisp\" (written 11 OCT 2026 03:36:26 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-preflight.lisp
; in: DEFUN VERIFICA-MISURE-APERTE-ATTIVE
;     (= (ARCDOCDB.WAL::LOTTO-FILE-ID ARCDOCDB.GET.RESOLVER::BATCH)
;        (ARCDOCDB.GET::SEGMENTO-GET-LOW ARCDOCDB.GET.RESOLVER::SEGMENT))
; 
; note: doing unsigned word to integer coercion (cost 20), for:
;       the second argument of IF-EQ


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-preflight-tmpQXR7SNXD.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-read.lisp\" (written 11 OCT 2026 03:36:26 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-resolver/active-read-tmp6FLI1OC3.fasl
; compilation finished in 0:00:00.003
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/package.lisp\" (written 13 OCT 2026 08:20:19 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/package-tmpWBK8JTS9.fasl
; compilation finished in 0:00:00.000
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/types.lisp\" (written 13 OCT 2026 08:20:19 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/types-tmpUVEUD2ZN.fasl
; compilation finished in 0:00:00.004
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/build.lisp\" (written 13 OCT 2026 08:20:19 PM):

; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/build.lisp
; in: DEFUN CREA-DIRECTORY-GET-SERIE
;     (COPY-SEQ ARCDOCDB.GET.DIRECTORY::MAPS)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a VECTOR.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a LIST.
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a SEQUENCE, not a SB-KERNEL:EXTENDED-SEQUENCE.

;     (LENGTH ARCDOCDB.GET.DIRECTORY::OWNED)
; 
; note: unable to
;   optimize
; due to type uncertainty:
;   The first argument is a (OR LIST (SIMPLE-ARRAY * (*))
;                               SB-KERNEL:EXTENDED-SEQUENCE), not a VECTOR.


; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/build-tmpOWNJOEU.fasl
; compilation finished in 0:00:00.013
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/read.lisp\" (written 13 OCT 2026 08:20:19 PM):

; wrote /tmp/arcdocdb-pool-tests-cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/get-directory/read-tmpVT5BMTA5.fasl
; compilation finished in 0:00:00.005
; 
; compilation unit finished
;   printed 146 notes
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/foundation/support.lisp\" (written 09 OCT 2026 04:38:49 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-foundation.fasl
; compilation finished in 0:00:00.018
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/support.lisp\" (written 13 OCT 2026 08:31:08 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/support-scheduler.fasl
; compilation finished in 0:00:00.007
; compiling file \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/controller.lisp\" (written 13 OCT 2026 08:49:26 PM):

; wrote /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/controller-scheduler.fasl
; compilation finished in 0:00:00.033
ok    TEST-REQ-THR-001-POOL-CONSTRUCTION-DEFAULTS-AND-VALID-BOUNDS
ok    TEST-REQ-AFF-008-POOL-PRIVATE-CONSTRUCTION-DEFAULTS-AND-EXPLICIT-STATE
ok    TEST-REQ-AFF-008-POOL-GENERATED-EQUALITY-COMPARES-EACH-BOUNDED-SIGNAL
ok    TEST-REQ-AFF-008-POOL-DECLARED-INTEGER-DOMAINS-AND-DIRECTION-MEMBERS
ok    TEST-REQ-AFF-008-POOL-INVALID-CONFIGURATION-HAS-TYPED-REASONS
ok    TEST-REQ-THR-001-POOL-FIRST-SAMPLE-SEEDS-EXACT-FIXED-POINT-SIGNALS
ok    TEST-REQ-AFF-013-POOL-EWMA-INDEPENDENT-ORACLE-AND-NEGATIVE-ROUNDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-PRESERVE-ENTIRE-PUBLIC-STATE
ok    TEST-REQ-AFF-008-POOL-SAMPLE-UPPER-BOUNDS-AND-CLOCK-EXHAUSTION
ok    TEST-REQ-THR-001-POOL-ADDITIVE-GROWTH-NEEDS-COMPLETE-DWELL
ok    TEST-REQ-THR-001-POOL-MULTIPLICATIVE-DECREASE-FLOORS-AND-CLAMPS
ok    TEST-REQ-THR-001-POOL-HYSTERESIS-THRESHOLDS-ARE-INCLUSIVE-AS-SPECIFIED
ok    TEST-REQ-THR-001-POOL-CONFIGURABLE-QUEUE-THRESHOLD-AND-CUSTOM-PERIOD
ok    TEST-REQ-THR-001-POOL-BOUNDS-DO-NOT-EMIT-ZERO-CHANGE-COMMANDS
ok    TEST-REQ-THR-001-POOL-HOLD-REGION-BREAKS-CONTINUOUS-DWELL
ok    TEST-REQ-THR-001-POOL-DIRECTION-CHANGE-RESTARTS-DWELL
ok    TEST-REQ-THR-001-POOL-LONG-GAP-RESETS-EWMA-AND-DWELL
ok    TEST-REQ-THR-001-POOL-GAP-EXACTLY-TWO-PERIODS-KEEPS-EXISTING-DWELL
ok    TEST-REQ-THR-001-POOL-PENDING-TARGET-IS-RETAINED-AND-SENSORS-ADVANCE
ok    TEST-REQ-THR-001-POOL-FIRST-PENDING-SAMPLE-AND-COMPLETED-COMMAND-DWELL
ok    TEST-REQ-CON-005-POOL-CROSS-THREAD-ACCESS-REJECTED-WITHOUT-OWNER-MUTATION
ok    TEST-REQ-AFF-008-POOL-PRIVATE-BOUND-AND-CLOCK-FAULTS-ARE-DETECTED
ok    TEST-REQ-CON-005-POOL-INDEPENDENT-CONTROLLERS-HAVE-DETERMINISTIC-PARALLEL-TRACES
23 test del controllore pool superati.
")
  (:PATH
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-tests/scoped.lisp")
   :BYTES 1377 :SHA256 "75c074f0be750fbf72d38a2f53173a9e49c0848150743a3b4008858e1ce8c949" :GIT-BLOB
   "b1fefa87b0de1da87f570637f6312b6aa1d9dd21" :TEXT "(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(asdf:initialize-output-translations
 '(:output-translations (t \"/tmp/arcdocdb-pool-tests-cache/\") :ignore-inherited-configuration))
(defun pool-tests-warning (condition)
  (unless (typep condition 'sb-kernel:redefinition-warning)
    (error \"Avviso non ammesso: ~A\" condition)))
(handler-bind ((warning #'pool-tests-warning) (style-warning #'pool-tests-warning))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb\")
  (dolist (file '(\"tests/foundation/support.lisp\" \"tests/scheduler/support.lisp\"
                  \"tests/scheduler/controller.lisp\"))
    (multiple-value-bind (compiled warnings failed)
        (compile-file file :output-file
                      (merge-pathnames (make-pathname :name (format nil \"~A-~A\"
                                                                    (pathname-name file)
                                                                    (third (pathname-directory file)))
                                                       :type \"fasl\")
                                       \"spikes/out/pool-tests/\"))
      (when (or warnings failed) (error \"Compilazione test fallita: ~A\" file))
      (load compiled)))
  (uiop:symbol-call '#:arcdocdb.scheduler.tests '#:run))
")))
