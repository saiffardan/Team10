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
        <%--<%
            
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
                 
                 %>--%>
                 
        <%
            String email = "";
            String password = "";
            String passwordGuess = (String)request.getAttribute("passwordGuess");
                        
            ArrayList rows = new ArrayList();
            rows = (ArrayList ) request.getAttribute("queryResult");
            if(rows != null)
            {
                for (Object row : rows) {
                    //out.println(row + "<br>");
                    String rowParts[] = row.toString().split(" ");
                    email = rowParts[0];
                    password = rowParts[1];
                }
            }
            
            
                
            if(password.equals(passwordGuess))
            {
               //session.removeAttribure("loginError");
               session.setAttribute("username", email);
               request.setAttribute("loadDashboard", "loadPlease");
               request.removeAttribute("login");
               request.getRequestDispatcher("ExecuteQuery").forward(request, response);
               //response.sendRedirect("dashboard.jsp");
               out.println("we in login.jsp, pass is alright");
               
       
        
               
            }
            else {
                session.setAttribute("loginError", "Invalid username or password, please try again.");
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
