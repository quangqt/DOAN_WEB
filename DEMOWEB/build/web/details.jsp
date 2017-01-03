
<%-- 
    Document   : details
    Created on : Dec 9, 2016, 6:12:03 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.spDao"%>
<%@page import="model.sp"%>

<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="model.loaisp" %>
<%@page import="Dao.LoaiDao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Buy_shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
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
        <script src="js/jquery.easydropdown.js"></script>
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
        <link rel="stylesheet" href="css/etalage.css">
        <script src="js/jquery.etalage.min.js"></script>
        <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 900,
                    source_image_height: 1200,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
                });

            });
        </script>
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function () {

                var menu_ul = $('.menu_drop > li > ul'),
                        menu_a = $('.menu_drop > li > a');

                menu_ul.hide();

                menu_a.click(function (e) {
                    e.preventDefault();
                    if (!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true, true).slideUp('normal');
                    }
                });

            });
        </script>
    </head>
    <body>
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=380288105659115";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <%
                spDao x = new spDao();
                sp sanpham = new sp();
                String masp = "";
                if (request.getParameter("sanpham") != null) {
                    masp = request.getParameter("sanpham");
                    sanpham = x.getProduct(Long.parseLong(masp));
                }

                LoaiDao y = new LoaiDao();
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
        <a href="index.jsp"><img src="http://donghoduyanh.com/upload/images/icon21453711989.jpg" width="100px" height="50px"/></a>
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
                                            for (loaisp c : y.getListLoaisp()) {
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
                                    <p class="empty"><a href="login.jsp">Đăng Nhập</a></p>
                                    <%}%>
                                </div>
                            </div>

                        </div>

                    </nav>

                </header>

            </div>
        </div>
        <div class="container">
            <img src="images/anhbia.png" width="100%"/>
        </div>  
        <h3 style="color: red;text-align: center">Thông tin sản phẩm</h3>
        <div class="single_top">
            <div class="container"> 
                <div class="single_grid">
                    <div class="grid images_3_of_2">
                        <ul id="etalage">
                            <li>
                                <a href="optionallink.html">
                                    <img class="etalage_thumb_image" src="<%=sanpham.getHinhanh()%>" class="<%=sanpham.getTensp()%>" width="100%"/>
                                    <img class="etalage_source_image" src="<%=sanpham.getHinhanh()%>" class="img-responsive" title="" width="100%"/>
                                </a>
                            </li>

                        </ul>
                        <div class="clearfix"></div>		
                    </div> 
                    <div class="desc1 span_3_of_2">
                        <ul class="back">
                            <li><i class="back_arrow"> </i> <a href="index.jsp">Trở Về</a></li>
                        </ul>
                        <div class="col-sm-3" style="font-size: 20px">Tên Sản Phẩm:</div>
                        <div class="col-sm-9" style="color: red;font-size: 20px"><%=sanpham.getTensp()%></div>
                        <div class="clearfix"></div>
                        <h1 style="margin-left: 20px;margin-top: 50px">Mô Tả:</h1><p style="margin-left: 30px"><%=sanpham.getMota()%></p>

                        <div class="simpleCart_shelfItem">
                            <div class="price_single">
                                <div class="head"><h2><span class="amount item_price">Giá:$<%=sanpham.getGia()%></span></h2></div>
                                <div class="head_desc"><a href="#">12 reviews</a><img src="images/review.png" alt=""/></li></div>
                                <div class="clearfix"></div>
                            </div>
                            <!--<div class="single_but"><a href="" class="item_add btn_3" value=""></a></div>-->
                            <div class="size_2-right"><a href="CartServlet?command=plus&Masp=<%=sanpham.getMasp()%>" class="item_add item_add1 btn_5" value="" />Thêm vào Giỏ Hàng</a></div>

                        </div>

                    </div>
                    <div class="fb-comments" data-href="https://www.facebook.com/quag.tran" data-width="100%" data-numposts="5"></div></div> 

                <div class="clearfix"></div>
            </div>

        </div>
    </div>
    <div class="container">
        <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
