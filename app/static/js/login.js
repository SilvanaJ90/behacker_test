$(document).ready(function() {
    $('#login').submit(function(e) {
        e.preventDefault();
        document.getElementById('submitForm').disabled = true;
        $.ajax({
            type: "POST",
            url: 'http://127.0.0.1:5001/api/v1/roles/{rol_id}/users',
            headers: {'Authorization': 'Bearer xxxxxxxxxxxxx'},
            data: $(this).serialize(),
            success: function(response)
            {
               alert('Acceso Ok');
               $('#email').val('');
               $('#password').val('');
               document.getElementById('submitForm').disabled = false;
           },
           error:function(error){
            console.log(e.message);
           }
       });
     });
});