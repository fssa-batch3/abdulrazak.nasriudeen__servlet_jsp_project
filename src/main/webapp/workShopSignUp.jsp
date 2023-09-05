<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Workshop SignUp</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Lexend+Deca&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css"
    />
    <style>
      :root {
        --red: #fe3044;
        --white: rgba(237, 237, 237, 0.806);
      }
      h1,
      h2 {
        width: 100%;
        height: 50px;
        display: flex;
        justify-content: center;
        /* background-color: aliceblue; */
      }
      * {
        margin: 0px;
        padding: 0px;
        font-family: "Lexend Deca", sans-serif;
      }
      body {
        background-color: var(--white);
        height: auto;
        display: flex;
        flex-direction: column;
        align-items: center;

        /* justify-content: center; */
      }
      form {
        width: 450px;
        margin-top: 5px;
        border: 1px solid black;
        height: 700px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 2%;
        background-color: white;

        border-radius: 20px;
      }
      label {
        font-size: 13px;
      }

      .form-group {
        width: 92%;
        margin-top: 11px;
        display: flex;
        align-items: center;
        justify-content: space-around;
        height: 50px;
        background-color: var(--white);
        border-radius: 15px;
        /* gap: 1%; */
        padding-left: 5px;
        border: 1px solid black;
      }
      .form-group input {
        width: 65%;
        height: 80%;
        background: none;
        border: none;
        outline: none;
        font-size: 14px;
        border-radius: 30px;
        background-color: black;
        color: white;
        font-family: "Lexend Deca", sans-serif;
        border: 1px solid black;
        padding-left: 20px;
      }
      .form-group span {
        font-size: 35px;
        color: black;
      }
      .form-group select {
        width: 60%;
        border-radius: 15px;
        height: 70%;
        background-color: black;
        color: white;
        font-family: "Lexend Deca", sans-serif;
      }

      form button {
        height: 92%;
        border-radius: 15px;
        outline: none;
        border: none;
        background-color: rgb(47, 255, 175);
        color: black;
        width: 98%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }
      form button:hover {
        background-color: rgb(47, 255, 175);
        color: black;
        border: 3px solid black;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Workshop Registration Form</h1>
      <form action="WorkShopRegisterServlet" method="post">
      <% String err = request.getParameter("error");
    if(err!=null){
    	%>
    	<p style="color: red;" ><%= err %></p>
    	
    	<%
    }
    %>
        <div class="form-group">
          <label for="name">Workshop Name</label>
          <input type="text" id="name" pattern="^[a-zA-Z\s]{1,20}$" title="name should not contain number or special characters" name="name" required />
        </div>
        <div class="form-group">
          <label for="number">Number</label>
          <input type="text" id="number"  pattern="^[0-9]{10}$" name="number" title="only digits are acceptable with 10 characters " required />
        </div>
        <div class="form-group">
          <label for="address">Address</label>
          <input type="text" id="address" name="address" required />
        </div>
        <div class="form-group">
          <label for="city">City</label>
          <input type="text" pattern="^[a-zA-Z\s]{1,20}$" id="city" title="city should not contain number or special characters" name="city" required />
        </div>
        <div class="form-group">
          <label for="state">State</label>
          <input type="text" pattern="^[a-zA-Z\s]{1,50}$" id="state" title="state should not contain number or special characters" name="state" required />
        </div>
        <div class="form-group">
          <label for="workshopType">Workshop Type</label>
          <select id="workshopType" name="workshopType" required>
            <option value="">Select Workshop Type</option>
            <option value="2">2 wheelers</option>
            <option value="3">3 wheelers</option>
            <option value="4">4 wheelers</option>
          </select>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" pattern="[A-Za-z0-9]{6,10}" title="password should contains only alphabets and numbers" id="password" name="password" required />
        </div>
        <div class="form-group">
          <label for="password">Confirm -Password</label>
          <input type="password" pattern="[A-Za-z0-9]{6,10}" title="password should contains only alphabets and numbers"  id="password" name="Cpassword" required />
        </div>
        <div class="form-group">
          <button type="submit">Create Account</button>
        </div>
      </form>
    </div>
  </body>
</html>
