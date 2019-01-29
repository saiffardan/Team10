<%-- 
    Document   : testDatabaseQuery
    Created on : 29-Jan-2019, 15:33:58
    Author     : danchoatanasov
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:include page="/ExecuteQuery" /> --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ExecuteQuery" method="POST">
            <input type="text" name="query">
            <br>
            <input type="submit">
        </form>
        <%
            ArrayList rows = new ArrayList();
            rows = (ArrayList ) request.getAttribute("queryResult");
            if(rows != null)
            {
                for (Object row : rows) {
                    out.println(row + "<br>");
                }
            }
            
            %>
    </body>
</html>
