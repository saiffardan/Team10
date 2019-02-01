<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>
<div class="accsetchoice">
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
			<div class="form-group">
			<table border="1" cellpadding="5" cellspacing="5" style="width:30%;" >
                            <label for="username">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="ExampleUsername123...">
                            <label for="password">Password</label>
                            <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            <label for="email">Email</label>
                            <input type="email" name="email" class="form-control"placeholder="Example@email.com...">
                            <button type="submit" name="B1" class="btn btn-primary">Submit</button>
                            <button type="reset" name="B2" class="btn btn-primary">Reset</button>
                        </table>
			</div>	
		</form>
		
            </div>