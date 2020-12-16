# Funzioni

Una funzione è un blocco di codice a cui si associa un nome e una serie di *parametri*. 


Una funzione non è altro che la descrizione in termini di una sequenza di comandi di una certa funzionalità (da cui il nome).

Questa funzionalità può aver bisogno di qualche **dato in ingresso** e può restituire dei **valori in uscita**. 
In questo modo possiamo delegare ad una funzione una certa operazione complessa da eseguire e salvare solamente il valore di uscita in una variabile che poi andremo ad usare successivamente nel codice.

I *parametri* della funzione sono i nomi delle variabili che si utilizzano all'interno del
corpo della funzione per fare riferimento ai *valori di input* che inseriamo
nella funzione quando quest'ultima viene chiamata.

Si può pensare ad una funzione come ad una macchina industriale in cui ENTRANO delle materie prime (ad esempio la base di una pizza) e al suo interno 
alcuni meccanismi inseriscono oggetti e applicano lavorazioni tali per cui in USCITA abbiamo un prodotto lavorato (ad esempio la pizza cotta con tutti gli ingredienti scelti).

In questo caso i "parametri" in INGRESSO sono la base della pizza e l'ordinazione mentre in USCITA abbiamo la pizza completa che ha subito la lavorazione della macchina. 

Nell'esempio riportato in seguito, in base all'età, al titolo e al nome di una persona, la funzione ritorna una variabile di tipo stringa con l'esito della nostra "autenticazione" di base: può entrare o non può entrare.

Il valore di ritorno della funzione può essere salvato in una variabile per un'utilizzo futuro
oppure può essere usato come valore da stampare o ancora come valore di ingresso per un'altra funzione.

Per DEFINIRE una funzione bisogna usare il comando `function`, seguito dal NOME della funzione e dalla lista dei suoi PARAMETRI. 

E' da notare che definire una funzione **non** significa eseguire il codice contenuto al suo interno, ma semplicemente associare al NOME della funzione il blocco di codice. 
In questo modo solo conoscendo il nome della funzione sarà possibile richiamare la funzionalità che essa descrive in altri punti del nostro programma. 


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

Richiamando `echo` dandogli come argomento la chiamata di funzione, quello che accade è che il valore (eventuale) di ritorno della funzione `controlloIngresso` viene passato direttamente al comando `echo` il quale si occuperà 
di stamparlo sulla pagina. 

Al comando `echo`, in aggiunta, viene passata una stringa concatenata formata dal valore di ritorno di controlloIngresso e dalla stringa `<br>`. Il risultato della concatenazione viene passato ad echo
che successivamente lo stamperà nel file che verrà visualizzato dal browser. 


```php
echo controlloIngresso(12, "mrs", "Paola") . "<br>";
```
`
