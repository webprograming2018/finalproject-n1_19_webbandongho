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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;

/**
 *
 * @author TUNGDUONG
 */
public class BillDAO {

    public void insertBill(Bill bill) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO bill VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bill.getBillID());
        ps.setLong(2, bill.getUserID());
        ps.setDouble(3, bill.getTotal());
        ps.setString(4, bill.getPayment());

        ps.setString(5, bill.getAddress());
        ps.setString(6, bill.getSoDT());
        ps.setString(7, bill.getDongGoi());
        ps.setTimestamp(8, bill.getDate());
        ps.setString(9, bill.getNgay());
        ps.setString(10, bill.getGio());
        ps.setString(11, bill.getTuan());
        ps.executeUpdate();
    }
    public ArrayList<Bill> getListBill() {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM bill";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Bill> list = new ArrayList<>();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getLong("bill_id"));
                bill.setUserID(rs.getLong("user_id"));
                bill.setTotal(rs.getDouble("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setAddress(rs.getString("address"));
                bill.setSoDT(rs.getString("SoDT"));
                bill.setDongGoi(rs.getString("donggoi"));
                bill.setDate(rs.getTimestamp("date"));
                bill.setNgay(rs.getString("ngay"));
                bill.setGio(rs.getString("gio"));
                bill.setTuan(rs.getString("tuan"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }



}
