# Migrazioni

## Introduzione

Le migrazioni sono una classe speciale di Laravel che contengono una serie di azioni da eseguire sul database come per esempio la creazione o la modifica di una tabella.

Queste migrazioni servono affinchè il database venga impostato in modo identico ogni volta che viene lanciato tra le diverse macchine di sviluppo che contribuiscono al progetto.

Possiamo considerare le migrazioni come un versionamento del database dell'applicazione

### Creare una migrazione

Per creare una migrazione è necessario utilizzare il seguente comando Artisan sul terminale:

```
php artisan make:migration create_table_names_table
```

**N.B.** Per comodità il nome delle migrazioni dovrà attenersi ad alcune regole: 
* Tutte le lettere minuscole
* Le parole devono essere separate da _
* Nome della tabella plurale

Una volta creata la migrazione è possibile trovarla all'interno della cartella *database/migration* insieme a tutte le altre, ogni migrazione ha un *timestamp* che permette a Laravel di individuare l'ordine delle migrazioni.

Una volta aperto il file dovrebbe presentarsi una schermata simile:

![Migration](../immagini/migration.png)

All'interno delle migrazioni troveremo due metodi:
* Up(): permette di aggiungere una nuova tabella, aggiungere nuove colonne o nuovi indici al database.
* Down(): permette di eliminare le precedenti modifiche.

### Principali comandi migrazioni

* **php artisan migrate**: serve ad inizializzare tutte le migrazione con ordine eseguendo quindi le istruzione al database
* **php artisan migrate:rollback**:  serve ad annullare le ultime operazioni delle migrazioni
* **php artisan migrate:fresh**: serve ad inizializzare le migrazioni da capo eliminando quelle già eseguite
* **php artisan migrate:status**: serve a vedere lo stato delle migrazioni eseguite

### Creare una tabella

All'interno di una migrazione e più precisamente all'interno del metodo up() bisognerà andare scrivere il seguente codice

```
Schema::create('table_names',function (Blueprint $table){

});
```
Al suo interno dovremo andare a specificare che tipo di colonne vogliamo andare a creare all'interno della tabella, per esempio con:

```
$table->string('email')->unique()
```

andremo a creare una colonna chiamata *email* che sarà di tipo testo, abbiamo inoltre specificato che all'interno della tabella quel campo dovra essere unico.
Se invece scriviamo:

```
$table->boolean('corretto')->default(false)
```

avremo una colonna di tipo boolean chiamata *corretto* che di dafault avrà un valore *false*

### Tipi di Colonne

Le colonne di una tabella possono essere di diverso tipo:

* string
* boolean
* integer & bigInteger
* text
* date, datetime & timestamp
* timestamps & softdeletes
