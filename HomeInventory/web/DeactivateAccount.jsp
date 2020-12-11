<%-- 
    Document   : DeactivateAccount
    Created on : Dec 11, 2020, 2:38:44 AM
    Author     : Dunstan
--%>
<%@page import="java.sql.*"%>
<%@page import="ServeSide.DatabaseConnection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DatabaseConnection DC = new DatabaseConnection();
    Statement st;
    Connection conn;

    String owner_email = session.getAttribute("Email").toString();
    try {
        // connects to the database

        conn = DC.getConnection();

        String sql = "UPDATE user SET active='2' WHERE email='" + owner_email + "'";
        st = conn.createStatement();
        st.executeUpdate(sql);
        st.close();
        session.invalidate();
        response.sendRedirect("redirect.jsp");
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());

    }
%>
