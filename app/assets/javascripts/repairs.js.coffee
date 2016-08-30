$(document).on "turbolinks:load", ->
  models_first_time = true
  reviews_first_time = true
  models = null
  reviews = null
  $("#order-item-box").on('change', '#repair_brand_id', ->
    $("#repair_phone_id").val('');
    if models_first_time
      models = $("#repair_model_id").html()
      models_first_time = false
    brand = $("#repair_brand_id :selected").text()
    escaped_country = brand.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    brand_options = $(models).filter("optgroup[label='#{escaped_country}']").html()
    if brand_options
      $("#repair_model_id").html(brand_options)
      $("#repair_model_id").prop("disabled", false)
    else
      $("#repair_model_id").empty()
  )

  $("#order-item-box").on('change', '#repair_model_id', ->
    if reviews_first_time
      reviews = $("#repair_phone_id").html()
      reviews_first_time = false
    model = $("#repair_model_id :selected").text()
    escaped_model = model.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    model_options = $(reviews).filter("optgroup[label='#{escaped_model}']").html()
    if model_options
      $("#repair_phone_id").html(model_options)
      $("#repair_phone_id").prop("disabled", false)
    else
      $("#repair_phone_id").empty()
  )
