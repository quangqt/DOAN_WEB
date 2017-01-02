/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.BillDetails;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class BillDetailsDAO {

    public void insertBillDetail(BillDetails bd) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO bill_detail VALUES(?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bd.getBillDetailID());
        ps.setLong(2, bd.getBill_id());
        ps.setLong(3, bd.getMasp());
        ps.setDouble(4, bd.getGia());
        ps.setInt(5, bd.getQuantity());
        ps.executeUpdate();
    }

    public static void main(String[] args) throws SQLException {
        new BillDetailsDAO().insertBillDetail(new BillDetails(0, 0, 0, 0, 0));
    }
}
