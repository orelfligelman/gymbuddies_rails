$(function(){
    // Bind the swiperightHandler callback function to the swipe event on div.box
    $( "div.workout" ).on( "swiperight", swiperightHandler );
    $( "div.workout" ).on( "swipeleft", swipeleftHandler );

    // Callback function references the event target and adds the 'swiperight' class to it
    function swiperightHandler( event ){

        $( event.target).addClass( "swiperight");
        // alert('do i work?');
           $.ajax({
               url: "/users/:id/like_workout",
               beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
               type: 'POST'
            });
            $.ajax({
            url: "/users/:id/index",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            type: 'GET'
        });
    }
    function swipeleftHandler( event ){
        $( event.target ).addClass( "swipeleft");
        //alert('do i work?');
        $.ajax({
            url: "/users/:id/dislike_workout",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            type: 'POST'
        });
        $.ajax({
            url: "/users/:id/index",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            type: 'GET'
        });
    }
});