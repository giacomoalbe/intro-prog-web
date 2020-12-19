# Model View Controller

## Introduzione

_Model View Controller_, abbreviato spesso in **MVC**, è un paradigma di programmazione atto a dividere il codice in blocchi ben distinti in base alla loro funzionalità.  
> Questo processo viene denominato _separation of concerns_ (separazione degli ambiti) e permette, tra le altre, di aumentare la produttività di un progetto software affidando a persone con competenze speficiche aree diverse, diminuendo l'accavallamento di competenze e massimizzando la qualità del lavoro in ogni sua fase.

Per capire al meglio MVC è necessario approfondire il concetto di **paradigma di programmazione**, ovvero un insieme di _regole_ e _convenzioni_ di programmazione atta ad agevolare il programmatore nella fase di progettazione.  
Solitamente, un paradigma è utile in quanto è il risultato dell'_ingegnerizzazione_ di un processo, ovvero dell'astrazione di un particolare metodo risolutivo per un problema ricorrente nello sviluppo di prodotti anche molto diversi tra loro.  

Risulta quindi _conveniente_ conoscere e, per quanto possibile, aderire ai diversi paradigmi software esistenti per sfruttare a proprio vantaggio l'esperienza maturata negli anni dalla comunità accademica e professionale in ambito software.  

Laravel sfrutta in maniera estensiva l'MVC, utilizzando i `Model`, i `Controller` e le `View` nativamente.

## Anatomia del Model-View-Controller

Il paradigma MVC è particolarmente indicato per i progetti software che sfruttino in maniera importante basi di dati o comunque siano orientati ai dati.  
Rientrano in questa categoria tutti i prodotti web e la maggiorparte dei prodotti software in generale. 

Analizziamo una a una le 3 componenti:
 
### Model

Si tratta della sezione di codice che **si interfaccia con la base dati**.

Il _model_ è l'astrazione software che permette all'applicazione di intergire con la base di dati.  

Per sua natura, il _model_ non fa riferimento ad un particolare tipo di database o di struttura di salvataggio/estrazione dei dati, ma, appunto, espone un'interfaccia unica alle altre componenti software e si occupa internamente dei dettagli implementativi di ogni _backend_ dati che supporti.

### View

Da come suggerisce il nome è la parte di codice che più è vicina all'utente, qui verrà contenuta la **logica di presentazione e di interazione**.

La _view_ riceve le strutture dati di cui ha bisogno direttamente dal controller e si occupa quindi di posizionarle e stilarle nel modo più aderente possibile agli scopi dell'applicazione stessa.

All'interno della _view_ è anche presente il codice per gestire l'interazione con l'utente e l'interrogazione opportuna del _controller_ corretto per portare a termina l'operazione desiderata.

### Controller

Si tratta di quelle porzione di codice che **utilizza i dati** forniti dal _model_ per presentarli alla _view_.  
Possiamo riferirci al _controller_, come alla **colla** tra i dati (rappresentati dal _model_) e la visualizzazione (la _view_), in grado di operare la **logica di business** necessaria per svolgere l'operazione specifica dell'applicazione. 

Con logica di business si intende l'insieme delle azioni, istruzioni ed algoritmi che, operando sui dati, generano le strutture necessarie a portare a termine una certa operazione, specifica del controller in essere. 

La parte di logica è quella che caratterizza il progetto, e, insieme ai dati che vengono collezionati nel tempo, rappresenta l'_asset_ strategico di maggior valore per qualunque progetto software.

## MVC e Request/Response

Per sua natura, l'MVC è un paradigma _direzionale_ e _orientato_, nel senso che le operazioni vengono svolte sempre nello stesso ordine: 

```
Model -> Controller -> View in uscita
View -> Controller -> Model in entrata
```

Per questo motivo l'MVC ben si presta ad essere accompagnato dal paradigma **Request/Response**, per il quale tutte le interazioni tra client e server possono essere ricondotte a scambi di _request_ e corrispondenti _response_.

Questa una descrizione del flusso MVC + Request/Response:
1. Il client (partendo da una _view_) invia una **request** ad un server 
2. Il server passa questa **request** ad un _controller_
3. Il _controller_ esegue la sua **logica di business**, coinvolgendo direttamente il _model_ nelle sue operazioni
4. Il _controller_ impacchetta i dati necessari all'interno di una nuova _view_
5. Il server invia la _view_ al client attraverso una **response** 

Laravel essendo un backend server aderisce al protocollo Request/Response, utilizzando appunto le classi `Request` e `Response`, _agganciando_ ad esse gli altri elementi tipici del paradigma MVC. 
