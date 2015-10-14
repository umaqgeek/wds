<%@page import="helpers.Func"%>
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
        String pecah[] = f.split(ReadFiles.START_PATH_SEPARATOR);
        filex1.add(pecah[pecah.length-1]);
    }
    for (String f: files.get(1)) {
        String pecah[] = f.split(ReadFiles.START_PATH_SEPARATOR);
        filex2.add(pecah[pecah.length-1].split("\\|")[0]);
        filex3.add(pecah[pecah.length-1].split("\\|")[0]+"|"+pecah[pecah.length-1].split("\\|")[1]);
    }
//    out.print(files+"<br />");
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
String pathPecah[] = (pageChoosen != null) ? (pageChoosen.split(ReadFiles.START_PATH_SEPARATOR)) : (ReadFiles.START_PATH.split(ReadFiles.START_PATH_SEPARATOR));
//out.print(pathPecah[ReadFiles.START_PATH_NUM]+" &gt;&gt; ");
for (int i = ReadFiles.START_PATH_NUM; i < pathPecah.length-1; i++) {
    String pathTemp = "";
    for (int j = ReadFiles.START_PATH_NUM+1; j <= i; j++) {
        pathTemp += ReadFiles.START_PATH_SEPARATOR + pathPecah[j] + ReadFiles.START_PATH_SEPARATOR;
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
int start = Func.START_AT;
int length = Func.LENGTH_SIZE;
try {
    start = Integer.parseInt(request.getParameter("start"));
    length = Integer.parseInt(request.getParameter("length"));
} catch (Exception e) {
    start = Func.START_AT;
    length = Func.LENGTH_SIZE;
}
String carian = "";
try {
    carian = request.getParameter("carian");
} catch (Exception e) {
    carian = "";
}
ArrayList<String> rf = ReadFiles.read(pageChoosen, start, length, carian);
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
                             if (st.equals(fileName.split(ReadFiles.START_PATH_SEPARATOR)[fileName.split("/").length-1])) {
                                 status = "checked";
                             }
                         }
                     %>
                     <input name="cbx_<%=i %>" id="cbx_<%=i %>" type="checkbox" value="<%=name %>|<%=pageChoosen %>|<%=fileName %>" <%=status %> />
                     <% } %>
                     &nbsp;
                 </td>
                 <td>
                     <% if (statType) {
                         String status = "";
                         String colorStatus = "1";
                         for (String st: filex2) {
                             if (st.equals(fileName.split(ReadFiles.START_PATH_SEPARATOR)[fileName.split(ReadFiles.START_PATH_SEPARATOR).length-1])) {
                                 status = "checked";
                             }
                         }
                         for (String st2: filex3) {
                             if (st2.split("\\|")[0].equals(fileName.split(ReadFiles.START_PATH_SEPARATOR)[fileName.split(ReadFiles.START_PATH_SEPARATOR).length-1])) {
                                 colorStatus = st2.split("\\|")[1];
                             }
                         }
                     %>
                     <input name="cbx2_<%=i %>" id="cbx2_<%=i %>" type="checkbox" value="<%=name %>|<%=pageChoosen %>|<%=fileName %>" <%=status %> />
                     <select name="color_<%=i %>" id="color_<%=i %>">
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
<% } %>
           </tbody>
       </table>
</form>
        </div>
    </div>
</div>
           
           <div class="row">
               <div class="col-md-11">&nbsp;&nbsp;
                   Data from <%=start %> to <%=start+Func.LENGTH_SIZE %><br />
                   &nbsp;&nbsp;
                   [<a href="welding11/mainMenu3.jsp?start=0&length=<%=length %>">Start</a>]
                   [<a href="welding11/mainMenu3.jsp?start=<%=(start-length<=0)?(0):(start-length) %>&length=<%=length %>">Previous</a>]
                   [<a href="welding11/mainMenu3.jsp?start=<%=(start+length) %>&length=<%=length %>">Next</a>]<br />
                   <form action="welding11/mainMenu3.jsp" method="post">
                       &nbsp;&nbsp;Search: <input type="text" name="carian" />&nbsp;&nbsp;<button type="submit">Search</button>
                   </form>
               </div>
           </div>
               
           <br />
           
           <div class="row">
               <div class="col-md-12">
                   <a class="tridik btn btn-success" href="#!" id="addtolist">Add To List</a>
               </div>
           </div>
           


<div id="paparCart1"></div>

<script>
$(document).ready(function() {
    $.post( "welding11/ajax/getCart1.jsp", { 
        pageChoosen: "<%=pageChoosen %>"
    }).done(function( data ) {
        $("#paparCart1").html( data );
    });
    $("#addtolist").click(function() {
        for (i=0; i<<%=ReadFiles.NUM_OF_FILES %>; i++) {
            if ($("#cbx_"+i).is( ":checked" )) {
                var cbx_x = $("#cbx_"+i).val();
                $.post( "welding11/ajax/setCart1.jsp", { 
                    cbx_x: cbx_x
                }).done(function( data ) {
                    $.post( "welding11/ajax/getCart1.jsp", { 
                        pageChoosen: "<%=pageChoosen %>"
                    }).done(function( data1 ) {
                        $("#paparCart1").html( data1 );
                    });
                });
            }
            if ($("#cbx2_"+i).is( ":checked" )) {
                var cbx2_x = $("#cbx2_"+i).val();
                var color_x = $("#color_"+i).val();
                $.post( "welding11/ajax/setCart1.jsp", { 
                    cbx2_x: cbx2_x,
                    color_x: color_x
                }).done(function( data ) {
                    $.post( "welding11/ajax/getCart1.jsp", { 
                        pageChoosen: "<%=pageChoosen %>"
                    }).done(function( data1 ) {
                        $("#paparCart1").html( data1 );
                    });
                });
            }
        }
    });
    
});
</script>