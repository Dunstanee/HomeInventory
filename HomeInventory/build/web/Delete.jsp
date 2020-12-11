<%-- 
    Document   : Delete
    Created on : Dec 11, 2020, 12:07:32 AM
    Author     : Dunstan
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="ServeSide.DatabaseConnection"%>
<%
    if (request.getParameter("iddel") != null) {
        String id = request.getParameter("iddel");

        try {
            DatabaseConnection DC = new DatabaseConnection();
            Connection conn = DC.getConnection();
            Statement st = conn.createStatement();
            int i = st.executeUpdate("DELETE FROM item WHERE item_id=" + id);
            response.sendRedirect("ManageInvetory.jsp");
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
    }


%>
