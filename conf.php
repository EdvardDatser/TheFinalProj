<?php
$kasutaja="d123171_edakarvutid";
$servernimi="d123171.mysql.zonevs.eu";
$parool="qwertysoloezgg";
$andmebaas="d123171_arvutitellimused";
$yhendus = new mysqli($servernimi, $kasutaja, $parool, $andmebaas);
$yhendus->set_charset('UTF8');
?>