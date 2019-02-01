
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<div class="accsetchoice">
 <h3>Modify User Record</h3>
 <%        
          try{ Class.forName("com.mysql.jdbc.Driver").newInstance();
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
                    String qry = "UPDATE users SET username = '" + user + "', password = '" + pass + "', email = '" + mail + "' WHERE userID = " + id;
                    ps = conn.prepareStatement(qry);
                    int i = ps.executeUpdate();
                    if(i > 0){
                        out.println("WORKS!!");
                    }else {
                        out.println("NOT!!");
                    }
                }

            if(request.getParameter("View")!= null){
                String id = request.getParameter("View");
                Integer id1 = Integer.parseInt(id);
                ResultSet rss = st.executeQuery("SELECT * FROM users WHERE userID='"+id1+"'");
                rss.next();    
        %>
       
       <table class="table table-striped">
            <tr>
                <th>UserName</th><th>Password</th><th>Email</th>
            </tr>
            <tr>
            <td>&nbsp;<%= rss.getString("username") %>&nbsp;</td>
            <td>&nbsp;<%= rss.getString("password") %>&nbsp;</td>
            <td>&nbsp;<%= rss.getString("email") %>&nbsp;</td>
            </tr>
        </table>
        <form name="forms" action="accountSetting.jsp?modify=&View=<%=id1%>" method="POST">
            <table class="table table-striped">
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
                    <td colspan="2"><input type="hidden" name="View" value="<%=id1%>">
                    <input type="Submit" name="Submit" value="Modify"></td>
                </tr>
            </table>
        </form>

                      
        <%        
            }
        %>
        <table class="table table-striped">
            <tr>
                <th>&nbsp;ID&nbsp;</th>
                <th>&nbsp;Username&nbsp;</th>
                <th>&nbsp;Email&nbsp;</th>
            </tr>                    
        <%
            String query = "SELECT * FROM users";
            ResultSet rs = st.executeQuery(query);
            Integer n = 0;
            while(rs.next()) {
                n++;
                
        %>
                <tr>
                    <td>&nbsp;<%= n %>&nbsp;</td>
                    <td><a href="accountSetting.jsp?modify=&View=<%=rs.getString("userID")%>">&nbsp;<%= rs.getString("username") %></a>&nbsp;</td>
                    <td>&nbsp;<%= rs.getString("email") %>&nbsp;</td>
                    <br/>
                </tr>
        <%
            }
        %>     
        </table>
		</div>
        <%
            } catch(Exception e) {
                out.println(e);
            }
        %>