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
public class BillDetails {
    private long billDetailID;
    private long Bill_id;
    private long masp;
    private double gia;
    private int quantity;

    public long getBillDetailID() {
        return billDetailID;
    }

    public void setBillDetailID(long billDetailID) {
        this.billDetailID = billDetailID;
    }

    public long getBill_id() {
        return Bill_id;
    }

    public void setBill_id(long Bill_id) {
        this.Bill_id = Bill_id;
    }

    public long getMasp() {
        return masp;
    }

    public void setMasp(long masp) {
        this.masp = masp;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BillDetails(long billDetailID, long Bill_id, long masp, double gia, int quantity) {
        this.billDetailID = billDetailID;
        this.Bill_id = Bill_id;
        this.masp = masp;
        this.gia = gia;
        this.quantity = quantity;
    }

    public BillDetails() {
    }
}
