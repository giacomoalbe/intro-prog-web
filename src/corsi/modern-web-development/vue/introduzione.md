# Il Framework Vue

## Concetti Generali

<!-- TODO
* Cos'è Vue, dove si posiziona nello sviluppo Web (frontend/backend)
* Aspetti centrali di Vue (component based, reactive) -->

Vue è un framework Javascript frontend per la realizzazione di interfacce web e single page application.  
Alternative ad esso possono essere React.js e Angular.js

E' un sistema basato su componenti, blocchi di programma riutilizzabili, e proprietà reattive, variabili capaci reagire e modificarsi dato un cambiamento.

## Componenti

<!-- TODO 
* Struttura del componente (template, script, style)
* Template delle properties dello script di un componente -->

A seconda di come viene installato, Vue può avere due strutture diverse:
* Struttura a componenti
* Struttura a pagina singola

### Struttura a componenti

In questo caso Vue è organizzato in componenti aventi la seguente struttura:  
```
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
    methods: {

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
* `<template></template>` contiene tutto il codice che verrà visualizzato come html
* `<script></script>` contiene il codice javascript, dove possiamo importare i componenti, definire le proprietà reattive, i metodi e altro di cui parleremo nei capitoli successivi
* `<style></style>` contiene il codice per stili css del componente (se utilizziamo tailwind questo tag non serve)

I componenti sono file con l'estensione `.vue`, come in questo caso `.HelloWorld`, che possono essere importati in altri componenti

### Struttura a pagina singola

In questo caso utiliziamo Vue all'interno di una singola pagina:
```
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

Per prima cosa dobbiamo importare la cdn di Vue con `<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>`

Dunque, come vediamo dall'esempio, creiamo una nuovo oggetto Vue dentro al tag `<script></script>` dove ci sono 3 parametri fondamentali:
*  `el: ` dove definiamo il selettore in cui verrà visualizzata la nostra applicazione (`#app` in questo caso)
*  `data() { }` che è un funzione dove definiamo le proprietà reattive, ritornandole, (`messaggio` in questo caso)
*  `methods: { }` dove definiamo le nostre funzioni Javascript

## Npm & Vue CLI

TODO:
* Cos'è Npm e i node_modules
* Come usare la Vue CLI per creare progetti
* Come usare la Vue CLI in sviluppo (serve & build)

## Contenuti

* [MVVM & Data Binding](./mvvm-e-data-binding.md)
* [Methods, Mounted & Computed](./vue/methods-mounted-e-computed.md)
* [API, async, axios](./api-async-axios.md)
