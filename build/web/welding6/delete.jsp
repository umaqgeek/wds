<%@page import="controllers.Starter"%>
<%@page import="models.User"%>
<%
int u_id = 0;
try {
    u_id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
}
User user = new User();
boolean stat = user.delete(u_id, Integer.parseInt(session.getAttribute("u_id").toString()));
session.setAttribute("url_content", "welding6/mainMenu.jsp");
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
//response.sendRedirect("../index.jsp");
out.print("<script>location.href='index.jsp';</script>");
%>