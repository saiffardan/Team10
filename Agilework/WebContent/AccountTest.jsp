<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Create Account</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	
		<form name="form1" action="account.php" method="POST">
	
	<input type="text" name="email" placeholder="Email">
				
					
						<input  type="password" name="pass" placeholder="Password">
						
						<input type="text" name="username" placeholder="User Name">
						
						<select type="text" name="role">
						<option>Select User Role</option>
						<option>User Type 1</option>
						<option>User Type 2</option>
						<option>User Type 3</option>
						<option>User Type 4</option>
						
						</select>
					
					<input type="Submit" name="submit" Value="Create" class="login100-form-btn">
		</form>
</body>
</html>