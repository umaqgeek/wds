<h3 class="panel-title warna-title">WELDING CURVE PLOT</h3>
<hr />

<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding11/mainMenu.jsp?w=-2">Back</a>
        </div>
    </div>
</div>

<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>Folders / Files</th>
             <th>Group Average</th>
             <th>Color Plot</th>
           </tr>
         </thead>
         <tbody>
             <% 
             int num_xls = 8;
             for (int i = 0; i < num_xls; i++) {
             %>
             <tr>
                 <td><%=(i+1) %>.</td>
                 <td>model<%=i+1 %>.xls</td>
                 <td><input type="checkbox" value="" /></td>
                 <td><input type="checkbox" value="" /></td>
             </tr>
             <%
             }
             %>
           </tbody>
       </table>
           
<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding11/mainMenu.jsp?f=1">Plot Graph</a>
        </div>
    </div>
</div>