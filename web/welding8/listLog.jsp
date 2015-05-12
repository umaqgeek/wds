<%@page import="controllers.Starter"%>
<%@page import="models.History_log"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.Func"%>

<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "inline; filename=ListLog.xls");
%>

<% 
History_log history_log = new History_log();
ArrayList<ArrayList<String>> hl = history_log.getAll();  %>

<h3 class="panel-title">List of Log (<%=Func.getDateTime(Func.getTodayDate()) %>)</h3>
<hr />

<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>Full Name (Staff No.)</th>
             <th>Action</th>
             <th>Date</th>
           </tr>
         </thead>
         <tbody>
          <% if(hl.size() > 0) { for(int i = 0; i < hl.size(); i++) { %>
          <tr class="odd gradeA">
           <td><%=i+1 %>.</td>
           <td><%=hl.get(i).get(3) %> (<%=hl.get(i).get(2) %>)</td>
            <td><%=hl.get(i).get(8) %></td>
            <td><%=Func.getDateTime(hl.get(i).get(10)) %></td>
          </tr>
          <% } } else { %>
          <tr class="odd gradeA">
              <td colspan="5"><em>No History ..</em></td>
          </tr>
          <% } %>
           </tbody>
       </table>