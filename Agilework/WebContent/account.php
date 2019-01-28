<html>
<head></head>
<body>
<?php require("connect/dbconect.php");
echo "";
?>

<?php
	echo "Doood";
if(isset($_POST['button1'])){  // to sign up



	//$trn_date = date("Y-m-d H:i:s");
$username = stripslashes($_REQUEST['username']);
$username = mysqli_real_escape_string($con,$username);

$role = stripslashes($_REQUEST['role']);
$role = mysqli_real_escape_string($con,$role);

$email =  stripslashes($_REQUEST['email']);
$email =  mysqli_real_escape_string($con,$email);

$password = stripslashes($_REQUEST['password']);
$password =  mysqli_real_escape_string($con,$password);


$adid = mysqli_insert_id($con);
 
 $sql2 ="INSERT INTO account (email, password, username, role ) 
 VALUE ('$email', '$password', '$username', '$role')";
 
 //, '$phone', '".md5($password)."'
 
$result=mysqli_query($con,$sql2) or die(mysqli_error($con));


}
?>
</body>
<html>