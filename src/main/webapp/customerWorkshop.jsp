<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta charset="ISO-8859-1">
<title>Customer Home page</title>
<style>
body {
	padding: 0px;
	margin: 0px;
	background-color: var(--white);
	display: flex;
	gap: 5%;
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
	height: 650px;
	background-color: white;
	border-radius: 50px;
	/* border: 1px solid black; */
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 5%;
	margin-left: 250px;
	margin-top: 50px;
}
/* input feild  */
.inputFeild {
	width: 90%;
	margin-top: 20px;
	height: 50px;
	background-color: white;
	border-radius: 20px;
	display: flex;
	gap: 5%;
	align-items: center;
	padding-left: 10px;
	padding-right: 10px;
	align-items: center;
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

button {
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

button:hover {
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
	height: 85%;
	border-radius: 30px;
	background-color: var(--white);
}
/* Styling for the container */
.container {
	width: 500px; /* Set a fixed width for the container */
	height: 600px; /* Set a fixed height for the container */
	border: 1px solid #ccc; /* Add a border for visual separation */
	overflow-y: scroll;
	background-color: black;
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
}

/* Styling for the individual cards */
.card {
	padding: 10px;
	margin: 20px;
	height: 150px;
	border-radius: 30px;
	display: flex;
	align-items: center;
	background-color: var(--white);
	/* Enable vertical scrolling when content overflows */
	border: 1px solid #ddd;
	background-color: #f9f9f9;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
}

@
keyframes heartbeat { 0% {
	transform: scale(1);
}

50
%
{
transform
:
scale(
1.1
);
}
100
%
{
transform
:
scale(
1
);
}
}
.live {
	font-size: 30px;
	animation: heartbeat 1.5s infinite;
}

a {
	width: 90%;
	display: flex;
	justify-content: center;
}

.info-container {
	padding: 10px;
	width: 95%;
	margin: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

h2 {
	background-color: black;
	color: white;
	padding: 5px;
	margin: 0;
	width: 80%;
	height: 40px;
	border-radius: 30px;
	display: flex;
	justify-content: center;
	gap: 5%;
	margin-top: -50px;
	align-items: center;
}

p {
	margin: 5px 0;
	display: flex;
	width: 80%;
	align-items: center;
	gap: 5%;
}

.innerCard1 {
	width: 40%;
	display: flex;
	flex-direction: column;
	align-items: start;
}

.innerCard1 .store {
	font-size: 100px;
}

.innerCard1 button {
	height: 30px;
}

.innerCard2 {
	width: 65%;
	margin-left: -30px;
	border-radius: 30px;
	color: white;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 92%;
	background-color: black;
}
</style>
</head>
<jsp:include page="./customerNav.jsp"></jsp:include>
<body>
	<%
	HttpSession ses = request.getSession(false);
	String jsonData = "";
	if (ses != null)
		jsonData = ses.getAttribute("bookingInfo").toString();
	else
		jsonData = request.getAttribute("bookingInfo").toString();

	JSONObject jsonObject = new JSONObject(jsonData);
	JSONObject bookingInfo = jsonObject.getJSONObject("bookingInfo");
	JSONObject vehicleInfo = jsonObject.getJSONObject("vehicleInfo").getJSONObject("vehicleInfo");
	JSONObject userInfo = jsonObject.getJSONObject("vehicleInfo").getJSONObject("userInfo");

	String problem = jsonObject.getJSONObject("bookingInfo").getString("problem");
	String bookingCity = jsonObject.getJSONObject("bookingInfo").getString("bookingCity");
	%>
	<div class="sectionForm">
		<h2>
			<span class="material-symbols-outlined live">
				settings_input_antenna </span> Searching Workshop
		</h2>
		<div class="form">
			<div class="info-container" id="bookingInfo">
				<p class="inputFeild">
					<span class="material-symbols-outlined"> account_circle </span>
					<%=userInfo.getString("name")%>
				</p>
				<p class="inputFeild">
					<span class="material-symbols-outlined">smartphone</span><%=userInfo.getBigInteger("number")%>
				</p>

				<p class="inputFeild">
					<span class="material-symbols-outlined"> settings_b_roll </span>
					<%=bookingInfo.getString("problem")%>
				</p>

				<p class="inputFeild">
					<span class="material-symbols-outlined">directions_car</span>
					<%=vehicleInfo.getString("company") + "," + vehicleInfo.getString("model") + "," + vehicleInfo.getInt("year")%>
				</p>
				<p class="inputFeild">
					<span class="material-symbols-outlined">tag</span> <%=vehicleInfo.getString("vehicleNumber") + "," + vehicleInfo.getInt("type") + " Wheelers"%>
				</p>
				<p class="inputFeild">
					<span class="material-symbols-outlined"> pin_drop </span> 123 Main
					<%=bookingInfo.getString("bookingAddress") + "," + bookingInfo.getString("bookingCity") + ","
		+ bookingInfo.getString("bookingState")%>
				</p>

				<a href="./CancelUserRequestBooking?bookingId=<%=jsonObject.getInt("bookingId")%>"><button>Cancel
						Request</button></a>
			</div>
		</div>
	</div>
	<div>
      <h3>We found some workshop near you</h3>
	<div class="container">
		<%
		JSONArray workshops = (JSONArray) request.getAttribute("nearWorkshops");

		for (int i = 0; i < workshops.length(); i++) {
			JSONObject workshop = workshops.getJSONObject(i);
		%>
		<div class="card">
          <div class="innerCard1">
            <span class="material-symbols-outlined store"> store </span>
            <button>
              <span class="material-symbols-outlined"> visibility </span>View
            </button>
          </div>
          <div class="innerCard2">
            <p>
              <span class="material-symbols-outlined"> home </span> <%=workshop.getString("workshopName")%>
            </p>
            <p>
              <span class="material-symbols-outlined"> pin_drop </span> <%=workshop.getString("workshopAddress")%>
            </p>
            <p>
              <span class="material-symbols-outlined"> location_city </span
              ><%=workshop.getString("city")+","+workshop.getString("state")%>
            </p>
          </div>
        </div>
		<%
		}
		%>
	</div>
	</div>


</body>
</html>