## Database

Il codice contenuto all'interno di una pagina PHP viene eseguito ogni volta che
la risorsa corrispondente alla pagina viene richiesta. 

Questo significa che non è possibile utilizzare alcun file PHP per mantenere lo
**stato** di una applicazione, ovvero qualsiasi dato contenuto nella pagina non
può essere considerato permanente. 

Per ovviare a questo inconveniente strutturale del PHP si utilizza un altro
strumento: il **database**, spesso abbreviato con la sigla **DB**.

Un **database** è un software in grado di immagazzinare dati e renderli
disponibili attraverso una connessione client/server.
Dato che esso non viene *eseguito* ad ogni richiesta, può essere utilizzato per
condividere dati tra diverse pagine PHP, in modo da rendere *permanente* lo
stato dell'applicazione. 

La **connessione** al database è quel processo attraverso il quale un *client* (sia
esso una pagina PHP, una applicazione mobile o qualsiasi altro software in grado
di accedere alla rete) inizia una comunicazione con il server di database, si
autentica e predispone il collegamento attraverso il quale invierà poi le
istruzioni SQL. 

Dal momento che il server di database dispone di risorse finite, è buona norma
*chiudere* la connessione una volta finito il processo di *interrogazione*
(query) o di *inserimento dati* (insert) da parte del client. 

Per comunicare con i database si utilizza il linguaggio **SQL** (**S**tandard
**Q**uery **L**anguage). 

I database si dividono in due categorie principali, in base al sistema interno
che usano per immagazzinare e collegare i dati: 

* **Relazionali**: i dati sono divisi in *tabelle* e le relazioni tra le varie
    tabelle avvengono per mezzo di **chiavi univoche** (dette *primary* o
    *foreign*) che identificano le risorse da collegare.
* **Non Relazionali** o **Documentali**: i dati sono inseriti in *documenti* a loro
    volta contenuti in *collezioni* di elementi. All'interno di ogni documento
    sono presenti tutti i dati ad esso collegati, comprese le eventuali
    relazioni. 

### MySQL

**MySQL** è un server o *motore* (*database engine*) di database di tipo
*relazionale* che, al momento, è maggiormente diffuso a livello globale. 

Fa parte dello *stack* LAMP (**L**inux **A**pache **M**ySQL **P**HP)
l'architettura più comune del Web. 

L'integrazione tra PHP e MySQL avviene per mezzo di un **driver**, ovvero di una
libreria contenente le funzioni necessarie al collegamento, all'interrogazione e
all'estrapolazione dei dati contenuti nel database.

`mysqli` (*mysql improved*) è il driver predefinito per il collegamento con
MySQL in PHP. 

Per utilizzarlo in uno script/pagina PHP non è necessario importare nessun
componente o libreria, in quanto esso fa parte della distribuzione stadard di
PHP ed è quindi già installato anche se si usano distribuzioni *entry level*
come XAMPP.  

### Funzioni base di `mysqli`

* `mysqli_connect($servername, $username, $password, $database)` <br>
  Questa funziona è responsabile del collegamento con un database di nome
  `$database` installato su un server di nome `$servername`, usando come nome
  utente e password `$username` e `$password`. Questa funzione, quando va a buon
  fine, ritorna un oggetto di tipo `connessione`, da utilizzare per tutte le
  altre operazioni (inserimento, interrogazione, chiusura connessione) 

* `mysqli_close($connection)` <br>
  Questa funzione serve per chiudere la connessione al database una volta
  eseguite le operazioni richieste. 

* `mysqli_query($connection, $querySQL)` <br>
  Questa funzione serve per inviare al database una richiesta SQL, sia in
  lettura che in scrittura. La stringa `$querySQL` deve essere formattata
  correttamente seguendo il protocollo SQL, pena l'impossibilità da parte di
  MySQL, di processare correttamente la richiesta. Il risultato di questa
  operazione è un oggetto di tipo `resultSet` che contiene l'esito della query
  ed, eventualmente, i dati ad essa associati. 

* `mysqli_fetch_all($resultSet, ARRAY_TYPE)` <br>
  Con questa funzione è possibile recuperare da un `$resultSet` tutti i dati
  relativi alla query di *lettura* (SELECT) collegata al `$resultSet`. La
  costante `ARRAY_TYPE` rappresenta il tipo di array con cui si vuole
  rappresentare ogni *record* o *riga* dela tabella. Esso può essere uno tra: 
    * **MYSQLI_ASSOC**: in questo caso, ogni riga sarà rappresentata da un *array
        associativo* in cui le chiavi saranno i nomi delle intestazioni delle
        colonne selezionate dalla query. I valori dell'array associativo
        rappresentano il valore effettivo contenuto nella colonna corrispondente
        alla chiave nella riga di riferimento.
    * **MYSQLI_NUM**: in questo caso, ogni riga sarà rappresentata da un *array
        posizionale* in cui ogni elemento corrisponde al valore della colonna
        i-esima della tabella. Per ricostruire la corrispondenza tra valore di
        riga e colonna sarà necessario conoscere l'ordinamento dell'array delle
        intestazioni di colonna.

* `mysqli_error($connection)` <br>
  Questa funzione ritorna l'ultimo errore riscontrato durante l'ultima
  interrogazione al database, sia in lettura che in scrittura.

Per una più completa lista delle funzioni disponibili per l'interazione con il
database MySQL si rimanda al sito [w3schools](https://www.w3schools.com/php/php_ref_mysqli.asp) alla sezione *MySQLi Functions*.

