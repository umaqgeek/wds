<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="helpers.J"%>
<%@page import="helpers.S"%>
<%@page import="models.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.Starter"%>
<%
Component component = new Component();
int num_w = component.getListComponents().length;
String w[][] = component.getListComponents();

int w_check = -1;
try {
    w_check = Integer.parseInt(request.getParameter("w"));
    if(w_check >= 1 && w_check <= num_w) {
        session.setAttribute("url_content", "welding7/mainMenu2.jsp?w="+w_check);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else {
        session.setAttribute("url_content", "welding7/mainMenu2.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}

int id = 0;
try {
    id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
}

int numcol = 2;
if (w_check == num_w) {
    numcol = 6;
} else if (w_check == num_w-1) {
    numcol = 10;
}
//J.o("", w[w_check-1][1]+"_id", 0);
//J.o("", w[w_check-1][2], 0);
//J.o("", id+"", 0);
//J.o("", numcol+"", 0);
ArrayList<String> comp = component.get(w[w_check-1][1]+"_id", w[w_check-1][2], id, numcol);
if(comp.size() <= 0) {
    session.setAttribute("url_content", "welding7/mainMenu2.jsp?w="+w_check);
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
}

ArrayList<ArrayList<String>> cat = component.getComponent("category", 2);
ArrayList<ArrayList<String>> sup = component.getComponent("supplier", 2);
ArrayList<ArrayList<String>> sg = component.getComponent("sta_grade", 2);
String weld_family[][] = component.getListFamilies();
%>

<script>
  $(function() {
    $( "#we_expireddate" ).datepicker({ dateFormat: "dd/mm/yy" });
  });
</script>

<h3 class="panel-title warna-title">UPDATE <%=w[w_check-1][0].toUpperCase() %></h3>
<hr />

<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding7/mainMenu.jsp?w=<%=w_check %>">Back</a>
        </div>
    </div>
</div>

<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<div class="panel-body">
    <form enctype="multipart/form-data" class="form-horizontal" action="FileUploadServlet" role="form" name="f_edit" id="f_edit" method="post">
        
        <input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("u_id") %>" />
        <input type="hidden" name="w" id="w" value="<%=w_check %>" />
        
        <% if(w_check == num_w) { %>
        
        <div class="form-group">
            <label for="we_staffno" class="col-lg-2 col-md-3 control-label">Staff No.</label>
            <div class="col-lg-10 col-md-9">
                <input value="<%=comp.get(1) %>" type="text" class="form-control form-cascade-control" id="we_staffno" name="we_staffno" placeholder="Enter Staff No.">
            </div>
        </div>
        <div class="form-group">
            <label for="we_fullname" class="col-lg-2 col-md-3 control-label">Full Name</label>
            <div class="col-lg-10 col-md-9">
                <input value="<%=comp.get(2) %>" type="text" class="form-control form-cascade-control" id="we_fullname" name="we_fullname" placeholder="Enter Full Name">
            </div>
        </div>
        <div class="form-group">
            <label for="we_expireddate" class="col-lg-2 col-md-3 control-label">Expired Date</label>
            <div class="col-lg-10 col-md-9">
                <input value="<%=comp.get(3) %>" type="text" class="form-control form-cascade-control" id="we_expireddate" name="we_expireddate" placeholder="Enter Expired Date">
            </div>
        </div>
<!--        <input type="hidden" name="" />
        <div class="form-group">
            <label for="we_expireddate" class="col-lg-2 col-md-3 control-label">Expired Period</label>
            <div class="col-lg-10 col-md-9">
                <%
                Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        long month6 = (today.getTimeInMillis()/1000) + (60*60*24*30*6);
        long year2 = (today.getTimeInMillis()/1000) + (60*60*24*30*24);
//        String txt_month6 = 
        out.print((today.getTimeInMillis()/1000)+"<br />");
        out.print(dateFormat.format(today.getTime())+"<br />");
                %>
                <a class="exp_id" href="#!" ep="<%=comp.get(3) %>"><%=comp.get(3) %></a><br />
                <a class="exp_id" href="#!" ep="">6 months later</a><br />
                <a class="exp_id" href="#!" ep="">2 years later</a><br />
            </div>
        </div>-->
        <div class="form-group">
            <label for="we_link" class="col-lg-2 col-md-3 control-label">Certificate</label>
            <div class="col-lg-10 col-md-9">
<!--                <input value="<%=comp.get(4) %>" type="text" class="form-control form-cascade-control" id="we_link" name="we_link" placeholder="Enter Certificate Link">-->
                <input type="file" class="form-control form-cascade-control" id="we_link" name="we_link" placeholder="Choose Certificate" />
                <input type="hidden" name="we_link2" id="we_link2" value="<%=comp.get(4) %>" />
            </div>
        </div>
        <%
        ArrayList<String> cat_id = component.getWeCat("we_id", "welder_category", Integer.parseInt(comp.get(0)));
        %>
        <div class="form-group">
            <label for="cat_id" class="col-lg-2 col-md-3 control-label">Category</label>
            <div class="col-lg-10 col-md-9">
                <% for(int i = 0; i < cat.size(); i++) { %>
                <input type="checkbox" value="<%=cat.get(i).get(0) %>" name="cat_id" <% if(cat_id.contains(cat.get(i).get(0))) { out.print("checked"); } %> /><%=cat.get(i).get(1) %><br />
                <% } %>
            </div>
        </div>
            
        <% } else if(w_check == num_w-1) { %>
        
        <div class="form-group">
            <label for="wn_linkno" class="col-lg-2 col-md-3 control-label">WPS No.</label>
            <div class="col-lg-10 col-md-9">
                <input type="file" class="validate[required] form-control form-cascade-control" id="wn_linkno" name="wn_linkno" placeholder="Choose WPS No.">
                <input type="hidden" name="wn_linkno2" id="wn_linkno2" value="<%=comp.get(1) %>" />
            </div>
        </div>
        <div class="form-group">
            <label for="wn_status" class="col-lg-2 col-md-3 control-label">Family</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="wn_status" id="wn_status">
                    <option value="0" <% if(comp.get(3).equals("0")) { out.print("selected"); } %>>-- Please Select Family --</option>
                    <% for(int i = 0; i < weld_family.length; i++) { %>
                    <option value="<%=weld_family[i][0] %>" <% if(comp.get(3).equals(weld_family[i][0])) { out.print("selected"); } %>><%=weld_family[i][1] %></option>
                    <% } %>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="sg_id" class="col-lg-2 col-md-3 control-label">STA Grade</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" data-prompt-position="topLeft:70" name="sg_id" id="sg_id">
                    <option value="0" <% if(comp.get(4).equals("0")) { out.print("selected"); } %>>-- Please Select STA Grade --</option>
                    <% for(int i = 0; i < sg.size(); i++) { %>
                    <option value="<%=sg.get(i).get(0) %>" <% if(comp.get(4).equals(sg.get(i).get(0))) { out.print("selected"); } %>><%=sg.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="wn_thickness" class="col-lg-2 col-md-3 control-label">Thickness Qualified Range (mm)</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" value="<%=comp.get(2) %>" class="validate[required] form-control form-cascade-control" id="wn_thickness" name="wn_thickness" placeholder="Enter Thickness Qualified Range (mm)">
            </div>
        </div>
        <div class="form-group">
            <label for="sup_id" class="col-lg-2 col-md-3 control-label">Supplier</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control" data-prompt-position="topLeft:70" name="sup_id" id="sup_id">
                    <option value="0" <% if(comp.get(5).equals("0")) { out.print("selected"); } %>>-- Please Select Supplier --</option>
                    <% for(int i = 0; i < sup.size(); i++) { %>
                    <option value="<%=sup.get(i).get(0) %>" <% if(comp.get(5).equals(sup.get(i).get(0))) { out.print("selected"); } %>><%=sup.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        <%
        ArrayList<String> cat_id = component.getWeCat("wn_id", "wps_number_category", Integer.parseInt(comp.get(0)));
        %>
        <div class="form-group">
            <label for="cat_id" class="col-lg-2 col-md-3 control-label">Category</label>
            <div class="col-lg-10 col-md-9">
                <% for(int i = 0; i < cat.size(); i++) { %>
                <input type="checkbox" value="<%=cat.get(i).get(0) %>" name="cat_id" <% if(cat_id.contains(cat.get(i).get(0))) { out.print("checked"); } %> /><%=cat.get(i).get(1) %><br />
                <% } %>
            </div>
        </div>
            
        <% } else { %>
        
        <div class="form-group">
            <label for="<%=w[w_check-1][1] %>_desc" class="col-lg-2 col-md-3 control-label">Description</label>
            <div class="col-lg-10 col-md-9">
                <input value="<%=comp.get(1) %>" type="text" class="form-control form-cascade-control" id="<%=w[w_check-1][1] %>_desc" name="<%=w[w_check-1][1] %>_desc" placeholder="Enter Description for <%=w[w_check-1][0] %>">
            </div>
        </div>
        
        <% } %>
            
            <input type="hidden" name="<%=w[w_check-1][1] %>_id" id="<%=w[w_check-1][1] %>_id" value="<%=comp.get(0) %>" />

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <a class="tridik btn btn-success" onclick="document.getElementById('f_edit').submit();"> Submit </a>
                <a class="tridik btn btn-danger" onclick="location.href='welding7/mainMenu.jsp?w=<%=w_check %>'"> Cancel </a>

            </div>
        </div>
    </form>
</div>