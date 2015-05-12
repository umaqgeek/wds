<%@page import="models.User"%>
<%@page import="models.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.Starter"%>

<%
Component component = new Component();
ArrayList<ArrayList<String>> ut = component.getComponent("user_type", 2);

int u_id = 0;
try {
    u_id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
}

User userr = new User();
ArrayList<String> user = userr.get(u_id);
if(user.size() <= 0) {
    session.setAttribute("url_content", "welding6/mainMenu.jsp");
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
}
%>

<h3 class="panel-title warna-title">UPDATE USER</h3>
<hr />

<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding/mainMenu.jsp?w=6">Back</a>
        </div>
    </div>
</div>

<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<div class="panel-body">
    <form class="form-horizontal" action="welding6/editprocess.jsp" role="form" name="f_edit" id="f_edit" method="post">
        
        <div class="form-group">
            <label for="u_staffno" class="col-lg-2 col-md-3 control-label">Staff No.</label>
            <div class="col-lg-10 col-md-9">
                <input value="<%=user.get(1) %>" type="text" class="form-control form-cascade-control" id="u_staffno" name="u_staffno" placeholder="Enter Staff No.">
            </div>
        </div>

        <div class="form-group">
            <label for="u_fullname" class="col-lg-2 col-md-3 control-label">Full Name</label>
            <div class="col-lg-10 col-md-9">
                <input value="<%=user.get(2) %>" type="text" class="form-control form-cascade-control" id="u_fullname" name="u_fullname" placeholder="Enter Full Name">
            </div>
        </div>
        
        <div class="form-group">
            <label for="u_username" class="col-lg-2 col-md-3 control-label">Username</label>
            <div class="col-lg-10 col-md-9">
                <input readonly="readonly" value="<%=user.get(3) %>" type="text" class="form-control form-cascade-control" id="u_username" name="u_username" placeholder="Enter Username">
            </div>
        </div>
        
        <input type="hidden" name="u_password" id="u_password" value="321cba" />
<%
String get6 = "0";
try {
    if(!user.get(6).isEmpty()) {
        get6 = user.get(6);
    }
} catch (Exception e) {
}
%>
        <div class="form-group">
            <label for="ut_id" class="col-lg-2 col-md-3 control-label">User Type</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="ut_id" id="ut_id">
                    <option value="0" <% if(get6.equals("0")) { out.print("selected"); } %>>-- Please Select User Type --</option>
                    <% for(int i = 0; i < ut.size(); i++) { %>
                    <option value="<%=ut.get(i).get(0) %>" <% if(get6.equals(ut.get(i).get(0))) { out.print("selected"); } %>><%=ut.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>

                <input type="hidden" name="u_status" id="u_status" value="<%=user.get(5) %>" />
                <input type="hidden" name="u_id" id="u_id" value="<%=user.get(0) %>" />

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <a class="tridik btn btn-success" onclick="document.getElementById('f_edit').submit();"> Submit </a>
                <a class="tridik btn btn-danger" onclick="location.href='welding/mainMenu.jsp?w=6'"> Cancel </a>

            </div>
        </div>
    </form>
</div>