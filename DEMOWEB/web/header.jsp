<%-- 
    Document   : header
    Created on : Dec 9, 2016, 5:27:16 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="model.loaisp" %>
<%@page import="Dao.LoaiDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width: 100%;
                margin: auto;
            }
        </style>
    </head>
    <body>


        <%
            LoaiDao x = new LoaiDao();
            Users users = null;
            if (session.getAttribute("user") != null) {
                users = (Users) session.getAttribute("user");
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
        %>

        <div class="header_bottom men_border">
            <div class="container">
                <header>

                    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">

                        <div class="container">

                            <div class="navbar-header">

                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse">

                                    <span class="sr-only">Toggle navigation</span>

                                    <span class="icon-bar"></span>

                                    <span class="icon-bar"></span>

                                    <span class="icon-bar"></span>

                                </button>

                            </div>

                            <div class="collapse navbar-collapse" id="collapse">

                                <ul class="nav navbar-nav navbar-left">
                                    <li><a href="index.jsp">Trang Chủ</a></li>
                                    <%
                                        for (loaisp c : x.getListLoaisp()) {
                                    %>
                                    <li><a href="sanpham.jsp?maloai=<%=c.getMaloai()%>&pages=1"><%=c.getTenloai()%></a></li>
                                        <%
                                            }
                                        %>
                                    <li><a href="banner.jsp">Địa chỉ</a></li>
                                </ul>
                                <div class="box_1-cart">
                                    <div class="box_11"><a href="giohang.jsp">

                                            <h4><p>Cart:<%=cart.countItem()%></p><img src="images/bag.png" alt=""/><div class="clearfix"> </div></h4>
                                        </a>
                                    </div>
                                    <p class="empty"><a href="index.jsp" class="simpleCart_empty"><%if (users != null) {%>
                                            Xin Chào:<%=users.getUserName()%>
                                        </a>|<a href="dangxuat.jsp" class="simpleCart_empty">Đăng Xuất</a></p>
                                        <%} else {%>
                                    <p class="empty"><a href="register.jsp" class="simpleCart_empty">Đăng Ký</a></p>
                                    <p class="empty" data-toggle="modal" data-target="#myModal"><a>Đăng Nhập</a></p>
                                    <%}%>
                                </div>
                            </div>

                        </div>

                    </nav>

                </header>
                <div class="clearfix"></div>
                <br/>
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="images/hinh_nen1.jpg" alt="Chania" width="500" height="400">
                        </div>
                        <div class="item">
                            <img src="images/hinh_nen2.jpg" alt="Chania" width="500" height="400">
                        </div>
                        <div class="item">
                            <img src="images/hinh_nen3.jpg" alt="Chania" width="500" height="400">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>


        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Đăng Nhập</h4>
                    </div>
                    <form  action="UsersServlet" method="POST">
                        <% if (request.getParameter("error") != null) {%>
                        <div>
                            <p style="color: red"><%=request.getParameter("error")%>
                        </div>
                        <%}%>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="email" type="text" class="form-control" name="useremail" placeholder="Nhap email">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control" name="userpass" placeholder="Nhap pass">
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" value="longin" name="command" >
                            <input type="submit" value="Login">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
