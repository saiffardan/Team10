<%-- 
    Document   : logout
    Created on : 22-Jan-2019, 16:39:53
    Author     : Kaloyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	 <link href="uploadcss.css" rel="stylesheet" type="text/css"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  
    <head>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="index.jsp">
				<img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
		    </a>
				</div>
			</div>
		</nav>
			
			<%@ include file="parts/head.jsp" %>
        <meta http-equiv="Refresh" content="3;url=index.jsp">
    </head>
	
    
        <%
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.invalidate();
        %>
	<body>
	
       <h1> Logout Successful! </h1>
		
    </body>
</html>
