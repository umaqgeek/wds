<%@page import="controllers.ReadFiles"%>
<%@page import="java.util.Properties"%>
<%@page import="helpers.ReadWriteExcel"%>
<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<ArrayList<String>> files = new ArrayList<ArrayList<String>>();
    
    try {
        files = (ArrayList<ArrayList<String>>) session.getAttribute("fileExcel");
    } catch (Exception e) {
    }
    
    double tolerance1 = 0.0;
    double tolerance2 = 0.0;
    double tolerance3 = 0.0;
    double tolerance4 = 0.0;
    double tolerance51 = 0.0;
    double tolerance52 = 0.0;
    try {
        tolerance1 = Double.parseDouble(request.getParameter("tol")); //Integer.parseInt(files.get(2).get(0));
        tolerance2 = Double.parseDouble(request.getParameter("tol"));
        tolerance3 = Double.parseDouble(files.get(2).get(2));
        tolerance4 = Double.parseDouble(files.get(2).get(3));
        tolerance51 = Double.parseDouble(files.get(2).get(4));
        tolerance52 = Double.parseDouble(files.get(2).get(5));
    } catch (Exception e) {
        tolerance1 = 0.0;
        tolerance2 = 0.0;
        tolerance3 = 0.0;
        tolerance4 = 0.0;
        tolerance51 = 0.0;
        tolerance52 = 0.0;
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
    
    int limit = Func.LIMIT_ROW_SIZE;
    double avgA[] = new double[limit];
    double avgB[] = new double[limit];
    double avgC[] = new double[limit];
    double avgD[] = new double[limit];
    double avgE1[] = new double[limit];
    double avgE2[] = new double[limit];
    int avgT[] = new int[limit];
    
    for (int j = 0; j < limit; j++) {
        avgA[j] = 0;
        avgB[j] = 0;
        avgC[j] = 0;
        avgD[j] = 0;
        avgE1[j] = 0;
        avgE2[j] = 0;
        avgT[j] = 0;
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
                session.setAttribute("pageChoosen", ReadFiles.START_PATH + ReadFiles.START_PATH_SEPARATOR);
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
            String t[] = prop.getProperty("t").split("\\|");
            
            limit = (c.length > limit) ? (c.length) : (limit);

            for (int i = 0; i < c.length-1; i++) {
                
                avgA[i] += Double.parseDouble(a[i]);
                avgB[i] += Double.parseDouble(b[i]);
                avgC[i] += Double.parseDouble(c[i]);
                avgD[i] += Double.parseDouble(d[i]);
                avgE1[i] += Double.parseDouble(e1[i]);
                avgE2[i] += Double.parseDouble(e2[i]);
                avgT[i] += (i*5);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("fileExcel", "");
                session.setAttribute("pageChoosen", ReadFiles.START_PATH + ReadFiles.START_PATH_SEPARATOR);
                session.setAttribute("url_content", "welding11/mainMenu.jsp");
                session.setAttribute("url_menu", "menu/menuAdmin.jsp");
                session.setAttribute("url_stat", 2);
                response.sendRedirect("../index.jsp");
        }

    }
    
        for (int i = 0; i < limit-1; i++) {
            label += (i*5) + ",";
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
        label += ((limit-1)*5);
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
                <td><% 
    String strplit[] = dataXb.get(j).split("\\|")[1].split(ReadFiles.START_PATH_SEPARATOR);
    out.print(strplit[strplit.length-1]);
                %>&nbsp;</td>
                <td>:</td>
                <td><div style="background-color:<%=dataXb.get(j).split("\\|")[2] %>,1);">&nbsp;</div></td>
            </tr>
<% } %>
        </table>
        <table>
            <tr>
                <td><strong>Current (A)</strong></td>
                <td width="100%" height="100%"><canvas id="canvas2"></canvas></td>
            </tr>
            <tr>
                <td></td>
                <td align="center"><strong>Time (ms)</strong></td>
            </tr>
        </table>


<script>
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

//window.onload = function () {
    var ctx2 = document.getElementById("canvas2").getContext("2d");
    var options = {
        responsive: true,
        showXLabels: <%=(limit*1.0/10) %>,
        pointDot: false
    };
    window.myLine = new Chart(ctx2).Line(lineChartData2, options);
//}
</script>