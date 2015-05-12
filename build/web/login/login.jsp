<%@page import="helpers.Func"%>
<%@page import="controllers.Starter"%>
<div class="row animated fadeILeftBig">
     <div class="login-holder col-md-6 col-md-offset-3">
       <h2 class="page-header text-center text-primary"> Welcome to <br/> Weld Database Software </h2>
       <form name="form_login" method="post" action="login/loginprocess.jsp">
        <div class="form-group">
            <input type="text" class="form-control" id="u_username" placeholder="Enter username" name="u_username">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="u_password" placeholder="Password" name="u_password">
        </div>
        <div class="form-footer">
         <div class="row">
 	<div class="col-md-5">
          <label>
              <span style="color:red;"><% 
String error1 = "";
try {
    error1 = session.getAttribute("error").toString();
} catch(Exception e) {
}
out.print(error1);
session.removeAttribute("error");
%></span>
          </label>
</div>	
</div>
	<br/>
	 <div class="row">
		<div class="col-md-3 col-md-offset-6">
		  <button type="submit" class="tridi btn btn-success pull-right btn-submit">Login</button>
		</div>	
		
	</div><!-- row baru -->
        
	</div>

      </form>
    </div>
  </div>