<%-- 
    Document   : NewAccount
    Created on : Dec 11, 2020, 8:35:29 AM
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
 <section class="border_login">
            <div class="loginbody" style="border-color: maroon;    border-width: 2px;    border-radius: 20px;">
                <form action="newAccount" method="post" >
                    <table>
                        <tr>
                            <td colspan="2" style="text-align: center; font-size: 24px;">ADD NEW ACCOUNT</td> 

                        </tr>
                        <tr>
                            <td>First Name :</td> 
                            <td><input class="inp" type="text" name="firstname"  required></td>  
                        </tr>
                        <tr>
                            <td>Last Name :</td> 
                            <td><input class="inp" type="text" name="lastname"  required></td>  
                        </tr>
                        <tr>
                            <td>User Email :</td> 
                            <td><input class="inp" type="email" name="user_email"  required></td>
                        </tr>
                        <tr>
                            <td>ROLE</td>
                            <td>
                                 <select style="padding: 5px 11px 5px 11px;width: 90%;" name="role">
                        <%
                     String getCategory = "SELECT * FROM role;";
                        ResultSet catg = conn.createStatement().executeQuery(getCategory);
                        while(catg.next()){
                    %>
                        <option Value="<%=catg.getString("role_id")%>"><%=catg.getString("role_name")%></option>
                        <%
                        }
                        %>
                    </select>
                            </td>
                        </tr>
                        <tr>
                            <td>User Password :</td> 
                            <td><input class="inp" type="password" name="user_password"  required></td>  
                        </tr>
                        <tr>
                            <td></td> 
                            <td><input class="sub_button" type = "submit"  value="Submit"  /></td>  
                        </tr>

                    </table>
                </form>
            </div>
        </section>
      
<%@include file="AdminFooter.jsp" %>
