/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.sp;

public class spDao {
// get danh soD sản phẩm dựa vào mã danh mục

    public ArrayList<sp> getListsp() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM sanpham limit 8";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<sp> list = new ArrayList<>();
        while (rs.next()) {
            sp product = new sp();
            product.setMasp(rs.getLong("Masp"));
            product.setTensp(rs.getString("Tensp"));
            product.setHinhanh(rs.getString("Hinhanh"));
            product.setGia(rs.getDouble("gia"));
            product.setMota(rs.getString("Mota"));
            list.add(product);
        }
        return list;
    }

    //hien thi chi tiet sp 
    public sp getProduct(long masp) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM sanpham WHERE masp='" + masp + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        sp sanpham = new sp();
        while (rs.next()) {
            sanpham.setMasp(rs.getLong("masp"));
            sanpham.setTensp(rs.getString("tensp"));
            sanpham.setHinhanh(rs.getString("hinhanh"));
            sanpham.setGia(rs.getDouble("gia"));
            sanpham.setMota(rs.getString("mota"));
        }
        return sanpham;
    }

    public ArrayList<sp> getListspByloaisp(long Maloai)
            throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM sanpham WHERE maloai = '" + Maloai + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<sp> list = new ArrayList<>();
        while (rs.next()) {
            sp product = new sp();
            product.setMasp(rs.getLong("Masp"));
            product.setTensp(rs.getString("Tensp"));
            product.setHinhanh(rs.getString("Hinhanh"));
            product.setGia(rs.getDouble("gia"));
            product.setMota(rs.getString("Mota"));
            list.add(product);
        }
        return list;
    }

    public ArrayList<sp> getlistallsp(int dau, int cuoi) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM sanpham limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, dau);
        ps.setInt(2, cuoi);
        ResultSet rs = ps.executeQuery();
        ArrayList<sp> list = new ArrayList<>();
        while (rs.next()) {
            sp product = new sp();
            product.setMasp(rs.getLong("masp"));
            product.setTensp(rs.getString("tensp"));
            product.setHinhanh(rs.getString("hinhanh"));
            product.setGia(rs.getDouble("gia"));
            product.setMota(rs.getString("mota"));
            list.add(product);
        }
        return list;
    }

    public ArrayList<sp> getListSanPhamBynav(long maloai, int dau, int cuoi) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM sanpham WHERE maloai = '" + maloai + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, dau);
        ps.setInt(2, cuoi);
        ResultSet rs = ps.executeQuery();
        ArrayList<sp> list = new ArrayList<>();
        while (rs.next()) {
            sp product = new sp();
            product.setMasp(rs.getLong("masp"));
            product.setTensp(rs.getString("tensp"));
            product.setHinhanh(rs.getString("hinhanh"));
            product.setGia(rs.getDouble("gia"));
            product.setMota(rs.getString("mota"));
            list.add(product);
        }
        return list;
    }
    

        public int countSanPhamr() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(masp) FROM sanpham";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }

    

    public int countSanPhamrByLoai(long maloai) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(masp) FROM sanpham WHERE maloai = '" + maloai + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }

    public boolean insersp(sp x) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO sanpham VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, x.getMasp());
            ps.setLong(2, x.getMaloai());
            ps.setString(3, x.getTensp());
            ps.setString(4, x.getHinhanh());
            ps.setDouble(5, x.getGia());
            ps.setString(6, x.getMota());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(spDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updatesp(sp x) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE sanpham set maloai = ?,tensp=?,hinhanh=?,gia=?,mota=? WHERE masp=?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, x.getMaloai());
            ps.setString(2, x.getTensp());
            ps.setString(3, x.getHinhanh());
            ps.setDouble(4, x.getGia());
            ps.setString(5, x.getMota());
            ps.setLong(6, x.getMasp());

            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(spDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }
    public boolean xoasp(long masp){
        Connection connection=DBConnect.getConnecttion();
        String sql="DELETE FROM sanpham WHERE masp=?";
        try {
            PreparedStatement ps=connection.prepareCall(sql);
            ps.setLong(1,masp);
            return ps.executeUpdate()==1;
        } catch (SQLException ex) {
            Logger.getLogger(spDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static void main(String[] args) throws SQLException {
//        for (sp p : dao.getListspByloaisp(2)) {
//            System.out.println(p.getMasp() + " - " + p.getTensp());
//        spDao x = new spDao();
//        x.xoasp(13);
    spDao x=new spDao();
    for(int i=11;i<24;i++){
        x.insersp(new sp(i, 4,"product"+i,"images/10.png", 2000, "abc"));
    }
//        System.out.println(x.countSanPhamr());
    }

}
