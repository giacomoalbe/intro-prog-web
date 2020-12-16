# Capitolo 1
## Primi comandi con PHP

### Commento su una riga
```php
// Commento su una riga
# Altro modo per creare un commento su una riga
```

### Commento multi riga

 Utile quando si vuole ad esempio fare in modo che una parte
di codice non venga eseguita oppure si vuole spiegare in modo più
accurato il funzionamento di un pezzo di codice, ad esempio di una funzione.
```php
/* 
Commento 
su 
più 
righe
*/
```


Per chiudere il blocco che vogliamo commentare usiamo la stessa combinazione
che abbiamo usato per aprirlo, ma al contrario. Vedi riga successiva.

### Variabili

```php
$intero = 1;
$numero_virgola = 1.2;
$vero = true;
$stringa = "'ciao mondo'";
$altra_stringa = '"ciao"';
$variabile = null; // Questa variabile non fa nulla
```


### Andare a capo in HTML
`<br>` è il tag HTML che serve ad indicare al browser che vogliamo andare a capo.
Noi lo usiamo per rendere più leggibile il risultato che vediamo a schermo.

### Stampare contenuto delle variabili
```php
echo "Intero: " . $intero  . "<br>";
echo $numero_virgola . "<br>";
echo $vero . "<br>";
echo $stringa . "<br>";
echo $altra_stringa . "<br>";
echo $variabile . "<br>";
```

### Operazioni con le variabili

Questo è il nome da visualizzare
```php
$nome = "Nome Cognome";
```


Questa è l'eta della persona ed alcune altre variabili:
```php
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
```

// echo "vedete che non stampa!!";

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


### Istruzioni condizionali

Istruzioni condizionali, per deviare il flusso di esecuzione del programma. 
Le condizioni che il PHP riesce a valutare sono SEMPRE di tipo booleano, quindi restituiscono una opzione binaria (true/false)
Che fa eseguire il primo "ramo" (quello nel blocco dopo l'if) o il secondo, se presente (quello nel blocco dopo l'else).

Di seguito un esempio di una doppia istruzione condizionale annidata:

```php
$eta = 45;
$titolo = "mr";  //oppure mrs

if ($eta >= 18) {
    // Può entrare
    if ($titolo == "mr") {
        echo "Signor $nome lei può entrare";
    } else {
        echo "Signora $nome lei può entrare";
    }
} else {
    // Non può entrare
    if ($titolo == "mr") {
        echo "Signor $nome lei NON può entrare";
    } else {
        echo "Signora $nome lei NON può entrare";
    }
}
```

```php
$numero = 4;

if ($numero > 20) {
    echo "Maggiore di 20";
} else if ($numero > 10) {
    echo "Maggiore di 10 MA minore di 20";
} else {
    echo "Ne maggiore di 10 ne di 20";
}
```

### Funzioni

Una funzione è un blocco di codice a cui si associa un nome e una serie di "parametri" che si vanno ad utilizzare nel corpo della funzione (quello delimitato dalle {}).
Una funzione non è altro che la descrizione in termini di una sequenza di comandi di una certa funzionalità (da cui il nome).

Questa funzionalità può aver bisogno di qualche **dato in ingresso** e può restituire dei **valori in uscita**. 
In questo modo possiamo delegare ad una funzione una certa operazione complessa da eseguire e salvare solamente il valore di uscita in una variabile che poi andremo ad usare successivamente nel codice.

Si può pensare ad una funzione come ad una macchina industriale in cui ENTRANO delle materie prime (ad esempio la base di una pizza) e al suo interno 
alcuni meccanismi inseriscono oggetti e applicano lavorazioni tali per cui in USCITA abbiamo un prodotto lavorato (ad esempio la pizza cotta con tutti gli ingredienti scelti).

In questo caso i "parametri" in INGRESSO sono la base della pizza e l'ordinazione mentre in USCITA abbiamo la pizza completa che ha subito la lavorazione della macchina. 

Nell'esempio riportato in seguito, la funzione in base all'età, al titolo e al nome di una persona, ritorna una variabile di tipo stringa con l'esito della nostra "autenticazione" di base: può entrare o non può entrare.  Il valore di ritorno della funzione può essere salvato in una variabile per un'utilizzo futuro
oppure puà essere usato come valore da stampare o ancora come valore di ingresso per un'altra funzione.

Per DEFINIRE una funzione bisogna usare il comando `function`, seguito dal NOME della funzione e dalla lista dei suoi PARAMETRI. 

E' da notare che definire una funzione **non** significa eseguire il codice contenuto al suo interno, ma semplicemente associare al NOME della funzione il blocco di codice. 
In questo modo solo conoscendo il nome della funzione sarà possibile richiamare la funzionalità che essa descrive in altri punto del nostro programma. 


```php
function controlloIngresso($eta, $titolo, $nome) {
    if ($titolo == 'mr' && $eta >= 18) {
        return "Signor $nome può entrare";
    } else if ($titolo == 'mr' && $eta < 18) {
        return "Signor $nome, non può entrare";
    } else if ($titolo == 'mrs' && $eta >= 18) {
        return "Signora $nome, può entrare";
    } else {
        return "Signora $nome, non può entrare";
    }
}
```

Per richiamare o ESEGUIRE una funzione è necessario scrivere il NOME della funzione seguito dalla lista dei valori di ingresso, che all'interno del blocco di codice che 
abbiamo definito prima, prenderanno i valori che abbiamo associato ai parametri di ingresso.

Ad esempio in questo caso il numero 25 sarà associato alla variabile $eta, "mr" a $titolo e "Giacomo" a $nome.

```php
echo controlloIngresso(25, "mr", "Giacomo") . "<br>";
```

Richiamando `echo` dandogli come argomento la chiamata di funzione, quello che accade è che il valore (eventuale) di ritorno della funzione `controlloIngresso` viene passato direttamente al comando echo il quale si occuperà 
di stamparlo sulla pagina. 

Al comando `echo`, in aggiunta, viene passata una stringa concatenata formata dal valore di ritorno di controlloIngresso e dalla stringa `<br>`. Il risultato della concatenazione viene passato ad echo
che successivamente lo stamperà nel file che verrà visualizzato dal browser. 


```php
echo controlloIngresso(12, "mrs", "Paola") . "<br>";
```
### Selezionare più condizioni diverse: switch

Il comando switch serve per eseguire un particolare pezzo di codice basandosi sul valore di una variabile. 
Questa variabile può essere di qualsiasi tipo anche non necessariamente un booleano.

L'istruzione switch, dunque, è un particolare tipo di selezione che non valuta una condizione booleana (true/false) bensì confronta il valore di una variabile con quelli presenti nei suoi diversi "rami". 

Per definire un certo "ramo" dello swicth è necessario usare la sintassi del `case` che vediamo nell'esempio qui sotto.

Fondamentale: alla fine del blocco di codice successivo al case va inserito il comando break!

Nel momento in cui viene trovata corrispondenza tra il valore della variabile valutata dallo switch (in questo caso `$giornoDellaSettimana`) e uno dei suoi rami, viene eseguito il blocco di codice corrispondente al ramo e quindi l'esecuzione passa alla prima istruzione dopo lo switch. 
Nel caso si volesse eseguire del codice nel momento in cui non si trovasse corrispondenza con nessuno dei rami definiti, si puà introdurre un blocco default alla fine degli altri case. 

```php
$giornoDellaSettimana = "mercoledì";

switch ($giornoDellaSettimana) {
    case "lun":
        break;
    case "mar":
        break;
    case "mer":
        echo "E' mercoledì! Yeeeeeee!";
        break;
    case "gio":
        echo "E' giovedì!";
        break;
    case "ven":
        break;
    case "sab":
        break;
    case "dom":
        break;
    default:
        echo "Non capisco nulla, cit. la classe";
        break;
}
```
