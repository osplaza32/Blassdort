# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
console.log "hola "
$(document).on 'ready page:load', ->
  $('.open-door').click ->
    console.log "hola"