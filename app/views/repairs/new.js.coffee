displayed = $('#order-item-header').is(":visible")

if displayed
  $('#order-item-box').slideUp 400, ->
    $('#order-item-header').text "Reparacion"
    $('#order-item-form').children().remove()
    $('#order-item-form').append("<%= escape_javascript(render partial: 'repairs/form', object: @repair, locals: { submit_label: "Añadir" }) %>")
    $('#order-item-box').delay(200).slideDown 400
else
  $('#order-item-header').text "Reparacion"
  $('#order-item-form').children().remove()
  $('#order-item-form').append("<%= escape_javascript(render partial: 'repairs/form', object: @repair, locals: { submit_label: "Añadir" }) %>")
  $('#order-item-box').slideDown 400
