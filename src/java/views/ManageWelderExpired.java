/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package views;

import beans.Expired_Lejer_Bean;
import controllers.Starter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Expired_Lejer;

/**
 *
 * @author End User
 */
@WebServlet(name = "ManageWelderExpired", urlPatterns = {"/ManageWelderExpired"})
public class ManageWelderExpired extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageWelderExpired</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageWelderExpired at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
//            PrintWriter out = response.getWriter();
            
            int el_id = Integer.parseInt(request.getParameter("el_id"));
            String el_time = (String) request.getParameter("el_time");
            
            Expired_Lejer_Bean elb = new Expired_Lejer_Bean();
            elb.setEl_id(el_id);
            elb.setEl_time(el_time);
            
            Expired_Lejer el = new Expired_Lejer();
            boolean status = el.editExpiredLejer(elb, Integer.parseInt((String) request.getAttribute("u_id")));
            
            if (status) {
                Starter.setSucces("Warning Expired updated ..");
            }
            
        } catch (Exception e) {
        }
        response.getWriter().println("<script>location.href='welding7/editExpired2.jsp';</script>");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
