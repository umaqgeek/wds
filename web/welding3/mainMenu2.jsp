<%@page import="controllers.Starter"%>
<%
String process = "";

try {
    process = request.getParameter("process");      
    if(process.equals("add")) {
        session.setAttribute("url_content", "welding3/add.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else if(process.equals("edit")) {
        String id = request.getParameter("id");
        session.setAttribute("url_content", "welding3/edit.jsp?id="+id);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else if(process.equals("delete")) {
        String id = request.getParameter("id");
        session.setAttribute("url_content", "welding3/delete.jsp?id="+id);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else if(process.equals("addChild")) {
        String id = request.getParameter("id");
        session.setAttribute("url_content", "welding3/addChild.jsp?id="+id);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else if(process.equals("deleteChild")) {
        String id = request.getParameter("id");
        String w_id = request.getParameter("w_id");
        session.setAttribute("url_content", "welding3/deleteChild.jsp?id="+id+"&w_id="+w_id);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}
%>