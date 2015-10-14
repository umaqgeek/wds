<%@page import="controllers.ReadFiles"%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%
String pageChoosen = "";
try {
    pageChoosen = request.getParameter("pageChoosen");
} catch (Exception e) {
    pageChoosen = "";
}
ArrayList<String> filex1 = new ArrayList<String>();
ArrayList<String> filex2 = new ArrayList<String>();
ArrayList<String> filex3 = new ArrayList<String>();
try {
    ArrayList<ArrayList<String>> files = (ArrayList<ArrayList<String>>) session.getAttribute("fileExcel");
    for (String f: files.get(0)) {
        String pecah[] = f.split(ReadFiles.START_PATH_SEPARATOR);
        filex1.add(f);
    }
    for (String f: files.get(1)) {
        String pecah[] = f.split("\\|");
        filex2.add(f);
        filex3.add(pecah[0]+"|"+pecah[1]);
    }
//    out.print(filex1 + "<br />");
//    out.print(filex2 + "<br />");
//    out.print(filex3 + "<br />");
//    out.print(files + "<br />");
} catch (Exception e) {
}
%>

<form method="post" action="welding11/mainMenu2.jsp?p=&c=<%=pageChoosen %>" id="form2">
<div class="row">
    <div class="col-md-6 col-md-offset-1">               
        <h3>Choosen Files for Baseline</h3>
        <table class="table table-bordered table-hover table-striped display">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                int i=1; 
                for (String f: filex1) {
                    String name = f;
                    String fileName = pageChoosen + name;
                %>
                <input name="cbx_<%=i %>" type="hidden" value="<%=name %>|<%=pageChoosen %>|<%=f %>" />
                <tr>
                    <td><%=i++ %>.</td>
                    <td><%=f %></td>
                    <td><a href="#!" tt="<%=f.split(ReadFiles.START_PATH_SEPARATOR)[f.split(ReadFiles.START_PATH_SEPARATOR).length-1] %>" class="delete1"> X </a></td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td><a href="#!" dataall="1" class="deleteAll">Clear All</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
            
<div class="row">
    <div class="col-md-6 col-md-offset-1">               
        <h3>Choosen Files for Comparison</h3>
        <table class="table table-bordered table-hover table-striped display">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Color</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                int j=1; 
                for (String f: filex3) {
                    String file = f.split("\\|")[0];
                    String colorID = f.split("\\|")[1];
                    String color = Func.getColor2(colorID);
                    String name = file;
                    String fileName = pageChoosen + name;
                %>
                <input name="cbx2_<%=j %>" type="hidden" value="<%=name %>|<%=pageChoosen %>|<%=file %>" />
                <input name="color_<%=j %>" type="hidden" value="<%=colorID %>" />
                <tr>
                    <td><%=j++ %>.</td>
                    <td><%=file %></td>
                    <td><%=color %></td>
                    <td><a href="#!" tt2="<%=file.split(ReadFiles.START_PATH_SEPARATOR)[file.split(ReadFiles.START_PATH_SEPARATOR).length-1]+"|"+colorID %>" class="delete2"> X </a></td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="3">&nbsp;</td>
                    <td><a href="#!" dataall="2" class="deleteAll">Clear All</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
            
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
                   
               </div>
           </div>

<div class="row">
    <div class="col-md-12">
        <a class="tridik btn btn-success" href="#!" 
           onclick="document.getElementById('form2').submit();">Plot Graph</a>
    </div>
</div>
</form>
            
            
<script>
$(".delete1").click(function() {
    var tt = $(this).attr("tt");
    $.post( "welding11/ajax/deleteCart1.jsp", { 
        tt: tt
    }).done(function( data ) {
        $.post( "welding11/ajax/getCart1.jsp", { 
            pageChoosen: "<%=pageChoosen %>"
        }).done(function( data1 ) {
            $("#paparCart1").html( data1 );
        });
    });
});

$(".delete2").click(function() {
    var tt2 = $(this).attr("tt2");
    $.post( "welding11/ajax/deleteCart1.jsp", { 
        tt2: tt2
    }).done(function( data ) {
        $.post( "welding11/ajax/getCart1.jsp", { 
            pageChoosen: "<%=pageChoosen %>"
        }).done(function( data1 ) {
            $("#paparCart1").html( data1 );
        });
    });
});

$(".deleteAll").click(function() {
    var dataall = $(this).attr("dataall");
    $.post( "welding11/ajax/deleteCart1.jsp", { 
        all: dataall
    }).done(function( data ) {
        $.post( "welding11/ajax/getCart1.jsp", { 
            pageChoosen: "<%=pageChoosen %>"
        }).done(function( data1 ) {
            $("#paparCart1").html( data1 );
        });
    });
});
</script>