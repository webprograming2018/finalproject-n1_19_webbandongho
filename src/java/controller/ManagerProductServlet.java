/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Trang Nguyen
 */
public class ManagerProductServlet extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String product_id = request.getParameter("product_id");

        String url = "";
        try {
            switch (command) {

                case "delete":
                    productDAO.deleteProduct(Long.parseLong(product_id));
                    url = "/admin1_sanpham.jsp";
                    break;
            }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
        } catch (Exception e) {
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String tenSanPham = request.getParameter("tenSanPham");
        String moTa = request.getParameter("moTa");
        String gia = request.getParameter("gia");

        String url = "", error = "";
        if (tenSanPham.equals("")) {
            error = "Vui lòng nhập tên danh mục!";
            request.setAttribute("error", error);
        }

        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        productDAO.insertProduct(new Product(new Date().getTime(), tenSanPham, gia, moTa));
                        url = "/admin1_sanpham.jsp";
                        break;
                    case "update":
                        productDAO.updateProduct(new Product(Long.parseLong(request.getParameter("product_id")), tenSanPham, gia, moTa));
                        url = "/admin1_sanpham.jsp";
                        break;
                }
            } else {
                url = "/them_sanpham.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
        }
        

    }
}
