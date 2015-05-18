
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.ReadFiles"%>
<%@page import="java.util.Properties"%>
<%@page import="helpers.ReadWriteExcel"%>
<%
    ArrayList<ArrayList<String>> files = (ArrayList<ArrayList<String>>) session.getAttribute("fileExcel");
    
    int tolerance1 = 0;
    int tolerance2 = 0;
    int tolerance3 = 0;
    int tolerance4 = 0;
    int tolerance51 = 0;
    int tolerance52 = 0;
    try {
        tolerance1 = Integer.parseInt(files.get(2).get(0));
        tolerance2 = Integer.parseInt(files.get(2).get(1));
        tolerance3 = Integer.parseInt(files.get(2).get(2));
        tolerance4 = Integer.parseInt(files.get(2).get(3));
        tolerance51 = Integer.parseInt(files.get(2).get(4));
        tolerance52 = Integer.parseInt(files.get(2).get(5));
    } catch (Exception e) {
        tolerance1 = 0;
        tolerance2 = 0;
        tolerance3 = 0;
        tolerance4 = 0;
        tolerance51 = 0;
        tolerance52 = 0;
    }
    
    String label = "";
    String dataA = "";
    String dataAtol1 = "";
    String dataAtol2 = "";
    String dataB = "";
    String dataBtol1 = "";
    String dataBtol2 = "";
    String dataC = "";
    String dataCtol1 = "";
    String dataCtol2 = "";
    String dataD = "";
    String dataDtol1 = "";
    String dataDtol2 = "";
    String dataE1 = "";
    String dataE1tol1 = "";
    String dataE1tol2 = "";
    String dataE2 = "";
    String dataE2tol1 = "";
    String dataE2tol2 = "";
    ArrayList<String> dataXa = new ArrayList<String>();
    ArrayList<String> dataXb = new ArrayList<String>();
    ArrayList<String> dataXc = new ArrayList<String>();
    ArrayList<String> dataXd = new ArrayList<String>();
    ArrayList<String> dataXe1 = new ArrayList<String>();
    ArrayList<String> dataXe2 = new ArrayList<String>();
    
    int limit = 200;
    double avgA[] = new double[limit];
    double avgB[] = new double[limit];
    double avgC[] = new double[limit];
    double avgD[] = new double[limit];
    double avgE1[] = new double[limit];
    double avgE2[] = new double[limit];
    
    for (int j = 0; j < limit; j++) {
        avgA[j] = 0;
        avgB[j] = 0;
        avgC[j] = 0;
        avgD[j] = 0;
        avgE1[j] = 0;
        avgE2[j] = 0;
    }
    
    int filesSize2 = files.get(1).size();
    for (int j = 0; j < filesSize2; j++) { //secondary group of files
        String filename = files.get(1).get(j).split("\\|")[0];
        String color = files.get(1).get(j).split("\\|")[1];
        String colorCode = Func.getColor(color);
        ReadWriteExcel rwe = new ReadWriteExcel();
        Properties prop = rwe.read(filename);
        try {
            String a2[] = prop.getProperty("a").split("\\|");
            String b2[] = prop.getProperty("b").split("\\|");
            String c2[] = prop.getProperty("c").split("\\|");
            String d2[] = prop.getProperty("d").split("\\|");
            String e12[] = prop.getProperty("e1").split("\\|");
            String e22[] = prop.getProperty("e2").split("\\|");
            limit = (c2.length < limit) ? (c2.length) : (limit);
            String atemp = "";
            String btemp = "";
            String ctemp = "";
            String dtemp = "";
            String e1temp = "";
            String e2temp = "";
            for (int i = 0; i < c2.length-1; i++) {
                atemp += a2[i]+",";
                btemp += b2[i]+",";
                ctemp += c2[i]+",";
                dtemp += d2[i]+",";
                e1temp += e12[i]+",";
                e2temp += e22[i]+",";
            }
            atemp += a2[c2.length-1];
            btemp += b2[c2.length-1];
            ctemp += c2[c2.length-1];
            dtemp += d2[c2.length-1];
            e1temp += e12[c2.length-1];
            e2temp += e22[c2.length-1];
            dataXa.add(atemp+"|"+filename+"|"+colorCode);
            dataXb.add(btemp+"|"+filename+"|"+colorCode);
            dataXc.add(ctemp+"|"+filename+"|"+colorCode);
            dataXd.add(dtemp+"|"+filename+"|"+colorCode);
            dataXe1.add(e1temp+"|"+filename+"|"+colorCode);
            dataXe2.add(e2temp+"|"+filename+"|"+colorCode);
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("fileExcel", "");
                session.setAttribute("pageChoosen", ReadFiles.START_PATH + "/");
                session.setAttribute("url_content", "welding11/mainMenu.jsp");
                session.setAttribute("url_menu", "menu/menuAdmin.jsp");
                session.setAttribute("url_stat", 2);
                response.sendRedirect("../index.jsp");
        }
    }
    
    int filesSize = files.get(0).size(); //primary group of files
    for (int j = 0; j < filesSize; j++) {
    
        String filename = files.get(0).get(j);
        //out.print(filename+"<br />");
        ReadWriteExcel rwe = new ReadWriteExcel();
        Properties prop = rwe.read(filename);

        try {
            String a[] = prop.getProperty("a").split("\\|");
            String b[] = prop.getProperty("b").split("\\|");
            String c[] = prop.getProperty("c").split("\\|");
            String d[] = prop.getProperty("d").split("\\|");
            String e1[] = prop.getProperty("e1").split("\\|");
            String e2[] = prop.getProperty("e2").split("\\|");
            
            limit = (c.length < limit) ? (c.length) : (limit);

            for (int i = 0; i < c.length-1; i++) {
                
                avgA[i] += Double.parseDouble(a[i]);
                avgB[i] += Double.parseDouble(b[i]);
                avgC[i] += Double.parseDouble(c[i]);
                avgD[i] += Double.parseDouble(d[i]);
                avgE1[i] += Double.parseDouble(e1[i]);
                avgE2[i] += Double.parseDouble(e2[i]);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("fileExcel", "");
                session.setAttribute("pageChoosen", ReadFiles.START_PATH + "/");
                session.setAttribute("url_content", "welding11/mainMenu.jsp");
                session.setAttribute("url_menu", "menu/menuAdmin.jsp");
                session.setAttribute("url_stat", 2);
                response.sendRedirect("../index.jsp");
        }

    }
    
        for (int i = 0; i < limit-1; i++) {
            label += "\"" + (i + 1) + "\",";
            dataA += (avgA[i]*1.0/filesSize) + ",";
            dataAtol1 += ((avgA[i]*1.0/filesSize)*((100+tolerance1)*1.0/100)) + ",";
            dataAtol2 += ((avgA[i]*1.0/filesSize)*((100-tolerance1)*1.0/100)) + ",";
            dataB += (avgB[i]*1.0/filesSize) + ",";
            dataBtol1 += ((avgB[i]*1.0/filesSize)*((100+tolerance2)*1.0/100)) + ",";
            dataBtol2 += ((avgB[i]*1.0/filesSize)*((100-tolerance2)*1.0/100)) + ",";
            dataC += (avgC[i]*1.0/filesSize) + ",";
            dataCtol1 += ((avgC[i]*1.0/filesSize)*((100+tolerance3)*1.0/100)) + ",";
            dataCtol2 += ((avgC[i]*1.0/filesSize)*((100-tolerance3)*1.0/100)) + ",";
            dataD += (avgD[i]*1.0/filesSize) + ",";
            dataDtol1 += ((avgD[i]*1.0/filesSize)*((100+tolerance4)*1.0/100)) + ",";
            dataDtol2 += ((avgD[i]*1.0/filesSize)*((100-tolerance4)*1.0/100)) + ",";
            dataE1 += (avgE1[i]*1.0/filesSize) + ",";
            dataE1tol1 += ((avgE1[i]*1.0/filesSize)*((100+tolerance51)*1.0/100)) + ",";
            dataE1tol2 += ((avgE1[i]*1.0/filesSize)*((100-tolerance51)*1.0/100)) + ",";
            dataE2 += (avgE2[i]*1.0/filesSize) + ",";
            dataE2tol1 += ((avgE2[i]*1.0/filesSize)*((100+tolerance52)*1.0/100)) + ",";
            dataE2tol2 += ((avgE2[i]*1.0/filesSize)*((100-tolerance52)*1.0/100)) + ",";
        }
        label += "\"" + (limit - 1) + "\"";
        dataA += (avgA[limit - 1]*1.0/filesSize);
        dataAtol1 += ((avgA[limit - 1]*1.0/filesSize)*((100+tolerance1)*1.0/100));
        dataAtol2 += ((avgA[limit - 1]*1.0/filesSize)*((100+tolerance1)*1.0/100));
        dataB += (avgB[limit - 1]*1.0/filesSize);
        dataBtol1 += ((avgB[limit - 1]*1.0/filesSize)*((100+tolerance2)*1.0/100));
        dataBtol2 += ((avgB[limit - 1]*1.0/filesSize)*((100+tolerance2)*1.0/100));
        dataC += (avgC[limit - 1]*1.0/filesSize);
        dataCtol1 += ((avgC[limit - 1]*1.0/filesSize)*((100+tolerance3)*1.0/100));
        dataCtol2 += ((avgC[limit - 1]*1.0/filesSize)*((100+tolerance3)*1.0/100));
        dataD += (avgD[limit - 1]*1.0/filesSize);
        dataDtol1 += ((avgD[limit - 1]*1.0/filesSize)*((100+tolerance4)*1.0/100));
        dataDtol2 += ((avgD[limit - 1]*1.0/filesSize)*((100+tolerance4)*1.0/100));
        dataE1 += (avgE1[limit - 1]*1.0/filesSize);
        dataE1tol1 += ((avgE1[limit - 1]*1.0/filesSize)*((100+tolerance51)*1.0/100));
        dataE1tol2 += ((avgE1[limit - 1]*1.0/filesSize)*((100+tolerance51)*1.0/100));
        dataE2 += (avgE2[limit - 1]*1.0/filesSize);
        dataE2tol1 += ((avgE2[limit - 1]*1.0/filesSize)*((100+tolerance52)*1.0/100));
        dataE2tol2 += ((avgE2[limit - 1]*1.0/filesSize)*((100+tolerance52)*1.0/100));
%>

<h3 class="panel-title warna-title">WELDING CURVE PLOT</h3>
<hr />

<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding/mainMenu.jsp?w=11">Back</a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="#!" onclick="window.print();">Print</a>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6 col-md-offset-1">
        <h4>Voltage (Tolerance <%=tolerance1 %>%)</h4>
        <table class="table table-striped">
            <tr>
                <th colspan="3">Legend</th>
            </tr>
            <tr>
                <td>Average Line</td>
                <td>:</td>
                <td><div style="background-color:rgba(100,100,100,1);">&nbsp;</div></td>
            </tr>
            <tr>
                <td>Tolerance Line</td>
                <td>:</td>
                <td><div style="background-color:rgba(220,0,0,1);">&nbsp;</div></td>
            </tr>
<% for (int j = 0; j < dataXa.size(); j++) { %>
            <tr>
                <td><%=dataXa.get(j).split("\\|")[1] %>&nbsp;</td>
                <td>:</td>
                <td><div style="background-color:<%=dataXa.get(j).split("\\|")[2] %>,1);">&nbsp;</div></td>
            </tr>
<% } %>
        </table>
        <canvas id="canvas1"></canvas>
    </div>
</div>
<div class="row">
    <div class="col-md-6 col-md-offset-1">
        <h4>Current (Tolerance <%=tolerance2 %>%)</h4>
        <table class="table table-striped">
            <tr>
                <th colspan="3">Legend</th>
            </tr>
            <tr>
                <td>Average Line</td>
                <td>:</td>
                <td><div style="background-color:rgba(100,100,100,1);">&nbsp;</div></td>
            </tr>
            <tr>
                <td>Tolerance Line</td>
                <td>:</td>
                <td><div style="background-color:rgba(220,0,0,1);">&nbsp;</div></td>
            </tr>
<% for (int j = 0; j < dataXb.size(); j++) { %>
            <tr>
                <td><%=dataXb.get(j).split("\\|")[1] %>&nbsp;</td>
                <td>:</td>
                <td><div style="background-color:<%=dataXb.get(j).split("\\|")[2] %>,1);">&nbsp;</div></td>
            </tr>
<% } %>
        </table>
        <canvas id="canvas2"></canvas>
    </div>
</div>
<div class="row">
    <div class="col-md-6 col-md-offset-1">
        <h4>Power (Tolerance <%=tolerance3 %>%)</h4>
        <table class="table table-striped">
            <tr>
                <th colspan="3">Legend</th>
            </tr>
            <tr>
                <td>Average Line</td>
                <td>:</td>
                <td><div style="background-color:rgba(100,100,100,1);">&nbsp;</div></td>
            </tr>
            <tr>
                <td>Tolerance Line</td>
                <td>:</td>
                <td><div style="background-color:rgba(220,0,0,1);">&nbsp;</div></td>
            </tr>
<% for (int j = 0; j < dataXc.size(); j++) { %>
            <tr>
                <td><%=dataXc.get(j).split("\\|")[1] %>&nbsp;</td>
                <td>:</td>
                <td><div style="background-color:<%=dataXc.get(j).split("\\|")[2] %>,1);">&nbsp;</div></td>
            </tr>
<% } %>
        </table>
        <canvas id="canvas3"></canvas>
    </div>
</div>
<div class="row">
    <div class="col-md-6 col-md-offset-1">
        <h4>Jaw Displacement (Tolerance <%=tolerance4 %>%)</h4>
        <table class="table table-striped">
            <tr>
                <th colspan="3">Legend</th>
            </tr>
            <tr>
                <td>Average Line</td>
                <td>:</td>
                <td><div style="background-color:rgba(100,100,100,1);">&nbsp;</div></td>
            </tr>
            <tr>
                <td>Tolerance Line</td>
                <td>:</td>
                <td><div style="background-color:rgba(220,0,0,1);">&nbsp;</div></td>
            </tr>
<% for (int j = 0; j < dataXd.size(); j++) { %>
            <tr>
                <td><%=dataXd.get(j).split("\\|")[1] %>&nbsp;</td>
                <td>:</td>
                <td><div style="background-color:<%=dataXd.get(j).split("\\|")[2] %>,1);">&nbsp;</div></td>
            </tr>
<% } %>
        </table>
        <canvas id="canvas4"></canvas>
    </div>
</div>
<div class="row">
    <div class="col-md-6 col-md-offset-1">
        <h4>Pressure 1 (Tolerance <%=tolerance51 %>%) &amp; Pressure 2 (Tolerance <%=tolerance52 %>%)</h4>
        <table class="table table-striped">
            <tr>
                <th colspan="3">Legend</th>
            </tr>
            <tr>
                <td>Average Line of Pressure 1</td>
                <td>:</td>
                <td><div style="background-color:rgba(100,100,200,1);">&nbsp;</div></td>
            </tr>
            <tr>
                <td>Tolerance Line of Pressure 1</td>
                <td>:</td>
                <td><div style="background-color:rgba(200,200,0,1);">&nbsp;</div></td>
            </tr>
            <tr>
                <td>Average Line of Pressure 2</td>
                <td>:</td>
                <td><div style="background-color:rgba(100,100,100,1);">&nbsp;</div></td>
            </tr>
            <tr>
                <td>Tolerance Line of Pressure 2</td>
                <td>:</td>
                <td><div style="background-color:rgba(220,0,0,1);">&nbsp;</div></td>
            </tr>
<% for (int j = 0; j < dataXe1.size(); j++) { %>
            <tr>
                <td><%=dataXe1.get(j).split("\\|")[1] %>&nbsp;</td>
                <td>:</td>
                <td><div style="background-color:<%=dataXe1.get(j).split("\\|")[2] %>,1);">&nbsp;</div></td>
            </tr>
<% } %>
        </table>
        <canvas id="canvas5"></canvas>
    </div>
</div>

<script>
var lineChartData1 = {
labels : [<%=label %>],
datasets : [
{
    label: "Tolerance 1",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataAtol1 %>]
},{
    label: "Voltage",
    fillColor : "rgba(100,100,100,0.0)",
    strokeColor : "rgba(100,100,100,1)",
    pointColor : "rgba(100,100,100,1)",
    pointStrokeColor : "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(100,100,100,1)",
    data: [<%=dataA %>]
}<% for (int k = 0; k < dataXa.size(); k++) { %>
,{
    label: "<%=dataXa.get(k).split("\\|")[1] %>",
    fillColor : "<%=dataXa.get(k).split("\\|")[2] %>,0.0)",
    strokeColor : "<%=dataXa.get(k).split("\\|")[2] %>,1)",
    pointColor : "<%=dataXa.get(k).split("\\|")[2] %>,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "<%=dataXa.get(k).split("\\|")[2] %>,1)",
    data: [<%=dataXa.get(k).split("\\|")[0] %>]
}   
<% } %>,{
    label: "Tolerance 2",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataAtol2 %>]
}]};
var lineChartData2 = {
labels : [<%=label %>],
datasets : [
{
    label: "Tolerance 1",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataBtol1 %>]
},{
    label: "Current",
    fillColor : "rgba(100,100,100,0.0)",
    strokeColor : "rgba(100,100,100,1)",
    pointColor : "rgba(100,100,100,1)",
    pointStrokeColor : "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(100,100,100,1)",
    data: [<%=dataB %>]
}<% for (int k = 0; k < dataXb.size(); k++) { %>
,{
    label: "<%=dataXb.get(k).split("\\|")[1] %>",
    fillColor : "<%=dataXb.get(k).split("\\|")[2] %>,0.0)",
    strokeColor : "<%=dataXb.get(k).split("\\|")[2] %>,1)",
    pointColor : "<%=dataXb.get(k).split("\\|")[2] %>,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "<%=dataXb.get(k).split("\\|")[2] %>,1)",
    data: [<%=dataXb.get(k).split("\\|")[0] %>]
}   
<% } %>,{
    label: "Tolerance 2",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataBtol2 %>]
}]};
var lineChartData3 = {
labels : [<%=label %>],
datasets : [
{
    label: "Tolerance 1",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataCtol1 %>]
},{
    label: "Power",
    fillColor : "rgba(100,100,100,0.0)",
    strokeColor : "rgba(100,100,100,1)",
    pointColor : "rgba(100,100,100,1)",
    pointStrokeColor : "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(100,100,100,1)",
    data: [<%=dataC %>]
}<% for (int k = 0; k < dataXc.size(); k++) { %>
,{
    label: "<%=dataXc.get(k).split("\\|")[1] %>",
    fillColor : "<%=dataXc.get(k).split("\\|")[2] %>,0.0)",
    strokeColor : "<%=dataXc.get(k).split("\\|")[2] %>,1)",
    pointColor : "<%=dataXc.get(k).split("\\|")[2] %>,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "<%=dataXc.get(k).split("\\|")[2] %>,1)",
    data: [<%=dataXc.get(k).split("\\|")[0] %>]
}   
<% } %>,{
    label: "Tolerance 2",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataCtol2 %>]
}]};
var lineChartData4 = {
labels : [<%=label %>],
datasets : [
{
    label: "Tolerance 1",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataDtol1 %>]
},{
    label: "Jaw Displacement",
    fillColor : "rgba(100,100,100,0.0)",
    strokeColor : "rgba(100,100,100,1)",
    pointColor : "rgba(100,100,100,1)",
    pointStrokeColor : "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(100,100,100,1)",
    data: [<%=dataD %>]
}<% for (int k = 0; k < dataXd.size(); k++) { %>
,{
    label: "<%=dataXd.get(k).split("\\|")[1] %>",
    fillColor : "<%=dataXd.get(k).split("\\|")[2] %>,0.0)",
    strokeColor : "<%=dataXd.get(k).split("\\|")[2] %>,1)",
    pointColor : "<%=dataXd.get(k).split("\\|")[2] %>,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "<%=dataXd.get(k).split("\\|")[2] %>,1)",
    data: [<%=dataXd.get(k).split("\\|")[0] %>]
}   
<% } %>,{
    label: "Tolerance 2",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataDtol2 %>]
}]};
var lineChartData5 = {
labels : [<%=label %>],
datasets : [
{
    label: "Tolerance 1",
    fillColor : "rgba(200,200,0,0.0)",
    strokeColor : "rgba(200,200,0,1)",
    pointColor : "rgba(200,200,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(200,200,0,1)",
    data: [<%=dataE1tol1 %>]
},{
    label: "Pressure 1",
    fillColor : "rgba(100,100,200,0.0)",
    strokeColor : "rgba(100,100,200,1)",
    pointColor : "rgba(100,100,200,1)",
    pointStrokeColor : "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(100,100,200,1)",
    data: [<%=dataE1 %>]
}<% for (int k = 0; k < dataXe1.size(); k++) { %>
,{
    label: "<%=dataXe1.get(k).split("\\|")[1] %>",
    fillColor : "<%=dataXe1.get(k).split("\\|")[2] %>,0.0)",
    strokeColor : "<%=dataXe1.get(k).split("\\|")[2] %>,1)",
    pointColor : "<%=dataXe1.get(k).split("\\|")[2] %>,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "<%=dataXe1.get(k).split("\\|")[2] %>,1)",
    data: [<%=dataXe1.get(k).split("\\|")[0] %>]
}   
<% } %>,{
    label: "Tolerance 2",
    fillColor : "rgba(200,200,0,0.0)",
    strokeColor : "rgba(200,200,0,1)",
    pointColor : "rgba(200,200,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(200,200,0,1)",
    data: [<%=dataE1tol2 %>]
},{
    label: "Tolerance 1",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataE2tol1 %>]
},{
    label: "Pressure 2",
    fillColor : "rgba(100,100,100,0.0)",
    strokeColor : "rgba(100,100,100,1)",
    pointColor : "rgba(100,100,100,1)",
    pointStrokeColor : "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(100,100,100,1)",
    data: [<%=dataE2 %>]
}<% for (int k = 0; k < dataXe2.size(); k++) { %>
,{
    label: "<%=dataXe2.get(k).split("\\|")[1] %>",
    fillColor : "<%=dataXe2.get(k).split("\\|")[2] %>,0.0)",
    strokeColor : "<%=dataXe2.get(k).split("\\|")[2] %>,1)",
    pointColor : "<%=dataXe2.get(k).split("\\|")[2] %>,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "<%=dataXe2.get(k).split("\\|")[2] %>,1)",
    data: [<%=dataXe2.get(k).split("\\|")[0] %>]
}   
<% } %>,{
    label: "Tolerance 2",
    fillColor : "rgba(220,0,0,0.0)",
    strokeColor : "rgba(220,0,0,1)",
    pointColor : "rgba(220,0,0,1)",
    pointStrokeColor : "#faa",
    pointHighlightFill: "#faa",
    pointHighlightStroke: "rgba(220,0,0,1)",
    data: [<%=dataE2tol2 %>]
}]};

window.onload = function () {
    var ctx1 = document.getElementById("canvas1").getContext("2d");
    var ctx2 = document.getElementById("canvas2").getContext("2d");
    var ctx3 = document.getElementById("canvas3").getContext("2d");
    var ctx4 = document.getElementById("canvas4").getContext("2d");
    var ctx5 = document.getElementById("canvas5").getContext("2d");
    window.myLine = new Chart(ctx1).Line(lineChartData1, {
        responsive: true
    });
    window.myLine = new Chart(ctx2).Line(lineChartData2, {
        responsive: true
    });
    window.myLine = new Chart(ctx3).Line(lineChartData3, {
        responsive: true
    });
    window.myLine = new Chart(ctx4).Line(lineChartData4, {
        responsive: true
    });
    window.myLine = new Chart(ctx5).Line(lineChartData5, {
        responsive: true
    });
}
</script>