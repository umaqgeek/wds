<%
int w_check = -1;
try {
    w_check = Integer.parseInt(request.getParameter("w"));
    if (w_check != -2) {
        session.setAttribute("url_content", "welding11/mockup1.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else {
        session.setAttribute("url_content", "welding11/mainMenu.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}   
try {
    w_check = Integer.parseInt(request.getParameter("f"));
    if (w_check != -2) {
        session.setAttribute("url_content", "welding11/mockup2.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    } else {
        session.setAttribute("url_content", "welding11/mainMenu.jsp");
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
        response.sendRedirect("../index.jsp");
    }
} catch (Exception e) {
}  
%>

<h3 class="panel-title warna-title">WELDING CURVE PLOT</h3>
<hr />

<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="">Refresh</a>
        </div>
    </div>
</div>

<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>Folders / Files</th>
           </tr>
         </thead>
         <tbody>
             <tr>
                 <td>1.</td>
                 <td><a href="welding11/mainMenu.jsp?w=1">Machine Model 1</a></td>
             </tr>
             <tr>
                 <td>2.</td>
                 <td><a href="welding11/mainMenu.jsp?w=2">Machine Model 2</a></td>
             </tr>
           </tbody>
       </table>