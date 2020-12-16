# Array 

## Array Posizionali

In programmazione un array è un tipo di variabile il cui valore è un insieme di altre variabili.

Questo array viene definito posizionale in quanto le variabili al suo interno sono distinte l'una dall'altra in base alla loro posizione all'interno dell'array. 

Ogni variabile infatti ha un suo indice, che identifica appunto la posizione di quella variabile all'interno dell'array.

Da notare che in programmazione il primo elemento di qualsiasi insieme ha indice 0, non 1. 

Quindi il primo elemento di un array si dice che è all'indice 0, il secondo all'indice 1 e così via. 

L'indice corrispondente all'ultimo elemento è dunque il numero di elementi dell'array meno uno.  

Per definire un array si usano le parentesi quadre, separando tutti gli elementi con una virgola

```php
//           Indice: 0  1  2  3
$arrayPosizionale = [1, 2, 3, 4];
```

### Accedere agli elementi di un array: indicizzazione

Per accedere al contenuto di una variabile che fa parte di un array è necessario indicizzare l'array,
ovvero indicare il nome dell'array e tra le parentesi quadre l'indice dell'elemento che si desidera ottenere:

```php
echo $arrayPosizionale[3];
```

### Inserire un elemento in un array
Per inserire un elemento in un array è sufficiente richiamare il nome dell'array con a fianco una coppia di parentesi quadre. 
A seguito dell'uguale sarà necessario inserire il valore che si intende aggiungere all'array. 

Questa operazione aggiungere l'elemento alla fine dell'array, quindi in questo modo inseriamo il nuovo elemento finale dell'array:

```php
$arrayPosizionale[] = 5;

// Stampa dell'elemento appena inserito
echo $arrayPosizionale[4] . "<br>";
```

### Eliminazione elemento da array
Per eliminare un elemento da un array si deve richiamare la funzione unset sull'elemento dell'array che vogliomo cancellare. 

Per definire quale elemento vogliamo cancellare dobbiamo indicizzare quell'elemento, mettendo tra parentesi quadre l'indice desiderato 

```php
unset($arrayPosizionale[4]);
```

In questo caso stiamo richiedendo il valore corrispondente all'indice 400 dell'array, quindi il 401esimo elemento. 
Dal momento che il nostro `arrayPosizionale` ha solo 5 elementi, l'interprete di PHP darà un warning dicendo che non riesce a trovare l'elemento richiesto. 

```php
echo $arrayPosizionale[400] . "<br>";
```

### Testare se elemento è presente in array

Per verificare che un elemento sia presente all'interno di un array posizionale, ovvero che un certo indice corrisponda ad un elemento esistente dell'array, dobbiamo utilizzare la funzione isset(), la quale prende come argomento l'elemento dell'array 
di cui vogliamo verificare l'esistenza e restituisce un valore booleano (true/false) che possiamo utilizzare ad esempio all'interno di una selezione if (come nel caso sottostante). 

```php
if (isset($arrayPosizionale[400])) {
  echo $arrayPosizionale[400];
} else {
  echo "Elemento non trovato all'interno dell'array!<br>";
}
```

### Modificare elemento esistente
Per modificare un elemento esistente è sufficiente indicizzarlo alla sinistra dell'uguale usando l'operatore `[<indice>]` e alla destra dell'uguale inserire il nuovo valore che si intende associare a quella posizione nell'array. 
Se noi inserissimo un indice non presente nell'array, PHP lo creerebbe e quindi gli assocerebbe il valore che abbiamo scritto:

```php
$arrayPosizionale[2] = 467;
```

Per contare gli elementi di un array e quindi conoscere la lunghezza di quest'ultimo si usa la funzione `count()` che prende come argomento l'array e restituisce la lunghezza (intera) dell'array

```php
echo "Elementi di un array: " . count($arrayPosizionale) . "<br>";
```

### Stampare contenuto di un array
Per stampare il contenuto di un array è necessario usare la funzione `var_dump`, in quanto l'echo normale non è in grado di mostrarci correttamente i valori all'interno dell'array.

`var_dump` ci mostra anche il tipo di variabile contenuto nell'array, la lunghezza dei vari campi e separa graficamente gli elementi

```php
echo var_dump($arrayPosizionale);
```

Si possono definire array di tutti i tipi fondamentali di dati, come ad esempio le stringhe.

Per agevolare la lettura, è consigliabile scrivere gli array come segue, inserendo ogni elemento in una riga diversa e mettendo le parentesi anch'esse su una riga a parte

```php
$giorniDellaSettimana = [
  "Sabato sera",
  "Sabato sera",
  "Sabato sera",
  "Sabato sera",
  "Sabato sera",
  "Sabato sera",
  "Sabato sera",
];
```

E' possibile stampare l'array nel modo seguente, indicando tutti gli indici fino all'ultimo.
Nel momento in cui dovessimo cambiare gli elementi dell'array giorniDellaSettimana dovremmo ricordarci anche di modificare la procedura di stampa sottostante, cosa non agevole.
Di seguito verrà presentato un modo automatico per realizzare la stessa funzionalità.

```php
echo $giorniDellaSettimana[0] . "<br>";
echo $giorniDellaSettimana[1] . "<br>";
echo $giorniDellaSettimana[2] . "<br>";
echo $giorniDellaSettimana[3] . "<br>";
echo $giorniDellaSettimana[4] . "<br>";
echo $giorniDellaSettimana[5] . "<br>";
echo $giorniDellaSettimana[6] . "<br>";

echo "I giorni della settimana sono " . count($giorniDellaSettimana) . "<br>";
```
## Array Associativi 

In PHP esistono due diversi tipo di array, che differiscono principalmente per il modo in cui associano
gli elementi presenti al loro interno ai valori che utilizziamo per accedere a questi elementi. 

Negli array posizionali, quello che abbiamo appena visto e utilizzato fino ad adesso, il modo che abbiamo per 
accedere ad un elemento è quello di usare l'indice di quell'elemento, ovvero indicizzare l'array su quell'elemento. 
Ad esempio se avessimo un array di 3 elementi

```php
$array = [1,2,3] 
```

E volessimo accedere al secondo elemento, dovremmo utilizzare la seguente istruzione:
```php
$secondoElemento = $array[1]; // 1 non 2, in quanto sappiamo che gli indici in PHP iniziano da 0!!!
```

In questo caso si dice che la chiave per accedere al secondo elemento è la sua posizione. 

In PHP esiste un'altro tipo di variabile molto simile ma nel quale il modo 
che abbiamo per identificare un'elemento è quello di utilizzare la sua chiave, 
che definiziamo in fase di creazione della variabile. 
Quello che facciamo infatti è associare quell'elemento a quella chiave. 
Questo tipo di variabile è chiamato, appunto, array associativo. 

```php
$arrayAssociativi = [
  "lun" => "Lunedì", 
  "mar" => "Martedì",
  "mer" => "Mercoledì",
];
```

Come si può notare, l'array associativo si definisce allo stesso modo di quello posizionale, l'unica differenza 
sta nel modo di scrivere i suoi elementi. 
Per semplicità di lettura, ogni elemento è scritto su una riga diversa, ma nulla vieta di scrivere tutti gli elementi 
su di un a riga sola. Consiglio caldamente però di non sacrificare mai la leggibilità del codice, quindi è sempre meglio, 
anche per gli array posizionali, scrivere tutti ogni elemento su di una riga diversa. 

Per aggiungere un elemento ad un array associativo è necessario definire una chiave e ad essa associarli un valore.
La chiave deve essere un valore di tipo stringa, numerico o booleano. Il valore, invece, può essere di qualsiasi tipo e 
nulla vieta che esso sia un altro array posizionale o associativo.

Tutte le operazioni che applicavamo ad un array posizionale possiamo tranquillamente applicarle anche ad un array associativo 
con l'unica accortezza di cambiare il modo con cui ci interfacciamo agli elementi. 
Se con l'array posizionale usavamo la posizione o l'indice dell'elemento per riferirci ad essere, con quelli associativi 
dobbiamo usare esclusivamente la chiave con cui abbiamo definito quell'elemento. Non possiamo, ad esempio, stampare il primo
elemento di un array associativo scrivendo

```php
echo $arrayAssociativi[0]
```

In quanto su quell'array non esiste la chiave corrispondente a 0 (che infatti è "lun").
Anche gli array posizionali, infatti, non sono altro che array associativi in cui le chiavi sono gli indici
con cui l'elemento è inserito all'interno dell'array

Questa istruzione stampa l'elemento corrispondente alla chiave "lun" dell'array `arrayAssociativi`:

```php
echo $arrayAssociativi["lun"]; 
```

Una delle funzioni più importanti degli array associativi è quella di definire delle strutture di dati,
ovvero delle variabili che al loro interno contengano dei campi relativi a certe caratteristiche dell'oggetto 
che vogliono descrivere. 

Ad esempio, qui andiamo a definire una variabile chiamata `$utente` che al suo interno definisce degli elementi
associati a diverse chiavi che rappresentano dei "campi" dell'oggetto, ovvero vanno a descrivere delle caratteristiche 
dell'oggetto `$utente` e ci permettono di riferirci ad esse usando il loro nome. 

Il primo elemento dell'array associativo `$utente` non è un solamente un oggetto scorrelato da `$utente`, bensì 
una caratteristica di `$utente`, in particolare rappresenta l'età del nostro utente, e ci permette di 
riferirci ad essa usando una chiave "semantica", ovvero che descrive il contenuto della variabile a cui fa riferimento. 

Ora dunque per riferirci all'età del nostro utente potremo scrivere `$utente`['eta'], ovvero "dammi l'età dell'utente". 
Sarà molto più facile all'interno di funzioni e in generale nel nostro codice riferirci ai campi che ci interessano.

```php
$utente = [
  "eta" => 25,
  "nome" => "Giacomo",
  "cognome" => "Alberini",
  "email" => "giacomoalbe@gmail.com",
  "password" => "ilovephpjustkidding" 
];
```

Un esempio di quanto appena detto. Per scrivere nome e cognome dell'utente possiamo
fare riferimento agli elementi dell'array associativo, che sono relativi appunto 
alle caratteristiche dell'oggetto che stiamo descrivendo (una persona appunto).

```php
echo "Ciao, " . $utente["nome"] . " " . $utente['cognome'] . "!<br>";
```

Questa funzione si aspetta che il suo parametro di ingresso di un array associativo 
contenente le chiavi nome, cognome, eta e email che poi andrà a stampare
Qui definiamo la funzione, ovvero associamo un certo numero di istruzioni ad una "etichetta"
(il nome della funzione) che più tardi utilizzeremo per eseguire il codice ad essa associato. 

```php
function salutaPersona($utente) {
  $nome = $utente["nome"];
  $cognome = $utente["cognome"];
  $eta = $utente["eta"];
  $email = $utente["email"];

  echo "Ciao, $nome $cognome! Hai $eta anni! Ti mando una mail a $email!<br>";
}
```

Qui richiamiamo la funzione salutaPersona, dopo averla definita sopra. 
Fino al momento della chiamata, la funzione non fa assolutamente nulla. 

```php
salutaPersona($utente);
```

Questo è un esempio di come possiamo usare il ciclo foreach per stampare 
sia le chiavi che gli elementi di un array associativo. Se non avessimo 
usato la sintassi `$chiave => $valore`, non avremmo avuto accesso a tutte le informazioni 
per descrivere correttamente un array associativo, ma solo il valore corrispondente ad ogni chiave
senza però sapere il valore della chiave stessa. 

```php
foreach($utente as $chiave => $valore) {
  echo "Chiave: $chiave => Valore: $valore<br>";
}
```


