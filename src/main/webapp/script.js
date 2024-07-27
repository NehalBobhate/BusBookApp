// JavaScript for changing button text on click
document.addEventListener("DOMContentLoaded", function () {
  const signUpButton = document.querySelector("#signUpButton");
  const logInButton = document.querySelector("#logInButton");

  signUpButton.addEventListener("click", function () {
    signUpButton.textContent = "Signing Up...";
  });

  logInButton.addEventListener("click", function () {
    logInButton.textContent = "Logging In...";
  });
});
