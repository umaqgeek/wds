<%@page import="models.Welding_child"%>
<%@page import="models.Welding"%>
<%@page import="controllers.Starter"%>
<%
int w_id = 0;
try {
    w_id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
}
Welding welding = new Welding();
Welding_child welding_child = new Welding_child();
boolean stat = welding.delete(w_id, Integer.parseInt(session.getAttribute("u_id").toString()));
if(stat) {
    welding_child.deleteChild(w_id, Integer.parseInt(session.getAttribute("u_id").toString()));
}
//response.sendRedirect("deleteprocess.jsp");
out.print("<script>location.href='welding3/deleteprocess.jsp';</script>");
%>