<%-- 
    Document   : Category
    Created on : Dec 11, 2020, 3:07:30 AM
    Author     : Dunstan
--%>
<%@page import="java.sql.*"%>
<%@page import="ServeSide.DatabaseConnection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@include file="AdminHeader.jsp" %>
<%    DatabaseConnection DC = new DatabaseConnection();
    Connection conn = DC.getConnection();

    %>
    
    <div class="addcategory">
        <form action="NewCategory" method="post">
            <table style="width: 35%;margin: auto;">
                <tr>
                    <td>Category Name</td>
                    <td><input style="padding: 7px;" type="text" name="category" required></td>
                    <td><input class="sub_button" type = "submit" name = "submit" value="Submit"  ></td>
                </tr>
            </table>
        </form>
        
    </div>
<div class="product-list">

    <table style="width: 80%;">
        <tr>
            <th>Sno</th>
            <th>Category</th>
            <th>Manage</th>
        </tr>

        <%
            
            String query = "SELECT* FROM category ;";
            ResultSet rst = conn.createStatement().executeQuery(query);
            int i = 1;
            while (rst.next()) {


        %>
        <tr>
            <td><%=i%></td>
            <td> <%=rst.getString("category_name")%></td>
            <td>
                <div style="display: inline; flex-direction: row;">
                   
                    <a style="text-decoration: none;border-style: none; background-color: orange; color: white;padding: 4px 10px 4px 10px; margin: 4px;" href="CategoryUpdate.jsp?categoryid=<%=rst.getString("category_id")%>">update</a>
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

<%@include file="AdminFooter.jsp" %>
