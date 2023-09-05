<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.fssa.reparo.model.*"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://fonts.googleapis.com/css2?family=Lexend+Deca&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='./assets/css/customer.css' />">
<link rel="stylesheet" href="./assets/css/customer.css" />
<title>Customer Dashboard</title>
<style>
:root {
	--red: #fe3044;
	--white: rgba(237, 237, 237, 0.806);
}

body {
	padding: 0px;
	margin: 0px;
	background-color: var(--white);
	display: flex;
	font-family: "Lexend Deca", sans-serif;
}

nav {
	width: 250px;
	height: 100%;
	background-color: var(--red);
	position: fixed;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 4%;
}

nav ul {
	list-style: none;
	width: 100%;
}

nav ul li a {
	display: flex;
	width: 100%;
	justify-content: start;
	padding-left: 10px;
	align-items: center;
	text-decoration: none;
	gap: 6%;
	margin-right: 20px;
	color: white;
	font-size: 18px;
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
}

nav li {
	height: 70px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

nav a:hover {
	color: var(--red);
	background-color: white;
}

nav img {
	width: 60%;
	height: 150px;
	background-color: white;
	padding: 10px;
	border-radius: 20px;
}

.section {
	margin-left: 260px;
	width: 90%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.section p {
	width: 100%;
	font-size: 18px;
}

h1 {
	width: 100%;
	/* height: 30px; */
}

.sectionForm {
	width: 90%;
	height: 540px;
	background-color: white;
	border-radius: 50px;
	/* border: 1px solid black; */
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 5%;
}

.sectionForm .form {
	width: 45%;
	display: flex;
	flex-direction: column;
	align-items: center;
	/* gap: 4%; */
	height: 92%;
	border-radius: 30px;
	background-color: var(--white);
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
/* input feild  */
.inputFeild {
	width: 90%;
	margin-top: 20px;
	height: 50px;
	background-color: white;
	border-radius: 20px;
	display: flex;
	justify-content:space-between;
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
	padding-left:5px;
	height: 30px;
	width: 55%;
	font-family: "Lexend Deca", sans-serif;
	font-size: 15px;
	color: black;
	border: 2px solid black;
}

.inputAddressFeild {
	width: 90%;
	height: 240px;
	background-color: white;
	border-radius: 20px;
	display: flex;
	flex-direction: column;
	margin-top: 20px;
	align-items: center;
	/* justify-content: center; */
}

.inputAddressFeild input {
	height: 60%;
	width: 90%;
	background-color: var(--white);
	color: black;
	font-family: "Lexend Deca", sans-serif;
	font-size: 18px;
	border-radius: 20px;
}
/* workShop Conatainer */
.workShopOuterContainer, .serviceOuterContainer {
	width: 100%;
	margin-top: 80px;
	display: flex;
	align-items: center;
	flex-direction: column;
}

.workshopContainer {
	width: 95%;
	height: auto;
	border-radius: 30px;
	background-color: white;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-bottom: 10px;
	border: 1px solid black;
}

.workshopNav, .workshops {
	width: 98%;
	height: 60px;
	background-color: var(--white);
	border-radius: 25px;
	margin-top: 10px;
}

.workshops, .serviceContainer {
	height: 600px;
	display: flex;
	flex-wrap: wrap;
	gap: 4%;
	justify-content: center;
}

.workshopNav {
	display: flex;
	gap: 2%;
	align-items: center;
	justify-content: center;
}

.search {
	width: 80%;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 6%;
	height: 40px;
	background-color: white;
	border-radius: 30px;
	border: 1px solid black;
}

button {
	font-family: "Lexend Deca", sans-serif;
	font-size: 15px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5%;
}

.search input {
	width: 85%;
	background-color: white;
	border: none;
	outline: none;
	font-size: 18px;
}

.search span {
	font-size: 30px;
}

.filter {
	width: 15%;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5%;
	background-color: black;
	color: white;
	height: 40px;
	border-radius: 30px;
}

.workshops {
	align-items: flex-start;
}

.filterTop {
	width: 98%;
	height: 100px;
	display: flex;
	z-index: 4;
	justify-content: flex-end;
	/* align-items: center; */
	/* background-color: var(--white); */
	border-radius: 20px;
	margin-top: 10px;
	margin-top: -12px;
	/* gap: 1%; */
}

@
keyframes filter { 0% {
	transform: translateY(-15px);
}

}
.extendFilter {
	width: 60%;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: end;
	justify-content: center;
	gap: 5%;
	padding-right: 10px;
	/* background-color: aqua; */
	/* border-radius: 30px; */
	overflow: hidden;
}

.extendFilter select {
	width: 30%;
	height: 30px;
	border-radius: 15px;
	background-color: black;
	color: white;
}

.extendFilter button {
	width: 30%;
	height: 30px;
	background-color: var(--white);
	border-radius: 15px;
	border: 2px solid black;
}

.extendFilter button:hover {
	cursor: pointer;
	background-color: black;
	color: white;
}

#locationInp, #vehicleInp {
	display: none;
	align-items: center;
	justify-content: center;
	gap: 4%;
}

.locationInput {
	width: 95%;
	height: 40px;
	border: 2px solid black;
	border-radius: 30px;
	display: none;
	background-color: white;
	animation: locationFilter 1s;
}

@
keyframes locationFilter { 0% {
	transform: translateX(600px);
}

}
.filterOptions {
	width: 150px;
	border-radius: 15px;
	background-color: white;
	height: 100px;
	display: none;
	flex-direction: column;
	gap: 6%;
	align-items: center;
	justify-content: center;
	border: 1px solid black;
	animation: filter 1s;
}

.filterOptions button {
	width: 95%;
	height: 40px;
	background-color: var(--white);
	border: 2px solid black;
	border-radius: 30px;
}

.filterOptions button:hover {
	color: white;
	background-color: black;
	cursor: pointer;
}
/*  service cards */
.container {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 50px;
}

.card_box {
	width: 450px;
	height: 300px;
	border-radius: 20px;
	background-color: white;
	position: relative;
	/* box-shadow: 0 25px 50px rgba(0, 0, 0, 0.55); */
	cursor: pointer;
	transition: all 0.3s;
}

.card_box:hover {
	transform: scale(0.9);
}

.card_box span {
	position: absolute;
	overflow: hidden;
	width: 150px;
	height: 150px;
	top: -10px;
	left: -10px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.card_box span::before {
	content: "Door step";
	position: absolute;
	width: 150%;
	height: 40px;
	/* background-image: linear-gradient(
    45deg,
    #ff6547 0%,
    #ffb144 51%,
    #ff7053 100%
  ); */
	background-color: black;
	transform: rotate(-45deg) translateY(-20px);
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff;
	font-weight: 600;
	letter-spacing: 0.1em;
	text-transform: uppercase;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.23);
}

.card_box span::after {
	content: "";
	position: absolute;
	width: 10px;
	bottom: 0;
	left: 0;
	height: 10px;
	z-index: -1;
	box-shadow: 140px -140px black;
	background-color: black;
}

.workshopCont {
	width: 98%;
	height: 95%;
	/* position: absolute; */
	margin-top: -100px;
	overflow-y: scroll;
	display: flex;
	gap: 3%;
	flex-wrap: wrap;
}

.workShopCard {
	width: 300px;
	height: 450px;
	border-radius: 30px;
	background-color: white;
	display: flex;
	flex-direction: column;
	/* gap: 1%; */
	padding-top: 10px;
	align-items: center;
	border: 1px solid black;
}

.workShopCard img {
	border: 1px solid black;
	width: 90%;
	height: 50%;
	border-radius: 20px;
}

.cardMid {
	width: 90%;
	height: 170px;
	background-color: var(--white);
	border-radius: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.cardMid p {
	font-size: 10px;
}

.workShopCard button {
	width: 90%;
	height: 40px;
	margin-top: 10px;
	border-radius: 20px;
	background-color: black;
	border: none;
	outline: none;
	color: white;
	font-size: 18px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.workShopCard button:hover {
	background-color: white;
	color: black;
	border: 2px solid black;
	cursor: pointer;
}

.workShopCard button span {
	font-size: 25px;
}

.content {
	width: 95%;
	height: 30px;
	background-color: white;
	margin-top: 10px;
	border-radius: 20px;
	display: flex;
	gap: 5%;
	align-items: center;
	padding-left: 5px;
}

.content h5 {
	font-size: 20px;
	color: black;
}
/* Otp verification  */
.OtpConfirmation {
	width: 300px;
	margin-top: 100px;
	height: 500px;
	background-color: white;
	border: none;
	display: flex;
	flex-direction: column;
	gap: 1%;
	z-index: 5;
	border-radius: 40px;
	border-left: 2px solid black;
	border-right: 2px solid black;
	padding-bottom: 8px;
}

.OtpConfirmation img {
	width: 87%;
	margin-top: 20px;
	height: 50%;
	border-radius: 20px;
	border: 1px solid black;
}

#otpH3 {
	width: 150px;
	height: 60px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	background-color: black;
	margin-top: -110px;
	z-index: 4;
}

.button {
	width: 95%;
	height: 50px;
	background-color: black;
	border-radius: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 3%;
}

.button a {
	width: 45%;
	height: 30px;
	border: 2px solid white;
	font-size: 18px;
	color: black;
	border-radius: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: aliceblue;
}

.button>:first-child {
	background-color: aquamarine;
}

/*  waiting  */
.waitingCard {
	width: 300px;
	height: 500px;
	padding: 5px;
	background-color: black;
	border-radius: 30px;
	display: flex;
	flex-direction: column;
	gap: 1%;
	align-items: center;
	justify-content: center;
	color: white;
}

.waitingCard img {
	width: 95%;
	height: 70%;
	border-radius: 30px;
}

.waitingCard button {
	border: 2px solid white;
}

.waitingCard button:hover {
	background-color: white;
	color: red;
	border: 2px solid red;
	cursor: pointer;
}

.waitingCard h3 {
	color: white;
}

/* service list */
/* Service list  */
.serviceList {
	margin-top: 100px;
	width: 400px;
	height: auto;
	padding: 10px;
	display: flex;
	flex-direction: column;
	background-color: white;
	border-left: 2px solid black;
	border-right: 2px solid black;
	border-radius: 20px;
}

.serviceList h2 {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 7%;
	margin-top: -2px;
}

.serviceList h2 button {
	width: 30%;
	height: 40px;
	background-color: black;
	color: white;
	border: none;
	outline: none;
	border-radius: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5%;
	font-size: 20px;
}

.serviceList h2 button:hover {
	color: black;
	background-color: white;
	border: 2px solid black;
	cursor: pointer;
}

.serviceContainerList {
	width: 98%;
	height: 50px;
	display: flex;
	align-items: center;
	gap: 2%;
	border-radius: 20px;
	background-color: var(--white);
	margin-top: 10px;
	/* justify-content: center; */
	padding-left: 10px;
	/* padding-top: -15px; */
	border-bottom: 1px solid black;
}

.serviceContainerList span {
	font-size: 35px;
}

.serviceContainerList h4 {
	width: 60%;
	/* background-color: #555; */
}

.serviceContainerList input {
	width: 50px;
	height: 30px;
	border: 2px solid white;
	outline: none;
	border-radius: 30px;
	background-color: black;
	color: white;
	padding-left: 10px;
	font-size: 15px;
}

.serviceList h3 {
	display: flex;
	align-items: center;
	width: 100%;
	gap: 2%;
	height: 50px;
	justify-content: center;
	/* margin-left: 100px; */
}

.serviceList button {
	width: 95%;
	margin-left: 10px;
	height: 40px;
	border: 2px solid black;
	border-radius: 30px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 5%;
	font-size: 18px;
	background-color: black;
}

.serviceList button:hover {
	color: black;
	background-color: white;
	border: 2px solid black;
	cursor: pointer;
}

#total {
	width: 120px;
	height: 30px;
	background-color: black;
	padding-left: 20px;
	color: white;
	border: none;
	outline: none;
	border-radius: 20px;
	font-size: 20px;
}

.btnContainer {
	display: flex;
	align-items: center;
	/* justify-content: center; */
	background-color: black;
	height: 60px;
	border-radius: 30px;
	width: 100%;
	gap: 2%;
	margin-bottom: 10px;
}

.btnContainer button {
	width: 45%;
	border: 2px solid white;
	height: 70%;
}

#cancelBtn {
	color: white;
	background-color: black;
}

#cancelBtn:hover {
	color: black;
	cursor: pointer;
	background-color: white;
}
</style>


</head>

<body>
	<jsp:include page="./customerNav.jsp"></jsp:include>
	<div class="section">
	<%
						HttpSession ses = request.getSession(false);
						List<WorkShop> workshops = null;
						User user =  new User() ;
						if (ses != null) {
							// Retrieve the "workshops" attribute from the session
							workshops = (List<WorkShop>) ses.getAttribute("workshops");
							user = (User)ses.getAttribute("user");

						}  %>


		<h1>
			Hi
			<%= user.getName() %></h1>

		<p>
			Stuck on the road? <br /> Don't fret, our expert mechanics fix your
			vehicle.
		</p>
		<h1>Please fill the details to contact you !</h1>
		<% String err = request.getParameter("error");
    if(err!=null){
    	%>
    	<p style="color: red;" ><%= err %></p>
    	
    	<%
    }
    %>
		<form class="sectionForm" id="vehicleForm" action="AddVehicleServlet" method="post">
		
			<div class="form">
				<h3>Enter your vehicle details</h3>
				
				<div class="inputFeild">
<span class="material-symbols-outlined">
two_wheeler
</span>
					<h5>Enter the Company :</h5>
					<input type="text" name="company">

				</div>
				<div class="inputFeild">
<span class="material-symbols-outlined">
two_wheeler
</span>
					<h5>Enter your model :</h5>
					<input type="text" name="model">

				</div>
				<div class="inputFeild">
<span class="material-symbols-outlined">
two_wheeler
</span>
					<h5>Vehicle Number :</h5>
					<input type="text" name="number">

				</div>
				<div class="inputFeild">
<span class="material-symbols-outlined">
two_wheeler
</span>
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
            <span class="material-symbols-outlined">ads_click </span> click for further process
          </button> 
			</div>

		</form>
		<form class="sectionForm Bookingform" id="bookingForm action="" method="">
		
			<div class="form">
				<h3>Enter your Booking details details</h3>
				
				<div class="inputFeild">
<span class="material-symbols-outlined">
two_wheeler
</span>
					<h5>Enter the Company :</h5>
					<input type="text" name="company">

				</div>
				<div class="inputFeild">
<span class="material-symbols-outlined">
two_wheeler
</span>
					<h5>Enter your model :</h5>
					<input type="text" name="model">

				</div>
				<div class="inputFeild">
<span class="material-symbols-outlined">
two_wheeler
</span>
					<h5>Vehicle Number :</h5>
					<input type="text" name="number">

				</div>
				<div class="inputFeild">
<span class="material-symbols-outlined">
two_wheeler
</span>
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
            <span class="material-symbols-outlined">ads_click </span> click for further process
          </button> 
			</div>

		</form>
		
		<div class="workShopOuterContainer">
			<h1>Find the WorkShop which suits you !!</h1>
			<div class="workshopContainer">
				<div class="workshopNav">
					<div class="search">
						<input type="search" name="" id="searchbar"
							placeholder="Search for the service center" /> <span
							class="material-symbols-outlined"> search </span>
					</div>
					<button id="filter" class="filter">
						<span class="material-symbols-outlined"> filter_alt </span>Filter
					</button>
				</div>
				<div class="workshops">
					<div class="filterTop">
						<div class="extendFilter">
							<div id="locationInp" class="locationInput">
								<select name="state" id="">
									<option value="">Select state</option>
								</select> <select name="City" id="">
									<option value="">Select City</option>
								</select>
								<button>
									<span class="material-symbols-outlined"> pin_drop </span> Get
									location
								</button>
							</div>
							<div id="vehicleInp" class="locationInput">
								<button id="twoWheeler">
									<span class="material-symbols-outlined"> two_wheeler </span>2
									wheelers
								</button>
								<button id="threeWheeler">
									<span class="material-symbols-outlined">
										electric_rickshaw </span>3 wheelers
								</button>
								<button id="fourWheeler">
									<span class="material-symbols-outlined"> directions_car
									</span>4 wheelers
								</button>
							</div>
						</div>
						<div id="filterButtons" class="filterOptions">
							<button id="locationFil">
								<span class="material-symbols-outlined"> pin_drop </span>Location
							</button>
							<button id="vehicleFil">
								<span class="material-symbols-outlined"> directions_car </span>Vehicle
							</button>
						</div>
					</div>
					<div id="workshops" class="workshopCont">

						
						<%
						if (!workshops.isEmpty()) {
							for (WorkShop work : workshops) {
						%>
						<div class="workShopCard">
							<img />
							<div class="cardMid">
								<div class="content">
									<span class="material-symbols-outlined">
										home_repair_service </span>
									<h3>
										<%=work.getName()%></h3>
								</div>
								<div class="content">
									<span class="material-symbols-outlined"> smartphone </span>
									<h4><%=work.getNumber()%></h4>
								</div>
								<div class="content">
									<span class="material-symbols-outlined"> distance </span>
									<p><%=work.getAddress()%>
										,
										<%=work.getCity()%>,
										<%=work.getState()%>
								</div>
								<div class="content">
									<span class="material-symbols-outlined">
										emoji_transportation </span>
									<h4><%=work.getType()%>
										wheeler WorkShop
									</h4>
								</div>



    







							</div>
							<button>
								<span class="material-symbols-outlined"> visibility </span> View
							</button>




						</div>
						<%
						}

						}

						// Display the value of the "workshops" attribute
						%>


					</div>
				</div>
			</div>
		</div>
		<div class="serviceOuterContainer">
			<h1>Book the Best service For your vehicle !</h1>
			<div class="serviceContainer">
				<div class="container">
					<div class="card_box">
						<span></span>
					</div>
				</div>
				<div class="container">
					<div class="card_box">
						<span></span>
					</div>
				</div>
				<div class="container">
					<div class="card_box">
						<span></span>
					</div>
				</div>
				<div class="container">
					<div class="card_box">
						<span></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function openDiv(openDiv, closeDiv) {
		  let div1 = document.querySelector(openDiv);
		  let div2 = document.querySelector(closeDiv);
		  div1.style.display = "flex";
		  div2.style.display = "none";
		}
	
	
	</script>
  
	
	
</body>
</html>
