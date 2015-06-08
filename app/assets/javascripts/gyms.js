$(function(){
    // Bind the swiperightHandler callback function to the swipe event on div.box
    $( "div.gym" ).on( "swiperight", swiperightHandler );
    $( "div.gym" ).on( "swipeleft", swipeleftHandler );

    // Callback function references the event target and adds the 'swiperight' class to it
    function swiperightHandler( event ){

        $( event.target).addClass( "swiperight");
        // alert('do i work?');
           $.ajax({
               url: "/gyms/:id/member",
               beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
               type: 'POST'
           });
    }
    function swipeleftHandler( event ){
        $( event.target ).addClass( "swipeleft");
        //alert('do i work?');
        $.ajax({
            url: "/users/:id/dislike",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            type: 'POST'
        });
        // $.ajax({
        //     url: "/friends/index",
        //     beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        //     type: 'POST'
        // });
    };

