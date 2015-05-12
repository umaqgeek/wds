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
        session.setAttribute("url_content", "welding7/mainMenu.jsp?w="+w_check);
    } else {
        session.setAttribute("url_content", "welding7/mainMenu.jsp");
    }
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    //response.sendRedirect("../index.jsp");
    out.print("<script>location.href='index.jsp';</script>");
} catch (Exception e) {
}

int id = 0;
try {
    id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
}
boolean stat = component.delete(w[w_check-1][1]+"_id", w[w_check-1][2], id, Integer.parseInt(session.getAttribute("u_id").toString()));

session.setAttribute("url_content", "welding7/mainMenu.jsp?w="+w_check);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
//out.print("<script>location.href='index.jsp';</script>");
%>