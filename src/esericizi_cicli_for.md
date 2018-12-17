```php
<?php
    // Esercizio 1
    $eroiMarvel = [
        "Thor",
        "Hulk",
        "Spiderman",
        "Venom",
        "Danzi",
        "Blackcat",
    ];

    //sort($eroiMarvel);

    // $poteriEroi = [
    //     "Danzi" => "rompic******i",
    //     "Superman" => "paranoia",
    //     "Spiderman" => "imbrattamuri",
    // ];

    function ordinaArray($arrayDaOrdinare, $ordinamento) {
        if ($ordinamento == "+") {
            sort($arrayDaOrdinare);
        }

        if ($ordinamento == "-") {
            rsort($arrayDaOrdinare);
        }

        return $arrayDaOrdinare;

    }

    $eroiMarvel = ordinaArray($eroiMarvel, "+");

    function stampaRigaAsterischi($n) {
        for ($i=0; $i<$n; $i++) {
            echo "*";
        }
        echo "<br>";
    }

    stampaRigaAsterischi(10);

    // Esercizio 5
    function stampaNRighe($n) {
        for ($i=0; $i<$n; $i++) {
            echo "$i. Adoro il PHP (?)<br>";
        }
    }

    stampaNRighe(5);

    // Esercizio 6 + Esercizio 7
    function stampaRettangolo($b, $h) {
        if ($b > 0 && $h > 0) {
            for ($i=0; $i < $h; $i++) {
                //stampaRigaAsterischi($b);
                for ($j=0; $j < $b; $j++) {
                    echo "*";
                }
                echo "<br>";
            }
        } else {
            echo "Errore! b o h minori di 0<br>";
        }
    }

    stampaRettangolo(10, 7);
    echo "<br><br>";
    stampaRettangolo(2, 2);

    $statiEuropa = [
        "Italy"=>"Rome", 
        "Luxembourg"=>"Luxembourg", 
        "Belgium"=> "Brussels", 
        "Denmark"=>"Copenhagen",
        "Finland"=>"Helsinki",
        "France" => "Paris",
        "Slovakia"=>"Bratislava",
        "Slovenia"=>"Ljubljana",
        "Germany" => "Berlin",
        "Greece" => "Athens",
        "Ireland"=>"Dublin",
        "Netherlands"=>"Amsterdam",
        "Portugal"=>"Lisbon",
        "Spain"=>"Madrid",
        "Sweden"=>"Stockholm",
        "United Kingdom"=>"London",
        "Cyprus"=>"Nicosia",
        "Lithuania"=>"Vilnius",
        "Czech Republic"=>"Prague",
        "Estonia"=>"Tallin",
        "Hungary"=>"Budapest",
        "Latvia"=>"Riga",
        "Malta"=>"Valetta",
        "Austria" => "Vienna",
        "Poland"=>"Warsaw"
    ];


    // Ordina crescente le chiavi
    //ksort($statiEuropa);
    // Ordina decrescente le chiavi
    //krsort($statiEuropa);
    // Ordina crescente i valori
    //asort($statiEuropa);
    // Ordina decrescente i valori
    //arsort($statiEuropa);

    // Esercizio 9

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Esercizi</title>
</head>
<body>
    <table>
        <tr>
            <th>Personaggi</th>
        </tr>
        <?php foreach($eroiMarvel as $chiave => $valore) { ?>
            <tr>
                <td><?=$valore?></td>
            </tr>
        <?php } ?> 
    </table>

    <ul>
        <?php foreach($statiEuropa as $stato => $capitale) { ?>
        <li>
            <b><?=$stato?>:</b>
            <i><?=$capitale?></i>
        </li>
        <?php } ?>
    </ul>


    <table>
        <tbody>
            <?php for ($i=0; $i < 8; $i++) { ?>
            <tr>
                <?php for ($j=0; $j < 8; $j++) { ?>

                <?php //if (($j % 2 == 0 and $i % 2 == 0) or ($j % 2 == 1 and $i % 2 == 1)) { ?>
                <?php if (($i+$j) % 2 == 0) {?>
                <td style="
                    color: white;
                    text-align: center;
                    line-height: 50px;
                    width: 50px; 
                    height: 50px; 
                    background-color: black"
                >
                <?="$i $j"?>
                </td>
                <?php } else { ?>
                <td style="
                    color: black;
                    text-align: center;
                    line-height: 50px;  
                    width: 50px; 
                    height: 50px; 
                    background-color: white"
                >
                <?="$i $j"?>
                </td>
                <?php } ?>
                <?php } ?>
            </tr>
            <?php } ?>
        </tbody>
    </table>

</body>
</html>
```
