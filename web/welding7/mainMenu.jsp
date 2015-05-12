<%@page import="models.Welding_child"%>
<%@page import="beans.Expired_Lejer_Bean"%>
<%@page import="models.Expired_Lejer"%>
<%@page import="beans.Expired_Type_Bean"%>
<%@page import="helpers.Func"%>
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
        session.setAttribute("url_content", "welding7/mainMenu.jsp?w="+w_check);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else {
        session.setAttribute("url_content", "welding7/mainMenu.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}


%>

<% if(w_check == -1) { %>

<h3 class="panel-title warna-title">MANAGE COMPONENT</h3>
<hr />

<div class="row">
    <% for(int i = 0; i < num_w; i++) { %>    
    <div class="col-md-4">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding7/mainMenu.jsp?w=<%=i+1 %>"><%=w[i][0] %></a>
        </div>
    </div>
    <% } %>
</div>

<% } else { %>

<%
int numcol = 2;
if(w_check == num_w) {
    numcol = 6;
} else if(w_check == num_w-1) {
    numcol = 10;
} 
ArrayList<ArrayList<String>> comp = component.getComponent(w[w_check-1][2], numcol);
%>

<h3 class="panel-title warna-title">MANAGE <%=w[w_check-1][0].toUpperCase() %></h3>
<hr />
<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding/mainMenu.jsp?w=7">Back</a>
        </div>
    </div>
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding7/mainMenu2.jsp?w=<%=w_check %>&process=add">Add New</a>
        </div>
    </div>
</div>
        
<script type="text/javascript" language="javascript" src="assets/js/jquery.dataTables.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable();
    } );
</script>
<% if(w_check == num_w) { %>
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
        <td>Expired In <%=warning_month %> Month<%=ss %>. (<a href="welding7/editExpired2.jsp">Change</a>)</td>
        <td width="5%">&nbsp;</td>
        <td><div style="width: 30px; height: 30px; background-color: #f00;"></div></td>
        <td>Expired</td>
    </tr>
</table>
<% } %>
<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <% if(w_check == num_w) { %>
             <th>Staff No.</th>
             <th>Full Name</th>
             <th>Exp. Date (From Last Job)</th>
             <th>Exp. Date (Certificate)</th>
             <th>Expired Reason</th>
             <th>Certificate</th>
             <th>Category</th>
             <% } else if(w_check == num_w-1) { %>
             <th>WPS No.</th>
             <th>Family</th>
             <th>STA Grade</th>
             <th>Thickness Qualified Range (mm)</th>
             <th>Supplier</th>
             <th>Category</th>
             <% } else { %>
             <th>Description</th>
             <% } %>
             <th>Action</th>
           </tr>
         </thead>
         <tbody>
          <% if(comp.size() > 0) { 
                   Expired_Lejer el = new Expired_Lejer();
                   Expired_Lejer_Bean elb = el.getExpiredLejer(2); // 2 means warning type
                for(int i = 0; i < comp.size(); i++) { %>
          <tr class="odd gradeA">
           <td><%=i+1 %>.</td>
           <% if(w_check == num_w) { %>
           
           <%
               Func func = new Func();
               Welding_child wchild = new Welding_child();
               String wc_date = wchild.getWelderWCDate(Integer.parseInt(comp.get(i).get(0)));
                   
               String color = func.colorValid(comp.get(i).get(0), comp.get(i).get(3), Func.getTodayDate(), elb, wc_date);
               String reason = func.expiredReason(comp.get(i).get(0), Func.getTodayDate(), comp.get(i).get(3), elb, wc_date);
               String afterDate = func.getDateAfter(comp.get(i).get(0), Func.getWarningMonth(), wc_date);
           %>
           
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
           <% } else if(w_check == num_w-1) { %>
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
           <% } else { %>
           <td><%=comp.get(i).get(1) %></td>
           
           <% } %>
            <td>
                <a href="welding7/mainMenu2.jsp?w=<%=w_check %>&process=edit&id=<%=comp.get(i).get(0) %>">
                    <span class="badge">=</span>
                </a>
                <a onclick="return ask('Are you really want to delete this record?');" href="welding7/mainMenu2.jsp?w=<%=w_check %>&process=delete&id=<%=comp.get(i).get(0) %>">
                    <span class="badge">X</span>
                </a>
            </td>
          </tr>
          <% } } else { %>
          
          <% } %>
           </tbody>
       </table>

<% } %>