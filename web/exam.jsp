<%-- 
    Document   : exam
    Created on : 23-Jan-2019, 13:22:20
    Author     : danchoatanasov
--%>
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
                String folder = request.getParameter("folder").toString();
                String[] titles = {"Module Code", "Module Title", "Author", "Academic Year", "Semester",  "Online or Paper", "Main or Resit", "Undergraduate or Postgraduate", "Progress"};
                String path = "";
                if(getServletContext().getRealPath("/").lastIndexOf("\\build\\web") > 0)
                {
                    path = getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").lastIndexOf("\\build\\web")) + "/exams/" + folder + "/" + folder.split("_")[0];
                }
                else
                {
                    path = getServletContext().getRealPath("/") + "/exams/" + folder + "/" + folder.split("_")[0];
                }
                String pathInfo = path + "-Info.txt";
                String pathDraft = path + "-Draft.txt";
                String pathComments = path + "-Comments.txt";
                String pathSolutions = path + "-Solutions.txt";
                //String path = getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").lastIndexOf("\\build\\web")) + "/exams/" + folder + "/" + folder.split("_")[0] + "-Info.txt";
                BufferedReader br1 = new BufferedReader(new FileReader(pathInfo));
                try {
                    String data;
                    int counter = 0;
                        while((data= br1.readLine())!= null)
                        {
                            out.println("<tr>");
                            out.println("<td>" + titles[counter] + "</td>");
                            counter++;
                            out.println("<td>" + data + "</td>");
                            out.println("</tr>");
                        }
                }catch(Exception e){
                e.printStackTrace();
                } finally {
                    br1.close();
                }
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
               <div class = uploadtable>
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
                    <button>Send For Internal Moderation</button>
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
                <input type="hidden" name="modulecode" value="<%= folder%>">
                <input type="hidden" name="folderpath" value="<%= pathComments%>">
                <br>
                <input type="submit">
            </form>
            <button type="button" onclick="window.location = window.location.href">Reload</button>
        </div>
    </body>
</html>
