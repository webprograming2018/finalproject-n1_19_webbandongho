<%-- 
    Document   : TaiHoaDOn
    Created on : Dec 29, 2018, 1:36:52 PM
    Author     : NHUNG_COI
--%>

<%@page import="org.apache.pdfbox.pdmodel.PDPage"%>
<%@page import="java.awt.Color"%>
<%@page import="org.apache.pdfbox.pdmodel.PDPageContentStream"%>

<%@page import="org.apache.pdfbox.pdmodel.PDDocument"%>
<%@page import="org.apache.pdfbox.pdmodel.font.PDType1Font"%>
<%@page import="org.apache.pdfbox.pdmodel.font.PDFont"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <h2> Lựa chọn Tải hóa đơn </h2>

        <form action="CheckOutServlet" method="POST">
            <select  name="taihoadon" style="    height: 30px;
                     width: 150px;
                     margin-left: 15px;">


                <option value="tai"> Tải </option>
                <option value="gui"  selected="selected"> Gửi Email </option>

                <input type="hidden" value="inhoadon1" name="command">
                <input type="submit" value="Submit"> 

            </select>
        </form>
        <!--          var download = function(downloadURL) {
        
           location = downloadURL;
        
        });
        
        download('http:/diachiwebgigi do.html');-->
    </body>
</html>
