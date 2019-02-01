<%-- 
    Document   : accountSetting
    Created on : 31-Jan-2019, 11:10:10
    Author     : ibrahimmohammed
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		<link href="uploadcss.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		
		
    </head>
    <body>
        
       
        
        <nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a href="Dashboard">
						<img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
					</a>
				</div>

				<a href="logout.jsp"> <button type="button" class="btn btn-default navbar-btn" style="float:right">Logout</button>  </a>
			</div>
		</nav>
        
        <table style="width: 100%; height: 100%;">
            <tr>
                <td style="width: 10%; background-color: #dddddd;">
                    <ul>
                        <li><a href="accountSetting.jsp?create=5">  Create Account</a></li>
                        <li><a href="accountSetting.jsp?assign">  Create Roles</a></li>
                          <li><a href="accountSetting.jsp?modify">  Modify Account</a></li>
                          <li><a href="accountSetting.jsp?delete">  Delete Account</a></li>
                    </ul>
                </td>
                
            <div style="align-self: center;" >
                <td style="width: 80%;" align="center">
                <%
            if(request.getParameter("create")!= null){
               %>     
                <%@ include file="createAccount.jsp"%>       
               
                <%
                      }
                else
            if(request.getParameter("delete")!= null){
               %>     
                 <%@ include file="deleteAccount.jsp"%>      
               <%
                  }
                else
         if(request.getParameter("assign")!= null){
               %> 
                 <%@ include file="assignRoles.jsp"%>    
                <%
                      }
                else
         if(request.getParameter("modify")!= null){
               %> 
                 <%@ include file="modifyAccount.jsp"%>     
                 
            <% 
            }
            %>
            
            </div>
                </td>
            </tr>
        </table>     
        
        
        
     <%
                
//} catch(Exception e) {
         //       out.println(e);
         //   }
        
        %>    
        
    </body>
</html>
