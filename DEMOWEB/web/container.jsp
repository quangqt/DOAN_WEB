<%-- 
    Document   : container
    Created on : Dec 9, 2016, 5:27:44 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page import="java.util.ArrayList"%>
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
            spDao y = new spDao();
//            int pages=0,dau=0,cuoi=0,total=0;
//            if(request.getParameter("pages")!=null){
//                pages=(int) Integer.parseInt(request.getParameter("pages"));
//            }
//            total=y.countSanPhamr();
//            if(total<=8){
//                dau=1; 
//                cuoi=total;
//            }
//            else{
//                dau=(pages-1)*8;
//                cuoi=8;
//            }
//            ArrayList<sp> listsp=y.getlistallsp(dau, cuoi);
        %>
        <div class="container">
            <div class="women_main">

                <div class="clearfix"></div>
                <h3 style="text-align:center">SAN PHAM</h3>
                <div style="margin-left: 40px" class="col-md-12 w_content">
                    <%
                        for (sp b : y.getListsp()) {
                    %>
                    <div class="grids_of_4">
                        <div class="grid1_of_4 simpleCart_shelfItem">
                            <div class="content_box">
                                <a href="details.jsp?sanpham=<%=b.getMasp()%>">
                                    <div class="view view-fifth">
                                        <img src="<%=b.getHinhanh()%>" class="img-responsive" alt=""/>
                                        <div class="mask1">
                                            <div class="info"> </div>
                                        </div>
                                    </div>
                                </a>
                                <h5><a href="single.html"> <%=b.getTensp()%></a></h5>
                                <div class="size_1">
                                    <span class="item_price">$<%=b.getGia()%></span>
                                    <div class="size_2-right"><a href="CartServlet?command=plus&Masp=<%=b.getMasp()%>"><input type="button" class="item_add add3" value="" /></a></div>
                                    <div class="clearfix"></div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>

</html>
