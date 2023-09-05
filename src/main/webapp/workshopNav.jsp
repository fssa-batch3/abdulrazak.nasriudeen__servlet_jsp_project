<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <link
	href="https://fonts.googleapis.com/css2?family=Lexend+Deca&display=swap"
	rel="stylesheet" />
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<style>
:root {
	--red: #fe3044;
	--white: rgba(237, 237, 237, 0.806);
}
nav {
	width: 220px;
	height: 100%;
	background-color: black;
	position: fixed;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	gap: 4%;
	font-family: "Lexend Deca", sans-serif;
	
	
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
	height: 80px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

nav a:hover {
	color: black;
	background-color: white;
}

nav img {
	width: 60%;
	height:150px;
	background-color: white;
	padding: 10px;
	border-radius: 50px;
}

</style>
</head>
<body>
 <nav>
      <img src="../../assets/images/logo.png" alt="logo" />
      <ul>
        <li>
          <a href="" style="background-color: white; color: black">
            <i class="material-symbols-outlined"> dashboard </i>
            <p>Home</p>
          </a>
        </li>

        <li>
          <a href="WorkshopGetBookingByArea">
            <i class="material-symbols-outlined"> activity_zone </i>
            <p> Booking</p>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="material-symbols-outlined"> shopping_cart </i>
            <p>Our Products</p>
          </a>
        </li>
        <li>
          <a href="">
            <i class="material-symbols-outlined"> account_circle </i>
            <p>Profile</p>
          </a>
        </li>
        <li>
          <a href="">
            <i class="material-symbols-outlined"> notifications </i>
            <p>Notifications</p>
          </a>
        </li>
        <li>
          <a href="" id="settings">
            <i class="material-symbols-outlined"> settings </i>
            <p>Settings</p>
          </a>
        </li>
        <li>
          <a href="">
            <i class="material-symbols-outlined"> logout </i>
            <p>log Out</p>
          </a>
        </li>
      </ul>
    </nav>
    

</body>
</html>