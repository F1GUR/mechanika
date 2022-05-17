<?php

$db = new mysqli("localhost", "root", "", "mech");
$q = $db->prepare("SELECT * FROM offer");
if($q->execute()) {
    $result =$q->get_result();
    while($row = $result->fetch_assoc()) {
        $id = $row['id'];
        $Nazwa = $row['Nazwa'];
        $Cena = $row['Cena'];

        echo "Usługa: $Nazwa $Cena<br>";


    }

} else {
   
 die("Błąd pobierania informacji z bazy");

    
}

?>