<%-- 
    Document   : testCallingServlets
    Created on : 28-Jan-2019, 15:38:00
    Author     : danchoatanasov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World123!</h1>
        <form action="DanchoTestServlet2" method="POST">
                <input type="text" name="text">
                <br>
                <input type="submit">
            </form>
    </body>
</html>
