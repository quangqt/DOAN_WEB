/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

/**
 *
 * @author SUALAPTOP24h.NET
 */
import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.loaisp;

public class LoaiDao {
// get danh sách thể loại

    public ArrayList<loaisp> getListLoaisp() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM loaisp";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<loaisp> list = new ArrayList<>();
        while (rs.next()) {
            loaisp category = new loaisp();
            category.setMaloai(rs.getInt("Maloai"));
            category.setTenloai(rs.getString("Tenloai"));
            list.add(category);
        }
        return list;
    }
    public boolean insertLoaiSP(loaisp c){
        Connection connection=DBConnect.getConnecttion();
        String sql="INSERT INTO LoaiSP VALUES(?,?)";
        try {
            PreparedStatement ps=connection.prepareCall(sql);
            ps.setLong(1, c.getMaloai());
            ps.setString(2,c.getTenloai());
            return ps.executeUpdate()==1;
        } catch (SQLException ex) {
            Logger.getLogger(LoaiDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
      public boolean updateloaisp(loaisp x) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE loaisp set tenloai=? WHERE maloai=?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, x.getTenloai());
            ps.setLong(2, x.getMaloai());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException ex) {
            Logger.getLogger(spDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean xoaloaisp(long maloai){
        Connection connection=DBConnect.getConnecttion();
        String sql="DELETE FROM loaisp WHERE maloai=?";
        try {
            PreparedStatement ps=connection.prepareCall(sql);
            ps.setLong(1,maloai);
            return ps.executeUpdate()==1;
        } catch (SQLException ex) {
            Logger.getLogger(spDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
      public loaisp getProduct(long maloai) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM loaisp WHERE maloai='" + maloai + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        loaisp sanpham = new loaisp();
        while (rs.next()) {
            sanpham.setMaloai(rs.getLong("maloai"));
            sanpham.setTenloai(rs.getString("tenloai"));
        }
        return sanpham;
    }
    public static void main(String[] args) throws SQLException {
        LoaiDao dao = new LoaiDao();
        for(int i=10;i<12;i++){
            dao.insertLoaiSP(new loaisp(i, "Sanpham"+i));
        }
//        for (loaisp ds : dao.getListLoaisp()) {
//            System.out.println(ds.getMaloai() + " - " + ds.getTenloai());
//        }
    }
}
