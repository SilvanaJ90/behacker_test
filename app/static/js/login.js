document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.querySelector("#login-form");

  loginForm.addEventListener("submit", function (event) {
    event.preventDefault();

    const email = document.querySelector("#email_i").value;
    const password = document.querySelector("#password_i").value;

    fetch("http://127.0.0.1:5001/api/v1/users/login", {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email: email, password: password }),
    })
      .then((response) => {
        if (!response.ok) {
          throw Error(response.statusText);
        }
        return response.json();
      })
      .then((data) => {
        if (data.is_user) {
          window.location.href = "/bhprofile/test";
        } else {
          window.location.href = "/bhprofile/ver_categorias";
        }
      })
      .catch((error) => {
        console.error(error);
        alert("Invalid credentials. Please try again.");
      });
  });
});