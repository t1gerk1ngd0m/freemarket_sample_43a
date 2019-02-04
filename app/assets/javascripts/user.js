$(function(){
  var reg_not_nil = new RegExp('\\S');
  var reg_mail_address = new RegExp("([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)");
  var reg_alphanumeric_6characters = new RegExp('[a-zA-Z0-9]{6,}');
  var reg_prefecture_choice = new RegExp("^(?!.*--未選択--).*$");
  var reg_only_kana = new RegExp("[ ァ-ヺ ]");
  var reg_intger_7_characters = new RegExp('[0-9]{7}');
  var reg_intger_10or11_characters = new RegExp('[0-9]{10,11}');
  var reg_credit_card_number = new RegExp('[0-9]');
  var reg_intger_3or4_characters = new RegExp('[0-9]{3,4}');
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
    var test_nil_nickname = reg_not_nil.test(nickname);
    var test_nil_email = reg_not_nil.test(email);
    var test_fomart_email = reg_mail_address.test(email);
    var test_nil_password = reg_not_nil.test(password);
    var test_fomart_password = reg_alphanumeric_6characters.test(password);
    var test_nil_password_confirmation = reg_not_nil.test(password_confirmation);
    var test_match_password_confirmation = ( password == password_confirmation );
    var test_checked_recaptcha = grecaptcha.getResponse();
    var test_all_member_information = ( test_nil_nickname && test_nil_email && test_fomart_email && test_nil_password && test_fomart_password && test_nil_password_confirmation && test_match_password_confirmation && test_checked_recaptcha );
    if( test_nil_nickname ){
      $('.error--nickname').removeClass('active');
    }else{
      $('.error--nickname').addClass('active');
    };
    if( test_nil_email  ){
      $('.error--email-nil').removeClass('active');
    }else{
      $('.error--email-nil').addClass('active');
    }
    if( test_fomart_email ){
      $('.error--email-fomart').removeClass('active');
    }else{
      $('.error--email-fomart').addClass('active');
    }
    if( test_nil_password ){
      $('.error--password-nil').removeClass('active');
    }else{
      $('.error--password-nil').addClass('active');
    }
    if( test_fomart_password ){
      $('.error--password-fomart').removeClass('active');
    }else{
      $('.error--password-fomart').addClass('active');
    }
    if( test_nil_password_confirmation ){
      $('.error--password_confirmation-nil').removeClass('active');
    }else{
      $('.error--password_confirmation-nil').addClass('active');
    }
    if( test_match_password_confirmation ){
      $('.error--password_confirmation-match').removeClass('active');
    }else{
      $('.error--password_confirmation-match').addClass('active');
    }
    if( test_checked_recaptcha ){
      $('.error--recaptcha').removeClass('active');
    }else{
      $('.error--recaptcha').addClass('active');
    }
    if( test_all_member_information ){
    $('.input-field__tel').addClass('active');
    $('.progress__user').addClass('progress--done');
    $('.input-field__main').removeClass('active');
    }
  });
  $('.signup_button--tel').on('click',function(e){
    e.preventDefault(e);
    var tel_confirmation = document.getElementById('user_tel_confirmation').value;
    var test_nil_tel_confirmation = reg_not_nil.test(tel_confirmation);
    var test_fomart_tel_confirmation = reg_intger_10or11_characters.test(tel_confirmation);
    var test_all_phone_number_authentication = ( test_nil_tel_confirmation && test_fomart_tel_confirmation );
    if( test_nil_tel_confirmation ){
      $('.error--tel_confirmation-nil').removeClass('active');
    }else{
      $('.error--tel_confirmation-nil').addClass('active');
    };
    if( test_fomart_tel_confirmation ){
      $('.input-field__address').addClass('active');
      $('.progress__tel').addClass('progress--done');
      $('.input-field__tel').removeClass('active');
    }else{
      $('.error--tel_confirmation-fomart').addClass('active');
    };
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
    var building = document.getElementById('user_building').value;
    var phone_number = document.getElementById('user_phone_number').value;
    var test_nil_first_name = reg_not_nil.test(first_name);
    var test_nil_last_name = reg_not_nil.test(last_name);
    var test_nil_first_name_kana = reg_only_kana.test(first_name_kana);
    var test_nil_last_name_kana = reg_only_kana.test(last_name_kana);
    var test_nil_zip = reg_intger_7_characters.test(zip);
    var test_nil_prefecture = reg_prefecture_choice.test(prefecture);
    var test_nil_city = reg_not_nil.test(city);
    var test_nil_block = reg_not_nil.test(block);
    var test_nil_all_address = ( test_nil_first_name && test_nil_last_name && test_nil_first_name_kana && test_nil_last_name_kana && test_nil_zip && test_nil_prefecture && test_nil_city && test_nil_block );
    if( test_nil_first_name ){
      $('.error--first_name').removeClass('active');
    }else{
      $('.error--first_name').addClass('active');
    }
    if( test_nil_last_name ){
      $('.error--last_name').removeClass('active');
    }else{
      $('.error--last_name').addClass('active');
    }
    if( test_nil_first_name_kana ){
      $('.error--first_name_kana').removeClass('active');
    }else{
      $('.error--first_name_kana').addClass('active');
    }
    if( test_nil_last_name_kana ){
      $('.error--last_name_kana').removeClass('active');
    }else{
      $('.error--last_name_kana').addClass('active');
    }
    if( test_nil_zip ){
      $('.error--zip').removeClass('active');
    }else{
      $('.error--zip').addClass('active');
    }
    if( test_nil_prefecture ){
      $('.error--prefecture').removeClass('active');
    }else{
      $('.error--prefecture').addClass('active');
    }
    if( test_nil_city ){
      $('.error--city').removeClass('active');
    }else{
      $('.error--city').addClass('active');
    }
    if( test_nil_block ){
      $('.error--block').removeClass('active');
    }else{
      $('.error--block').addClass('active');
    }
    if ( test_nil_all_address ){
      $('.input-field__peymethod').addClass('active');
      $('.progress__address').addClass('progress--done');
      $('.input-field__address').removeClass('active');
    }
  $('.signup_button--card').on('click',function(e){
    e.preventDefault(e);
    });
  });
});
