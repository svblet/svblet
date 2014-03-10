# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  # Ajax search on submit
  $('#phone_number_form').submit( ->
    $.post(this.action, $(this).serialize() + serialize_phone_number(), null, 'script')
    $('.spinner').show()
    false
  )

serialize_phone_number = ->
  phone_number = "&number="
  $("#phone_number_input_parent").find("input").each ->
    phone_number += @value
  return phone_number