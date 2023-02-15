$('button').click(function() {
    $.ajax({
      url: 'http://127.0.0.1:5001/api/v1/roles/{rol_id}/users',
      type: 'POST',
      contentType: 'application/json',
      data: JSON.stringify({}),
      success: (data) => {
        data.sort(function (a, b) {
          return a.name.localeCompare(b.name);
        });
        $('article').remove();
        }
    });
});