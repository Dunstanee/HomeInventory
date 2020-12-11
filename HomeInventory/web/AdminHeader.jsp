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
                   <li><a href="DashBoard.jsp">DashBoard</a></li>
                   <li><a href="Category.jsp">Category</a></li>
                   <li><a href="UserAccount.jsp">Manage Account</a></li>
                   <li><a href="ManageRoles.jsp">Manage Roles</a></li>
                    <li><a href="NewAccount.jsp">New Account</a></li>
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

