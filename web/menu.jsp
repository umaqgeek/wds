<%@page import="controllers.Login"%>
<%@page import="controllers.Starter"%>
<%
String url_menu = "login/login.jsp";
try {
    url_menu = session.getAttribute("url_menu").toString();
} catch(Exception e) {
    url_menu = "login/login.jsp";
}
if(!url_menu.equals("-")) { %>
    <jsp:include page="<%=url_menu %>"></jsp:include>
<% } %>