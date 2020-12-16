# Model View Controller

## Introduzione

Model View Controller, abbreviato come **MVC**, è un paradigma di programmazione atto a dividere il codice in blocchi ben distinti in base alla loro funzionalità. 

Per capire al meglio MVC è necessario approfondire il concetto di **paradigma di programmazione**, ovvero l'insieme di strumenti forniti dal linguaggio di programmazione per la stesura delle istruzioni-codice che a sua volta definiscono la visione che dovrà avere il programmatore nella fase di progettazione.

Analizziamo una a una le 3 componenti:
 
## Model

Si tratta della sezione di codice che **si interfaccia con la base dati**. Il Model può inoltre avere la responsabilità di notificare ai componenti della View eventuali aggiornamenti verificatosi in seguito a richieste del Controller, al fine di permettere alle View di presentare agli occhi degli utenti dati sempre aggiornati. 

## View

Da come suggerisce il nome è la parte di codice che più è vicina all'utente, qui verrà contenuta la **logica di presentazione e di interazione**. La view richierà aggiornamenti alla Model per avere una vera e propria dinamicità.

## Controller

Si tratta di quelle porzione di codice che **utilizza i dati** forniti dalla model, eseguendo delle operazioni definite esteticamente nella view ma che nel motore dell'applicazione verranno eseguite nel controller.



MVC detiene una relazione importante con il pattern request-response (es: login form), la view sarà la parte destinata alla visualizzazioni delle input box, il controller a sua volta correggerà ed opererà sui dati in input, il model invece si interfaccerà con il database per ottenere la response della richiesta inviata.
Successivamente la model fornirà al controller i dati trasmessi dal db, e verranno corretamente visualizzati nella view


Laravel nel caso corrente fa fede al paradigma MVC.