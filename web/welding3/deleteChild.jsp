<%@page import="controllers.Starter"%>
<%@page import="models.Welding_child"%>
<%
int wc_id = 0;
int w_id = 0;
try {
    wc_id = Integer.parseInt(request.getParameter("id"));
    w_id = Integer.parseInt(request.getParameter("w_id"));
} catch (Exception e) {
}
Welding_child welding_child = new Welding_child();
boolean stat = welding_child.delete(wc_id, Integer.parseInt(session.getAttribute("u_id").toString()));
out.print("<script>location.href='welding3/deleteChildprocess.jsp?id="+w_id+"';</script>");
%>