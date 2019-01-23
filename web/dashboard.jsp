<%-- 
    Document   : dashboard
    Created on : 22-Jan-2019, 16:12:44
    Author     : Kaloyan
--%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="parts/head.jsp" %>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
			<a href="dashboard.jsp">
				<img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
		    </a>
			</div>

        <%
            String name=session.getAttribute("username").toString();
            out.println("Hello "+ name + "!");
        %>

 <a href="logout.jsp"> <button type="button" class="btn btn-default navbar-btn"style="float:right">Logout</button>  </a>
		</div>
	</nav>
        
    </head>
	
	
    <body>
	<div class = "exambox">
	 <h1> Open Exams: </h1>
	 
	<li> <a href = ""> Example exam </a> </li>
	 <br>
	<li> <a href = ""> Example exam </a> </li>
	 <br>
	<li> <a href = ""> Example exam </a> </li>
	<a href="createexam.jsp"> <button type="button" class="btn btn-default navbar-btn">Upload New</button>  </a>
	</div>

    </body>
</html>
