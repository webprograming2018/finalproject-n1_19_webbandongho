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

        <%

            Long bill = (Long) request.getAttribute("smit");
            Long us = (Long) request.getAttribute("smit1");
            Double to = (Double) request.getAttribute("smit2");
            String pa = (String) request.getAttribute("smit3");
            String add = (String) request.getAttribute("smit4");
            String sodt = (String) request.getAttribute("smit5");
            String donggoi = (String) request.getAttribute("smit6");
            Timestamp date = (Timestamp) request.getAttribute("smit7");
            
            
            PDDocument doc = null;
          
            
              PDPage page1 = null;

            try {
                doc = new PDDocument();
                

                doc.addPage(page1);
                PDFont font = PDType1Font.HELVETICA_BOLD;

                PDPageContentStream content = new PDPageContentStream(doc, page1);
                content.beginText();
                content.setFont(font, 20);
                content.setNonStrokingColor(Color.BLUE);
                content.moveTextPositionByAmount(100, 700);
                content.drawString("Hello It's me");

                content.endText();
                content.close();

                doc.save("pdf_with_text.pdf");
                doc.close();
            } catch (Exception ex) {
                System.out.println(ex);
            }

        %>
<!--        <label> Ket QUa:<%= bill%> </label>-->
        <label> Ket QUa:<%= us%> </label>-->
        <label> Ket QUa:<%= to%> </label>-->
        <label> Ket QUa:<%= pa%> </label>-->
        <label> Ket QUa:<%= add%> </label>-->
        <label> Ket QUa:<%= sodt%> </label>-->
        <label> Ket QUa:<%= donggoi%> </label>-->
        <label> Ket QUa:<%= date%> </label>-->-->
        <form action="DownloadFileServlet" method="GET">
            <select  name="taihoadon" style="    height: 30px;
                     width: 150px;
                     margin-left: 15px;">


                <option value="tai"> Tải Hóa Đơn </option>
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
