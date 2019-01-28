<%-- 
    Document   : newuser
    Created on : 27-Jan-2019, 16:12:47
    Author     : ibrahimmohammed
--%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
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
       
       
       %>
    </body>
</html>
