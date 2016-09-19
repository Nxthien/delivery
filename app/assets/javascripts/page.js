$( document ).ready(function() {
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
});