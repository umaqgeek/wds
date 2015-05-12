<%-- 
    Document   : test2
    Created on : Nov 14, 2014, 3:34:44 PM
    Author     : End User
--%>

<%@page import="helpers.Func"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Func.testLoad(10000);
        %>
    </body>
</html>
