ready = ->
  if $("body").hasClass("places") and $("body").hasClass("new")
    initialize()
    # prevent locations search input field to submit form
    $("#autocomplete").keypress (e) ->
      k = e.keyCode or e.which
      e.preventDefault()  if k is 13
      return
  return

$(document).ready ready
$(document).on "page:load", ready

placeSearch = undefined
autocomplete = undefined
componentForm =
  street_number: "short_name"
  route: "long_name"
  locality: "long_name"
  administrative_area_level_1: "short_name"
  # country: "long_name"
  # postal_code: "short_name"

initialize = ->
  autocomplete = new google.maps.places.Autocomplete((document.getElementById("autocomplete")), types: ["geocode"])

  componentRestrictions = country: "ca"
  autocomplete.setComponentRestrictions componentRestrictions

  google.maps.event.addListener autocomplete, "place_changed",
    ->
        fillInAddress()
        return

  return

fillInAddress = ->
  
  # Get the place details from the autocomplete object.
  place = autocomplete.getPlace()
  for component of componentForm
    document.getElementById(component).value = ""
    document.getElementById(component).disabled = false
  
  # Get each component of the address from the place details
  # and fill the corresponding field on the form.
  i = 0

  while i < place.address_components.length
    addressType = place.address_components[i].types[0]
    if componentForm[addressType]
      val = place.address_components[i][componentForm[addressType]]
      document.getElementById(addressType).value = val
    i++
  return