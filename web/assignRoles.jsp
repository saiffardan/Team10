<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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

<!DOCTYPE html>
<html>
	<head>
		<title>Create new account</title>

		
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		<link href="uploadcss.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="dashboard.jsp">
						<img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
					</a>
				</div>

				<a href="logout.jsp"> <button type="button" class="btn btn-default navbar-btn"style="float:right">Logout</button>  </a>
			</div>
		</nav>
	</head>
	
	<body>
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
               <h3>Users Roles</h3>
                     <table border="1" cellpadding="" cellspacing="5" width="20%">
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
                <form method="post" action="assignRoles.jsp">
			<table border="1" cellpadding="" cellspacing="5" width="20%">
				<tr>
					
					<td>
                                            <select name="userID" style="width: 300pt; height: 20pt" required > 
                                                <option value="" disabled selected>Select username</option>
                                                <% 
                                                     ResultSet rss = st.executeQuery("SELECT * FROM users");
                                                    while(rss.next()){ %>

                                                <option value="<%=rss.getString("userID")%>">
                                                    <%=rss.getString("username")%>
                                                </option>

                                                <% } %>
                                            </select>
                                        </td>
				</tr>
				
                                
                                <tr>
                                     
                    
                                    <td><select name="role" style="width: 300pt;height: 20pt" required> 
                                            <option value="" disabled selected>Select Role</option>
                                            
                                            <option>Teaching Staff</option>
                                            <option>Internal Moderator</option>
                                           <option>Exam Vetting Committee</option>
                                           <option>External Examiner</option>
                                           <option>School Office</option>
                                           <option>Administrator</option>
                                            
                                           
                                        </select>
                                    </td>
                                </tr>
                                
				<tr>
                                    <td><input type="submit" name="submit" value="Assign Role"/> 
                                        <input type="submit" name="remove" value="Remove Role"/> 
                                        <input type="hidden" name="userid" value=""/>
                                    </td>
				</tr>
			</table>
		</form>
       
      
                                        
       
       
       
       <%
       /////////// Catch Exception 
       
       }catch(Exception e){
       
       out.println(e);
       }
       
                  
                  
 
       %>
       
      
	</body>
</html>