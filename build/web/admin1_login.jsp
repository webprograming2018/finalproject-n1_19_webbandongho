<%-- 
    Document   : admin1_login
    Created on : Dec 15, 2018, 1:26:44 PM
    Author     : Trang Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link rel="stylesheet" type="text/css" href="css/admin1.css" />
        <link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>

    </head>
    <body>
        <div id="loginpanelwrap">

            <div class="loginheader">
                <div class="logintitle"><a href="#">Login Admin</a></div>
            </div>


            <div class="loginform">
                <form action="AdminUsersServlet" method="POST">
                    <%if (request.getParameter("error") != null) {%>
                    <div>
                        <p style="color:red"><%=request.getParameter("error")%></p>
                    </div> 
                    <%}%>
                    <div class="loginform_row">
                        <label>Username:</label>
                        <input type="text" class="loginform_input" name="tenTK" />
                    </div>
                    <div class="loginform_row">
                        <label>Password:</label>
                        <input type="text" class="loginform_input" name="pass" />
                    </div>
                    <div class="loginform_row">
                        <input type="hidden" value="login" name="command">
                        <input type="submit" class="loginform_submit" value="Login" />
                    </div> 
                </form>
                <div class="clear"></div>
            </div>


        </div>
    </body>
</html>
