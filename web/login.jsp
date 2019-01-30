<%-- 
    Document   : login
    Created on : 22-Jan-2019, 16:02:50
    Author     : Kaloyan
--%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.ResultSet"%>
<% //@ page import="java.sql.setString"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="parts/head.jsp" %>
    </head>
    <body>
        <%
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
             Class.forName("com.mysql.jdbc.Driver").newInstance();   
       String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
       Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
       Statement st = conn.createStatement();
               ResultSet rs =  st.executeQuery("SELECT * FROM users WHERE username='"+username+"' && password='"+password+"'");
               
                //int rowCount = 0;
                //while ( rs.next() )
               // {
                // Process the row.
               // rowCount++;
               rs.next();
                String user = rs.getString(3);
                 String pass = rs.getString(4);
                 String emails = rs.getString(2);
                
                 if(username.equals(user) && password.equals(pass))
                    {
                //session.removeAttribure("loginError");
                session.setAttribute("username", emails);
                response.sendRedirect("dashboard.jsp");
            }
            else {
                session.setAttribute("loginError", "Invalid username or password, please try again.");
                response.sendRedirect("index.jsp");
            }
               

               
           // rs.getString(2); 
            
            //insert Database logic to check if username and password exist.
            
            /*  if((username.equals( rs.getString(2)) && password.equals( rs.getString(2))) ||
            username.equals("ddatanasov@dundee.ac.uk") && password.equals("123")) {*/
            
           
        %>
    </body>
</html>
