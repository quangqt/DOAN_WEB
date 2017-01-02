/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.LoaiDao;
import connect.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.loaisp;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class manager_loaispServlet extends HttpServlet {

    LoaiDao x = new LoaiDao();

    public int countloaisp() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(*) FROM loaisp";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count + 1;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String maloai = request.getParameter("maloai");
        String url = "";
        try {
            switch (command) {
                case "update":
                    x.updateloaisp(new loaisp(Long.parseLong(maloai), request.getParameter("tenloai")));
                    url = "/admin/manager.jsp";
                    break;
                case "delete":
                    x.xoaloaisp(Long.parseLong(maloai));
                    url = "/admin/manager.jsp";
                    break;
            }
        } catch (Exception e) {

        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String tenloai = request.getParameter("tenloai");
        String url = "", error = "";
        if (tenloai.equals("")) {
            error = "Vui long nhap ten loai";
            request.setAttribute("error", error);
        }
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        x.insertLoaiSP(new loaisp(0, tenloai));
                        url = "/admin/manager.jsp";
                        break;
                }
            } else {
                url = "/admin/insert_loaisp.jsp";
            }
        } catch (Exception e) {

        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
