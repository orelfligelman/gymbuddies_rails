// $(function(){
//     // Bind the swiperightHandler callback function to the swipe e on div.box
//     $( "div.box" ).on( "swiperight", swiperightHandler );
//     $( "div.box" ).on( "swipeleft", swipeleftHandler );

//     // Callback function references the e target and adds the 'swiperight' class to it
//     function swiperightHandler( e ){
//         $( e.target).addClass( "swiperight");
//         // alert('do i work?');
//           $.ajax({
//                url: "/users/:id/like",
//                beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//                type: 'POST'
//           });
//           $.ajax({
//             url: "/users/:id/index",
//             beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//             type: 'GET'
//         });  

//     }
//     function swipeleftHandler( e ){
//         $( e.target ).addClass( "swipeleft");
//         //alert('do i work?');
//         $.ajax({
//             url: "/users/:id/dislike",
//             beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//             type: 'POST'
//         });
//          $.ajax({
//             url: "/users/:id/index",
//             beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//             type: 'GET'
//         });  
//     }
// });