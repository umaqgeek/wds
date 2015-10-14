<%@page import="beans.Expired_Lejer_Bean"%>
<%@page import="models.Expired_Lejer"%>
<%@page import="beans.Expired_Type_Bean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="models.Welding_child"%>
<%@page import="helpers.Func"%>
<%@page import="models.Component"%>
<%@page import="models.Welding"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.Starter"%>

<%
Welding welding = new Welding();
Component component = new Component();
Welding_child welding_child = new Welding_child();
ArrayList<String> sfnumber = welding.getUnique("w_sfnumber", -1);
ArrayList<ArrayList<String>> fp = component.getComponent("fabrication_phase", 2);
ArrayList<ArrayList<String>> m = component.getComponent("machine", 2);
ArrayList<ArrayList<String>> wsize = component.getComponent("wire_size", 2);
ArrayList<ArrayList<String>> sup = component.getComponent("supplier", 2);
ArrayList<ArrayList<String>> sg = component.getComponent("sta_grade", 2);
ArrayList<ArrayList<String>> we = component.getComponent("welder", 6);
ArrayList<ArrayList<String>> wm = component.getComponent("welding_machine", 2);
ArrayList<ArrayList<String>> ws = component.getComponent("welding_status", 2);
ArrayList<ArrayList<String>> fc = component.getComponent("failure_caused", 2);
ArrayList<ArrayList<String>> cat = component.getComponent("category", 2);
String weld_family[][] = {{"1", "Strip Welding"}, {"2", "Wire Welding"}, {"3", "Raboutage"}, {"4", "Carcass Stop Ring"}};
String valid_family[][] = {{"1", "Valid"}, {"2", "Expired"}};

int w_status = 0;
String w_sfnumber = "";
String w_sfnumber2 = "";
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
    fp_id = Integer.parseInt(request.getParameter("fp_id"));
    m_id = Integer.parseInt(request.getParameter("m_id"));
    wsize_id = Integer.parseInt(request.getParameter("wsize_id"));
    sup_id = Integer.parseInt(request.getParameter("sup_id"));
    sg_id = Integer.parseInt(request.getParameter("sg_id"));
    we_id = Integer.parseInt(request.getParameter("we_id"));
    wm_id = Integer.parseInt(request.getParameter("wm_id"));
    date_from = request.getParameter("date_from");
    date_to = request.getParameter("date_to");
    if ( !(date_from.equals("") && date_to.equals("")) && (date_from.equals("") || date_to.equals("")) ) {
        out.print("<script>alert('Date From and To must equally filled!');</script>");
    }
    ws_id = Integer.parseInt(request.getParameter("ws_id"));
    fc_id = Integer.parseInt(request.getParameter("fc_id"));
    welder_status = Integer.parseInt(request.getParameter("welder_status"));
    cat_id = Integer.parseInt(request.getParameter("cat_id"));
} catch (Exception e) {
    w_status = 0;
    w_sfnumber = "";
    w_sfnumber2 = "";
    fp_id = 0;
    m_id = 0;
    wsize_id = 0;
    sup_id = 0;
    sg_id = 0;
    we_id = 0;
    wm_id = 0;
    date_from = "";
    date_to = "";
    ws_id = 0;
    fc_id = 0;
    welder_status = 0;
    cat_id = 0;
}
ArrayList<ArrayList<String>> wc = welding_child.getSearchAll(w_sfnumber, fp_id, m_id, wsize_id, sup_id, sg_id, we_id, wm_id, date_from, date_to, ws_id, fc_id, w_status, welder_status, cat_id);
%>

<h3 class="panel-title warna-title">REPORT (QUERY &AMP; STATISTICS)</h3>
<hr />

<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<script type="text/javascript">
$(document).ready(function() {
    $("#w_sfnumber").change(function() {
        $("#w_sfnumber2").val("");
    });
    $("#w_sfnumber2").keyup(function() {
        $("#w_sfnumber").val("");
    });
});
</script>

<div class="panel-body">
    <form class="form-horizontal" action="welding5/searchprocess.jsp" role="form" name="f_search" id="f_search" method="post">
        
        <div class="form-group">
            <label for="w_status" class="col-lg-2 col-md-3 control-label">Family</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="w_status" id="w_status">
                    <option value="0" <% if(w_status == 0) { out.print("selected"); } %>>-- Please Select Family --</option>
                    <% for(int i = 0; i < weld_family.length; i++) { %>
                    <option value="<%=weld_family[i][0] %>" <% if(w_status == Integer.parseInt(weld_family[i][0])) { out.print("selected"); } %>><%=weld_family[i][1] %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="w_sfnumber" class="col-lg-2 col-md-3 control-label">SF Number</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="w_sfnumber" id="w_sfnumber">
                    <option value="" <% if(w_sfnumber.equals("")) { out.print("selected"); } %>>-- Please Select SF Number --</option>
                    <% for(int i = 0; i < sfnumber.size(); i++) { %>
                    <option value="<%=sfnumber.get(i) %>" <% if(w_sfnumber.equals(sfnumber.get(i))) { out.print("selected"); } %>><%=sfnumber.get(i) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="w_sfnumber2" class="col-lg-2 col-md-3 control-label">SF Number</label>
            <div class="col-lg-10 col-md-9">
                <input type="text" value="" class="validate[required] form-control form-cascade-control" data-prompt-position="topLeft:70" id="w_sfnumber2" name="w_sfnumber2" placeholder="Enter Alernative SF Number">
            </div>
        </div>
        
        <div class="form-group">
            <label for="fp_id" class="col-lg-2 col-md-3 control-label">Fabrication Phase</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="fp_id" id="fp_id">
                    <option value="0" <% if(fp_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Fabrication Phase --</option>
                    <% for(int i = 0; i < fp.size(); i++) { %>
                    <option value="<%=fp.get(i).get(0) %>" <% if(fp_id == Integer.parseInt(fp.get(i).get(0))) { out.print("selected"); } %>><%=fp.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="m_id" class="col-lg-2 col-md-3 control-label">Manuf. Machine</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="m_id" id="m_id">
                    <option value="0" <% if(m_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Manuf. Machine --</option>
                    <% for(int i = 0; i < m.size(); i++) { %>
                    <option value="<%=m.get(i).get(0) %>" <% if(m_id == Integer.parseInt(m.get(i).get(0))) { out.print("selected"); } %>><%=m.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="cat_id" class="col-lg-2 col-md-3 control-label">Category</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="cat_id" id="cat_id">
                    <option value="0" <% if(cat_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Category --</option>
                    <% for(int i = 0; i < cat.size(); i++) { %>
                    <option value="<%=cat.get(i).get(0) %>" <% if(cat_id == Integer.parseInt(cat.get(i).get(0))) { out.print("selected"); } %>><%=cat.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="wsize_id" class="col-lg-2 col-md-3 control-label">Size (wire/strip)</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="wsize_id" id="wsize_id">
                    <option value="0" <% if(wsize_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Size (wire/strip) --</option>
                    <% for(int i = 0; i < wsize.size(); i++) { %>
                    <option value="<%=wsize.get(i).get(0) %>" <% if(wsize_id == Integer.parseInt(wsize.get(i).get(0))) { out.print("selected"); } %>><%=wsize.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="sup_id" class="col-lg-2 col-md-3 control-label">Supplier</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="sup_id" id="sup_id">
                    <option value="0" <% if(sup_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Supplier --</option>
                    <% for(int i = 0; i < sup.size(); i++) { %>
                    <option value="<%=sup.get(i).get(0) %>" <% if(sup_id == Integer.parseInt(sup.get(i).get(0))) { out.print("selected"); } %>><%=sup.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="sg_id" class="col-lg-2 col-md-3 control-label">STA (Grade)</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="sg_id" id="sg_id">
                    <option value="0" <% if(sg_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select STA (Grade) --</option>
                    <% for(int i = 0; i < sg.size(); i++) { %>
                    <option value="<%=sg.get(i).get(0) %>" <% if(sg_id == Integer.parseInt(sg.get(i).get(0))) { out.print("selected"); } %>><%=sg.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="we_id" class="col-lg-2 col-md-3 control-label">Welder Name</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="we_id" id="we_id">
                    <option value="0" <% if(we_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Welder Name --</option>
                    <% for(int i = 0; i < we.size(); i++) { %>
                    <option value="<%=we.get(i).get(0) %>" <% if(we_id == Integer.parseInt(we.get(i).get(0))) { out.print("selected"); } %>>(<%=we.get(i).get(1) %>) <%=we.get(i).get(2) %>
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
            <label for="welder_status" class="col-lg-2 col-md-3 control-label">Welder Status</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="welder_status" id="welder_status">
                    <option value="0" <% if(welder_status == 0) { out.print("selected"); } %>>-- Please Select Welder Status --</option>
                    <% for(int i = 0; i < valid_family.length; i++) { %>
                    <option value="<%=valid_family[i][0] %>" <% if(welder_status == Integer.parseInt(valid_family[i][0])) { out.print("selected"); } %>><%=valid_family[i][1] %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="wm_id" class="col-lg-2 col-md-3 control-label">Welding Machine</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="wm_id" id="wm_id">
                    <option value="0" <% if(wm_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Welding Machine --</option>
                    <% for(int i = 0; i < wm.size(); i++) { %>
                    <option value="<%=wm.get(i).get(0) %>" <% if(wm_id == Integer.parseInt(wm.get(i).get(0))) { out.print("selected"); } %>><%=wm.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
<script>
  $(function() {
    $( "#date_from" ).datepicker({ dateFormat: "dd/mm/yy" });
    $( "#date_to" ).datepicker({ dateFormat: "dd/mm/yy" });
  });
</script>
                
        <div class="form-group">
            <label for="date_from" class="col-lg-2 col-md-3 control-label">Date From</label>
            <div class="col-lg-10 col-md-9">
                <input value="<%=date_from %>" type="text" class="form-control form-cascade-control" id="date_from" name="date_from" placeholder="Choose Date From">
            </div>
            <label for="date_to" class="col-lg-2 col-md-3 control-label">To</label>
            <div class="col-lg-10 col-md-9">
                <input value="<%=date_to %>" type="text" class="form-control form-cascade-control" id="date_to" name="date_to" placeholder="Choose Date To">
            </div>
        </div>
        
        <div class="form-group">
            <label for="ws_id" class="col-lg-2 col-md-3 control-label">Weld Status</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="ws_id" id="ws_id">
                    <option value="0" <% if(ws_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Weld Status --</option>
                    <% for(int i = 0; i < ws.size(); i++) { %>
                    <option value="<%=ws.get(i).get(0) %>" <% if(ws_id == Integer.parseInt(ws.get(i).get(0))) { out.print("selected"); } %>><%=ws.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="fc_id" class="col-lg-2 col-md-3 control-label">Cause of Failure</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="fc_id" id="fc_id">
                    <option value="0" <% if(fc_id == Integer.parseInt("0")) { out.print("selected"); } %>>-- Please Select Cause of Failure --</option>
                    <% for(int i = 0; i < fc.size(); i++) { %>
                    <option value="<%=fc.get(i).get(0) %>" <% if(fc_id == Integer.parseInt(fc.get(i).get(0))) { out.print("selected"); } %>><%=fc.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <a class="tridik btn btn-success" onclick="document.getElementById('f_search').submit();">SEARCH</a>
                <a class="tridik btn btn-success" onclick="export_excel1();">EXPORT</a>
            </div>
        </div>
    </form>
</div>
                
<script type="text/javascript">
function export_excel1() {
    location.href="welding5/export1.jsp?w_sfnumber=<%=w_sfnumber 
    %>&fp_id=<%=fp_id %>&m_id=<%=m_id %>&wsize_id=<%=wsize_id 
    %>&sup_id=<%=sup_id %>&sg_id=<%=sg_id %>&we_id=<%=we_id %>&wm_id=<%=wm_id 
    %>&date_from=<%=date_from %>&date_to=<%=date_to %>&ws_id=<%=ws_id 
    %>&fc_id=<%=fc_id %>&w_status=<%=w_status %>&welder_status=<%=welder_status 
    %>&cat_id=<%=cat_id %>";
}
</script>

<hr />
<script type="text/javascript">
    $(document).ready(function() {
        $('#example_report').dataTable();
    } );
</script>
                
<table style="width:100%" class="table table-bordered table-hover table-striped display" id="example_report" >
           <thead>
               <tr style="font-size: small;">
             <th>No.</th>
             
             <th>Family</th>
             
             <th>SF No.</th>
             <th>Fabric. Phase</th>
             <th>Manuf. Mach.</th>
             <th>Category</th>
             
             <th>Size (wire / strip)</th>
             <th>Supplier</th>
             <th>STA (Grade)</th>
             <th>Welder Name</th>
             <th>Welder Stats</th>
             <th>Weld Mach.</th>
             
             <th>Weld Dur (Sec)</th>
             <th>Spool No.</th>
             <th>Bob. No.</th>
             
             <th>Weld Status</th>
             
             <th>Weld Date</th>
             
             <th>Cause of Fail</th>
             
             <th>Weld No.</th>
           </tr>
         </thead>
         <tbody>
             <%
             int weld_pass = 0;
             int weld_fail = 0;
             int weld_other = 0;
             %>
          <% if(wc.size() > 0) { 
              
              Func func = new Func();
                   Expired_Lejer el = new Expired_Lejer();
                   Expired_Lejer_Bean elb = el.getExpiredLejer(2); // 2 means warning type
              
                for(int i = 0; i < wc.size(); i++) { %>
          <tr class="odd gradeA">
           <td><%=i+1 %>.</td>
           
           <td><%=Func.getFamily(Integer.parseInt(wc.get(i).get(25))) %></td>
           
           <td><%=wc.get(i).get(1) %></td>
            <td><%=wc.get(i).get(3) %></td>
            <td><%=wc.get(i).get(5) %></td>
            <td><%=wc.get(i).get(27) %></td>
            
            <td><%=wc.get(i).get(7) %></td>
             <td><%=wc.get(i).get(9) %></td>
             <td><%=wc.get(i).get(11) %></td>
             <td>(<%=wc.get(i).get(13) %>) <%=wc.get(i).get(14) %></td>
             
             <td><% if("color:#f00;".equals(func.colorValid(wc.get(i).get(0), wc.get(i).get(16), Func.getTodayDate(), elb, wc.get(i).get(20)))) { out.print(valid_family[1][1]); } else { out.print(valid_family[0][1]); } %></td>
             <td><%=wc.get(i).get(19) %></td>
             
             <td><%=wc.get(i).get(28) %></td>
             <td><%=wc.get(i).get(29) %></td>
             <td><%=wc.get(i).get(30) %></td>
             
             <td><%=wc.get(i).get(22) %></td>
             
             <td><%=Func.getDateTime(wc.get(i).get(20)) %></td>

            <td><%=wc.get(i).get(24) %></td>
            
            <td><%=wc.get(i).get(31) %></td>
          </tr>
          <%
          if(wc.get(i).get(21).equals("1")) {
              weld_pass += 1;
          } else if(wc.get(i).get(21).equals("2")) {
              weld_fail += 1;
          } else {
              weld_other += 1;
          }
          %>
          <% } } else { %>
          
          <% } %>
           </tbody>
       </table>
<hr />
           
           <div class="panel-body">
               <div class="col-lg-10">
                   <strong>Statistic:</strong>
               </div>
               <div class="col-lg-10">
                   <table width="100%">
                       <tr>
                           <td width="30%">Total Quantity of Welds</td>
                           <td width="5%">:</td>
                           <td><%=wc.size() %></td>
                       </tr>
                       <tr>
                           <td>Quantity of Welds Passed</td>
                           <td>:</td>
                           <td><%=weld_pass %></td>
                       </tr>
                       <tr>
                           <td>Quantity of Welds Failed</td>
                           <td>:</td>
                           <td><%=weld_fail %></td>
                       </tr>
                       <tr>
                           <td>Quantity of Others</td>
                           <td>:</td>
                           <td><%=weld_other %></td>
                       </tr>
                       <tr>
                           <td>Failed Percentage</td>
                           <td>:</td>
                           <td><% 
                           DecimalFormat formatter = new DecimalFormat("#0.00");
                           if(wc.size() > 0) {
                               out.print(formatter.format((weld_fail*1.0/wc.size()*1.0)*100));
                           } else {
                               out.print("0.00");
                           }
                                   %> %</td>
                       </tr>
                   </table>
               </div>
           </div>

                       <script type="text/javascript">
                           $(document).ready(function() {
                               $("#graf2").load("welding5/graf1.jsp?total=<%=wc.size() %>&pass=<%=weld_pass %>&fail=<%=weld_fail %>&others=<%=weld_other %>");
                           });
                       </script>
                       
                       <div id="graf2"></div>