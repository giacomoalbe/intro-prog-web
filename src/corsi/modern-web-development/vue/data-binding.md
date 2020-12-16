# Data Binding

## Introduzione

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
