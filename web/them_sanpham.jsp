<%-- 
    Document   : them_sanpham
    Created on : Dec 15, 2018, 10:15:00 PM
    Author     : Trang Nguyen
--%>

<%@page import="model.AdminUsers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
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
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
              AdminUsers adusers= (AdminUsers) session.getAttribute("user");
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

                <div id="tab" class="tabcontent">
                    <h3>Thêm sản phẩm</h3>
                    <div class="form">

                        <form action="ManagerProductServlet" method="post">                
                            <div class="form_row">
                                <label>Tên sản phẩm:</label>
                                <input type="text" class="form_input" name="tenSanPham"><%=error%>

                            </div>
                            <div class="form_row">
                                <label>Giá:</label>
                                <input type="text" class="form_input" name="gia"><%=error%>

                            </div>
                            <div class="form_row">
                                <label>Mô tả:</label>
                                <input type="text" class="form_input" name="moTa"><%=error%>

                            </div>
                            <div class="form_row">
                                <input type="hidden" name="command" value="insert"> 

                                <input type="submit" class="form_submit" value="Submit" />
                            </div>
                        </form>
                        <div class="clear"></div>
                    </div>
                </div>

                <div class="clear"></div>
            </div> 

            <div class="footer">
            </div>

        </div>
    </body>
</html>
