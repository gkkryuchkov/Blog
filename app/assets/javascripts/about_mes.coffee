# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

load_photo = ->
  $(document).find('#ddd') ->
    console.log(test)
#  $('.ddd').onload ->
#    file = $(this).find(".file").val()
#  $.ajax({
#  url: '/about',
#  success: $(this).find("img").attr("src", file)
#    })

$(document).on('turbolinks:load', load_photo)