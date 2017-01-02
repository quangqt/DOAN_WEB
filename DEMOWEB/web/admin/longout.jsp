<%-- 
    Document   : longout
    Created on : Dec 28, 2016, 6:57:14 PM
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
                session.getAttribute("admin");
                response.sendRedirect("/DEMOWEB/Longin.jsp");
            }
        %>
    </body>
</html>
