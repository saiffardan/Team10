<%@ page import = "java.io.*,java.util.*" %>

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<h1> yeet </h1>
		
		<div id ="myAlert" class="alert alert-warning" role="alert">
			Issa warning/alert check it out dawg!
		</div>

		<br>

		<button onclick="alertFunction()" type="button" class="btn btn-primary">Click Me</button>
	
		<br>

		<script>
			function alertFunction() {
				if (document.getElementById("myAlert").className == "alert alert-warning"){
					document.getElementById("myAlert").className = "alert alert-secondary";
				}
			}
		</script>

	</body>
</html>