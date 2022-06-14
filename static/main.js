$(document).ready(function(){

    $('.fa-bars').click(function(){
      $(this).toggleClass('fa-times');
      $('.nav').toggleClass('nav-toggle');
    });
  
    $(window).on('load scroll',function(){
  
      $('.fa-bars').removeClass('fa-times');
      $('.nav').removeClass('nav-toggle');
  
      if($(window).scrollTop() > 10){
        $('header').addClass('header-active');
      }else{
        $('header').removeClass('header-active');
      }
  
    });
  
    $('.facility').magnificPopup({
      delegate:'a',
      type:'image',
      gallery:{
        enabled:true
      }
    });
  
  });

  const button = document.querySelector("#appointment")
  const message = document.querySelector("#message")
  const date = document.querySelector("#date")

  button.addEventListener('click', function(){
    console.log(message.value)
    console.log(date.value)
    
    
  })