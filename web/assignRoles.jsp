<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.Writer"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            try{
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();  
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
                Statement st = conn.createStatement();
       
       
                if(request.getParameter("remove")!= null){ 
                    PreparedStatement pss = null;
                    String username = request.getParameter("username");
                    String examID = request.getParameter("examID");
                    String role = request.getParameter("role"); 

                    String qry = "UPDATE exam SET " + role + " = null WHERE examID = " + examID; 
                    pss = conn.prepareStatement(qry);
                    int i = pss.executeUpdate();
                    if(i > 0){
                        out.println("WORKS!!");
                    }else {
                        out.println("NOT!!");
                    }    
                }
                
                if(request.getParameter("submit")!= null){ //on submit assign role to user
                    
                    PreparedStatement ps = null;
                    //String id = request.getParameter("View");
                    String username = request.getParameter("username"); 
                    String examID = request.getParameter("examID");
                    String role = request.getParameter("role"); 
 
                    String qry = "UPDATE exam SET " + role + " = '" + username + "' WHERE examID = " + examID;
                    out.println(qry);
                    ps = conn.prepareStatement(qry);
                    int i = ps.executeUpdate();
                    if(i > 0){
                        out.println("WORKS!!");
                    }else {
                        out.println("NOT!!");
                    }
                    out.println("Succcessful");
                 }
     
                // View users and roles
                ResultSet urs = st.executeQuery("SELECT moduleTitle, year, intMod, exVet, exMod FROM exam");
        %>
        
	<div class ="accsetchoice">
            <h3>Users Roles</h3>
            <table class="table table-striped">
                <tr>
                    <th>Module Title</th>
                    <th>Year</th>
                    <th>Internal Moderator</th>
                    <th>Exam Vetter</th>
                    <th>External Moderator</th>

                </tr>
                <%while(urs.next()){%>
                <tr>
                    <td><%=urs.getString("moduleTitle")%></td>
                    <td><%=urs.getString("year")%></td>
                    <td><%=(urs.getString("intMod") != null) ? urs.getString("intMod") : " "%></td>
                    <td><%=(urs.getString("exVet") != null) ? urs.getString("exVet") : " "%></td>
                    <td><%=(urs.getString("exMod") != null) ? urs.getString("exMod") : " "%></td>

                </tr>
                <% }%>
            </table>
            
            <h3>Assign Roles</h3>
            <form method="post" action="accountSetting.jsp?assign">
                <select class="browser-default custom-select" style="width: 100%;height: 20pt" name="examID" required >
                    <option value="" disabled selected>Select Exam</option>
                    <% 
                        ResultSet rss = st.executeQuery("SELECT examID, moduleTitle FROM exam");
                        while(rss.next()){ 
                    %>
                    <option value="<%=rss.getString("examID")%>">
                        <%=rss.getString("moduleTitle")%>
                    </option>
                    <% } %>
                </select>

                <select class="browser-default custom-select" style="width: 100%;height: 20pt" name="username" required >
                    <option value="" disabled selected>Select username</option>
                    <% 
                         ResultSet rsss = st.executeQuery("SELECT username FROM users");
                        while(rsss.next()){ %>

                    <option>
                                    <%=rsss.getString("username")%>
                    </option>

                    <% } %>
                </select>
            <select name="role" style="width: 100%;height: 20pt" required> 
                    <option value="" disabled selected>Select Role</option>
                    <option value="intMod">Internal Moderator</option>
                    <option value="exVet">Exam Vetting Committee</option>
                    <option value="exMod">External Moderator</option>
            </select>
                <button type="submit" name="submit" class="btn btn-primary" value="Assign Role">Assign Role</button>
                <button type="submit" name="remove" class="btn btn-primary" value="Remove Role">Remove Role</button>
                 <input type="hidden" name="userid" value=""/>
            </form>
        </div>
                
       <%
       }catch(Exception e){
       
       out.println(e);
       }
       %>
       
      