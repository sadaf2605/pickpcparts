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
//= require jquery.dataTables
//= require cocoon
//= require css3-animate-it
//= require clipboard
//= require jquery-ui/autocomplete
//= require select2

$(document).ready(function() {
   	drop=null;
   	
    $('.dropdown').click(function(e) {
	    	if($(e.target).hasClass("dropdown-toggle") ){
	    		if(drop!=null && drop==this){
		    		$(drop).find('.dropdown-menu').first().stop(true, true).slideUp(400);	
		    	}
		    	if(drop!=this){
		    		if(drop!=null)
				    	$(drop).find('.dropdown-menu').first().stop(true, true).slideUp(400);
	            $(this).find('.dropdown-menu').first().stop(true, true).slideDown(400);
	            drop=this
	           }else drop=null
		    }
	        
    });
    
    $("body > div.container").click(function(e) {
    	
	    	$(drop).find('.dropdown-menu').first().stop(true, true).slideUp(400);
	});

	$( "#search" ).autocomplete({
      source: function( request, response ) {
        $.ajax({
          url: "search/auto_complete_search",
          dataType: "json",
          delay: 2000,
          data: {
            search: request
          },
          success: function( data ) {
            response( data );
          }
        });
      }
      });

	$('.owl-carousel').owlCarousel({
	         loop: false,
	         dots:false,
	         autoHeight:true,
	         autoWidth: true,
	         autoplay: true,
	         animateOut: 'fadeOut',
	         loop: true
		});
	});


    $(document).ready(function(){
    	$(window).scrollTop(1);
    	
    	
    	window.setInterval(function(){
	    	$('.same-height', this).each(function(){
		        var highestBox = 0;
		        $('.same-height-item', this).each(function(){
		            if($(this).height() > highestBox) 
		               highestBox = $(this).height(); 
		        });  
			//		alert(highestBox);
		        $('.same-height-item',this).height(highestBox);
			});
	
		}, 2000);
	});







(function($) {
    $.fn.flash_message = function(options) {
      
      options = $.extend({
        text: 'Done',
        time: 1000,
        how: 'before',
        class_name: ''
      }, options);
      
      return $(this).each(function() {
        if( $(this).parent().find('.flash_message').get(0) )
          return;
        
        var message = $('<span />', {
          'class': 'flash_message ' + options.class_name,
          text: options.text
        }).hide().fadeIn('fast');
        
        $(this)[options.how](message);
        
        message.delay(options.time).fadeOut('normal', function() {
          $(this).remove();
        });
        
      });
    };
})(jQuery);
