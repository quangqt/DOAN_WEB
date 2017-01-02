/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.AdminDao;
import Dao.BillDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.admin;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class AdminServlet extends HttpServlet {

    AdminDao ad = new AdminDao();
    BillDAO bill=new BillDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");
        String url = "";
        String id_admin=request.getParameter("id_admin");
        admin users = new admin();
        HttpSession session = request.getSession();
        switch (command) {
            case "longin": {
            try {
                users = ad.LonginAdmin(request.getParameter("tentk"), request.getParameter("mkadmin"));
                if (users != null) {
                    session.setAttribute("admin", users);
                    url = "/admin/index.jsp";
                } else {
                    request.setAttribute("error", "Loi dang nhap ");
                    url = "/admin/Longin.jsp";
                }
                break;
            } catch (SQLException ex) {
                Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
            case "doimk":
                ad.updatemk(new admin(Long.parseLong(id_admin),"tk","mk"));
                url="/admin/index.jsp";
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }
}
