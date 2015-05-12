<%@page import="controllers.Starter"%>
<%@page import="helpers.Func"%>
<%@page import="models.History_log"%>
<%@page import="java.util.ArrayList"%>
<% 
String process = "";

try {
    process = request.getParameter("process");      
    if(process.equals("clear")) {
        session.setAttribute("url_content", "welding8/clear.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}
History_log history_log = new History_log();
ArrayList<ArrayList<String>> hl = history_log.getAll(); 
%>

<h3 class="panel-title warna-title">MANAGE LOG</h3>
<hr />

<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" onClick="return ask('Are you sure want to clear all log?');" href="welding8/mainMenu.jsp?process=clear">Clear Log</a>
            <a class="tridik btn btn-success" target="_blank" href="welding8/listLog.jsp">Export Log</a>
        </div>
    </div>
</div>


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
          
          <% } %>
           </tbody>
       </table>