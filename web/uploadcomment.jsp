<%-- 
    Document   : uploadcomment
    Created on : 22-Jan-2019, 17:32:40
    Author     : danchoatanasov
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            td, th {
              border: 1px solid #dddddd;
              text-align: left;
              padding: 8px;
            }

            tr:nth-child(even) {
              background-color: #dddddd;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Comment</title>
    </head>
    <body>
         <%
        if(request.getParameter("comment") != null){
            //File creation
            String strPath = "C:/apache-tomcat-8.0.18/tomcat1/webapps/2018-agileteam10/exams/newcomment.txt";
            File strFile = new File(strPath);
            boolean fileCreated = strFile.isFile();
            strFile.createNewFile();
            //File appending
            Writer objWriter = new BufferedWriter(new FileWriter(strFile, true));
            objWriter.write(session.getAttribute("username") + ": ");
            objWriter.write(request.getParameter("comment").toString() + "\r\n");
            objWriter.flush();
            objWriter.close();
        }
        
        %>
        <table>
            <tr>
                <th>Username</th>
                <th>Comment</th>
            </tr>
        <%
            String fileName = "/exams/newcomment.txt";
            InputStream ins = application.getResourceAsStream(fileName);
            try
            {
                if(ins == null)
                {
                    response.setStatus(response.SC_NOT_FOUND);
                }
                else
                {
                    BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
                    String data;
                    while((data= br.readLine())!= null)
                    {
                        out.println("<tr>");
                        String[] parts = data.split(":", 2);
                        for(int i = 0; i < parts.length; i++)
                        {
                            out.println("<td>" + parts[i] + "</td>");
                        }
                        out.println("</tr>");
                    }
                } 
            }
            catch(IOException e)
            {
            out.println(e.getMessage());
            }
        %>
        </table>
        <form action="uploadcomment.jsp" method="POST">
            <textarea name="comment" style="width:300px; height:100px;" placeholder="Leave comment here..."></textarea>
            <br>
            <input type="submit">
        </form>
        <button type="button" onclick="window.location = window.location.href">Reload</button>
    </body>
    
    
   
        

</html>
