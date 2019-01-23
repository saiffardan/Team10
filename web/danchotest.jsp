<%@ page import="myfilespackage.*"%>
<%@ page import = "java.io.*,java.util.*" %>

<html>
   <head>
      <title>HTTP Header Request Example</title>
   </head>

   <body>
       <%
       out.println(TestingSomething.molqte());
       out.println(TestingSomething.readFromFile("fileToBeRead.txt"));
          %>
      <% out.println("heo");
          %>
   
   </body>
</html>