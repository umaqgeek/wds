<%@page import="controllers.Starter"%>
<%@page import="models.Welding_child"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<String> column = new ArrayList<String>();
ArrayList<String> data = new ArrayList<String>();
ArrayList<Integer> tanda = new ArrayList<Integer>();

int w_id = Integer.parseInt(request.getParameter("w_id"));

column.add("w_id"); data.add(request.getParameter("w_id")); tanda.add(2);
column.add("t_id"); data.add(request.getParameter("t_id")); tanda.add(2);
column.add("we_id"); data.add(request.getParameter("we_id")); tanda.add(2);
column.add("wm_id"); data.add(request.getParameter("wm_id")); tanda.add(2);
String wc_weldingnumber = request.getParameter("wc_weldingnumber");
if(wc_weldingnumber.length() != 5) {
    wc_weldingnumber = "00-00";
}
column.add("wc_weldingnumber"); data.add(wc_weldingnumber); tanda.add(1);
column.add("ws_id"); data.add(request.getParameter("ws_id")); tanda.add(2);
column.add("fc_id"); data.add(request.getParameter("fc_id")); tanda.add(2);
column.add("wc_failuretensile"); data.add(request.getParameter("wc_failuretensile")); tanda.add(1);
column.add("wc_weldduration"); data.add(request.getParameter("wc_weldduration")); tanda.add(1);
column.add("wc_spoolnumber"); data.add(request.getParameter("wc_spoolnumber")); tanda.add(1);
column.add("wc_bobbinnumber"); data.add(request.getParameter("wc_bobbinnumber")); tanda.add(1);
column.add("wc_comments"); data.add(request.getParameter("wc_comments")); tanda.add(1);
column.add("wc_status"); data.add(request.getParameter("wc_status")); tanda.add(2);
column.add("wc_date"); data.add(request.getParameter("wc_date")); tanda.add(1);
column.add("u_id"); data.add(request.getParameter("u_id")); tanda.add(2);

Welding_child wc = new Welding_child();
wc.add(column, data, tanda, Integer.parseInt(session.getAttribute("u_id").toString()));

session.setAttribute("url_content", "welding2/edit.jsp?id="+w_id);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
//out.print("<script>location.href='../index.jsp';</script>");
%>