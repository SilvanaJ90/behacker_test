$(function () {
  const amenityId = {};
  $('.amenities input[type=checkbox]').change(function () {
    if (this.checked) {
      amenityId[$(this).data('name')] = $(this).data('id');
    } else {
      delete amenityId[$(this).data('name')];
    }
    $('.amenities h4').text(Object.keys(amenityId).join(', '));
  });
  $.get('http://0.0.0.0:5001/api/v1/status/', function (data) {
    if (data.status === 'OK') {
      $('div#api_status').addClass('available');
    } else {
      $('div#api_status').removeClass('available');
    }
  });
});
