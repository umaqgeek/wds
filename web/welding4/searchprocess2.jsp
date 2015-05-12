<%@page import="controllers.Starter"%>
<%@page import="models.Welding"%>
<%@page import="java.util.ArrayList"%>
<%
int id = 0;
try {
    id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
}

if(id > 0) {
    session.setAttribute("url_content", "welding4/edit.jsp?id=" + id);
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
} else {
    Starter.setError("Search Not Found!");
    session.setAttribute("url_content", "welding4/mainMenu.jsp");
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
}
%>