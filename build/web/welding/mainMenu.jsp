<%@page import="controllers.Starter"%>
<%
String w = request.getParameter("w");

if(Integer.parseInt(w) >= 1 && Integer.parseInt(w) <= 11) {
    //Starter.setUrl_content("welding"+w+"/mainMenu.jsp");
    session.setAttribute("url_content", "welding"+w+"/mainMenu.jsp");
} else {
    //Starter.setUrl_content("admin/mainMenu.jsp");
    session.setAttribute("url_content", "admin/mainMenu.jsp");
}
//Starter.setUrl_menu("menu/menuAdmin.jsp");
//Starter.setUrl_stat(2);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
%>