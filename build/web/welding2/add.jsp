<%@page import="controllers.Starter"%>
<%@page import="models.Component"%>
<%@page import="controllers.SessionWIS"%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%
Component component = new Component();
ArrayList<ArrayList<String>> fp = component.getComponent("fabrication_phase", 2);
ArrayList<ArrayList<String>> m = component.getComponent("machine", 2);
ArrayList<ArrayList<String>> sg = component.getComponent("sta_grade", 2);
ArrayList<ArrayList<String>> wsize = component.getComponent("wire_size", 2);
ArrayList<ArrayList<String>> wn = component.getComponent("wps_number", 2);
ArrayList<ArrayList<String>> sup = component.getComponent("supplier", 2);
ArrayList<ArrayList<String>> cat = component.getComponent("category", 2);
%>

<h3 class="panel-title warna-title">WIRE WELDING (NEW PRODUCTION)</h3>
<hr />

<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding/mainMenu.jsp?w=2">Back</a>
        </div>
    </div>
</div>

<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<!-- start validation -->
 
<script src="assets/js/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="assets/js/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" href="assets/css/validationEngine.jquery.css" type="text/css" />

<script src="assets/js/validation/jquery.maskedinput.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).load(function(){
    $("#f_add").validationEngine();
});
function isFormNull() {
    if(jQuery('#f_add').validationEngine('validate')) {
        document.getElementById('f_add').submit();
    } else {
        alert('Please fill in all field!!');
    }
}

jQuery(function($){
    $("#w_structurenumber").mask("999.99999");
    $("#w_sfnumber").mask("99999.?99999");
});
</script>

<!-- end validation -->

<div class="panel-body">
    <form class="form-horizontal" action="welding2/addprocess.jsp" role="form" name="f_add" id="f_add" method="post">
        <div class="form-group">
            <label for="w_sfnumber" class="col-lg-2 col-md-3 control-label">SF Number</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" id="w_sfnumber" name="w_sfnumber" placeholder="Enter SF Number">
            </div>
        </div>

        <div class="form-group">
            <label for="w_structurenumber" class="col-lg-2 col-md-3 control-label">Structure Number</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" id="w_structurenumber" name="w_structurenumber" placeholder="Enter Structure Number">
            </div>
        </div>

        <div class="form-group">
            <label for="fp_id" class="col-lg-2 col-md-3 control-label">Fabrication Phase</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="fp_id" id="fp_id">
                    <option value="">-- Please Select Fabrication Phase --</option>
                    <% for(int i = 0; i < fp.size(); i++) { %>
                    <option value="<%=fp.get(i).get(0) %>"><%=fp.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="w_projectname" class="col-lg-2 col-md-3 control-label">Project Name</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" id="w_projectname" name="w_projectname" placeholder="Enter Project Name">
            </div>
        </div>
                
        <div class="form-group">
            <label for="m_id" class="col-lg-2 col-md-3 control-label">Manuf. Machine</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="m_id" id="m_id">
                    <option value="">-- Please Select Manuf. Machine --</option>
                    <% for(int i = 0; i < m.size(); i++) { %>
                    <option value="<%=m.get(i).get(0) %>"><%=m.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="cat_id" class="col-lg-2 col-md-3 control-label">Category</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" data-prompt-position="topLeft:70" name="cat_id" id="cat_id">
                    <option value="">-- Please Select Category --</option>
                    <% for(int i = 0; i < cat.size(); i++) { %>
                    <option value="<%=cat.get(i).get(0) %>"><%=cat.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wsize_id" class="col-lg-2 col-md-3 control-label">Size</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="wsize_id" id="wsize_id">
                    <option value="">-- Please Select Size --</option>
                    <% for(int i = 0; i < wsize.size(); i++) { %>
                    <option value="<%=wsize.get(i).get(0) %>"><%=wsize.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="sg_id" class="col-lg-2 col-md-3 control-label">STA Grade</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="sg_id" id="sg_id">
                    <option value="">-- Please Select STA Grade --</option>
                    <% for(int i = 0; i < sg.size(); i++) { %>
                    <option value="<%=sg.get(i).get(0) %>"><%=sg.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wn_id" class="col-lg-2 col-md-3 control-label">WPS Number</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="wn_id" id="wn_id">
                    <option value="">-- Please Select WPS Number --</option>
                    <% for(int i = 0; i < wn.size(); i++) { %>
                    <option value="<%=wn.get(i).get(0) %>"><%=Func.getLinkNo(wn.get(i).get(1)) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="sup_id" class="col-lg-2 col-md-3 control-label">Supplier</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="sup_id" id="sup_id">
                    <option value="">-- Please Select Supplier --</option>
                    <% for(int i = 0; i < sup.size(); i++) { %>
                    <option value="<%=sup.get(i).get(0) %>"><%=sup.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
                <input type="hidden" name="w_date" id="w_date" value="<%=Func.getTodayDate() %>" />
                <input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("u_id") %>" />
                <input type="hidden" name="w_status" id="w_status" value="2" />

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <a class="tridik btn btn-success" onclick="isFormNull();"> Submit </a>
                <a class="tridik btn btn-danger" onclick="location.href='welding/mainMenu.jsp?w=2'"> Cancel </a>

            </div>
        </div>
    </form>
</div>