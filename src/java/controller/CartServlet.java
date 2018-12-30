/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Trang Nguyen
 */
public class CartServlet extends HttpServlet {

    
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Session là phương pháp sử dụng để quản lý các phiên làm việc giữa người sử dụng và hệ thống; session giúp chúng ta lưu trữ lại trạng thái của người dùng.
        HttpSession session = request.getSession(); // khởi tạo session
        String command = request.getParameter("command");
        String productID = request.getParameter("productID");
        Cart cart = (Cart) session.getAttribute("cart");//Sử dụng session.getAttribute(“string”) để lấy giá trị session,trong đó string tương ứng với keyname đã đặt tên gán giá trị cho session.
        //Đối tượng session trong JSP là một đối tượng ẩn của javax.servlet.http.HttpSession. Đối tượng session được sử dụng để theo dõi phiên của các request của client. 
        try {
            Long idProduct = Long.parseLong(productID);
            Product product = productDAO.getProduct(idProduct);
            switch(command) {
                case "plus": //thêm
                    if(cart.getCartItems().containsKey(idProduct)) {
                        cart.plusToCart(idProduct, new Item(product, cart.getCartItems().get(idProduct).getQuatitty()));
                    }else {
                        cart.plusToCart(idProduct, new Item(product, 1));
                    }
                    break;
                case "remove":
                    cart.removeToCart(idProduct);
                    break;
                case "sub":
                    if(cart.getCartItems().containsKey(idProduct)) {
                        cart.subToCart(idProduct, new Item(product, cart.getCartItems().get(idProduct).getQuatitty()));
                    }else {
                        cart.subToCart(idProduct, new Item(product, 1));
                    }
                    break;
            }
        }catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("index.jsp");
        
    }

}
