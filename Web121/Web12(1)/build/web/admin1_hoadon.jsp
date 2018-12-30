<%@page import="model.AdminUsers"%>
<%@page import="dao.UsersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bill"%>
<%@page import="dao.BillDAO"%>
<%-- 
    Document   : admin1_hoadon
    Created on : Dec 15, 2018, 12:41:20 PM
    Author     : Trang Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hóa đơn</title>
        <link rel="stylesheet" type="text/css" href="css/admin1.css" />
        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
        <!-- jQuery file -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            var $ = jQuery.noConflict();
            $(function () {
                $('#tabsmenu').tabify();
                $(".toggle_container").hide();
                $(".trigger").click(function () {
                    $(this).toggleClass("active").next().slideToggle("slow");
                    return false;
                });
            });
        </script>
         <style>
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                padding: 12px 16px;
                z-index: 1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }
        </style>
    </head>
    <body>
        <%
            BillDAO billDAO = new BillDAO();
            ArrayList<Bill> listBill = billDAO.getListBill();
            UsersDAO usersDAO = new UsersDAO();

            AdminUsers adusers = (AdminUsers) session.getAttribute("user");
            if (adusers == null) {
                response.sendRedirect("admin1_login.jsp");
            }
            if (session.getAttribute("user") != null) {
                adusers = (AdminUsers) session.getAttribute("user");
            }
        %>

        <div id="admin_top">


            <div class="header">
                <div class="title"><a href="#">Admin</a></div>

                <div class="header_right">Welcome Admin,   <%if (adusers != null) {%>
                    <span style="color: red"> <%=adusers.getTen()%></span>
                    <%}%><a href="#" class="settings"><img src="images/settings.png" style="margin-right: 10px">Settings</a> <a href="AdminLogout" class="logout"><img src="images/logout.png" style="margin-right: 10px">Logout</a> </div>

                <div class="menu">
                    <ul>
                        <li><a href="admin1_index.jsp" class="selected">Trang chủ</a></li>
                        <li><a href="admin1_danhmuc.jsp">Danh mục</a></li>
                        <li><a href="admin1_sanpham.jsp">Sản phẩm</a></li>
                        <li><a href="admin1_hoadon.jsp">Hóa đơn</a></li>
                        <li>
                            <div class="dropdown">
                                <a href="admin1_thongke.jsp"><span>Thống kê</span></a>
                                <div class="dropdown-content">
                                    <a href="Tuan.jsp" style="width: 70px; height: 30px; background-color: white"><p>Tuần</p></a>
                                    <a href="Ngay.jsp" style="width: 70px; height: 30px; background-color: white"><p>Ngày</p></a>
                                    <a href="Gio.jsp" style="width: 70px; height: 30px; background-color: white"><p>Giờ</p></a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="center_content">  

                <div id="right">
                    <div id="right_content" style="margin-left: 10px">             
                        <h2>Quản lý hóa đơn</h2> 


                        <table id="table">

                            <tr>
                                <th></th>
                                <th>Mã hóa đơn</th>
                                <th>Khách hàng</th>
                                <th>Tổng tiền</th>
                                <th>Hình thức vận chuyển</th>
                                <th>Địa chỉ giao hàng</th>
                                <th>Số điện thoại</th>
                                <th>Đóng gói</th>
                                <th>Ngày mua</th>
                                <th>Ngày</th>
                                <th>Giờ</th>
                                <th>Sửa</th>
                                <th>Xóa</th>
                            </tr>
                            <%
                                for (Bill bill : listBill) {

                            %>
                            <tr class="odd">
                                <td></td>
                                <td><%=bill.getBillID()%></td>
                                <td><%=usersDAO.getUser(bill.getUserID()).getTen()%></td>
                                <td>$<%=bill.getTotal()%></td>
                                <td><%=bill.getPayment()%></td>
                                <td><%=bill.getAddress()%></td>
                                <td><%=bill.getSoDT()%></td>
                                <td><%=bill.getDongGoi()%></td>
                                <td><%=bill.getDate()%></td>
                                <td><%=bill.getNgay()%></td>
                                <td><%=bill.getGio()%></td>
                                <td><a href="#"><img src="images/edit.png" alt="" title="" border="0" /></a></td>
                                <td><a href="#"><img src="images/trash.gif" alt="" title="" border="0" /></a></td>
                            </tr>
                            <%
                                }
                            %>


                        </table>

                    </div>
                </div>
                <div class="clear"></div>
            </div> 

            <div class="footer">
            </div>

        </div>
    </body>
</html>
