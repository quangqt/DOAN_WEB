<%-- 
    Document   : content
    Created on : Dec 19, 2016, 10:39:38 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="java.sql.Date"%>
<%@page import="model.admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             admin ad=(admin) session.getAttribute("admin");
            if(ad==null){
                response.sendRedirect("/DEMOWEB/Login.jsp");
            }
        %>
        <div id="rightContent">
            <h3>Dashboard</h3>
            <div class="quoteOfDay">
                <b>Xin chào:<%=ad.getTentk() %></b><br>
            </div>
        </div>
        <div class="clear"></div>
    </body>
</html>
