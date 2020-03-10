# Basi di PHP

Svolgere i seguenti esercizi inserendo il codice nel corrispondente file PHP all'interno della cartella `htdocs` presente nella root della propria installazione di Xampp.

## Esercizi

1. Creare una form con nome e cognome e mandarla ad una pagina che saluti l'utente con la frase "Ciao, \<nome\> \<cognome\>".

1. Creare una form contente nome e una `select` con due valori - maschio e femmina - che mandi ad una pagina in cui, in base al valore della `select`, saluti l'utente con "Buongiorno, signor \<nome\>" oppure "Buongiorno, signora \<nome\>".

1. Creare una form con una `select` con i colori dell'arcobaleno che mandi ad una pagina in cui venga comunicato all'utente se il colore scelto è gradito al programmatore (ad esempio, "indaco" è il colore scelto, la pagina risponde con "Che schifo di colore", oppure con "E' il mio colore preferito, bravo!")

1. Modificare l'esercizio 2 aggiungendo il colore alla scritta: se femmina "rosa", se maschio "blu". Se si volesse essere più politicamente corretti, aggiungere un campo "altro" alla `select` e colorare la scritta di arcobaleno.

1. Creare una form con nome, cognome, sesso ed età. Inviando la form, si viene mandati su una pagina che saluta l'utente (differenziando in base al sesso), solo se l'utente è maggiorenne. Altrimenti comunica che l'utente non può entrare.

1. Modificare l'esercizio precedente utilizzando l'input `radio` per indicare se maggiorenne oppure no.

1. Creare una form con due campi di tipo numerico e mandare ad una pagina che fa somma, differeza, prodotto, divisione e modulo dei due numeri.

1. Creare una form con un campo numerico che rimandi ad una pagina in cui viene indicato se il numero è pari o dispari. Nel primo caso, mostrare il numero in verde, nel secondo in rosso.

1. Creare una form con un campo numerico che rimandi ad una pagina in cui viene indicato se il valore è inferiore a 10, tra 10 e 100, tra 100 e 1000 o maggiore di mille. Per ogni intervallo numerico scegliere un colore diverso con cui visualizzare la scritta.
  <br>
  <br>
  **Esempio:** inserisco 7, la pagina mi ritorna _7 è inferiore di 10_.
  <br>
  **Esempio:** inserisco 700, la pagina mi ritorna _700 è compreso tra 100 e 1000_

1. Creare una form per calcolare la rata mensile di un prestito. E' necessario inserire l'importo del prestito e il numero di anni in cui si vuole ripagarlo. Il tasso di interesse è del 5% se il rientro è inferiore ai 3 anni, 7% se tra 3 e 5, e 10% se sopra i 5 anni. L'interesse è calcolato, per semplicità, sull'intero ammontare del prestito, non sulle singole rate e una volta sola, non per ogni anno di rientro.
  <br>
  <br>
 **Esempio:** inserisco 10.000 € in 4 anni. La pagina dovrebbe ritornare 216,67 € / mese per 48 mesi.
