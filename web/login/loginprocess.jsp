<%@page import="controllers.ReadFiles"%>
<%@page import="sun.misc.UCDecoder"%>
<%@page import="models.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controllers.SessionWIS"%>
<%@page import="controllers.Starter"%>
<%@page import="controllers.Login"%>
<%
String u_username = request.getParameter("u_username");
String u_password = request.getParameter("u_password");

Login lo = new Login();
boolean stat = lo.isLogin(u_username, u_password);

if(stat) {
    String path1 = "";
    String menu1 = "";
    int gol1 = 2;
    User user = new User();
    ResultSet rs = user.getUser(u_username);
    if(rs.next()) {
        int u_id = rs.getInt("u_id");
        String u_staffno = rs.getString("u_staffno");
        String u_fullname = rs.getString("u_fullname");
        u_username = rs.getString("u_username");
        u_password = rs.getString("u_password");
        int u_status = rs.getInt("u_status");
        int ut_id = rs.getInt("ut_id");
        String ut_desc = rs.getString("ut_desc");
        session.setAttribute("u_id", u_id);
        session.setAttribute("u_staffno", u_staffno);
        session.setAttribute("u_fullname", u_fullname);
        session.setAttribute("u_username", u_username);
        session.setAttribute("u_password", u_password);
        session.setAttribute("u_status", u_status);
        session.setAttribute("ut_id", ut_id);
        session.setAttribute("ut_desc", ut_desc);
        session.setAttribute("loggedIn", "true");
        switch(ut_id) {
            case 1:
                path1 = "admin/mainMenu.jsp";
                menu1 = "menu/menuAdmin.jsp";
                break;
            case 2:
                path1 = "qcinspector/mainMenu.jsp";
                menu1 = "menu/menuQcInspector.jsp";
                break;
            default:
                gol1 = 1;
                break;
        }
        session.setAttribute("url_content", path1);
        session.setAttribute("url_menu", menu1);
        session.setAttribute("url_stat", gol1);
        session.setAttribute("pageChoosen", ReadFiles.START_PATH+"/");
        session.setAttribute("fileExcel", "");
        response.sendRedirect("../index.jsp");
    }
} else {
    session.setAttribute("url_stat", 1);
    session.setAttribute("error", "Invalid Username/Password!");
    response.sendRedirect("../index.jsp");
}
%>