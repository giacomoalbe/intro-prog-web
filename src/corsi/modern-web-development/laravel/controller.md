# Controller

## Cos'è un controller

Il **Controller** è il punto di ingresso per qualsiasi applicazione basata sul framework MVC: riceve le richieste HTTP in arrivo e le elabora comunicando con modelli e viste, restituendo il risultato alla pagina web.

### Sintassi

I controller possono essere creati utilizzando il seguente commando:
```bash
php artisan make:controller <controller-name>
```
Sostiisci il `<controller-name>` con il nome che ti piace per il controller che stai creando.

Una volta seguito il comando precedente, verrá creato un file di classe controller con un codice controller di base nella cartella controller, situata in `/App/HTTP/Controllers`

## Metodi
In qualsiasi applicazione web CRUD (Create, Read, Update and Delete) solo le operazioni di base su una risosrsa. Con un controller di risorse si ottiene una stuttura di controller generica che include tutti i metodi per eseguire operazioni CRUD. In Laravel, utilizzando un singolo comando é possibile creare un controller di risorse

### Sintassi
In Laravel, il comando utilizzato per creare un controller di risorse é lo stesso del controller normale, solo alla fine dobbiamo aggiungere il suffisso `resource`.
```bash
php artisan make:controller PostController --resource
```

Una volta eseguito il comando precedente, nella cartella controller, situata in `/App/HTTP/Controllers`, verrá creato un file di classe controller `PostController.php` con i **metodi** di:
- indicizzazione
- creazione
- archiviazione
- visualizzazione
- modifica
- aggiornamento 
- distruzione

## Request/Response

### Risposta Base
La risposta più semplice da una route Laravel è una stringa:
```php
Route::get('/', function()
{
    return 'Hello World';
});
```
### Risposta Personalizzata
Tuttavia, per la maggior parte delle rotte e delle azioni del controller, restituirai `Illuminate\Http\Response` un'istanza completa o una **vista**.
La restituzione di un'istanza `Response` completa consente di personalizzare il codice di stato HTTP e le intestazioni della risposta.
A istanza `Response` eredita dalla classe `Symfony\Component\HttpFoundation\Response`, fornendo una varietà di metodi per costruire risposte HTTP:
```php
use Illuminate\Http\Response;

return (new Response($content, $status))
              ->header('Content-Type', $value);
```
Per comodità, puoi anche usare il `Response` helper:
```php
return response($content, $status)
              ->header('Content-Type', $value);
```

### Request

Utilizzando alcuni semplici metodi, puoi accedere a tutti gli input dell'utente dalla tua istanza `Illuminate\Http\Request`. Non è necessario preoccuparsi del verbo HTTP utilizzato per la richiesta, poiché si accede all'input allo stesso modo per tutti i verbi.
```php
$name = Request::input('name');
```

Recupero di un valore predefinito se il valore di input è assente
```php
$name = Request::input('name', 'Sally');
```
Determinare se è presente un valore di input
```php
if (Request::has('name'))
{
    //
}
```
Ottenere tutti gli input per la richiesta
```php 
$input = Request::all(); 
```

Ottenere solo una parte dell'input della richiesta
```php
$input = Request::only('username', 'password');

$input = Request::except('credit_card');
```

Quando si lavora su moduli con input `array`, è possibile utilizzare la notazione a punti per accedere agli array:
```php
$input = Request::input('products.0.name');
```

## Codici di Stato HTTP

### - 200: OK
La richiesta è andata a buon fine. Il significato di un successo varia a seconda del metodo HTTP: 
 - GET: la risorsa è stata recuperata e viene trasmessa nel corpo del messaggio. 
 - HEAD: le intestazioni dell'entità si trovano nel corpo del messaggio. 
 - POST: la risorsa che descrive il risultato dell'azione viene trasmessa nel corpo del messaggio. 
 - TRACE: il corpo del messaggio contiene il messaggio di richiesta ricevuto dal server.

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