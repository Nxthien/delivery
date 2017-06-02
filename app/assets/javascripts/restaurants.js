$(document).on('turbolinks:load', function() {
  $(".data-restaurant").click(function(){
  	$(".data-restaurant").removeClass("active");
  	$(this).addClass("active");
  	// var res_id = $(this).attr('id')
  	// var a1 = $(".link-show").attr('href');
  	// var link1 = a1.substring(0,20);
  	// var a2 = $(".link-edit").attr('href');
  	// var link2 = a2.substring(0,26);
  	// var a3 = $(".link-del").attr('href');
  	// var link3 = a3.substring(0,20);
  	// $(".link-show").attr('href', link1+res_id);
  	// $(".link-edit").attr('href', link2+res_id);
  	// $(".link-del").attr('href', link3+res_id);
  });
  $("#restaurant_id").on("change",function(){
    var getValue = $(this).val() ;
    $.get( "/admins/foods/find?restaurant_id="+getValue, function( data ) {
      var items = [];
      $.each(data, function(key ,val){
        alert("dsds");
        console.log(data);
      });
     
      // $( "<ul/>", {
      //   "class": "my-new-list",
      //   html: items.join( "" )
      // }).appendTo( "body" );
    });
  });
  $(".remove-food").on("click", function(){
    $(".list-item-order .food-order").remove();
    $(".cart-content .sum-price .price").html("0đ");
    $(".cart-content .price-order .price").html("0đ");
  });
});
