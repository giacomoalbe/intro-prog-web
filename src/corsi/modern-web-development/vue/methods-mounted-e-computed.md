# Methods, Mounted & Computed

## Introduzione

In Vue con _componenti reattive_ si intendono tutte le variabili che sono soggetto al data-binding.

Oltre a quelle che è possibile definire all'interno dell'oggetto `data()` sono considerate proprietà reattive anche i _methods_, le _computed_ e le _props_.

```js
export default {
    props: {
    },
    data() {
        return {
            // Data properties
        }
    },
    methods: {
    },
    computed: {
    },
}
```

## Methods

I _methods_ sono delle funzioni definite all'interno dell'oggetto `methods` proprio di ogni componente.

I methods possono accettare parametri e possono utilizzare tutte le proprietà reattive del componente.
Solitamente vengono usati come _callback_ di qualche evento oppure per effettuare binding o interpolazioni complesse, difficilmente inseribile, per questioni di spazio, all'interno della vista.

Per essere richiamati all'interno della View, devono essere eseguiti:

```js
<template>
    <div>{{ aMethod() }}</div>
    <div :class="aComplexClassBinding()"></div>
</template>
```

## Computed

Le _computed_ sono delle funzioni definite all'interno dell'oggetto _computed_ proprio di ogni componente.

La differenza principale tra un method e una computed sta nel fatto che il valore di una computed viene ricalcolato ogni volta che una delle proprietà reattive che la compongono cambia. 

```javascript
computed: {
    name() {
        return this.user.name,
    },
    fullName() {
        return "Ciao, " + this.name
    },
}
```

In questo esempio, ogni volta che la computed `name` viene modificata, il valore della computed `fullName` viene ricalcolato a quindi vengono aggiornate tutte le viste che fanno riferimento alla computed 

TODO:
* Cosa sono le computed
* Qual è la differenza con i methods
* Come si richiamano e come si passano i parametri

## Mounted & Life Cycle dei Componenti

TODO:
* Cos'è il mounted e che tipo di costrutto javascript è (funzione, oggetto, classe, array)
* Quando viene chiamato il mounted
* Cos'è il ciclo di vita di un componente e quali altri hook ci sono
