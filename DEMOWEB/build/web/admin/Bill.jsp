<%-- 
    Document   : QLSP
    Created on : Dec 20, 2016, 11:08:50 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="Dao.UsersDAO"%>
<%@page import="model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.BillDAO"%>
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
            BillDAO x=new BillDAO();
            ArrayList<Bill> list=x.getListBill();
            UsersDAO userdao=new UsersDAO();
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="rightContent">
                    <table class="data">
                        <tr class="data">
                            <th class="data" width="30px">MaHD</th>
                            <th class="data">maUSER</th>
                            <th class="data">TongHD</th>
                            <th class="data">Số Điện Thoại</th>
                            <th class="data" width="75px">Dia chi</th>
                            <th class="data">ngay Giao</th>
                            <th class="data" width="75px">tuy chon</th>
                        </tr>
                        <%
                            for(Bill y: x.getListBill()){
                        %>
                        <tr class="data">
                            <td class="data" width="30px"><%=y.getBill_id() %></td>
                            <td class="data"><%=userdao.getUser(y.getUserID()).getUserEmail() %></td>
                            <td class="data"><%=y.getTotal() %></td>
                            <td class="data"><%=y.getPayment() %></td>
                            <td class="data"><%=y.getAddress() %></td>
                            <td class="data"><%=y.getDate() %></td>
                            <td>
                                <a href="#">xac nhan</a>|<a href="/DEMOWEB/BillServlet?command=deleteBill&bill_id=<%=y.getBill_id() %>">huy</a>
                            </td>
                        </tr>
                        <!--<td class="data"><%=userdao.getUser(y.getUserID()).getUserEmail() %></td>-->
                        <%}%>
                    </table>
                </div>
                <div class="clear"></div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
