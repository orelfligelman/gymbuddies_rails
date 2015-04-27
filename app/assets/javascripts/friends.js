$(function(){
    // Bind the swiperightHandler callback function to the swipe event on div.box
    $( "div.box" ).on( "swiperight", swiperightHandler );
    $( "div.box" ).on( "swipeleft", swipeleftHandler );

    // Callback function references the event target and adds the 'swiperight' class to it
    function swiperightHandler( event ){

        $( event.target).addClass( "swiperight");
        alert('do i work?');
           $.ajax({
               url: "/friends/:id/like",
               beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
               type: 'POST'
           });
    }
    function swipeleftHandler( event ){
        $( event.target ).addClass( "swipeleft");
        //alert('do i work?');
        $.ajax({
            url: "/friends/1/dislike",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            type: 'POST'
        });
        $.ajax({
            url: "/friends/index",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            type: 'POST'
        });
    }
});