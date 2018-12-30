<%-- 
    Document   : Login
    Created on : Nov 26, 2018, 10:41:22 PM
    Author     : Trang Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Luxury Clock NQT login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/LoginForm.css" rel="stylesheet" />
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
                background-color: white;
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

            .dropdown-content a:hover {background-color: white}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            /*.dropdown:hover .dropbtn {
                background-color: white;
            }*/
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container2 demo-1">
                <div class="content">
                    <div id="large-header" class="large-header">
                        <div class="main-agileits">
                            <!--form-stars-here-->
                            <div class="form-agile">
                                <h2>Login Now</h2>
                                <form action="UsersServlet" method="POST">

                                <%if (request.getParameter("error") != null) {%>
                                <div>
                                    <p style="color:red"><%=request.getParameter("error")%></p>
                                </div> 
                                <%}%>
                                <div>
                                    <span>Tên Tài Khoản *</span>
                                    <input type="text" name="tenTK" style="width: 80%; height: 40px">
                                </div> 	
                                <div> 
                                    <span class="word">Password *</span>
                                    <input type="password" name="pass" style="margin-top: 7px; width: 80%; height: 40px;margin-left: 30px">
                                </div>	
                                <a class="p-bottom-ls">Forgot Password?</a>
                                <a class="p-bottom-ls1" href="register.jsp">Register Account?</a>
                                <div class="clear"></div>
                                <div class="submit-l">
                                    <input type="hidden" value="login" name="command">
                                    <input type="submit" value="Login">
                                </div>
                            </form>
                            <div class="social w3layouts">
                                <div class="heading">

                                    <div class="clear"></div>
                                </div>

                                <div class="clear"></div>
                            </div>
                        </div>
                        <!--//form-ends-here-->
                    </div>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
