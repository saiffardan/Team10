<%@ page import = "java.io.*,java.util.*" %>

<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	</head>
	<body>
		<h1> Issa Progress Bar </h1>
		
		<div class="progress">
			<div id="progBar" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"  aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%" ></div>
		</div>

		<br>

		<button onclick="progressFunction()" type="button" class="btn btn-primary">Click Me</button>
	
		<br>

		<script>
			function progressFunction() {
				if (document.getElementById("progBar").style.width == "0%"){
					document.getElementById("progBar").style.width = "25%";
				}
				else if (document.getElementById("progBar").style.width == "25%"){
					document.getElementById("progBar").style.width = "50%";
				}
				else if (document.getElementById("progBar").style.width == "50%") {
					document.getElementById("progBar").style.width = "75%";
				}
				else if (document.getElementById("progBar").style.width == "75%") {
					document.getElementById("progBar").style.width = "100%";
			}
			}
		</script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

	</body>
</html>