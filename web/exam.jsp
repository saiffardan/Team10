<%-- 
    Document   : exam
    Created on : 23-Jan-2019, 13:22:20
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
        <%@ include file="parts/head.jsp" %>
        <style>
            table.comments {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            .comments td, th {
              border: 1px solid #dddddd;
              text-align: left;
              padding: 8px;
            }

            .comments tr:nth-child(even) {
              background-color: #dddddd;
            }
        </style>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
       
        <table class="other">
            <tr>
                <td>Module Code</td>
                <td>AC123</td>
            </tr>
            <tr>
                <td>Module Title</td>
                <td>Games Programming</td>
            </tr>
            <tr>
                <td>Author</td>
                <td>DDA</td>
            </tr>
            <tr>
                <td>Academic Year</td>
                <td>2018/2019</td>
            </tr>
            <tr>
                <td>Online or Paper</td>
                <td>Online</td>
            </tr>
            <tr>
                <td>Main or Resit</td>
                <td>Main</td>
            </tr>
            <tr>
                <td>Undergraduate or Postgraduate</td>
                <td>Postgraduate</td>
            </tr>
            <tr>
                <td>Progress</td>
                <td>In progress</td>
            </tr>
        </table>
        
        <table class="comments">
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
        <form action="exam.jsp" method="POST">
            <textarea name="comment" style="width:300px; height:100px;" placeholder="Leave comment here..."></textarea>
            <br>
            <input type="submit">
        </form>
        <button type="button" onclick="window.location = window.location.href">Reload</button>
        
        <div class= "upload">
            <p>filename.txt</p>
            <button type="button" class="btn btn-primary">Upload</button>
        </div>
    </body>
</html>
