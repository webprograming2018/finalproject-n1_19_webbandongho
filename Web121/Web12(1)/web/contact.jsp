<%-- 
    Document   : contact
    Created on : Nov 26, 2018, 10:48:54 PM
    Author     : Trang Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>LAYOUT</title>
        <link  href="css/contact.css" rel="stylesheet" type="text/css">
        <link  href="css/style.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <!--start-breadcrums-->
        <div class="breadcrumbs">
            <div class="container">
                <div class="breadcrumbs-main">
                    <div class="breadcrumb">
                        <span><a href="index.jsp">Home</a></span>
                        <span>/</span>
                        <span class="active">Contact</span>
                    </div>
                </div>
            </div>
        </div>
        <!--	end-breadcrumbs
                contact-start-->
        <div class="contact">
            <div class="container">
                <div class="contact-top heading">
                    <h2  style="text-align: center">CONTACT</h2>
                </div>
                <div class="contact-text">
                    <div class="col-lg-3  contact-left " >
                        <div class="address">
                            <h3>Địa Chỉ</h3>
                            <p>Đồng Hồ NQT</p>
                            <p>Hà Đông - Hà Nội</p>

                        </div>
                        <div class="address">
                            <h3>Liên Hệ</h3>
                            <p>0355569281</p>
                            <p>Fax:190-4509-494</p>
                            <p>Email: <a href="mailto:example@email.com">nhung007777@gmail.com</a></p>
                        </div>
                    </div>
                    <div class="col-lg-9 contact-right">
                        <form>
                            <input type="text" placeholder="Name" >
                            <input type="text" placeholder="Phone">
                            <input type="text"  placeholder="Email">
                            <textarea placeholder="Message"></textarea>
                            <div class="submit-btn">
                                <input type="submit" value="SUBMIT">
                            </div>
                        </form>
                    </div>	
                </div>

            </div>
        </div>
        <!--	contact-end
                map-start-->
        <div id="map" style="width:100%;height:400px;">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.286688666139!2d105.78340151445387!3d20.981142094779223!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135accdafa34135%3A0x2f04a7e5c4eb749d!2zTmd1eeG7hW4gVsSDbiBUcuG7l2kgJiBOZ8O1IDQsIE3hu5kgTGFvLCBIw6AgxJDDtG5nLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1538904996408" width="100%" height="400px" frameborder="0" style="border:0" allowfullscreen></iframe> 

        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
