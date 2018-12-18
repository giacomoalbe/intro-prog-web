# Utenti CRUD

```php
<?php
    $utenti = [
        [
            "id" => 1,
            "nome" => "Giacomo",
            "cognome" => "Alberini",
            "eta" => 25
        ],
        [
            "id" => 2,
            "nome" => "Silvio",
            "cognome" => "Danzi",
            "eta" => 75
        ],
        [
            "id" => 3,
            "nome" => "Terza",
            "cognome" => "CCi",
            "eta" => 10
        ], 
    ];
?>
```

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>CRUD Utenti</h1>
        <div class="row">
            <div class="col">
            <button class="btn btn-primary m-2">Aggiungi Utente</button>
            <table class="table">
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Età</th>
                    <th>Azioni</th>
                </tr>
                <?php foreach($utenti as $utente) { ?>
                <tr>
                    <td><?=$utente['id']?></td>
                    <td><?=$utente['nome']?></td>
                    <td><?=$utente['cognome']?></td>
                    <td><?=$utente['eta']?></td>
                    <td>
                        <button class="btn btn-danger">Modifica</button>
                        <button class="btn btn-warning">Cancella</button>
                    </td>
                </tr>
                <?php } ?>
            </table>
            </div>
        </div>
    </div>
</body>
</html>
```
