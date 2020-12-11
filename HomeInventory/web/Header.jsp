<%-- 
    Document   : Header
    Created on : Dec 10, 2020, 11:09:47 PM
    Author     : Dunstan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%     if (session.getAttribute("Active") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = "stylesheet" type = "text/css" href = "styles.css">
        <title>HOME INVENTORY</title>
    </head>
    <body>
         <section class="header" style="background-color: white;">
            <div class="menu">
                <h1 class="title" style="color: maroon;"> HOME INVENTORY</h1>
            </div>
           <div class="menulist" style="background-color: maroon;padding: 7px;">
               <ul class="lists">
                   <li><a href="Main.jsp">Home</a></li>
                   <li><a href="Inventory.jsp">My Inventory</a></li>
                   <li><a href="Account.jsp">Account</a></li>
                   <li><a href="Setting.jsp">Settings</a></li>
                   <li><a href="ManageInvetory.jsp">Manage Inventory</a></li>
                   <li><a href="Logout.jsp">Logout</a></li>
               </ul>
           </div>
        </section>
        <div class="UserDetails">
            <ul>
                <li> NAME : <%=session.getAttribute("FistName") %>  <%=session.getAttribute("LastName") %> </li>
                <li> <%=session.getAttribute("Email") %> </li>
            </ul>
        </div>

