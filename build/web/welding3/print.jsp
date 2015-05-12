<%@page import="helpers.Func"%>
<%@page import="models.Component"%>
<%@page import="models.Welding"%>
<%@page import="models.Welding_child"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.SessionWIS"%>
<%@page import="controllers.Starter"%>

<%
Component component = new Component();
Welding welding = new Welding();
Welding_child welding_child = new Welding_child();
ArrayList<ArrayList<String>> fp = component.getComponent("fabrication_phase", 2);
ArrayList<ArrayList<String>> m = component.getComponent("machine", 2);
ArrayList<ArrayList<String>> sg = component.getComponent("sta_grade", 2);
ArrayList<ArrayList<String>> wsize = component.getComponent("wire_size", 2);
ArrayList<ArrayList<String>> wn = component.getComponent("wps_number", 2);

int w_id = 0;
try {
    w_id = Integer.parseInt(request.getParameter("id"));
} catch (Exception e) {
    session.setAttribute("url_content", "welding3/add.jsp");
    session.setAttribute("url_menu", "menu/menuAdmin.jsp");
    session.setAttribute("url_stat", 2);
    response.sendRedirect("../index.jsp");
}
ArrayList<String> data = welding.getId(w_id, 3);
ArrayList<ArrayList<String>> data2 = welding_child.getAll(w_id);
if(data.size() <= 0) {
    session.setAttribute("url_content", "welding3/add.jsp");
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

<script src="../assets/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="../assets/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<title>Asiaflex - Welding Information System</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/style.css" rel="stylesheet">
<link href="../assets/css/login.css" rel="stylesheet">
<link href="../assets/css/custom.css" rel="stylesheet">
<link href="../assets/css/font-awesome.css" rel="stylesheet">
<link rel="shortcut icon" href="../assets/images/technipback.png">

<h3 class="panel-title">RABOUTAGE</h3>
<hr />

<%
int num_w = 10;
String w[][] = {
       {"SF Number", data.get(1)},
       {"Structure", data.get(2)},
       {"Fabrication Phase", data.get(4)},
       {"Project Name", data.get(6)},
       {"Manuf. Machine", data.get(8)},
       {"Strip Size", data.get(10)},
       {"STA Grade", data.get(12)},
       {"WPS Number", data.get(14)},
       {"Date Created", data.get(17)},
       {"Creator", data.get(20)}
};
%>

<div class="panel-body">
        <div class="form-group">
            <% for (int i = 0; i < num_w; i++) { %>
            <table width="100%">
                <tr>
                    <td width="30%"><label for="w_sfnumber" class="col-lg-2 col-md-3 control-label"><%=w[i][0] %></label></td>
                    <td width="5%">:</td>
                    <td><% if(i==num_w-2) { out.print(Func.getDateTime(w[i][1])); } else { out.print(w[i][1]); } %></td>
                </tr>
            </table>
            <% } %>
        </div>
</div>
        
<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>Team</th>
             <th>Welder Name</th>
             <th>Welder Status</th>
             <th>Welding Machine</th>
             <th>Welding Process</th>
             <th>Weld Length (m)</th>
             <th>Weld Status</th>
             <th>If failed, why?</th>
             <th>Date</th>
             <th>QC Inspector</th>
             <th>Comments</th>
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
            <td><%=data2.get(i).get(24) %></td>
            <td><%=data2.get(i).get(13) %></td>
            <td><%=data2.get(i).get(15) %></td>
            <td><%=data2.get(i).get(17) %></td>
            <td><%=Func.getDate(data2.get(i).get(27)) %></td>
            <td><%=data2.get(i).get(30) %></td>
            <td><%=data2.get(i).get(35) %></td>
          </tr>
          <% } } else { %>
          <tr class="odd gradeA">
              <td colspan="12"><em>No Record ..</em></td>
          </tr>
          <% } %>
           </tbody>
       </table>

<!-- Load JS here for Faster site load =============================-->
<script src="../assets/js/jquery-1.10.2.min.js"></script>
<script src="../assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/bootstrap-select.js"></script>
<script src="../assets/js/bootstrap-switch.js"></script>
<script src="../assets/js/jquery.tagsinput.js"></script>
<script src="../assets/js/jquery.placeholder.js"></script>
<script src="../assets/js/bootstrap-typeahead.js"></script>
<script src="../assets/js/application.js"></script>
<script src="../assets/js/moment.min.js"></script>
<script src="../assets/js/jquery.dataTables.min.js"></script>
<script src="../assets/js/jquery.sortable.js"></script>
<script type="text/javascript" src="../assets/js/jquery.gritter.js"></script>
<script src="../assets/js/jquery.nicescroll.min.js"></script>
<script src="../assets/js/skylo.js"></script>
<script src="../assets/js/prettify.min.js"></script>
<script src="../assets/js/jquery.noty.js"></script>
<script src="../assets/js/scroll.js"></script>
<script src="../assets/js/jquery.panelSnap.js"></script>
<script src="../assets/js/login.js"></script>
           
<script type="text/javascript">window.print();</script>