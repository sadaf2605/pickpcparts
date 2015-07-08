// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require owl.carousel

$('.dropdown').click(function() {
    alert("hi")
    $(this).find('.dropdown-menu').first().stop(true, true).slideToggle(400);
}, function() {
    $(this).find('.dropdown-menu').first().stop(true, true).slideToggle(400)
});

$(document).ready(function() {

    $(".owl-carousel").owlCarousel({

        autoPlay: 3000, //Set AutoPlay to 3 seconds

        itemsDesktop : [1199,3],
        itemsDesktopSmall : [979,3]

    });

});
