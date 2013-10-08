# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Forms =
  initialize: () ->
    console.log 'Initializing forms'
    $('.editor_side_bar ul li').click (e) ->
      e.preventDefault()
      $(this).tab('show')

Forms.initialize()
