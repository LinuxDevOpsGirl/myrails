// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
	
//= require jquery3
//= require popper
//= require bootstrap-sprockets

function loadIframeModal() {

    $(document).on('click', '.video-btn', function(e) {

        var $videoSrc             = $(this).attr('data-src'),
            $allowfullscreen      = $(this).attr('data-video-fullscreen');

        $("#myModal iframe").attr({
            'src'               : $videoSrc + "?rel=0&amp;showinfo=0&amp;modestbranding=1&amp;autoplay=1",
            'allowfullscreen'   : $allowfullscreen
            
        });

        $('#myModal').on('hidden.bs.modal', function(){
            $(this).find('iframe').html("");
            $(this).find('iframe').attr("src", "");
        });
    });
}

$(document).ready(function(){

    loadIframeModal();

//     var $videoSrc;  
// $('.video-btn').click(function() {
//     $videoSrc = $(this).data( "src" );
//     console.log("why no video?");
//     console.log($videoSrc);
// });


  
  
// // when the modal is opened autoplay it  
// $('#myModal').on('shown.bs.modal', function (e) {
    
// // set the video src to autoplay and not to show related video. Youtube related video is like a box of chocolates... you never know what you're gonna get
// $("#video").attr('src',$videoSrc + "?rel=0&amp;showinfo=0&amp;modestbranding=1&amp;autoplay=1" ); 
// })
  
  
// // stop playing the youtube video when I close the modal
// $('#myModal').on('hide.bs.modal', function (e) {
//     // a poor man's stop video
//     $("#video").attr('src',$videoSrc); 
// }) 
    
    


    
    
  });