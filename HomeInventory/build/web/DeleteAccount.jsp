<%-- 
    Document   : DeleteAccount
    Created on : Dec 11, 2020, 9:54:55 AM
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
             st.executeUpdate("DELETE FROM item WHERE owner='" + email+"'");
             st.close();
            st = conn.createStatement();
             st.executeUpdate("DELETE FROM user WHERE email='" + email+"'");
             st.close();
             
             
             
            response.sendRedirect("UserAccount.jsp");
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
    }


%>