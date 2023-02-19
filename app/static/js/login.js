$(document).ready(function() {
  $('#login-form').submit(function(event) {
    event.preventDefault(); // Prevent default form behavior

    const email = $('#email_i').val();
    const password = $('#password_i').val();

    // Check if the user exists by making a GET request to the API
    $.ajax({
      url: `http://127.0.0.1:5001/api/v1/users/${email}`,
      method: 'GET',
      dataType: 'json',
      success: function(response) {
        // If the user exists, authenticate it by making a POST request to the API
        $.ajax({
          url: 'http://127.0.0.1:5001/api/v1/users/login',
          method: 'POST',
          dataType: 'json',
          contentType: "application/json; charset=utf-8",
          data: { email: email, password: password },
          success: function(response) {
            // Check user role and redirect
            if (response.is_user === true) {
              window.location.href = "/bhprofile/test";
            } else if (response.is_user === false) {
              window.location.href = "/bhprofile/ver_categorias";
            } else {
              alert('Rol desconocido.');
            }
          },
          error: function(jqXHR, textStatus, errorThrown) {
            alert('Credenciales inválidas. Inténtelo de nuevo.');
          }
        });
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert('El usuario no existe. Por favor regístrese.');
      }
    });
  });
});