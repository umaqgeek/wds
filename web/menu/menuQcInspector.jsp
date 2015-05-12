<%@page import="controllers.Starter"%>
<%
int num = 8;
String active[] = new String[num];
String menu[] = {
    "Main Menu", //0
    "Strip Welding", //1 
    "Wire Welding", //2
    "Raboutage", //3
    "Carcass Stop Ring", //4
    "Report", //5
    "View Welders", //6
    "View WPS Number" //7
};
//String weld = Starter.getUrl_content();
String weld = session.getAttribute("url_content").toString();
boolean weld_stat = true;
int j = 0;
for(int i = 0; i < num; i++) {
    if(i == num-1) {
        j = 10;
    } else if(i == num-2) {
        j = 9;
    } else {
        j = i;
    }
    if(weld.contains("welding"+(j)+"/")) {
        active[i] = "active";
        weld_stat = false;
    } else {
        active[i] = "";
    }
}
if(weld_stat) {
    active[0] = "active";
}

String icon[]={
    "fa-dashboard",
    "fa-ellipsis-horizontal",
    "fa-ellipsis-vertical",
    "fa-anchor",
    "fa-circle-o",
    "fa-book",
    "fa-group",
    "fa-group"
};
%>

<% 
int k = 0;
for(int i = 0; i < num; i++) { 
    if(i == num-1) {
        k = 10;
    } else if(i == num-2) {
        k = 9;
    }
%>

<li class='<%=active[i] %>'>
                <a href='welding/mainMenu.jsp?w=<%=k %>' data-original-title='Dashboard'>
                  <i class='fa <%=icon[i]%>'>
                  </i>
                  <span class='hidden-minibar'>
                    <%=menu[i] %>
                  </span>
                </a>
              </li>
<% k++; } %>
              