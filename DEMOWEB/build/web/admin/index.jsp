<%-- 
    Document   : index
    Created on : Dec 19, 2016, 10:45:06 PM
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
        <link rel="shortcut icon" href="../images/devil-icon.png"> <!--Pemanggilan gambar favicon-->
        <link rel="stylesheet" type="text/css" href="mos-css/mos-style.css"> <!--pemanggilan file css-->
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            admin ad=(admin) session.getAttribute("admin");
            if(ad==null){
                response.sendRedirect("/DEMOWEB/Longin.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
            <jsp:include page="content.jsp"></jsp:include>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>

    </body>
</html>
