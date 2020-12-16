## Istruzioni condizionali

Si definisce **flusso** di un programma l'insieme ordinato delle istruzioni che lo compongono. 

Di norma, un programma parte dalla prima istruzione che trova nel file `php` e procede, dall'alto verso il basso, fino all'ultima. 

A volte si ha la necessità di modificare il flusso del programma. In particolare, potrebbe risultare necessario decidere di eseguire una parte di codice piuttosto di un'altra sulla base di un calcolo o del valore di una variabile. 

Per fare questo, occorre introdurre il concetto di **selezione** o di **istruzione condizionale**. 

In PHP è possibile decidere di eseguire un certo gruppo di istruzioni sulla base di alcune *condizioni*. 

Una *condizione* è un'espressione contenente variabili e operatori che può essere ricondotta ad un valore di *verità* o *falsità* (true/false). 

Le condizioni che il PHP riesce a valutare sono **SEMPRE** di tipo booleano.

Per definire una istruzione condizionale si usa la sintassi

```php
if (condizione) {
  /*
  Blocco di istruzioni
  eseguito se condizione == true
  */
} else {
  /*
  Blocco di istruzioni
  eseguito se condizione == false
  */
}
```

Sulla base del valore (true/false) della condizione, verrà eseguito il primo *ramo* (quello nel blocco dopo l'if) o il secondo, se presente (quello nel blocco dopo l'else).

Di seguito un esempio di una doppia istruzione condizionale annidiata:

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
`

