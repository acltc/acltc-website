/* global $ */
$(document).ready(function() {
  $('.submission-reviewed').on('click', function(event) {
    var checked = event.target.checked;
    var $checkbox = $(this);
    $.ajax({
      type: 'PATCH',
      url: '/tutorial_submissions/ajax',
      data: {
        reviewed: checked,
        gist_url: $checkbox.attr('data-gist-url')
      },
      success: function(response) {
        console.log('SUCCESS!', response);
      },
      error: function(response) {
        console.log('ERROR!', response);
        $checkbox.attr('checked', !checked);
      }
    });
  });
});
