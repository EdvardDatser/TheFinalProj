<?php
$kasutaja="d123171_edakarvutid";
$servernimi="localhost";
$parool="";
$andmebaas="arvutid";
$yhendus = new mysqli($servernimi, $kasutaja, $parool, $andmebaas);
$yhendus->set_charset('UTF8');
?>