<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Create new account</title>

		
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

				<a href="logout.jsp"> <button type="button" class="btn btn-default navbar-btn"style="float:right">Logout</button>  </a>
			</div>
		</nav>
	</head>
	
	<body>
             <%
                  if(request.getParameter("email")!= null){
                      
        String email = request.getParameter("email");   
        String username = request.getParameter("username"); 
        String password = request.getParameter("password"); 
        String role = request.getParameter("role"); 
           
       try{
       Class.forName("com.mysql.jdbc.Driver").newInstance();   
       String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
       Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
       Statement st = conn.createStatement();
       st.executeUpdate("insert into accounts(email,username,password,role)values('"+email+"','"+username+"','"+password+"','"+role+"')");
       out.println("Succcessful");
       }catch(Exception e){
       
       out.println(e);
       }
       
                  }
       %>
                <form method="post" action="createAccount.jsp">
			<table border="5" cellpadding="5" cellspacing="5">
				<tr>
					<td>Enter username: </td>
					<td><input type="text" name="username" size="20" placeholder="ExampleUsername123..."/></td>
				</tr>
				<tr>
					<td>Enter password: </td>
					<td><input type="password" name="password" size="20" placeholder="ExamplePassword123..."/></td>
				</tr>
				<tr>
					<td>Enter email: </td>
					<td><input type="email" name="email" size="20" placeholder="Example@email.com..."/></td>
				</tr>
				<tr>
					<td>Select role: </td>
					<td><select name="role">
						<option value="Teaching Staff">Teaching Staff</option>
						<option value="Internal Moderator">Internal Moderator</option>
						<option value="Exam Vetting Committee">Exam Vetting Committee</option>
						<option value="External Examiner">External Examiner</option>
						<option value="School Office">School Office</option>
						<option value="Admin">Admin</option>
					</select> </td>
				</tr>
				<tr>
					<td><input type="submit" name="B1"/> 
					<input type="reset" name="B2"/></td>
				</tr>
			</table>
		</form>
		<%
			// Read parameters in form and store in strings
			//String username = request.getParameter("username");
			//String password = request.getParameter("password");
			//String email = request.getParameter("email");
			//String role = request.getParameter("role");
			
			// File creation
			//String strPath = "Z:/web/accounts.txt";
                        //FileWriter fw = new FileWriter(strPath, true);
                        //BufferedWriter bw = new BufferedWriter(fw);
                        
			// File appending
                        //bw.write("USERNAME: " + username + ", PASSWORD: " + password + ", EMAIL: " + email + ", ROLE: " + role);
                        //bw.newLine();
                        //bw.close();
		%>
	</body>
</html>