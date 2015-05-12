<%@page import="controllers.Starter"%>
<%
int w_id = 0;
try {
    w_id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
}
//Starter.setUrl_content("welding1/edit.jsp?id="+w_id);
//Starter.setUrl_menu("menu/menuAdmin.jsp");
//Starter.setUrl_stat(2);
session.setAttribute("url_content", "welding1/edit.jsp?id="+w_id);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
%>