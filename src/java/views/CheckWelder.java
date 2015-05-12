/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import beans.Expired_Lejer_Bean;
import beans.WelderBean;
import helpers.Func;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Component;
import models.Expired_Lejer;
import models.Welder;
import models.Welding_child;

/**
 *
 * @author End User
 */
@WebServlet(name = "CheckWelder", urlPatterns = {"/CheckWelder"})
public class CheckWelder extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckWelder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckWelder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        Component com = new Component();
        try {
            String we_id = request.getParameter("weid");
            if (we_id.length() > 0) {
                int weid = 0;
                try {
                    weid = Integer.parseInt(we_id);
                } catch (Exception e) {
                    weid = 0;
                    System.out.println("CheckWelder 101: "+e.getMessage());
                }
                ArrayList<String> comp = com.get("we_id", "welder", weid, 6);
                if (comp.size() > 0) {
                    String welder_date = comp.get(3);
                    String today_date = Func.getTodayDate();
                    boolean welder_stat = Func.isWelderValid(welder_date, today_date);
                    Func func = new Func();
                    Welding_child wchild = new Welding_child();
                    String wc_date = wchild.getWelderWCDate(Integer.parseInt(we_id));
                    Expired_Lejer el = new Expired_Lejer();
                    Expired_Lejer_Bean elb = el.getExpiredLejer(2); // 2 means warning type
                    String expired_status = func.expiredReason(we_id, today_date, "-", elb, wc_date);
                    Welder wel = new Welder();
                    WelderBean wb = new WelderBean();
                    wb.setWe_id(weid);
                    wb = wel.getWelder(wb);
                    String expired_cert = func.colorValid(we_id, wb.getWe_expireddate(), Func.getTodayDate(), elb, wc_date);
                    
                    if (!welder_stat) {
                        out.print("3"); //normal expired
                    } else if (expired_status.contains("red")) {
                        out.print("4"); //expired 6 month
                    } else if (expired_status.contains("orange") || expired_cert.contains("orange")) {
                        out.print("5"); //warning 5 month
                    } else {
                        out.print("1"); //valid
                    }
                    
                } else {
                    out.print("2"); //welder not found
                }
            } else {
                out.print("999"); //valid
            }
        } finally {
            out.close();
        }
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
