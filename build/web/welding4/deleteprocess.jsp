<%@page import="controllers.Starter"%>
<%
session.setAttribute("url_content", "welding4/mainMenu.jsp");
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
//out.print("<script>location.href='index.jsp';</script>");
%>