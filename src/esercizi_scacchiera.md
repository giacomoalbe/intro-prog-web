# Stampa Scacchiera con Dati Inseriti da Form

- Index: `index.php`

```php
<?php
    if (count($_POST) > 0) {
        foreach($_POST as $chiave => $valore) {
            echo "$chiave => $valore<br>";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <form 
        action="" 
        method="POST">
        <div>
            <label for="numero_righe">
                Numero righe: 
            </label>
            <input 
                id="numero_righe"
                name="numero_righe"
                placeholder="Inserisci numero righe"
                type="number">
        </div>
        <div>
            <label for="numero_colonne">
                Numero colonne: 
            </label>
            <input 
                id="numero_colonne"
                name="numero_colonne"
                placeholder="Inserisci numero colonne"
                type="number">
        </div>
        <div>
            <label for="colore_1">
                Colore 1: 
            </label>
            <input 
                id="colore_1"
                name="colore_1"
                placeholder="Inserisci il colore 1"
                type="text">
        </div>
        <div>
            <label for="colore_2">
                Colore 2: 
            </label>
            <input 
                id="colore_2"
                name="colore_2"
                placeholder="Inserisci colore 2"
                type="text">
        </div>
        <div>
            <input type="submit" value="Inviami">
        </div>
    </form>
</body>
</html>
```

- Scacchiera: `scacchiera.php`

```php
<?php
// Step esercizio: 

// 1. Creare file scacchiera.php
// 2. Definire variabili $righe, $colonne e valorizzarli
// 3. Nell'html creare una table con righe e colonne
//    quante nelle variabili appena definite usando
//    il ciclo FOR nell'HTML (farlo bene!)
//    ATTENZIONE: td per colonne
//                tr per righe
// 4. Creare un tag style nell'head con questa classe:
//    td {
//      width: 40px;
//        height: 40px;
//        background-color: orange;
//}

// Valori di Default
$righe = 8;
$colonne = 8;
$colore1 = "#000000";
$colore2 = "#ffffff";

if (count($_POST) > 0) {
    $righe = $_POST['righe'];
    $colonne = $_POST['colonne'];
    $colore1 = $_POST['colore1'];
    $colore2 = $_POST['colore2'];
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <style>
        td {
            width: 40px;
            height: 40px;
            background-color: orange;
        }

        td.pari {
            background-color: red;
        }

        td.dispari {
            background-color: green;
        }
    </style>
</head>
<body>

    <form action="" method="POST">
        <div>
            <label for="input_righe">Righe: </label>
            <input
                value="<?=$righe?>" 
                min="0" 
                max="100" 
                id="input_righe" 
                type="number" 
                name="righe">
        </div>
        <div>
            <label for="input_colonne">Colonne: </label>
            <input
                value="<?=$colonne?>"  
                min="0" 
                max="100" 
                id="input_colonne" 
                type="number" 
                name="colonne">
        </div>
        <div>
            <label for="input_colore1">Colore1: </label>
            <input
                value="<?=$colore1?>" 
                id="input_color1" 
                type="color" 
                name="colore1">
        </div>
        <div>
            <label for="input_colore2">Colore2: </label>
            <input
                value="<?=$colore2?>" 
                id="input_colore2" 
                type="color" 
                name="colore2">
        </div>
        <div>
            <input 
                type="submit" 
                value="Disegna griglia">
        </div>
    </form>

    <table>
        <?php for($i=0; $i < $righe; $i++) { ?>
        <tr>
            <?php for($j=0; $j < $colonne; $j++) { ?>
                <?php if (($i + $j) % 2 == 0) { ?>
                    <td style="background-color: <?=$colore1?>"></td>
                <?php } else { ?>
                    <td style="background-color: <?=$colore2?>"></td>
                <?php } ?>
            <?php } ?>
        </tr>
        <?php } ?>
    </table>
</body>
</html>
```

