 $(document).ready(function(){
  $('#location input').on('change', function() {
   var value = ($('input[type=radio]:checked', '#location').val());
   if(value==='Chicago'){
    $('#additional-interview-text').html("Thanks for filling out the application! The next step is to join us at the Merchandise Mart in Chicago for an interview. This way we can learn a little more about you, tell you more about ACLTC, and answer any questions you may have.");
   } else {
    $('#additional-interview-text').html( "Thanks for filling out the application! The next step is to join us on a Google Hangouts or phone interview. This way we can learn a little more about you, tell you more about ACLTC, and answer any questions you may have.");
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

