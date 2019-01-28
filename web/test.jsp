<%-- 
    Document   : test
    Created on : 28-Jan-2019, 13:04:22
    Author     : ibrahimmohammed
--%>

<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% try{
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
       Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
       Statement st = conn.createStatement();
       st.executeUpdate("SELECT * FROM account");
       out.println("Succcessful");
       }catch(Exception e){
       
       out.println(e);
       }
       
       
       %>
    </body>
</html>
