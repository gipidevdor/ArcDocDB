# Piano del helper di conservazione parallela

Preparazione statica del 14 ottobre 2026. **Nessuna esecuzione o copia effettuata.**
L'uso è previsto soltanto dopo CI conclusa e gruppi di prova fermi.

- `originale.txt`: copia DATA byte-identica del helper fidato, SHA256
  `961a7c4f1858431b9be544cd5bba81624d41422b12840e22e78affe6535e6a9d`.
- `preserve-worktree.lisp`: derivazione minima, SHA256
  `5d953b9bc067e8e0c2ccf63c72f83bf930a948f23ead20a14447accd9d77728b`.
- `derivation.diff`: confronto completo con l'originale, 61 righe aggiunte e 11
  rimosse, incremento netto di 50 righe. Nessuna dipendenza esterna nuova:
  SB-THREAD e SB-SYS sono componenti del runtime SBCL già richiesto.

`ordered-file-map` usa al massimo quattro worker, distribuisce gli indici con
stride fisso e salva risultati e condizioni in vettori separati ordinati come
la selezione originale. Non condivide buffer di copia né stream di file.
La creazione delle directory di destinazione comuni avviene prima, in serie;
i worker lavorano su leaf distinti. Snapshot dei sorgenti, copie con tutti i
controlli bytes/SHA originali e secondo audit SHA delle copie usano lo stesso
mapper. I manifest restano scritti in serie e nello stesso ordine dei path.

Ogni worker ha binding espliciti di pathname defaults, package, readtable,
read-eval e stream di output/errore/trace. Workspace e files-root sono pathname
assoluti acquisiti prima dei worker e catturati lessicalmente. Errori seri di
worker, avvio o join sono conservati; tutti i thread avviati vengono raggiunti
da join, protetto da WITHOUT-INTERRUPTS, prima della propagazione aggregata.
Il buffer parziale permette di conservare il conteggio accurato delle copie
già verificate anche se un altro file fallisce.

Restano i controlli originali: commit esplicito, reader autenticato con Git,
selezione Git NUL untracked+ignored deduplicata, esclusione di ogni componente
`.git`, LSTAT di ogni componente contro symlink/file speciali, destinazione
esterna nuova, bytes/SHA prima e dopo ogni copia, snapshot globale prima/dopo,
inventario fisico esatto della destinazione e indici completi. Il working-tree
status viene ora confrontato prima/dopo e HEAD/reader sono ricontrollati anche
dopo l'audit finale. Non viene imposto uno stato iniziale diverso dal chiamante.

CLI invariata:

```text
--workspace DIR --commit FULL-SHA --destination FRESH-BACKUP-ROOT/
```

Prima dell'uso, commit e destinazione devono essere quelli finali scelti dal
chiamante. Tutti i file selezionati, compresi helper e prove CI, devono essere
fermi. Console e registrazioni dell'esecuzione devono essere scritte fuori dal
worktree sorgente, per non alterare l'insieme o i bytes in corso di conservazione.
Un errore conserva il backup parziale e produce il manifest di fallimento;
nessuna archiviazione Git viene eseguita da questo programma. Le osservazioni
sono per file, non una fotografia atomica del filesystem.

Questa preparazione ha ricevuto lettura statica; non attesta ancora esecuzione,
prestazioni, risultato della futura conservazione o archiviazione del worktree.
La cartella di audit copertura già congelata non è stata modificata.
