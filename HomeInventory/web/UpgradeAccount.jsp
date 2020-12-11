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
       
            <table>
                <tr>
                    <td colspan="2" style="text-align: center; font-size: 24px;">UPGRADE ACCOUNT</td> 

                </tr>
                <%                  
                    String AccEmail = request.getParameter("accountemail").trim();
                    String getItem = "SELECT  role.role_name,user.role,first_name,last_name,email FROM user INNER JOIN role ON user.role = role.role_id WHERE email='" + AccEmail.trim() + "';";
                    ResultSet Items = conn.createStatement().executeQuery(getItem);
                  
                    while (Items.next()) {
                     
                   
                %>
                <tr>
                    <td>First Name :</td> 
                    <td><%=Items.getString("first_name")%></td>  
                </tr>
                <tr>
                    <td>Last Name :</td> 
                    <td><%=Items.getString("last_name")%></td>  
                </tr>
                <tr>
                    <td>User Email :</td> 
                    <td><%=Items.getString("email")%></td>
                </tr>
                <tr>
                     <form action="UpgradeAccount" method="post" >
                    <td>ROLE</td>
                    <input type="hidden" value="<%=Items.getString("email")%>" name="preemail">
                    <td>
                       <select style="padding: 10px;width: 100%;" name="role" >
                    <option value="<%=Items.getString("user.role")%>" selected> <%=Items.getString("role.role_name")%></option>
                    <%                            String getCategory = "SELECT * FROM role;";
                        ResultSet catg = conn.createStatement().executeQuery(getCategory);
                        String checking = "";
                        while (catg.next()) {
                            if (Items.getString("user.role").toString() == catg.getString("role_id").toString()) {
                                checking = "selected";
                            }
                    %>
                    <option <%=checking%> Value="<%=catg.getString("role_id")%>"><%=catg.getString("role_name")%></option>
                    <%
                        }
                    %>
                </select>
                    </td>
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