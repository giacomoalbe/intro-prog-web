# Array Associativi

Svolgere i seguenti esercizi inserendo il codice nel corrispondente file PHP all'interno della cartella `htdocs` presente nella root della propria installazione di Xampp.

## Esercizi

1. Creare un array posizionale contenente 3 valori numerici e stampare il primo elemento

2. Creare un array posizionale di stringhe, stampare il primo elemento, aggiungere un nuovo elemento
   e stamparlo
3. Creare un array di stringhe, aggiungere 3 elementi, cancellare i nuovi elementi usando i loro indici
   e stampare la lunghezza dell'array in un tag H1
4. Usando un ciclo for, stampare 10 volta la frase "Mi piace programmare"
4.1 Autoconvinciti del fatto che ti piaccia programmare. In alternativa, manda il CV a McDonald's
5. Usa un ciclo for stampare i numeri fino a 100, ognuno su una riga diversa
6. Crea un array vuoto e, usando un ciclo for, aggiungi ad essi i primi 20 numeri
7. Crea un array di 4 elementi stringa, quindi usando un ciclo for e la funzione count stampa ognuno dei suoi elementi su una riga diversa
8. Crea una funzione che prenda in input un array e ne stampi il contenuto usando un ciclo for
9. Crea un array vuoto, usa un ciclo for per riempirlo con i primi 20 numeri e successivamente usa un ciclo foreach per stampare i suoi elementi, mostrando sia indice che valore
10. Crea un array associativo che rappresenti un'automobile. Aggiungi i campi marca, modello, colore, cilindrata, targa e proprietario e quindi stampa sia chiavi che valori usando un ciclo foreach


11.  Creare un array posizionale (una "lista") di utenti.
Ogni utente deve essere rappresentato da un array associativo contenente i seguenti campi: nome, cognome, eta, email, corso e media.
Creare una prima funzione che prenda come input un utente (come precedentemente definito) e stampi a schermo ogni campo su una riga
diversa indicando anche di che campo si tratta (ad esempio: "Nome: Giacomo, Cognome: Alberini, ecc).
Creare dunque un'altra funzione che prenda come oggetto una lista di utenti (quindi un array posizionale di array associativi)
e stampi ogni elemento della lista applicando la funzione precendentemente creata ad ogni elemento.
  <br>
  [BONUS] Strutturare i dati stampando anche HTML per mettere in risalto ad esempio per ogni utente il nome del campo che si sta stampando
  (quindi Nome: e Cognome: per esempio potrebbero essere in grassetto o in un altro colore)

1. Creare una form che permetta di inserire i campi relativi ad ogni utente dell'esercizio precedente (nome, cognome, età, email, corso e media). Inviando questa form il nuovo utente deve venire visualizzato sullo schermo, indicando nella stampa la chiave in "grassetto" e il valore in testo normale.

1. Partendo dall'esercizio precedente, creare una pagina che mostri una lista di utenti in una tabella. Attraverso il pulsante "Nuovo Utente" si accede alla form che permette di creare un utente. Una volta inviata la form, si viene rimandati alla pagina precedente. Qui viene creato un utente (usando l'array associativo) e viene aggiunto alla lista, che poi viene mostrata.

1. Partendo dall'esercizio precedente, ogni volta che si aggiunge un utente salvare su un file JSON il contenuto della lista. La pagina contenente la lista degli utenti, quindi, come prima cosa dovrà aprire il file, leggerne il contenuto, trasformarlo in una lista di utenti e mostrare gli utenti. Verificare che, ricaricando la pagina della lista utenti, l'utente appena creato risulti sempre presente.
