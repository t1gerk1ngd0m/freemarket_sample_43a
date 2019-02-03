$(function(){
  var not_nill = new RegExp('\\S');
  var mail_address = new RegExp("([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)");
  var alphanumeric_6characters = new RegExp('[a-zA-Z0-9]{6,}');
  var kana = new RegExp("");
  var intger = new RegExp('[0-9]');
  var intger_3or4_characters = new RegExp('[0-9]{3,4}');
  $('.signup-main__botton').on('click',function(){
    $('.signup-container__user').addClass('active');
    $('.signup-container__user').addClass('active');
    $('.signup-container__main').removeClass('active');
  });
  $('.signup_button--user').on('click',function(e){
    e.preventDefault();
    var nickname = document.getElementById('user_nickname').value;
    var email = document.getElementById('user_email').value;
    var password = document.getElementById('user_password').value;
    var password_confirmation = document.getElementById('user_password_confirmation').value;
    var recaptcha = grecaptcha.getResponse();
    if( not_nill.test(nickname) ){
      $('.error--nickname').removeClass('active');
    }else{
      $('.error--nickname').addClass('active');
    }
    if( not_nill.test(email) ){
      $('.error--email-nil').removeClass('active');
    }else{
      $('.error--email-nil').addClass('active');
    }
    if( mail_address.test(email) ){
      $('.error--email-address').removeClass('active');
    }else{
      $('.error--email-address').addClass('active');
    }
    if( not_nill.test(password) ){
      $('.error--password-nil').removeClass('active');
    }else{
      $('.error--password-nil').addClass('active');
    }
    if( alphanumeric_6characters.test(password) ){
      $('.error--password-count').removeClass('active');
    }else{
      $('.error--password-count').addClass('active');
    }
    if( not_nill.test(password_confirmation) ){
      $('.error--password_confirmation-nil').removeClass('active');
    }else{
      $('.error--password_confirmation-nil').addClass('active');
    }
    if( password == password_confirmation ){
      $('.error--password_confirmation-match').removeClass('active');
    }else{
      $('.error--password_confirmation-match').addClass('active');
    }
    if( recaptcha ){
      $('.error--recaptcha').removeClass('active');
    }else{
      $('.error--recaptcha').addClass('active');
    }
    if( not_nill.test(nickname) && not_nill.test(email) && mail_address.test(email) && not_nill.test(password) && alphanumeric_6characters.test(password) && not_nill.test(password_confirmation) && password == password_confirmation && recaptcha ){
    $('.input-field__tel').addClass('active');
    $('.progress__user').addClass('progress--done');
    $('.input-field__main').removeClass('active');
    }
  });
  $('.signup_button--tel').on('click',function(){
    e.preventDefault();
    var tel_confirmation = document.getElementById('tel_confirmation').value;
    if( intger.test(tel_confirmation) ){
      $('.input-field__address').addClass('active');
      $('.progress__tel').addClass('progress--done');
      $('.input-field__tel').removeClass('active');
    }else{
      $('.error--tel_confirmation').addClass('active');
    }
  });
  $('.signup_button--address').on('click',function(){
    $('.input-field__peymethod').addClass('active');
    $('.progress__address').addClass('progress--done');
    $('.input-field__address').removeClass('active');
  });
});
