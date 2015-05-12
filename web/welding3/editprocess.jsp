<%@page import="controllers.Starter"%>
<%@page import="models.Welding"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<String> column = new ArrayList<String>();
ArrayList<String> data = new ArrayList<String>();
ArrayList<Integer> tanda = new ArrayList<Integer>();

int w_id = Integer.parseInt(request.getParameter("w_id"));
String w_sfnumber = request.getParameter("w_sfnumber");

column.add("w_sfnumber"); data.add(w_sfnumber); tanda.add(1);
String w_structurenumber = request.getParameter("w_structurenumber");
if(w_structurenumber.length() != 9) {
    w_structurenumber = "000.00000";
}
column.add("w_structurenumber"); data.add(w_structurenumber); tanda.add(1);
column.add("w_structurenumber"); data.add(w_structurenumber); tanda.add(1);
column.add("fp_id"); data.add(request.getParameter("fp_id")); tanda.add(2);
column.add("w_projectname"); data.add(request.getParameter("w_projectname")); tanda.add(1);
column.add("m_id"); data.add(request.getParameter("m_id")); tanda.add(2);
column.add("cat_id"); data.add(request.getParameter("cat_id")); tanda.add(2);
column.add("wsize_id"); data.add(request.getParameter("wsize_id")); tanda.add(2);
column.add("sg_id"); data.add(request.getParameter("sg_id")); tanda.add(2);
column.add("wn_id"); data.add(request.getParameter("wn_id")); tanda.add(2);
column.add("w_date"); data.add(request.getParameter("w_date")); tanda.add(1);
column.add("u_id"); data.add(request.getParameter("u_id")); tanda.add(2);
column.add("w_status"); data.add(request.getParameter("w_status")); tanda.add(2);

Welding welding = new Welding();
welding.edit(w_id, column, data, tanda, Integer.parseInt(session.getAttribute("u_id").toString())); //edit welding data

session.setAttribute("url_content", "welding3/edit.jsp?id="+w_id);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
//out.print("<script>location.href='../index.jsp';</script>");
%>