<%@page import="controllers.Starter"%>
<%
int w_id = 0;
try {
    w_id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
}
session.setAttribute("url_content", "welding2/edit.jsp?id="+w_id);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
%>