<%-- 
    Document   : updatesp
    Created on : Jan 2, 2017, 9:25:19 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="model.sp"%>
<%@page import="model.sp"%>
<%@page import="Dao.spDao"%>
<%@page import="Dao.spDao"%>
<%@page import="model.loaisp"%>
<%@page import="model.admin"%>
<%@page import="Dao.LoaiDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            spDao x = new spDao();
            sp sanpham = new sp();
            String masp = "";
            if (request.getParameter("sanpham") != null) {
                masp = request.getParameter("sanpham");
                sanpham = x.getProduct(Long.parseLong(masp));
            }
            admin ad = (admin) session.getAttribute("admin");
            if (ad == null) {
                response.sendRedirect("/DEMOWEB/Longin.jsp");
            }
            LoaiDao loai=new LoaiDao();
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <form action="/DEMOWEB/manager_spServlet" method="get">
                        <table width="95%">
                            <tr><td width="125px"><b>MaLoai</b></td><td>
                                    <select name="maloai">
                                    <%
                                        for (loaisp y : loai.getListLoaisp()) {
                                    %>
                                    <option><%=y.getMaloai()%></option>
                                    <%}%>
                                </select></td></tr>
                            <tr><td><b>Ten Sp</b></td><td><input type="text" class="sedang" name="tensp" value="<%=sanpham.getTensp() %>"></td></tr>
                            <tr><td><b>Hinh Anh</b></td><td><input type="text" class="panjang" name="hinhanh" value="<%=sanpham.getHinhanh() %>" ></td></tr>

                        <tr><td width="125px"><b>Gia</b></td><td><input type="text" class="pendek" name="gia"><%=sanpham.getGia() %></td></tr>
                        <tr><td><b>Mo Ta</b></td><td><textarea name="mota"></textarea><%=sanpham.getMota() %></td></tr>
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
