
<%@page import="beans.Expired_Lejer_Bean"%>
<%@page import="models.Expired_Lejer"%>
<%@page import="beans.Expired_Type_Bean"%>
<%@page import="controllers.Starter"%>
<%@page import="models.Component"%>
<%
Component component = new Component();
int num_w = component.getListComponents().length;
String w[][] = component.getListComponents();

int num_bulan = 5;
int col_bulan = 2;
String bulan[][] = new String[num_bulan][col_bulan];
for (int i = 0; i < num_bulan; i++) {
    bulan[i][1] = (i+1)+" month";
    if (i+1 > 1) {
        bulan[i][1] += "s";
    }
    int month = 60 * 60 * 24 * 30 * (i+1);
    bulan[i][0] = month+"";
}

Expired_Lejer el = new Expired_Lejer();
Expired_Lejer_Bean elb = el.getExpiredLejer(2); // 2 means warning type
int warning = 0;
int idexpired = elb.getEl_id();
try {
    warning = Integer.parseInt(elb.getEl_time());
} catch (Exception e) {
}

%>
<h3 class="panel-title warna-title">MANAGE EXPIRED MONTH</h3>
<hr />
<div class="row">
    <div class="col-md-2">
        <div class="panel-body">
            <a class="tridik btn btn-success" href="welding7/mainMenu.jsp?w=<%=num_w %>">Back</a>
        </div>
    </div>
</div>

<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span><br />
<span style="color:green;"><strong><em><%=Starter.getSuccess()%></em></strong></span>

<div class="panel-body">
    <form class="form-horizontal" action="ManageWelderExpired" role="form" name="f_edit" id="f_edit" method="post">
        
        <input type="hidden" value="<%=idexpired %>" name="el_id" id="el_id" />
        
        <div class="form-group">
            <label for="wn_status" class="col-lg-2 col-md-3 control-label">Warning Expired</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="el_time" id="el_time">
                    <option value="0">-- Please Select Expired Period --</option>
                    <% for(int i = 0; i < bulan.length; i++) { %>
                    <option value="<%=bulan[i][0] %>" <% if(bulan[i][0].equals(String.valueOf(warning))) { out.print("selected"); } %>><%=bulan[i][1] %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <a class="tridik btn btn-success" onclick="document.getElementById('f_edit').submit();"> Submit </a>

            </div>
        </div>
    </form>
</div>
