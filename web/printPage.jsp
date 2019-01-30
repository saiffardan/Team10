<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <title> Print Button </title>
        
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="favicon.ico" type="image/x-icon">
	<link href="uploadcss.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="dashboard.jsp">
                        <img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
                    </a>
                </div>
                <a href="logout.jsp"> <button type="button" class="btn btn-default navbar-btn"style="float:right">Logout</button>  </a>
            </div>
	</nav>
</head>
<body>
    <button onclick="window.print()" type="submit" value="print">Click Me</button>
</body>