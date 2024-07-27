<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>
    <style>
      body {
        display: flex;
        justify-content: flex-end; /* Move the form to the right */
        align-items: center;
        height: 100vh;
        margin: 0;
        background-image: url("signup.jpg");
        background-size: cover;
        background-position: center;
        background-repeat:no-repeat;
        font-family: Georgia, "Times New Roman", Times, serif;
      }

      .card {
        background-color: rgba(255, 255, 255, 0.7); /* Transparent background */
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Card effect */
        width: 400px; /* Increased width */
        margin-right: 3em; /* Adjusted margin to give space between form and right edge */
      
      }

      form {
        display: flex;
        flex-direction: column;
     
      }
      label{
      color: black;
      font-weight: bolder;
      }

      input {
        padding: 10px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: calc(100% - 20px);
        background-color: rgba(255, 255, 255, 0.5);
        color: black;
        font-weight: bold;
      }

      button {
        padding: 10px;
        border: none;
        border-radius: 5px;
        background-color: grey;
        color: white;
        cursor: pointer;
      }

      button:hover {
        background-color: #45a049;
      }
    </style>
</head>
<body>
 <div class="card">
      <!-- Added class "card" -->
      <h2 align="center">Sign Up</h2>
     <span style="font-weight: bold;color: red"> <%String message=(String)request.getAttribute("message"); %>
      <% if(message!=null){%>
      <%=message %>
      <%}   %></span>
      <form action="signup" method="post">
        <label for="firstname">First Name:</label>
        <input type="text" id="firstname" name="firstname" />

        <label for="lastname">Last Name:</label>
        <input type="text" id="lastname" name="lastname" />

        <label for="phoneno">Phone No:</label>
        <input type="tel" id="phoneno" name="phoneno" />

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" />

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" />

        <label for="confirmpassword">Confirm Password:</label>
        <input type="password" id="confirmpassword" name="confirmpassword" />

        <button type="submit">Sign Up</button>
        
      </form>
    </div>
</body>
</html>
