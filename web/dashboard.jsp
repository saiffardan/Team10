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
                    <%
                        File[] files = new File(getServletContext().getRealPath("/").substring(0,2) + "/exams").listFiles();
                        int x = 0;
                        int size = files.length;
                        String defaultName = "progBar";
                        String name;
                        for(File file: files){
                            x++;
                            name = defaultName.concat(Integer.toString(x));
                            if(file.isDirectory()){
                                out.println("<li> <a href = \"exam.jsp?folder=" + file.getName() + "\"> " + file.getName() + " </a> </li>");
					%>
                                        <div class="progress" style="height: 18px;">
                                        <div id="<%=name%>" class="progress-bar progress-bar-animated" role="progressbar"  aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%" >Example</div>
                                        </div>
					<%			
                            }
                            
                          
                        }
                            out.print("<script> var n; n =");
                            out.print(x + "</script>");
                    %>
			
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
                       var i;
                for (i = 1; i <= n; i++) {
                // window.alert("progBar" + i);           
						if(document.getElementById("progBar" + i).style.width === "0%"){
                             document.getElementById("progBar" + i).style.width = "25%";
                        }else if(document.getElementById("progBar" + i).style.width === "25%") {
                           document.getElementById("progBar" + i).style.width = "50%"; 
						   }else if(document.getElementById("progBar" + i).style.width === "50%") {
                           document.getElementById("progBar" + i).style.width = "75%"; 
						   }else if(document.getElementById("progBar" + i).style.width === "75%") {
                           document.getElementById("progBar" + i).style.width = "100%"; 
						   }else if(document.getElementById("progBar" + i).style.width === "100%") {
                           document.getElementById("progBar" + i).style.width = "0%"; 
						}
                        
//                        if(document.getElementById("progBar1").style.width == "0%"){
//                             document.getElementById("progBar1").style.width = "25%";
//                             document.getElementById("progBar2").style.width = "25%";
//                             document.getElementById("progBar3").style.width = "25%";
//                             document.getElementById("progBar4").style.width = "25%";
//                         } else if(document.getElementById("progBar1").style.width == "25%") {
//                             document.getElementById("progBar1").style.width = "50%";
//                             document.getElementById("progBar2").style.width = "50%";
//                             document.getElementById("progBar3").style.width = "50%";
//                             document.getElementById("progBar4").style.width = "50%";
//                         } else if(document.getElementById("progBar1").style.width == "50%") {
//                             document.getElementById("progBar1").style.width = "75%";
//                             document.getElementById("progBar2").style.width = "75%";
//                             document.getElementById("progBar3").style.width = "75%";
//                             document.getElementById("progBar4").style.width = "75%";
//                         } else if(document.getElementById("progBar1").style.width == "75%") {
//                             document.getElementById("progBar1").style.width = "100%";
//                             document.getElementById("progBar2").style.width = "100%";
//                             document.getElementById("progBar3").style.width = "100%";
//                             document.getElementById("progBar4").style.width = "100%";
//                         } else if(document.getElementById("progBar1").style.width == "100%") {
//                             document.getElementById("progBar1").style.width = "0%";
//                             document.getElementById("progBar2").style.width = "0%";
//                             document.getElementById("progBar3").style.width = "0%";
//                             document.getElementById("progBar4").style.width = "0%";
//                         }
                    }
					}
		</script>
		
    </body>
</html>
