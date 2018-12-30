<%-- 
    Document   : admin1_thongke
    Created on : Dec 30, 2018, 3:33:34 PM
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
        <title>Thống kê theo ngày</title>
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
                                <select style="width: 90px; height: 30px; margin-left: 10px" name="theongay">
                                    <span><h2>Ngày</h2></span>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="1">Ngày 1</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="2">Ngày 2</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="3">Ngày 3</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="4">Ngày 4</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="5">Ngày 5</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="6">Ngày 6</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="7">Ngày 7</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="8">Ngày 8</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="9">Ngày 9</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="10">Ngày 10</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="11">Ngày 11</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="12">Ngày 12</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="13">Ngày 13</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="14">Ngày 14</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="15">Ngày 15</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="16">Ngày 16</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="17">Ngày 17</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="18">Ngày 18</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="19">Ngày 19</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="20">Ngày 20</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="21">Ngày 21</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="22">Ngày 22</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="23">Ngày 23</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="24">Ngày 24</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="25">Ngày 25</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="26">Ngày 26</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="27">Ngày 27</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="28">Ngày 28</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="29">Ngày 29</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="30">Ngày 30</option></a>
                                    <a href="admin1_thongke.jsp" style=" width: 60px; height: 30px; background-color: white"><option value="31">Ngày 31</option></a>
                                </select>
                                <input type="hidden" value="ngay" name="command">
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
