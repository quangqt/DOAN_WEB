/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Dao.spDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.sp;

/**
 *
 * @author SUALAPTOP24h.NET
 */
public class CartServlet extends HttpServlet {

    private final spDao spdao=new spDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session=request.getSession();
            String command=request.getParameter("command");
            String Masp=request.getParameter("Masp");
            Cart cart=(Cart) session.getAttribute("cart");
            try{
                Long idsp=Long.parseLong(Masp);
            sp x=spdao.getProduct(idsp);
                switch(command){
                    case "plus":
               
                        if(cart.getCartItem().containsKey(idsp)){
                            cart.plusToCart(idsp,new Item(x,cart.getCartItem().get(idsp).getQuantity()));
                        }
                        else{
                            cart.plusToCart(idsp, new Item(x,1));
                        }                            
                        break;
                    case "remove":
                        cart.removeToCart(idsp);
                        break;
                }
            }
            catch(Exception e){
                e.printStackTrace();
                response.sendRedirect("/DEMOWEB/giohang.jsp");
            }
            session.setAttribute("cart",cart);
            response.sendRedirect("/DEMOWEB/index.jsp");

    }

}
