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
                <div class="col-md-12 w_content">
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
