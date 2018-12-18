# Form & Colori

- Ripasso (index.php): `ripasso.php`

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <form action="color.php" method="POST">
        <label for="input_colore">Colore:</label>
        <input id="input_colore" autofocus type="text" name="colore">
        <input type="submit" value="Cliccami, per piacere">
    </form>

    <form action="color.php" method="GET">
        <label for="input_colore">Colore:</label>
        <input id="input_colore" autofocus type="text" name="colore">
        <input type="submit" value="Cliccami, per piacere">
    </form>
</body>
</html>
```

- Colori: `color.php`

```php
<?php
$colorePluto = "orange";

echo var_dump($_GET) . "<br>";

if (count($_POST) > 0) {
    if (isset($_POST['colore'])) {

        $colorePluto = $_POST['colore'];
        echo "Colore: " . $_POST["colore"] . "<br>";
    }
}

if (count($_GET) > 0) {
    if (isset($_GET['colore'])) {

        $colorePluto = $_GET['colore'];
        echo "Colore: " . $_GET["colore"] . "<br>";
    }
}

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
</head>
<body style="background-color: <?=$colorePluto?>">
</body>
</html>
```

