## Variabili

In PHP una *variabile* è un **contenitore** a cui associamo un **nome**. 

All'interno di una *variabile* (e quindi del suo corrispondente **contenitore**) possiamo inserire dei **valori**. Ogni variabile è caratterizzata dal **tipo** di valore che possiamo inserire al suo interno. 

E' possibile vedere questo procedimento di inserimento di valore all'interno di una variabile come un metodo per rappresentare delle **informazioni** in modo che siano utilizzabili e comprensibili anche ad un computer. 

Ad esempio, per rappresentare un testo si usa un tipo di variabile chiamato **stringa**. 

Per rappresentare un numero, invece, si usa il tipo **intero**. 

Se volessimo definire una *lista* di elementi, si dovrebbe usare il tipo **array**.

*Programmare un computer* significa operare, utilizzando le istruzioni che esso può comprendere, su **informazioni** contenute all'interno di variabili e salvare i risultati all'interno di altre variabili per renderle disponibili agli utilizzatori finali o ad altri programmi.

Possiamo inoltre dire che la *variabile* è il blocco fondamentale di elaborazioni di un computer. 

Ogni linguaggio di programmazione prevede un modo di inserire, valorizzare e modificare variabili. 

### Definizione delle variabili

In PHP per *definire* una variabile si usa il `$` unitamente al nome che si intende dare alla variabile stessa.

Dal momento che una variabile non è altro che una *scatola* con un'*etichetta*, per identificare una variabile sarà sufficiente fare riferimento al suo **nome**. 

Il nome che diamo ad una variabile, quindi, è molto importante, in quanto sarà il modo con cui, all'interno del programma, saremo in grado di fare riferimento al suo contenuto. 

E' fondamentale, dunque, assicurarsi che il *nome* che diamo alle nostre variabili sia *semanticamente corretto*, ovvero che descriva nel modo più chiaro possibile  l'utilizzo che si intende farne. 

Per **assegnare** un valore ad una variabile si usa l'operatore `=` seguito dal valore che si intende dare alla variabile. 

In PHP ogni testo inserito all'interno degli *apici* doppi o singoli (quindi `'` oppure `"`) è considerato una **stringa**. 

Ad esempio per creare una variabile di tipo *stringa* bisogna inserire il valore della stessa all'interno di apici doppi o singoli; 

```php
$stringa = "Valore string in apici doppi";
$altra_stringa = 'Valore string in apici singoli';
```

Per definire un intero invece di usa la seguente sintassi:
```php
$intero = 1;
```

E' possibile definire anche variabili di tipo *float* (numeri con la virgola), *booleano* (vero/false, in inglese *true/false*), o *null*. 
```php
$numero_virgola = 1.2;
$vero = true;
$variabile = null; // Questa variabile non fa nulla
```

### Stampare il contenuto delle variabili

Per stampare (o comunque utilizzare) il valore contenuto in una variabile, bisogna fare fare riferimento al suo nome all'interno di una espressione o come parametro di una istruzione. 

Quando il nome della variabile si trova *prima* del simbolo `=`, allora siamo nella fase di **definizione** del valore, quando si trova alla *destra* dell'`=` oppure all'interno di un'espressione o istruzione siamo nella fase di **uso** del valore. 

In questa seconda fase, il nome della variabile fa riferimento al suo valore. 

```php
echo "Intero: " . $intero  . "<br>";
echo $numero_virgola . "<br>";
echo $vero . "<br>";
echo $stringa . "<br>";
echo $altra_stringa . "<br>";
echo $variabile . "<br>";
```

### Operazioni con le variabili

Definiamo alcune variabili e inseriamo dei valori per poter *operare* su di essi.

```php
$nome = "Nome Cognome";

$eta = 25;

$primo = 1.0;
$secondo = 2.0;
```

Operazioni che possiamo fare con le variabili di tipo intero e float:
```php
$somma = $primo + $secondo;
$differenza = $primo - $secondo;
$prodotto = $primo * $secondo;
$divisione = ($primo / $secondo);
$modulo = $primo % $secondo;

$terzo = 5;
```

Ordine di esecuzione delle operazioni all'interno calcoli "complessi". 
NB: tutto quello che è all'interno delle parentesi viene eseguito prima del resto

```php
$operazione = ($primo + $secondo) * $terzo;

echo "Somma: $somma <br>";
echo "Differenza: $differenza <br>";
echo "Prodotto: $prodotto <br>";
echo "Divisione: $divisione <br>";
echo "Modulo: $modulo <br>";
echo "Operazione: $operazione <br>";
// echo "vedete che non stampa!!";
```

Variabili di tipo booleano o logico il cui valore può essere solamente true o false NON la stringa "true" o "false"!  

```php
$vero = true;
$falso = false;

AND && => e logico
OR  || => o logico
NOT !  => not logico

```
### Operazioni logiche con i booleani

```php
$and = $vero && $falso; // F
$or = $vero || $falso;  // V
$not_vero = !$vero;     // F
$not_falso = !$falso;   // V
```

### Tabelle di Verità per i Booleani 

```php
$a = F ("Oggi piove")
$b = V ("Oggi ho fatto un ciocco")

$a AND $b = F
$a OR $b = V
NOT $b = F
NOT $a = V
```

| $a | $b | $a AND $b | $a OR $b  |
|---|---|---|---|
| V |  V | V | V |
| V |  F | F | V |
| F |  V | F | V |
| F |  F | F | F |
