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

  $.ajax({
    type: 'POST',
    url: 'http://localhost:5001/api/v1/places_search/',
    contentType: 'application/json',
    data: '{}',
    dataType: 'json',
    success: function (data) {
      data.forEach(function (place) {
        $('section.places').append('<article><div class="title_box"><h2>' +
          place.name + '</h2><div class="price_by_night">$' +
          place.price_by_night +
          '</div></div><div class="information"><div class="max_guest">' +
          place.max_guest + '</div><div class="number_rooms">' +
          place.number_rooms + '</div><div class="number_bathrooms">' +
          place.number_bathrooms +
          '</div></div><div class="description">' + place.description + '</div></article>');
      });
    }
  });
});
