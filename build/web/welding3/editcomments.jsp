<%@page import="models.Welding_child"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<String> column = new ArrayList<String>();
ArrayList<String> data = new ArrayList<String>();
ArrayList<Integer> tanda = new ArrayList<Integer>();

int wc_id = Integer.parseInt(request.getParameter("wc_id"));
int w_id = Integer.parseInt(request.getParameter("w_id"));

column.add("t_id"); data.add(request.getParameter("t_id_komen")); tanda.add(2);
column.add("we_id"); data.add(request.getParameter("we_id_komen")); tanda.add(2);
column.add("wm_id"); data.add(request.getParameter("wm_id_komen")); tanda.add(2);
column.add("wp_id"); data.add(request.getParameter("wp_id_komen")); tanda.add(2);
column.add("wc_weldlength"); data.add(request.getParameter("wc_weldlength_komen")); tanda.add(1);
column.add("ws_id"); data.add(request.getParameter("ws_id_komen")); tanda.add(2);
column.add("fc_id"); data.add(request.getParameter("fc_id_komen")); tanda.add(2);

column.add("wc_comments"); data.add(request.getParameter("wc_comments")); tanda.add(1);

Welding_child welding_child = new Welding_child();
welding_child.edit(wc_id, column, data, tanda, Integer.parseInt(session.getAttribute("u_id").toString()));

session.setAttribute("url_content", "welding3/edit.jsp?id="+w_id);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
%>