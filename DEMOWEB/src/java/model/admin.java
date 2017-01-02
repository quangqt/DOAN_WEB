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
public class admin {
    private long id_admin;
    private String tentk;
    private String mk;

    public admin() {
    }

    public admin(long id_admin, String tentk, String mk) {
        this.id_admin = id_admin;
        this.tentk = tentk;
        this.mk = mk;
    }

    public long getId_admin() {
        return id_admin;
    }

    public void setId_admin(long id_admin) {
        this.id_admin = id_admin;
    }

    public String getTentk() {
        return tentk;
    }

    public void setTentk(String tentk) {
        this.tentk = tentk;
    }

    public String getMk() {
        return mk;
    }

    public void setMk(String mk) {
        this.mk = mk;
    }
    
}
