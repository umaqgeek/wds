<%@page import="models.Welding_child"%>
<%@page import="beans.Expired_Lejer_Bean"%>
<%@page import="models.Expired_Lejer"%>
<%@page import="beans.Expired_Type_Bean"%>
<%@page import="models.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.Func"%>

<%
Component component = new Component();
ArrayList<ArrayList<String>> comp = component.getComponent("welder", 6);
%>

<h3 class="panel-title warna-title">VIEW WELDERS</h3>
<hr />

<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" target="_blank" href="welding9/export1.jsp">Export Log</a>
        </div>
    </div>
</div>

<table cellpadding="5" align="center">
    <tr>
        <td><div style="width: 30px; height: 30px; background-color: #000;"></div></td>
        <td>Valid</td>
        <td width="5%">&nbsp;</td>
        <td><div style="width: 30px; height: 30px; background-color: orange;"></div></td>
         <%        
        Expired_Lejer el = new Expired_Lejer();
        Expired_Lejer_Bean elb = el.getExpiredLejer(2);
        int seconds = 0;
        try {
            seconds = Integer.parseInt(elb.getEl_time());
        } catch (Exception e) {
        }
        
        int warning_month = Func.secondToDate(1, seconds);
        String ss = (warning_month > 1) ? ("s") : ("");
    %>
        <td>Expired In <%=warning_month %> Month<%=ss %>.</td>
        <td width="5%">&nbsp;</td>
        <td><div style="width: 30px; height: 30px; background-color: #f00;"></div></td>
        <td>Expired</td>
    </tr>
</table>
<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>Staff No.</th>
             <th>Full Name</th>
             <th>Exp. Date (From Last Job)</th>
             <th>Exp. Date (Certificate)</th>
             <th>Expired Reason</th>
             <th>Certificate</th>
             <th>Category</th>
           </tr>
         </thead>
         <tbody>
          <% if(comp.size() > 0) { 
              
                for(int i = 0; i < comp.size(); i++) { %>
          
          <%
               Func func = new Func();
               Welding_child wchild = new Welding_child();
               String wc_date = wchild.getWelderWCDate(Integer.parseInt(comp.get(i).get(0)));
                   
               String color = func.colorValid(comp.get(i).get(0), comp.get(i).get(3), Func.getTodayDate(), elb, wc_date);
               String reason = func.expiredReason(comp.get(i).get(0), Func.getTodayDate(), comp.get(i).get(3), elb, wc_date);
               String afterDate = func.getDateAfter(comp.get(i).get(0), Func.getWarningMonth(), wc_date);
           %>
          
          <tr class="odd gradeA">
           <td><%=i+1 %>.</td>
           <td><% out.print("<span style='"+color+"'>"+comp.get(i).get(1)+"</span>"); %></td>
           <td><% out.print("<span style='"+color+"'>"+comp.get(i).get(2)+"</span>"); %></td>
           <td><% out.print("<span style='"+color+"'>"+afterDate+"</span>"); %></td>
           
           <td><% out.print("<span style='"+color+"'>"+comp.get(i).get(3)+"</span>"); %></td>
           
           <td><% out.print( reason ); %></td>
           
             <td><% if(!comp.get(i).get(4).equals("-")) { out.print("<a target='_blank' href='assets/uploads/"+comp.get(i).get(4)+"'>"+comp.get(i).get(4)+"</a>"); } %></td>
             <td>
                 <%
                 ArrayList<String> getwc = component.getWeCat_list(Integer.parseInt(comp.get(i).get(0)));
                 for (int j = 0; j < getwc.size() - 1; j++) {
                     out.print(getwc.get(j)+"<br />");
                 }
                 if (getwc.size() > 0) {
                     out.print(getwc.get(getwc.size()-1)+"");
                 }
                 %>
                 &nbsp;</td>
          </tr>
          <% } } else { %>
          
          <% } %>
           </tbody>
       </table>