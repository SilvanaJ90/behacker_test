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
});
