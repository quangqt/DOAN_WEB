<%-- 
    Document   : Longin
    Created on : Dec 20, 2016, 11:34:40 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="model.admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        
        <%
              admin ad = (admin) session.getAttribute("admin");
            if (ad != null) {
                response.sendRedirect("/DEMOWEB/admin/index.jsp");
            }
        %>
        <div id="header">
            <div class="inHeaderLogin"></div>
        </div>

        <div id="loginForm">
            <div class="headLoginForm">
                Login Administrator
            </div>
            <div class="fieldLogin">
                <form action="AdminServlet" method="POST">
                    <label>Username</label><br>
                    <input type="text" class="login" name="tentk"><br>
                    <label>Password</label><br>
                    <input type="password" class="login" name="mkadmin"><br>
                    <input type="hidden" value="longin" name="command">
                    <input type="submit" class="button" value="Login">
                </form>
            </div>
        </div>
    </body>
</html>
