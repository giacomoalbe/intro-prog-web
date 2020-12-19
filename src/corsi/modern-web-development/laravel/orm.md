# ORM

## Introduzione

Laravel è un framework PHP di tipo MVC (Model, View, Controller) che mette a disposizione una miriade di strumenti che aiutano i programmatori a svilppare più velocemente un app.  
Uno di questi strumenti è l'ORM che permette la gestione e la mappatura tra le classi in PHP e i DB relazionali.

Un ORM, letteralmente _Object-Relational Mapping_ è un interfaccia che fornisce tramite programmazione ad oggetti tutti i servizi inerenti alla persistenza dei dati , ciò significa che possiamo gestire le entità e le relazioni di un DBMS tramite PHP in modo agevolo scrivendo poche righe di codice, avendo una portabilità superiore e scrivendo un'applicazione più stratificata per quanto riguarda la persistenza dati a vantaggio della modularità del sistema.

Un ORM, dunque, è un'astrazione che ci permette di accedere al database da PHP attraverso classi & oggetti, quindi _parlando_ la lingua dello sviluppatore e non quella del motore di database (SQL solitamente). 

L'ORM usato in Laravel è chiamato **Eloquent** e viene rappresentato all'interno dei modelli nel seguente modo:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    use HasFactory;
}
```

## Creare un Model

Per creare un model basta utilizzare il comando

```bash
php artisan make:model <NomeModello>
```

E' necessario però prestare attenzione ad alcune regole nella scelta del nome:
* Il nome deve essere uguale alla migrazione a cui fa riferimento
* Il nome deve essere al singolare
* Il nome deve avere la prima lettera maiuscola, se composto da più parole dovranno essere unite e entrambe le iniziali dovranno essere maiuscole

quindi per esempio se precedentemente ho creato una migrazione in questo modo:

```bash
php artisan make:migration create_student_infos_table
```

il comando per creare il suo modello sarà

```bash
php artisan make:model StudentInfo
```

## Creare righe usando i Model

E' possibile aggiungere righe ad una tabella direttamente da Laravel.  
Per farlo è necessario utilizzare `tinker`, una console PHP in cui è possibile _sperimentare_ ed eseguire codice senza doverlo scrivere nei file sorgente.  

`tinker` è raggiungibile da terminale digitando:
```bash
php artisan make:model tinker
```

Fattp questo è necessario prima importare il modello che ci serve quindi prendendo come riferimento l'esempio qui sopra scriviamo:
```php
use app\Models\StudentInfo
```

Quindi possiamo inserire i nostri campi all'interno della tabella.  
Le istruzioni PHP da eseguire saranno le seguenti:

```php
// Creo un nuovo modello come istanza della classe StudentInfo
$student = new StudentInfo();

// Popolo le sue proprietà, corrispondenti alle colonne della tabella presente nel database
$student->surname = "cognome studente";
$student->cf = "cf studente";
$student->name = "nome studente";

// IMPORTANTE: salvo il modello, ovvero eseguo la query SQL che andrà ad inserire effettivamente la riga nel database
$student->save();
```

## Query SQL con i Model

TODO: come ottenere tutti gli elementi di una tabella, come fare query con where, come trovare velocemente righe dall'id

Per eseguire le query più comuni con _Eloquent_ è possibile operare in questo modo, sia su `tinker` che nel codice sorgente (dentro ai metodi dei Controller, ad esempio):

* `User::all()` oppure `User::get()`:

    Con questi comandi è possibile ottenere la lista delle righe presenti nella tabella associata con il modello `User` (di norma `users`)

* `User::where("column", "value")`

    Con questo comando è possibile eseguire una query `where` e trovare tutti le righe della tabella `users` che abbiano come valore della colonna `column` la stringa `value`. 

    > La query qui mostrata **non** ritorna i dati, ma solamente il `QueryBuilder`, ovvero l'oggetto che rappresenta la query, quindi la richiesta.  
    > Per ottenere i dati a partire dal un `QueryBuilder` si possono usare due metodi:
    > * $query->get() 
    >
    >   per ottenere un array dei risultati (anche se ce ne fosse uno solo, l'oggetto _contenitore_ sarebbe comunque un array)
    > * $query->first() 
    >
    >   per ottenere il primo elemento corrispondente alla query (anche se ce ne fossero più di uno verrebbe ritornato solamente il primo) 

* `User::find(id)` oppure `User::where('id', id)->first()`:

    In questo modo è possibile trovare l'elemento della tabella `users` con l'id uguale a `id`.  
    Dato che solitamente la colonna id è univoca, è preferibile usare la prima scrittura in quanto più immediata.  
    Se invece è necessario affinare la ricerca ulteriormente e utilizzare altri `where` o altri costrutti in genere, è preferibile la seconda, in quanto molto più _flessibile_.



## Eager Loading con With

TODO: come creare relazioni tra modelli e come "precaricare" queste relazioni quando si usano le query
