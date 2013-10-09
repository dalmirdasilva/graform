# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.FormsClass

  constructor: () ->
    console.log 'Initializing forms'
    @createComponents()
    @attachEventListeners()
  
  attachEventListeners: () ->
    @ui.addQuestionButton.click (e) =>
      questionTypeId = parseInt $(e.target).attr 'question_type_id'
      RestClient.get "/forms/#{window.formId}/questions/new", null, (response) ->
        $('#form-content').append(response)
  
  createComponents: () ->
    @ui =
      addQuestionButton: $('.add-question')
  
$ ->
  Forms = new FormsClass()
