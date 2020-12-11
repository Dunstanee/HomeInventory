<%-- 
    Document   : Inventory
    Created on : Dec 10, 2020, 11:36:27 PM
    Author     : Dunstan
--%>
<%@page import="java.sql.*"%>
<%@page import="ServeSide.DatabaseConnection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@include file="Header.jsp" %>

<div class="product-list">
    <table style="width: 80%;">
        <tr>
            <th>Sno</th>
            <th>Category</th>
            <th>Item Name</th>
            <th>Price</th>
        </tr>

        <%                DatabaseConnection DC = new DatabaseConnection();
            Connection conn = DC.getConnection();
            String owner = session.getAttribute("Email").toString();
            String query = "SELECT price,item_name, category.category_name FROM item INNER JOIN category ON item.category = category.category_id WHERE owner='"+owner+"';";
            ResultSet rst = conn.createStatement().executeQuery(query);
            int i = 1;
            while (rst.next()) {


        %>
        <tr>
            <td><%=i%></td>
            <td> <%=rst.getString("category.category_name")%></td>
            <td><%=rst.getString("item_name")%></td>
            <td>$ <%=rst.getString("price")%>/=</td>
        </tr>
        <%
                i++;
            }
            rst.close();
        %>
    </table>
</div>

<%@include file="Footer.jsp" %>
