$(document).ready(function () {
  $("form").submit(function (event) {
    event.preventDefault();
    var formData = {
      first_name : $('#first_name').val(),
      last_name: $('#last_name').val(),
      email: $('#email').val(),
      password: $('#password').val()
    };

    $.ajax({
      url: "http://127.0.0.1:5001/api/v1/roles/dc32135c-1f1e-4dac-8771-1b91289dd03e/users",
      type: "POST",
      data: JSON.stringify(formData),
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(response) {
        if (response) {
          alert("Se guardó el registro correctamente");
          location.href="http://127.0.0.1:5000/bhprofile/"
        } else {
          alert("datos  incorrectos");
        }
      }
    })
  });
}); 