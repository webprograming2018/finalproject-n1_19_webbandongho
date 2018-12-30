<%-- 
    Document   : index
    Created on : Nov 26, 2018, 10:38:53 PM
    Author     : Trang Nguyen
--%>

<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Trang Chủ</title>
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

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: sandybrown;
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

            .dropdown-content a:hover {background-color: #f1f1f1}

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
            ProductDAO productDAO = new ProductDAO();
            String category_id = "3";
            
            
            
//            if(request.getParameter("category")!=null){
//                category_id = request.getParameter("category");
//            }
//            Cart cart = (Cart) session.getAttribute("cart");
//            if(cart == null) {
//                cart = new Cart();
//                session.setAttribute("cart", cart); //gán sessoin; session.setAttribute(“string”, object)
//            }
        %>




        <jsp:include page="header.jsp"></jsp:include>
            <!----hình ảnh banner---->
            <div class="banner">
                <div class="container-fluid" style="padding-left: 0px; padding-right: 0px" >
                    <div class="row">
                        <div class="col-lg-12" >
                            <div class="flexslider" style="width: 100%; margin: 0" >
                                <ul class="slides">
                                    <li>
                                        <img src="images/bnr-1.jpg">
                                        <p class="flex-caption" style="text-align: center; font-size: 20px">Thương hiệu</p>
                                    </li>
                                    <li>
                                        <img src="images/bnr-2.jpg"style="width: 100%" height="100%" />
                                        <p class="flex-caption" style="text-align: center; font-size: 20px">Đẳng cấp</p>
                                    </li>
                                    <li>
                                        <img src="images/bnr-3.jpg" style="width: 100%" height="100%"/>
                                        <p class="flex-caption " style="text-align: center; font-size: 20px">Sang trọng</p>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!----kết thúc hình ảnh banner-------->


        <!----3 mục tiêu biểu ---->
        <div class="about" >
            <div class="container" style="margin-top: 50px">

                <div class="row">

                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" >
                        <div  class="panel">
                            <img  class="img-responsive" src="images/abt-1.jpg" style="width: 100%">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                        <div class="panel"> 
                            <img  class="img-responsive" src="images/abt-2.jpg" style="width: 100%">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
                        <div class="panel">
                            <img  class="img-responsive" src="images/abt-3.jpg" style="width: 100%">
                        </div>
                    </div>

                </div>

            </div>
        </div>

        <!----3 mục tiêu biểu---->


        <!----phần sản phẩm---->
        <div class="product" >
            <div class="container">
                <div class="row" style="padding-top: 20px">
                <%
                    for (Product p : productDAO.getListProductByCategory(Long.parseLong(category_id))) {
                %>
                <div  class="col-lg-3 col-md-6  col-sm-12 dichuyen" style="height: 400px">
                    <div class="khungchua" >
                        <div  class="anhPr">
                            <a href=single.jsp?productID=<%=p.getProductID()%>>      <img  class="img-responsive zoom-img" src ="<%=p.getProductImage()%>"> </a>
                        </div>
                        <div class="anhPrnoidung">
                            <h4>Smart Watches</h4>
                            <p>Explore Now</p>
                        </div>
                        <div class="anhPrnoidung">
                            <h4> <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>"> <img src="images/cart-2.png" alt="hinh gio hang"></img></a> $ <%=p.getProductPrice()%></h4>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="clearfix"></div>



    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
