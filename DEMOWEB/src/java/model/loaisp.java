/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 */
public class loaisp {

    private long Maloai;
    private String Tenloai;

    public loaisp() {
    }

    public loaisp(String Tenloai) {
        this.Tenloai = Tenloai;
    }

    public loaisp(long Maloai, String Tenloai) {
        this.Maloai = Maloai;
        this.Tenloai = Tenloai;
    }

    public long getMaloai() {
        return Maloai;
    }

    public void setMaloai(long Maloai) {
        this.Maloai = Maloai;
    }

    public String getTenloai() {
        return Tenloai;
    }

    public void setTenloai(String Tenloai) {
        this.Tenloai = Tenloai;
    }
}
