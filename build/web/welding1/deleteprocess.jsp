<%@page import="controllers.Starter"%>
<%
//Starter.setUrl_content("welding1/mainMenu.jsp");
//Starter.setUrl_menu("menu/menuAdmin.jsp");
//Starter.setUrl_stat(2);
session.setAttribute("url_content", "welding1/mainMenu.jsp");
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
//out.print("<script>location.href='index.jsp';</script>");
%>