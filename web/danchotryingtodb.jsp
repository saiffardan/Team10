<%-- 
    Document   : danchotryingtodb
    Created on : 23-Jan-2019, 15:42:51
    Author     : danchoatanasov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<!DOCTYPE html>
<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>SELECT Operation</title>
   </head>

   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://silva.computing.dundee.ac.uk"
         user = "18agileteam10"  password = "7621.at10.1267"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from accounts;
      </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th>ID</th>
            <th>email</th>
            <th>username</th>
            <th>pass</th>
            <th>role</th>
            <th>status</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.id}"/></td>
               <td><c:out value = "${row.email}"/></td>
               <td><c:out value = "${row.username}"/></td>
               <td><c:out value = "${row.password}"/></td>
               <td><c:out value = "${row.role}"/></td>
               <td><c:out value = "${row.status}"/></td>
            </tr>
         </c:forEach>
      </table>
 
   </body>
</html>