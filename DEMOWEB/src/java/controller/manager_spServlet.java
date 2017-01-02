/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.spDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.sp;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class manager_spServlet extends HttpServlet {

    spDao x = new spDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String masp = request.getParameter("masp");
        String url = "";
        try {
            switch (command) {
                case "update":
                    x.updatesp(new sp(Long.parseLong(masp),Long.parseLong("maloai"), request.getParameter("tensp"), request.getParameter("hinhanh"), Long.parseLong("gia"), request.getParameter("mota")));
                    url = "/admin/manager.jsp";
                    break;
                case "delete":
                    x.xoasp(Long.parseLong(masp));
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
        String command = request.getParameter("command");
        String maloai = request.getParameter("maloai");
        String tenloai = request.getParameter("tensp");
        String hinhanh = request.getParameter("hinhanh");
        String gia = request.getParameter("gia");
        String mota = request.getParameter("mota");
        String url = "";
        switch (command) {
            case "insert":
                x.insersp(new sp(0, Long.parseLong(maloai), tenloai, hinhanh, Long.parseLong(gia), mota));
                url = "/admin/QLSP.jsp";
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
