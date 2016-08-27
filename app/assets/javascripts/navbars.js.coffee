$(document).on "turbolinks:load", ->
  $('#sidebar-toggle-btn').click (event) ->
    event.preventDefault()
    $('#container').toggleClass('sidebar-toggle')
