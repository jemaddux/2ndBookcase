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
  $(this).children(".button").attr("class", "small button");
  $(this).children(".button").attr("value","Added to Reading List!");
});














