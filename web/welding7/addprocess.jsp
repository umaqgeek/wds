<%@page import="models.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.Starter"%>
<%
Component component = new Component();
int num_w = component.getListComponents().length;
String w[][] = component.getListComponents();

int w_check = -1;
try {
    w_check = Integer.parseInt(request.getParameter("w"));
} catch (Exception e) {
}

ArrayList<String> column = new ArrayList<String>();
ArrayList<String> data = new ArrayList<String>();
ArrayList<Integer> tanda = new ArrayList<Integer>();

if(w_check != num_w) {
    column.add(w[w_check-1][1]+"_desc"); data.add(request.getParameter(w[w_check-1][1]+"_desc")); tanda.add(1);
} else {
    column.add("we_staffno"); data.add(request.getParameter("we_staffno")); tanda.add(1);
    column.add("we_fullname"); data.add(request.getParameter("we_fullname")); tanda.add(1);
    column.add("we_expireddate"); data.add(request.getParameter("we_expireddate")); tanda.add(1);
    column.add("we_link"); data.add(request.getParameter("we_link")); tanda.add(1);
    column.add("cat_id"); data.add(request.getParameter("cat_id")); tanda.add(2);
}

component.add(w[w_check-1][2], column, data, tanda, Integer.parseInt(session.getAttribute("u_id").toString()));

session.setAttribute("url_content", "welding7/mainMenu.jsp?w="+w_check);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
//out.print("<script>location.href='../index.jsp';</script>");
%>