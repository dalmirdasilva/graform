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
      formId = window.form["id"]
      questionTypeId = parseInt $(e.target).attr 'question_type_id'
      RestClient.get "/forms/#{formId}/questions/type/#{questionTypeId}/new", null, (response) ->
        question = $(response)
        $('#form-content').append(question)
        question.find("input").focus()
  
  createComponents: () ->
    @ui =
      addQuestionButton: $('.add-question')
  
$ ->
  Forms = new FormsClass()
