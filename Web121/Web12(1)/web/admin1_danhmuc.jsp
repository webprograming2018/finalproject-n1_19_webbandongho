<%-- 
    Document   : admin1
    Created on : Dec 15, 2018, 10:37:21 AM
    Author     : Trang Nguyen
--%>

<%@page import="model.AdminUsers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin</title>
        <link rel="stylesheet" type="text/css" href="css/admin1.css" />
        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
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
                        <h2>Quản lý danh mục</h2>           

                        <table id="table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>STT</th>
                                    <th>Mã danh mục</th>
                                    <th>Tên danh mục</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 0;
                                    for (Category category : listCategory) {
                                        count++;
                                %>
                                <tr class="odd">
                                    <td></td>
                                    <td><%=count%></td>
                                    <td><%=category.getCategoryID()%></td>
                                    <td><%=category.getCategoryName()%></td>
                                    <td><a href="Sua_danhmuc.jsp?command=update&category_id=<%=category.getCategoryID()%>"><img src="images/edit.png" alt="" title="" border="0" /></a></td>
                                    <td><a href="ManagerCategoryServlet?command=delete&category_id=<%=category.getCategoryID()%>"><img src="images/trash.gif" alt="" title="" border="0" /></a></td>
                                </tr>
                                <%}
                                %>

                            </tbody>
                        </table>

                    </div>
                </div>
                <div id="tab" class="tabcontent">
                    <a href="Them_danhmuc.jsp"><h4>Thêm danh mục</h4></a>

                </div>
                <div class="clear"></div>
            </div> 

            <div class="footer">
            </div>

        </div>

    </body>
</html>
