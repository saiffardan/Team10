<?php	

$host = "silva.computing.dundee.ac.uk";
$username = "18agileteam10";
$password = "7621.at10.1267";
$database = "18agileteam10db";




$con = mysqli_connect("$host","$username","$password","$database");

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$email = NULL;
//$result=mysqli_query($con,$sql);
//mysqli_num_rows($result);
// mysqli_error($con);
//mysqli_insert_id($con);



?>