/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Trang Nguyen
 */
public class CheckEmailServlet extends HttpServlet {
    UsersDAO usersDAO = new UsersDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       if (usersDAO.checkEmail(request.getParameter("username"))) {
            response.getWriter().write("<p>Ten da ton tai </p>");
        } else {
            response.getWriter().write("<img src=\"img/available.png\" />");
        }
    }

}
