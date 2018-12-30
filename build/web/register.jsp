<%-- 
    Document   : register
    Created on : Nov 26, 2018, 10:54:24 PM
    Author     : Trang Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Account</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/register.css" rel="stylesheet" />

        <link  href="css/style.css" rel="stylesheet" type="text/css"> </link>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
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
        <script type="text/javascript">

            $(document).ready(function () {
                var x_timer;
                $("#tenTK").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });

                function check_username_ajax(username) {
                    $("#user-result").html('<img src="img/ajax-loader.gif" />');
                    $.post('CheckEmailServlet', {'username': username}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });


        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="breadcrumbs">
                <div class="container">
                    <div class="breadcrumbs-main">
                        <div class="breadcrumb">
                            <span><a href="index.jsp">Home</a></span>
                            <span>/</span>
                            <span class="active">Resister</span>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container2 demo-1">
                <div class="content">
                    <div id="large-header" class="large-header">
                        <div class="main-agileits">
                            <!--form-stars-here-->
                            <div class="form-agile">
                                <h2>Register Account</h2>

                                <form action="UsersServlet" method="POST">

                                    <div>

                                        <span class="word">Địa chỉ Email *</span>
                                        <input type="text" name="email" id="email">
                                        <br>
                                        <span style="color: red"> ${requestScope.mes2}</span> 

                                </div> 	
                                <div>
                                    <span class="word">Tên Tài Khoản *</span>
                                    <input type="text" name="tenTK" id="tenTK" >
                                    <!--                                        <span id="user-result"></span>-->
                                    <br>
                                    <span style="color: red"> ${requestScope.mes}</span> 
                                </div>
                                <div> 
                                    <span class="word">Password *</span>
                                    <input type="password" name="pass">
                                    <span></span>
                                </div>		
                                <div class="clear"></div>
                                <div class="submit-l">
                                    <input type="hidden" value="insert" name="command">
                                    <input type="submit" value="Register">

                                </div>
                            </form>
                            <div class="social w3layouts">
                                <div class="heading">

                                    <div class="clear"></div>
                                </div>

                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
