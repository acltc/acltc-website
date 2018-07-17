/* global $ */

$(document).ready(function() { 
    
    $('form.form-validate').submit(function(e) {
        var form = $(this).closest('form.form-validate'),
            submitButton = form.find('button[type="submit"]'),
            error = 0,
            originalError = form.attr('original-error'),
            preparedForm, iFrame, userEmail, userFullName, userFirstName, userLastName, successRedirect, formError, formSuccess;

        form.find('.form-error, .form-success').remove();
        submitButton.attr('data-text', submitButton.text());
        form.append('<div class="form-error" style="display: none; text-align: center;">' + form.attr('data-error') + '</div>');
        form.append('<div class="form-success" style="display: none;">' + form.attr('data-success') + '</div>');
        formError = form.find('.form-error');
        formSuccess = form.find('.form-success');
        form.addClass('attempted-submit');

        $(form).find('.validate-required').each(function() {
          if ($(this).val() === '') {
              e.preventDefault();
              $(this).addClass('field-error');
              error = 1;
          } else {
              $(this).removeClass('field-error');
          }
      });

      $(form).find('.validate-email').each(function() {
          if (!(/(.+)@(.+){2,}\.(.+){2,}/.test($(this).val()))) {
              e.preventDefault();
              $(this).addClass('field-error');
              error = 1;
          } else {
              $(this).removeClass('field-error');
          }
      });

      if (error === 1) {
          formError = form.find('.form-error');
          formError.fadeIn(200);
          setTimeout(function() {
              formError.fadeOut(500);
          }, 3000);
      }
    });

    if ($('.time-zone').length > 0) {
      var zone = new Date().toLocaleTimeString('en-us',{timeZoneName:'long'}).split(' ')[2];
      if (zone === "Pacific") {
        $('.time-zone-pacific').trigger("click");
      } else if (zone === "Mountain") {
        $('.time-zone-mountain').trigger("click");
      } else if (zone === "Central") {
        $('.time-zone-central').trigger("click");
      } else if (zone === "Eastern") {
        $('.time-zone-eastern').trigger("click");
      }
    }

});
