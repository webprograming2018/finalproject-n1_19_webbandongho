<%-- 
    Document   : Thang
    Created on : Dec 30, 2018, 3:36:39 PM
    Author     : Trang Nguyen
--%>

<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.AdminUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê theo tháng</title>
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

//            AdminUsers adusers = null;
//            if (session.getAttribute("user") != null) {
//                adusers = (AdminUsers) session.getAttribute("user");
//            }
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getListCategory();

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
                        <div class="menu">
                            <form action="ThongKeSevelet" method="POST">
                                <select style="width: 90px; height: 30px; margin-left: 10px" name="theogio">
                                    <span><h2>Giờ</h2></span>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="0">0h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="1">1h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="2">2h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="3">3h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="4">4h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="5">5h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="6">6h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="7">7h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="8">8h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="9">9h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="10">10h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="11">11h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="12">12h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="13">13h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="14">14h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="15">15h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="16">16h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="17">17h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="18">18h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="19">19h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="20">20h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="21">21h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="22">22h</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="23">23h</option></a>

                                </select>
                                <input type="hidden" value="gio" name="command">
                                <input type="submit" value="Submit">
                            </form>

                        </div>  

                    </div>
                </div>
                <div class="clear"></div>
            </div> 

            <div class="footer">
            </div>

        </div> 
    </body>
</html>
