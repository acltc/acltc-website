 $(document).ready(function(){
  $('#location input').on('change', function() {
   var value = ($('input[type=radio]:checked', '#location').val());
    if(value==='Chicago'){
      $('#additional-interview-text').html("Thanks for filling out the application! The next step is to join us at Merchandise Mart in Chicago for an in-person Interview. This way we can learn a little more about you, tell you more about Actualize, and answer any questions you may have.");
    } else if(value === 'San Francisco'){
      $('#additional-interview-text').html("Thanks for filling out the application! The next step is to join us at TechSpace in San Francisco for a Google Hangouts Interview. This way we can learn a little more about you, tell you more about Actualize, and answer any questions you may have.");
    } else if(value === 'New York City'){
      $('#additional-interview-text').html("Thanks for filling out the application! The next step is to join us at LMHQ in Manhattan for an in-person Interview. This way we can learn a little more about you, tell you more about Actualize, and answer any questions you may have.");
    } else {
      $('#additional-interview-text').html( "Thanks for filling out the application! The next step is to join us for an in-person Interview. This way we can learn a little more about you, tell you more about Actualize, and answer any questions you may have.");
    }
    $.ajax({
        type: 'GET',
        url: '/options/',
        data: {'id': value},
        success: function(data){
          var filteredInterviews = data;
          $('select#interviews').html('')
          $('<option value="">Select Interview Date and Time</option>').appendTo('select#interviews');
          $.each(filteredInterviews,function(i,object){
            $('<option value=' + object.id + '>' + object.starts_at + '</option>').appendTo('select#interviews');
          });
        },
        error: function (){
          console.log("Error Loading Local Interivew Slots");
        }
    });
  });
})

