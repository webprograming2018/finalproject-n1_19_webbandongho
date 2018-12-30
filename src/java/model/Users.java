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
public class Users {
    private long userID;
    private String ten;
    private String userEmail;
    private String userPass;
    private boolean userRole;

    public Users() {
    }

    public Users(long userID, String ten,String userEmail, String userPass, boolean userRole) {
        this.userID = userID;
        this.ten = ten;
        this.userEmail = userEmail;
        this.userPass = userPass;
        this.userRole = userRole;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }
    

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public boolean isUserRole() {
        return userRole;
    }

    public void setUserRole(boolean userRole) {
        this.userRole = userRole;
    }
}
