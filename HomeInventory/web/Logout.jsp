<%-- 
    Document   : Logout
    Created on : Sep 6, 2020, 8:53:33 PM
    Author     : MR DUNSTAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EasyShop</title>
    </head>
    <body>
              <%
           // this is used to destroy the session
      session.invalidate();
      //this is used to redirect the page to home page
      response.sendRedirect("redirect.jsp");
       %>
    </body>
</html>
