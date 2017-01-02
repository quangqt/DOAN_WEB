<%-- 
    Document   : login
    Created on : Dec 10, 2016, 2:52:26 PM
    Author     : SUALAPTOP24h.NET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <script language="javascript">
            function kttt() {
                var user = document.getElementById("emailuser").value;
                var pass = document.getElementById("passworduser").value;
                if (user == "") {
                    alert("ban chua nhap thong tin email");
                    return false;
                }
                if(pass==""){
                    alert("ban chua nhap mat khau!");
                    return false;
                }
                return true;
            }
        </script>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="single_top">
                <div class="container"> 
                    <div class="register">
                        <div class="col-md-6 login-right">
                            <h3 style="color: #D5331D">ĐĂNG NHẬP</h3>
                            <form action="UsersServlet" method="POST">

                            <% if(request.getParameter("error")!=null){%>
                            <div>
                                <p style="color: red"><%=request.getParameter("error") %>
                            </div>
                            <%}%>
                            <div>
                                <span>Email Address<label>*</label></span>
                                <input type="text" name="useremail" id="emailuser" > 
                            </div>
                            <div>
                                <span>Password<label>*</label></span>
                                <input type="password" name="userpass" id="passworduser"> 
                            </div>
                            <a class="forgot" href="#">Forgot Your Password?</a>
                            <input type="hidden" value="longin" name="command">
                            <input type="submit" value="Login" onclick="return kttt()">
                        </form>
                    </div>
                    <div class="col-md-6 login-left">
                        <h3>NEW CUSTOMERS</h3>
                        <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                        <a class="acount-btn" href="register.html">Create an Account</a>
                    </div>	
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
