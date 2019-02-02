$(function() {
  $('.signup-main__botton').on('click',function(){
    $('.signup-container__user').addClass('active');
    $('.signup-container__user').addClass('active');
    $('.signup-container__main').removeClass('active');
  });
  $('.signup_button--user').on('click',function(){
    $('.input-field__tel').addClass('active');
    $('.progress__user').addClass('progress--done');
    $('.input-field__main').removeClass('active');
  });
  $('.signup_button--tel').on('click',function(){
    $('.input-field__address').addClass('active');
    $('.progress__tel').addClass('progress--done');
    $('.input-field__tel').removeClass('active');
  });
  $('.signup_button--address').on('click',function(){
    $('.input-field__peymethod').addClass('active');
    $('.progress__address').addClass('progress--done');
    $('.input-field__address').removeClass('active');
  });
  $('.signup_button--peymethod').on('click',function(){
    $('.input-field__finish').addClass('active');
    $('.progress__peymethod').addClass('progress--done');
    $('.input-field__peymethod').removeClass('active');
  });
});





