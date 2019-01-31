    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>


        <h3>Delete User Accounts</h3>
        
        
        <%
            try {
               Class.forName("com.mysql.jdbc.Driver").newInstance();
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                String username = "18agileteam10";
                String password = "7621.at10.1267";
                
                 Connection conn = DriverManager.getConnection(connName,username,password);
                Statement st = conn.createStatement();
             
               
                
                if(request.getParameter("Submit") != null) {
                    PreparedStatement ps = null;
                    //PreparedStatement pss = null;
                    String id = request.getParameter("View");
                    String qry = "DELETE u, r FROM users u JOIN roles r ON u.userID = r.userID WHERE u.userID =?";
                   // String qry = "DELETE FROM users WHERE userID =?";
                     //String qrys = "DELETE FROM roles WHERE userID =?";
                    ps = conn.prepareStatement(qry);
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
        <form action="accountSetting.jsp?delete" method="GET">
            <table style="width:30%; " border="1" cellpadding="5" cellspacing="5">
                <tr>
                    <th>UserName</th><th>Password</th><th>Email</th>
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

                String query = "SELECT * FROM users";
                Integer n = 0;
                ResultSet rs = st.executeQuery(query);
                %>
                    <table id="table" border="1" cellpadding="5" cellspacing="5" style="width:30%;" >
                        <tr>
                            <th>&nbsp;ID&nbsp;</th>
                            <th>&nbsp;Username&nbsp;</th>
                            <th>&nbsp;Email&nbsp;</th>
                        </tr>  
                <%
                while(rs.next()){
                    n++;
                    %>
                        <tr>
                            <td>&nbsp;<%= n %>&nbsp;</td>
                            <td><a href="accountSetting.jsp?delete=&View=<%=rs.getString("userID")%>">&nbsp;<%= rs.getString("username") %></a>&nbsp;</td>
                            <td>&nbsp;<%= rs.getString("email") %>&nbsp;</td>
                            <br>
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