# ORM

## Introduzione

Laravel è un framework PHP di tipo MVC (Model, View, Controller) che mette a disposizione una miriade di strumenti che aiutano i programmatori a svilppare più velocemente un app. Uno di questi strumenti è l'ORM che permette la gestione e la mappatura tra le classi in PHP e i DB relazionali.

Un ORM è un interfaccia che fornisce tramite programmazione ad oggetti tutti i servizi inerenti alla persistenza dei dati , ciò significa che possiamo gestire le entità e le relazioni di un DBMS tramite PHP in modo agevolo scrivendo poche righe di codice, avendo una portabilità superiore e scrivendo un'applicazione più stratificata per quanto riguarda la persistenza dati a vantaggio della modularità del sistema.


L'ORM usato in Laravel è chiamta **Eloquent** e viene rappresentato all'interno dei modelli nel seguente modo:

```
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

```
php artisan make:model <nome modello>
```

E' necessario però prestare attenzione ad alcune regole nella scelta del nome:
* Il nome deve essere uguale alla migrazione a cui fa riferimento
* Il nome deve essere al singolare
* Il nome deve avere la prima lettera maiuscola, se composto da più parole dovranno essere unite e entrambe le iniziali dovranno essere maiuscole

quindi per esempio se precedentemente ho creato una migrazione in questo modo:

```
php artisan make:migration create_student_infos_table
```
il comando per creare il suo modello sarà

```
php artisan make:model StudentInfo
```

## Creare righe usando i Model

TODO: usare il new Model(), aggiungere i campi e dare il save() per creare

E' possibile aggiungere i campi ad una tabella direttamente da laravel per farlo è necessario utilizzare tinker, per apirlo bisogna utilizzare il seguente comando:

```
php artisan make:model tinker
```

fatto questo è necessario prima importare il modello che ci serve quindi prendendo come riferimento l'esempio qui sopra scriviamo:

```
Use app\Models\StudentInfo
```

Fatto ciò possiamo inserire i nostri campi all'interno della tabella la struttura per farlo sarà simile a questa:

```
$Student = new StudentInfo();
        $Student->surname = "cognome studente";
        $Student->cf = "cf studente";
        $Student->name = "nome studente";
        
        $Student->save();
```

Ovviamente i codic


## Query SQL con i Model

TODO: come ottenere tutti gli elementi di una tabella, come fare query con where, come trovare velocemente righe dall'id

## Eager Loading con With

TODO: come creare relazioni tra modelli e come "precaricare" queste relazioni quando si usano le query
