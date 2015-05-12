<%@page import="controllers.Starter"%>
<%@page import="models.User"%>
<%@page import="models.User"%>
<%@page import="java.util.ArrayList"%>
<% 
String process = "";

try {
    process = request.getParameter("process");      
    if(process.equals("add")) {
        session.setAttribute("url_content", "welding6/add.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else if(process.equals("edit")) {
        String id = request.getParameter("id");
        session.setAttribute("url_content", "welding6/edit.jsp?id="+id);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else if(process.equals("delete")) {
        String id = request.getParameter("id");
        session.setAttribute("url_content", "welding6/delete.jsp?id="+id);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}

User userr = new User();
ArrayList<ArrayList<String>> user = userr.getAll(); 
%>

<h3 class="panel-title warna-title">MANAGE USER</h3>
<hr />

<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding6/mainMenu.jsp?process=add">Add New User</a>
        </div>
    </div>
</div>

<script type="text/javascript" language="javascript" src="assets/js/jquery.dataTables.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable();
    } );
</script>
<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>Staff No.</th>
             <th>Full Name</th>
             <th>Username</th>
             <th>User Type</th>
             <th>Action</th>
           </tr>
         </thead>
         <tbody>
          <% if(user.size() > 0) { for(int i = 0; i < user.size(); i++) { %>
          <tr class="odd gradeA">
           <td><%=i+1 %>.</td>
           <td><%=user.get(i).get(1) %></td>
            <td><%=user.get(i).get(2) %></td>
            <td><%=user.get(i).get(3) %></td>
            <td><%=user.get(i).get(7) %></td>
            <td>
                <a href="welding6/mainMenu.jsp?process=edit&id=<%=user.get(i).get(0) %>">
                    <span class="badge">=</span>
                </a>
                <a onclick="return ask('Are you really want to delete this record?');" href="welding6/mainMenu.jsp?process=delete&id=<%=user.get(i).get(0) %>">
                    <span class="badge">X</span>
                </a>
            </td>
          </tr>
          <% } } else { %>
          
          <% } %>
           </tbody>
       </table>