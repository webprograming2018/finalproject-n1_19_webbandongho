<%-- 
    Document   : header
    Created on : Nov 29, 2018, 9:27:08 AM
    Author     : Trang Nguyen
--%>

<%@page import="model.Users"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>header</title>
        <link  href="css/style.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 

        <script defer src="js/jquery.flexslider.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.flexslider').flexslider({
                    animation: "slide"
                });


            });
        </script>
        <style>
            @media screen and (max-width: 991px)   {
                .anhPrnoidung{
                    display: none;

                }
                .anhPr {
                    height: 90%;
                }
                .anhPr img{

                    height: 90%;
                }

            }


        </style>
        <style>
            .cart_box{
                margin-bottom:1em;
                border-bottom:1px solid #E0E0E0;
                margin-bottom:10px;
                padding-bottom:10px;
            }
            .cart_box {
                position:relative;
            }
            .alert-close {

                cursor: pointer;
                height: 22px;
                width: 22px;
                position: absolute;
                right:-12px;
                top:5px;
                -webkit-transition: color 0.2s ease-in-out;
                -moz-transition: color 0.2s ease-in-out;
                -o-transition: color 0.2s ease-in-out;
                transition: color 0.2s ease-in-out;
            }
            .list_img{
                float:left;
                width:20%;
                border:1px solid #e0e0e0;
                margin-right:6%;
            }
            .list_desc{
                float:left;
                width:50%;
            }
            .list_desc h4 a{
                color:#000 !important;
                font-size:12px !important;
                text-decoration:none;
                font-weight:400;
                text-transform:uppercase;
                padding: 1em 0 !important;
            }
            .list_desc h4 a:hover{
                color: #f54d56;
            }
            span.actual{
                color:#92d3d0;
                font-size:18px;
                font-weight:600;
            }
            .img-responsive
            {
                display: block;
                max-width: 100%;
                height: auto;
            }
            .check_button{
                text-align:center;
            }
            .check_button a{
                color:#fff;
                font-size:0.8125em;
                text-transform:uppercase;
                font-weight:600;
                text-decoration:none;
                border: none;
                cursor: pointer;
                padding:8px 10px !important; 
                display: inline-block;
                outline: none;
                -webkit-transition: all 0.3s;
                -moz-transition: all 0.3s;
                transition: all 0.3s;
                background: #4e40c6;
                margin:10px auto 0;
                width:40%;
            }
            .check_button a:hover{
                background:#ff3700;
                color:#fff !important;
            }














            .dropbtn {
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;       
                color: #777;
                padding: 0px;
                font-size: 18px;
                border: none;
                cursor: pointer;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }
            .dropbtn {
                display: inline-block;
                color: blue;
                text-align: center;
            
                text-decoration: none;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: white;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {background-color: white}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            /*.dropdown:hover .dropbtn {
                background-color: white;
            }*/
        </style>
    </head>
    <body>



        <%
            CategoryDAO categoryDAO = new CategoryDAO();
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

        <!----phần top---->
        <div class="top">
            <div class="container"> 
                <div class="row">
                    <div class="col-lg-7">


                    </div>
                    <div class="col-lg-3">


                    </div>
                    <div class="col-lg-2" style="padding-left: 0px; padding-right: 0px ">

                        <div class="cha2" > <!----Phần chứa login và cart ------>

                            <div class="giohang ">
                                <a href="#"> <img src="images/cart-1.png" alt="hinh gio hang"></img></a>
                                <!--                            <p><a href="bd.php">Empty cart</a><p>-->
                                <br>
                                <div class="dropdown">
                                    <p class="dropbtn" style="color: white; font-size: 14px"><a href="Cart.jsp">Cart <%=cart.countItem()%> </a></p>

                                  

                                </div>
                            </div>
                            <div class="login" >
                                <a href="Login.jsp"><span class="glyphicon glyphicon-user" style="color: white; padding-left: 16px" > </span></a>
                                <%if (users != null) {%>
                                <li><a href="wishlist.html"><%=users.getTen()%></a> </li>
                                    <%}%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!----kết thúc phần top---->




        <!----phần logo---->
        <div class="Logo">
            <div class="container"> 
                <div class="row">
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">


                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                        <div id="giua" >
                            <div class="chualogo">
                                <a href="index.jsp"> <img style=" margin: auto"src ="images/logo.jpg" alt="Logo" width="100%" height="100%"></a>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 ">

                    </div>
                </div>
            </div>
        </div>


        <!----kết thúc phần logo-------->


        <!----phần menu---->
        <div class="menu">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7" style="padding-left: 0px">
                        <nav class="navbar navbar-default "style="background-color: rgb(255, 255, 255); border-color:rgb(255, 255, 255)">


                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"> 
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>



                            <div class="collapse navbar-collapse" id ="myNavbar">
                                <ul class="navbar navbar-nav" style="padding-left: 4px">
                                    <li class="active" ><a href="index.jsp" style="padding: 10px"> Trang chủ </a></li>
                                    <li>
                                        <ul class="dropdown">
                                            <p href="#" class="dropbtn" style="width: 100px">Danh Mục</p>
                                            <li class="dropdown-content">
                                                <%
                                                    for (Category c : categoryDAO.getListCategory()) {
                                                %>
                                                <a href="Men.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName()%></a>
                                                <%
                                                    }
                                                %>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="DangXuat"> Đăng Xuất </a></li>


                                    <li><a href="contact.jsp">Liên Lạc</a></li>

                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </nav>
                    </div>



                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">

                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">

                </div>
            </div>
        </div>

        <!----kết thúc phần menu---->

    </body>
</html>
