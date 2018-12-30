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
import java.util.ArrayList;
import model.Product;
import model.Value;

/**
 *
 * @author NHUNG_COI
 */
public class ValuaDAO {

    public ArrayList<Value> getListValuesTuan(String tuan) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT product_id, sum(quantity) from web1.bill_detail, web1.bill where web1.bill.bill_id = web1.bill_detail.bill_id and web1.bill.tuan= '" + tuan + "' group by product_id;";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Value> list = new ArrayList<>();
        while (rs.next()) {
            Value value = new Value();
            value.setProductID(rs.getLong("product_id"));
            value.setTongSoLuong(rs.getInt("sum(quantity)"));

            list.add(value);
        }
        return list;
    }
    public ArrayList<Value> getListValuesGio(String gio) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT product_id, sum(quantity) from web1.bill_detail, web1.bill where web1.bill.bill_id = web1.bill_detail.bill_id and web1.bill.gio= '" + gio + "' group by product_id;";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Value> list = new ArrayList<>();
        while (rs.next()) {
            Value value = new Value();
            value.setProductID(rs.getLong("product_id"));
            value.setTongSoLuong(rs.getInt("sum(quantity)"));

            list.add(value);
        }
        return list;
    }
public ArrayList<Value> getListValuesNgay(String ngay) throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT product_id, sum(quantity) from web1.bill_detail, web1.bill where web1.bill.bill_id = web1.bill_detail.bill_id and web1.bill.ngay= '" + ngay + "' group by product_id;";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Value> list = new ArrayList<>();
        while (rs.next()) {
            Value value = new Value();
            value.setProductID(rs.getLong("product_id"));
            value.setTongSoLuong(rs.getInt("sum(quantity)"));

            list.add(value);
        }
        return list;
    }
    public static void main(String[] args) throws SQLException {
        ValuaDAO v = new ValuaDAO();
        String ngay = "17";
        ArrayList<Value> lis = v.getListValuesGio(ngay);
        for (Value va : lis) {
            System.out.println(va.getProductID());
            System.out.println(va.getTongSoLuong());
        }
    }
}
