<%-- 
    Document   : admin1_register
    Created on : Dec 28, 2018, 11:26:07 AM
    Author     : Trang Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" type="text/css" href="css/admin1.css" />
        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
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
                    $.post('CheckEmailAdminServlet', {'username': username}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });


        </script>
    </head>
    <body>
        <div id="loginpanelwrap">

            <div class="loginheader">
                <div class="logintitle"><a href="#">Register Admin</a></div>
            </div>


            <div class="loginform">
                <form action="AdminUsersServlet" method="POST">
                    <div class="loginform_row">
                        <label>Email:</label>
                        <input type="text" class="loginform_input" name="email" />
                        <span style="color: red"> ${requestScope.mes2}</span> 
                    </div>   
                    <div class="loginform_row">
                        <label>Username:</label>
                        <input type="text" class="loginform_input" name="tenTK" />
                        <span style="color: red"> ${requestScope.mes}</span> 
                    </div>
                    <div class="loginform_row">
                        <label>Password:</label>
                        <input type="text" class="loginform_input" name="pass" />
                    </div>
                    <div class="loginform_row">
                        <input type="hidden" value="insert" name="command">
                        <input type="submit" class="loginform_submit" value="Register">
                    </div> 
                </form>
                <div class="clear"></div>
            </div>


        </div>
    </body>
</html>
