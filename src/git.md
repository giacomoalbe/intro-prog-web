## Versionamento Codice

Gestire il codice sorgente di un progetto software è un compito non banale.

Difficilmente capiterà di lavorare su un progetto in completa autonomia e su una macchina sola, quindi è conveniente  trovare un sistema per condividere il proprio codice con altre persone o spostarlo da un PC all'altro oppure tra diverse cartelle in maniera veloce, facile e senza rischiare di perdere dati preziosi.

Per risolvere i problemi succitati, sono stati sviluppati i **Sistemi di Versionamento del Codice** (in inglese *Software Configuration Manager* o *SCM*).

Compiti principali di un SCM sono i seguenti:

* Creare delle **versioni incrementali** del proprio progetto software
* Navigare (avanti e indietro) **la storia** di un progetto e ripristinare un qualsiasi punto salvato
* Permettere **la collaborazione** di più persone sullo stesso progetto, gestendo in maniera semi-automatica i **conflitti**.
* **Muovere** interi progetti software da un PC all'altro in maniera affidabile e sicura.

Tra i vari software SCM, negli ultimi anni `git` ha trovato il favore di sviluppatori e aziende, diventando il sistema di versionamento maggiormente diffuso a livello globale.

Per questo motivo, unitamente alla sua facilità di utilizzo e alla sua versatilità, andremo ad utilizzare questo strumento per gestire i nostri progetti software, avvalendoci della piattaforma online `github.com` che useremo come server `git` remoto per condividere i nostri progetti con altre persone.

## Come usare Git

`git` è uno strumento che può essere utilizzato sia da interfaccia grafica che da terminale.

Dato che l'utilizzo da terminale è in generale più semplice e maggiormente in grado di far comprendere il funzionamento effettivo dello strumento, in questo capitolo andremo ad analizzare il programma git usando l'interfaccia da *riga di comando*, accessibile sia dal terminale di Windows/Linux/Mac oppure dalla console integrata nell'editor `Visual Studio Code`, che consigliamo ai meno esperti per la sua immediatezza e semplicità.

## Funzionamento di Git

In `git` esistono 3 *entità* fondamentali:

1. La *working directory*
1. Lo *stage*
1. La *commit*

### 1. La *working directory*

Con working directory si intende la cartalla in cui è contenuto il repository `git`.

L'insieme dei file in essa contenuti sono la base del sistema di versionamento di `git`.

Il software, infatti, ogniqualvolta andremo a modificare un file all'interno della cartella, andrà a calcolare le differenze (in termini di *diversità nel contenuto dei file*) tra la *working directory* e l'ultima versione salvata del repository.

Una volta individuate le differenze (che possono derivare da *nuoviu file*, *file modificati*, *file cancellati*) `git` le mostrerà in rosso come output del comando `git status`.

**ATTENZIONE**: le differenze tra l'ultima versione salvata e la working directory **NON** verranno salvate a meno di non andarle a inserire in una commit, come vedremo successivamente.

Le modifiche viste da `git` vengono calcolate sono al salvataggio dei file su cui si sta lavorando: qualsiasi modifica non salvata non sarà vista. Allo stesso modo, le modifiche non risentono di alcun salvataggio temporaneo, e quindi saranno presenti anche al riavvio del sistema.

### 2. Lo *stage*

Lo stage è uno spazio virtuale di `git` in cui possiamo andare a comporre una *versione* del nostro progetto.

All'interno dello stage possiamo aggiungere, in maniera manuale o automatica, le modifiche che `git` ha individuato all'interno della *working directory*.

Lo *stage* è lo stadio che precede l'archiviazione di una particolare versione del codice e rappresenta l'insieme delle modifiche fatte al progetto che noi intendiamo *salvare* nella storia del progetto.

Per aggiungere le modifiche allo stage si usa il comando `git add <nome_del_file>`.

Una volta aggiunte allo stage, le modifiche comparitanno di colore verde nell'output del comando `git status`.

### 3. La *commit*

Una commit rappresenta lo stato di un progetto in un certo momento del tempo.

Compone la storia di quel progetto ed è l'unità cronologica minima del sistema di versionamento.

Dato l'*hash* della commit (un valore identificativo univoco) è sempre possibile muoversi all'interno della storia del progetto e riportarsi a qualsiasi versione salvata.

Quando si decidesse di portare il progetto ad una certa commit, `git` trasformerebbe il contenuto della cartella corrente (la *working directory*) nel contenuto presente nella stessa cartella nel momento di salvataggio di quella specifica commit, occupandosi di creare, modificare ed eliminare i file in modo da riportarsi in quella esatta condizione.

Possiamo pensare alle commit come a delle *fotografie* della *working directory* che possiamo utilizzare per riportare il contenuto della cartella allo stato desiderato, esattamente come mostra la fotografia.

Una commit è formata da 4 elementi principali:

* Un insieme di modifiche (quelle contenute nello stage)
* Un autore (colui che fa partire il comando `git commit`)
* Un messaggio identificativo della commit, che vada a descrivere le modifiche effettuate
* un *hash*, ovvero un codice identificativo univoco della commit

L'*hash* e l'*autore* sono elementi che `git` genera in automatico, mentre le modifiche e il messaggio vengono definiti dall'utente.

Per creare una commit associando ad essa un messaggio è necessario dare il seguente comando da terminale:

```
git commit -m 'Messaggio relativo alla commit'
```

Una volta salvate e committate le modifiche, `git status` ci segnalerà che la *working directory* è nuovamente *pulita* (clean), ovvero che non ci sono differenze tra i file della working directory e quelli dell'ultima versione salvata.

Modificando nuovamente i file sarà possibile aggiungerli allo stage e creare una nuova versione.

## Condividere il codice con GitHub

TODO

## Prontuario Comandi di Git

* `git init`: crea un repository git nella cartella corrente, se vuota.
* `git status`: informa circa lo stato del repository, mostra i file contenenti modifiche non ancora salvate nello stage (in rosso), le modifciche versionate (in verde) e le altre informazioni di tracciamento.
* `git add <nomefile>`: aggiunge le modifiche effettuate nel file `<nomefile>` allo stage. Il file passerà dal colore rosso a quello verde nell'output di `git status`
* `git reset <nomefile>`: toglie `<nomefile>` dalla lista dei file presenti nello stage. Il file tornerà ad essere scritto in rosso nel'output di `git status`.
* `git commit -m '<Messaggio>'`: salva le modifiche presenti in stage in una nuova commit e associa `<Messaggio>` alla nuova commit. Questa operazione svuota lo stage e *mette in pari* la working directory con la storia del progetto.
