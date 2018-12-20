# Utenti CRUD con Edit

* Lista Utenti: `index.php`
```php
<?php
    $connection = mysqli_connect("localhost", "root", "", "kusf");

    $rsUtenti = mysqli_query($connection, "SELECT * FROM utenti");
    $utenti = mysqli_fetch_all($rsUtenti, MYSQLI_ASSOC);

    mysqli_close($connection);
?>
```
```php
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
            <a href="addUtente.php" class="btn btn-primary m-2">Aggiungi Utente</a>
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
                    <td><?=$utente['ID']?></td>
                    <td><?=$utente['NOME']?></td>
                    <td><?=$utente['COGNOME']?></td>
                    <td><?=$utente['ETA']?></td>
                    <td>
                        <a href="editUtente.php?ID=<?=$utente['ID']?>" class="btn btn-danger">Modifica</a>
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

* Aggiungi Utente: `addUtente.php`

```php
<?php

// Controllare che ci sia qualcosa in POST
if (count($_POST)) {
    // Aggiungere utente da dati POST in DB

    // Connessione al DB
    $connection = mysqli_connect("localhost", "root", "", "kusf");

    $nome = $_POST['nome'];
    $cognome = $_POST['cognome'];
    $eta = $_POST['eta'];

    $sqlAddUser = "
        INSERT INTO utenti
        (nome, cognome, eta)
        VALUES
        ('$nome', '$cognome', '$eta')
    ";

    $result = mysqli_query($connection, $sqlAddUser);

    if ($result) {
        mysqli_close($connection);

        header("Location: index.php");
        die();
        
    } else {
        echo var_dump(mysqli_error($connection));
    }

}


// Trick per tornare all'index

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Aggiungi Utente</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Aggiungi Utente</h1>
        <form action="" method="POST">
            <div class="form-group">
                <label for="">Nome:</label>
                <input name="nome" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="">Cognome:</label>
                <input name="cognome" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="">Età:</label>
                <input name="eta" class="form-control" type="number">
            </div>
            <div>
                <a href="." class="btn">Indietro</a>
                <input class="btn btn-primary" type="submit" value="Crea Utente">
            </div>
        </form>
    </div>
</body>
</html>
```

* Modifica Utente: `editUtente.php`

```php
<?php

if (isset($_GET['ID'])) {
    $userIdToEdit = $_GET['ID'];

    $connection = mysqli_connect("localhost", "root", "", "kusf");

    $sqlGetUser = "SELECT * FROM utenti WHERE ID = $userIdToEdit";
    $rsUtente = mysqli_query($connection, $sqlGetUser);

    $utente = mysqli_fetch_assoc($rsUtente);

    mysqli_close($connection);
}

// Controllare che ci sia qualcosa in POST
if (count($_POST)) {
    // Aggiungere utente da dati POST in DB

    // Connessione al DB
    $connection = mysqli_connect("localhost", "root", "", "kusf");

    $nome = $_POST['nome'];
    $cognome = $_POST['cognome'];
    $eta = $_POST['eta'];
    $id = $_POST['ID'];

    $sqlEditUser = "
        UPDATE utenti
        SET
        nome='$nome',
        cognome='$cognome',
        eta=$eta
        WHERE ID = $id
    ";

    $result = mysqli_query($connection, $sqlEditUser);

    if ($result) {
        mysqli_close($connection);

        header("Location: index.php");
        die();
        
    } else {
        echo var_dump(mysqli_error($connection));
    }

}


// Trick per tornare all'index

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Aggiungi Utente</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Modifica Utente con ID <?=$userIdToEdit?></h1>
        <form action="" method="POST">
            <div class="form-group">
                <label for="">Nome:</label>
                <input name="nome" class="form-control" value="<?=$utente['NOME']?>" type="text">
            </div>
            <div class="form-group">
                <label for="">Cognome:</label>
                <input value="<?=$utente['COGNOME']?>" name="cognome" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="">Età:</label>
                <input value="<?=$utente['ETA']?>" name="eta" class="form-control" type="number">
            </div>
            <div>
                <a href="." class="btn">Indietro</a>
                <input type="hidden" name="ID" value="<?=$userIdToEdit?>">
                <input class="btn btn-primary" type="submit" value="Salva Utente">
            </div>
        </form>
    </div>
</body>
</html>
```
