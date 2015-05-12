<%@page import="controllers.Starter"%>
<%@page import="models.Welding"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<String> column = new ArrayList<String>();
ArrayList<String> data = new ArrayList<String>();
ArrayList<Integer> tanda = new ArrayList<Integer>();

String w_sfnumber = request.getParameter("w_sfnumber");
int fp_id = Integer.parseInt(request.getParameter("fp_id"));
int m_id = Integer.parseInt(request.getParameter("m_id"));

Welding welding = new Welding();
ArrayList<String> weld = welding.get(w_sfnumber, fp_id, m_id);

if(weld.size() > 0) {
    String id = weld.get(0);
    session.setAttribute("url_content", "welding2/edit.jsp?id=" + id);
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
} else {
    Starter.setError("Search Not Found!");
    session.setAttribute("url_content", "welding2/mainMenu.jsp");
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
}
%>