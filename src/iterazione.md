# Iterazione

## Ciclo For 

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

## Ciclo Foreach

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

```
perogni <elemento> dell'array <nome_variabile_array> eseguiamo 
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


