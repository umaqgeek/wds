
<%@page import="java.util.ArrayList"%>
<h3 class="panel-title warna-title">WELDING CURVE PLOT</h3>
<hr />

<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding/mainMenu.jsp?w=11">Back</a>
        </div>
    </div>
</div>

<%
    
    ArrayList<String> files = (ArrayList<String>) session.getAttribute("fileExcel");
    String filename = files.get(0);
    
    %>