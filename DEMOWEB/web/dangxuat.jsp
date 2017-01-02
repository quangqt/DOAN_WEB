<%-- 
    Document   : dangxuat
    Created on : Dec 28, 2016, 6:32:08 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session!=null){
                session.removeAttribute("user");
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
