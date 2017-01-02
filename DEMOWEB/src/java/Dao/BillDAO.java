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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class BillDAO {
    public  void insertBill(Bill bill) throws SQLException, SQLException{
        Connection connection=DBConnect.getConnecttion();
        String sql="INSERT INTO bill VALUES (?,?,?,?,?,?)";
        PreparedStatement ps=connection.prepareCall(sql);
        ps.setLong(1,bill.getBill_id());
        ps.setLong(2,bill.getUserID());
        ps.setDouble(3,bill.getTotal());
        ps.setString(4,bill.getPayment());
        ps.setString(5,bill.getAddress());
        ps.setTimestamp(6,bill.getDate());
        ps.executeUpdate();
    }
    public ArrayList<Bill> getListBill() throws SQLException{
        Connection con=DBConnect.getConnecttion();
        String sql="SELECT * FROM bill";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<Bill> list=new ArrayList<>();
        while(rs.next()){
            Bill bill=new Bill();
            bill.setBill_id(rs.getLong("bill_id"));
            bill.setUserID(rs.getLong("user_id"));
            bill.setTotal(rs.getDouble("total"));
            bill.setPayment(rs.getString("payment"));
            bill.setAddress(rs.getString("address"));
            bill.setDate(rs.getTimestamp("date"));
            list.add(bill);
        }
                    return list;
    }
      public boolean xoaDon(long mabill){
        Connection connection=DBConnect.getConnecttion();
        String sql="DELETE FROM bill WHERE bill_id=?";
        try {
            PreparedStatement ps=connection.prepareCall(sql);
            ps.setLong(1,mabill);
            return ps.executeUpdate()==1;
        } catch (SQLException ex) {
            Logger.getLogger(spDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static void main(String[] args) throws SQLException {
//        new BillDAO().insertBill(new Bill(0, 0, 0, "s", "s", new Timestamp(new Date().getTime())));
    BillDAO x=new BillDAO();
    x.xoaDon(0);
    }
}
