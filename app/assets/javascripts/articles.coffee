# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

add_to_favorite = ->
  $(document).find('#add_to_favorite').click ->
    article_id = $(this).data('articleId')
    user_id = $(this).data('currentUserId')
    $.ajax({
      type: "post",
      dataType: 'script',
      url: "/articles/#{article_id}/add_to_favorite",
      data: {
            article_id: article_id,
            user_id: user_id
            },
      success:(data) ->
        alert("Успешно создано")
        false
      error:(data) ->
        alert('Ошибка')
        false
    })

remove_from_favorite = ->
  $(document).find('#remove_from_favorite').click ->
    article_id = $(this).data('articleId')
    user_id = $(this).data('currentUserId')
    $.ajax({
      type: "delete",
      dataType: 'script',
      url: "/articles/#{article_id}/remove_from_favorite",
      data: {
            article_id: article_id,
            user_id: user_id
            },
      success:(data) ->
        alert("Успешно удалено")
        false
      error:(data) ->
        alert('Ошибка')
        false
    })
$(document).on('turbolinks:load', add_to_favorite)
$(document).on('turbolinks:load', remove_from_favorite)