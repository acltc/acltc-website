 $(document).ready(function(){
  $('#location input').on('change', function() {
   var value = ($('input[type=radio]:checked', '#location').val());
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

