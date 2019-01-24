<%-- 
    Document   : useraccount
    Created on : 24-Jan-2019, 13:47:40
    Author     : ibrahimmohammed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@page import="java.sql.Connection"%>
      <%@page import="java.sql.DriverManager"%>
   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
	DbManager db = new DbManager();
	Connection conn = db.getConnection();
	if(conn == null){
		out.print("connection failed");
		
	}else{
		out.print("connection failed");	
	}
%>
    </body>
</html>
