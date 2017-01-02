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
public class Item {
    private sp sanpham;
    private int quantity;

    public Item() {
    }

    public Item(sp sanpham, int quantity) {
        this.sanpham = sanpham;
        this.quantity = quantity;
    }

    public sp getSanpham() {
        return sanpham;
    }

    public void setSanpham(sp sanpham) {
        this.sanpham = sanpham;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
