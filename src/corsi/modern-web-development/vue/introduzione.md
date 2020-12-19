# Il Framework Vue

## Concetti Generali

<!-- TODO
* Cos'è Vue, dove si posiziona nello sviluppo Web (frontend/backend)
* Aspetti centrali di Vue (component based, reactive) -->

Vue è un framework Javascript frontend reattivo per la realizzazione di interfacce web e Single Page Application (SPA).  
Alternative ad esso possono essere **React.js** oppure **AngularJS**.

E' un sistema basato su **componenti**, blocchi di programma riutilizzabili, e **proprietà reattive**, variabili capaci reagire e modificarsi dato un cambiamento.

La _reattività_ è un aspetto fondamentale del framework, in quanto è facilità lo sviluppo e riduce enormemente i tempi di realizazione.  

La sostanziale aderenza di Vue al pattern MVC (nella sua _dialetto_ specifico per il frontend, denominato _MVVM_) permette di costruire applicazioni complesse garantendo comunque scalabilità, manutenibilità e organizazione del codice.


## Componenti

<!-- TODO 
* Struttura del componente (template, script, style)
* Template delle properties dello script di un componente -->

A seconda di come viene installato, Vue può avere due strutture diverse:
* Struttura a componenti
* Struttura a pagina singola

### Struttura a componenti

In questo caso Vue è organizzato in componenti aventi la seguente struttura:  
```javascript
<template>
    <div id="app">
        <HelloWorld msg="Hello World!">
    </div>
</template>

<script>
import HelloWorld from '.components/Helloworld.vue

export default {
    name: 'app',
    components: {
        HelloWorld
    },
    props: {
    },
    data() {
      return {
      }
    },
    mounted() {
    },
    methods: {
    },
    computed: {
    }
}
</script>

<style>
    * {
        margin: 0;
        padding: 0;
    }
</style>
```
Dove:
* `<template></template>` contiene tutto il codice che verrà visualizzato come HTML nella pagina Web
* `<script></script>` contiene il codice Javascript, dove possiamo importare i componenti, definire le proprietà reattive, i metodi e altro di cui parleremo nei capitoli successivi
* `<style></style>` contiene il codice per stili CSS del componente (se utilizziamo [TailwindCSS](../tailwind-css.md) questo tag non risulta necessario, in quanto lo stile viene inserito direttamente nel codice HTML).

I componenti sono file con l'estensione `.vue`, come in questo caso `HelloWorld`, che possono essere importati in altri componenti e usati più volte.

I componenti di Vue permettono di _incapsulare_ funzionalità e logiche di business unitamente alla loro rappresentazione visuale, rendendo di fatto possibile "riciclare" e riutilizzare codice in ambienti o progetti diversi, sfruttando l'interfaccia esposta da ogni componente come metodo di comunicazione.   

Questo permette di vedere un'applicazione Vue come un insieme di componenti che comunicano tra loro, creando una struttura snella e facilmente modellabile secondo le esigenze.

### Struttura a pagina singola

In questo caso utiliziamo Vue all'interno di una singola pagina:
```javascript
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>v-if</title>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
    <div id="app">
        {{ messaggio }}
    </div>
    <script>
        let app = new Vue({
            el: '#app',
            data() {
                return {
                    messaggio: "Hello World!",
                }
            },
            methods: {
            }
        });
    </script>
</body>
</html>
```

Per prima cosa dobbiamo importare lo script Vue da una _CDN_ (_Content Delivery Network_) con `<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>`

Dunque, come vediamo dall'esempio, creiamo una nuovo oggetto Vue dentro al tag `<script></script>` dove ci sono 3 parametri fondamentali:
*  `el: ` dove definiamo il selettore CSS dell'elemento in cui verrà visualizzata la nostra applicazione (`#app` in questo caso, quindi un elemento con `id` uguale ad 'app')
*  `data() { }` che è un funzione dove definiamo le proprietà reattive, ritornandole, (`messaggio` in questo caso).
*  `methods: { }` dove definiamo le nostre funzioni Javascript direttamente accessibili dalla vista.

## Tool di Sviluppo per Vue 

<!--
TODO:
* Cos'è Npm e i node_modules
* Come usare la Vue CLI per creare progetti
* Come usare la Vue CLI in sviluppo (serve & build)
-->

### NPM

Ad oggi, l'ecosistema Javascript risulta essere quello maggiormente utilizzato al mondo.

Per evitare di continuare a _reinventare la ruota_ e concentrare gli sforzi di sviluppo su funzionalità immediatamente vendibili, si fa ricorso solitamente a **pacchetti** di codice esterni, che possono essere facilmente intergati all'interno del proprio progetto Javascript.  
Da questo punto di vista, VueJS non fa eccezione: è infatti possibile integrare pacchetti generici per Javascript e specifici per Vue (solitamente indicati dal prefisso `vue-`) utilizzando programmi chiamati _package managers_, o gestori di pacchetti.

Il più famoso e maggiormente utilizzato è `NPM`, letteralmente `Node Package Managers`. _Node_ è il nome dell'interprete Javascript nativo per PC, quindi non quello installato nel browser.

Con quasi 1,5 milioni di pacchetti disponibili online, `NPM` è il più grande _repository_ (leggi contenitore) di codice (Javascript) al mondo.  
Qui è possibile trovare pacchetti per risolvere praticamente tutte le esigenze di programmazione, dalle utility, alla sicurezza, al processing vario di immagini e altro.

`NPM` è un programma da linea di comando che permette, tra le altre, di installare pacchetti localmente al un progetto o globalmente, rendendoli disponibili sotto forma di CLI in tutto il sistema operativo. 

I pacchetti locali ad un progetto vengono installati nella cartella `node_modules`.

E' poi compito di altri programmi, ad esempio `Webpack` o `Rollup` fare in modo di _comporre_ il progetto usando sia il codice da noi generato che quello presente nei pacchetti.

### Vue CLI

Per agevolare lo sviluppo di progetti Vue è stata creata una _CLI_ specifica con cui è possibile creare e gestire progetti.  
Maggiori informazioni e una documentazione più esaustiva sono reperibili [qui](https://cli.vuejs.org)


La CLI di Vue è facilmente installabile usando NPM, nel seguente modo:
```bash
npm install @vue/cli
```

Una volta installato il pacchetto, sarà disponibile un nuovo programma da linea di comando, chiamato `vue`.

Di seguito alcune delle operazioni più comuni che è possibile effettuare con la CLI:

* **Creare un progetto**
  
  Per creare un progetto è sufficiente digitare il comando:
  ```bash
  vue create nome-progetto
  ```
  A questo punto l'utente verrà guidato in un _wizard_ in cui dovrà inserire le specifiche del progetto da utilizzare.  
  Nella maggiorparte dei casi, è possibile mantenere le impostazioni di default.

* **Servire un progetto**

  Il browser non è in grado di eseguire più file contemporaneamente e, in generale, comprende solamente file Javascript _vanilla_, ovvero file che presentano le caratteristiche di base del linguaggio.  
  Vue, invece, fa uso di costrutti Javascript complessi, per agevolare il programmatore nello sviluppo. Questo comporta che i vari file di Vue debbano venire _compilati_ in modo da essere interpretabili correttamente dai vari browser (Chrome, Firefox, Safari, Opera, Edge, ecc).

  Operare questo _stage_ di compilazione ad ogni modifica del codice risulterebbe particolarmente lento e poco ergonomico.  Per questo motivo, la Vue CLI mette a disposizione un comando, `vue serve` che si occupa proprio di riconoscere i cambiamenti ai file di progetto (ad ogni salvataggio), di _compilare_ tutto il progetto e di inviarlo al browser, aggiornando la pagina in maniera automatica.

  Il comando `vue serve` dunque _serve_ il progetto ad un certo indirizzo HTTP locale, ad esempio `http://localhost:8080`, dove è quindi possibile accedere ai file di progetto serviti attraverso il meccanismo dell'_hot reload_.

* **Builare un progetto**

  Una volta completato lo sviluppo locale (o in modalità _development_) deve essere possibile mandare in _produzione_ il progetto, ovvero renderlo accessibile pubblicamente attraverso la rete internet. 

  Per questa fase, le modalità sono simili a quelle del `serve`, con la sola differenza che la fase di compilazione del progetto viene fatta in ottica di produzione, andando ad applicare tutte le ottimizzazioni in termini di performance, di riduzione del peso complessivo e di messa in sicurezza del codice. 

  Il risultato della fase di build sarà una terna di file:
  * _app.js_: questo file conterrà il codice Javascript completo dell'applicazione
  * _index.html_: in questo file sarà presente tutta la parte di struttura dell'applicazione
  * _app.css_: file contente tutto lo stile CSS da applicare ai vari componenti del progetto

  Per creare questo _bundle_, ovvero l'insieme dei file e delle risorse che rappresentano il progetto, è sufficiente usare il comando:

  ```bash
  vue build --prod
  ```







## Contenuti

* [MVVM & Data Binding](./mvvm-e-data-binding.md)
* [Methods, Mounted & Computed](./vue/methods-mounted-e-computed.md)
* [API, async, axios](./api-async-axios.md)
