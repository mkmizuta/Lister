// JQuery(document).ready(function(){
//   $(".ajax-destroy").click(function(event){
    
//     var list = $(this).parents('tr');
//     $.ajax({
//       url: $(this).attr('href'),
//       type: 'DELETE',
//       dataType: 'json',
//       // data: {param1: 'value1'}, // Optional
//       // complete: function(xhr, textStatus) {
//       // }, //complete happens no matter what; it just happens when completed
//       success: function(data, textStatus, xhr) {
//         list.remove();
//       },
//       error: function(xhr, textStatus, errorThrown) {
//         // alert("You've got a problem.");
//       }
//     });
    
//     return false;
//   });
// });