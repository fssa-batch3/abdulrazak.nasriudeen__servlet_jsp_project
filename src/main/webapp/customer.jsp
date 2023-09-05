<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Home page</title>
<style>
body {
	padding: 0px;
	margin: 0px;
	background-color: var(--white);
	display: flex;
	gap : 5%;
	font-family: "Lexend Deca", sans-serif;
}
      :root {
        --red: #fe3044;
        --white: rgba(237, 237, 237, 0.806);
      }
      body {
        padding: 0px;
        margin: 0px;
        background-color: var(--white);
        display: flex;
        gap: 5%;
        font-family: "Lexend Deca", sans-serif;
      }
      .sectionForm {
        width: 30%;
        height: 540px;
        background-color: white;
        border-radius: 50px;
        /* border: 1px solid black; */
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 5%;
        margin-left:250px;
                margin-top:150px;
                
      }
      /* input feild  */
      .inputFeild {
        width: 90%;
        margin-top: 20px;
        height: 50px;
        background-color: white;
        border-radius: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-left: 10px;
        padding-right: 10px;
        /* border: 1px solid black; */
      }

      .inputFeild select {
        width: 65%;
        border-radius: 20px;
        height: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: var(--white);
        color: black;
        border: 2px solid black;
      }

      .inputFeild input {
        background-color: var(--white);
        border: none;
        border-radius: 20px;
        padding-left: 5px;
        height: 30px;
        width: 55%;
        font-family: "Lexend Deca", sans-serif;
        font-size: 15px;
        color: black;
        border: 2px solid black;
      }
      .form button {
        width: 70%;
        height: 50px;
        border-radius: 30px;
        border: none;
        background-color: black;
        color: white;
        margin-top: 20px;
        font-size: 20px;
        display: flex;
        align-items: center;
        gap: 5%;
        justify-content: center;
      }

      .form button:hover {
        background-color: white;
        color: black;
        border: 2px solid black;
        cursor: pointer;
      }
      .form {
        width: 95%;
        display: flex;
        flex-direction: column;
        align-items: center;
        /* gap: 4%; */
        height: 92%;
        border-radius: 30px;
        background-color: var(--white);
      }
    </style>
</head>
<jsp:include page="./customerNav.jsp"></jsp:include>
<body>
<form class="sectionForm" id="vehicleForm" action="AddVehicle"
			method="post">
            <div class="form">
				<h3>Enter your vehicle details</h3>

				<div class="inputFeild">
					<span class="material-symbols-outlined"> two_wheeler </span>
					<h5>Enter the Company :</h5>
					<input type="text" name="company">

				</div>
				<div class="inputFeild">
					<span class="material-symbols-outlined"> two_wheeler </span>
					<h5>Enter your model :</h5>
					<input type="text" name="model">

				</div>
				<div class="inputFeild">
					<span class="material-symbols-outlined"> two_wheeler </span>
					<h5>Vehicle Number :</h5>
					<input type="text" name=vehicleNumber>

				</div>
				<div class="inputFeild">
					<span class="material-symbols-outlined"> two_wheeler </span>
					<h5>Vehicle Year :</h5>
					<input type="text" name="year">

				</div>
				<div class="inputFeild">
					<span class="material-symbols-outlined">
						emoji_transportation </span>
					<h5>Select vehicle :</h5>
					<select name="type" required id="vehicleType">
						<option value="">Select Your vehicle</option>
						<option value="2">2 wheelers</option>
						<option value="3">3 wheelers</option>
						<option value="4">4 wheelers</option>
					</select>
				</div>
				<button type="submit">
					<span class="material-symbols-outlined">ads_click </span> click for
					further process
				</button>
			</div>

		</form>
</body>
</html>