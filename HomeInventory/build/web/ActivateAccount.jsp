<%-- 
    Document   : ActivateAccount
    Created on : Dec 11, 2020, 10:05:46 AM
    Author     : Dunstan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="ServeSide.DatabaseConnection"%>
<%
     Statement st ;
    if (request.getParameter("acc_email") != null) {
        String email = request.getParameter("acc_email");

        try {
            DatabaseConnection DC = new DatabaseConnection();
            Connection conn = DC.getConnection();
            st = conn.createStatement();
             st.executeUpdate("UPDATE user SET active='1' WHERE email='" + email+"'");
             st.close();

             
             
             
            response.sendRedirect("UserAccount.jsp");
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
    }


%>
