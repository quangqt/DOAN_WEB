<%-- 
    Document   : menu
    Created on : Dec 19, 2016, 10:39:11 PM
    Author     : SUALAPTOP24h.NET
--%>

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
                response.sendRedirect("/DEMOWEB/Longin.jsp");
            }
        %>
        <div id="leftBar" style="margin-top:30px">
            <ul>
                <li><a href="/DEMOWEB/admin/index.jsp">Trang Chu</a></li>
                <li><a href="/DEMOWEB/admin/manager.jsp">QLLoaiSP</a></li>
                <li><a href="/DEMOWEB/admin/QLSP.jsp">QLSP</a></li>
                <li><a href="/DEMOWEB/admin/Bill.jsp">Hóa Đơn</a></li>
                  <li><a href="/DEMOWEB/admin/longout.jsp">Đăng Xuất</a></li>
            </ul>
        </div>
    </body>
</html>
