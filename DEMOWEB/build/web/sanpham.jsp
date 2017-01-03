<%-- 
    Document   : sanpham
    Created on : Dec 11, 2016, 4:25:44 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.spDao"%>
<%@page import="model.sp"%>
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
            spDao x = new spDao();
            long maloai = 0;
            if (request.getParameter("maloai") != null) {
                maloai = (long) Long.parseLong(request.getParameter("maloai"));
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            int pages = 0, dau = 0, cuoi = 0, total = 0;
            if (request.getParameter("pages") != null) {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            total = x.countSanPhamrByLoai(maloai);
            if (total <= 8) {
                dau = 1;
                cuoi = total;
            } else {
                dau = (pages) * 8;
                cuoi = 8;
            }
            ArrayList<sp> listsp = x.getListSanPhamBynav(maloai, dau, cuoi);

        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="women_main">

                    <div class="clearfix"></div>
                    <h3 style="text-align:center">SAN PHAM</h3>
                    <div class="col-md-12 w_content">


                    <%                        for (sp p : listsp) {
                    %>
                    <div class="grids_of_4">
                        <div class="grid1_of_4 simpleCart_shelfItem">
                            <div class="content_box">
                                <a href="details.jsp?sanpham=<%=p.getMasp()%>">
                                    <div class="view view-fifth">
                                        <img src="<%=p.getHinhanh()%>" class="img-responsive" alt=""/>
                                        <div class="mask1">
                                            <div class="info"> </div>
                                        </div>
                                    </div>
                                </a>
                                <h5><a href="single.html"> <%=p.getTensp()%></a></h5>
                                <div class="size_1">
                                    <span class="item_price">$<%=p.getGia()%></span>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="size_2">
                                    <div class="size_2-left"> 
                                        <input type="text" class="item_quantity quantity_1" value="1" />
                                    </div>
                                    <div class="size_2-right"><a href="CartServlet?command=plus&Masp=<%=p.getMasp()%>"><input type="button" class="item_add add3" value="" /></a></div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <ul class="pagination">
                <%for (int i = 1; i <= (total / 8) + 1; i++) {%>
                <li class="arrow"><a href="sanpham.jsp?maloai=<%=maloai%>&pages=<%=i%>"><%=i%></a></li>
                    <%}%>
            </ul>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
