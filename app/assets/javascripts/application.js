// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require bootstrap-multiselect
//= require datatables
//= require home
//= require credits
//= require select_languages
//= require froala_editor.min


$(function() {
  $(".sort_paginate_ajax").on("click", ".pagination a", function(){
    $.getScript(this.href);
    return false;
  });
});
