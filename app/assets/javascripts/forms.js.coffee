# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.FormsClass

  constructor: () ->
    @setupUiElements();
    
  setupUiElements: () ->
    @createComponents()
    @attachEventListeners()
  
  attachEventListeners: () ->
  
    $("#form-content").sortable()
  
    @ui.addQuestionButton.click (e) =>
      formId = window.form["id"]
      questionTypeId = parseInt $(e.target).attr 'question_type_id'
      RestClient.get "/forms/#{formId}/questions/type/#{questionTypeId}/new", null, (response) ->
        question = $ response
        $('#form-content').append question
        question.find("input").focus()
        EventNotifier.notify "addQuestion"
  
  createComponents: () ->
    @ui =
      addQuestionButton: $('.add-question')
  
$ ->
  window.Forms = new FormsClass()
