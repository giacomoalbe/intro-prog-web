# Git & Github

## Introduzione al versionamento

TODO: cosa significa versionare e come impatta nel mondo dello sviluppo del codice, con particolare relazione alla collaborazione tra diversi sviluppatori

Il controllo di versione è un sistema che permette di tenere traccia nel tempo di cambiamenti ad un file o ad una serie di file, così da poter richiamare una specifica versione in un secondo momento.  
Questo approccio permette inoltre di tenere traccia dei cambiamenti tra le versioni, oltre a facilitare la stesura della documentazione.  
L'utilizzo di sistemi di controllo del versionamento come il programma Git (locale) e [Github](https://github.com/) (il sito servizio di cloud di Git), permettono di lavorare allo sviluppo in team. Git permette infatti di creare 'branches', rami che sono copie del ramo principale del codice sorgente, nel quale si possono inserire gli sviluppi successivi. Implementate le nuove modifiche è quindi possibile inserire o 'merge' all'interno del ramo principale, unendo il lavoro di tutti gli sviluppatori controllando le sovrapposizioni.

## Concetti base

* **Repository**  
Una repository (aka repo) è una cartella od uno spazio di archiviazione dove sono inseriti tutti i file del progetto. Può trovarsi all'interno di una cartella nel computer o nello spazio di GitHub o in un'altro servizio di hosting online.  
All'interno di una repository è possibile inserire qualunque tipo di file, che sia codice, immagine o altro. Per Github consigliano comunque di non inserire file singoli di dimensione superiore a 60Mb.

* **Stage**  
Lo 'stage', letteralmente 'palco', è lo step precedente al 'commit'. Esso contiene tutte le modifiche che si vuole salvare attraverso il commit. All'interno dello stage è ancora possibile modificare i file, rimuovere o aggiungere modifiche.  
Il comando usato per aggiungere i file modificati all'interno dello stage è `git add <nome_file>`  

* **Commit**  
Commit è il termine usato per indicare la fase nella quale vengono incluse le modifiche da inserire nel prossimo commit. Una volta aggiunte le modifiche all'interno dello stage, Git non salva automaticamente tutto in un commit, ma deve essere effettuato manualmente attraverso il comando `git commit`

* **Branch**  
Il branch indica il ramo di codice. Il ramo principale viene chiamato 'master'. Benchè si possa lavorare direttamente sul master, è consigliato iniziare un nuovo branch ogni volta che si vuole implementare una nuova funzionalità. Questo permette agli altri sviluppatori di lavorare su un codice 'non ancora inquinato'.

* **Remote**  
Repository in remoto sono versione di un progetto hostate su internet. Un utente Git può lavorare su git

## Comandi Git

* **Init**  
Viene utilizzato per inizializzare un progetto git. Viene utilizzato all'interno della directory da 'trasformare' in repository.  
`git init `
* **status**  
Permette di controllare quali file sono stati modificati, quali inseriti nello stage, quali sono pronti per il commit.  
`git status`
* **add**  
Inserisce i file selezionati all'interno dello stage.  
`git add <file>` o `git add .`
* **commit**  
Salva definitivamente le modifiche all'interno del branch. Bisogna inserire anche il parametro '-m' che imposta un messaggio per il commit.  
`git commit -m '<messaggio>'` - solitamente il messaggio viene scritto in inglese, con una frase semplice formata da verbo imperativo e complemento es. 'add interceptor'.
* **checkout**  
Viene usato per 'saltare' tra un ramo e l'altro del progetto.  
`git checkout <nome_branch>` o `git checkout -b <nome_nuovo_branch>` per creare un nuovo ramo e 'saltarci' sopra.
* **branch**  
Viene usato per visualizzare i branch attivi e quello su cui ci si trova.
* **push**  
Viene usato per inserire i commit all'interno della repo online. Al primo push su una repository remota si aggiunge 'origin' come destinazione e 'master' come branch sul quale ci si trova all'inizio:  
`git push origin master` → 1° push sul branch master in remoto  
`git push` → per tutte le altre
* **pull**  
Permette di aggiornare la versione locale della repository con quella remota. In questa fase possono verificarsi dei conflitti che devono essere controllati ed appianati. Prima di effettuare una nuova 'push' è sempre consigliato effettuare una 'push'.  
`git pull`
* **clone**  
Viene usato per 'clonare' una repo da remoto in locale. Il comando richiede l'indirizzo della repository su GitHub ed il protocollo utilizzato: https o ssh.  
`git clone https://<autore>/<nome_repo>.git` o `git clone git@github.com:<autore>/<nome_repo>.git`    
**NB**: Per usare il metodo ssh bisogna avere un account GitHub ed aver collegato una chiave ssh valida.
* **merge**
Permette di 'unire' due branch, i conflitti che si genereranno andranno risolti manualmente, selezionando quali modifiche mantenere.

## Github

GitHub è un servizio gratuito (almeno per le funzionalità base) di hosting e versionamento di codice basato su Git.  
Ad oggi conta più di 40 milioni di utenti con più di 190 milioni di repository ed è quindi il più grande servizio di questo genere al mondo, sorpassando di gran lunga SourceForge e Google Code.  

Su GitHub è possibile caricare le proprie repository e condividerle con i propri collaboratori. Permette inoltre di gestire il versionamento attraverso il sistema di pull e merge, permettendo così a più utenti collaboratori di sviluppare codice a blocchi.  
GitHub permette di far accedere alle repository dell'utente collegando il proprio computer tramite ssh.  
Per poter creare una chiave ssh è sufficente il comando `ssh-keygen` ed inserire la chiave pubblica all'interno delle informazioni utente sul sito di GitHub.

## Componenti Progetto Github

* **README**  
Il file README è spesso il primo file che viene visualizzato e deve contenere quindi le informazioni importanti del progetto.  
GitHub permette di visualizzare direttamente sulla pagina progetto il README inserito nella root di progetto.  
Solitamente viene scritto in Markdown, come questa guida ;-).
* **Issue**  
Le Issues sono il modo di GitHub per tenere traccia dei task, avanzamenti e bug di un progetto.  
Sono messaggi che possono essere condivisi e discussi con gli altri collaboratori di progetto.  
Ogni repository ha la propria sezione dedicata alle issue.
Chiunque dei collaboratori può creare issue, assegnarle ad altri ed effettuare la review prima di una PR.  

* **PR** (aka 'pull request')  
Le pull request permettono ai collaboratori di venire a conoscenza dei cambiamenti che sono stati pushati all'interno di un branch. Quando una PR viene aperta, è possibile discutere e revisionare i cambiamenti con i collaboratori prima di effettuare l'ultima commit e fare il merge con il branch principale.  
* **Contributors**
Il creatore di una repository può inserire i collaboratori o 'contributors', i quali devono possedere un account GitHub valido.  
Mentre per le repository pubbliche, tutti gli utenti possono vedere e scaricare (clone), solo i contributor possono effettuare i push e le pull request. 
