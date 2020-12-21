# Uso del terminale

## Introduzione

Con **terminale** intendiamo qualsiasi sistema fisico o virtuale attraverso il quale è possibile comunicare con un computer.
Esempi di "terminale" di uso comune sono lo schermo, la tastiera e il mouse.

In programmazione, con terminale andiamo ad intendere un'applicazione (nativa, virtualizzata o web) che ci permette di inviare comandi e in generale di interagire con un sistema operativo utilizzando un'**interfaccia da riga di comando**, comunemente nota con il nome di **CLI** (appunto _Command Line Interface_).

Con questa modalità di interazione è possibile inviare al sistema in oggetto comandi e istruzioni sotto forma di **stringhe di testo** opportunamente formattate.

In questo modo è possibile portare a termine tutte quelle operazioni che normalmente svolgiamo usando primariamente il mouse (ad esempio entrare in una cartella, copiare un file, creare un file di testo, spostare file e cartelle, aprire programmi, interagire con Internet, ecc) utilizzando **comandi, istruzioni e parametri**.

Ogni terminale ha un suo "linguaggio", ovvero una serie di convenzioni e di protocolli che permettono di comunicare direttamente con il computer su cui stiamo lavorando.

Possiamo pensare al terminale come ad un "interprete", che comprende le nostre intenzioni (inserite sotto forma di comandi e istruzioni) e le comunica direttamente al Sistema Operativo, recuperando il risultato generato e mostrandolo all'utente che ne ha fatto richiesta.

L'interprete di terminale maggiormente usato sia in ambito Linux che Windows è Bash.

Per accedere al terminale di un PC, è consigliato usare la funzione "Terminale" di VSCode, scegliendo l'interprete Bash, oppure, se su Linux, di usare l'applicazione terminale fornita dalla vostra distribuzione.

## Comandi

Di seguito sono presentati i comandi più utili e maggiormente usati in fase di sviluppo di progetti Web:

* **cd**

  `cd` sta per Change Directory e il suo compito è esattamente quello di cambiare la directory corrente al path specificato come primo argomento.
  Ad esempio `cd /home/user/Desktop` porta la directory corrente da quella in cui siamo a `/home/user/Desktop`.
  E' l'equivalente del doppio clic all'interno di una cartella in Esplora Risorse di Windows, solamente che in questo caso è necessario indicare il percorso specifico della cartella in cui si intende entrare
* **pwd**

  `pwd` sta per Print Working Directory e serve appunto per stampare a video la cartella corrente. Il terminale, come l'Esplora Risorse, può rappresentare una cartella del FileSystem alla volta e applica i comandi che inseriamo alla cartella in cui ci si trova nel momento dell'applicazione. `pwd` permette di conoscere questa cartella
* **ls**

  `ls` sta per List e serve per mostrare il contenuto di una cartella. Con l'opzione `ls -la` mostra tutti i file, anche quelli nascosti, nella cartella corrente, uno sotto l'altro.
* **mkdir**

    `mkdir` sta per Make Directory e serve per creare una cartella all'interno della cartella corrente. Il nome della cartella che verrà creata è il primo paramentro che viene passato al comando: `mkdir prova` creerà una cartella all'interno della cartella corrente di nome `prova`.
* **mv**

    `mv` sta per Move e serve per spostare o rinominare un file o una cartella. Opera sempre su una _sorgente_ (primo paramento) e su una _destinazione_ (secondo paramentro). Se la destinazione è già presente ed è una cartella, la sorgente verrà **spostata** al suo interno. Se invece la destinazione non è presente, significa che la sorgente verrà rinominata con il valore della destinazione.

    **Attenzione:** rinominare un file o una cartella non significa semplicemente cambiargli nome. `mv` si riferisce al _nome_ di un file o di una cartella indicando il suo _path_ o percorso. E' quindi possibile rinominare e spostare un file nella stessa operazione.

    Esempi:
    * `mv sorgente origine` rinomina il file sorgente in origine (solo se origine non esiste, altrimenti lo sovrascrive - se è un file - o lo inserisce nella cartella - se è una cartella)
* **cp**

    `cp` sta per Copy ed è molto simile a `mv`, solo che invece di spostare o rinominare semplicemente copia la sorgente nella destinazione. Se la destinazione è una cartella, copia la sorgente dentro la cartella destinazione. Se si volesse copiare una cartella _sorgente_ dentro la cartella _destinazione_ si dovrebbe usare il paramentro `-r`, ovvero _recursive_.

    Esempi:

    * `cp sorgente destinazione` crea un file destinazione con lo stesso contenuti di sorgente.
    * `cp sorgente destinazione/` crea un file chiamato sorgente dentro la cartella destinazione.

* **rm**

    `rm` sta per Remove ed è utilizzato per eliminare file o cartelle. Come `cp` per poter cancellare una cartella è necessario usare il parametro `-r`.

    Esempi:
    * `rm file` cancella il file _file_
    * `rm -r folder` cancella la cartella _folder_
* **clear**

    `clear` serve per cancellare la finestra corrente del terminale. Dato che è un tipo di interazione testuale, solitamente le _console_ (così vengono chiamate le finestra in cui gira il terminale) hanno una dimensione di 80x44, ovvero 80 colonne e 44 righe. E' quindi facile "riepire" il terminale di testo. `clear` lo cancella tutto e sposta il _prompt_ (ovvero il posto in cui vengono inseriti i comandi) alla prima riga della console.
* **touch**

    `touch` serve per creare un file vuoto nella directory corrente. Il nome del file sarà il primo argomento passato a `touch`. Il file viene solamente creato, ma sarà completamente privo di contenuto.
* **cat**

    `cat` sta per Concat e serve per mandare in output il contenuto di un file. Di base, l'output di questo comando viene stampato a video ma è sempre possibile redirigere questo output ad un altro file o comando. `cat` accetta un numero arbitrario di parametri, ma tutti devono rappresentare percorsi validi di file. L'output sarà sempre la concatenazione del contenuto di questi file, uno dietro l'altro.

    Esempi:
    * `cat prova` stampa il contenuto del file _prova_ a terminale
    * `cat uno due tre` stampa la concatenazione dei file _uno, due e tre_ a video
    * `cat uno due tre > concatenazione` concatena i file _uno, due e tre_ e crea un file di nome _concatenazione_ contenente l'output generato.
* **echo**

    `echo`, come in PHP, permette di scrivere a video quanto gli viene comunicato come parametro.

    Esempi:
    * `echo testo di prova` stampa testo di prova sul terminale

Oltre ai comandi, in Bash esistono anche delle istruzioni che possono essere usate per concatenare tra loro diversi comandi:

* **Pipe**

    In bash il `|`, anche detto _pipe_, serve per _dirigere l'output di un comando all'input di un altro_.
    Operativamente, quindi, è possibile concatenare due comandi e permettere di utilizzare il risultato del primo come _input_ del secondo.

    Ad esempio, in questo caso, l'output del primo comando è un testo che normalmente verrebbe stampato a schermo, mentre in questo caso viene inviato al secondo comando, `cat` che provvede a stamparlo a schermo:
    ```bash
    echo "Testo di prova" | cat
    ```

    In questo altro esempio, `cat` stamperebbe il contenuto del file _prova_ a schermo, invece con il `|` questo viene usato come input per il comando `grep`, che serve per cercare stringhe all'interno di un testo. I due comandi, insieme, permettono di cercare una stringa all'interno di un file:
    ```bash
    cat prova | grep 'testo da cercare'
    ```

* **Redirect a file**

    Di base, l'output dei comandi viene stampato a video, quindi sul terminale su cui si sta lavorando.

    Talvolta è necessario salvare l'esecuizione di un programma all'interno di un file.  
    Per fare questo, in bash è sufficiente _redirigere_ l'output di un comando usando il carattere `>`.

    ```bash
    ls > folder-content.txt
    ```

    Questo comando andrà a scrivere la struttura della cartella corrente all'interno del file `folder-content.txt`.

    Nel caso il file non fosse presente, bash andrà a crearlo e quindi a popolarlo con il contenuto desiderato.  
    In alcuni casi, è preferibile o necessario andare a concatenare un certo output al contenuto già presente in un certo file. In questo caso si usa il comando `>>`, che appunto va ad _appendere_ in fondo al file il nuovo output.

    ```bash
    echo "Prima riga" > append.txt
    echo "Seconda riga" >> append.txt

    cat append
    ```

    A schermo verrà mostrato il contenuto del file `append.txt`:
    ```
    Prima riga
    Seconda riga
    ```

* **Path helpers**

    La maggiorparte dei comandi in bash possono ricevere come paramentro un _path_, ovvero il percorso di un file.

    Bash permette di utilizzare come path alcune _scorciatoie_:

    * `.`: con il punto si fa riferimento alla cartella corrente
    * `..`: con il doppio punto si fa riferimento alla cartella _padre_ della cartella di lavoro
    * `-`: con il - si fa riferimento all'ultima cartella visitata (ultimo salto effettuatato con `cd`)
    * `~`: con la ~ si fa riferimento alla propria cartella Home
