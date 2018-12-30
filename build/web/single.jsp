<%-- 
    Document   : single
    Created on : Nov 26, 2018, 10:58:16 PM
    Author     : Trang Nguyen
--%>

<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Chi tiết sản phẩm</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link  href="css/style.css" rel="stylesheet" type="text/css">
        <link  href="css/style_1.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 

        <script defer src="js/jquery.flexslider.js"></script>


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

        <script type="text/javascript">
            $(document).ready(function () {
                $('.flexslider').flexslider({
                    animation: "slide"
                });


            });
        </script>
        <script>
            function magnify(imgID, zoom) {
                var img, glass, w, h, bw;
                img = document.getElementById(imgID);
                /*create magnifier glass:*/
                glass = document.createElement("DIV");
                glass.setAttribute("class", "mySlides-glass");
                /*insert magnifier glass:*/
                img.parentElement.insertBefore(glass, img);
                /*set background properties for the magnifier glass:*//*thiết lập các thuộc tính nền cho kính lúp*/
                glass.style.backgroundImage = "url('" + img.src + "')";
                glass.style.backgroundRepeat = "no-repeat";
                glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
                bw = 3;
                /*một nửa độ rộng ảnh thật để căn ảnh vào kính lúp*/
                w = glass.offsetWidth / 2;
                h = glass.offsetHeight / 2;
                /*execute a function when someone moves the magnifier glass over the image:*//*thực hiện chức năng khi ai đó di chuyển kính lúp qua hình ảnh*/
                glass.addEventListener("mousemove", moveMagnifier);
                img.addEventListener("mousemove", moveMagnifier);
                /*and also for touch screens:*//*và cũng cho màn hình cảm ứng*/
                glass.addEventListener("touchmove", moveMagnifier);
                img.addEventListener("touchmove", moveMagnifier);
                function moveMagnifier(e) {
                    var pos, x, y;
                    /*prevent any other actions that may occur when moving over the image*//*ngăn chặn bất kỳ hành động nào khác có thể xảy ra khi di chuyển qua hình ảnh*/
                    e.preventDefault();
                    /*get the cursor's x and y positions:*//*lấy vị trí x và y của con trỏ*/
                    pos = getCursorPos(e);/*vị trí hiện tại của con trỏ*/
                    x = pos.x;
                    y = pos.y;
                    /*prevent the magnifier glass from being positioned outside the image:*//*ngăn không cho kính lúp được đặt bên ngoài hình ảnh*/
                    if (x > img.width - (w / zoom)) {
                        x = img.width - (w / zoom);
                    }
                    if (x < w / zoom) {
                        x = w / zoom;
                    }
                    if (y > img.height - (h / zoom)) {
                        y = img.height - (h / zoom);
                    }
                    if (y < h / zoom) {
                        y = h / zoom;
                    }
                    /*set the position of the magnifier glass:*//*đặt vị trí của kính lúp*/
                    glass.style.left = (x - w) + "px";
                    glass.style.top = (y - h) + "px";
                    /*display what the magnifier glass "sees":*//*hiển thị những gì kính lúp "nhìn thấy"*/
                    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
                }
                function getCursorPos(e) {
                    var a, x = 0, y = 0;
                    e = e || window.event;
                    /*get the x and y positions of the image:*//*có được vị trí x và y của hình ảnh*/
                    a = img.getBoundingClientRect();
                    /*calculate the cursor's x and y coordinates, relative to the image:*//*tính toán tọa độ x và y của con trỏ, liên quan đến hình ảnh*/
                    x = e.pageX - a.left;
                    y = e.pageY - a.top;
                    /*consider any page scrolling:*//*xem xét việc cuộn trang bất kỳ*/
                    x = x - window.pageXOffset;
                    y = y - window.pageYOffset;
                    return {x: x, y: y};
                }
            }
        </script>

    <div id="fb-root"></div>
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
<!--    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id))
                return;
            js = d.createElement(s);
            js.id = id;
            js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2&appId=2201722136822305&autoLogAppEvents=1';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>-->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2&appId=297256011131391&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</head>
<body>
    <%
        ProductDAO productDAO = new ProductDAO();
        Product product = new Product();
        String productID = "";
        if (request.getParameter("productID") != null) {
            productID = request.getParameter("productID");
            product = productDAO.getProduct(Long.parseLong(productID));
        }
    %>
    <jsp:include page="header.jsp"></jsp:include>
        <div class="single_top">
            <div class="container">
                <div class="single_grid">
                    <div class="grid images_3_of_2">
                        <!--                        <div class="magnify">
                                                    <div class="large"></div>
                                                    
                                                    <img src="images/p-1.jpg" class="small" alt="p-1" width="200">
                                                </div>-->
                        <div class="container1">
                            <div class="mySlides">
                                <img id="myimage" src="<%=product.getProductImage()%>" width="250" height="400">
                        </div>


                        <script>
                            /* Initiate Magnify Function
                             with the id of the image, and the strength of the magnifier glass:*/
                            /*Bắt đầu chức năng phóng đại
                                                          với id của hình ảnh và độ mạnh của kính lúp*/
                            magnify("myimage", 2);
                            magnify("myimage1", 2);
                            magnify("myimage2", 2)
                        </script>
                        <div class="row">
                            <div class="column">
                                <img class="demo cursor" src=<%=product.getProductID()%> width="50" onclick="currentSlide(1)" alt="">
                            </div>

                        </div>
                    </div>

                    <script>
                        var slideIndex = 0;
                        showSlides();

                        function showSlides() {
                            var i;
                            var slides = document.getElementsByClassName("mySlides");
                            for (i = 0; i < slides.length; i++) {
                                slides[i].style.display = "none";
                            }
                            slideIndex++;
                            if (slideIndex > slides.length) {
                                slideIndex = 1
                            }
                            slides[slideIndex - 1].style.display = "block";
                            setTimeout(showSlides, 4000); // Change image every 2 seconds
                        }
                    </script>
                    <div class="clearfix"></div>
                </div>
                <h1><%=product.getProductName()%></h1><hr>
                <div class="simpleCart">
                    <div class="price_single">

                        <h3>Đồng hồ đỉnh cao</h3>
                        <br>
                        <br>
                        <a  href="#"><p>Mã Đồng Hồ: <%=product.getProductID()%></p> </a>
                        <p>Bảo hành 2 năm</p>
                        <p>Giao hàng miễn phí</p>
                        <p>Gọi điện đặt hàng: 0355569281</p>
                        <h2 style="margin-top: 40px"><b>$<%=product.getProductPrice()%></b></h2>
                        <br>
                        <br>

                          
                       
                    </div>

                       <a href="CartServlet?command=plus&productID=<%=product.getProductID()%>"><p>ADD TO CART</p></a>
                </div>
            </div>
            <div class="clearfix"></div>   
        </div>
    </div>
    <hr>
    <div class="fb-comments" data-href="http://localhost:8080/weba/single.jsp?productID=<%=productID%>" data-width="850" data-numposts="5"></div>

</div> 

<br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
