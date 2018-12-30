<%-- 
    Document   : Cart
    Created on : Dec 3, 2018, 5:28:30 PM
    Author     : Trang Nguyen
--%>

<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
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
            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            String productID = "";
            if (request.getParameter("productID") != null) {
                productID = request.getParameter("productID");
                product = productDAO.getProduct(Long.parseLong(productID));
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <h2 style="margin-left: 500px; margin-top: 100px">DANH SÁCH MẶT HÀNG</h2>
            <table style="border: 1px solid #D6D6D6; width: 1200px; margin-left: 70px; margin-top: 30px; margin-bottom: 30px">
                <tr style="background-color: orange; height: 50px">
                    <th style="padding-left: 30px">Sản phẩm</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
            <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
            <tr>
                <td style="width: 400px; padding-top: 30px"><image src="<%=list.getValue().getProduct().getProductImage()%>" class="img-responsive" alt="" style="width: 100px; margin-left: 20px"/><span style="padding-left: 40px; font-size: 20px"><a href="single.jsp?productID=<%=list.getValue().getProduct().getProductID()%>"><%=list.getValue().getProduct().getProductName()%></a></span></td> 

                <td style="width: 300px">  <span class="actual"> $<%=list.getValue().getProduct().getProductPrice()%></span></td>
                <td style="width: 300px"><a href="CartServlet?command=plus&productID=<%=list.getValue().getProduct().getProductID()%>">+</a> <span class="actual">   <%=list.getValue().getQuatitty()%> <a href="CartServlet?command=sub&productID=<%=list.getValue().getProduct().getProductID()%>">-</a></td>
                <td><span class="actual">   <%=list.getValue().getQuatitty()%> X</span>  <span class="actual"> $<%=list.getValue().getProduct().getProductPrice()%></span> <a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"> Xóa</a></td> 
            </tr>
            <%
                }
            %>




        </table>
        <h2 style="padding-left: 70px; color: red"> Tổng Tiền : <span class="actual" style="padding-left: 200px">  $<%=cart.totalCart()%> </span> </td> </h2>
    <div class="check_button" ><a href="checkout.jsp" style="width: 200px; height: 35px;">Mua Hàng</a></div>  
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
