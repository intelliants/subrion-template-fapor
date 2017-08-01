$(function(){
  $('.slider').slick({
  	dots: true,
  	arrows: true,
    adaptiveHeight: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    speed: 1000
  })
  $('.slider_bottom').slick({
  	dots: false,
  	arrows: true,
    adaptiveHeight: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    speed: 1000
  })
});
