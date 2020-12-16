# Database

Svolgere i seguenti esercizi inserendo il codice nel corrispondente file PHP all'interno della cartella `htdocs` presente nella root della propria installazione di Xampp.

## Esercizi

1. Creare un sistema per l'inserimento di Corsi di Laurea. Ogni Corso di Laurea (che può essere abbreviato utilizzando l'inglese _degree_program_) deve avere i seguenti campi:
   * **ID**, numero progressivo che identifica il Corso di Laurea nel database
   * **Denominazione**, ovvero il nome con cui si identifica normalmente il Corso di Laurea (es. Ingegneria Elettronica"
   * **Area Tematica**, una sigla di 3 lettere che identifica l'area tematica del Corso di Larea (ING, DES, LET, MAT, FIS, ecc)
   * **Durata**, in anni del Corso
   * **Numero di Esami** del Corso

   Sarà necessario creare un database, un utente (non root) per accedere al database, la tabelle per contenere i dati, una pagina di benvenuto e una pagina di inserimento dei Corsi di Laurea che possa svolgere i seguenti compiti:
   * Permetta di compilare i campi sopracitati
   * Controlli che tutti i campi siano stati inseriti
   * Inserisca nella tabella corrispondente il corso di laurea appena inserito
   * Una volta inserito, mostri all'utente una schermata di successo da cui sarà possibile tornare alla schermata principale
 L'**Area Tematica** e la **durata** del Corso devono poter essere scelti usando una select (menu a tendina) o in alternativa una serie di radio button.

   Dalla pagina di benvenuto sarà possibile accedere alla pagina di creazione del Corso attraverso un link.

   Sarebbe meglio dividere la logica di creazione del Database (_seed_ & _migrazione_ del database) dalla logica di inserimento dei Corsi di Laurea.
