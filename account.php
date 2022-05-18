
<?php
if(isset($_REQUEST['action']) && $_REQUEST['action'] == "login") {
	$email = $_REQUEST['email'];
	$password = $_REQUEST['password'];
	
	$email = filter_var($email, FILTER_SANITIZE_EMAIL);
	
	
	$db = new mysqli("localhost", "root", "", "mech");
	
	
	$q = $db->prepare("SELECT * FROM account WHERE email = ? LIMIT 1");
	$q->bind_param("s", $email);
	$q->execute();
	$result = $q->get_result();
	
	
	$userRow = $result->fetch_assoc();
	if($userRow == null) {
		echo "Bledny login lub haslo <br>";
	} else {
		if(password_verify($password, $userRow['passwordHash'])) {
			echo "Zalogowano poprawnie  <br>";
		}	else {
			echo "Bledny login lub haslo <br>";
			
		}
	}
}
if(isset($_REQUEST['action']) && $_REQUEST['action'] == "register")	{
	$db = new mysqli("localhost", "root", "", "mech");
	$email = $_REQUEST['email'];
	$password = $_REQUEST['password'];
	$passwordRepeat = $_REQUEST['passwordRepeat'];

	if($password == $passwordRepeat) {
		$q = $db->prepare("INSERT INTO account VALUES (NULL, ?, ?)");
		$passwordHash = password_hash($password, PASSWORD_ARGON2I);
		$q->bind_param("ss", $email, $passwordHash);
		$result = $q->execute();
		if($result) {
			echo "Konto utworzono poprawnie";
		} else {
			echo "Cos poszlo nie tak";
		}
	} else {

			echo "Hasla nie sa zgodne - sproboj ponownie";
		}
	
}




?>
<h1>Zaloguj sie</h1>
<form action="account.php" method="get">
	<label for="emailInput">Email:</label>	
	<input type="email" name="email" id="emailInput">
	<label for="passwordInput">Haslo:</label>
	<input type="password" name="password" id="passwordInput">
	<input type="hidden" name="action" value="login">
	<input type="submit" value="Zaloguj">
</form>
<h1>Zarejestruj sie</h1>
<form action="account.php" method="post">
	<label for="emailInput">Email:</label>	
	<input type="email" name="email" id="emailInput">
	<label for="passwordInput">Haslo:</label>
	<input type="password" name="password" id="passwordInput">
	<label for="passwordRepeatInput">Haslo ponownie:</label>
	<input type="password" name="passwordRepeat" id="passwordRepeatInput">
	<input type="hidden" name="action" value="register">
	<input type="submit" value="Zarejestruj">
</form>