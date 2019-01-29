
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


    <head>
        <title> Modify Accounts </title>
        
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
               
                  
                  
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                String username = "18agileteam10";
                String password = "7621.at10.1267";
               
                Connection conn = DriverManager.getConnection(connName,username,password);
                Statement st = conn.createStatement();
               
                
 if(request.getParameter("Submit")!= null){
    PreparedStatement ps = null;
 
    String id = request.getParameter("View");
    String pass = request.getParameter("password");
    String user = request.getParameter("username");
    String mail = request.getParameter("email");
//Integer id = Integer.parseInt(idd);
      String qry = "Update accounts set username=?, password=?, email=? where id="+id;
      ps = conn.prepareStatement(qry);
     // ps.setString(1, id);
      ps.setString(3, mail);
      ps.setString(1, user);
      ps.setString(2, pass);
      int i = ps.executeUpdate();
      if(i > 0){
          out.println("WORKS!!");
      }else {
          out.println("NOT!!");
      }
      // execute the java preparedstatement
     // preparedStmt.executeUpdate();
     
     
}


if(request.getParameter("View")!= null){
  //Connection conn = DriverManager.getConnection(connName,username,password);
 String id = request.getParameter("View");
 Integer id1 = Integer.parseInt(id);
 //Statement stt = conn.createStatement();
//String querys = ;
ResultSet rss = st.executeQuery("SELECT * FROM accounts WHERE id='"+id1+"'");
rss.next();    
%>
<h2>Modify User Record</h2>
<table style="width:30%; " border="1" cellpadding="5" cellspacing="5">
    <tr><td>UserName</td><td>Password</td><td>Email</td></tr>
    <tr>
        <td>&nbsp;<%= rss.getString("username") %>&nbsp;</td>
        <td>&nbsp;<%= rss.getString("password") %>&nbsp;</td>
        <td>&nbsp;<%= rss.getString("email") %>&nbsp;</td>
    </tr>
</table>
    <form name="forms" action="modifyAccount.jsp" method="GET">
<table>
    <tr>
        <td>Username</td>
        <td><input type="text" name="username" value="" placeholder="Enter New Username" required="required"></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><input type="text" name="password" value="" placeholder="Enter New Password" required="required"></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><input type="text" name="email" value="" placeholder="Enter New Email" required="required"></td>
    </tr>
    <tr>
        <td colspan="2"><input type="hidden" name="View" value="<%=id1%>"><input type="Submit" name="Submit" value="Modify"></td>
    </tr>
    
    
</table>

</form>

                      
           <% //out.println("Working fine !!!");          
                      
                      
                  }
                       
                  
                %>
                    <table id="table" border="5" cellpadding="5" cellspacing="5">
                        <tr>
                            <td>&nbsp;ID&nbsp;</td>
                            <td>&nbsp;Username&nbsp;</td>
                            <td>&nbsp;Email&nbsp;</td>
                        </tr>                    
                <%
                     String query = "SELECT * FROM accounts";
                      ResultSet rs = st.executeQuery(query);
                Integer n=0;
                while(rs.next()) {
                    n++;
                
                    %>
                        <tr>
                            <td>&nbsp;<%= n %>&nbsp;</td>
                            <td><a href="modifyAccount.jsp?View=<%=rs.getString("id")%>">&nbsp;<%= rs.getString("username") %></a>&nbsp;</td>
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
