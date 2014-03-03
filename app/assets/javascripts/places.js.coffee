# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$dropzone = $('#image-dropzone')
Dropzone.options.imageDropzone= 
    paramName: "photos[image][]" # name of file
    maxFilesize: 2 # in MB
    uploadMultiple: true
    addRemoveLinks: true
    accept: (file, done) ->
        done()

Dropzone.autoDiscover = false

