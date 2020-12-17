# Routing

TODO:
* cos'è il routing
* come si inserisce nel modello request-response
* come funziona il collegamento tra endpoint (URL) e funzione (metodo controller)
* esempi di passaggio di parametri alle funzioni


Una Route è un meccanismo che serve a configurare la nostra applicazione in modo da rispondere a un certo URL. Si tratta di una modalità per creare una URL richiesta (request URL) al quale la nostra applicazione possa dare un output.

Questi url non devono necessariamente corrispondere a file specifici esistenti sul nostro server. Stiamo parlando di url dinamici e riscrivibili che possono essere costruiti in qualsiasi modo, anche per essere ottimizzati in ottica SEO.


Un’istallazione default di Laravel appena scaricata, nel file web.php contiene una sola route, quella che mostra la pagina iniziale di benvenuto.

![img](./immagini/img_0.png)