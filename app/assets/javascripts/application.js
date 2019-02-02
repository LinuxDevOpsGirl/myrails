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



function carouselVid(url, active) {
    var activeStr = '';
    var autoplay = 0;
    if (active) {
        activeStr = 'active';
        autoplay = 1;
    }

    return `<div class="carousel-item ${activeStr}">
                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" 
                        src="${url}?rel=0&amp;showinfo=0&amp;modestbranding=1&amp;autoplay=${autoplay}" id="video"  
                        allowscriptaccess="always" allowfullscreen>
                    </iframe>
                </div>
            </div>'`

};



function loadIframeCarousel() {
    $(document).on('click', '.video-btn', function(e) {
        var $clicked = $(this).attr('data-src');
        $('.video-btn').each(function(i, item){
            var $vid = $(item).attr('data-src');
            if ($vid === $clicked) {
                $("#sliderindicators > div.carousel-inner").append(carouselVid($(item).attr('data-src'), true));
            } else {
                $("#sliderindicators > div.carousel-inner").append(carouselVid($(item).attr('data-src'), false));
            }
        });

        $('#myModal').on('hidden.bs.modal', function(){
            $('#sliderindicators > div.carousel-inner').each(function(i, item){
                $(item).html("");
                $(item).find('iframe').attr("src", "");
            })
        });
    });
};

    

$(document).ready(function(){
    loadIframeCarousel();


    $('#sliderindicators').on('slide.bs.carousel', function () {
        console.log("pause!!!???");
      });

      
    
  });