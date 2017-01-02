<%-- 
    Document   : giohang
    Created on : Dec 12, 2016, 4:44:40 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="javafx.scene.control.Alert"%>
<%@page import="model.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <script src="js/simpleCart.min.js"></script>
        <!-- Custom Theme files -->
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
    </head>
    <body>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            if(cart.countItem()==0){
                response.sendRedirect("/DEMOWEB/index.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <table align="center"border="1" style="width:1000px">
                <tr>
                    <td>
                        Mã Sản Phẩm
                    </td>
                    <td>
                        Tên Sản Phẩm
                    </td>
                    <td>
                        Hình Ảnh
                    </td>
                    <td>
                        Giá
                    </td>
                    <td>
                        Số Lượng
                    </td>
                    <td></td>
                </tr>
            <%for (Map.Entry<Long, Item> list : cart.getCartItem().entrySet()) {%>
            <tr style="text-align:center;font-weight:bold">
                <td>
                    <%=list.getValue().getSanpham().getMasp()%>
                </td>
                <td><%=list.getValue().getSanpham().getTensp()%></td>
                <td><img src="<%=list.getValue().getSanpham().getHinhanh()%> "height="200" width="200"/></td>
                <td><%=list.getValue().getSanpham().getGia()%></td>
                <td><%=list.getValue().getQuantity()%></td>
                <td><a href="CartServlet?command=remove&Masp=<%=list.getValue().getSanpham().getMasp()%>">Xoa</a></td>
            </tr>
            <% }%>
            <tr>
                <td colspan="6" style="text-align: center">Tổng Tiền:<%=cart.TotalCart()%></td>
            </tr>
            <tr>
                <td colspan="6" style="text-align: center"><a href="checkout.jsp"><input type="button" value="Dat Hang" style="width: 100%"/></a></td>
            </tr>
        </table>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
