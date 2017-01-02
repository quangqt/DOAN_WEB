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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.admin;




/**
 *
 * @author SUALAPTOP24h.NET
 */
public class AdminDao {
    public admin LonginAdmin(String tkad,String mkad) throws SQLException{
        Connection con=DBConnect.getConnecttion();
        String sql="SELECT * FROM admin WHERE tk='"+tkad+"'and mk='"+mkad+"'";
        PreparedStatement ps;
        try{
            ps=(PreparedStatement) con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                admin x=new admin();
                x.setId_admin(rs.getLong("id_admin"));
                x.setTentk(rs.getString("tk"));
                x.setMk(rs.getString("mk"));
                con.close();
                return x;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
        public boolean updatemk(admin x) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "UPDATE admin set mk=? WHERE id_admin=?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, x.getMk());
            ps.setLong(2,x.getId_admin());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException ex) {
            Logger.getLogger(spDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
