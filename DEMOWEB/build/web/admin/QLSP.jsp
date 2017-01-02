<%-- 
    Document   : QLSP
    Created on : Dec 20, 2016, 11:08:50 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="model.admin"%>
<%@page import="model.sp"%>
<%@page import="Dao.spDao"%>
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
            spDao x=new spDao();
            admin ad=(admin) session.getAttribute("admin");
            if(ad==null){
                response.sendRedirect("/DEMOWEB/Login.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <h3 style="text-align: center">Quản Lý Danh Sách Sản Phẩm</h3>
                    <a href="insert_sp.jsp">them sp</a>    
                    <table class="data">
                        <tr class="data">
                            <th class="data">Ten SP</th>
                            <th class="data">Giá</th>
                            <th class="data">Mô tả</th>
                            <th class="data" width="75px">hình ảnh</th>
                            <th class="data">lựa chọn</th>
                        </tr>
                        <%
                            for(sp y:x.getListsp()){
                        %>
                        <tr class="data">
                            <td class="data"><%=y.getTensp()%></td>
                            <td class="data"><%=y.getGia()%></td>
                            <td class="data"><%=y.getMota() %></td>
                            <td class="data" width="75px">
                        <center>
                            <a href="#"><img src="../<%=y.getHinhanh() %>" width="200px"></a>
                        </center>
                        </td>
                        <td class="data"><a href="${root}/admin/updatesp.jsp?command=update&masp=<%=y.getMasp()%>">sua</a>|<a href="/manager_spServlet?command=delete&masp=<%=y.getMasp()%>">Xoa</a></td>
                        </tr>
                        <% }
                        %>
                    </table>
                </div>
                <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
