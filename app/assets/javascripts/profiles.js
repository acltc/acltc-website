// function loadModal(applicationId) {


//   $('#location input').on('change', function() {
//    var value = ($('input[type=radio]:checked', '#location').val());
//    $.ajax({
//         type: 'GET',
//         url: '/options/',
//         data: {'id': value},
//         success: function(data){
//           var filteredInterviews = data;
//           $('select#interviews').html('')
//           $('<option value="">Select Interview Date and Time</option>').appendTo('select#interviews');
//           $.each(filteredInterviews,function(i,object){
//             $('<option value=' + object.id + '>' + object.starts_at + '</option>').appendTo('select#interviews');
//           });
//         },
//         error: function (){
//           console.log("Error Loading Local Interivew Slots");
//         }
//     });
//   });
// })



    function loadModal(path) {

        console.log("Hello");

        $.ajax({
            type: 'GET',
            url: ('/profiles/' + path),
            success: function(data){
              var profileData = data;
              console.log(profileData);
            },
            error: function (){
              console.log("Error Loading Local Interivew Slots");
            }
        });

        $("#profile-modal").modal('show');
    };

