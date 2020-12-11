<%-- 
    Document   : update
    Created on : Dec 11, 2020, 12:08:24 AM
    Author     : Dunstan
--%>

<%@page import="java.sql.*"%>
<%@page import="ServeSide.DatabaseConnection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@include file="Header.jsp" %>
<%    DatabaseConnection DC = new DatabaseConnection();
    Connection conn = DC.getConnection();
%>
<div>
    <form action="UpdateItem" method="post">
    <table style="width: 50%; padding: 10px; margin: auto;">
        <tr>
            <td colspan="2" style="padding: 20px;text-align: center; font-size: 20px;">ITEM EDIT FORM</td>
        </tr>
        <%
            String id = request.getParameter("id");
            String getItem = "SELECT item.category, category.category_name,item_name,price FROM item INNER JOIN category ON item.category = category.category_id WHERE item_id='" + id + "';";
            ResultSet Items = conn.createStatement().executeQuery(getItem);
            while (Items.next()) {
        %>
        <tr>
            <td>Category</td>
            <td>
                <select style="padding: 10px;width: 100%;" name="category" >
                    <option value="<%=Items.getString("item.category")%>" selected> <%=Items.getString("category.category_name")%></option>
                    <%                            String getCategory = "SELECT * FROM category;";
                        ResultSet catg = conn.createStatement().executeQuery(getCategory);
                        String checking = "";
                        while (catg.next()) {
                            if (Items.getString("item.category").toString() == catg.getString("category_id").toString()) {
                                checking = "selected";
                            }
                    %>
                    <option <%=checking%> Value="<%=catg.getString("category_id")%>"><%=catg.getString("category_name")%></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>ITEM NAME</td>
            <td><input style="width: 100%; padding: 10px;" type="text" value="<%=Items.getString("item_name")%>" name="itemname"></td>
        </tr>
        <tr>
            <td>PRICE</td>
            <td><input style="width: 100%; padding: 10px;" type="number" step="0.001" name="price" value="<%=Items.getString("price")%>"></td>
        </tr>
        <%
            }
        %>
        <tr>
            <input  type="hidden"  name="item_id" value="<%=id%>">
            <td></td>
            <td><input class="sub_button" type = "submit" name = "submit" value="Update"  /></td>
        </tr>
    </table>
        </form>
</div>

<%@include file="Footer.jsp" %>
