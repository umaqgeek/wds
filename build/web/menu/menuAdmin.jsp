<%@page import="controllers.Starter"%>
<%

int ut_id = 0;
try {
    ut_id = Integer.parseInt(session.getAttribute("ut_id").toString());
    if(ut_id == 1) {
        int num = 12;
        String active[] = new String[num];
        String menu[] = {
            "Main Menu", //0
            "Strip Welding", //1 
            "Wire Welding", //2
            "Raboutage", //3
            "Carcass Stop Ring", //4
            "Report", //5
            "Manage User", //6
            "Manage Component", //7
            "Manage Log", //8
            "View Welders", //9
            "View WPS Number", //10
            "Welding Curve Plot" //11
        };
        //String weld = Starter.getUrl_content();
        String weld = session.getAttribute("url_content").toString();
        boolean weld_stat = true;
        for(int i = 0; i < num; i++) {
            if(weld.contains("welding"+(i)+"/")) {
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
            "fa-cogs",
            "fa-cogs",
            "fa-group",
            "fa-group",
            "fa-group"
        };
        %>


        <% for(int i = 0; i < num; i++) { %>

        <li class='<%=active[i] %>'>
                        <a href='welding/mainMenu.jsp?w=<%=i %>' data-original-title='<%=menu[i] %>'>
                        <i class='fa <%=icon[i]%>'>
                        </i>
                        <span class='hidden-minibar'>
                            <%=menu[i] %>
                        </span>
                        </a>
                    </li>
        <% }
    } else if(ut_id == 2) {
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
                        <a href='welding/mainMenu.jsp?w=<%=k %>' data-original-title='<%=menu[i] %>'>
                        <i class='fa <%=icon[i]%>'>
                        </i>
                        <span class='hidden-minibar'>
                            <%=menu[i] %>
                        </span>
                        </a>
                    </li>
        <% k++; }
    }
} catch (Exception e) {
}
%>
              