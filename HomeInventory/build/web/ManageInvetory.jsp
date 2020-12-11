<%-- 
    Document   : ManageInvetory
    Created on : Dec 11, 2020, 12:05:04 AM
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
<div class="product-list">
    <form action="AddItem" method="post" autocomplete="off">
        <table style="width: 90%;">
            <input type="hidden" name="email" value="<%=session.getAttribute("Email")%>">
            <tr>
                <td>Category</td>
                <td>
                    
                    <select style="padding: 5px 11px 5px 11px;width: 90%;" name="category">
                        <%
                     String getCategory = "SELECT * FROM category;";
                        ResultSet catg = conn.createStatement().executeQuery(getCategory);
                        while(catg.next()){
                    %>
                        <option Value="<%=catg.getString("category_id")%>"><%=catg.getString("category_name")%></option>
                        <%
                        }
                        %>
                    </select>
                </td>
                <td>ITEM NAME</td>
                <td><input style="padding: 10px;width: 90%;" type="text" name="itemname" required></td>
                <td>PRICE</td>
                <td><input style="padding: 10px; width: 90%;" type="number" step="0.001" name="price" required></td>
                <td><input class="sub_button" type = "submit" name = "submit" value="Upload"  /></td>
            </tr>
        </table>
    </form>
</div>


<div class="product-list">

    <table style="width: 80%;">
        <tr>
            <th>Sno</th>
            <th>Category</th>
            <th>Item Name</th>
            <th>Price</th>
            <th>Manage</th>
        </tr>

        <%
            String owner = session.getAttribute("Email").toString();
            String query = "SELECT item_id,price,item_name, category.category_name FROM item INNER JOIN category ON item.category = category.category_id WHERE owner='"+owner+"';";
            ResultSet rst = conn.createStatement().executeQuery(query);
            int i = 1;
            while (rst.next()) {


        %>
        <tr>
            <td><%=i%></td>
            <td> <%=rst.getString("category.category_name")%></td>
            <td><%=rst.getString("item_name")%></td>
            <td>$ <%=rst.getString("price")%>/=</td>
            <td>
                <div style="display: inline; flex-direction: row;">
                    <a href="Delete.jsp?iddel=<%=rst.getString("item_id")%>"><button style="border-style: none; background-color: brown; margin: 2px; color: white;padding: 5px 10px 5px 10px;" type="button" >Delete</button></a>
                    <a style="text-decoration: none;border-style: none; background-color: orange; color: white;padding: 4px 10px 4px 10px; margin: 2px;" href="update.jsp?id=<%=rst.getString("item_id")%>">update</a>
                </div>
            </td>
        </tr>
        <%
                i++;
            }
            rst.close();
        %>
    </table>
</div>

<%@include file="Footer.jsp" %>

