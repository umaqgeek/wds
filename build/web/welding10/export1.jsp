<%@page import="models.Component"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helpers.Func"%>
<%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "inline; filename="
                    + "WPSNumber.xls");
%>

<%
Component component = new Component();
ArrayList<ArrayList<String>> comp = component.getComponent("wps_number", 10);
%>

<h3 class="panel-title">VIEW WPS NUMBER</h3>
<hr />

<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>WPS No.</th>
             <th>Family</th>
             <th>STA Grade</th>
             <th>Thickness Qualified Range (mm)</th>
             <th>Supplier</th>
             <th>Category</th>
           </tr>
         </thead>
         <tbody>
          <% if(comp.size() > 0) { for(int i = 0; i < comp.size(); i++) { %>
          <tr class="odd gradeA">
           <td><%=i+1 %>.</td>
           <td><% 
             if(!comp.get(i).get(1).equals("-")) {
                    out.print("<a target='_blank' href='assets/uploads/"+comp.get(i).get(1)+"'>"+Func.getLinkNo(comp.get(i).get(1))+"</a>"); 
            } %></td>
             <td><% out.print(Func.getFamily(Integer.parseInt(comp.get(i).get(3)))); %>&nbsp;</td>
             <td><% out.print(comp.get(i).get(7)); %>&nbsp;</td>
             <td><% out.print(comp.get(i).get(2)); %>&nbsp;</td>
             <td><% out.print(comp.get(i).get(9)); %>&nbsp;</td>
             <td><%
                 ArrayList<String> getwc = component.getWnCat_list(Integer.parseInt(comp.get(i).get(0)));
                 for (int j = 0; j < getwc.size() - 1; j++) {
                     out.print(getwc.get(j)+"<br />");
                 }
                 if (getwc.size() > 0) {
                     out.print(getwc.get(getwc.size()-1)+"");
                 }
                 %>&nbsp;</td>
          </tr>
          <% } } else { %>
          <tr class="odd gradeA">
              <td colspan="7"><em>No Record ..</em></td>
          </tr>
          <% } %>
           </tbody>
       </table>