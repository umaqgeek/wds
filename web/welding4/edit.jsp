<%@page import="models.Welding_child"%>
<%@page import="controllers.Starter"%>
<%@page import="models.Welding"%>
<%@page import="models.Component"%>
<%@page import="controllers.SessionWIS"%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%
Component component = new Component();
Welding welding = new Welding();
Welding_child welding_child = new Welding_child();
ArrayList<ArrayList<String>> fp = component.getComponent("fabrication_phase", 2);
ArrayList<ArrayList<String>> m = component.getComponent("machine", 2);
ArrayList<ArrayList<String>> sg = component.getComponent("sta_grade", 2);
ArrayList<ArrayList<String>> wsize = component.getComponent("wire_size", 2);
ArrayList<ArrayList<String>> wn = component.getComponent("wps_number", 2);
ArrayList<ArrayList<String>> cat = component.getComponent("category", 2);

int w_id = 0;
try {
    w_id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
    session.setAttribute("url_content", "welding4/add.jsp");
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
}
ArrayList<String> data = welding.getId(w_id, 4);
ArrayList<ArrayList<String>> data2 = welding_child.getAll(w_id);
if(data.size() <= 0) {
    session.setAttribute("url_content", "welding4/add.jsp");
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
}

int re = 0;
try {
    re = Integer.parseInt(request.getParameter("re"));
} catch (Exception e) {
}
%>

<h3 class="panel-title warna-title">CARCASS STOP RING (CONTINUE PRODUCTION)</h3>
<hr />

<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding/mainMenu.jsp?w=4">Back</a>
        </div>
    </div>
</div>

<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<%
//String readonly = "readonly='readonly'";
String readonly = "disabled";
if(Integer.parseInt(session.getAttribute("ut_id").toString()) == 1) {
    readonly = "";
}
%>

<!-- start validation -->
 
<script src="assets/js/validation/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="assets/js/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" href="assets/css/validationEngine.jquery.css" type="text/css" />

<script src="assets/js/validation/jquery.maskedinput.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).load(function(){
    $("#f_edit").validationEngine();
    $("#f_addchild").validationEngine();
});
function isFormNull1() {
    if(jQuery('#f_edit').validationEngine('validate')) {
        document.getElementById('f_edit').submit();
    } else {
        alert('Please fill in all field!!');
    }
}
function isFormNull2() {
    if(jQuery('#f_addchild').validationEngine('validate')) {
        document.getElementById('f_addchild').submit();
    } else {
        alert('Please fill in all field!!');
    }
}
function isFormNull3() {
    if(jQuery('#f_editcomments').validationEngine('validate')) {
        document.getElementById('f_editcomments').submit();
    } else {
        alert('Please fill in all field!!');
    }
}

jQuery(function($){
    $("#w_structurenumber").mask("999.99999");
    $("#w_sfnumber").mask("9999?9.99999");
});
</script>

<!-- end validation -->

<%
String w_structurenumber = "00000000";
if(data.get(2).charAt(3) == '.') {
    w_structurenumber = data.get(2).charAt(0)
            +""+data.get(2).charAt(1)
            +""+data.get(2).charAt(2)
            +""+data.get(2).charAt(4)
            +""+data.get(2).charAt(5)
            +""+data.get(2).charAt(6)
            +""+data.get(2).charAt(7)
            +""+data.get(2).charAt(8);
}
String w_sfnumber = "0000000000";
try {
    if(data.get(1).charAt(5) == '.') {
        String str[] = data.get(1).split("\\.");
        String wsfnum = "";
        for (int i = 0; i < str.length; i++) {
            wsfnum += str[i];
        }
        w_sfnumber = wsfnum;
    }
} catch (Exception e) {
    w_sfnumber = data.get(1);
}
%>

<div class="panel-body">
    <form class="form-horizontal" action="welding4/editprocess.jsp" role="form" name="f_edit" id="f_edit" method="post">
        <div class="form-group">
            <label for="w_sfnumber" class="col-lg-2 col-md-3 control-label">SF Number</label>
            <div class="col-lg-10 col-md-9">
                <input <%=readonly %> value="<%=w_sfnumber %>" type="text" class="validate[required] form-control form-cascade-control"  data-prompt-position="topLeft:70" id="w_sfnumber" name="w_sfnumber" placeholder="Enter SF Number">
            </div>
        </div>

        <div class="form-group">
            <label for="w_structurenumber" class="col-lg-2 col-md-3 control-label">Structure</label>
            <div class="col-lg-10 col-md-9">
                <input <%=readonly %> value="<%=w_structurenumber %>" type="text" class="validate[required] form-control form-cascade-control"  data-prompt-position="topLeft:70" id="w_structurenumber" name="w_structurenumber" placeholder="Enter Structure Number">
            </div>
        </div>

        <div class="form-group">
            <label for="fp_id" class="col-lg-2 col-md-3 control-label">Fabrication Phase</label>
            <div class="col-lg-10 col-md-9">
                <select <%=readonly %> class="validate[required] form-control form-cascade-control"  data-prompt-position="topLeft:70" name="fp_id" id="fp_id">
                    <option value="" <% if(data.get(3).equals("0")) { out.print("selected"); } %>>-- Please Select Fabrication Phase --</option>
                    <% for(int i = 0; i < fp.size(); i++) { %>
                    <option value="<%=fp.get(i).get(0) %>" <% if(data.get(3).equals(fp.get(i).get(0))) { out.print("selected"); } %>><%=fp.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="w_projectname" class="col-lg-2 col-md-3 control-label">Project Name</label>
            <div class="col-lg-10 col-md-9">
                <input <%=readonly %> value="<%=data.get(6) %>" type="text" class="validate[required] form-control form-cascade-control"  data-prompt-position="topLeft:70" id="w_projectname" name="w_projectname" placeholder="Enter Project Name">
            </div>
        </div>
                
        <div class="form-group">
            <label for="m_id" class="col-lg-2 col-md-3 control-label">Manuf. Machine</label>
            <div class="col-lg-10 col-md-9">
                <select <%=readonly %> class="validate[required] form-control form-cascade-control"  data-prompt-position="topLeft:70" name="m_id" id="m_id">
                    <option value="" <% if(data.get(7).equals("0")) { out.print("selected"); } %>>-- Please Select Manuf. Machine --</option>
                    <% for(int i = 0; i < m.size(); i++) { %>
                    <option value="<%=m.get(i).get(0) %>" <% if(data.get(7).equals(m.get(i).get(0))) { out.print("selected"); } %>><%=m.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="cat_id" class="col-lg-2 col-md-3 control-label">Category</label>
            <div class="col-lg-10 col-md-9">
                <select <%=readonly %> class="validate[required] form-control" data-prompt-position="topLeft:70" name="cat_id" id="cat_id">
                    <option value="" <% if(data.get(25).equals("0")) { out.print("selected"); } %>>-- Please Select Category --</option>
                    <% for(int i = 0; i < cat.size(); i++) { %>
                    <option value="<%=cat.get(i).get(0) %>" <% if(data.get(25).equals(cat.get(i).get(0))) { out.print("selected"); } %>><%=cat.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wsize_id" class="col-lg-2 col-md-3 control-label">Size</label>
            <div class="col-lg-10 col-md-9">
                <select <%=readonly %> class="validate[required] form-control form-cascade-control"  data-prompt-position="topLeft:70" name="wsize_id" id="wsize_id">
                    <option value="" <% if(data.get(9).equals("0")) { out.print("selected"); } %>>-- Please Select Size --</option>
                    <% for(int i = 0; i < wsize.size(); i++) { %>
                    <option value="<%=wsize.get(i).get(0) %>" <% if(data.get(9).equals(wsize.get(i).get(0))) { out.print("selected"); } %>><%=wsize.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="sg_id" class="col-lg-2 col-md-3 control-label">STA Grade</label>
            <div class="col-lg-10 col-md-9">
                <select <%=readonly %> class="validate[required] form-control form-cascade-control"  data-prompt-position="topLeft:70" name="sg_id" id="sg_id">
                    <option value="" <% if(data.get(11).equals("0")) { out.print("selected"); } %>>-- Please Select STA Grade --</option>
                    <% for(int i = 0; i < sg.size(); i++) { %>
                    <option value="<%=sg.get(i).get(0) %>" <% if(data.get(11).equals(sg.get(i).get(0))) { out.print("selected"); } %>><%=sg.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wn_id" class="col-lg-2 col-md-3 control-label">WPS Number</label>
            <div class="col-lg-10 col-md-9">
                <select <%=readonly %> class="validate[required] form-control form-cascade-control"  data-prompt-position="topLeft:70" name="wn_id" id="wn_id">
                    <option value="" <% if(data.get(13).equals("0")) { out.print("selected"); } %>>-- Please Select WPS Number --</option>
                    <% for(int i = 0; i < wn.size(); i++) { %>
                    <option value="<%=wn.get(i).get(0) %>" <% if(data.get(13).equals(wn.get(i).get(0))) { out.print("selected"); } %>><%=Func.getLinkNo(wn.get(i).get(1)) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
                <input type="hidden" name="w_date" id="w_date" value="<%=data.get(17) %>" />
                <input type="hidden" name="u_id" id="u_id" value="<%=data.get(18) %>" />
                <input type="hidden" name="w_status" id="w_status" value="<%=data.get(24) %>" />
                <input type="hidden" name="w_id" id="w_id" value="<%=data.get(0) %>" />

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
            <% if(Integer.parseInt(session.getAttribute("ut_id").toString()) == 1) { %>
                <a class="tridik btn btn-success" onclick="isFormNull1();"> Save </a>
                <a class="tridik btn btn-danger" onclick="location.href='welding/mainMenu.jsp?w=4'"> Cancel </a>
            <% } %>
            </div>
        </div>
    </form>
</div>
                
<!--<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding3/mainMenu.jsp?process=addChild&id=<%=w_id %>">Add</a>
        </div>
    </div>
</div>-->
        
<div class="row">
    <div class="col-md-3">
        <button type="button" class="tridik btn btn-success pull-right btn-submit btn"  data-toggle="modal" data-target="#myModal">Add Weld</button>		
    </div>
</div>
<br />
                
<hr />

<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>Team</th>
             <th>Welder Name</th>
             <th>Welder Status</th>
             <th>Welding Machine</th>
             <th>EF Position (m)</th>
             <th>Weld Status</th>
             <th>If failed, why?</th>
             <th>Date</th>
             <th>QC Inspector</th>
             <th>Comments</th>
             <% if(Integer.parseInt(session.getAttribute("ut_id").toString()) == 1) { %>
             <th>Action</th>
             <% } %>
           </tr>
         </thead>
         <tbody>
          <% if(data2.size() > 0) { for(int i = 0; i < data2.size(); i++) { %>
          <tr class="odd gradeA">
           <td><%=i+1 %>.</td>
           <td><%=data2.get(i).get(3) %></td>
            <td><% if(Func.isWelderValid(data2.get(i).get(8), data2.get(i).get(27))) { 
                out.print(data2.get(i).get(6)); 
            } else {
                out.print("<span style='color:red;'>"+data2.get(i).get(6)+"</span>");
            }%></td>
            <td><% if(Func.isWelderValid(data2.get(i).get(8), data2.get(i).get(27))) { 
                out.print("<span style='color:#0a0;'>Valid</span>"); 
            } else {
                out.print("<span style='color:red;'>Expired</span>");
            }%></td>
            <td><%=data2.get(i).get(11) %></td>
            <td><%=data2.get(i).get(25) %></td>
            <td><%=data2.get(i).get(15) %></td>
            <td><%=data2.get(i).get(17) %></td>
            <td><%=Func.getDate(data2.get(i).get(27)) %></td>
            <td><%=data2.get(i).get(30) %></td>
            <td><%=data2.get(i).get(35) %></td>
            <% if(Integer.parseInt(session.getAttribute("ut_id").toString()) == 1) { %>
            <td class="center">
                <a data-toggle="modal" data-target="#myModal1" style="cursor:pointer;">
                    <span class="badge ttt" title="Edit Record" t="<%=data2.get(i).get(0) %>">=</span>
                </a>
                <a onclick="return ask('Are you really want to delete this record?');" href="welding4/mainMenu2.jsp?process=deleteChild&id=<%=data2.get(i).get(0) %>&w_id=<%=w_id %>">
                    <span class="badge" title="Delete Record">X</span>
                </a>
            </td>
            <% } %>
          </tr>
          <% } } else { %>
          
          <% } %>
           </tbody>
       </table>
           
           
  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Add Weld</h4>
      </div>
      <div class="modal-body">

<%
ArrayList<ArrayList<String>> t = component.getComponent("team", 2);
ArrayList<ArrayList<String>> we = component.getComponent("welder", 6);
ArrayList<ArrayList<String>> wm = component.getComponent("welding_machine", 2);
ArrayList<ArrayList<String>> ws = component.getComponent("welding_status", 2);
ArrayList<ArrayList<String>> fc = component.getComponent("failure_caused", 2);
%>

<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding4/mainMenu2.jsp?process=edit&id=<%=w_id %>">Back</a>
        </div>
    </div>
</div>
        
<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<div class="panel-body">
    <form class="form-horizontal" action="welding4/addchildprocess.jsp" role="form" name="f_addchild" id="f_addchild" method="post">
        
        <input type="hidden" name="w_id" id="w_id" value="<%=w_id %>" />
        
        <div class="form-group">
            <label for="t_id" class="col-lg-2 col-md-3 control-label">Team</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" name="t_id" id="t_id">
                    <option value="">-- Please Select Team --</option>
                    <% for(int i = 0; i < t.size(); i++) { %>
                    <option value="<%=t.get(i).get(0) %>"><%=t.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="we_id" class="col-lg-2 col-md-3 control-label">Welder</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" name="we_id" id="we_id">
                    <option value="">-- Please Select Welder --</option>
                    <% for(int i = 0; i < we.size(); i++) { %>
                    <option value="<%=we.get(i).get(0) %>">(<%=we.get(i).get(1) %>) <%=we.get(i).get(2) %>
                    (<%
                 ArrayList<String> getwc = component.getWeCat_list(Integer.parseInt(we.get(i).get(0)));
                 for (int j = 0; j < getwc.size() - 1; j++) {
                     out.print(getwc.get(j)+", ");
                 }
                 if (getwc.size() > 0) {
                     out.print(getwc.get(getwc.size()-1)+"");
                 }
                 %>)
                    </option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wm_id" class="col-lg-2 col-md-3 control-label">Welding Machine</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" name="wm_id" id="wm_id">
                    <option value="">-- Please Select Welding Machine --</option>
                    <% for(int i = 0; i < wm.size(); i++) { %>
                    <option value="<%=wm.get(i).get(0) %>"><%=wm.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wc_efposition" class="col-lg-2 col-md-3 control-label">EF Position (m)</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" id="wc_efposition" name="wc_efposition" placeholder="Enter EF Position (m)">
            </div>
        </div>

        <div class="form-group">
            <label for="ws_id" class="col-lg-2 col-md-3 control-label">Weld Status</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" name="ws_id" id="ws_id">
                    <option value="">-- Please Select Weld Status --</option>
                    <% for(int i = 0; i < ws.size(); i++) { %>
                    <option value="<%=ws.get(i).get(0) %>"><%=ws.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="fc_id" class="col-lg-2 col-md-3 control-label">If failed, why?</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control form-cascade-control" name="fc_id" id="fc_id">
                    <option value="0">-- Please Select Failure Caused --</option>
                    <% for(int i = 0; i < fc.size(); i++) { %>
                    <option value="<%=fc.get(i).get(0) %>"><%=fc.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wc_comments" class="col-lg-2 col-md-3 control-label">Comments<br />(Optional)</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="form-control form-cascade-control" id="wc_comments" name="wc_comments" placeholder="Enter Comments">
            </div>
        </div>
        
                <input type="hidden" name="wc_date" id="wc_date" value="<%=Func.getTodayDate() %>" />
                <input type="hidden" name="u_id" id="u_id" value="<%=session.getAttribute("u_id") %>" />
                <input type="hidden" name="wc_status" id="wc_status" value="4" />

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
              

            </div>
        </div>
    </form>
</div>
          
      </div>
      <div class="modal-footer">
            <a class="tridik btn btn-primary" onclick="isFormNull2();"> Submit </a>
                <a class="tridik btn btn-danger" data-dismiss="modal"> Cancel </a>
               
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Edit Comment</h4>
      </div>
      <div class="modal-body">

<div class="panel-body">
    <form class="form-horizontal" action="welding4/editcomments.jsp" role="form" name="f_editcomments" id="f_editcomments" method="post">
        
        <input type="hidden" name="wc_id" id="wc_idcomment" value="0" />
        <input type="hidden" name="w_id" id="w_id" value="<%=w_id %>" />
        
        <div class="form-group">
            <label for="t_id" class="col-lg-2 col-md-3 control-label">Team</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" name="t_id_komen" id="t_id_komen">
                    <option value="">-- Please Select Team --</option>
                    <% for(int i = 0; i < t.size(); i++) { %>
                    <option value="<%=t.get(i).get(0) %>"><%=t.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="we_id" class="col-lg-2 col-md-3 control-label">Welder</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" name="we_id_komen" id="we_id_komen">
                    <option value="">-- Please Select Welder --</option>
                    <% for(int i = 0; i < we.size(); i++) { %>
                    <option value="<%=we.get(i).get(0) %>">(<%=we.get(i).get(1) %>) <%=we.get(i).get(2) %>
                    (<%
                 ArrayList<String> getwc = component.getWeCat_list(Integer.parseInt(we.get(i).get(0)));
                 for (int j = 0; j < getwc.size() - 1; j++) {
                     out.print(getwc.get(j)+", ");
                 }
                 if (getwc.size() > 0) {
                     out.print(getwc.get(getwc.size()-1)+"");
                 }
                 %>)
                    </option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wm_id" class="col-lg-2 col-md-3 control-label">Welding Machine</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" name="wm_id_komen" id="wm_id_komen">
                    <option value="">-- Please Select Welding Machine --</option>
                    <% for(int i = 0; i < wm.size(); i++) { %>
                    <option value="<%=wm.get(i).get(0) %>"><%=wm.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wc_efposition" class="col-lg-2 col-md-3 control-label">EF Position (m)</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" id="wc_efposition_komen" name="wc_efposition_komen" placeholder="Enter EF Position (m)">
            </div>
        </div>

        <div class="form-group">
            <label for="ws_id" class="col-lg-2 col-md-3 control-label">Weld Status</label>
            <div class="col-lg-10 col-md-9">
                <select class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" name="ws_id_komen" id="ws_id_komen">
                    <option value="">-- Please Select Weld Status --</option>
                    <% for(int i = 0; i < ws.size(); i++) { %>
                    <option value="<%=ws.get(i).get(0) %>"><%=ws.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="fc_id" class="col-lg-2 col-md-3 control-label">If failed, why?</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control form-cascade-control" name="fc_id_komen" id="fc_id_komen">
                    <option value="0">-- Please Select Failure Caused --</option>
                    <% for(int i = 0; i < fc.size(); i++) { %>
                    <option value="<%=fc.get(i).get(0) %>"><%=fc.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="wc_comments" class="col-lg-2 col-md-3 control-label">Comments<br />(Optional)</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" class="form-control form-cascade-control" id="data_komen" name="wc_comments" placeholder="Enter Comments">
            </div>
        </div>
        
    </form>
</div>
          
      </div>
      <div class="modal-footer">
            <a class="tridik btn btn-primary" onclick="isFormNull3();"> Submit </a>
                <a class="tridik btn btn-danger" data-dismiss="modal"> Cancel </a>
               
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<br />
<div class="row">
    <div class="col-md-3">
        <a target="_blank" href="welding4/print.jsp?id=<%=w_id %>">
            <button type="button" class="tridik btn btn-success pull-right btn-submit btn">Print</button>		
        </a>
    </div>
</div>