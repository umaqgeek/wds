/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import models.Component;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author End User
 */
@WebServlet(name = "FileUploadServlet", urlPatterns = {"/FileUploadServlet"})
public class FileUploadServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Component com = new Component();
//        int num_w = com.getListComponents().length;
        String w[][] = com.getListComponents();
        int w_check = -1;
        int id = -1;
        ArrayList<String> column = new ArrayList<String>();
        ArrayList<String> data = new ArrayList<String>();
        ArrayList<Integer> tanda = new ArrayList<Integer>();
        response.setContentType("text/html");
        boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
        String u_id = "0";
        ArrayList<String> cat_id = new ArrayList<String>();
        if (isMultiPart) {
            ServletFileUpload upload = new ServletFileUpload();
            try {
                boolean uploadstat = false;
                FileItemIterator itr = upload.getItemIterator(request);
                while(itr.hasNext()) {
                    FileItemStream item = itr.next();
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte[] b = new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
//                        System.out.println("fieldName: " + fieldName);
//                        System.out.println("value: " + value);
                        if(fieldName.equals("u_id")) {
                            u_id = value;
                        } else {
                            //response.getWriter().println(fieldName+": "+value+"<br />");
                            if (fieldName.equals("w")) {
                                w_check = Integer.parseInt(value);
                            } else if (fieldName.equals(w[w_check - 1][1] + "_id")) {
                                id = Integer.parseInt(value);
                            } else if (fieldName.equals("we_link2")) {
                                if (uploadstat) {
                                    column.add("we_link");
                                    data.add(value);
                                    tanda.add(1);
                                    uploadstat = false;
                                }
                            } else if (fieldName.equals("wn_linkno2")) {
                                if (uploadstat) {
                                    column.add("wn_linkno");
                                    data.add(value);
                                    tanda.add(1);
                                    uploadstat = false;
                                }
                            } else if (fieldName.equals("cat_id")) {
                                cat_id.add(value);
                            } else {
                                column.add(fieldName);
                                data.add(value);
                                tanda.add(1);
                            }
                        }
                    } else {
                        String fieldName = item.getFieldName();
                        String path = getServletContext().getRealPath("/");
                        //response.getWriter().println(item.getName());
                        response.getWriter().println(".. Uploading File ... Please wait ....");
                        if(FileUpload.processFile(path, item)) {
                            response.getWriter().println("File Uploaded..");
                        } else {
                            response.getWriter().println("Failed Uploaded!!");
                            uploadstat = true;
                        }
                        column.add(fieldName); data.add(item.getName()); tanda.add(1);
                    }
                }
//                HttpSession httpSession = new HttpSession() {
//
//                    String u_id;
//                    @Override
//                    public long getCreationTime() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public String getId() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public long getLastAccessedTime() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public ServletContext getServletContext() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public void setMaxInactiveInterval(int interval) {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public int getMaxInactiveInterval() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public HttpSessionContext getSessionContext() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public Object getAttribute(String name) {
//                        return u_id;
//                    }
//
//                    @Override
//                    public Object getValue(String name) {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public Enumeration<String> getAttributeNames() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public String[] getValueNames() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public void setAttribute(String name, Object value) {
//                        u_id = value.toString();
//                    }
//
//                    @Override
//                    public void putValue(String name, Object value) {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public void removeAttribute(String name) {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public void removeValue(String name) {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public void invalidate() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//
//                    @Override
//                    public boolean isNew() {
//                        throw new UnsupportedOperationException("Not supported yet.");
//                    }
//                };
//                httpSession.setAttribute("u_id", u_id);
                int uu_id = 0;
                try {
                    uu_id = Integer.parseInt(u_id);
                } catch (Exception e) {
                }
                boolean stat = false;
                if(id != -1) {
                    stat = com.edit(w[w_check-1][1]+"_id", w[w_check-1][2], id, column, data, tanda, uu_id);
                    if (stat == true && cat_id.size() > 0) {
                        if (w[w_check - 1][2].equals("welder")) {
                            com.editWeCat(id, cat_id, uu_id);
                        } else if (w[w_check - 1][2].equals("wps_number")) {
                            com.editWnCat(id, cat_id, uu_id);
                        }
                    }
                } else {
                    stat = com.add(w[w_check - 1][2], column, data, tanda, uu_id);
                    if (stat == true && cat_id.size() > 0) {
                        if (w[w_check - 1][2].equals("welder")) {
                            com.addWeCat(cat_id, uu_id);
                        } else if (w[w_check - 1][2].equals("wps_number")) {
                            com.addWnCat(cat_id, uu_id);
                        }
                    }
                }
                //Starter.setUrl_content("welding7/mainMenu.jsp?w=" + w_check);
                //Starter.setUrl_menu("menu/menuAdmin.jsp");
                //Starter.setUrl_stat(2);
                //response.sendRedirect("../index.jsp");
            } catch (Exception e) {
                System.out.println("FileUploadServlet 218: "+e.getMessage());
            }
        }
        response.getWriter().println("<script>location.href='index.jsp?url_stat=3&w_check="+w_check+"';</script>");
    }

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
            out.println("<title>Servlet FileUploadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FileUploadServlet at " + request.getContextPath() + "</h1>");
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
