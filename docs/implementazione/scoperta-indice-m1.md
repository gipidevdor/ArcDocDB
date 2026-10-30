# Scoperta delle immagini M1 allo startup

> **Deciso (integrazione incrementale autorizzata → ADR-0070)** — C1;
> REQ-IDX-010, REQ-REC-001, INV-I8, INV-A8, INV-P6.

```lisp
(defparameter discovery
  (arcdocdb.engine:crea-opzione-scoperta-indice
    :page-size 4096 :frames 2 :max-visits 16777216 :max-bytes 268435456
    :max-names 4096 :max-candidates 64 :max-discovery-payload 16777216))
(arcdocdb.engine:apri-motore directory archive-id series-id
  :clock monotonic-clock :index-discovery discovery)
```

La factory valida il profilo con le stesse regole dell'opzione esplicita.
Limiti: 1..65536 nomi, 1..1024 candidati, candidati <= nomi, payload 0..512 MiB.
Budget insufficienti sono rifiutati dalla factory prima dell'I/O. Il nome
placeholder del profilo non seleziona alcun file. Le opzioni `:index-image`
e `:index-discovery` sono esclusive e nessuna e' ammessa con `:create t`.

Dopo replay e checkpoint canonici il motore mantiene RECOVERING. La ricerca
inventa un candidato soltanto da un inventario completo e bounded. Nomi
estranei non vengono aperti. La quota nomi comprende tutti gli entry della
directory, anche estranei; i limiti canonici preesistenti di startup restano
applicabili (compreso `max-files` derivato da `max-segments`). Il checkpoint
puo' gia' essere completato quando un candidato o una quota sono rifiutati:
non si promette rollback dei suoi effetti canonici.

## Sonda, scelta e verifica

Ogni nome canonico viene aperto readonly con EOF esatto e limiti I/O del
profilo. Geometria fuori formato, footer senza CRC valido, codice pagina
incompatibile e fonte/seed non corrispondenti rendono il file ineligibile.
Un candidato ineligibile viene chiuso, resta sul disco e non e' adottato.
Un'immagine completa con bitrot del footer puo' essere scartata come un
incompleto: la ricerca non certifica integrita' dei derivati abbandonati.

Con CRC e profilo idonei, errori di magic, versione, campi riservati o root
propagano; una versione integra ignota produce UNSUPPORTED-FORMAT. Errori
I/O, symlink, tipo di file errato, file oltre budget o close fallito non
vengono trasformati in assenza. La sola incongruenza di fonte produce il
rifiuto ordinario del suggerimento, perche' i derivati obsoleti sono attesi.

Il massimo nome hex fra footer idonei e' selezionato indipendentemente
dall'ordine di enumerazione e dalla data del file. La fonte viene prima del
nome: un'etichetta alta obsoleta non prevale su una bassa corrente. Il nome
non deve provare cronologia, identita' interna o commit: il file riaperto deve
superare il verificatore integrale esistente, inclusi prefisso, pagine,
chiavi, appartenenza, unicita' e copertura del residente canonico.
Se questa verifica fallisce lo startup fallisce, anche con un altro file sano.
Senza footer idonei resta il residente. La selezione esplicita continua a
rifiutare un file mancante/invalido e non usa la ricerca come fallback.

Observer: `:before-index-discovery`, una `:index-image-candidate` per nome
canonico, `:index-image-discovered`, poi le fasi esistenti dell'adozione.
Nessuna richiesta pubblica READY e' ammessa nei callback. Stato, fonte e
revisione del residente sono riconfermati dopo la ricerca. Un FD locale alla
volta, chiuso su ritorno, errore o uscita non locale; l'adozione finale usa lo
slot posseduto del motore e il suo cleanup anche se lo startup non termina.
La directory esclusiva mantiene stabile il namespace; il file riaperto viene
comunque verificato di nuovo, senza fidarsi della sonda precedente.

## Budget e limiti

Riserva conservativa: `2*N*(4*255+16) + 1024*C + 65536 + 65535 + S*(F+6)`,
con N massimo nomi, C massimo candidati, S taglia pagina e F frame cache.
Copre due inventari di stringhe fino a quattro byte per carattere, riferimenti,
transitori/copie dei candidati e buffer di sonda/verifica. Non assume GC fra
sonde. La quota riguarda questi payload e non il totale RSS: oggetti, header,
GC, scratch/canonico e residente richiedono riserva separata del controller.

Cicli limitati a N nomi, 16 caratteri per etichetta, C sonde con una lettura
footer al massimo, poi una sola verifica completa entro max-visits/max-bytes.
Zero chiamate I/O per nomi estranei; nessun sort globale, bitmap del dataset,
scansione degli interi file ineligibili, rename o cancellazione. La scelta
non modifica WAL, CONTROL, CSN o file derivati; il punto durevole dei dati
resta SEAL. La root scelta non e' una nuova decisione durevole di catalogo.

## Decisioni e revisione C1

| Decisione composta | Copertura |
|---|---|
| Limiti nomi/candidati/payload validi | ogni dominio falso separatamente, limiti inclusivi, candidati > nomi |
| Nome: stringa, 32 caratteri, prefisso, suffisso, hex | false separate, nome valido, zeri ed estremo hex |
| Geometria: minimo, allineamento, massimo | vuoto, EOF non allineato sopra minimo, file sparso oltre massimo; immagine valida |
| Priorita': nessuna scelta o nome maggiore | prima scelta, etichette maggiori/minori, scelta corrente sotto nome obsoleto |
| Fonte: RECOVERING, salute controller, revisione, identita' esatta | ciascuna mutata separatamente dopo la ricerca |
| CREATE/scoperta e esplicita/scoperta | combinazioni valide ed esclusive; errori prima dell'apertura |

Le altre scelte sono rami singoli o verificatori gia' coperti nei moduli
riusati. Due letture C1: fonte, filtro e verifica completa; poi quote, FD,
callback, failure boundary e isolamento fra Serie. Dodici casi dedicati,
sei SIGKILL v1/v2 e finestre GET; [registro e limiti](../../spikes/results/2026-10-30-engine-image-discovery/report.md).

Non e' un writer paginato autonomo o un indice oltre RAM. Delta non abilitato
implicitamente; la prima scrittura ammessa ritira il file. Nessun catalogo,
scheduler, scelta di modo in base alla RAM, rimozione automatica o snapshot
concorrente. SIGKILL non qualifica power loss.

La conferma di fonte/revisione, stato RECOVERING e controller sano viene
eseguita anche prima della pubblicazione, dopo il callback immagine pronta
e dopo `:before-admission`, su percorsi esplicito e residente inclusi.
Mutazioni rilevate impediscono il ritorno di un handle READY.
