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
public class sp {
    private long masp;
    private long Maloai;
    private String tensp;
    private String hinhanh;
    private double gia;
    private String mota;

    public sp() {
    }

    public long getMasp() {
        return masp;
    }

    public void setMasp(long masp) {
        this.masp = masp;
    }

    public long getMaloai() {
        return Maloai;
    }

    public void setMaloai(long maloai) {
        this.Maloai = maloai;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public sp(long masp, long maloai, String tensp, String hinhanh, double gia, String mota) {
        this.masp = masp;
        this.Maloai = maloai;
        this.tensp = tensp;
        this.hinhanh = hinhanh;
        this.gia = gia;
        this.mota = mota;
    }

}
