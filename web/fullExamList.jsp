<%-- 
    Document   : fullExamList
    Created on : 01-Feb-2019, 14:54:49
    Author     : saiffardan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="parts/head.jsp" %>
        <style>
            .saiftable {
                position: left;
            }
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
                <a href="Dashboard">
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
        <div class = "saiftable">
        <table class="comments">
            <tr>
                <th>examID</th>
                <th>moduleTitle</th>
                <th>moduleCode</th>
                <th>author</th>
                <th>semester</th>
                <th>year</th>
                <th>examType</th>
                <th>level</th>
                <th>paperType</th>
                <th>date</th>
                <th>intMod</th>
                <th>exVet</th>
                <th>exMod</th>
                <th>status</th>
            </tr>
        
        <%
            String redirectTo = "dashboard.jsp";
            String query = "SELECT * from exam";
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;
            ArrayList exams = new ArrayList();
            String examName = "";
            
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();   
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
                st = conn.createStatement();
                rs =  st.executeQuery(query);
                while(rs.next())
                {
                    out.println("<tr>");
                    for (int i = 1; i <= 14; i++) {
                            out.println("<td>");
                            out.println(rs.getString(i));
                            out.println("</td>");
                        }
                    out.println("</tr>");
                }
                
            } catch (Exception e) {
                out.println(e);
            }
            
            %>
            </table>
        </div>
    </body>
</html>
