/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AdminUsers;

/**
 *
 * @author Trang Nguyen
 */
public class AdminUsersDAO {
    // kiểm tra email tồn tại chưa
    public boolean checkEmail(String ten) {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM admin_users WHERE admin_ten = '" + ten + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
      public boolean check(String email) {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM admin_users WHERE admin_email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // phương thức thêm tài khoản
    public boolean insertAdmin(AdminUsers u) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO admin_users VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getAdminID());
            ps.setString(2,u.getTen());
            ps.setString(3, u.getAdminEmail());
            ps.setString(4, u.getAdminPass());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(AdminUsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // kiểm tra đăng nhập
    public AdminUsers login(String tenTK, String password) {
        Connection con = DBConnect.getConnection();
        String sql = "SELECT * FROM admin_users WHERE admin_ten = '" + tenTK + "' and admin_pass='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                AdminUsers u = new AdminUsers();
                u.setAdminID(rs.getLong("admin_id"));
                u.setTen(rs.getString("admin_ten"));
                u.setAdminEmail(rs.getString("admin_email"));
                u.setAdminPass(rs.getString("admin_pass"));
              
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public AdminUsers getAdmin(long userID) {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM admin_users WHERE admin_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, userID);
            ResultSet rs = ps.executeQuery();
            AdminUsers u = new AdminUsers();
            while (rs.next()) {
                u.setAdminEmail(rs.getString("admin_ten"));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(AdminUsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
