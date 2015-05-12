<%@page import="models.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.Starter"%>
<%
ArrayList<String> column = new ArrayList<String>();
ArrayList<String> data = new ArrayList<String>();
ArrayList<Integer> tanda = new ArrayList<Integer>();

int u_id = Integer.parseInt(request.getParameter("u_id"));
column.add("u_staffno"); data.add(request.getParameter("u_staffno")); tanda.add(1);
column.add("u_fullname"); data.add(request.getParameter("u_fullname")); tanda.add(1);
column.add("u_username"); data.add(request.getParameter("u_username")); tanda.add(1);
column.add("u_password"); data.add(request.getParameter("u_password")); tanda.add(1);
column.add("ut_id"); data.add(request.getParameter("ut_id")); tanda.add(2);
column.add("u_status"); data.add(request.getParameter("u_status")); tanda.add(2);

User user = new User();
user.edit(u_id, column, data, tanda, Integer.parseInt(session.getAttribute("u_id").toString())); //edit user data

session.setAttribute("url_content", "welding6/mainMenu.jsp");
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
//out.print("<script>location.href='../index.jsp';</script>");
%>