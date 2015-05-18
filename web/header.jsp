<%@page import="helpers.Func"%>
<%@page import="controllers.SessionWIS"%>
<%@page import="controllers.Starter"%>

<% /* if(Starter.getUrl_stat() == 1 || !SessionWIS.isLoggedIn()) { 
    Starter.setUrl_content("login/login.jsp");
    Starter.setUrl_menu("-");
} */ %>

<!DOCTYPE html>
<html lang="en">
<%
try {
    String url_stat = request.getParameter("url_stat");
    String w_check = request.getParameter("w_check");
    if(url_stat.equals("3")) {
        session.setAttribute("url_content", "welding7/mainMenu.jsp?w=" + w_check);
        session.setAttribute("url_menu", "menu/menuAdmin.jsp");
        session.setAttribute("url_stat", 2);
    }
} catch (Exception e) {
}

if(session.getAttribute("url_stat") == "1" || session.getAttribute("loggedIn") == "false") {
    session.setAttribute("url_content", "login/login.jsp");
    session.setAttribute("url_menu", "-");
}
%>


<head>
  <meta charset="utf-8">
<title>Asiaflex - Welding Information System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Loading Bootstrap -->
  <link href="assets/css/bootstrap.css" rel="stylesheet">

  <!-- Loading Stylesheets -->    
  <link href="assets/css/font-awesome.css" rel="stylesheet">
   <link href="assets/css/style.css" rel="stylesheet" type="text/css"> 
   <link href="assets/css/login.css" rel="stylesheet" type="text/css"> 
  <link href="assets/less/style.less" rel="stylesheet"  title="lessCss" id="lessCss">
  
  <!-- Loading Custom Stylesheets -->    
  <link href="assets/css/custom.css" rel="stylesheet">
  <link rel="shortcut icon" href="assets/images/technipback.png">
  <link rel="shortcut icon" href="assets/images/favicon.html">
  
<script src="assets/js/jquery-1.10.2.min.js"></script>

<script src="assets/js/Chart.js"></script>

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <![endif]-->
      <style>
          /*
    .tridi {
        
	position: relative;
    color: rgba(255,255,255,1);
    text-decoration: none;
    background-color: #21768F;
    font-family: 'Yanone Kaffeesatz';
    font-weight: bold;
    font-size: 1.5em;
    display: block;
    padding: 4px;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
    -webkit-box-shadow: 0px 9px 0px #21768F, 0px 9px 25px rgba(0,0,0,.7);
    -moz-box-shadow: 0px 9px 0px #21768F, 0px 9px 25px rgba(0,0,0,.7);
    box-shadow: 0px 9px 0px #21768F, 0px 9px 25px rgba(0,0,0,.7);
    margin: 100px auto;
	width: 100px;
	text-align: center;
          border-style: outset;
	
	-webkit-transition: all .1s ease;
	-moz-transition: all .1s ease;
	-ms-transition: all .1s ease;
	-o-transition: all .1s ease;
	transition: all .1s ease;
 
}

.tridi:active {
    -webkit-box-shadow: 0px 3px 0px #21768F, 0px 3px 6px rgba(0,0,0,.9);
    -moz-box-shadow: 0px 3px 0px #21768F, 0px 3px 6px rgba(0,0,0,.9);
    box-shadow: 0px 3px 0px #21768F, 0px 3px 6px rgba(0,0,0,.9);
    position: relative;
    top: 6px;
    border-style: inset;
}
*/

.tridi{
      height: 100%;
   

    display: block;

    text-decoration: none;

    border-width: 6px;
    
     font-weight: bold;
   

    color: black;

    background-color: #46b8da;

    border-style: outset;
}

.tridi:link{
    color: #000000;

    font-weight: bold;
    text-align:center;

    background-color: #2980B9;

    border-style: outset;
}

.tridi:visited{
     color: #000000;

    font-weight: normal;

    background-color: #CCCCCC;

    border-style: outset;
}

.tridi:hover{
     
}

.tridi:active{
      font-weight: bold;

    color: #FFFFFF;

    background-color: #0D4264;

    border-style: inset;
}

.tridik{
    height: 100%;
   
    width: 200px;
    display: block;

    text-decoration: none;

    border-width: 6px;
    
     font-weight: bold;
     
     border-style:outset;
   

    color: black;

    background-color: #68a0d8;

}

.tridik:link{
     color: #000000;

    font-weight: bold;
    text-align:center;

    /*background-color: #2980B9;*/

    border-style: outset;
}

/*.tridik:visited{
     color: #000000;

    font-weight: normal;

    background-color: #2980B9;

    border-style: outset;
}*/

.tridik:active{
    font-weight: bold;

    color: #FFFFFF;

    background-color: #0D4264;

    border-style: inset; 
}

/*
 .tridik {
	position: relative;
    color: rgba(255,255,255,1);
    text-decoration: none;
    background-color: #21768F;
    font-family: 'Yanone Kaffeesatz';
    font-weight: 700;
    font-size: 1em;
    display: block;
    padding: 4px;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
    -webkit-box-shadow: 0px 9px 0px #21768F, 0px 9px 25px rgba(0,0,0,.7);
    -moz-box-shadow: 0px 9px 0px #21768F, 0px 9px 25px rgba(0,0,0,.7);
    box-shadow: 0px 9px 0px #21768F, 0px 9px 25px rgba(0,0,0,.7);
    margin: 5px;
	width: 150px;
	text-align: center;
	
	-webkit-transition: all .1s ease;
	-moz-transition: all .1s ease;
	-ms-transition: all .1s ease;
	-o-transition: all .1s ease;
	transition: all .1s ease;
}

.tridik:active {
    -webkit-box-shadow: 0px 3px 0px #21768F, 0px 3px 6px rgba(0,0,0,.9);
    -moz-box-shadow: 0px 3px 0px #21768F, 0px 3px 6px rgba(0,0,0,.9);
    box-shadow: 0px 3px 0px #21768F, 0px 3px 6px rgba(0,0,0,.9);
    position: relative;
    top: 6px;
}
*/
.warna-title{
    background-color: #9DD5E6;
    height:70px;
    font-size:32px;
     padding-top:20px;
    /*padding-left:500px;*/
     text-align: center;
}
#example_wire_filter{
    margin-right:10%;
}
#example_wire_wrapper{
    margin-left:10px;
}

#example_wire th
{
    text-align:center; 
    vertical-align:middle;
}

#example th
{
    text-align:center; 
    vertical-align:middle;
}

#example_report_filter{
    margin-right:27%;
}
    </style>
    
  <script type="text/javascript">
      function ask(ayat_tanya) {
          return confirm(ayat_tanya);
      }
  </script>
  
                <script type="text/javascript">
                    $(document).ready(function() {
                        $("#we_id").change(function() {
                            var we_id = $(this).val();
                            $.post( "CheckWelder", { weid: we_id }).done(function( data ) {
//                                if (data != '-') {
//                                    alert( data );
//                                }
                                if (data == "2") {
                                    alert("Welder Not Found!");
                                    $(this)
                                } else if (data == "3" || data == "4") {
                                    alert("Welder has expired!");
                                    document.getElementById("we_id").selectedIndex = "0";
                                } else if (data == "5") {
                                    alert("Warning! Welder almost expired!");
                                } else if (data == "999") {
                                    alert("Corrupted Data!");
                                }
                            });
                        });
                        $(".ttt").click(function() {
                            var tt = $(this).attr("t");
                            $.post( "GetComments", { wcid: tt }).done(function( data ) {
                                if (data != '-') {
                                    var data_pecah = data.split("|");
                                    $("#t_id_komen").val(data_pecah[2]);
                                    $("#we_id_komen").val(data_pecah[4]);
                                    $("#wm_id_komen").val(data_pecah[10]);
                                    $("#wc_weldlength_komen").val(data_pecah[13]);
                                    $("#wc_weldingnumber_komen").val(data_pecah[12]);
                                    $("#ws_id_komen").val(data_pecah[14]);
                                    $("#fc_id_komen").val(data_pecah[16]);
                                    $("#wc_failuretensile_komen").val(data_pecah[18]);
                                    $("#wc_weldduration_komen").val(data_pecah[19]);
                                    $("#wc_coilnumber_komen").val(data_pecah[22]);
                                    $("#wc_bobbinnumber_komen").val(data_pecah[21]);
                                    $("#wc_spoolnumber_komen").val(data_pecah[20]);
                                    $("#wp_id_komen").val(data_pecah[23]);
                                    $("#wc_efposition_komen").val(data_pecah[25]);
                                    $("#data_komen").val(data_pecah[35]);
                                    $("#wc_idcomment").val(tt);
                                }
                            });
                        });
                    });
                </script>

<script type="text/javascript">
idleTime = 0;
$(document).ready(function () {
    //Increment the idle time counter every minute.
    var idleInterval = setInterval(timerIncrement, 60000); // 1 minute

    //Zero the idle timer on mouse movement.
    $(this).mousemove(function (e) {
        idleTime = 0;
    });
    $(this).keypress(function (e) {
        idleTime = 0;
    });
});

function timerIncrement() {
    idleTime = idleTime + 1;
    if (idleTime > 14) { // 15 minutes
        location.href='login/logoutprocess.jsp';
    }
}
</script> 
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').dataTable();
         $('#example_wire').dataTable();
         $("#example_wire").css("width","90%");
    } );
</script>
    </head>
    
<%
  //Func.setWarningMonth(5);
%>