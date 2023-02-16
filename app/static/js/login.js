$(document).ready(function() {
    $('button').click(function(e) {
        e.preventDefault();
        let formData_i = {
            email: $('#email_i').val(),
            password: $('#password_i').val()
          };
        document.getElementById('button').disabled = true;
        $.ajax({
            type: "POST",
            url: "http://127.0.0.1:5001/api/v1/roles/dc32135c-1f1e-4dac-8771-1b91289dd03e/users",
            data: JSON.stringify(formData_i),
            contentType: "application/json; charset=utf-8",
            success: function(response)
            {
               
           },
           error:function(error){
            console.log(e.message);
           }
       });
     });
});