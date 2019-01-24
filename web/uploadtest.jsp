<%-- 
    Document   : uploadtest
    Created on : 24-Jan-2019, 19:39:42
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
        <h3>File Upload:</h3>
        Select a file to upload: <br />
        <form action = "UploadServlet" method = "post" enctype = "multipart/form-data">
           <input type = "file" name = "file" size = "50" />
           <br />
           <input type = "submit" value = "Upload File" />
        </form>
    </body>
</html>
