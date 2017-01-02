<%-- 
    Document   : manager
    Created on : Dec 20, 2016, 10:23:24 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="model.admin"%>
<%@page import="model.loaisp"%>
<%@page import="Dao.LoaiDao"%>
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
            LoaiDao x=new LoaiDao();

            admin ad=(admin) session.getAttribute("admin");
            if(ad==null){
                response.sendRedirect("/DEMOWEB/Longin.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h2 style="text-align: center">Quan ly Loai San pham</h2>
                     <a href="${root}/admin/insert_loaisp.jsp">Them</a>
                        <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">Ma Loai</th>
                            <th class="data">Ten Loai</th>
                            <th class="data" width="75px">lua chon</th>
                        </tr>
                        <%
                            for(loaisp y:x.getListLoaisp()){
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=y.getMaloai() %></td>
                            <td class="data"><%=y.getTenloai() %></td>
                            <td class="data" width="75px">
                        <center>
                            <a href="${root}/admin/update_loaisp.jsp?command=update&maloai=<%=y.getMaloai()%>">Sua</a>&nbsp;&nbsp;&nbsp;
                            <a href="/DEMOWEB/manager_loaispServlet?command=delete&maloai=<%=y.getMaloai() %>">Xoa</a>
                        </center>
                        </td>
                        </tr>
                        <% } %>
                    </table>
                </div>
                <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>


