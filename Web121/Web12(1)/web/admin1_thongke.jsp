<%-- 
    Document   : admin1_thongke
    Created on : Dec 30, 2018, 5:01:49 PM
    Author     : Trang Nguyen
--%>

<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Value"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ValuaDAO"%>
<%@page import="model.AdminUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê</title>
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
            ArrayList<Value> list = null;
            
            
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getListCategory();

            AdminUsers adusers = (AdminUsers) session.getAttribute("user");
            if (adusers == null) {
                response.sendRedirect("admin1_login.jsp");
            }
            if (session.getAttribute("user") != null) {
                adusers = (AdminUsers) session.getAttribute("user");
            }
//            AdminUsers adusers = null;
//            if (session.getAttribute("user") != null) {
//                adusers = (AdminUsers) session.getAttribute("user");
//            }
//            String tuan = (String) request.getAttribute("s");
//            ValuaDAO va = new ValuaDAO();
//            ArrayList<Value> list = va.getListValuesTuan(tuan);
//            
//            String ngay2 = (String) request.getAttribute("ngay1");
//            ValuaDAO vs = new ValuaDAO();
//            ArrayList<Value> list1 = va.getListValuesTuan(tuan);
            String tuan = (String) request.getAttribute("coman");
            if (tuan.equals("tuan")) {
                String tuan1 = (String) request.getAttribute("s");
                ValuaDAO va = new ValuaDAO();
                list = va.getListValuesTuan(tuan1);
            }
            if (tuan.equals("ngay")) {
                String ngay2 = (String) request.getAttribute("ngay1");
                ValuaDAO vs = new ValuaDAO();
                list = vs.getListValuesNgay(ngay2);
            }
            if (tuan.equals("gio")){
                 String gio = (String) request.getAttribute("ngay2");
                ValuaDAO vs = new ValuaDAO();
                list = vs.getListValuesGio(gio);
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
                        <h2>Thống kê ${requestScope.coman}</h2> 
                        <h2> ${requestScope.coman} ${requestScope.s} ${requestScope.ngay1} ${requestScope.ngay2}</h2>
                        <table id="table">

                            <tr>
                                <th></th>
                                <th>STT</th>
                                <th>Mã sản phẩm</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Tổng</th>
                            </tr>
                            <%
                                int count = 0;
                                for (Value value : list) {
                                    count++;
                            %>
                            <tr class="odd">
                                <td></td>
                                <td><%=count%></td>
                                <td><%=value.getProductID()%></td>
                                <td> Product<%=value.getProductID()%></td>
                                <td><%=value.getTongSoLuong()%></td>
                             


                            </tr>
                            <%}
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
