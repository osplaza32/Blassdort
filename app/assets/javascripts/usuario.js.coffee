# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
console.log "hola"

loadFile = (event) ->
  reader = new FileReader

  reader.onload = ->
    output = document.getElementById('output')
    output.src = reader.result
    return

  reader.readAsDataURL event.target.files[0]
  return