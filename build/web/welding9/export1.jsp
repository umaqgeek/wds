<%@page import="models.Welding_child"%>
<%@page import="beans.Expired_Lejer_Bean"%>
<%@page import="models.Expired_Lejer"%>
<%@page import="beans.Expired_Type_Bean"%>
<%@page import="models.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.Func"%>
<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "inline; filename="
                    + "Welders.xls");
%>

<%
Component component = new Component();
ArrayList<ArrayList<String>> comp = component.getComponent("welder", 6);
%>

<h3 class="panel-title">VIEW WELDERS</h3>
<hr />

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
                   Expired_Lejer el = new Expired_Lejer();
                   Expired_Lejer_Bean elb = el.getExpiredLejer(2); // 2 means warning type
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
          <tr class="odd gradeA">
              <td colspan="5"><em>No Record ..</em></td>
          </tr>
          <% } %>
           </tbody>
       </table>