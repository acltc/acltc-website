 $(document).ready(function(){
  $('#city input').on('change', function() {
   var value = ($('input[type=radio]:checked', '#city').val());
   if(value==='Chicago'){
    $('#additional-tour-text').html("Choose a tour date and time.");
   } else {
    $('#additional-tour-text').html("Choose a tour date and time.");
   }
   $.ajax({
        type: 'GET',
        url: '/options/',
        data: {'id': value},
        success: function(data){
          var filteredTours = data;
          $('select#tours').html('')
          $('<option value="">Select Date and Time</option>').appendTo('select#tours');
          $.each(filteredTours,function(i,object){
            $('<option value=' + object.id + '>' + object.starts_at + '</option>').appendTo('select#tours');
          });
        },
        error: function (){
          console.log("Error Loading Local Tour Slots");
        }
    });
  });
})

