<%@page import="controllers.Login"%>
<%@page import="controllers.SessionWIS"%>
<%@page import="controllers.Starter"%>
<%
//Login.setLogout();
session.setAttribute("u_id", 0);
session.setAttribute("u_staffno", "");
session.setAttribute("u_fullname", "");
session.setAttribute("u_username", "");
session.setAttribute("u_password", "");
session.setAttribute("u_status", 0);
session.setAttribute("ut_id", 0);
session.setAttribute("ut_desc", "");
session.setAttribute("url_stat", 1);
session.setAttribute("loggedIn", "false");
response.sendRedirect("../index.jsp");
%>