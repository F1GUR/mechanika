<?php
$db = new mysqli("localhost", "root", "", "mech");

$q = $db->prepare("SELECT client.id, client.marka, client.rocznik, client.phone, appointment.date, offer.Nazwa, offer.Cena 
FROM `client` 
LEFT JOIN clientappointment on client.id = clientappointment.client_id 
LEFT JOIN appointment on clientappointment.appointment_id = appointment.id 
LEFT JOIN offer on offer.id = appointment.offer_id

WHERE appointment.date IS NOT NULL ORDER BY client.id ASC ; 
                ");
$q->execute();
$clients = $q->get_result();
while($client = $clients->fetch_assoc()) {
    $clientId = $client['id'];
    $clientPhone = $client['phone'];
    $clientMarka = $client['marka'];
    $clientdate = $client['date'];
    $clientrocznik = $client['rocznik'];
    $clientnazwa = $client['Nazwa'];
    $clientcena = $client['Cena'];
    echo "<a>";
    echo "$clientId $clientMarka $clientrocznik $clientPhone $clientdate $clientnazwa $clientcena<br>";
    echo "</a>";
}
?>