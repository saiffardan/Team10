<%@ page import = "java.io.*,java.util.*" %>

<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<h1> Testing Alerts </h1>
		
		<div id ="myAlert" class="alert alert-warning" role="alert">
			<p id="sent"> This is a Warning </p>
		</div>

		<br>

		<button onclick="alertFunction()" type="button" class="btn btn-primary">Click Me</button>
	
		<br>
		
		<%
			String path = "C:/Users/saiffardan/Documents/NetBeansProjects/Team10/web/testingSomethinWillDeleteSaif.txt";
                        InputStream ins = application.getResourceAsStream(path);
                        
                        try{
                            if(ins == null){
                                response.setStatus(response.SC_NOT_FOUND);
                            } else {
                                BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
                                String data;
                                while((data= br.readLine())!=null) {
                                    out.println(data+"<br>");
                                }
                            }
                        } catch(IOException e) {
                            out.println(e.getMessage());
                        }
			
		%>

		<script>
			function alertFunction() {
				if (document.getElementById("myAlert").className === "alert alert-warning"){
					document.getElementById("myAlert").className = "alert alert-success";
					document.getElementById("sent").innerHTML = "This is successful";
				} else if (document.getElementById("myAlert").className === "alert alert-success") {
					document.getElementById("myAlert").className = "alert alert-danger";
					document.getElementById("sent").innerHTML = "This is dangerous";
				} else if (document.getElementById("myAlert").className === "alert alert-danger") {
					document.getElementById("myAlert").className = "alert alert-info";
					document.getElementById("sent").innerHTML = "This is information";
				} else if (document.getElementById("myAlert").className === "alert alert-info") {
					document.getElementById("myAlert").className = "alert alert-warning";
					document.getElementById("sent").innerHTML = "This is a Warning";
				}
			}
		</script>

	</body>
</html>