<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*,java.util.*"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
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

			System.out.println("Insert complete");
			
			
				// view records
			ResultSet myRs = myStmt.executeQuery("select * from accounts");
			while (myRs.next()) {
				System.out.println(myRs.getString("email") + ", " + myRs.getString("username"));
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>