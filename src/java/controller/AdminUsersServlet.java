/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connect.DBConnect;
import dao.AdminUsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AdminUsers;

/**
 *
 * @author Trang Nguyen
 */
public class AdminUsersServlet extends HttpServlet {

    AdminUsersDAO adminusersDAO = new AdminUsersDAO();
    ResultSet rs = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String command = request.getParameter("command");
            String url = "";
            AdminUsers adminusers = new AdminUsers();
            HttpSession session = request.getSession();
            switch (command) {
                case "insert":
                    Connection connection = DBConnect.getConnection();
                    Statement st = connection.createStatement();
                    String sql = "SELECT * FROM admin_users";
                    ResultSet rs = st.executeQuery(sql); // kêt quả của câu lệnh
                    long id = 0;
                    int id1 =0;
//                 
                    while (rs.next()) {
//                        if (rs.getString("user_email").equals(request.getParameter("email"))) {
//                           
//                            request.setAttribute("mes2", "Email Đã tồn tại");
//                            request.getRequestDispatcher("register.jsp").forward(request, response);
//                            break;
//                        }
//
//                        if (rs.getString("user_ten").equals(request.getParameter("tenTK"))) {
//                            request.setAttribute("mes", "Tên đã tồn tại");
//                            request.getRequestDispatcher("register.jsp").forward(request, response);
//                      
//                            break;
//                            
//                            
//                        }
//                         else {
                            id = rs.getLong("admin_id");
                            
                 //       }
                    }
                    
                    PreparedStatement ps;
                    adminusers.setAdminID(id + 1);
                    adminusers.setTen(request.getParameter("tenTK"));
                    adminusers.setAdminEmail(request.getParameter("email"));
                    adminusers.setAdminPass(request.getParameter("pass"));
                    adminusersDAO.insertAdmin(adminusers);
                    session.setAttribute("user", adminusers);
                    url = "/admin1_index.jsp";

                    break;

                case "login":
                    adminusers = adminusersDAO.login(request.getParameter("tenTK"), request.getParameter("pass"));
                    if (adminusers != null) {
                        session.setAttribute("user", adminusers);
                        url = "/admin1_index.jsp";
                    } else {
                        request.setAttribute("error", "Error email or password!");
                        url = "/admin1_login.jsp";
                    }
                    break;
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminUsersServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
