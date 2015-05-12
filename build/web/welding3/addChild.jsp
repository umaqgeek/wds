
<%@page import="models.Welding"%>
<%@page import="models.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.Func"%>
<%@page import="controllers.SessionWIS"%>
<%@page import="controllers.Starter"%>
<%
Component component = new Component();
ArrayList<ArrayList<String>> t = component.getComponent("team", 2);
ArrayList<ArrayList<String>> we = component.getComponent("welder", 6);
ArrayList<ArrayList<String>> wm = component.getComponent("welding_machine", 2);
ArrayList<ArrayList<String>> wp = component.getComponent("welding_process", 2);
ArrayList<ArrayList<String>> ws = component.getComponent("welding_status", 2);
ArrayList<ArrayList<String>> fc = component.getComponent("failure_caused", 2);

int w_id = 0;
try {
    w_id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
    session.setAttribute("url_content", "welding3/add.jsp");
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
}


%>

<h3 class="panel-title">Add Raboutage Job</h3>
<hr />
<!-- start validation -->
 
<script src="assets/js/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="assets/js/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" href="assets/css/validationEngine.jquery.css" type="text/css"/>

<script>
$(document).load(function(){
    $("#f_add").validationEngine();
   });
   
   
   
</script>
<a href="#" onclick="alert('is the form valid? '+jQuery('#f_add').validationEngine('validate'))">Evaluate form</a>

<!-- end validation -->
<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="btn btn-success" href="welding3/mainMenu.jsp?process=edit&id=<%=w_id %>">Back</a>
        </div>
    </div>
</div>
        
<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<div class="panel-body">
    <form class="form-horizontal" action="welding3/addchildprocess.jsp" role="form" name="f_addchild" id="f_addchild" method="post">
        
        <input type="hidden" name="w_id" id="w_id" value="<%=w_id %>" />
        
        <div class="form-group">
            <label for="t_id" class="col-lg-2 col-md-3 control-label">Team</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="t_id" id="t_id">
                    <option value="0">-- Please Select Team --</option>
                    <% for(int i = 0; i < t.size(); i++) { %>
                    <option value="<%=t.get(i).get(0) %>"><%=t.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="we_id" class="col-lg-2 col-md-3 control-label">Welder</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="we_id" id="we_id">
                    <option value="0">-- Please Select Welder --</option>
                    <% for(int i = 0; i < we.size(); i++) { %>
                    <option value="<%=we.get(i).get(0) %>"><%=we.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wm_id" class="col-lg-2 col-md-3 control-label">Welding Machine</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="wm_id" id="wm_id">
                    <option value="0">-- Please Select Welding Machine --</option>
                    <% for(int i = 0; i < wm.size(); i++) { %>
                    <option value="<%=wm.get(i).get(0) %>"><%=wm.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="wp_id" class="col-lg-2 col-md-3 control-label">Welding Process</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="wp_id" id="wp_id">
                    <option value="0">-- Please Select Welding Process --</option>
                    <% for(int i = 0; i < wp.size(); i++) { %>
                    <option value="<%=wp.get(i).get(0) %>"><%=wp.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wc_weldlength" class="col-lg-2 col-md-3 control-label">Weld Length (m)</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" id="wc_weldlength" name="wc_weldlength" placeholder="Enter Weld Length (m)">
            </div>
        </div>

        <div class="form-group">
            <label for="ws_id" class="col-lg-2 col-md-3 control-label">Welding Status</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="ws_id" id="ws_id">
                    <option value="0">-- Please Select Welding Status --</option>
                    <% for(int i = 0; i < ws.size(); i++) { %>
                    <option value="<%=ws.get(i).get(0) %>"><%=ws.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="fc_id" class="col-lg-2 col-md-3 control-label">If failed, why?</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="fc_id" id="fc_id">
                    <option value="0">-- Please Select Failure Caused --</option>
                    <% for(int i = 0; i < fc.size(); i++) { %>
                    <option value="<%=fc.get(i).get(0) %>"><%=fc.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
                <input type="hidden" name="wc_date" id="wc_date" value="<%=Func.getTodayDate() %>" />
                <input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("u_id") %>" />
                <input type="hidden" name="wc_status" id="wc_status" value="3" />

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <a class="btn btn-success" onclick="document.getElementById('f_addchild').submit();"> Submit </a>
                <a class="btn btn-danger" onclick="document.getElementById('f_addchild').setAttribute('*', '');"> Cancel </a>

            </div>
        </div>
    </form>
</div>