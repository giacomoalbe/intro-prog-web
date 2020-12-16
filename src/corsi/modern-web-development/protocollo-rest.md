# Protocollo REST

## Introduzione

TODO: cos'è un protocollo, come viene usato per la comunicazione tra client & server, che tipo di tecnologia usa, il ruolo dei verbi HTTP (get, post, put,), le convenzioni, cos'è una risorsa

Un **protocollo** si può definire come un insieme di regole che vengono stabilite per instaurare una comunicazione corretta: ad esempio due persone di differenti madrelingue potrebbero mettersi d'accordo nell'utilizzo della lingua inglese per comunicare.
 
I protocolli in generale sono dei protocolli di comunicazione, i quali sono adibiti far comunicare il client e il server
 
Il modello client-server è costituito da un insieme di processi in esecuzione su diversi host: i processi che gestiscono una o più risorse sono detti server mentre quelli che richiedono l’accesso ad alcune di queste risorse distribuite sono detti client. **Un processo server può a sua volta diventare client ed essere contemporaneamente sia client che server**.


Ad esempio uno Schema di funzionamento di un modello client-server:
1.	Il client manda una richiesta al server;
2.	Il server (in stato di ascolto, listening) riceve la richiesta;
3.	Esegue il servizio richiesto (mediante un thread concorrente);
4.	Manda una risposta ed eventualmente dei dati al client;
5.	Il client riceve la risposta ed eventualmente i dati. 




## I verbi HTTP

* GET
* POST
* PUT
* DELETE
* OPTIONS

## Le risorse RESTful

* Lista
* Dettaglio
* Modifica
* Creazione
* Cancellazione
