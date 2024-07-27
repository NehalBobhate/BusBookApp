<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Welcome To Bus-Book,Travel all over India</title>
    <style>
      body {
        display: flex;
        justify-content: flex-start; /* Align form on the left side */
        align-items: center;
        height: 100vh;
        margin: 0;
        background-image: url("login.jpg"); /* Replace 'background_image.jpg' with the path to your image */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        font-family: Georgia, "Times New Roman", Times, serif;
      }

      form {
        margin-left: 70px; /* Adjust margin to move the form to the left */
        background-color: rgba(
          255,
          255,
          255,
          0.7
        ); /* Slightly transparent background */
        padding: 60px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 300px;
      }

      label {
        margin-bottom: 5px;
      }

      input {
        padding: 20px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: calc(100% - 10px);
      }

      button {
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: grey;
        color: white;
        cursor: pointer;
        width: 100%;
      }

      button:hover {
        background-color: #45a049;
      }

      a {
        text-decoration: none;
        color: #4caf50;
      }
      a:hover {
        color: blue;
      }
    </style>
  </head>
  <body>
    <form action="login" method="post">
      <h2 align="center">Login</h2>
      <span style="font-weight: bold; color: red">
        <%String message=(String)request.getAttribute("message");%>
        <%if(message!=null){%> <%=message %> <%} %></span
      >

      <br />
      <br />

      <label>Email:</label>
      <input type="text" name="email" />
      <br /><br />
      <label>Password:</label>
      <input type="password" name="password" />

      <br /><br />
      <button type="submit">Login</button>
      <br /><br />
      <a href="#">Forgotten password?</a>
      <br /><br />
      <button style="width: 20%">
        <a style="color: white" href="signup.jsp">SignUp</a>
      </button>
    </form>
  </body>
</html>
