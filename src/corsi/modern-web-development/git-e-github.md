# Git & Github

## Introduzione al versionamento

Il _controllo di versione_, anche detto _versionamento_ è un sistema software che permette di tenere traccia nel tempo di cambiamenti ad un file o ad una serie di file, così da poter richiamare una specifica versione in un secondo momento.
Questo approccio permette inoltre di tenere traccia dei cambiamenti tra le versioni, oltre a facilitare la stesura della documentazione.
L'utilizzo di sistemi di controllo del versionamento come il programma [git](https://git-scm.com/) (locale) e [Github](https://github.com/) (il sito servizio di cloud di `git`), permettono di lavorare allo sviluppo in team.

`git` permette infatti di creare _branches_, letteralmente rami, che sono copie del ramo principale del codice sorgente, nel quale si possono inserire gli sviluppi successivi.

Implementate le nuove modifiche è quindi possibile inserirle o effettuare il _merge_ (_mergiare_, in gergo tecnico) all'interno del ramo principale, unendo il lavoro di tutti gli sviluppatori controllando e risolvendo le (eventuali) sovrapposizioni.

Il grande vantaggio di `git` è quello di aver reso estremanente **facile** e **sicuro** condividere, scambiare, modificare e aggiornare codice sorgente tra computer, persone e tempi diversi, eliminando di fatto la maggior parte dei problemi relativi alla _gestione del codice sorgente_.

Per questo motivo, ad oggi, `git` risulta il software di versionamento più usato (e sicuro) al mondo.

Degno di menzione il fatto che `git` è un progetto completamente Open Source, autofinanziato e realizzato da una community di programmatori proveniente da tutti i continenti.

A capo del progetto troviamo [Linus Torvalds](https://it.wikipedia.org/wiki/Linus_Torvalds), il famoso creatore del Sistema Operativo Free & Open Source [Linux](https://kernel.org)

## Concetti base

* **Repository**

    Una _repository_ (spesso appreviata con `repo`) è una cartella interamente gestita da `git` per tener traccia delle modifiche e della _storia_ di un progetto. Può trovarsi all'interno di una cartella nel computer o nello spazio di GitHub o in un'altro servizio di hosting online.

    Il _repository_ vero e proprio è all'interno della cartella nascosta `.git` che si trova nella cartella di progetto ed è uno spazio utilizzato da `git` per _svolgere_ tutte le sue funzioni. E' una cartella che è importante **NON** andare a modificare in quanto è `git` stesso che si occupa di gestire i file in esso contenuti.

    All'interno di una repository è possibile inserire qualunque tipo di file, che sia codice, immagine o altro. Per Github consigliano comunque di non inserire file singoli di dimensione superiore a 60Mb, e in generale di mantenere la dimensione complessiva del repository entro i 100Mb totali.

* **Stage**

    Lo _stage_, letteralmente 'palco', è lo step precedente al _commit_. Esso contiene tutte le modifiche che sono state apportate ai file di progetto (ovvero i file che `git` sta già tracciando), modifiche che è quindi necessario salvare attraverso il _commit_.

    All'interno dello stage è ancora possibile modificare i file, rimuoverli o aggiungerli.
    Il comando usato per aggiungere i file modificati all'interno dello stage è `git add <nome_file>`.

    Nel caso si vogliano aggiungere **tutti i file** contenenti modifiche della cartella corrente, è necessario dare il comando `git add .`.

* **Commit**

    Un `commit` è una _fotografia_ dello stato della cartella di progetto in un determinato momento temporale.

    Con _fotografia_ si intende una rappresentazione dei contenuti dei singoli file di progetto. Ad ogni `commit` viene associato un _messaggio_ (definito dall'utente) che va a mettere in relazione le modifiche effettuate e salvate con una loro descrizione _human readable_, ovvero comprensibile al programmatore che ha attuato quelle modifiche.

    Una volta salvata, la _commit_ è definitiva, ovvero non è più possibile modificarne il contenuto. Questo significa che **tutte quello che viene committato rimane salvato nella storia di `git`**.
    Anche se può sembrare una cosa di cui preoccuparsi, in realtà questo rappresenta un grandissimo vantaggio: dato che quella _fotografia_ (o _versione_) è stata salvata, è sempre possibile _tornare indietro_ a quelle modifiche effettuate. In altri termini, il lavoro che viene committato, non viene **mai** perso.

    Fare una `commit`, anche detto _committare_, è una procedura _manuale_. Una volta aggiunte le modifiche all'interno dello `stage`, `git` non salva automaticamente tutto in un `commit`: questo operazione deve essere effettuata manualmente attraverso il comando `git commit -m "Messaggio relativo alle modifiche effettuate`.

* **Branch**

    Con `branch` (letteralmente _ramo_) si indica una ramificazione della storia di un progetto.

    Per `git`, la _storia_ è un insieme di `commit` sequenziali, ovvero un gruppo di modifiche effettuate ai file della cartella di progetto.

    In un repository `git`, non esiste un'unica storia, quindi un unico `branch`. Diversi rami disgiunti possono convivere nello stesso repository.

    Nonostante questo, ogni repository può rappresentare un ramo alla volta, quindi il contenuto della cartella di progetto può fare riferimento ad una `commit` (ovvero una delle `versioni` presenti su quel ramo) per volta.

    Il ramo principale di ogni progetto viene chiamato (per convenzione) `master`.
    Benchè si possa lavorare direttamente sul `master`, è consigliato iniziare un nuovo `branch` ogni volta che si intende implementare una nuova funzionalità.
    Questo permette agli altri sviluppatori di poter partire sempre da una base _condivisa_ (il `master`) e di effettuare tutte le prove e i test possibili senza intaccare il lavoro di altri.

* **Remote**

    Un `remote` è un repository remoto, ovvero presente su qualche servizio di hosting online.

    I `remote` vengono utilizzati per sincronizzare codice e permettere la collaborazione di più persone sui progetti.

## Comandi Git

* **Init**

    Viene utilizzato per inizializzare un repository `git`. Viene utilizzato all'interno della directory da _trasformare_ in repository.
    `git init .`
* **status**
    Permette di controllare quali file sono stati modificati, quali inseriti nello stage, quali sono pronti per il commit.

    E' forse il comando che si utilizzerà di più, in quanto è fondamentale conoscere lo _stato_ dello `stage` prima di fare qualsiasi operazione con `git`.

    `git status`
* **add**

    Inserisce i file selezionati all'interno dello stage.

    * `git add <file>` aggiunge un file singolo (dato il path del file)
    * `git add .` aggiunge tutti i file (con modifiche) della cartella corrente

* **commit**

    Salva definitivamente le modifiche all'interno del `stage`.

    Bisogna inserire anche il parametro '-m' che imposta un messaggio per il commit.

    Solitamente il messaggio viene scritto in inglese, con una frase semplice formata da verbo imperativo e complemento es. `add interceptors`

    `git commit -m '<messaggio>'`

* **checkout**
    Viene usato per _saltare_ da un ramo all'altro del progetto.
    * `git checkout <nome_branch>` si sposta su un'altro branch di nome <nome_branch>
    * `git checkout -b <nome_nuovo_branch>` per creare un nuovo ramo e _saltarci_ dentro.
    * `git checkout -- .` per _eliminare_ le modifiche presenti nello `stage` e tornare alla situazione descritta dall'ultima commit del branch sui cui stiamo lavorando.

* **branch**
    Viene usato per visualizzare i branch attivi e quello su cui ci si trova, per creare o eliminare i branch.

    * `git branch` mostra i branch presenti nel repository e segnala quello attivo con un "*"
    * `git branch -d <nome_branch>` elimina il branch <nome_branch>
    * `git branch <nome_branch>` crea il branch <nome_branch>

* **push**
    Viene usato per **inviare online** (letteralmente _spingere_) i commit del `branch` su cui si sta lavorando all'interno del `branch` corrispondente online.

    Al primo push su una repository remota si aggiunge l'indicazione delle `remote` a cui si intende inviare il codice (tipicamente `origin`) come destinazione e il nome del branch (as esempio `master`) che si intende caricare:

    `git push origin master` → 1° push sul branch master in remoto
    `git push` → per tutte le altre
* **pull**
    E' il comando opposto a `git push` e permette di _scaricare_ la versione remota del branch e di mergiarla con quella locale.
    In questa fase possono verificarsi dei conflitti (conseguenti al merge) che devono essere controllati ed appianati.

    Prima di effettuare una nuova 'push' è sempre consigliato (e a volte necessario) effettuare una 'pull'.
    `git pull`

* **clone**
    Viene usato per _clonare_ una repo da remoto in locale, ovvero trasformare una cartella locale in una copia del repository remoto.

    Il comando richiede l'indirizzo della repository su GitHub ed il protocollo utilizzato: **https** o **ssh**.

    * `git clone https://<autore>/<nome_repo>.git` per il clone HTTPS
    * `git clone git@github.com:<autore>/<nome_repo>.git` per il clone SSH

    **NB**: Per usare il metodo ssh bisogna avere un account GitHub ed aver collegato una chiave ssh valida.
* **merge**
    Permette di _unire_ il contenuto di un branch (locale o remoto) all'interno del branch corrente.

    Gli (eventuali) conflitti che si generano vanno risolti manualmente, selezionando quali modifiche mantenere, se la versione locale (HEAD) o quella che si sta cercando di integrare (INCOMING).

## Github

GitHub è un servizio gratuito (almeno per le funzionalità base) di hosting e versionamento di codice basato su Git.
Ad oggi conta più di 40 milioni di utenti con più di 190 milioni di repository ed è quindi il più grande servizio di questo genere al mondo, sorpassando di gran lunga SourceForge e Google Code.

Su GitHub è possibile caricare le proprie repository e condividerle con i propri collaboratori. Permette inoltre di gestire il versionamento attraverso il sistema di _pull e merge_, permettendo così a più utenti collaboratori di sviluppare codice a blocchi.
GitHub permette di far accedere alle repository dell'utente collegando il proprio computer tramite ssh.
Per poter creare una chiave ssh è sufficente il comando `ssh-keygen` ed inserire la chiave pubblica all'interno delle informazioni utente sul sito di GitHub.

## Componenti Progetto Github

* **README**

    Il file README è spesso il primo file che viene visualizzato e deve contenere quindi le informazioni importanti del progetto.
    GitHub permette di visualizzare direttamente sulla pagina progetto il README inserito nella root di progetto.
    Solitamente viene scritto in Markdown, come questa guida ;-).
* **Issue**

    Le Issues sono il modo di GitHub per tenere traccia dei task, avanzamenti e bug di un progetto.
    Sono dei _documenti online_ che possono essere condivisi e discussi con gli altri collaboratori di progetto.
    Ogni repository ha la propria sezione dedicata alle issue.
    Chiunque dei collaboratori può creare issue, assegnarle ad altri ed effettuare la review prima di una PR.

* **PR** (aka 'pull request')

    Le pull request permettono ai collaboratori di far _mergiare_ il proprio codice nel progetto principale.

    Quando una PR viene aperta, è possibile discutere e revisionare i cambiamenti con i collaboratori prima di effettuare l'ultima commit e fare il merge con il branch principale.

* **Contributors**

    Il creatore di una repository può inserire i collaboratori o _contributors_, i quali devono possedere un account GitHub valido.

    Mentre per le repository pubbliche, tutti gli utenti possono vedere e scaricare (clone), solo i contributor possono effettuare i push e le pull request.
