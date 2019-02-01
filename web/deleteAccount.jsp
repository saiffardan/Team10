    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>

<div class = "accsetchoice">
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
                    String id = request.getParameter("View");
                    String qry = "DELETE FROM users WHERE userID = " + id;
                    ps = conn.prepareStatement(qry);
                    ps.executeUpdate();
                } else if(request.getParameter("View") != null){    
                    String id = request.getParameter("View");
                    Integer id1 = Integer.parseInt(id);
                    ResultSet rss = st.executeQuery("SELECT * FROM users WHERE userID='"+id1+"'");
                    rss.next();    
        %>
        <form action="accountSetting.jsp?delete=&View=<%=id1%>" method="POST">
            <table class="table table-striped">
                <tr>
                    <th>UserName</th><th>Password</th><th>Email</th>
                </tr>
                <tr>
                    <td>&nbsp;<%= rss.getString("username") %>&nbsp;</td>
                    <td>&nbsp;<%= rss.getString("password") %>&nbsp;</td>
                    <td>&nbsp;<%= rss.getString("email") %>&nbsp;</td>
                </tr>
                <tr> 
                    <td colspan="3"><input type="hidden" name="View" value="<%=id1%>">
                        <input type="Submit" name="Submit" value="Delete"></td>
                </tr>
            </table>  
        </form>
        <% 
                }
                String query = "SELECT * FROM users";
                Integer n = 0;
                ResultSet rs = st.executeQuery(query);
                %>
                    <table class="table table-striped">
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
</div>