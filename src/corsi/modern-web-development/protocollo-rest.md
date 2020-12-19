# Protocollo REST

## Introduzione

<!--
TODO: cos'è un protocollo, come viene usato per la comunicazione tra client & server, che tipo di tecnologia usa, il ruolo dei verbi HTTP (get, post, put,), le convenzioni, cos'è una risorsa
-->

Un **protocollo** si può definire come un insieme di regole che vengono stabilite per instaurare una comunicazione corretta: ad esempio due persone di differenti madrelingue potrebbero mettersi d'accordo nell'utilizzo della lingua inglese per comunicare.
 
In ambito informatico con _protocolli_ in generale si intendono i protocolli di comunicazione, il cui scopo è appunto _normare_ la comunicazione tra diverse entità, tipicamente client con server. 
 
Il modello client-server è costituito da un insieme di processi in esecuzione su diversi host: i processi che gestiscono una o più risorse sono detti server mentre quelli che richiedono l’accesso ad alcune di queste risorse distribuite sono detti client.  
**Un processo server può a sua volta diventare client ed essere contemporaneamente sia client che server**.


Ad esempio uno Schema di funzionamento di un modello client-server:
1.	Il client manda una richiesta al server
2.	Il server (in stato di ascolto, o _listening_) riceve la richiesta
3.	Il server esegue il servizio richiesto
4.	Il server manda una risposta ed eventualmente dei dati al client;
5.	Il client riceve la risposta ed eventualmente i dati. 

## REST

Il protocollo **REST** (_Representational State Transfer_) è un insieme di regole di comunicazione tra server basato sul protocollo HTTP.

Il principio cardine di questo protocollo è che ogni richiesta scambiata tra diverse entità deve essere in grado di _rappresentare_ in maniera univoca **l'informazione** che il client sta richiedendo al server.

Con **informazione** si intende la coppia **azione** e **risorsa** richieste.

Il protocollo REST si basa infatti sul dividere il proprio progetto in **risorse**, che rappresentano normalmente i diversi _modelli_ dell'applicazione, e in **azioni** che possono essere effettuate sulle risorse.  

Queste _azioni_ e _risorse_ vengono poi tradotte in richieste HTTP tradizionali utilizzando i **verbi HTTP** e alcune convenzioni nella scrittura degli URL.  

> Il protocollo REST serve semplicemente a definire il funzionamento della _comunicazione_ tra diverse entità web, ma non implementa nessuna delle logiche lato client o server per la gestione delle richieste. 
>
> In altra parole, oltre al _modo_ di comunicare sfruttando il protocollo REST è necessario realizzare la funzionalità di estrazione ed elaborazione dei dati per soddisfare le diverse richieste.

## Azioni REST: I verbi HTTP

* **GET**

    Le richieste di tipo `GET` servono per richiedere dati tra due entità, sia sotto forma di **lista** che di **dettaglio**

* **POST**

    Le richieste di tipo `POST` vengono usate per comunicare l'intenzione di creare una nuova risorsa, non ancora esistente, con i dati che presenti nella richiesta stessa. 

* **PUT**

    Le richieste di tipo `PUT` servono per modificare una risorsa esistente (definita a partire dall'ID) aggiornando solamente i dati che vengono inviati nella richiesta stessa

* **DELETE**

    Le richieste di tipo `DELETE` servono per eliminare una risorsa a partire dal suo ID

## Le risorse RESTful: gli endpoint

Gli **endpoint**, ovvero gli _estremi_ della comunicazione, sono rappresentati da URL (indirizzi web) formattati in un certo modo. 

Questi, unitamente ai verbi HTTP presentati precedentemente, servono per identificare univocamente l'azione che il client sta richiedendo al server:

* **Lista**

    Per ottenere la lista delle risorse di un certo tipo, è necessario inserire il nome della risorsa in una richiesta GET:

    Esempio:

    ```
    GET /users => lista delle risorse di tipo users 
    ```

    > Per ottenere la lista non è necessario usare l'endpoint /users/list in quanto il verbo GET è già sufficiente per identificare univocamente l'azione di richiesta dell'insieme delle risorse di quel tipo

* **Dettaglio**

    Per ottenere il dettaglio di una risorsa di un certo tipo con un certo ID, è necessario inserire il nome della risorsa e l'ID nell'URL di una richiesta GET:

    Esempio:

    ```
    GET /users/10 => dettaglio della risorsa di tipo users con ID = 10
    ```

* **Creazione**

    Per creare una risorsa di un certo tipo, è necessario inserire il nome della risorsa e i dati della nuova risorsa in una richiesta POST:

    Esempio:

    ```
    POST /users {name: 'nuovo_utente', password: 'mypass20200'} => creazione di una risorsa di tipo users con i dati presentati
    ```

    > Anche in questo caso, non è necessario indicare nell'endpoint l'intenzione di creare una risorsa con /users/create oppure /users/new in quanto il verbo POST è sufficiente per palesare questa intenzione

* **Modifica**

    Per modificare una risorsa di un certo tipo con un certo ID, è necessario inserire il nome della risorsa, i dati della nuova risorsa che si intendono aggiornare e l'ID della risorsa in una richiesta PUT:

    ```
     PUT /users/10 {email: 'nuova@email.com'} => modifica di una risorsa di tipo users con id = 10, aggiornando l'email
    ```

* **Cancellazione**
    Per cancellare una risorsa di un certo tipo con un certo ID, è necessario inserire il nome della risorsa e l'ID della risorsa in una richiesta DELETE:

    ```
    DELETE /users/10 => eliminazione di una risorsa di tipo users con id = 10
    ```
