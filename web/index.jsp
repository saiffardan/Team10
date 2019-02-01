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
</head>
<body>

    <div class="loginbg">

	</div>
	
	<div class="userpass">
	  <div class="loginerror">
	    <% 
        if(session.getAttribute("loginError") != null) {
            out.println(session.getAttribute("loginError"));
        }
		%>
		</div>
                
                
                
                
	<h1>Welcome! Please log in</h1>
    <form action="Login" method="post">
        <label for="email">Email &emsp;&ensp;&nbsp;:</label>
        <input name="email" type="text">
		<br>
        <label for="password">Password:</label>
        <input name="password" type="password">
		<br>
        <input type="submit" type="button" name= "login" value="Login" class="btn btn-default navbar-btn"</button>
    </form>
	</div>
	
</body>
</html>