/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class Bill {
    private long Bill_id;
    private long userID;
    private double total;
    private String payment;
    private String address;
    private Timestamp date;

    public long getBill_id() {
        return Bill_id;
    }

    public void setBill_id(long Bill_id) {
        this.Bill_id = Bill_id;
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

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Bill(long Bill_id, long userID, double total, String payment, String address, Timestamp date) {
        this.Bill_id = Bill_id;
        this.userID = userID;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
    }

    public Bill() {
    }
}
