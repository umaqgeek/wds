<%@page import="controllers.Starter"%>
<%
int w_status = 0;
String w_sfnumber = "";
String w_sfnumber2 = "";
String w_sfnum = "";
int fp_id = 0;
int m_id = 0;
int wsize_id = 0;
int sup_id = 0;
int sg_id = 0;
int we_id = 0;
int wm_id = 0;
String date_from = "";
String date_to = "";
int ws_id = 0;
int fc_id = 0;
int welder_status = 0;
int cat_id = 0;

try {
    w_status = Integer.parseInt(request.getParameter("w_status"));
    w_sfnumber = request.getParameter("w_sfnumber");
    w_sfnumber2 = request.getParameter("w_sfnumber2");
    if (w_sfnumber == "" && w_sfnumber2.length() > 0) {
        w_sfnum = w_sfnumber2;
    } else if (w_sfnumber2.length() <= 0 && w_sfnumber != "") {
        w_sfnum = w_sfnumber;
    } else {
        w_sfnum = w_sfnumber2;
    }
    fp_id = Integer.parseInt(request.getParameter("fp_id"));
    m_id = Integer.parseInt(request.getParameter("m_id"));
    wsize_id = Integer.parseInt(request.getParameter("wsize_id"));
    sup_id = Integer.parseInt(request.getParameter("sup_id"));
    sg_id = Integer.parseInt(request.getParameter("sg_id"));
    we_id = Integer.parseInt(request.getParameter("we_id"));
    wm_id = Integer.parseInt(request.getParameter("wm_id"));
    date_from = request.getParameter("date_from");
    date_to = request.getParameter("date_to");
    ws_id = Integer.parseInt(request.getParameter("ws_id"));
    fc_id = Integer.parseInt(request.getParameter("fc_id"));
    welder_status = Integer.parseInt(request.getParameter("welder_status"));
    cat_id = Integer.parseInt(request.getParameter("cat_id"));
} catch (Exception e) {
}

session.setAttribute("url_content", "welding5/mainMenu.jsp?w_sfnumber2="+w_sfnumber2+"&w_sfnumber="+w_sfnum+"&fp_id="
        +fp_id+"&m_id="+m_id+"&wsize_id="+wsize_id+"&sup_id="+sup_id+"&sg_id="+sg_id
        +"&we_id="+we_id+"&wm_id="+wm_id+"&date_from="+date_from+"&date_to="+date_to
        +"&ws_id="+ws_id+"&fc_id="+fc_id+"&w_status="+w_status+"&welder_status="+welder_status+"&cat_id="+cat_id);
session.setAttribute("url_menu", "menu/menuAdmin.jsp");
session.setAttribute("url_stat", 2);
response.sendRedirect("../index.jsp");
%>