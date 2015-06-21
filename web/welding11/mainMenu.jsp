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

ArrayList<String> filex1 = new ArrayList<String>();
ArrayList<String> filex2 = new ArrayList<String>();
ArrayList<String> filex3 = new ArrayList<String>();
try {
    ArrayList<ArrayList<String>> files = (ArrayList<ArrayList<String>>) session.getAttribute("fileExcel");
    for (String f: files.get(0)) {
        String pecah[] = f.split("/");
        filex1.add(pecah[pecah.length-1]);
    }
    for (String f: files.get(1)) {
        String pecah[] = f.split("/");
        filex2.add(pecah[pecah.length-1].split("\\|")[0]);
        filex3.add(pecah[pecah.length-1].split("\\|")[0]+"|"+pecah[pecah.length-1].split("\\|")[1]);
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
for (int i = ReadFiles.START_PATH_NUM; i < pathPecah.length-1; i++) {
    String pathTemp = "";
    for (int j = ReadFiles.START_PATH_NUM+1; j <= i; j++) {
        pathTemp += "/" + pathPecah[j] + "/";
    }
    out.print("<a href='welding11/mainMenu2.jsp?p=" + pathTemp + "&c=" + ReadFiles.START_PATH + "'>" + pathPecah[i] + "</a> &gt;&gt; ");
}
if (pathPecah.length > 0) {
    out.print(pathPecah[pathPecah.length-1]);
}
//out.print(pathPecah.length);
%>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-11">
        <div class="panel-body">
<form method="post" action="welding11/mainMenu2.jsp?p=&c=<%=pageChoosen %>" id="form1">
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
                     <% if (statType) {
                         String status = "";
                         for (String st: filex1) {
                             if (st.equals(fileName.split("/")[fileName.split("/").length-1])) {
                                 status = "checked";
                             }
                         }
                     %>
                     <input name="cbx_<%=i %>" type="checkbox" value="<%=name %>|<%=pageChoosen %>|<%=fileName %>" <%=status %> />
                     <% } %>
                     &nbsp;
                 </td>
                 <td>
                     <% if (statType) {
                         String status = "";
                         String colorStatus = "1";
                         for (String st: filex2) {
                             if (st.equals(fileName.split("/")[fileName.split("/").length-1])) {
                                 status = "checked";
                             }
                         }
                         for (String st2: filex3) {
                             if (st2.split("\\|")[0].equals(fileName.split("/")[fileName.split("/").length-1])) {
                                 colorStatus = st2.split("\\|")[1];
                             }
                         }
                     %>
                     <input name="cbx2_<%=i %>" type="checkbox" value="<%=name %>|<%=pageChoosen %>|<%=fileName %>" <%=status %> />
                     <select name="color_<%=i %>">
                         <option value="1" <% if(colorStatus.equals("1")) { out.print("selected"); } %>>Red</option>
                         <option value="2" <% if(colorStatus.equals("2")) { out.print("selected"); } %>>Green</option>
                         <option value="3" <% if(colorStatus.equals("3")) { out.print("selected"); } %>>Dark Blue</option>
                         <option value="4" <% if(colorStatus.equals("4")) { out.print("selected"); } %>>Yellow</option>
                         <option value="5" <% if(colorStatus.equals("5")) { out.print("selected"); } %>>Light Purple</option>
                         <option value="6" <% if(colorStatus.equals("6")) { out.print("selected"); } %>>Cyan</option>
                         <option value="7" <% if(colorStatus.equals("7")) { out.print("selected"); } %>>Grey</option>
                         <option value="8" <% if(colorStatus.equals("8")) { out.print("selected"); } %>>Ugly Green</option>
                         <option value="9" <% if(colorStatus.equals("9")) { out.print("selected"); } %>>Blue</option>
                         <option value="10" <% if(colorStatus.equals("10")) { out.print("selected"); } %>>Light Brown</option>
                         <option value="11" <% if(colorStatus.equals("11")) { out.print("selected"); } %>>Dark Pink</option>
                         <option value="12" <% if(colorStatus.equals("12")) { out.print("selected"); } %>>Dark Green</option>
                         <option value="13" <% if(colorStatus.equals("13")) { out.print("selected"); } %>>Light Green</option>
                         <option value="14" <% if(colorStatus.equals("14")) { out.print("selected"); } %>>Dark Purple</option>
                         <option value="15" <% if(colorStatus.equals("15")) { out.print("selected"); } %>>Dark Cyan</option>
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
                           <th colspan="3">TOLERANCE (%)</th>
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

