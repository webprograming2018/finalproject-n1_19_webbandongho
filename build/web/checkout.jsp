<%-- 
    Document   : checkOut
    Created on : Dec 5, 2018, 4:25:16 PM
    Author     : NHUNG_COI
--%>

<%@page import="model.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.BillDetail"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/LoginForm.css" rel="stylesheet" />
    </head>
    <body>
        <%
            Users users = (Users) session.getAttribute("user");
            if (users == null) {
                response.sendRedirect("Login.jsp");
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            if (cart.countItem() == 0) {
                response.sendRedirect("index.jsp");

            }

        %>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container2 demo-1">
                <div class="content">
                    <div id="large-header" class="large-header">
                        <div class="main-agileits">
                            <!--form-stars-here-->
                            <div class="form-agile">
                                <h2>Nhập Form Thanh toán</h2>
                                <form action="CheckOutServlet" method="POST">
                                    <div>
                                        <span> Địa Chỉ*</span>
                                        <input type="text" name="address" style="    width: 80%;
                                               height: 40px;
                                               margin-left: 50px;">
                                    </div>
                                    <br>
                                    <br>
                                    <div>
                                        <span style="font-weight:inherit">Số Điện Thoại*</span>
                                        <input type="text" name="sodienthoai" style="    width: 80%;
                                               height: 40px;
                                               margin-left: 6px;">
                                    </div>
                                    <br>
                                    <br>
                                    <div>
                                        <span>Hình Thức Vận Chuyển *</span>
                                        <select  onchange="thaydoi(this)" name="payment" style="    height: 30px;
                                                 width: 150px;
                                                 margin-left: 15px;">
                                            <option value="nhanh"> Nhanh(+50$) </option>
                                            <option value="cham"  selected="selected"> Chậm </option>
                                        </select>
                                    </div> 
                                    <br>
                                    <br>
                                    <div>
                                        <span>Hình Thức Đóng Gói *</span>
                                        <select   onchange="thaydoi1(this)"name="donggoi" style="    height: 30px;
                                                  width: 150px;
                                                  margin-left: 30px;">
                                            <option value="qua"> Quà(+30$)</option>
                                            <option value="thongthuong" selected="selected"> Thông Thường </option>
                                        </select>
                                    </div> 
                                    <br>
                                    <br>
                                    <script>
                                        function thaydoi(obj)
                                        {

                                            var value = obj.value;

                                            if (value === 'nhanh') {
                                                var x = 30;
//                                    
                                                document.getElementById("tongtien1").innerHTML = 50;
                                                //       document.getElementById("tongtien3").innerHTML= <%=cart.totalCart()%>+ (parseInt(document.getElementById("tongtien1"));

                                            } else if (value === 'cham') {
                                                document.getElementById("tongtien1").innerHTML = 0;
                                            }
                                        }
                                        function thaydoi1(obj)
                                        {

                                            var value = obj.value;

                                            if (value === 'qua') {

//                             
                                                document.getElementById("tongtien2").innerHTML = 30;


                                            } else if (value === 'thongthuong') {
                                                document.getElementById("tongtien2").innerHTML = 0;
                                            }
                                        }


                                </script>


                                <span style="font-size: 20px; font-family: cursive"> Tiền Đơn Hàng: $<span id ="tongtien"><%=cart.totalCart()%> </span></span>
                                <br>
                                <br>

                                <span style="font-size: 20px; font-family: cursive"> Tiền Vận Chuyển $<span id ="tongtien1">0</span></span>
                                <br>
                                <br>
                                <span style="font-size: 20px; font-family: cursive"> Tiền Đóng Gói $<span id ="tongtien2">0</span></span>
                                <br>
                                <br>

                                <input type="hidden" value="dathang" name="command">
                                <input type="submit" value="Đặt Hàng"> 
                            </form>


                        </div>
                        <!--//form-ends-here-->
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
