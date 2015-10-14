<%@page import="helpers.Func"%>
<%
  
    int start = Func.START_AT;
    int length = Func.LENGTH_SIZE;
    
    try {
        start = Integer.parseInt(request.getParameter("start"));
        length = Integer.parseInt(request.getParameter("length"));
    } catch (Exception e) {
        start = Func.START_AT;
        length = Func.LENGTH_SIZE;
    }
    
    String carian = "";
    try {
        if (request.getParameter("carian") != null) {
            carian = "carian=" + request.getParameter("carian") + "&";
        } else {
            carian = "";
        }
    } catch (Exception e) {
        carian = "";
    }
    
    session.setAttribute("url_content", "welding11/mainMenu.jsp?"+carian+"start="+start+"&length="+length+"");
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
    
%>