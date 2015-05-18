<%@page import="java.util.ArrayList"%>
<%@page import="controllers.ReadFiles"%>
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

<!--<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="">Refresh</a>
        </div>
    </div>
</div>-->

<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <%

String pageChoosen = String.valueOf(session.getAttribute("pageChoosen"));
String pathPecah[] = (pageChoosen != null) ? (pageChoosen.split("/")) : (ReadFiles.START_PATH.split("/"));
//out.print(pathPecah[ReadFiles.START_PATH_NUM]+" &gt;&gt; ");
for (int i = ReadFiles.START_PATH_NUM+1; i < pathPecah.length-1; i++) {
    String pathTemp = "";
    for (int j = ReadFiles.START_PATH_NUM+1; j <= i; j++) {
        pathTemp += "/" + pathPecah[j] + "/";
    }
    //out.print("<a href='welding11/mainMenu2.jsp?p=" + pathTemp + "&c=" + ReadFiles.START_PATH + "'>" + pathPecah[i] + "</a> &gt;&gt; ");
}
if (pathPecah.length > 0) {
    //out.print(pathPecah[pathPecah.length-1]);
}
//out.print(pathPecah.length);
%>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-11">
        <div class="panel-body">
<form method="post" action="welding11/mainMenu2.jsp" id="form1">
<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>Name</th>
             <th>Folders / Files</th>
             <th>Choose for Baseline</th>
             <th>Choose for Comparison</th>
           </tr>
         </thead>
         <tbody>
<%
ArrayList<String> rf = ReadFiles.read(pageChoosen);
for (int i = 0; i < rf.size(); i++) {
    String pecah[] = rf.get(i).split("\\|");
    int isFilesOrFolders = Integer.parseInt(pecah[0]);
    String name = pecah[1];
    String type = (isFilesOrFolders == 1) ? ("File") : ("Folder");
    boolean statType = (isFilesOrFolders == 1) ? (true) : (false);
    String fileName = "";
    if (statType) {
        fileName = pageChoosen + "" + name;
    }
%>
             <tr>
                 <td><%=i+1 %>.</td>
                 <td>
                     <% if (statType == false) { %>
                     <a href="welding11/mainMenu2.jsp?p=<%=name %>&c=<%=pageChoosen %><%=fileName %>">
                     <% } %>
                         <%=name %>
                     <% if (statType == false) { %>
                     </a>
                     <% } %>
                 </td>
                 <td><%=type %></td>
                 <td>
                     <% if (statType) { %>
                     <input name="cbx_<%=i %>" type="checkbox" value="<%=name %>|<%=pageChoosen %>|<%=fileName %>" />
                     <% } %>
                     &nbsp;
                 </td>
                 <td>
                     <% if (statType) { %>
                     <input name="cbx2_<%=i %>" type="checkbox" value="<%=name %>|<%=pageChoosen %>|<%=fileName %>" />
                     <select name="color_<%=i %>">
                         <option value="1">Blue</option>
                         <option value="2">Green</option>
                         <option value="3">Purple</option>
                         <option value="4">Brown</option>
                         <option value="5">Yellow</option>
                     </select>
                     <% } %>
                     &nbsp;
                 </td>
             </tr>
<%
}
%>
           </tbody>
       </table>
           
           <div class="row" style="margin-top: 3%;">
               <div class="col-md-11">
                   <table>
                       <tr>
                           <th colspan="3">TOLERENCE (%)</th>
                       </tr>
                       <tr>
                           <td>Voltage</td>
                           <td>:</td>
                           <td><input type="text" value="5" name="tol1" class="form-control" /></td>
                       </tr>
                       <tr>
                           <td>Current</td>
                           <td>:</td>
                           <td><input type="text" value="5" name="tol2" class="form-control" /></td>
                       </tr>
                       <tr>
                           <td>Power</td>
                           <td>:</td>
                           <td><input type="text" value="5" name="tol3" class="form-control" /></td>
                       </tr>
                       <tr>
                           <td>Jaw Displacement</td>
                           <td>:</td>
                           <td><input type="text" value="5" name="tol4" class="form-control" /></td>
                       </tr>
                       <tr>
                           <td>Pressure 1</td>
                           <td>:</td>
                           <td><input type="text" value="5" name="tol51" class="form-control" /></td>
                       </tr>
                       <tr>
                           <td>Pressure 2</td>
                           <td>:</td>
                           <td><input type="text" value="5" name="tol52" class="form-control" /></td>
                       </tr>
                   </table>
                   <br />
                   <a class="tridik btn btn-success" href="#!" 
                      onclick="document.getElementById('form1').submit();">Plot Graph</a>
               </div>
           </div>

</form>
        </div>
    </div>
</div>

