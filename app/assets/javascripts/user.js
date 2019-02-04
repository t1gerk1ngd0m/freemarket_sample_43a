$(function(){
  var not_nill = new RegExp('\\S');
  var mail_address = new RegExp("([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)");
  var alphanumeric_6characters = new RegExp('[a-zA-Z0-9]{6,}');
  var intger = new RegExp('[0-9]');
  var intger_10or11_characters = new RegExp('[0-9]{10,11}');
  var kana = new RegExp("[ ァ-ヺ ]");
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
  $('.signup_button--tel').on('click',function(e){
    e.preventDefault(e);
    var tel_confirmation = document.getElementById('user_tel_confirmation').value;
    if( intger_10or11_characters.test(tel_confirmation) ){
      $('.input-field__address').addClass('active');
      $('.progress__tel').addClass('progress--done');
      $('.input-field__tel').removeClass('active');
    }else{
      $('.error--tel_confirmation').addClass('active');
    }
  });
  $('.signup_button--address').on('click',function(e){
    e.preventDefault(e);
    var first_name = document.getElementById('user_first_name').value;
    var last_name = document.getElementById('user_last_name').value;
    var first_name_kana = document.getElementById('user_first_name_kana').value;
    var last_name_kana = document.getElementById('user_last_name_kana').value;
    var zip = document.getElementById('user_zip').value;
    var prefecture = document.getElementById('user_prefecture').value;
    var block = document.getElementById('user_block').value;
    var building = document.getElementById('user_building').value;
    var phone_number = document.getElementById('user_phone_number').value;
    if( not_nill.test(first_name) ){
      $('.error--first_name').removeClass('active');
    }else{
      $('.error--first_name').addClass('active');
    }
    if( not_nill.test(last_name) ){
      $('.error--last_name').removeClass('active');
    }else{
      $('.error--last_name').addClass('active');
    }
    if( kana.test(first_name_kana) ){
      $('.error--first_name_kana').removeClass('active');
    }else{
      $('.error--first_name_kana').addClass('active');
    }
    if( kana.test(last_name_kana) ){
      $('.error--last_name_kana').removeClass('active');
    }else{
      $('.error--last_name_kana').addClass('active');
    }
    if( intger.test(zip) ){
      $('.error--zip').removeClas
      s('active');
    }else{
      $('.error--zip').addClass('active');
    }
    if( not_nill.test(prefecture) ){
      $('.error--prefecture').removeClass('active');
    }else{
      $('.error--prefecture').addClass('active');
    }
    if( not_nill.test(block) ){
      $('.error--block').removeClass('active');
    }else{
      $('.error--block').addClass('active');
    }
    if( not_nill.test(building) ){
      $('.error--building').removeClass('active');
    }else{
      $('.error--building').addClass('active');
    }
    if( intger_10or11_characters.test(phone_number) ){
      $('.error--phone_number').removeClass('active');
    }else{
      $('.error--phone_number').addClass('active');
    }
    if ( not_nill.test(first_name) && not_nill.test(last_name) && kana.test(first_name_kana) && kana.test(last_name_kana) && intger.test(zip) && not_nill.test(prefecture) && not_nill.test(block) && not_nill.test(building) && intger_10or11_characters.test(phone_number) ){
      $('.input-field__peymethod').addClass('active');
      $('.progress__address').addClass('progress--done');
      $('.input-field__address').removeClass('active');
    }
  $('.signup_button--card').on('click',function(e){
    e.preventDefault(e);
    });
  });
});
