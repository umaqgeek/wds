<%@page import="models.Component"%>
<%@page import="controllers.Starter"%>
<%
Component component = new Component();
int num_w = component.getListComponents().length;
String w[][] = component.getListComponents();

int w_check = -1;
try {
    w_check = Integer.parseInt(request.getParameter("w"));
    if(w_check >= 1 && w_check <= num_w) {
        session.setAttribute("url_content", "welding7/mainMenu2.jsp?w="+w_check);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else {
        session.setAttribute("url_content", "welding7/mainMenu2.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}

String process = "";
String wdata = "";

try {
    process = request.getParameter("process");
    wdata = request.getParameter("w");
    if(process.equals("add")) {
        session.setAttribute("url_content", "welding7/add.jsp?w="+wdata);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else if(process.equals("edit")) {
        String id = request.getParameter("id");
        session.setAttribute("url_content", "welding7/edit.jsp?w="+wdata+"&id="+id);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else if(process.equals("delete")) {
        String id = request.getParameter("id");
        session.setAttribute("url_content", "welding7/delete.jsp?w="+wdata+"&id="+id);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}
%>