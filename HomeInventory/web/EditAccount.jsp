<%-- 
    Document   : EditAccount
    Created on : Dec 11, 2020, 8:51:16 AM
    Author     : Dunstan
--%>
<%@page import="java.sql.*"%>
<%@page import="ServeSide.DatabaseConnection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%    DatabaseConnection DC = new DatabaseConnection();
    Connection conn = DC.getConnection();
%>
<%@include file="AdminHeader.jsp" %>

<section class="border_login">
    <div class="loginbody" style="border-color: maroon;    border-width: 2px;    border-radius: 20px;">
        <form action="EditAccount" method="post" >
            <table>
                <tr>
                    <td colspan="2" style="text-align: center; font-size: 24px;">UPDATE ACCOUNT</td> 

                </tr>
                <%                  
                    String AccEmail = request.getParameter("accountemail").trim();
                    String getItem = "SELECT  role.role_name,user.role,first_name,last_name,email FROM user INNER JOIN role ON user.role = role.role_id WHERE email='" + AccEmail.trim() + "';";
                    ResultSet Items = conn.createStatement().executeQuery(getItem);
                  
                    while (Items.next()) {
                     
                   
                %>
                <tr>
                    <td>First Name :</td> 
                    <td><input class="inp" value="<%=Items.getString("first_name")%>" type="text" name="firstname"  required></td>  
                </tr>
                <tr>
                    <td>Last Name :</td> 
                    <td><input value="<%=Items.getString("last_name")%>" class="inp" type="text" name="lastname"  required></td>  
                </tr>
                <tr>
                    <td>User Email :</td> 
                    <td><input class="inp" value="<%=Items.getString("email")%>" type="email" name="user_email"  required></td>
                </tr>
               
                <%
                }
                %>
                <tr>
                    <td></td> 
                    <td><input class="sub_button" type = "submit"  value="Submit"  /></td>  
                </tr>

            </table>
        </form>
    </div>
</section>
<%@include file="AdminFooter.jsp" %>