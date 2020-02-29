Turbolinks.ProgressBar.enable()
Turbolinks.setProgressBarDelay(505)
$(document).on("ready page:fetch",$(".spinner").show())
hide_spinner = ->
  console.log($(".turbolinks-progress-bar"))
  $(".turbolinks-progress-bar").hide()
$(document).on("turbolinks:load", hide_spinner)
