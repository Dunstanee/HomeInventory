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


<div class="product-list">

    <table style="width: 100%;">
        <tr>
            <th>Sno</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Role</th>
            
            <th>Manage</th>
        </tr>

        <%
            String owner = session.getAttribute("Email").toString();
            String query = "SELECT active,first_name,last_name,email, role.role_name FROM user INNER JOIN role ON user.role = role.role_id WHERE active='1';";
            ResultSet rst = conn.createStatement().executeQuery(query);
            int i = 1;
            while (rst.next()) {


        %>
        <tr>
            <td style="padding: 0px;"><%=i%></td>
            <td style="padding: 0px;"> <%=rst.getString("first_name")%></td>
            <td style="padding: 0px;"><%=rst.getString("last_name")%></td>
            <td style="padding: 0px;"> <%=rst.getString("email")%></td>
            <td style="padding: 0px;"> <%=rst.getString("role.role_name")%></td>
            <td>
                <div style="display: inline; flex-direction: row;">
                    <a style="text-decoration: none;border-style: none; background-color: GREEN; color: white;padding: 4px 10px 4px 10px; " href="UpgradeAccount.jsp?accountemail=<%=rst.getString("email")%>">Upgrade</a>
             
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
