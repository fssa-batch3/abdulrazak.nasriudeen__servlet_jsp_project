<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Lexend+Deca&display=swap" rel="stylesheet">  <title>Sign up Form</title>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
 <link rel = "stylesheet" href ="./assets/css/sign.css" />
</head>
<body>
  <div class="login">
    <div class="circle">
    </div>
    
    <form class="loginContainer signUpContainer" action="UserRegistrationServlet" method="POST">
      <h2>Sign - up</h2>
      <% String err = request.getParameter("error");
    if(err!=null){
    	%>
    	<p style="color: red;" ><%= err %></p>
    	
    	<%
    }
    %>
      <div class="inputContainer">
        <p style="color: white;">Name</p>
        <div class="cont">
          <span class="material-symbols-outlined" style="color: white;">badge</span>
          <input pattern="^[a-zA-Z\s]{1,20}$" title="Name should only contains Alphabets"  name="name" required  style="border-bottom: 2px solid white;">
        </div>
      </div>
      <div class="inputContainer">
        <p style="color: white;">Mobile Number</p>
        <div class="cont">
          <span class="material-symbols-outlined" style="color: white;">call</span>
          <input pattern="[0-9]{10}" title="Number Should be in 10 digits" name="number" required style="border-bottom: 2px solid white;">
        </div>
      </div>
      <div class="inputContainer">
        <p style="color: white;">Password</p>
        <div class="cont">
          <span class="material-symbols-outlined" style="color: white;">dialpad</span>
          <input pattern="[A-Za-z0-9]{6,10}" title="Password Should be in 6 to 10 digits mixed up of alphabets and numbers" required name="password" type="password" style="border-bottom: 2px solid white;">
        </div>
      </div>
      <div class="inputContainer">
        <p style="color: white;">Confirm-Password</p>
        <div class="cont">
          <span class="material-symbols-outlined" style="color: white;">dialpad</span>
          <input pattern="[A-Za-z0-9]{6,10}" title="Password Should be in 6 to 10 digits mixed up of alphabets and numbers" required name="ConfirmPassword" type="password" style="border-bottom: 2px solid white;">
        </div>
      </div>
      
      <button class="submit" type="submit">Sign up</button>
    </form>
    <div class="circ2">
    </div>
  </div>
</body>
</html>
