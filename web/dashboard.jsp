<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Exam Review System</title>
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		<link href="uploadcss.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="dashboard.jsp">
						<img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
					</a>
				</div>

				Hello cramsay@dundee.ac.uk!

				<a href="logout.jsp"> <button type="button" class="btn btn-default navbar-btn"style="float:right">Logout</button>  </a>
			</div>
		</nav>
        
    </head>
	
	
    <body>
		<div class = "sidebar">
			<h1> Account settings </h1>
			<br>
			<li> Current account:  cramsay@dundee.ac.uk  </li>
			<br>
			<li> Not you? <a href = ""> Switch Account </a>  </li>
			<br>
			<li> <a href = ""> Change Password </a> </li>
			<br>
			<br>
			<h2> Staff Tools </h2>
			<br>
			<li> <a href = "">Exam Progress Tracker</a> </li>
			<br>
			<li> <a href = "">  </a> </li>
			<br>
		</div>
	
		<div class = "exambox">
			<h1> Open Exams: </h1>
	 
			<li> <a href = "exam.jsp"> Example exam </a> </li>
			
			<div class="progress" style="height: 18px;">
				<div id="progBar1" class="progress-bar progress-bar-animated" role="progressbar"  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%" >Example</div>
			</div>
			
			<br>
			<li> <a href = ""> Example exam </a> </li>
			
			<div class="progress" style="height: 18px;">
				<div id="progBar2" class="progress-bar progress-bar-animated" role="progressbar"  aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%" >Example</div>
			</div>
			
			<br>
			<li> <a href = ""> Example exam </a> </li>
			
			<div class="progress" style="height: 18px;">
				<div id="progBar3" class="progress-bar progress-bar-animated" role="progressbar"  aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%" >Example</div>
			</div>
			
			<a href="createexam.jsp"> <button type="button" class="btn btn-default navbar-btn">Upload New</button>  </a>
			<a onclick="testFunction()"> <button type="button" class="btn btn-default navbar-btn">Click me</button></a>
		</div>
	
		<div class = "historybox">
			<h1> Admin tools </h1>
			<li> <a href = "useraccount.jsp"> Account Oversee</li>
			<br>
			<li> <a href = "createAccount.jsp">  Create Account</li>
			<br>
			<li> <a href = "exam.jsp">Full Exam listing</li>
			<br>
		</div>
		
		<script>
			function testFunction() {
				if(document.getElementById("progBar1").style.width >= "25%"){
					document.getElementById("progBar1").style.width = "100%";
					document.getElementById("progBar2").style.width = "100%";
					document.getElementById("progBar3").style.width = "100%";
				} else {
					document.getElementById("progBar1").style.width = "75%";
					document.getElementById("progBar2").style.width = "50%";
					document.getElementById("progBar3").style.width = "25%";
				}
			}
		</script>
		
    </body>
</html>
