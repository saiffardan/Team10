<%-- 
    Document   : login
    Created on : 22-Jan-2019, 16:02:50
    Author     : Kaloyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="parts/head.jsp" %>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            //insert Database logic to check if username and password exist.
            if((username.equals("cramsay@dundee.ac.uk") && password.equals("password")) ||
                    username.equals("ddatanasov@dundee.ac.uk") && password.equals("123")) {
                //session.removeAttribure("loginError");
                session.setAttribute("username", username);
                response.sendRedirect("dashboard.jsp");
            }
            else {
                session.setAttribute("loginError", "Invalid username or password, please try again.");
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
