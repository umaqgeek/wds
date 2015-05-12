<%@page import="models.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.Starter"%>

<%
Component component = new Component();
ArrayList<ArrayList<String>> ut = component.getComponent("user_type", 2);
%>

<h3 class="panel-title warna-title">ADD USER</h3>
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

<!-- end validation -->
<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding/mainMenu.jsp?w=6">Back</a>
        </div>
    </div>
</div>

<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<div class="panel-body">
    <form class="form-horizontal" action="welding6/addprocess.jsp" role="form" name="f_add" id="f_add" method="post">
        
        <div class="form-group">
            <label for="u_staffno" class="col-lg-2 col-md-3 control-label">Staff No.</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" id="u_staffno" name="u_staffno" placeholder="Enter Staff No.">
            </div>
        </div>

        <div class="form-group">
            <label for="u_fullname" class="col-lg-2 col-md-3 control-label">Full Name</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" id="u_fullname" name="u_fullname" placeholder="Enter Full Name">
            </div>
        </div>
        
        <div class="form-group">
            <label for="u_username" class="col-lg-2 col-md-3 control-label">Username</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" id="u_username" name="u_username" placeholder="Enter Username">
            </div>
        </div>
        
        <input type="hidden" name="u_password" id="u_password" value="321cba" />

        <div class="form-group">
            <label for="ut_id" class="col-lg-2 col-md-3 control-label">User Type</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" name="ut_id" id="ut_id">
                    <option value="0">-- Please Select User Type --</option>
                    <% for(int i = 0; i < ut.size(); i++) { %>
                    <option value="<%=ut.get(i).get(0) %>"><%=ut.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>

                <input type="hidden" name="u_status" id="u_status" value="1" />

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <a class="tridik btn btn-success" onclick="document.getElementById('f_add').submit();"> Submit </a>
                <a class="tridik btn btn-danger" onclick="location.href='welding/mainMenu.jsp?w=6'"> Cancel </a>

            </div>
        </div>
    </form>
</div>