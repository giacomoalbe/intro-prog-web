# Basi di PHP

## Storia

PHP (**P**HP **H**ypertext **P**reprocessor) è un linguaggio di programmazione nato nel 1995 con lo scopo iniziale di rendere dinamiche le pagine visualizzabili da un browser web. 

Inizialmente, il *browser* era semplicemente un programma in grado di visualizzare il testo contenuto all'interno di un documento HTML, formattandolo secondole regole dettate dai *tag HTML*. 

Questo testo, opportunamente formattato e mostrato sullo schermo, era **statico**, ovvero il suo contenuto era sempre lo stesso, indipendentemente da chi lo visualizzava, quando o da quale piattaforma. 

Dall'esigenza di mostrare testo *diverso* in base ai parametri sopra citati (chi, come, quando e da dove) è nato il **PHP**, ovvero un linguaggio in grado di produrre **output** HTML *dinamico* in base ad un certo numero di *parametri* esterni.

## Meccanismo Client/Server 

Su *Internet*, ogni sito, pagina o applicazione è chiamato **risorsa**. 

Una *risorsa* è un documento HTML che risiede su di un server collegato alla rete Internet.

Con *server* si intende un computer connesso ad una rete in grado di accettare a delle *richieste* provenienti dalla rete e *rispondere* in maniera opportuna. 

Ogni server è contraddistinto da un suo *indirizzo IP*, che identifica in modo univoco quel server all'interno della rete. 

L'applicazione delegata a richiedere una *risorsa* è chiamata *client*. Il *client* non identifica una particolare applicazione, bensì rappresenta semplicemente chiunque faccia partire una richiesta. 
Esempi di client sono il browser, le applicazioni mobili  o desktop che usano Internet (*Facebook, Spotify, ecc*), programmi di messaggistica (*Telegram, Whatsapp*), ecc.

Sebbene i concetti di **client** e **server** siano generici e non obblighino ad utilizzare un particolare formato di file per lo scambio di informazioni, quando si parla di Internet e di PHP insieme, quello che viene scambiato tra le parti è rappresentato da file HTML visualizzabili da un browser.

Quindi ad ogni richiesta del client, il server web risponderà con un documento HTML che verrà visualizzato all'interno di un browser.

Il funzionamento (di base) dell'*Internet dinamico* può essere così riassunto:

* *client* e *server* sono collegati ad Internet e hanno un loro indirizzo IP identificativo
* Il *client* richiede una particolare *risorsa*, contraddistinta da un *nome* e da un indirizzo del *server* su cui si trova la risorsa. 
* Il *server* riceve la richiesta e prepara la risorsa corrispondente. Se è un file HTML semplice, lo preleva dal suo disco fisso e lo prepara per l'invio. In caso la risorsa fosse un file `php`, la procedura è leggermente diversa ed è descritta nel prossimo capitolo.
* Il *server* invia il file HTML sulla rete indirizzandolo al *client* che ha fatto partire la richiesta. 
* Il *client* riceve il file e lo mostra a schermo. 

## Gestione Risorse PHP 

Il *browser web* è in grado di visualizzare solamente file HTML. 

Quando richiediamo una risorsa `php`, ovvero una risorsa *dinamica*, il server web, invece di restituire direttamente il contenuto del file, **esegue** le istruzioni contenute in esso e invia come risposta al client il file HTML generato dall'esecuzione del file `php`.

Il PHP è un linguaggio di programmazione. 

Come ogni linguaggio, è formato da *parole* che permettono di costruire *frasi*.

Le *frasi* sono chiamate **istruzioni** e rappresentano azioni che possiamo far eseguire al computer. 
Mettendo insieme più istruzioni, è possibile far eseguire al computer operazioni complesse, come collegarsi ad un database, richiedergli dei dati, eseguire qualche elaborazione sui dati (ordinarli, modificarli, estenderli) e mostrarli. 

Quando un server riceve una richiesta per una *risorsa php*, il contenuto del file `php` viene passato ad un programma all'interno del server chiamato **interprete php** che esegue le istruzioni contenute nel file e ritorna al server web un file HTML contente il risultato dell'elaborazione di quel file PHP.  

Questo file HTML sarà spedito al client e quindi visualizzato all'interno del browser. 

L'**interprete php** è quindi responsabile di *interpretare* le istruzioni contenute in un file `php` e produrre un output HTML. 

Data la presenza di un *interprete*, si dice che `php` è un linguaggio **interpretato**, ovvero che il codice viene eseguito dall'interprete ogni volta che viene richiesta la risorsa, senza passare attraverso alcuno statio di compilazione. 

## Modo *corretto* di dividere PHP e HTML nei propri file .php

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

## Convenzioni & Best Practicies

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
che abbiamo usato per aprirlo, ma al contrario.

### Andare a capo in HTML
`<br>` è il tag HTML che serve ad indicare al browser che vogliamo andare a capo.
Noi lo usiamo per rendere più leggibile il risultato che vediamo a schermo.

### Convenzioni per la scrittura di variabili e nomi di funzioni e classi.

Non è obbligatorio sceglierne una in particolare, quello che è fortemente consigliato e decisamente necessario è sceglierne UNA e UNA SOLA all'interno di un progetto e utilizzarla PER OGNI variabile o funzione che si crea. 

Altro consiglio utile: perdete pure del tempo a dare dei nomi significativi a variabili e funzioni.

*Ricordate: un nome ben dato è meglio di una riga di commento!* cit. il saggio programmatore sulla roccia.

- *CamelCase*
  - ciaoComeAndiamo 
  - giorniDellaSettimana

- *PascalCase*
  - CiaoComeAndiamo
  - GiorniDellaSettimana

- *SnakeCase*
  - ciao_come_andiamo
  - giorni_della_settimana

- *KebabCase*
  - ciao-come-andiamo
  - giorni-della-settimana

- *AdMinchiamCase*
  - gioRNi_Della_sett
  - gds
  - ccc
  - a

