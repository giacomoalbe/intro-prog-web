# Capitolo 2
## Cicli e Array

### Array 
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

### Convenzioni per la scrittura di variabili e nomi di funzioni e classi.

Non è obbligatorio sceglierne una in particolare, quello che è fortemente consigliato e decisamente necessario è sceglierne UNA e UNA SOLA all'interno di un progetto e utilizzarla PER OGNI variabile o funzione che si crea. 

Altro consiglio utile: perdete pure del tempo a dare dei nomi significativi a variabili e funzioni.

*Ricordate: un nome ben dato è meglio di una riga di commento!* cit. il saggio programmatore sulla roccia.

- CamelCase
  - ciaoComeAndiamo 
  - giorniDellaSettimana

- PascalCase
  - CiaoComeAndiamo
  - GiorniDellaSettimana

- SnakeCase
  - ciao_come_andiamo
  - giorni_della_settimana

- KebabCase
  - ciao-come-andiamo
  - giorni-della-settimana

- AdMinchiamCase
  - gioRNi_Della_sett
  - gds
  - ccc
  - a

### Ripetere azioni un numero definito di volte: il ciclo FOR 

Il ciclo for è uno degli elementi più comuni e potenti della programmazione.  
E' un costrutto il cui scopo principale è ripetere un certo numero di istruzioni/operazioni un certo numero di volte.
Ad esempio se si volesse ripetere 5 volte la stampa a schermo di un messaggio "ciao mondo", dovremmo scrivere il comando: `echo 'ciao mondo';` su 5 righe diverse, in questo modo:

```php
echo 'ciao mondo'; 
echo 'ciao mondo'; 
echo 'ciao mondo'; 
echo 'ciao mondo'; 
echo 'ciao mondo'; 
```

Questo approccio benchè funzionante non è molto comodo. 
La soluzione a questo problema è individuare il gruppo di istruzioni che si intendono ripetere (in questo caso `echo "ciao mondo"`) e inserirlo all'interno di un ciclo for, impostando correttamente il ciclo in modo da dirgli di ripetere l'operazione un certo numero di volte (5 nel nostro caso)

La sintassi del ciclo for è la seguente:

```php
for (<inizializzazione>; <condizione>; <incremento> {
   <istruzione 1>
   <istruzione 2>
   <istruzione 3>
    <istruzione 4>
}
```

Dove:
* **INIZIALIZZAZIONE**

  E' la prima istruzione da dare al ciclo. 
  Qui dobbiamo definire una variabile, chiamata variabile di ciclo, la quale avrà la funzione di "segnaposto" per farci capire a che punto siamo arrivati nel ciclo 
  Solitamente alle variabili di ciclo si usa dare il nome degli indici matematici (i,j,k,l). 
  Non è obbligatorio, ma è consigliato rispettare questa convenzione, per far capire subito a chi scrive o legge il nostro codice appunto che stiamo parlando di variabili che hanno senso solamente all'interno del ciclo e non al di fuori di esso.  

  Una possibile inizializzazione potrebbe essere la seguente: 

  ```php
   $i = 0;
  ```

  Il nostro ciclo dunque partità con la variabile $i a 0.
* **CONDIZIONE** 

  Affinchè il ciclo possa proseguire a ripetere le istruzioni contenute al suo interno, è necessario che la condizione
  che impostiamo come seconda istruzione del ciclo sia vera.
  Nel momento in cui questa condizione diventasse falsa, il ciclo smetterebbe di ripetere le istruzioni e il flusso del programma 
  ripartirebbe dall'istruzione successivo al ciclo (dopo la parentesi } di chiusura del for).
  Essendo una condizione, essa risulta in un valore vero o falso. Come per ogni altra condizione, valgono le regole della logica booleana, 
  quindi tutte le operazioni che potremmo fare all'interno di un if valgono anche qui (ad esempio comporre più variabili insieme con OR o AND). 

* **INCREMENTO** 

  Questa è l'ultima istruzione da inserire in un ciclo for e serve per incrementare la variabile di ciclo. Senza questa istruzione, il ciclo potrebbe avere 
  durata infinita nel caso in cui la condizione iniziale dovesse risultare vera. 
  Questa istruzione è necessaria per poter portare a termine il ciclo, e determina il "passo" del ciclo, ovvero il modo in cui varia la variabile di ciclo, 
  responsabile delle iterazioni del ciclo.

Facciamo un rapido esempio per comprendere come funzionano queste 3 istruzioni insieme:

```php
for ($i = 0; $i < 5; $i = $i + 1) {
  //echo "Variabile di Ciclo: $i<br>";
  echo "Ciao";
}
  ```
In questo caso vogliamo eseguire 5 volte l'istruzione echo 'Ciao';
- Inizializziamo la variabile $i al valore 0 (Viene fatta solo una volta!!!)
- Testiamo la condizione: `$i < 5` => 0 è minore di 5 quindi è VERA. Proseguiamo
- Eseguiamo le istruzioni all'interno del ciclo => echo 'Ciao'; => Stampa "Ciao" sullo schermo.
- Eseguiamo l'istruzione di incremento => $i = $i + 1 => $i = 0 + 1 => $i = 1;
- Testiamo la condizione: $i < 5 => 1 è minore di 5 quindi è VERA. Proseguiamo
- Eseguiamo le istruzioni all'interno del ciclo => echo 'Ciao'; => Stampa "Ciao" sullo schermo.
- Eseguiamo l'istruzione di incremento => $i = $i + 1 => $i = 1 + 1 => $i = 2;
- Testiamo la condizione: $i < 5 => 2 è minore di 5 quindi è VERA. Proseguiamo
- Eseguiamo le istruzioni all'interno del ciclo => echo 'Ciao'; => Stampa "Ciao" sullo schermo.
- Eseguiamo l'istruzione di incremento => $i = $i + 1 => $i = 2 + 1 => $i = 3;
- Testiamo la condizione: $i < 5 => 3 è minore di 5 quindi è VERA. Proseguiamo
- Eseguiamo le istruzioni all'interno del ciclo => echo 'Ciao'; => Stampa "Ciao" sullo schermo.
- Eseguiamo l'istruzione di incremento => $i = $i + 1 => $i = 3 + 1 => $i = 4;
- Testiamo la condizione: $i < 5 => 4 è minore di 5 quindi è VERA. Proseguiamo
- Eseguiamo le istruzioni all'interno del ciclo => echo 'Ciao'; => Stampa "Ciao" sullo schermo.
- Eseguiamo l'istruzione di incremento => $i = $i + 1 => $i = 4 + 1 => $i = 5;
- Testiamo la condizione: $i < 5 => 5 NON è minore di 5 quindi è FALSE. STOP!

Come potete notare, il ciclo esegue le operazioni in esso contenuto 5 volte, ovvero lo stesso
numero che compare nella condizione. E' bene notare che la condizione di uscita è che $i
deve essere STRETTAMENTE minore di 5, ovvero nel momento in cui $i vale 5 il ciclo si arresta. 

In questo modo, imponendo che la condizione sia minore STRETTO, sappiamo che mettendo un 
numero N qualsiasi nella condizione e PARTENDO DA ZERO ($i = 0) il ciclo ripeterà N volte le
istruzioni in esso contenute.

La lista di operazioni sopra descritta può essere un utile strumento per comprendere come 
funziona internamente un ciclo for. Se non vi è chiaro ancora il funzionamento del ciclo 
vi consiglio di provare a replicare la struttura appena descritta anche su altri cicli, 
fino a quando non dovesse essere più chiaro il suo funzionamento. 

Nulla vieta all'interno del ciclo di utilizzare il valore della variabile $i, e anzi questo 
è tipicamente quello che accade. Si può usare la variabile $i, crescente dal valore di inizializzazione 
a quello di fine delle condizione (5 nel caso precendente) ad esempio per stampare gli elementi
di un array posizionale, come nell'esempio qui sotto. 

```php
for ($i = 0; $i < count($giorniDellaSettimana); $i = $i + 1) {
  echo $giorniDellaSettimana[$i] . "<br>";
}
```

Per evitare di stampare elementi al di fuori dell'array si è utilizzata la funzione 
`count(<nome_variabile_array>)` che restituisce il numero di elementi dell'array. 
Sapendo che il primo elemento ha indice 0 e che il ciclo eseguirà la stampa un numero di volte
uguale alla dimensione dell'array, siamo sicuri di stampare tutti gli elementi dell'array 
e niente di più. 

```php
echo "Il ciclo è finito, ciao ciao!<br>";
```

### Iterare su oggetti e array: ciclo foreach

Il foreach è un altro tipo di ciclo, un po meno versatile del FOR ma molto più potente e comodo.
Ci permette di pensare all'array non in termini di indici e posizioni, ma come un insieme di elementi
che possiamo prendere separatamente e trattare come "oggetti" su cui svolgere certe azioni.
Per capire il suo funzionamento sarebbe utile cercare di tradurre il costrutto in Italiano.

```php
foreach(<nome_variabile_array> as <nome_elemento>) {
 <istruzione 1>
 <istruzione 2>
 <istruzione 3>
}
```

```php
perogni <elemento> dell'array <nome_variabile_array> eseguiamo il blocco di istruzioni
 <istruzione 1>, 
 <istruzione 2>, 
 <istruzione 3>,
```

Copiando il valore di `elemento` all'interno di una variabile che sarà disponibile 
nel ciclo con il nome di `nome_elemento`.

Questo ciclo può essere assimilato ad un generale Romano che passa in rassegna i suoi uomini.
- Per prima cosa li fa mettere tutti in una lunga fila.
- A quel punto si mette di fronte al primo e gli chiede un documento 
- Guardando il documento grida il suo nome: *"Ave, soldato di nome Tizio!"*. 
- Una volta fatto questo si sposta di fronte al successivo soldato, gli chiede il documento e di nuovo grida il suo nome: *"Ave, soldato di nome Caio!"*.
- E così via fino a quando non si sono più soldati.

A quel punto "esce dal ciclo" e continua con le sue operazioni quotidiane, ad esempio ordinare la carica sulla Città di Gerico.

Come tradurre questo insieme di operazioni usando i costrutti di PHP?

```php
$soldati = ["Tizio", "Caio", "Sempronio"]; // 1

foreach($soldati /* 2 */ as $soldato /* 3 */) {
  echo "Ave, soldato di nome $soldato!"; // 4
}
```

1. *"Mettiamo tutti i soldati in riga"*

    Inseriamoli i nomi dei soldati in un array posizionale
2. "Ci mettiamo di fronte ai soldati"

    Iniziamo un foreach, con l'obiettivo di prendere uno ad uno i nomi dei soldati per salutarli 

3. *"Chiede al soldato un documento"*

    Inseriamo il valore dell'elemento corrente (quello a cui siamo di fronte) 
    all'interno di una variabile a cui potremo fare riferimento all'interno del ciclo.  

4. *"Grida il suo nome"*

    Una volta che sappiamo come si chiama il soldato, non dobbiamo fare 
    altro che stampare il suo nome, eseguiamo dunque echo dandogli come 
    parametro appunto la variabile che contiene il nome dell'elemento corrente, 
    ovvero il soldato che abbiamo davanti. 

Utilizzando `foreach` al posto di `for` possiamo dimenticarci di usare count 
dovendoci sincerare di stampare solamente elementi al di fuori dell'array 
stesso, in quanto `foreach` si occupa internamente di renderci disponibili 
solamente gli elementi presenti nell'array.

Nel caso avessimo bisogno di avere accesso anche all'indice o chiave dell'elemento, 
possiamo usare un'altra sintassi di `foreach`. 

```php
foreach ($giorniDellaSettimana as $i => $giorno) {
  echo "$i => $giorno <br>";
}
```

In questo caso utilizzando questo costrutto `$i => $giorni` rendiamo disponibili 
all'interno del ciclo sia il valore dell'elemento (all'interno della variabile `$giorno`) 
che la sua chiave all'interno dell'array (essendo un array posizionale, la chiave 
di ogni elemento è appunto la sua posizione all'interno dell'array.

### Array Associativi 

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

### Modo *corretto* di dividere PHP e HTML nei propri file .php

```php
<?php

// Qui definiamo sia la logica che i dati
$utente = [
  "nome" => "Nome",
  "cognome" => "Cognome",
  "eta" => "Età",
];

?>

<html>
<head>
    <title>Cicli For & Array</title>
</head>
<body>
    <h1>Cicli For & Array</h1>
    <ul>
    <!-- 
      Modo CORRETTO di dividere PHP e HTML all'interno del vostro file PHP 
      Cercate il più possibile di limitare l'uso di istruzioni PHP nel vostro HTML.
    -->
    <?php foreach($utente as $chiave => $valore) { ?>
        <li>
            <b><?=$chiave?>:</b> <?=$valore?>
        </li>
    <?php } ?>
    </ul>
</body>
</html>
```
