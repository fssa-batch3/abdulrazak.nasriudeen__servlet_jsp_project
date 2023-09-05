<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
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
        justify-content: space-between;
        align-items: center;
        padding-left: 10px;
        padding-right: 10px;
        align-items: center;
        /* border: 1px solid black; */
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

      a {
        width: 90%;
        display: flex;
        justify-content: center;
        text-decoration: none;
      }

      .info-container {
        padding: 10px;
        width: 95%;
        margin: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        overflow-y: scroll;
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

      .totalCont {
        display: flex;
        align-items: center;
        width: 100%;
      }
      .totalCont a {
        width: 70%;
      }
      h4 {
        width: 30%;
        height: 40px;
        align-items: center;
        justify-content: center;
      }
    </style>
  </head>
  <body>
    <div class="sectionForm">
      <h2>
        <span class="material-symbols-outlined"> settings_slow_motion </span>
        Service List
      </h2>
      <div class="form">
        <div class="info-container" id="bookingInfo">
          <p class="inputFeild">
            <span class="material-symbols-outlined">
              settings_slow_motion
            </span>
            Muthu

            <span class="material-symbols-outlined"> currency_rupee </span>
            200
          </p>
        </div>
        <div class="totalCont">
          <a href="./CancelUserRequestBooking?bookingId=35"
            ><button>
              <span class="material-symbols-outlined"> data_saver_on </span>
              Add service
            </button></a
          >
          <h4>Total : 2000</h4>
        </div>
      </div>
    </div>
  </body>
</html>
