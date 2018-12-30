/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author NHUNG_COI
 */
public class Value {
    private long productID;
    private int tongSoLuong;

    public Value() {
    }

    public Value(long productID, int tongSoLuong) {
        this.productID = productID;
        this.tongSoLuong = tongSoLuong;
    }

    public long getProductID() {
        return productID;
    }

    public void setProductID(long productID) {
        this.productID = productID;
    }

    public int getTongSoLuong() {
        return tongSoLuong;
    }

    public void setTongSoLuong(int tongSoLuong) {
        this.tongSoLuong = tongSoLuong;
    }
    
}
