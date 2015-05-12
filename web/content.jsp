 <body>
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
          <a class="navbar-brand" href="#"><i class="fa fa-list btn-nav-toggle-responsive text-white"></i> 
               <img src="assets/images/profiles/logotechnip.png" style="width:120px; height:90px; margin-top:-15px;" />
           Weld Database Software</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav user-menu navbar-right ">

            <li><a href="#" class="user dropdown-toggle" data-toggle="dropdown">
                    <span class="username">
                        <img src="assets/images/profiles/eleven.png" class="user-avatar" alt="">
                  <%=session.getAttribute("u_fullname") %></span></a>
            
            </ul>
            </div><!-- /.navbar-collapse -->
          </nav> <!-- /.navbar -->

          <!-- .box-holder -->
          <div class="box-holder">

            <!-- .left-sidebar -->
            <div class="left-sidebar">
              <div class="sidebar-holder">
                <ul class="nav  nav-list">

                  <!-- sidebar to mini Sidebar toggle -->
                  <li class="nav-toggle">
                    <button class="btn  btn-nav-toggle text-primary"><i class="fa fa-angle-double-left toggle-left"></i> </button>
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
            </div> <!-- /.left-sidebar -->

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
                <br/><br/>
               <a href="welding/mainMenu.jsp?w=1">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Strip Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
               
               <br/><br/><br/>
                <a href="welding/mainMenu.jsp?w=2" >
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details" >
                  <h4 class="tiles">
                    Wire Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
               
            </div>
           
           
           
             <div class="col-md-4">
              <img src="assets/images/mainpage_technip.png" />
            </div>
           
            <div class="col-md-3" style="margin-left:5%">
                 <br/><br/>
              <a href="welding/mainMenu.jsp?w=3">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-anchor fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Raboutage  
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
                 <br/><br/><br/>
                 <a href="welding/mainMenu.jsp?w=4">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-circle-o fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Carcass Stop Ring   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
           
           
            
        </div>
        
        <div class="row">
             <div class="col-md-4 col-md-offset-2" style="margin-left:25%">
              <a href="welding/mainMenu.jsp?w=5">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-book fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Report
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
        </div>
        
           <div class="row">
             <div class="col-md-3">
              <a href="welding/mainMenu.jsp?w=8">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-cogs fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Manage Log
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
               
               <div class="col-md-4">
              <a href="welding/mainMenu.jsp?w=7">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-cogs fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Manage Component
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
               
               <div class="col-md-3" style="margin-left:5%">
             <a href="welding/mainMenu.jsp?w=6">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-group fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
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
                
            </div>
        </div>
       <div class="row">
           
           <div class="col-md-3" >
                <br/><br/>
               <a href="welding/mainMenu.jsp?w=1">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Strip Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
               
               <br/><br/><br/>
                <a href="welding/mainMenu.jsp?w=2" >
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Wire Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
               
            </div>
           
           
           
             <div class="col-md-4">
              <img src="assets/images/mainpage_technip.png" />
            </div>
           
            <div class="col-md-3" style="margin-left:5%">
                 <br/><br/>
              <a href="welding/mainMenu.jsp?w=3">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-anchor fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Raboutage  
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
                 <br/><br/><br/>
                 <a href="welding/mainMenu.jsp?w=4">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-circle-o fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Carcass Stop Ring   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
           
           
            
        </div>
        
        <div class="row">
             <div class="col-md-4 col-md-offset-2" style="margin-left:25%">
              <a href="welding/mainMenu.jsp?w=5">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-book fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Report
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
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
                
            </div>
        </div>
       <div class="row">
           
           <div class="col-md-3" >
                <br/><br/>
               <a href="welding/mainMenu.jsp?w=1">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Strip Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
               
               <br/><br/><br/>
                <a href="welding/mainMenu.jsp?w=2" >
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-ellipsis-vertical fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Wire Welding   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
               
            </div>
           
           
           
             <div class="col-md-4">
              <img src="assets/images/mainpage_technip.png" />
            </div>
           
            <div class="col-md-3" style="margin-left:5%">
                 <br/><br/>
              <a href="welding/mainMenu.jsp?w=3">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-anchor fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Raboutage  
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
                 <br/><br/><br/>
                 <a href="welding/mainMenu.jsp?w=4">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-circle-o fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
                    Carcass Stop Ring   
                   
                  </h4>
                  
                </div>
              </div>
                  </a>
            </div>
           
           
            
        </div>
        
        <div class="row">
             <div class="col-md-4 col-md-offset-2" style="margin-left:25%">
              <a href="welding/mainMenu.jsp?w=5">
              <div class="info-box  bg-info  text-white">
                <div class="info-icon bg-info-dark">
                  <i class="fa fa-book fa-4x">
                  </i>
                </div>
                <div class="info-details">
                  <h4 class="tiles">
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
            Copyright ? 2013 by 
            <a href="http://tuffah.info/" target="_blank">
              Tuffah Informatics
            </a>
          </div>-->
          

  					</div> <!-- /.content -->

  					<!-- .right-sidebar -->
  					<div class="right-sidebar right-sidebar-hidden">
  						<div class="right-sidebar-holder">

  							<!-- @Demo part only The part from here can be removed till end of the @demo  -->
  							<a href="screens.html" class="btn btn-danger btn-block">Logout </a>


  							<h4 class="page-header text-primary text-center">
  								Theme Options
  								<a  href="#"  class="theme-panel-close text-primary pull-right"><strong><i class="fa fa-times"></i></strong></a>
  							</h4>

  							<ul class="list-group theme-options">
  								<li class="list-group-item" href="#">	
  									<div class="checkbox">
  										<label>
  											<input type="checkbox" id="fixedNavbar" value=""> Fixed Top Navbar
  										</label>
  									</div>
  									<div class="checkbox">
  										<label>
  											<input type="checkbox" id="fixedNavbarBottom" value=""> Fixed Bottom Navbar
  										</label>
  									</div>
  									<div class="checkbox">
  										<label>
  											<input type="checkbox" id="boxed" value=""> Boxed Version
  										</label>
  									</div>

  									<div class="form-group backgroundImage hidden" >
  										<label class="control-label">Paste Image Url and then hit enter</label>
  										<input type="text" class="form-control" id="backgroundImageUrl" />
  									</div>
				<!-- 
				<div class="checkbox">
					<label>
						<input type="checkbox" id="responsive" value=""> Disable Responsiveness
					</label>
				</div> 
			-->			
		</li>
		<li class="list-group-item" href="#">Predefined Themes
			<ul class="list-inline predefined-themes"> 
				<li><a class="badge" style="background-color:#54b5df" data-color-primary="#54b5df" data-color-secondary="#2f4051" data-color-link="#FFFFFF"> &nbsp; </a></li>
				<li><a class="badge" style="background-color:#d85f5c" data-color-primary="#d85f5c" data-color-secondary="#f0f0f0" data-color-link="#474747"> &nbsp; </a></li>
				<li><a class="badge" style="background-color:#3d4a5d" data-color-primary="#3d4a5d" data-color-secondary="#edf0f1" data-color-link="#777e88"> &nbsp; </a></li>
				<li><a class="badge" style="background-color:#A0B448" data-color-primary="#A0B448" data-color-secondary="#485257" data-color-link="#AFB5AA"> &nbsp; </a></li>
				<li><a class="badge" style="background-color:#2FA2D1" data-color-primary="#2FA2D1" data-color-secondary="#484D51" data-color-link="#A5B1B7"> &nbsp; </a></li>
				<li><a class="badge" style="background-color:#2f343b" data-color-primary="#2f343b" data-color-secondary="#525a65" data-color-link="#FFFFFF"> &nbsp; </a></li>
			</ul>
		</li>
		<li class="list-group-item" href="#">Change Primary Color
			<div class="input-group colorpicker-component bscp" data-color="#54728c" data-color-format="hex" id="colr">
				<span class="input-group-addon"><i style="background-color: #54728c"></i></span>
				<input type="text" value="#54728c" id="primaryColor" readonly class="form-control" />

			</div>
		</li>
		<li class="list-group-item" href="#">Change LeftSidebar Background
			<div class="input-group colorpicker-component bscp" data-color="#f9f9f9" data-color-format="hex" id="Scolr">
				<span class="input-group-addon"><i style="background-color: #f9f9f9"></i></span>
				<input type="text" value="#f9f9f9" id="secondaryColor" readonly class="form-control" />

			</div>
		</li>
		<li class="list-group-item" href="#">Change Leftsidebar Link Color
			<div class="input-group colorpicker-component bscp" data-color="#54728c" data-color-format="hex" id="Lcolr">
				<span class="input-group-addon"><i style="background-color: #54728c"></i></span>
				<input type="text" value="#54728c" id="linkColor" readonly class="form-control" />

			</div>
		</li>
		<li class="list-group-item" href="#">Change RightSidebar Background
			<div class="input-group colorpicker-component bscp" data-color="#f9f9f9" data-color-format="hex" id="Rcolr">
				<span class="input-group-addon"><i style="background-color: #f9f9f9"></i></span>
				<input type="text" value="#f9f9f9" id="rightsidebarColor" readonly class="form-control" />

			</div>
		</li>
	</li>
</ul>
<!-- /.@Demo part only The part to here can be removed   -->
<div id="bic_calendar_right" class="bg-white"></div>

<h4 class="page-header text-primary">Current Projects </h4>

<div class="list-group projects">
	<a class="list-group-item" href="#">	
		<p> Archon <span class="pull-right label bg-success">90%</span></p>
		<div class="progress progress-mini">
			<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
				<span class="sr-only">90% Complete</span>
			</div>
		</div>

	</a>
	<a class="list-group-item" href="#">	
		<p> Banshee <span class="pull-right label bg-warning">40%</span></p>
		<div class="progress progress-mini">
			<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
				<span class="sr-only">40% Complete</span>
			</div>
		</div>

	</a>
	<a class="list-group-item" href="#">	
		<p> Cascade <span class="pull-right label bg-primary">40%</span></p>
		<div class="progress progress-mini">
			<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
				<span class="sr-only">75% Complete</span>
			</div>
		</div>
	</a>
</div>


</div>


</div>	<!-- /.right-sidebar-holder -->
</div>  <!-- /.right-sidebar -->


</div> <!-- /.box-holder -->
</div><!-- /.site-holder -->
<% } %>