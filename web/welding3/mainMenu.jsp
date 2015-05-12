<%@page import="models.Component"%>
<%@page import="controllers.SessionWIS"%>
<%@page import="models.Welding"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controllers.Starter"%>
<%
Welding weldin = new Welding();
Component component = new Component();
ArrayList<ArrayList<String>> welding = weldin.getAll(3);
ArrayList<ArrayList<String>> fp = component.getUniqueFP(3);
ArrayList<ArrayList<String>> m = component.getUniqueM(3);
ArrayList<String> sfnumber = weldin.getUnique("w_sfnumber", 3);
%>

<h3 class="panel-title warna-title">RABOUTAGE</h3>
<hr />

<div class="row">
    <div class="col-md-6">
        <div class="panel-body">
            <h3 class="panel-title">1) START NEW PRODUCTION</h3>
            <a class="tridik btn btn-success" href="welding3/mainMenu2.jsp?process=add">START</a>
        </div>
    </div>
</div>
<hr />

<div class="row">
    <div class="col-md-5" style="margin-left:15px">
        <h3 class="panel-title">2) CONTINUE PRODUCTION</h3>
    </div>
</div>

<span style="color:red;"><strong><em><%=Starter.getError() %></em></strong></span>

<div class="panel-body">
    <form class="form-horizontal" action="welding3/searchprocess.jsp" role="form" name="f_search" id="f_search" method="post">
        
        <div class="form-group">
            <label for="w_sfnumber" class="col-lg-2 col-md-3 control-label">SF Number</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="w_sfnumber" id="w_sfnumber">
                    <option value="0">-- Please Select SF Number --</option>
                    <% for(int i = 0; i < sfnumber.size(); i++) { %>
                    <option value="<%=sfnumber.get(i) %>"><%=sfnumber.get(i) %></option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <div class="form-group">
            <label for="fp_id" class="col-lg-2 col-md-3 control-label">Fabrication Phase</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="fp_id" id="fp_id">
                    <option value="0">-- Please Select Fabrication Phase --</option>
                    <% for(int i = 0; i < fp.size(); i++) { %>
                    <option value="<%=fp.get(i).get(0) %>"><%=fp.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>
                
        <div class="form-group">
            <label for="m_id" class="col-lg-2 col-md-3 control-label">Machine</label>
            <div class="col-lg-10 col-md-9">
                <select class="form-control" name="m_id" id="m_id">
                    <option value="0">-- Please Select Machine --</option>
                    <% for(int i = 0; i < m.size(); i++) { %>
                    <option value="<%=m.get(i).get(0) %>"><%=m.get(i).get(1) %></option>
                    <% } %>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <a class="tridik btn btn-success" onclick="document.getElementById('f_search').submit();">CONTINUE</a>
            </div>
        </div>
    </form>
</div>

<hr />

<table class="table table-bordered table-hover table-striped display" id="example" >
           <thead>
            <tr>
             <th>No.</th>
             <th>SF Number</th>
             <th>Fabrication Phase</th>
             <th>Machine</th>
             <th>Action</th>
           </tr>
         </thead>
         <tbody>
          <% if(welding.size() > 0) { for(int i = 0; i < welding.size(); i++) { %>
          <tr class="odd gradeA">
           <td><%=i+1 %>.</td>
           <td><%=welding.get(i).get(1) %></td>
            <td><%=welding.get(i).get(4) %></td>
            <td class="center"><%=welding.get(i).get(8) %></td>
            <td class="center">
                <a href="welding3/searchprocess2.jsp?id=<%=welding.get(i).get(0) %>">
                    <span class="badge" title="Add New Welder Job">=</span>
                </a>
                <% if(Integer.parseInt(session.getAttribute("ut_id").toString()) == 1 || (Integer.parseInt(welding.get(i).get(18)) == Integer.parseInt(session.getAttribute("u_id").toString()))) { %>
                <a onclick="return ask('Are you really want to delete this record?');" href="welding3/mainMenu2.jsp?process=delete&id=<%=welding.get(i).get(0) %>">
                    <span class="badge" title="Delete Record">X</span>
                </a>
                <% } %>
            </td>
          </tr>
          <% } } else { %>
          
          <% } %>
           </tbody>
       </table>