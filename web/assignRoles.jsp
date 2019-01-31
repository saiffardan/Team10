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
           ///  connect and create statement
           
       Class.forName("com.mysql.jdbc.Driver").newInstance();  
           String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
           Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
           Statement st = conn.createStatement();
       
       
        if(request.getParameter("remove")!= null){ 
            
            
          PreparedStatement pss = null;
         String userid = request.getParameter("userID"); 
        
        String role = request.getParameter("role"); 
 
       String qry = "DELETE FROM roles WHERE userID=? && role=?";
                pss = conn.prepareStatement(qry);
                pss.setString(1, userid);
                pss.setString(2, role);
                int i = pss.executeUpdate();
                if(i > 0){
                    out.println("WORKS!!");
                }else {
                    out.println("NOT!!");
                }    
            
            
        }
       if(request.getParameter("submit")!= null){ //on submit assign role to user 
            
       //st.executeUpdate("insert into users(email,username,password)values('"+username+"','')");
       
        PreparedStatement ps = null;
        //String id = request.getParameter("View");
        String userid = request.getParameter("userID"); 
        
        String role = request.getParameter("role"); 
 
       String qry = "INSERT INTO roles(userID, role)values(?,?)";
                ps = conn.prepareStatement(qry);
                ps.setString(1, userid);
                ps.setString(2, role);
                int i = ps.executeUpdate();
                if(i > 0){
                    out.println("WORKS!!");
                }else {
                    out.println("NOT!!");
                }
       
       
       out.println("Succcessful");
       
       
        }
     
        ////    View users and roles 
        
        ResultSet urs = st.executeQuery("SELECT Distinct u.email, u.username, r.role FROM users u, roles r WHERE r.userID=u.userID");
             %>
			 <div class ="accsetchoice">
               <h3>Users Roles</h3>
                     <table class="table table-striped">
                           <tr>
                            <th>Email</th>
                            <th>Username</th>
                            <th>Role</th>
                            
                        </tr>
                         <%while(urs.next()){%>
                        <tr>
                            <td><%=urs.getString("u.email")%></td>
                            <td><%=urs.getString("u.username")%></td>
                            <td><%=urs.getString("r.role")%></td>
                            
                        </tr>
                                    <% }%>
                     </table>
            <%
                                                    
                                                        
        
        
        
        
        /////////  Role Assign form 
        
        
       
        
                 %>
                 <h3>Assign Roles</h3>
                <form method="post" action="accountSetting.jsp?assign">

											<select class="browser-default custom-select" style="width: 100%;height: 20pt" name="userID" required >
											<option value="" disabled selected>Select username</option>
                                                <% 
                                                     ResultSet rss = st.executeQuery("SELECT * FROM users");
                                                    while(rss.next()){ %>

                                                <option value="<%=rss.getString("userID")%>">
                                                    <%=rss.getString("username")%>
                                                </option>

                                                <% } %>
                                            </select>

				
				
                                
                                
                                     
                    
                                    <select name="role" style="width: 100%;height: 20pt" required> 
                                            <option value="" disabled selected>Select Role</option>
                                            
                                            <option>Teaching Staff</option>
                                            <option>Internal Moderator</option>
                                           <option>Exam Vetting Committee</option>
                                           <option>External Examiner</option>
                                           <option>School Office</option>
                                           <option>Administrator</option>
                                            
                                           
                                        </select>
                                   
                                
                                
									<button type="submit" name="submit" class="btn btn-primary" value="Assign Role">Assign Role</button>
                                    <button type="submit" name="remove" class="btn btn-primary" value="Remove Role">Remove Role</button>
									
									
                                        <input type="hidden" name="userid" value=""/>
                                   
				
			
		</form>
       
      </div>
                                        
       
       
       
       <%
       /////////// Catch Exception 
       
       }catch(Exception e){
       
       out.println(e);
       }
       
       
       %>
       
      