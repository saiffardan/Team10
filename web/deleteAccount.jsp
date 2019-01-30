<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete User Account</title>
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
        <h2>Delete User Accounts</h2>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                String username = "18agileteam10";
                String password = "7621.at10.1267";
                String query = "SELECT * FROM users";
                Integer n = 0;
                Connection con = DriverManager.getConnection(connName,username,password);
                Statement st = con.createStatement();
                
                if(request.getParameter("Submit") != null) {
                    PreparedStatement ps = null;
                    //PreparedStatement pss = null;
                    String id = request.getParameter("View");
                    String qry = "DELETE u, r FROM users u JOIN roles r ON u.userID = r.userID WHERE u.userID =?";
                   // String qry = "DELETE FROM users WHERE userID =?";
                     //String qrys = "DELETE FROM roles WHERE userID =?";
                    ps = con.prepareStatement(qry);
                    //pss = con.prepareStatement(qrys);
                    ps.setString(1, id);
                    //pss.setString(1, id);
                    ps.executeUpdate();
                    //pss.executeUpdate();
                } else if(request.getParameter("View") != null){    
                    String id = request.getParameter("View");
                    Integer id1 = Integer.parseInt(id);
                    ResultSet rss = st.executeQuery("SELECT * FROM users WHERE userID='"+id1+"'");
                    rss.next();    
        %>
        <form action="deleteAccount.jsp" method="GET">
            <table style="width:30%; " border="1" cellpadding="5" cellspacing="5">
                <tr>
                    <td>UserName</td><td>Password</td><td>Email</td>
                </tr>
                <tr>
                    <td>&nbsp;<%= rss.getString("username") %>&nbsp;</td>
                    <td>&nbsp;<%= rss.getString("password") %>&nbsp;</td>
                    <td>&nbsp;<%= rss.getString("email") %>&nbsp;</td>
                </tr>
                <tr> 
                    <td colspan="3"><input type="hidden" name="View" value="<%=id1%>"><input type="Submit" name="Submit" value="Delete"></td>
                </tr>
            </table>  
        </form>
        <%        
                }
                ResultSet rs = st.executeQuery(query);
                %>
                    <table id="table" border="5" cellpadding="5" cellspacing="5">
                        <tr>
                            <td>&nbsp;ID&nbsp;</td>
                            <td>&nbsp;Username&nbsp;</td>
                            <td>&nbsp;Email&nbsp;</td>
                        </tr>  
                <%
                while(rs.next()){
                    n++;
                    %>
                        <tr>
                            <td>&nbsp;<%= n %>&nbsp;</td>
                            <td><a href="deleteAccount.jsp?View=<%=rs.getString("userID")%>">&nbsp;<%= rs.getString("username") %></a>&nbsp;</td>
                            <td>&nbsp;<%= rs.getString("email") %>&nbsp;</td>
                            </br>
                        </tr>
                    <%
                }
                %>
                    </table>
                <%
            } catch(Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>