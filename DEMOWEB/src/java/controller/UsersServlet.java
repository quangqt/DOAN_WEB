/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.UsersDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class UsersServlet extends HttpServlet {

    UsersDAO usersDAO = new UsersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                users.setUserID(new java.util.Date().getTime());
                users.setUserName(request.getParameter("username"));
                users.setUserEmail(request.getParameter("useremail"));
                users.setUserPass(request.getParameter("userpass"));
                usersDAO.insertUser(users);
                session.setAttribute("user", users);
                url = "/index.jsp";
                break;
            case "longin":
                users = usersDAO.login(request.getParameter("useremail"), request.getParameter("userpass"));
                if (users != null) {
                    session.setAttribute("user", users);
                    url = "/index.jsp";
                }
                else
                {
                    request.setAttribute("error","Loi dang nhap ");
                    url="/login.jsp";
                }
                break;
            case "dangxuat":
                users=null;
                url="/index.jsp";
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
