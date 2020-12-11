<%-- 
    Document   : Login
    Created on : Dec 10, 2020, 8:40:32 PM
    Author     : Dunstan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel = "stylesheet" type = "text/css" href = "styles.css">
        <title>HOME INVENTORY</title>
    </head>
    <body>
         <section class="header">
            <div class="menu">
                <h1 class="title"> HOME INVENTORY</h1>
            </div>
        </section>
        <section class="border_login">
            <div class="loginbody" style="border-color: maroon;    border-width: 2px;    border-radius: 20px;">
                <form action="SignIn" method="post">
                <table>
                     <tr>
                         <td colspan="2" style="text-align: center; font-size: 24px;">User Login</td> 
                       
                    </tr>
                    <tr>
                       <td>User Email :</td> 
                       <td><input class="inp" type = "email" name = "user_email"  required/></td>
                    </tr>
                    
                    <tr>
                        <td>User Password :</td> 
                      <td><input class="inp" type = "password" name = "user_password"  required/></td>  
                    </tr>
                    <tr>
                        <td> <a class="signup_button" href="Register.jsp"> SignUp</a></td> 
                      <td><input class="sub_button" type = "submit" name = "submit" value="Sign in"  /></td>  
                    </tr>
                    
                </table>
                    </form>
            </div>
        </section>
    </body>
</html>
