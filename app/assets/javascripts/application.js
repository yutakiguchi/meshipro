// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require jquery
//= require cocoon
//= require jquery.raty
//= require_tree .

$(function() {
  $(document).on('click', '.sign-btn-user', function() {
    $('.sign_modal_wrapper').show();
    $('.sign_modal').show();
    ($(this).hasClass('sign_up_button'))
      $('.sign_up_modal').fadeIn();
  });
});

$(function() {
  $(document).on('click', '.login-btn-user', function() {
    $('.sign_modal_wrapper').show();
    $('.sign_modal').show();
    ($(this).hasClass('sign_up_button'))
      $('.sign_in_modal').fadeIn();
  });
});

$(document).on('click', '.sign_modal_wrapper, .fa_wrapper', function() {
    $('.sign_modal_wrapper').hide();
    $('.sign_modal').hide();
    $('.sign_modal_content').hide();
})




$(function(){
 $('#restaurant_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#preview").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
});
});



$(function(){
 $('#recipe_recipe_images_images').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#preview").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  });
});

