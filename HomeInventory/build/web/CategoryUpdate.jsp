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
    String id = request.getParameter("categoryid");
String Categoryname="";
String ID="";
    String getItem = "SELECT * FROM  category  WHERE category_id='" + id + "';";
    ResultSet rs = conn.createStatement().executeQuery(getItem);
    while (rs.next()) {
        ID = rs.getString("category_id");
        Categoryname = rs.getString("category_name");
    }
%>

<div class="addcategory">
    <form action="UpdateCategory" method="post">
        <table style="width: 35%;margin: auto;">
            <tr>
                <td>Category Name</td>
                <input value="<%=ID%>" type="hidden" name="categoryID" >
                <td><input style="padding: 7px;" value="<%=Categoryname%>" type="text" name="category" required></td>
                <td><input class="sub_button" type = "submit" name = "submit" value="Update"  ></td>
            </tr>
        </table>
    </form>

</div>
<%@include file="AdminFooter.jsp" %>
