<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Book Your Bus Journey Today!</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0; /* Remove padding to ensure full viewport coverage */
        position: relative;
      }

      /* Header Styles (Navigation bar) */
      header {
        text-align: center;
        background-color: grey; /* Header background color */
        padding: 20px 0;
        position: fixed; /* Fix the header to the top of the viewport */
        top: 0; /* Position it at the top */
        left: 0; /* Align it to the left */
        width: 100%; /* Span the entire width */
        z-index: 1; /* Ensure the header stays above other elements */
      }

      header nav ul {
        list-style-type: none;
        text-align: right;
        font-weight: bold;
        margin: 0; /* Remove margin for better alignment */
        padding: 0; /* Remove padding for better alignment */
      }

      header nav ul li {
        display: inline;
        margin-right: 20px;
      }

      header nav ul li a {
        color: white; /* Menu item color */
        text-decoration: none;
        transition: color 0.3s; /* Smooth transition on hover */
        position: relative; /* Needed for positioning the white box overlay */
      }

      /* Main Content Styles */
      main {
        padding-top: 80px; /* Add padding to accommodate the fixed header */
      }

      h2 {
        font-size: 2em;
        margin-bottom: 20px;
        color: white;
      }

      .booking-form {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 400px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        position: relative;
        /* Make the form positioned relative to its container */
        z-index: 1; /* Give the form a higher stacking order */
        opacity: 0; /* Initially hide the form */
        transition: opacity 1s ease-in-out;
      }

      .booking-form h2 {
        margin-bottom: 10px;
      }

      .select-wrapper {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        width: 52%;
      }

      select {
        padding: 5px 10px;
        border: 1px solid #ddd;
        border-radius: 3px;
      }

      button {
        background-color: #4caf50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

      /* Video Styles */
      #background-video {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        object-fit: cover;
      }
    </style>
  </head>

  <body>
    <main>
      <header>
        <nav>
          <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="contact.html">Contact Us</a></li>
          </ul>
        </nav>
      </header>
      <form action="journey" method="post" class="booking-form">
        <h2>Where is your adventure taking you?</h2>
        <div class="select-wrapper">
          <select name="from" required="required">
            <option value="" disabled selected>From City</option>
            <option value="Pune">Pune</option>
          </select>
          <select name="to" required="required">
            <option value="" disabled selected>To City</option>
            <option value="Mumbai">Mumbai</option>
            <option value="Banglore">Banglore</option>
            <option value="Chennai">Chennai</option>
            <option value="Nagpur">Nagpur</option>
          </select>
        </div>
        <button type="submit">Find Your Bus</button>
      </form>
    </main>

    <video id="background-video" autoplay muted>
      <source src="Bus (online-video-cutter.com).mp4" type="video/mp4" />
    </video>

    <script>
      const video = document.getElementById("background-video");
      const form = document.querySelector(".booking-form");

      video.addEventListener("loadeddata", () => {
        video.style.opacity = 1; // Show video only after it's loaded
      });

      video.addEventListener("ended", () => {
        video.pause(); // Prevent looping by pausing the video after it finishes
        form.style.opacity = 1; // Make the form visible after video ends
      });
    </script>
  </body>
</html>
