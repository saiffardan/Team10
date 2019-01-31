<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>

<h3>Create Account</h3>
             <%
                  if(request.getParameter("email")!= null){
                      
        String email = request.getParameter("email");   
        String username = request.getParameter("username"); 
        String password = request.getParameter("password"); 
        String role = request.getParameter("role"); 
           
       try{
       Class.forName("com.mysql.jdbc.Driver").newInstance();   
       
      String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
       Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
       Statement st = conn.createStatement();
       st.executeUpdate("insert into users(email,username,password)values('"+email+"','"+username+"','"+password+"')");
       out.println("Succcessful");
       }catch(Exception e){
       
       out.println(e);
       }
       
                  }
       %>
                <form method="post" action="accountSetting.jsp?create">
			<table border="1" cellpadding="5" cellspacing="5" style="width:30%;" >
				<tr>
					<td>Enter username: </td>
					<td><input type="text" name="username" size="53" placeholder="ExampleUsername123..."/></td>
				</tr>
				<tr>
					<td>Enter password: </td>
					<td><input type="password" name="password" size="53" placeholder="ExamplePassword123..."/></td>
				</tr>
				<tr>
					<td>Enter email: </td>
					<td><input type="email" name="email" size="53" placeholder="Example@email.com..."/></td>
				</tr>
				<tr>
					<td><input type="submit" name="B1"/> </td>
                                        <td colspan="2"> <input type="reset" name="B2"/></td>
				</tr>
			</table>
		</form>