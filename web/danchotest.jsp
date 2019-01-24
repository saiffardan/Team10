<%@ page import="myfilespackage.*"%>
<%@ page import = "java.io.*,java.util.*" %>

<html>
   <head>
      <title>HTTP Header Request Example</title>
   </head>

   <body>
       <p>Helloooo</p>
       <form action="danchoservlet2" method="post">
        First name: <input type="text" name="fname"><br>
        <input type="submit" value="Submit">
      </form>
   </body>
</html>