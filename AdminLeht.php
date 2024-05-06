<?php
require ('conf2.php');
require ('funct.php');

if (isset($_REQUEST["Saalvesta"])) {
    $korpusValue = isset($_REQUEST["korpus"]) ? ($_REQUEST["korpus"] ? 1 : 0) : 0;
    $kuvarValue = isset($_REQUEST["kuvar"]) ? ($_REQUEST["kuvar"] ? 1 : 0) : 0;
    $pakitudValue = isset($_REQUEST["pakitud"]) ? ($_REQUEST["pakitud"] ? 1 : 0) : 0;

    muuda($_REQUEST["muuda_id"], $korpusValue, $kuvarValue, $pakitudValue);
}
function isAdmin(){
    return  isset($_SESSION['onAdmin']) && $_SESSION['onAdmin'];
}

$arvutid = autoKuvamine();
?>

<!doctype html>
<html lang="et">
<head>
    <link rel="stylesheet" type="text/css" href="ProjCss.css"

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin</title>
</head>
<body>
<div>
<h1>Arvutikomplektid</h1>
<nav>
    <ul>
        <li><a href="haldusleht.php">Kasutaja</a></li>
        <li><a href="AdminLeht.php">Admin</a></li>
        <li id="logout"><a href="logout.php">Logi välja</a></li>
    </ul>
</nav>
<h2>Administreerimis Leht</h2>

<table>
    <tr>
        <th>Id</th>
        <th>Kirjeldus</th>
        <th>Korpus</th>
        <th>Kuvar</th>
        <th>Pakitud</th>
        <th colspan="2">Admin Õigus</th>
    </tr>
    <?php foreach ($arvutid as $arvuti): ?>
        <tr>
            <?php if (!isset($_REQUEST["muutmine"]) || $arvuti->id != intval($_REQUEST["muutmine"])) : ?>
                <td><?= $arvuti->id ?></td>
                <td><?= $arvuti->kirjeldus ?></td>
                <td><?= $arvuti->korpus ? 'Jah' : 'Ei' ?></td>
                <td><?= $arvuti->kuvar ? 'Jah' : 'Ei' ?></td>
                <td><?= $arvuti->pakitud ? 'Jah' : 'Ei' ?></td>
                <td><?= "<a href='AdminLeht.php?muutmine=$arvuti->id'>Muuda</a>" ?></td>
            <?php else: ?>
                <form action="AdminLeht.php">
                    <input type="hidden" name="muuda_id" value="<?= $arvuti->id ?>">
                    <td><?= $arvuti->id ?></td>
                    <td><?= $arvuti->kirjeldus ?></td>
                    <td><input type="checkbox" name="korpus" <?= $arvuti->korpus ? 'checked' : '' ?>></td>
                    <td><input type="checkbox" name="kuvar" <?= $arvuti->kuvar ? 'checked' : '' ?>></td>
                    <td><input type="checkbox" name="pakitud" <?= $arvuti->pakitud ? 'checked' : '' ?>></td>
                    <td><input type='submit' name='Saalvesta' value='Salvesta'></td>
                    <td><input type="button" name="Cancel" value="Cancel" onclick="history.back()"></td>
                </form>
            <?php endif ?>
        </tr>
    <?php endforeach; ?>
</table>
</div>
</body>
</html>
