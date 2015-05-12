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
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "inline; filename="
                    + "Report.xls");
%>

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
String weld_family[][] = {{"1", "Strip Welding"}, {"2", "Wire Welding"}, {"3", "Raboutage"}, {"4", "Carcass Stop Ring"}};
String valid_family[][] = {{"1", "Valid"}, {"2", "Expired"}};

int w_status = 0;
String w_sfnumber = "";
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
    fp_id = Integer.parseInt(request.getParameter("fp_id"));
    m_id = Integer.parseInt(request.getParameter("m_id"));
    wsize_id = Integer.parseInt(request.getParameter("wsize_id"));
    sup_id = Integer.parseInt(request.getParameter("sup_id"));
    sg_id = Integer.parseInt(request.getParameter("sg_id"));
    we_id = Integer.parseInt(request.getParameter("we_id"));
    wm_id = Integer.parseInt(request.getParameter("wm_id"));
    date_from = request.getParameter("date_from");
    date_to = request.getParameter("date_to");
    ws_id = Integer.parseInt(request.getParameter("ws_id"));
    fc_id = Integer.parseInt(request.getParameter("fc_id"));
    welder_status = Integer.parseInt(request.getParameter("welder_status"));
    cat_id = Integer.parseInt(request.getParameter("cat_id"));
} catch (Exception e) {
    w_status = 0;
    w_sfnumber = "";
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

<h3 class="panel-title">REPORT (Query &AMP; Statistics)</h3>
<hr />

<hr />
<script type="text/javascript" language="javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" language="javascript" src="assets/js/jquery.dataTables.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable();
    } );
</script>
                
<table class="table table-bordered table-hover table-striped display" id="example" >
         
            <tr style="font-size: small;">
             <th>No.</th>
             
             <th>Family</th>
             
             <th>SF Number</th>
             <th>Fabrication Phase</th>
             <th>Manuf. Machine</th>
             <th>Category</th>
             
             <th>Size (wire / strip)</th>
             <th>Supplier</th>
             <th>STA (Grade)</th>
             <th>Welder Name</th>
             <th>Welder Status</th>
             <th>Welding Machine</th>
             
             <th>Weld Duration (Sec)</th>
             <th>Spool No.</th>
             <th>Bobbin No.</th>
             
             <th>Weld Status</th>
             
             <th>Welding Date</th>
             
             <th>Cause of Failure</th>
           </tr>
        
             <%
             int weld_pass = 0;
             int weld_fail = 0;
             int weld_other = 0;
             %>
          <% if(wc.size() > 0) { 
              
              Func func = new Func();
                   Expired_Lejer el = new Expired_Lejer();
                   Expired_Lejer_Bean elb = el.getExpiredLejer(2);
              
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
                               $("#graf2").load("welding5/graf1.jsp?total=<%=wc.size() %>&pass=<%=weld_pass %>&fail=<%=weld_fail %>");
                           });
                       </script>
                       
                       <div id="graf2"></div>