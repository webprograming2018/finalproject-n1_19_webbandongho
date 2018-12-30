<%-- 
    Document   : Men
    Created on : Nov 26, 2018, 10:43:56 PM
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
        <link  href="css/style.css" rel="stylesheet" type="text/css"> </link>
        <link  href="css/style_1.css" rel="stylesheet" type="text/css"> </link>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
        <script type="text/javascript" src="js/xacNhan.js"></script>
        <script defer src="js/jquery.flexslider.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.flexslider').flexslider({
                animation: "slide"
            });


        });
    </script>
    <style>
        .anhPr img{
            height: 90%;
        }
        .dichuyen{
            padding-left: 0px;
            padding-right: 0px;
        }
        #hang7,#hang8{
            display: none;
        }



    </style>
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            String category_id = "";
            if(request.getParameter("category")!=null){
                category_id = request.getParameter("category");
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart); //gán sessoin; session.setAttribute(“string”, object)
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
<!--        --phần sản phẩm--
    <div class="limiter visible-desktop" style="padding-left: 120px">
        <label>Show</label>
        <select onchange="thaydoi(this)">
            <option value="ngunguoi" selected="selected"> 18 </option>
            <option value="ocho"> 24 </option>

        </select>    
    </div>-->
    <div class="product" >

        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <img class="img-responsive" src="images/h-1.jpg"> 
                    <br>
                    <br>
                    <img class="img-responsive" src="images/h-2.jpg"> 
                    <br>
                    <br>
                    <img class="img-responsive" src="images/h-3.jpg"> 
                    <br>
                    <br>
                    <img class="img-responsive" src="images/h-4.jpg"> 
                </div>
                
                <div class="col-lg-9 col-md-9 col-sm-9"> 
                    
                    <div class="row">
                        <%
                            for (Product p : productDAO.getListProductByCategory(Long.parseLong(category_id))) {
                        %>
                        <div  class="col-lg-4 col-md-6  col-sm-12 dichuyen" style="height: 400px">
                            <div class="khungchua" >
                                <div  class="anhPr">
                                    <a href="single.jsp?productID=<%=p.getProductID()%>"><img class="img-responsive zoom-img" src ="<%=p.getProductImage()%>"></a>
                                </div>
                                <div class="anhPrnoidung">
                                    <h4><a ><%=p.getProductName()%></a></h4>
                                    <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>"><p>ADD TO CART</p></a>
                                </div>
                                <div class="anhPrnoidung">
                                    <h4><a href="giohang.php"> <img src="images/cart-2.png" alt="hinh gio hang"></img></a> $ <%=p.getProductPrice()%></h4>
                                </div>
                            </div>
                        </div>
                                
                                    <%
                                        }
                                     %>
                        <div class="clearfix"></div>
                        </div>
                
                    </div>
            </div>
        </div>
    </div>

    <br>
    <br>
    <div class="other-products">
        <div class="container">
            <h3 class="like text-center">Featured Collection</h3>        			
            <ul id="flexiselDemo3">
                <li><a href="single.jsp"><img src="images/c-1.jpg" class="img-responsive"/></a>

                </li>
                <li><a href="single.jsp"><img src="images/c-2.jpg" class="img-responsive"/></a>						

                </li>
                <li><a href="single.jsp"><img src="images/c-3.jpg" class="img-responsive"/></a>

                </li>
                <li><a href="single.jsp"><img src="images/c-4.jpg" class="img-responsive"/></a>

                </li>
                <li><a href="single.jsp"><img src="images/c-5.jpg" class="img-responsive"/></a>

                </li>
            </ul>
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo3").flexisel({
                        visibleItems: 4,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 2
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 3
                            }
                        }
                    });

                });
            </script>
            <script type="text/javascript" src="js/jquery.flexisel.js"></script>
        </div>
    </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
