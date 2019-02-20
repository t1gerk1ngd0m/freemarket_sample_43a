$(function(){
  var reg_not_nil = new RegExp('\\S');
  var reg_mail_address = new RegExp("^[a-zA-Z0-9.!#$%&'*+\/=?^_'{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
  var reg_alphanumeric_6characters = new RegExp('[a-zA-Z0-9]{6,}');
  var reg_prefecture_choce = new RegExp("^(?!.*--未選択--).*$");
  var reg_only_kana = new RegExp("[ ァ-ヺ ]");
  var reg_zip_code = new RegExp('^[0-9]{3}\-[0-9]{4}$');
  var reg_intger_10or11_characters = new RegExp('[0-9]{10,11}');
  var reg_intger_14or16_characters = new RegExp('[0-9]{14,16}');
  var reg_intger_3or4_characters = new RegExp('[0-9]{3,4}');
  var vadication = function( test , error , user ){
    if( test ){
      error.removeClass('active');
      user.addClass('signup_input');
    }else{
      error.addClass('active');
      user.removeClass('signup_input');
    }
  };
  $('.signin__no-account').on('click',function(){
    $('.l-signup-container').addClass('active');
    $('.signin-panel').removeClass('active');
  });
  $('#user_email').on('keyup',function(){
    var email = document.getElementById('user_email').value;
    var test_fomart_email = reg_mail_address.test(email);
    vadication( test_fomart_email , $('.error--email-fomart') , $('#user_email') );
  });
  $('#user_password').on('keyup',function(){
    var password = document.getElementById('user_password').value;
    var test_fomart_password = reg_alphanumeric_6characters.test(password);
    vadication( test_fomart_password , $('.error--password-fomart') , $('#user_password') );
  });
  $('#user_password_confirmation').on('keyup',function(){
    var password = document.getElementById('user_password').value;
    var password_confirmation = document.getElementById('user_password_confirmation').value;
    var test_match_password_confirmation = ( password == password_confirmation );
    vadication( test_match_password_confirmation , $('.error--password_confirmation-match') , $('#user_password_confirmation') );
  });
  $('.signup_button--user').on('click',function(e){
    e.preventDefault();
    var nickname = document.getElementById('user_nickname').value;
    var email = document.getElementById('user_email').value;
    var password = document.getElementById('user_password').value;
    var password_confirmation = document.getElementById('user_password_confirmation').value;
    var test_nil_nickname = reg_not_nil.test(nickname);
    var test_nil_email = reg_not_nil.test(email);
    var test_fomart_email = reg_mail_address.test(email);
    var test_nil_password = reg_not_nil.test(password);
    var test_fomart_password = reg_alphanumeric_6characters.test(password);
    var test_nil_password_confirmation = reg_not_nil.test(password_confirmation);
    var test_match_password_confirmation = ( password == password_confirmation );
    var test_checked_recaptcha = grecaptcha.getResponse();
    var test_all_member_information = ( test_nil_nickname && test_nil_email && test_fomart_email && test_nil_password && test_fomart_password && test_nil_password_confirmation && test_match_password_confirmation && test_checked_recaptcha );
    vadication( test_nil_nickname , $('.error--nickname') , $('#user_nickname') );
    vadication( test_nil_email , $('.error--email-nil') , $('#user_email') );
    vadication( test_fomart_email , $('.error--email-fomart') , $('#user_email') );
    vadication( test_nil_password_confirmation , $('.error--password_confirmation-nil') , $('#user_password_confirmation') );
    vadication( test_match_password_confirmation , $('.error--password_confirmation-match') , $('#user_password_confirmation') );
    vadication( test_nil_password , $('.error--password_confirmation-nil') , $('#user_password_confirmation') );
    vadication( test_fomart_password , $('.error--password-fomart') , $('#user_password') );
    vadication( test_checked_recaptcha , $('.error--recaptcha') , $('#user_recaptcha') );
    if( test_all_member_information ){
      $('.input-field__tel').addClass('active');
      $('.progress__user').addClass('progress--done');
      $('.input-field__main').removeClass('active');
    }
  });
  $('#user_tel_confirmation').on('keyup',function(){
    var tel_confirmation = document.getElementById('user_tel_confirmation').value;
    var test_fomart_tel_confirmation = reg_intger_10or11_characters.test(tel_confirmation);
    vadication( test_fomart_tel_confirmation , $('.error--tel_confirmation-fomart') , $('#user_tel_confirmation') );
  });
  $('.signup_button--tel').on('click',function(e){
    e.preventDefault(e);
    var tel_confirmation = document.getElementById('user_tel_confirmation').value;
    var test_nil_tel_confirmation = reg_not_nil.test(tel_confirmation);
    var test_fomart_tel_confirmation = reg_intger_10or11_characters.test(tel_confirmation);
    var test_all_phone_number_authentication = ( test_nil_tel_confirmation && test_fomart_tel_confirmation );
    vadication( test_nil_tel_confirmation , $('.error--tel_confirmation-nil') , $('#user_tel_confirmation') );
    if( test_fomart_tel_confirmation ){
      $('.input-field__address').addClass('active');
      $('.progress__tel').addClass('progress--done');
      $('.input-field__tel').removeClass('active');
    }else{
      $('.error--tel_confirmation-fomart').addClass('active');
      $('#user_tel_confirmation').removeClass('signup_input');
    }
  });
  $('#user_first_name_kana').on('keyup',function(){
    var first_name_kana = document.getElementById('user_first_name_kana').value;
    var test_fomart_first_name_kana = reg_only_kana.test(first_name_kana);
    vadication( test_fomart_first_name_kana , $('.error--first_name_kana') , $('#user_first_name_kana') );
  });
  $('#user_last_name_kana').on('keyup',function(){
    var last_name_kana = document.getElementById('user_last_name_kana').value;
    var test_fomart_last_name_kana = reg_only_kana.test(last_name_kana);
    vadication( test_fomart_last_name_kana , $('.error--last_name_kana') , $('#user_last_name_kana') );
  });
  $('#user_zip').on('keyup',function(){
    var zip = document.getElementById('user_zip').value;
    var test_fomart_zip = reg_zip_code.test(zip);
    vadication( test_fomart_zip , $('.error--zip') , $('#user_zip') );
  });
  $('.signup_button--address').on('click',function(e){
    e.preventDefault(e);
    var first_name = document.getElementById('user_first_name').value;
    var last_name = document.getElementById('user_last_name').value;
    var first_name_kana = document.getElementById('user_first_name_kana').value;
    var last_name_kana = document.getElementById('user_last_name_kana').value;
    var zip = document.getElementById('user_zip').value;
    var prefecture = document.getElementById('user_prefecture').value;
    var city = document.getElementById('user_city').value;
    var block = document.getElementById('user_block').value;
    var test_nil_first_name = reg_not_nil.test(first_name);
    var test_nil_last_name = reg_not_nil.test(last_name);
    var test_fomart_first_name_kana = reg_only_kana.test(first_name_kana);
    var test_fomart_last_name_kana = reg_only_kana.test(last_name_kana);
    var test_fomart_zip = reg_zip_code.test(zip);
    var test_choce_prefecture = reg_prefecture_choce.test(prefecture);
    var test_nil_city = reg_not_nil.test(city);
    var test_nil_block = reg_not_nil.test(block);
    var test_all_address = ( test_nil_first_name && test_nil_last_name && test_fomart_first_name_kana && test_fomart_last_name_kana && test_fomart_zip && test_choce_prefecture && test_nil_city && test_nil_block );
    vadication( test_nil_first_name , $('.error--first_name') , $('#user_first_name') );
    vadication( test_nil_last_name, $('.error--last_name') , $('#user_last_name') );
    vadication( test_fomart_first_name_kana , $('.error--first_name_kana') , $('#user_first_name_kana') );
    vadication( test_fomart_last_name_kana , $('.error--last_name_kana') , $('#user_last_name_kana') );
    vadication( test_fomart_zip , $('.error--zip') , $('#user_zip') );
    if( test_choce_prefecture ){
      $('.error--prefecture').removeClass('active');
      $('#user_prefecture').addClass('signup_input signup_input--prefecture');
    }else{
      $('.error--prefecture').addClass('active');
      $('#user_prefecture').removeClass('signup_input signup_input--prefecture');
    }
    vadication( test_nil_city , $('.error--city') , $('#user_city') );
    vadication( test_nil_block , $('.error--block') , $('#user_block') );
    if ( test_all_address ){
      $('.input-field__peymethod').addClass('active');
      $('.progress__address').addClass('progress--done');
      $('.input-field__address').removeClass('active');
    }
  });
  $('#user_card_number').on('keyup',function(){
    var card_number = document.getElementById('user_card_number').value;
    var test_fomart_card_number = reg_intger_14or16_characters.test(card_number);
    vadication( test_fomart_card_number , $('.error--card_number-fomart') , $('#user_card_number') );
  });
  $('#user_security_code').on('keyup',function(){
    var security_code = document.getElementById('user_security_code').value;
    var test_fomart_security_code = reg_intger_3or4_characters.test(security_code);
    vadication( test_fomart_security_code , $('.error--security_code-fomart') , $('#user_security_code') );
  });
  $('.new_user_signup').submit(function(e){
    e.preventDefault(e);
    var card_number = document.getElementById('user_card_number').value;
    var expiration_month = document.getElementById('user_expiration_month_2i').value;
    var expiration_year = document.getElementById('expiration_year_date_1i').value;
    var security_code = document.getElementById('user_security_code').value;
    var test_nil_card_number = reg_not_nil.test(card_number);
    var test_fomart_card_number = reg_intger_14or16_characters.test(card_number);
    var test_nil_expiration_month = reg_not_nil.test(expiration_month);
    var test_nil_expiration_year = reg_not_nil.test(expiration_year);
    var test_nil_security_code = reg_not_nil.test(security_code);
    var test_fomart_security_code = reg_intger_3or4_characters.test(security_code);
    var test_all_card_infomation = ( test_nil_card_number && test_fomart_card_number && test_nil_expiration_month && test_nil_expiration_year && test_nil_security_code && test_fomart_security_code );
    vadication( test_nil_card_number , $('.error--card_number-nil') , $('#user_nickname') );
    vadication( test_fomart_card_number , $('.error--card_number-fomart') , $('#user_card_number') );
    if( test_nil_expiration_month ){
      $('.error--expiration_month').removeClass('active');
      $('#user_expiration_month').addClass('input-form__birth');
    }else{
      $('.error--expiration_month').addClass('active');
      $('#user_expiration_month').removeClass('input-form__birth');
    }
    if( test_nil_expiration_year ){
      $('.error--expiration_year').removeClass('active');
      $('#user_expiration_year').addClass('input-form__birth');
    }else{
      $('.error--expiration_year').addClass('active');
      $('#user_expiration_year').removeClass('input-form__birth');
    }
    vadication( test_nil_security_code , $('.error--security_code-nil') , $('#user_security_code') );
    vadication( test_fomart_security_code , $('.error--security_code-fomart') , $('#user_security_code') );
    if( test_all_card_infomation ){
      this.submit();
    }else{
      return false;
    }
  });

});
