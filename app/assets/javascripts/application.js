// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

// This script adds the categories to the top_bar menu
$.getJSON('/categories.json', function(data) {
  var items = [];
  $.each(data, function(key, val) {
    items.push('<li><a href="' + val["url"].replace(".json",".html") + '">' + val["name"]  + '</a></li>');
  });
  if ($("#categories_menu").children('li').length < 3){
    $('<ul/>', {
      html: items.join('')
    }).appendTo('#categories_menu');
  }
});

$('.add_to_reading_list').submit(function(event) {
  event.preventDefault();
  $.ajax({
    type: "POST",
    url: "/reading_lists",
    data: $(this).serialize(),
    success: function(data){

    }
  });
  alert("change the button");
});














