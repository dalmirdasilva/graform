# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.RepliesClass

  constructor: () ->
    @setupUiElements();
    
  setupUiElements: () ->
    @createComponents()
    @attachEventListeners()
  
  attachEventListeners: () ->
  
    @ui.replyNextQuestionButton.click (event) =>
      ctx = {}
      @setEventContext event, ctx
      params = @getQuestionParams()
      RestClient.get "/forms/#{ctx.formId}/questions/#{ctx.questionId}/next_question", params, (response) =>
        question = $ response
        @ui.replyQuestionBox.html question
        question.find("input").focus()
        EventNotifier.notify "nextQuestionLoaded"
  
  getQuestionParams: () ->
    ""
  
  setEventContext: (event, ctx) ->
    ctx.target = $ event.target
    ctx.formId = window.form['id']
    ctx.questionId = parseInt @ui.replyQuestionBox.find('.question-preview-box').attr 'question_id'
  
  createComponents: () ->
    @ui =
      replyNextQuestionButton: $ '.reply-next-question'
      replyQuestionBox: $ '.reply-question-box'
  
$ ->
  window.Replies = new RepliesClass()
