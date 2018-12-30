<%-- 
    Document   : bill
    Created on : Nov 29, 2018, 7:16:08 PM
    Author     : Trang Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bill</title>
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
                            <h2>BILL</h2>
                            <form action="#" method="post">
                                <div class="form-sub">
                                    <span style="font-size: 16px">Address* </span>
                                    <input type="text" name="Address" placeholder="Enter Address "  style="margin-left: 10px"/>

                                </div>
                                <div class="form-sub">
                                    <span style="font-size: 16px">Payment* </span>
                                    <select style="width: 120px; height: 30px; margin-left: 10px">
                                        <option value="Bank transfer"> Bank transfer</option>
                                        <option value="Live"> Live</option>
                                    </select>

                                </div>
                  
                                <div class="clear"></div>
                                <div class="submit-l">
                                    <input type="submit" value="Checkout">
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
