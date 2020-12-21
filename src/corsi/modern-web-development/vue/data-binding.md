# Data Binding

## Introduzione

Il _data binding_ è una funzionalità che permette di mantenere sincronizzati dei dati (variabili Javascript, array, ecc.) con il DOM (Document-Object-Model) molto facilmente.  
Con _sincronizzazione_ si intende che ogni modifica che viene effettuata ad una variabile viene subito applicata in ogni punto dove questa variabile viene utilizzata, sia che questo si verifichi nella View che nel Componente. 

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

## One & Two Way data binding

Il _data-binding_ è di due tipi: _one way_ e _two way_.

Con _way_ si può far riferimento o alla View (quindi la parte HTML o _template_) o al Componente in sè (ovvero la parte Javascript).

### OneWay: dalla view al Componente

Il primo tipo di _binding_ è tra la vista e il Componente.  
Questo accade, ad esempio, quando andiamo ad agganciare dei metodi del componente a particolari eventi della view, ad esempio inserimento di testo in un `<input>` oppure click su pulsanti.

In Vue, questo è possibile usando la sintassi `@<nome-evento>` e associando ad esso un metodo del Componente:

```javascript
<template>
<div>
    <button @click="onBtnClick"></button>
    <input @input="onInput"/>
</div>
</template>
<script>
export default {
    methods: {
        onBtnClick(event) {
            console.log("Btn Clicked");
        },
        onInput(event) {
            console.log("New value: " + event.target.value);
        }
    }
}
</script>
```

### OneWay: dal Componente alla View

Il secondo caso di _binding_ monodirezionale è quello tra le proprietà reattive del Componente e la View.   
In questo caso, è possibile _popolare_ la View usando proprietà del Componente, sapendo che ogni modifica della proprietà sarà sincronizzata con il template. 

Esempi di questo tipo di associazione sono:

1. **Interpolazione variabili**:
    
    Per _stampare_ il valore di una variabile reattiva all'interno del contenuto di elemento HTML è necessario usare la sintassi di interpolazione, ovvero usare la doppie parentesi graffe.

    ```html
    <div>{{ user }}</div>
    ```

    In questo caso, il contenuto del div sarà legato alla variabile reattiva `user`.

    All'interno delle doppie parentesi graffe è possibile far riferimento a **qualsiasi** proprietà reattiva (metodi, computed, props, data) ed è inoltre ammesso qualsiasi costrutto Javascript in grado di ritornare un valore.

    ```html
    <div>{{ (someMethod() + someOtherMethod())</div>
    ```
    ```html
    <div>{{ booleanOperator || logicValue && otherLogicValue  }}</div>
    ```
    
1. **Class binding**: `<div :class="user.class"></div>` 
    
    E' possibile _aggiungere_ o _rimuovere_ una classe da un componente HTML associando a tale classe una proprietà reattiva presente nel Componente.

    Sintassi semplice (usando operatore ternario, per una sola classe alla volta):
    ```html
    <div :class="loading ? 'bg-gray-800' : 'bg-red-800'"></div>
    ```

    Sintassi completa (usando un oggetto Javascript):
    ```html
    <div :class="{
        'bg-gray-800 underline': loading,
        'bg-red-800 font-bold': !loading,
    }"></div>
    ```

    In questo caso, ogni _chiave_ dell'oggetto associato alla classe viene _aggiunta_ quando il corrispondente valore è `true` e _rimossa_ nel caso contrario.

1. **Style binding**: 

    TODO
1. **Attribute binding**: 

    TODO

Vediamo ora nel dettaglio i diversi tipi di binding tra Vista e Componente

### TwoWay Data Binding

E' possibile creare un tipo particolare di associazione che sfrutta entrambe le modalità di sicronizzazione, ovvero è in grado di aggiornare la variabili sia da View a Componente che nel caso contrario. 

Questo è possibile usando l'attributo `v-model`, che permette sia di ascoltare le _modifiche_ che arrivano dalla View (quindi in risposta a interazione dell'utente) che quelle che arrivano dal Componente (quindi il risultato di chiamate di Rete o di elaborazioni dei metodi).

```javascript
<template>
<div>
    <input v-model="input"/>
    <div>{{ input }}</div>
</div>
</template>
<script>
export default {
    data() {
        return {
            input: "",
        }
    }
}
</script>
```

In questo esempio, modificando il valore dell'input (associazione mono-direzionale da Vista a Componente) si aggiorna anche il contenuto del div (associazione mono-direzionale da Componente a Vista).

