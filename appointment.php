<?php
$db = new mysqli("localhost", "root", "", "mech");
$appointmentId = $_REQUEST['id'];
$q = $db->prepare("SELECT * FROM appointment WHERE id = ?");
$q->bind_param("i", $appointmentId );
if($q && $q->execute()) {
    $appointment = $q->get_result()->fetch_assoc();
    $appointmentDate  = $appointment['date'];
    $appointmentTimestamp = strtotime($appointmentDate);
    //tylko 1 spotkanie
    echo "Zapisz na usługę w terminie : ".date( "j.m H:i", $appointmentTimestamp)."<br>";
}
if(isset($_REQUEST['marka']) && isset($_REQUEST['rocznik']) && isset($_REQUEST['phone'])){
    $q->prepare("INSERT INTO client VALUES (NULL, ?, ?, ?)");
    $q->bind_param("sss", $_REQUEST['marka'], $_REQUEST['rocznik'], $_REQUEST['phone']);
    $q->execute();
    $clientId = $db->insert_id;
    $q->prepare("INSERT INTO clientappointment VALUES (NULL, ?, ?)");
    $q->bind_param("ii", $appointmentId, $clientId);
    $q->execute();
    echo "Zapisano na usługę";
}else { ?>
  
  <form action="appointment.php">
  MARKA:<input type="text" name="marka">
  ROCZNIK:<input type="text" name="rocznik">
  TELEFON:<input type="text" name="phone">
  <input type="hidden" value = "<?php echo$appointmentId ?>" name="id">
  <input type="submit" value="Zapisz się na usługę">
  </form> 
  <?php 
}
?>

