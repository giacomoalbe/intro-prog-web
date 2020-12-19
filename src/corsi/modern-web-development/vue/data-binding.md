# Data Binding

## Introduzione

Il data binding è una funzionalità che permette di mantenere sincronizzati dei dati (variabili Javascript, array, ecc.) in sincrono con il DOM (Document-Object-Model) molto facilmente. Ciò è grazie alla possibilità infatti di poter associare un elemento presentazionale con una particolare variabile od oggetto, e grazie alla modifica di questi avere un immediato cambiamento della view.
Ciò appena descritto può essere riassunto in: Vue è dotato di "motore" che rende un applicativo **reattivo**.

Questa utilissima funzione si basa sulle proprietà reattive, che vanno necessariamante definite all'interno di un' **istanza** di Vue:

```js
var app = new Vue({
    // proprietà
});

```

Di seguito viene mostrato come definirle:

```js
var app = new Vue({
    el: "#app",
    data() {
        return {
            reactiveProp1: "",
            reactiveProp2: 3,
        },
    }
});
```
E' possibile fare riferimento ad una proprietà reattiva sia all'interno del componente (usando this) sia dentro la vista (senza this):

```js
<html>
    <body>
        <div id="app">
            {{ reactiveProp2 }}    ==>  fuori dal componente
        </div>
    </body>
</html>

var app = new Vue({
    el: "#app",
    data() {
        return {
            reactiveProp1: "",
            reactiveProp2: 3,
        },
    },
    methods: {
        newFunction() {
            this.reactivProp = "Vue è bello";  ==> dentro il componente
        },
    },
});
```



TODO:

* Cos'è il data binding, quale problema va a risolvere
* Cos'è un proprietà reattiva, come si definiscono nei componenti
* Come si fa riferimento alle proprietà reattive dentro il Componente (usando this)
* Come si fa riferimento alle proprietà reattive dentro la Vista (senza usare this)

## One & Two Way data binding

TODO:

* Data binding monodirezionale tra Vista e Controller (@input, @change, event-handling)
* Data binding monodirezionale tra Controller e Vista (:value, :class, :style, attribute binding)
* Data binding bidirezionale (v-model)

## Interpolazione Template

TODO:

* Usare le {{ }} per popolare contenuto HTML con proprietà reattiva
* Operazioni che è possibile fare dentro le interpolazioni (aritmetiche, logiche, richiamare funzioni, passare argomenti)

## Binding Attributi

TODO:

* Spiegare funzionamento del class binding, sia semplice (:class="loading ? 'bg-gray-800' : 'bg-red-800'") che usando oggetti complessi per più binding sullo stesso oggetto

    ```js
    :class="{
        'bg-gray-800 underline': loading,
        'bg-red-800 font-bold': !loading,
    }"
    ```
* Mostrare esempi del binding su attributi HTML anche non class (style, id, name, custom properties, ecc)
