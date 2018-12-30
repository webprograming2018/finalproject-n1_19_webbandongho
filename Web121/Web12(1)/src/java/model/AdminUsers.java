/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Trang Nguyen
 */
public class AdminUsers {
    private long adminID;
    private String ten;
    private String adminEmail;
    private String adminPass;
    

    public AdminUsers() {
    }

    public AdminUsers(long adminID, String ten,String adminEmail, String adminPass) {
        this.adminID = adminID;
        this.ten = ten;
        this.adminEmail = adminEmail;
        this.adminPass = adminPass;
    }

    public long getAdminID() {
        return adminID;
    }

    public void setAdminID(long adminID) {
        this.adminID = adminID;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminPass() {
        return adminPass;
    }

    public void setAdminPass(String adminPass) {
        this.adminPass = adminPass;
    }

}
