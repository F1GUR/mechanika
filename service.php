

<?php

use LDAP\Result;

$db = new mysqli("localhost", "root", "", "mech");
$q = $db->prepare("SELECT * FROM offer");
if($q->execute()) {
    $result =$q->get_result();
    while($offer = $result->fetch_assoc()) {
        $offerId = $offer['id'];
        $Nazwa = $offer['Nazwa'];
        $Cena = $offer['Cena'];

        echo "Usługa: $Nazwa $Cena<br>";

        $q = $db->prepare("SELECT * FROM appointment WHERE offer_id = ?");
        $q->bind_param("i", $offerId);
        if($q && $q->execute()){
            $appointments = $q->get_result();
            while($appointment = $appointments->fetch_assoc()){
                $appointmentId = $appointment['id'];
                $appointmentDate = $appointment['date'];
                $appointmentTimestamp = strtotime($appointmentDate);
                echo "<a href=\"appointment.php?id=$appointmentId\"style=\"margin:10px; display:block\">";
                echo date( "j.m H:i", $appointmentTimestamp);
                echo "</a>";
            }
echo "<br>";
        }else{
            die("Błąd pobierania wizyty/terminów z bazy");
        }
    }

} else {
   
 die("Błąd pobierania usług z bazy");

    
}




?>
