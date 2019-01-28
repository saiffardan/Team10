<html>
<head></head>
<body>
<?php include("connect/dbconect.php");?>

<?php
	
if(isset($_POST['submit'])){  // to sign up



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



		
}elseif(isset($_POST['button1'])){  // to login 
	
//$email =  $_POST['email'];
//$password =  $_POST['password'];
session_start();
// If form submitted, insert values into the database.
        // removes backslashes
	$email = stripslashes($_REQUEST['email']);
        //escapes special characters in a string
	$email = mysqli_real_escape_string($con,$email);
	$password = stripslashes($_REQUEST['password']);
	$password = mysqli_real_escape_string($con,$password);
	//Checking is user existing in the database or not
        $query = "SELECT * FROM `customer` WHERE email='$email'
and password='".md5($password)."'";
	$result = mysqli_query($con,$query) or die(mysql_error());
	$rows = mysqli_num_rows($result);
        
		
		     if (mysqli_num_rows($result) != 0)
    {
		 $_SESSION['email'] = $email;
		 $_SESSION['clog'] = "clog";
     echo "<script language='javascript' type='text/javascript'> location.href='shop.php' </script>";   
      }
      else
      {
    echo "<script type='text/javascript'>alert('User Name Or Password Invalid!')</script>";
	 echo "<script language='javascript' type='text/javascript'> location.href='login.php' </script>";
    }
		
	
}
?>
</body>
<html>