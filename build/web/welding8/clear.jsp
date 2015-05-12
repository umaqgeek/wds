<%@page import="controllers.Starter"%>
<%@page import="models.History_log"%>
<%
History_log history_log = new History_log();
boolean stat = history_log.deleteAll(Integer.parseInt(session.getAttribute("u_id").toString()));
session.setAttribute("url_content", "welding8/mainMenu.jsp");
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
//response.sendRedirect("../index.jsp");
out.print("<script>location.href='index.jsp';</script>");
%>