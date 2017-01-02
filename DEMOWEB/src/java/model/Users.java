/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class Users {
    private long userID;
    private String userName;
    private String userEmail;
    private String userPass;

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public Users(long userID, String userName, String userEmail, String userPass) {
        this.userID = userID;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPass = userPass;
    }
    public Users() {
    }

    
}
