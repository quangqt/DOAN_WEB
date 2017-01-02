<%-- 
    Document   : insert_sp
    Created on : Dec 20, 2016, 11:54:02 PM
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
            admin ad=(admin) session.getAttribute("admin");
            if(ad==null){
                response.sendRedirect("/DEMOWEB/Longin.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3>Form</h3>
                    <form action="/DEMOWEB/manager_loaispServlet" method="post">
                    <table width="95%">
                        <tr>
                            <td width="125px"><b>Tên Danh mục</b></td>
                            <td><input type="text" name="tenloai" ></td>
                        </tr>
                        <tr><td><input type="hidden" name="command" value="insert">
                                <input type="submit" class="button" value="Luu>"</td></tr>
                    </table>
                    </form>
                </div>
                <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
