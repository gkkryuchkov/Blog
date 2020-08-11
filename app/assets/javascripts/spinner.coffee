$(document).on 'turbolinks:request-start', ->
  console.log('page:fetch')
  $('.sk-chase').show()
$(document).on "turbolinks:request-end", ->
  console.log('page:receive')
  $('.sk-chase').hide()
