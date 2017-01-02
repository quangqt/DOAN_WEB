<%-- 
    Document   : register
    Created on : Dec 9, 2016, 11:45:20 PM
    Author     : SUALAPTOP24h.NET
--%>

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
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#email").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });

                function check_username_ajax(username) {
                    $("#user-result").html('<img src="images/loading.png" />');
                    $.post('CheckEmailServlet', {'username': username}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });
        </script>
    </head>
    <body>
        <script language="javascript">
            function ktdangky(){
                var emaildk=document.getElementById("emaildk").value;
                var passdk=document.getElementById("mkdk").value;
                var nhaplai=document.getElementById("nhaplai").value;
                if(emaildk==""){
                    alert("ban chua nhap email");
                    return false;
                }
                if(passdk==""){
                    alert("ban chua nhap mat khau");
                    return false;
                }
                if(passdk!=nhaplai){
                    alert("mat khau ban nhap khong khop!! nhap lai");
                    return false;
                }
                return true;
            }
        </script>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="single_top">
            <div class="container"> 
                <div class="register">

                    <h3 style="text-align: center;color: red">ĐĂNG KÝ TÀI KHOẢN</h3>
                    <form action="UsersServlet" method="POST" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Họ và Tên:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="username" placeholder="Nhập họ tên">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">email:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="emaildk" name="useremail" placeholder="Enter email">
                            </div>
                            <span id="user-result"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Mật Khẩu</label>
                            <div class="col-sm-10">          
                                <input type="password" class="form-control" name="userpass" id="mkdk" placeholder="Enter password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Nhập Lại mật khẩu</label>
                            <div class="col-sm-10">          
                                <input type="password" class="form-control" id="nhaplai" placeholder="Enter password">
                            </div>
                        </div>
                        <div class="form-group">        
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="hidden" value="insert" name="command">
                                <input type="submit" value="Dang Ky" onclick="return ktdangky()">
                            </div>
                        </div>
                    </form>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>      
        <div class="footer">
            <div class="container">
                <div class="footer_top">
                    <div class="col-md-4 box_3">
                        <h3>Our Stores</h3>
                        <address class="address">
                            <p>9870 St Vincent Place, <br>Glasgow, DC 45 Fr 45.</p>
                            <dl>
                                <dt></dt>
                                <dd>Freephone:<span> +1 800 254 2478</span></dd>
                                <dd>Telephone:<span> +1 800 547 5478</span></dd>
                                <dd>FAX: <span>+1 800 658 5784</span></dd>
                                <dd>E-mail:&nbsp; <a href="mailto@example.com">info(at)buyshop.com</a></dd>
                            </dl>
                        </address>
                        <ul class="footer_social">
                            <li><a href=""> <i class="fb"> </i> </a></li>
                            <li><a href=""><i class="tw"> </i> </a></li>
                            <li><a href=""><i class="google"> </i> </a></li>
                            <li><a href=""><i class="instagram"> </i> </a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 box_3">
                        <h3>Blog Posts</h3>
                        <h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
                        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced</p>
                        <h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
                        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced</p>
                        <h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
                        <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced</p>
                    </div>
                    <div class="col-md-4 box_3">
                        <h3>Support</h3>
                        <ul class="list_1">
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Payment</a></li>
                            <li><a href="#">Refunds</a></li>
                            <li><a href="#">Track Order</a></li>
                            <li><a href="#">Services</a></li>
                        </ul>
                        <ul class="list_1">
                            <li><a href="#">Services</a></li>
                            <li><a href="#">Press</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="footer_bottom">
                    <div class="copy">
                        <p>Copyright © 2015 Buy_shop. All Rights Reserved.<a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
