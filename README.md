# Arvutikomplektid Read Me
## Sisukord
1. [Projekti kohta](https://github.com/EdvardDatser/TheFinalProj/tree/main#projekti-kohta)
2. [Registreerimine](https://github.com/EdvardDatser/TheFinalProj/tree/main#registreerimine)
3. [Sissepääs](https://github.com/EdvardDatser/TheFinalProj/tree/main#logi-sisse)
4. [Lehed](https://github.com/EdvardDatser/TheFinalProj/tree/main#lehed)
     * [Kasutaja Leht](https://github.com/EdvardDatser/TheFinalProj/tree/main#kasutaja-leht)
     * [Admin Leht](https://github.com/EdvardDatser/TheFinalProj/tree/main#kasutaja-leht)
5. [Logi välja](https://github.com/EdvardDatser/TheFinalProj/tree/main#kasutaja-välja-logimine)
6. [Koduleht](https://edvarddatser22.thkit.ee/Php/TheFinalProj/ControllPage.php)
7. [Ülesanded](https://github.com/EdvardDatser/TheFinalProj/edit/main/README.md#%C3%BClesanded)

## Projekti kohta

Sellel saidil olen loonud lihtsa "internetipoe" arvutikomponentide tellimiseks . Siin saavad kasutajad täita soovitud tellimusi ja administratsioon omakorda haldab tellimusi.

![image](https://github.com/EdvardDatser/TheFinalProj/assets/120181268/7a26896b-9fb1-421e-9a2f-c5a9cdb89c5e)

## Registreerimine

Registreerimiseks kasutasin PHP koodi, mis lisab kasutaja andmebaasi. Kõigile kasutajatele on vaikimisi määratud tavakasutaja roll.

![image](https://github.com/EdvardDatser/TheFinalProj/assets/120181268/555288b9-9c32-4e1c-9779-cc371b799560)

### Kood:
```
global $yhendus;
if (!empty($_POST['login']) && !empty($_POST['pass'])) {

 $login = htmlspecialchars(trim($_POST['login']));
 $pass = htmlspecialchars(trim($_POST['pass']));


 $cool = 'superpaev';
 $kryp = crypt($pass, $cool);


 $kask2 = $yhendus->prepare("INSERT INTO kasutaja (kasutaja, parool) VALUES (?, ?)");
 $kask2->bind_param("ss", $login, $kryp);
 $kask2->execute();
     
 echo '<script>alert("Registreerimine õnnestus!"); window.location.href = "login.php";</script>';

 $kask2->close();
 $yhendus->close();
 exit();
}
```

## Sissepääs

Kirjutasin sisselogimiseks PHP koodi, mis kontrollib, kas sisselogimine ja parool on õigesti sisestatud, samuti Administraatori õiguste olemasolu.

![image](https://github.com/EdvardDatser/TheFinalProj/assets/120181268/1fbc8f79-5265-4585-9e94-1a24ce74ef4c)

### Kood:
```
if (!empty($_POST['login']) && !empty($_POST['pass'])) {

    $login = htmlspecialchars(trim($_POST['login']));
    $pass = htmlspecialchars(trim($_POST['pass']));

    $cool='superpaev';
    $kryp = crypt($pass, $cool);

    $kask=$yhendus-> prepare("SELECT kasutaja, onAdmin FROM kasutaja WHERE kasutaja=? AND parool=?");
    $kask->bind_param("ss", $login, $kryp);
    $kask->bind_result($kasutaja, $onAdmin);
    $kask->execute();

    if ($kask->fetch()) {
        $_SESSION['tuvastamine'] = 'misiganes';
        $_SESSION['kasutaja'] = $login;
        $_SESSION['onAdmin'] = $onAdmin;
        if($onAdmin == 1){
            echo '<script>window.location.href = "AdminLeht.php";</script>';
        }
        else {
            echo '<script>window.location.href = "haldusleht.php";</script>';
            exit();
        }

    }
    else {
        echo "kasutaja $login või parool $kryp on vale";
        $yhendus->close();
    }
}
```
## Lehed

### Kasutaja Leht

Sellel lehel on võimalus tellida arvutikomponente. Selleks tuleb -> sisestada vajalike komponentide kirjeldused ja need seejärel salvestada.

![image](https://github.com/EdvardDatser/TheFinalProj/assets/120181268/aee114ab-e5c5-4f96-a44a-39d8c32bb449)


### Admin Leht

Administraatori lehel on mitmeid võimalusi.

* Võimalus muuta tellimuste staatust
* Vaata kõiki tellimusi


![image](https://github.com/EdvardDatser/TheFinalProj/assets/120181268/1963c563-6a60-4721-9775-c2cad29ef032)

![image](https://github.com/EdvardDatser/TheFinalProj/assets/120181268/807305f0-f36c-4c7d-8593-3fe62fa35587)

## Kasutaja välja logimine
Kui kasutaja on teinud kõik, mida ta soovib teha, saab ta klõpsata väljumisnuppu või sulgeda brauseri vahekaardi.

![image](https://github.com/EdvardDatser/TheFinalProj/assets/120181268/c0959790-5dab-4adb-b6c5-2ba092fc7d99)

## Koduleht

[Click!](https://edvarddatser22.thkit.ee/Php/TheFinalProj/ControllPage.php)

## Ülesanded

1. Muutke failis "LogReg.ccs" olevate nuppude värvus mis tahes muu värviga.
2. Lisage faili "ControlPage.php" pilt.
3. Lisage "<div>" element, mis kirjeldab vormi failis "haldusleht.php".
4. Muutke päise värvi failis "ProjCss.css".
5. Tõlgi vorm saksa keelde failis "haldusleht.php".
6. Lisage vormi kirjeldav "<div>" element failis "AdminLeht.php".




