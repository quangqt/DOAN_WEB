<%-- 
    Document   : checkout
    Created on : Dec 13, 2016, 2:25:54 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <script src="js/simpleCart.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
    $(".megamenu").megamenu();
});</script>
        <!-- the jScrollPane script -->
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
$(function ()
{
    $('.scroll-pane').jScrollPane();
});
        </script>
    </head>
    <body>
        <%
            Users users=(Users) session.getAttribute("user");
            if(users==null){
                response.sendRedirect("/DEMOWEB/login.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="single_top">
            <div class="container"> 
                <div class="register">
                    <div class="col-md-12 login-right">
                        <h1 style="color: #D5331D;text-align: center">Phiếu Giao hàng</h1>
                        <form action="CheckOutServlet" method="POST">
                            <div>
                                <span>Địa Chỉ:<label>*</label></span>
                                <input type="text" name="address"> 
                            </div>
                            <div >
                                <span>Số Điện Thoại<label>*</label></span>
                                <input type="text" name="payment" placeholder="Nhập sô điện thoại vào đây">
                            </div>
                            <input type="submit" value="Checkout">
                        </form>
                    </div>
                </div>
            </div>
        </div> 
    </body>
</html>
