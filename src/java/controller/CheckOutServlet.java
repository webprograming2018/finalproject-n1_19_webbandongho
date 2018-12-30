/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.*;
import controller.*;
import dao.BillDAO;
import dao.BillDetailDAO;
import java.awt.Color;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Item;
import model.Users;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import tools.SendMail;

/**
 *
 * @author TUNGDUONG
 */
public class CheckOutServlet extends HttpServlet {

    private final BillDAO billDAO = new BillDAO();
    private final BillDetailDAO billDetailDAO = new BillDetailDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");// tiếng việt
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        String dongGoi = request.getParameter("donggoi");
        String soDienThoai = request.getParameter("sodienthoai");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Users users = (Users) session.getAttribute("user");
        long billID = 0;

        // dduaw dl vao req
        long usID = 0;
        double tong = 0;
        String pay = "";
        String add = "";
        String sodt = "";
        String goi = "";
        //Timestamp daT = ;
        switch (command) {
            case "dathang":

                try {
                    long ID = new Date().getTime();
                    Bill bill = new Bill();
                    bill.setBillID(ID);
                    bill.setAddress(address);
                    bill.setPayment(payment);
                    bill.setSoDT(soDienThoai);
                    bill.setDongGoi(dongGoi);
                    bill.setUserID(users.getUserID());
                    bill.setDate(new Timestamp(new Date().getTime()));
                    String thu = bill.getDate() + "";
                    bill.setNgay(thu.substring(8, 10));
                    String tua = bill.getNgay() + "";
                    String tuan = tua.trim();
                    double tuan1 = Integer.parseInt(tuan);
                    double tuan2 = tuan1 / 7;

                    if (tuan2 > 1.0 && tuan2 < 2.0) {
                        bill.setTuan("2");
                    }
                    if (tuan2 > 2.0 && tuan2 < 3.0) {
                        bill.setTuan("3");
                    }
                    if (tuan2 > 3.0 && tuan2 < 5.0) {
                        bill.setTuan("4");
                    }

                    bill.setGio(thu.substring(11, 13));
                    if (dongGoi.equals("qua") && payment.equals("nhanh")) {
                        bill.setTotal(cart.totalCart() + 30 + 50);
                    }
                    if (dongGoi.equals("qua") && payment.equals("cham")) {
                        bill.setTotal(cart.totalCart() + 30);
                    }
                    if (dongGoi.equals("thongthuong") && payment.equals("nhanh")) {
                        bill.setTotal(cart.totalCart() + 50);
                    }
                    if (dongGoi.equals("thongthuong") && payment.equals("cham")) {
                        bill.setTotal(cart.totalCart());
                    }

                    billDAO.insertBill(bill);

                    for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {
                        billDetailDAO.insertBillDetail(new BillDetail(0, ID,
                                list.getValue().getProduct().getProductID(),
                                list.getValue().getProduct().getProductPrice(),
                                list.getValue().getQuatitty()));
                    }
                    cart = new Cart();
                    session.setAttribute("cart", cart);
                } catch (Exception e) {
                }
                request.getRequestDispatcher("TaiHoaDon1.jsp").forward(request, response);
                break;

            case "inhoadon1":

                String in = request.getParameter("taihoadon");
                if (in.endsWith("tai")) {
                    PDDocument doc = null;
                    PDPage page = null;

                    try {
                        doc = new PDDocument();
                        page = new PDPage();

                        doc.addPage(page);
                        PDFont font = PDType1Font.HELVETICA_BOLD;

                        PDPageContentStream content = new PDPageContentStream(doc, page);
                        content.beginText();
                        content.setFont(font, 20);
                        content.setNonStrokingColor(Color.BLUE);
                        content.moveTextPositionByAmount(100, 700);
                        content.drawString("Hello It's me");

                        content.endText();
                        content.close();

                        doc.save("HoaDon2.pdf");
                        doc.close();
                    } catch (Exception ex) {
                        System.out.println(ex);
                    }

                    String filePath = "HoaDon.pdf";
                    File downloadFile = new File(filePath);
                    FileInputStream inStream = new FileInputStream(downloadFile);

                    // if you want to use a relative path to context root:
                    String relativePath = getServletContext().getRealPath("");
                    System.out.println("relativePath = " + relativePath);

                    // obtains ServletContext
                    ServletContext context = getServletContext();

                    // gets MIME type of the file
                    String mimeType = context.getMimeType(filePath);
                    if (mimeType == null) {
                        // set to binary type if MIME mapping not found
                        mimeType = "application/octet-stream";
                    }
                    System.out.println("MIME type: " + mimeType);

                    // modifies response
                    response.setContentType(mimeType);
                    response.setContentLength((int) downloadFile.length());

                    // forces download
                    String headerKey = "Content-Disposition";
                    String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
                    response.setHeader(headerKey, headerValue);

                    // obtains response's output stream
                    OutputStream outStream = response.getOutputStream();

                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;

                    while ((bytesRead = inStream.read(buffer)) != -1) {
                        outStream.write(buffer, 0, bytesRead);
                    }

                    inStream.close();
                    outStream.close();
                    response.sendRedirect("index.jsp");

                }
                if (in.equals("gui")) {
                    SendMail sw =  new SendMail();
                    sw.sendMail(users.getUserEmail(),"CẢM ƠN BẠN ĐÃ MUA HÀNG Ở CÔNG TY CHÚNG TÔI ", "\n TỔNG HÓA ĐƠN CỦA BẠN LÀ \t"+cart.totalCart()+"");

                }
                response.sendRedirect("index.jsp");
                break;

        }

    }

}
