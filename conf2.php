<?php
$kasutaja="tarpv22";
$servernimi="localhost";
$parool="";
$andmebaas="project";
$yhendus = new mysqli($servernimi, $kasutaja, $parool, $andmebaas);
$yhendus->set_charset('UTF8');
?>