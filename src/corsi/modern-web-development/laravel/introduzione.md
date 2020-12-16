# Il Framework Laravel

## Concetti Generali

### Cos'è un framework?

Un framework è un'architettura logica di supporto sulla quale un software può essere progettato e realizzato.  
Esso facilita notevolmente il lavoro del developer poichè:
- Fornisce un'infrastuttura generale sulla quale viene poi definito il contenuto vero e proprio dell'applicazione.
- Inoltre permette di risparmiare facilmente la riscrittura di codice già scritto in precedenza per compiti simili.

Esso permette di estendere le funzionalità del linguaggio di programmazione su cui è basato.  
I **componenti principali** di un framework sono costituiti da **classi** collegate tra loro, a cui vengono assegnati dei **metodi**; tali metodi possono essere **statici**, ovvero immutabili, oppure **flessibili** e quindi modellabili.
Vengono inoltre distinti i framework che lasciano maggiore controllo allo sviluppatore (**"un-opinonated"**), come per esempio Vue, e quelli che invece ne lasciano meno (**"opinionated"**).


### Laravel

Laravel è un **framework** orientato alla programmazione ad oggetti per la progettazione e la realizzazione di **web applications**, in particolare lato backend. Esso consente di sviluppare velocemente applicativi in linguaggio **PHP**, grazie al suo essere orientato al pattern architetturale MVC (**Model-ViewController**).

Durante il corso si è utilizzato Laravel come **API server**. Attraverso la definizione di **routes** con l'ausilio del protocollo **REST** si richiamano specifiche funzioni dei **controllers** che vanno poi ad interfacciarsi con i dati contenuti nel database grazie ai **models**.

Laravel inoltre mette a disposizione un **logging handler**, che permette di visionare eventuali errori di sistema e non durante l'utilizzo di Laravel.


### Artisan
Artisan è il nome dell'interfaccia a riga di comando (**CLI**) inclusa con Laravel. 
Esso fornisce numerose funzionalità, per visualizzarle tutte è sufficente usare il seguente comando:`php artisan list`.

Di seguito vengono riportate le principali funzionalità:
- creazione controller ==> `php artisan make:controller ControllerName`
- creazione model ==> `php artisan make:model ModelName`
- creazione migration ==> `php artisan make:migration migration_name`
- lanciare migrazioni ==> `php artisan migrate`

Inoltre permette di utilizzare l'ambiente shell **Tinker** (REPL: Read–eval–print loop).
Ad esso si accede attraverso il comando `php artisan tinker`.


### Contenuti

* [ORM](./orm.md)
* [Migrazioni](./migrazioni.md)
* [Routing](./routing.md)
* [Controller](./controller.md)
