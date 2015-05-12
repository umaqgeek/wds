<%@page import="controllers.SessionWIS"%>
<%@page import="controllers.Starter"%>
<% 
String url_content = "login/login.jsp";
try {
    url_content = session.getAttribute("url_content").toString();
} catch(Exception e) {
    url_content = "login/login.jsp";
}
if(url_content.contains("login")) {
    %>
<jsp:include page="<%=url_content %>"></jsp:include>
<% } else { %>

<div class="site-holder">
      <!-- this is a dummy text -->
      <!-- .navbar -->
      <nav class="navbar" role="navigation">
        
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <a class="navbar-brand" href="#">
            <i class="fa fa-list btn-nav-toggle-responsive text-white">
            </i>
              <img src="assets/images/profiles/logotechnip.png" style="width:120px; height:100px; margin-top:-15px;" />
           Weld Database Software
          </a>
        </div>
        
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav user-menu navbar-right ">
            
            <li>
              <a href="#" class="user dropdown-toggle" data-toggle="dropdown">
                <span class="username">
                  <img src="assets/images/profiles/eleven.png" class="user-avatar" alt="">
                  <%=session.getAttribute("u_fullname") %>
                </span>
              </a>
              
            </li>
                
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </nav>
      
      <!-- /.navbar -->
      
      <!-- .box-holder -->
      <div class="box-holder">
        
        <!-- .left-sidebar -->
        <div class="left-sidebar">
          <div class="sidebar-holder">
            <ul class="nav  nav-list">
              
              <!-- sidebar to mini Sidebar toggle -->
              <li class="nav-toggle">
                <button class="btn  btn-nav-toggle text-primary">
                  <i class="fa fa-angle-double-left toggle-left">
                  </i>
                  
                </button>
              </li>
              
              
              <%@include file="menu.jsp" %>
              
              
              <li class='' >
                <a href='login/logoutprocess.jsp' data-original-title='Icons'>
                  <i class='fa fa-files-o'>
                  </i>
                  <span class='hidden-minibar'>
                    Logout
                  </span>
                </a>
              </li>
              
            </ul>
              
              
              
          </div>
        </div>
        
        <!-- /.left-sidebar -->
        
        <!-- .content -->
        <div class="content">
          <%
                  if(url_content.equals("admin/mainMenu.jsp"))
                  {
int ut_id = 0;
try {
    ut_id = Integer.parseInt(session.getAttribute("ut_id").toString());
    if(ut_id == 1) {
        %>
        <div class="row">
            <div class="col-mod-12">
                
            </div>
        </div>
       <div class="row">
            <div class="col-md-3" >
               <a href="welding/mainMenu.jsp?w=2">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Wire Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=3">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-anchor fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Raboutage  
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=1">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-horizontal fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Strip Welding   
                   
                  </h4>
                  
                </div>
              </div>
                 </a>
            </div>
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=4">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-circle-o fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Carcass Stop Ring   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
          </div>
        <div class="row">
         <div class="col-md-3 col-md-offset-4">
              <img style="width:300px; height:300px" src="assets/images/mainpage_technip.png" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=5">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-book fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Report
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
            
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=8">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-cogs fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Manage Log
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
            
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=7">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-cogs fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Manage Component
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
            
            <div class="col-md-3">
             <a href="welding/mainMenu.jsp?w=6">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-group fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Manage User 
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
            
        </div>
<%
    } else if(ut_id == 2) {
       %>
       <div class="row">
            <div class="col-mod-12">
                 <h3 class="page-header">
                <i class="fa fa fa-dashboard">
                </i>
                Dashboard 
                
              </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3" >
               <a href="welding/mainMenu.jsp?w=2">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Wire Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=3">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-anchor fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Raboutage  
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=1">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-horizontal fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Strip Welding   
                   
                  </h4>
                  
                </div>
              </div>
                 </a>
            </div>
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=4">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-circle-o fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Carcass Stop Ring   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
          </div>
        <div class="row">
         <div class="col-md-3 col-md-offset-4">
              <img style="width:300px; height:300px" src="assets/images/mainpage_technip.png" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-3" >
               <a href="welding/mainMenu.jsp?w=5">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-book fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Report
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
           
            
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=4">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-circle-o fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Carcass Stop Ring   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
          </div>
        <% 
    }
       } catch (Exception e) {
       }
                      %>       
                      <!-- Info Boxes -->
         
                      
             
            </div>
          
          
           
                      <%
                  }
                                   else if(url_content.equals("qcinspector/mainMenu.jsp")) { %>
                                   <div class="row">
            <div class="col-mod-12">
                 <h3 class="page-header">
                <i class="fa fa fa-dashboard">
                </i>
                Dashboard 
                
              </h3>
            </div>
        </div>
                                               <div class="row">
           
           
            
            <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=2">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Wire Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
                        <div class="col-md-3" >
              <img style="width:300px; height:300px" src="assets/images/mainpage_technip.png" />
            </div>                            
               <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=3">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-anchor fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Raboutage  
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
                                                   
          </div>
                                   
                                   <div class="row">
                    <div class="col-md-3">
             <a href="welding/mainMenu.jsp?w=1">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-horizontal fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Strip Welding   
                   
                  </h4>
                  
                </div>
              </div>
                 </a>
            </div>
                   
                   <div class="col-md-3">
             <a href="welding/mainMenu.jsp?w=4">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-circle-o fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Carcass Stop Ring   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
                   
                    <div class="col-md-3">
            <a href="welding/mainMenu.jsp?w=5">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-book fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4>
                    Report
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
                      
               </div>
<% } else
                  {
                      %>
                        <jsp:include page="<%=url_content %>"></jsp:include>
                      <%
                  }
          
          
          %>
            &nbsp;
            
<!--          <div class="footer">
            Copyright © 2013 by 
            <a href="http://tuffah.info/" target="_blank">
              Tuffah Informatics
            </a>
          </div>-->
          
        </div>
        
        <!-- /.content -->
      
      <!-- /.right-sidebar-holder -->
      </div>
      
      <!-- /.right-sidebar -->
      
      
 
  
  <!-- /.box-holder -->

<!-- /.site-holder -->



<!-- Load JS here for Faster site load =============================-->

<script src="assets/js/jquery-ui-1.10.3.custom.min.js">
</script>
<script src="assets/js/less-1.5.0.min.js">
</script>
<script src="assets/js/jquery.ui.touch-punch.min.js">
</script>
<script src="assets/js/bootstrap.min.js">
</script>
<script src="assets/js/bootstrap-select.js">
</script>
<script src="assets/js/bootstrap-switch.js">
</script>
<script src="assets/js/jquery.tagsinput.js">
</script>
<script src="assets/js/jquery.placeholder.js">
</script>
<script src="assets/js/bootstrap-typeahead.js">
</script>
<script src="assets/js/application.js">
</script>
<script src="assets/js/moment.min.js">
</script>
<script src="assets/js/jquery.dataTables.min.js">
</script>
<script src="assets/js/jquery.sortable.js">
</script>
<script type="text/javascript" src="assets/js/jquery.gritter.js">
</script>
<script src="assets/js/jquery.nicescroll.min.js">
</script>
<script src="assets/js/prettify.min.js">
</script>
<script src="assets/js/jquery.noty.js">
</script>
<script src="assets/js/bic_calendar.js">
</script>
<script src="assets/js/jquery.accordion.js">
</script>
<script src="assets/js/skylo.js">
</script>
<!--
<script src="assets/js/failsafe.js">
</script>
-->

<script src="assets/js/theme-options.js">
</script>


<script src="assets/js/bootstrap-progressbar.js">
</script>
<script src="assets/js/bootstrap-progressbar-custom.js">
</script>
<script src="assets/js/bootstrap-colorpicker.min.js">
</script>
<script src="assets/js/bootstrap-colorpicker-custom.js">
</script>



<script src="assets/js/raphael-min.js">
</script>

<script src="assets/js/charts/jquery.sparkline.min.js">
</script>


<!-- Core Jquery File  =============================-->
<script src="assets/js/core.js">
</script>
<script src="assets/js/dashboard-custom.js">
</script>

<% } %>