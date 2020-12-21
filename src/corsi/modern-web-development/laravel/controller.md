# Controller

## Cos'è un controller

Il **Controller** è il punto centrale di qualsiasi applicazione basata sul framework MVC: risponde alle richieste HTTP in arrivo, le elabora comunicando con i Modelli e restituisce il risultato alla pagina web popolando la Vista.

### Sintassi

I controller possono essere creati utilizzando il seguente commando:
```bash
php artisan make:controller <ControllerName>
```
Dove con `<ControllerName>` si intende il nome, in PascalCase, che si vuole dare al nuovo Controller.  

> I Controller in PHP sono rappresentati da Classi, per questo motivo il nome che diamo alla classe (e conseguentemente al file) deve rispettare le regole di nomenclatura delle Classi.
> 
> In particolare, le classi in PHP utilizzano la PascalCase.
> 
> Qui di seguito una comparazione dei diversi modi (o _casing_) con cui possiamo scrivere nomi di variabili:
> * PascalCase: prima lettera maiuscola, nessuno spazio e ogni parola con lettera maiuscola
> * kebab-case: tutte lettere minuscole, nessuno spazio e ogni parola separata da un -
> * snake_case: tutte lettere minuscole, nessuno spazio e ogni parola separata da un _ 
> * camelCase: prima lettera minuscole, nessuno spazio e ogni parola successiva alla prima con lettera maiuscola 
> 
> E' sempre bene evitare di usare più convenzioni di _casing_ all'interno dello stesso codice.


Una volta seguito il comando precedente, verrá creato un file di classe `Controller` con al suo interno una struttura di base nella cartella controllers, situata in `/App/Http/Controllers`.

## Metodi
Con _CRUD_ (Create, Read, Update and Delete) si intendono le operazioni di base che possono essere eseguite da un Controller su una _risorsa_, ovvero sui Modelli del database.   

In particolare, in Laravel, si usa una certa convenzione per indicare le funzioni dei Controller (quindi i _metodi_) associate alle azioni di base:

* **lista risorse** (_READ_): si usa il metodo `index()`
* **dettaglio risorsa** (_READ_): si usa il metodo `show()`
* **creazione risorsa** (_CREATE_): si usa il metodo `store()`
* **modifica risorse** (_UPDATE_): si usa il metodo `edit()`
* **eliminazione risorse** (_DELETE_): si usa il metodo `destroy()`

Ovviamente nulla vieta di utilizzare nomi di funzioni diverse, ma è fortemente consigliato (quando possibile) seguire le convenzioni di Laravel, in quanto questo agevola notevolmente la _consistenza_ del codice e la facilità di intervento di altri sviluppatori. 

## Request/Response

Il compito principale di un Controller è quello di elaborare una certa _request_ e, conseguentemente, di inviare una _response_.

### Recuperare informazioni dalla Request

Quando il client fa partire una _request_ particolare ad un certo URL, spesso vi associa alcuni dati necessari al Controller dall'altra parte per processarla correttamente.

All'interno del Controller, per recuperare questi dati è necessario usare la classe Laravel `Request`, oppure l'oggetto `$request` che viene _iniettato_ da Laravel in ogni metodo associato (attraverso una `Route`) ad un particolare _endpoint_.

```php
function index(Request $request) {
    // Notazione usando il singleton Request
    $data = Request::all(); 

    // Notazione usando la $request iniettata nel metodo
    $data = $request->all();
}
```

Utilizzando alcuni semplici metodi, puoi accedere a tutti gli input dell'utente dalla tua istanza `Illuminate\Http\Request`.

```php
$name = Request::input('name');
```

Recupero di un valore predefinito se il valore di input è assente
```php
$name = Request::input('name', 'Sally');
```
Determinare se è presente un valore di input:
```php
if (Request::has('name')) {
    //
}
```
Ottenere tutti gli input per la richiesta:
```php 
$input = Request::all(); 
```

Ottenere solo una parte dell'input della richiesta
```php
$input = Request::only('username', 'password');

$input = Request::except('credit_card');
```

Quando si lavora con input di tipo `array`, è possibile utilizzare la notazione a punti per accedere agli array:
```php
$input = Request::input('products.0.name');
```

### Recuperare informazioni dall'URL

Quando si utilizzano API di tipo REST, solitamente alcuni dati vengono codificati all'interno dell'URL della richiesta stessa, quindi all'interno dell'Endpoint.  

Questi dati **non** sono recuperabili usando i metodi espressi nel paragrafo precedente, ma sono _iniettati_ all'interno del metodo esattamente come la `$request`, se opportunamente segnalati nella `Route` di collegamento:

* **Endpoint**: `/users/10`
* **Route**: `/users/{userId}`
* **Metodo**:
    ```php
    function show(Request $request, $userId) {
        // $userId sarà collegata a tutto quello che c'è dopo /users/ 
        Log::info("UserId: " . $userId);
        // Stamperà => UserId: 10
    }
    ```

### Inviare una Response di base

Una volta recuperati e processati opportunamente i dati della `Request`, è necessario che il Controller risponda al client, popolando una `Response`. 

Un server Web tradizionale, a questo punto, andrebbe a creare una View, inserendovi all'interno di dati necessari e quindi restituendo al client una pagina HTML.  
Nel caso di server API, invece, quello che accade è che il Controller invia al client **solamente** i dati, delegando il compito di creare tutti gli elementi di visualizzazione al client.

Dato che noi stiamo utilizzando Laravel come Server API (per sfruttare al massimo la compatibilità con Vue), ci concentreremo sul secondo modo di comunicare. 

Per convenzione, tutto quello che un metodo Laravel associato ad una `Route` ritorna viene visto come una `Response`.  
Nel caso non si trattasse di un oggetto `Response`, Laravel si preoccupa di _incapsulare_ i dati da noi ritornati all'interno di una `Response` con status HTTP 200.

```php
function index() {
    // In questo caso verrà ritornato un oggetto Response con status 200 e contenuto di tipo stringa "tutto ok".
    return "tutto ok";
}
```

Da notare come in questo caso lo status della `Response` sarà sempre 200.

### Inviare una Response personalizzata

Per poter _personalizzare_ la `Response` che si intende inviare è necessario restituire un oggetto `Response` e di impostare correttamente i parametri.

```php
function index() {
    return response()->json([
        "error" => "not-authorized"
    ], 401);
}
```

In questo caso, abbiamo creato una `Response` con la funzione `response()` e abbiamo richiamato su di essa il metodo `json($data, $http_status)` che permette di dichiarare il _tipo_ di risposta (`json` e non `html`), di aggiungere dati e di impostare uno status HTTP diverso.

Utilizzando questa sintassi è anche possibile _aggiungere_ altre informazioni alla `Response`, come _cookie_ o _headers_.



## Codici di Stato HTTP

I _codici di stato HTTP_ o più semplicemente _status_, rappresentano un modo per comunicare il valore _di ritorno_ delle `Response`, per dare informazioni _a colpo d'occhio_ sullo stato della richiesta.

### - 200: OK
La richiesta è andata a buon fine. Il significato di un successo varia a seconda del metodo HTTP: 
 - GET: la risorsa è stata recuperata e viene trasmessa nel corpo del messaggio. 
 - HEAD: le intestazioni dell'entità si trovano nel corpo del messaggio. 
 - POST: la risorsa che descrive il risultato dell'azione viene trasmessa nel corpo del messaggio. 

### - 201: Created
La richiesta è andata a buon fine e come risultato è stata creata una nuova risorsa. Questa è in genere la risposta inviata dopo una richiesta PUT.

### - 400: Bad Request
Questa risposta significa che il server non è stato in grado di comprendere la richiesta a causa di una sintassi non valida

### - 401: Unauthorized
Sebbene lo standard HTTP specifichi "non autorizzato", semanticamente questa risposta significa "non autenticato". Cioè, il client deve autenticarsi per ottenere la risposta richiesta.

### - 404: Not Found
Il server non riesce a trovare la risorsa richiesta. Nel browser, questo significa che l'URL non viene riconosciuto. In un'API, questo può anche significare che l'endpoint è valido ma la risorsa stessa non esiste. I server possono anche inviare questa risposta invece di 403 per nascondere l'esistenza di una risorsa a un client non autorizzato. Questo codice di risposta è probabilmente il più famoso a causa della sua frequente presenza sul web.

### - 422: Unprocessable Entity
La richiesta era ben formata ma non è stato possibile seguirla a causa di errori semantici.

### - 500: Internal Server Error
Il server ha riscontrato una situazione che non sa come gestire.
