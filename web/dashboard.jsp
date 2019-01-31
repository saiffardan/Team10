<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<!--               vvv This needs to be used in order to have animated and colored progress bars, but interferes with ^^^^
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">-->

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
	
	
    <body onload="testFunction()">
		<div class = "dashbg"></div>
		<div class = "sidebar">
			<h1> Account settings </h1>
			<br>
			<li> Current account: 
                            <% String mail=(String)session.getAttribute("username");
                            out.println(mail);%>
                              </li>
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
                    
                    
                    
                    <%--<%
                                        
                    
                     try{
                /* try{*/     
     
        Date d1 = new Date();
        
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();   
       String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
       Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
       Statement st = conn.createStatement();
               ResultSet rs =  st.executeQuery("SELECT * FROM exam");
               //int x = 0;
               String defaultName = "progBar";
               //String name;  
                 while(rs.next()){
                 //x++;
//                 name = defaultName.concat(Integer.toString(x));   
                 out.println("<li> <a href = 'exam.jsp?folder='>");
       out.println( rs.getString(2)  + " - " + rs.getString(3) + "<br>");
        out.println(" </a> </li>");
                %> --%>
                
        <%
            int x = 0;
            String name = "";
            String defaultName = "progBar";
            ArrayList exams = (ArrayList ) request.getAttribute("examsList");
            if (exams != null)
            {
                for (Object exam : exams) {
                    x++;
                    name = defaultName.concat(Integer.toString(x));
                    out.println("<li> <a href = 'Exam?moduleCode=" + exam.toString().split(" - ")[0] + "' >");
                    out.println(exam.toString());
                    out.println(" </a> </li>");
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
			<!--<a onclick="testFunction()"> <button type="button" class="btn btn-default navbar-btn">Click me</button></a>-->
		</div>


		<div class = "historybox">
			<h1> Admin tools </h1>
			<li> <a href = "accountSetting.jsp"> Account Settings</li>
			<br>
			<li> <a href = "createAccount.jsp">  Create Account</li>
			<br>
			<li> <a href = "exam.jsp">Full Exam listing</li>
			<br>
		</div>
		

		<script>
                    function testFunction() {
                        var i;
                        var stage;
                        // Saif - This is a temporary functionality which shows how progress bars will look like
                        // - A dynamic solution to change more than one progress bar at once
                        for (i = 1; i <= n; i++) { 
                            stage = Math.floor((Math.random() * 4) + 1);
                            if(stage === 1){
                                document.getElementById("progBar" + i).style.width = "25%";
                                document.getElementById("progBar" + i).innerHTML = "Stage 1";
                                document.getElementById("progBar" + i).className = "progress-bar bg-danger progress-bar-striped progress-bar-animated";
                            } else if (stage === 2) {
                                document.getElementById("progBar" + i).style.width = "50%";
                                document.getElementById("progBar" + i).innerHTML = "Stage 2";
                                document.getElementById("progBar" + i).className = "progress-bar bg-warning progress-bar-striped progress-bar-animated";
                            } else if (stage === 3) {
                                document.getElementById("progBar" + i).style.width = "75%";
                                document.getElementById("progBar" + i).innerHTML = "Stage 3";
                                document.getElementById("progBar" + i).className = "progress-bar bg-info progress-bar-striped progress-bar-animated";
                            } else if (stage === 4) {
                                document.getElementById("progBar" + i).style.width = "100%";
                                document.getElementById("progBar" + i).innerHTML = "Stage 4";
                                document.getElementById("progBar" + i).className = "progress-bar bg-success progress-bar-striped progress-bar-animated";
                            }
//                            if(document.getElementById("progBar" + i).style.width === "0%"){
//                                document.getElementById("progBar" + i).style.width = "25%";
//                            }else if(document.getElementById("progBar" + i).style.width === "25%") {
//                                document.getElementById("progBar" + i).style.width = "50%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "50%") {
//                                document.getElementById("progBar" + i).style.width = "75%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "75%") {
//                                document.getElementById("progBar" + i).style.width = "100%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "100%") {
//                                document.getElementById("progBar" + i).style.width = "0%"; 
//                            }
                        }
                    }
		</script>
    </body>
</html>
