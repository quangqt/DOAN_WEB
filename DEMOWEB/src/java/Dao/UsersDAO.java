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
import model.Users;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class UsersDAO {

    public boolean checkEmail(String email) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM users WHERE user_email='" + email + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insertUser(Users u) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO users VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getUserEmail());
            ps.setString(4, u.getUserPass());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public Users login(String useremail, String userpass) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from users where user_email='" + useremail + "' and user_pass='" + userpass + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users u = new Users();
                u.setUserID(rs.getLong("user_id"));
                u.setUserName(rs.getString("user_fullname"));
                u.setUserEmail(rs.getString("user_email"));
                u.setUserPass(rs.getString("user_pass"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
  
    public Users getUser(long userID) throws SQLException{
        try{Connection con=DBConnect.getConnecttion();
        String sql="SELECT * FROM users WHERE user_id=?";
        PreparedStatement ps=con.prepareCall(sql);
        ps.setLong(1, userID);
        ResultSet rs=ps.executeQuery();
        Users u=new Users();
        while(rs.next()){
                u.setUserEmail(rs.getString("user_email"));
        }
        return u;
        }catch(SQLException e){
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE,null,e);
        }
        return null;
    }
}
