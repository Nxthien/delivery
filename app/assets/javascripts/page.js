$(document).on('turbolinks:load', function() {
	// $("#register").click(function(){
	// 	console.log("dsd");
	// 	$(".login").addClass("hide");
	// 	$(".register").removeClass("hide");
	// });
	function register(){
		console.log("dsd");
		$(".login").addClass("hide");
		$(".register").removeClass("hide");
	};
	function backtoLogin(){
		$(".register").addClass("hide");
		$(".login").removeClass("hide");
	};
	// $("#backtoLogin").click(function(){
	// 	$(".register").addClass("hide");
	// 	$(".login").removeClass("hide");
	// });
	$(window).on("scroll", function () {
    var srollTrigger = 400 ;
    if ($(window).scrollTop() > srollTrigger ) {
        $(".tab-pane .type-food").addClass("fixed");
        $(".tab-pane .list-food").addClass("pull-left");
        $(".bill-content").addClass("right-fixed");

    } else {
        $(".tab-pane .list-food").removeClass("pull-left");
        $(".tab-pane .type-food").removeClass("fixed");
        $(".bill-content").removeClass("right-fixed");
    }
  });
  $(".type-food .scroll a").on("click", function () {
  		console.log('a');
  		var id = $(this).attr('href').slice(1);
      $("body").animate({scrollTop: $('#'+id).offset().top }, 500, 'swing');
      return false;
 	});
});