<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bookings</title>
<style>
body {
	margin: 0px;
	padding: 0px;
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
	height: 600px;
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
	background-color: var(--white);
	border-radius: 20px;
	display: flex;
	gap: 5%;
	align-items: center;
	padding-left: 10px;
	padding-right: 10px;
	align-items: center;
	/* border: 1px solid black; */
}

button {
	width: 90%;
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

a {
	width: 50%;
	display: flex;
	justify-content: center;
	text-decoration : none;
}
.buttonCont{
display:flex;
}
}
</style>
</head>
<body>
	<jsp:include page="./workshopNav.jsp"></jsp:include>
	<%
	JSONArray bookings = (JSONArray) request.getAttribute("nearBooking");
	for (int i = 0; i < bookings.length(); i++) {
		JSONObject booking = bookings.getJSONObject(i);
		JSONObject bookingInfo = booking.getJSONObject("bookingInfo");
		JSONObject vehicleInfo = booking.getJSONObject("vehicleInfo").getJSONObject("vehicleInfo");
		JSONObject userInfo = booking.getJSONObject("vehicleInfo").getJSONObject("userInfo");
	%>
	<div class="sectionForm">

		<div class="form">
			<div class="info-container" id="bookingInfo">
				<h3>New Booking Arrived</h3>
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
					<span class="material-symbols-outlined">tag</span>
					<%=vehicleInfo.getString("vehicleNumber") + "," + vehicleInfo.getInt("type") + " Wheelers"%>
				</p>
				<p class="inputFeild">
					<span class="material-symbols-outlined"> pin_drop </span> 123 Main
					<%=bookingInfo.getString("bookingAddress") + "," + bookingInfo.getString("bookingCity") + ","
		+ bookingInfo.getString("bookingState")%>
				</p>
				<div class="buttonCont">

					<a href="WorkshopBookingAcceptServlet?bookingId=<%=booking.getInt("bookingId")%>"><button>Accept
							Request</button></a> <a href="?bookingId=<%=booking.getInt("bookingId")%>"><button>Cancel
							Request</button></a>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>