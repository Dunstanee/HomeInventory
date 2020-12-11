<%-- 
    Document   : Setting
    Created on : Dec 11, 2020, 12:59:41 AM
    Author     : Dunstan
--%>

<%@include file="Header.jsp" %>

<div class="updateuser">
    <table style="width: 40%; margin: auto;">
        <tr>
            <td style="padding: 10px;text-align: center;" colspan="2"> UPDATE USER PROFILE</td>
        </tr>
        <form action="UpdateUser" method="post">
            <input value="<%=session.getAttribute("Email")%>"  type="hidden" name="pre_email">
            <tr>
                <td style="padding: 10px;">Email</td>
                <td style="padding: 10px;">: <input value="<%=session.getAttribute("Email")%>" style="padding: 4px;" type="email" name="email"></td>
            </tr>
            <tr>
                <td style="padding: 10px;">First Name</td>
                <td style="padding: 10px;">: <input value="<%=session.getAttribute("FistName")%>" style="padding: 4px;" type="text" name="firstname"></td>
            </tr>
            <tr>
                <td style="padding: 10px;">Last Name</td>
                <td style="padding: 10px;">: <input value="<%=session.getAttribute("LastName")%>" style="padding: 4px;" type="text" name="lastname"></td>
            </tr>
            <tr>
                <td></td>
                <td ><input class="sub_button" type="submit" value="Update Data"></td>
            </tr>
        </form>

    </table>
    <table style="width: 40%; margin: auto;">

        <form action="UpdatePassword" method="post">
            <tr>
            <input value="<%=session.getAttribute("Email")%>"  type="hidden" name="pre_email">
            <td style="padding: 10px;"><input style="padding: 4px;" type="password" name="password" placeholder="New Password"></td>
            <td style="padding: 10px;"><input class="sub_button" type="submit" value="Update Password"></td>
            </tr>
        </form>
    </table>   

</div>
<%@include file="Footer.jsp" %>

