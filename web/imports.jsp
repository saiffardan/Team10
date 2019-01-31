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
<%-- 
    Document   : imports
    Created on : 31-Jan-2019, 11:36:33
    Author     : ibrahimmohammed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <%
            if(request.getParameter("create")!= null){
               %>     
                <%@ include file="createAccount.jsp"%>       
               
                <%
                      }
                else
            if(request.getParameter("delete")!= null){
               %>     
                 <%@ include file="deleteAccount.jsp"%>      
               <%
                  }
                else
         if(request.getParameter("assign")!= null){
               %> 
                 <%@ include file="assignRoles.jsp"%>    
                <%
                      }
                else
         if(request.getParameter("modify")!= null){
               %> 
                 <%@ include file="modifyAccount.jsp"%>     
                 
            <% 
            }
            %>
        
        
        
        <h1>Hello World!</h1>
        
        
        
        
        <%
            if(request.getParameter("create")!= null){
               %>     
               <jsp:include page="createAccount.jsp"/>       
               
                <%
                      }
                else
            if(request.getParameter("delete")!= null){
               %>     
                <jsp:include page="deleteAccount.jsp"/>       
               <%
                  }
                else
         if(request.getParameter("assign")!= null){
               %> 
                <jsp:include page="assignRoles.jsp"/>     
                <%
                      }
                else
         if(request.getParameter("modify")!= null){
               %> 
                 <jsp:include page="modifyAccount.jsp"/>     
                 
            <% 
            }
            %>
    </body>
</html>
