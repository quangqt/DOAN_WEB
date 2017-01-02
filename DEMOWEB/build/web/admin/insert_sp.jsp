<%-- 
    Document   : insert_sp
    Created on : Dec 20, 2016, 11:54:02 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="model.loaisp"%>
<%@page import="Dao.LoaiDao"%>
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
            if (ad == null) {
                response.sendRedirect("/DEMOWEB/Longin.jsp");
            }
            LoaiDao x = new LoaiDao();
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <form action="/DEMOWEB/manager_spServlet" method="POST">
                        <table width="95%">
                            <tr><td width="125px"><b>MaLoai</b></td><td>
                                    <select name="maloai">
                                    <%
                                        for (loaisp y : x.getListLoaisp()) {
                                    %>
                                    <option><%=y.getMaloai()%></option>
                                    <%}%>
                                </select></td></tr>
                        <tr><td><b>Ten Sp</b></td><td><input type="text" class="sedang" name="tensp"></td></tr>
                        <tr><td><b>Hinh Anh</b></td><td><input type="text" class="panjang" name="hinhanh" ></td></tr>

                        <tr><td width="125px"><b>Gia</b></td><td><input type="text" class="pendek" name="gia"></td></tr>
                        <tr><td><b>Mo Ta</b></td><td><textarea name="mota"></textarea></td></tr>
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
