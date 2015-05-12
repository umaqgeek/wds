<link href="DevExpressChartJS-13.1.8/Demos/styles.css" rel="stylesheet" />
<script src="DevExpressChartJS-13.1.8/Demos/js/jquery-1.9.1.min.js"></script>
<script src="DevExpressChartJS-13.1.8/Demos/js/knockout-2.2.1.js"></script>
<script src="DevExpressChartJS-13.1.8/Demos/js/globalize.min.js"></script>
<script src="DevExpressChartJS-13.1.8/Demos/js/dx.chartjs.js"></script>
                       
<%
String total = "0";
String pass = "0";
String fail = "0";
String others = "0";
try {
    total = request.getParameter("total");
    pass = request.getParameter("pass");
    fail = request.getParameter("fail");
    others = request.getParameter("others");
} catch (Exception e) {
}
%>

                       <script type="text/javascript">
                           $(function ()  
                           {
                               var dataSource = [
                                   { country: "Passed", area: <%=pass %> },
                                   { country: "Failed", area: <%=fail %> },
                                   { country: "Others", area: <%=others %> }
                               ];
                               
                               $("#graf1").dxPieChart({
                                   size:{ 
                                       width: 500
                                   },
                                   dataSource: dataSource,
                                   series: [
                                       {
                                           argumentField: "country",
                                           valueField: "area",
                                           label:{
                                               visible: true,
                                               connector:{
                                                   visible:true,           
                                                   width: 1
                                               }
                                           }
                                       }
                                   ],
                                   title: "Statistic"
                               });
                           }
                           
                       );
                       </script>

                       

                       <div class="content_graph">
                           <div class="pane">
                               <div class="long-title"><h3></h3></div>
                               <div id="graf1" style="width: 100%; height: 100%;"></div>
                           </div>
                       </div>
                       
                       