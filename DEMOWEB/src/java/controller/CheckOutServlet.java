/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.BillDAO;
import Dao.BillDetailsDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.BillDetails;
import model.Cart;
import model.Item;
import model.Users;
import tool.sendmail;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class CheckOutServlet extends HttpServlet {

    private final BillDAO billDao = new BillDAO();
    private final BillDetailsDAO billdetailsdao = new BillDetailsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Cart cart=(Cart) session.getAttribute("cart");
        Users users = (Users) session.getAttribute("user");
        try {
            long ID = new Date().getTime();
            Bill bill = new Bill();
            bill.setBill_id(ID);
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setUserID(users.getUserID());
            bill.setDate(new Timestamp(new Date().getTime()));
            bill.setTotal(cart.TotalCart());
            billDao.insertBill(bill);
            for (Map.Entry<Long, Item> list : cart.getCartItem().entrySet()) {
                billdetailsdao.insertBillDetail(new BillDetails(0, ID,
                        list.getValue().getSanpham().getMasp(),
                        list.getValue().getSanpham().getGia(),
                        list.getValue().getQuantity()));
            }
            sendmail sm=new sendmail();
            sendmail.sendMail(users.getUserEmail(),"WEBDongHO.net", "Hello"+users.getUserEmail()+"\nTotal:"+cart.TotalCart());
            cart = new Cart();
            session.setAttribute("cart", cart);
        } catch (Exception ex) {
        }response.sendRedirect("/DEMOWEB/index.jsp");
    }
}
