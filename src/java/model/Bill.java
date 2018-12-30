/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author TUNGDUONG
 */
public class Bill {

    private long billID;
    private long userID;
    private double total;
    private String payment;
    private String address;
    private String soDT;
    private String dongGoi;
    private Timestamp date;
    private String ngay;
    private String gio;
    private String tuan;
    

    public Bill() {
    }

    public Bill(long billID, long userID, double total, String payment, String address, String soDT, String dongGoi, Timestamp date, String ngay, String gio, String tuan) {
        this.billID = billID;
        this.userID = userID;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.soDT = soDT;
        this.dongGoi = dongGoi;
        this.date = date;
        this.ngay = ngay;
        this.gio = gio;
        this.tuan = tuan;
    }

    public long getBillID() {
        return billID;
    }

    public void setBillID(long billID) {
        this.billID = billID;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSoDT() {
        return soDT;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }

    public String getDongGoi() {
        return dongGoi;
    }

    public void setDongGoi(String dongGoi) {
        this.dongGoi = dongGoi;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getNgay() {
        return ngay;
    }

    public void setNgay(String ngay) {
        this.ngay = ngay;
    }

    public String getGio() {
        return gio;
    }

    public void setGio(String gio) {
        this.gio = gio;
    }

    public String getTuan() {
        return tuan;
    }

    public void setTuan(String tuan) {
        this.tuan = tuan;
    }

   
    

  
}
