<%-- 
    Document   : exam
    Created on : 23-Jan-2019, 13:22:20
    Author     : danchoatanasov
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="newpackage.MyExam"%>
<%@page import="java.io.FileReader"%>
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
        <table class="other">
            <%
                String role = (String)request.getAttribute("role");
                String[] titles = {"Module Code", "Module Title", "Author", "Academic Year", "Semester",  "Online or Paper", "Main or Resit", "Undergraduate or Postgraduate", "Progress"};
                String path = "";
                ArrayList list = (ArrayList)request.getAttribute("list");
                for (int i = 0; i < list.size(); i++) {
                    out.println("<tr>");
                    out.println("<td>" + titles[i] + "</td>");
                    out.println("<td>" + list.get(i) + "</td>");
                    out.println("</tr>");
                }
                
                String progress = (String)list.get(list.size() - 1);
                String moduleCode = (String)list.get(0);
                
                path = getServletContext().getRealPath("/") + "/exams/" + list.get(0) + "_" + list.get(3) + "/" + list.get(0);
                
                String pathInfo = path + "-Info.txt";
                String pathDraft = path + "-Draft.txt";
                String pathComments = path + "-Comments.txt";
                String pathSolutions = path + "-Solutions.txt";
                String pathSignature = path + "-Signatures.txt"; 
                
                
            %>
        </table>
        <div class = uploadtable>
            <h4>Upload Draft:</h4>
            Select a file to upload: <br />
            <form action = "UploadServlet" method = "post" enctype = "multipart/form-data">
               <input type="hidden" name="folderpath" value="<%= pathDraft%>">
               <input type = "file" name = "file" size = "50" />
               <br />
               <input type = "submit" value = "Upload File" />
            </form>  
               
        </div>
               <div class = drafttable>
            <h4>Upload Solutions:</h4>
            Select a file to upload: <br />
            <form action = "UploadServlet" method = "post" enctype = "multipart/form-data">
               <input type="hidden" name="folderpath" value="<%= pathSolutions%>">
               <input type = "file" name = "file" size = "50" />
               <br>
               <input type = "submit" value = "Upload File" />
            </form>  
        </div>
               
               
        <div>
            <form action="UpdateProgress" method="post">
                
                <input type="hidden" name="moduleCode" value="<%= moduleCode %>">
            <%
                if(progress.equals("New") && role.equals("exSet")){
                    %>
                    <input type="hidden" name="changeTo" value="Internal Moderation">
                    <input type="submit" value="Send to Internal Moderator"/>
                    <%
                }
                if(progress.equals("Internal Moderation") && role.equals("intMod"))
                {
                    %>
                    <input type="hidden" name="changeTo" value="Exam Vetting">
                    <input type="submit" value="Send to Exam Vetter"/>
                    <%
                }
                if(progress.equals("Exam Vetting") && role.equals("exVet")){
                %>
                    <input type="hidden" name="changeTo" value="External Moderation">
                    <input type="submit" value="Send to External Moderator"/>
                    <%
                }
                if(progress.equals("External Moderation") && role.equals("exMod")){
                %>
                    <input type="hidden" name="changeTo" value="Completed">
                    <input type="submit" value="Mark as Completed"/>
                    <%
                }
                %>
            </form>
             
        </div>
                            
              
               
        <div class = commenttable>
            <table class="comments">
                <tr>
                    <th>Username</th>
                    <th>Comment</th>
                </tr>        
                    <%
                        BufferedReader br = new BufferedReader(new FileReader(pathComments));
                        try {
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
                        }catch(Exception e){
                        e.printStackTrace();
                        } finally {
                            br.close();
                        }
                    %>
            </table>
            
            <form action="PostComment" method="POST">
                <textarea name="comment" style="width:300px; height:100px;" placeholder="Leave comment here..."></textarea>
                <input type="hidden" name="username" value="<%= session.getAttribute("username")%>">
                <input type="hidden" name="role" value="<%= role%>">
                <input type="hidden" name="folderpath" value="<%= pathComments%>">
                <br>
                <input type="submit">
            </form>
            <button type="button" onclick="window.location = window.location.href">Reload</button>
        </div>
                
                <div class = signature>
                    <table class ="signatures">
                        <tr>
                            <th>Signature</th>
                        </tr>
                    </table>
                    
                    <form action="PostComment" method="SIGN">
                        <textarea name="comment" style="width:175px; height:25px;" placeholder="Sign here..."></textarea>
                        <input type="hidden" name="username" value="<%= session.getAttribute("username")%>">
                        <input type="hidden" name="folderpath" value="<%= pathComments%>">
                        <br>
                        <input type="submit">
                    </form>
                        <button type="button" onclick="window.location = window.location.href">Reload</button>
                </div>
                
    </body>
</html>
