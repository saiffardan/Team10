<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,java.util.*"%>
  <%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>





<%
        if(request.getParameter("submit") != null){

        	System.out.print("Welcome Home!!");
String Email=request.getParameter("Email");
String Username=request.getParameter("Username");
String Password=request.getParameter("Password");
String role=request.getParameter("role");
//String email=request.getParameter("email");

try {
	Class.forName("com.mysql.jdbc.Driver");
	//get a connection to database
	Connection myConn = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db", "18agileteam10","7621.at10.1267");
	//create a statement 
	Statement myStmt = myConn.createStatement();

int i=myStmt.executeUpdate("insert into accounts(email,username,password,rolid)values('"+Email+"','"+Username+"','"+Password+"','"+role+"')");
out.println("Data is successfully inserted!");

			out.println("Insert complete");
			
			
				// view records
			ResultSet myRs = myStmt.executeQuery("select * from accounts");
			while (myRs.next()) {
				out.println(myRs.getString("email") + ", " + myRs.getString("username"));
}
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}        
		
        }
        
        %>

<div><form name="formaccounts" action="useraccount.jsp" method="POST">
            Email: <br/>
                <input name="Email" type="text"><br/>
            User Name  : <br/>  <input name="Username" type="text"><br/>
            Password : <br/>   <input name="Password" type="Password"><br/>
            Role : <br/>   <select name="role">
                  <option value="1"> Admin</option>
                   <option value="2"> Teacher</option>
                  <option value="3"> Internal moderator</option>
                    <option value="4"> Exam vetting committee member</option>
                </select><br/> 
                <input type="submit" value="submit">
            </form></div>
</body>
</html>