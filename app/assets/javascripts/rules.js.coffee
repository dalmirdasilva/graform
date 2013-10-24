# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.RulesClass

  constructor: () ->
    @setupUiElements();
    
  setupUiElements: () ->
    @createComponents()
    @attachEventListeners()
  
  attachEventListeners: () ->
  
    @ui.editRuleButton.click (event) =>
      ctx = {}
      @setEventContext event, ctx
      params = 
       option_id: ctx.ruleBox
      RestClient.get "/forms/#{ctx.formId}/questions/#{ctx.questionId}/rules/new_by_question", params, (response) =>
        question = $ response
        @ui.replyQuestionBox.html question
        question.find("input").focus()
        EventNotifier.notify "nextQuestionLoaded"
  
  setEventContext: (event, ctx) ->
    ctx.target = $ event.target
    ctx.formId = window.form['id']
    ctx.ruleBox = @ui.editRuleButton.parents('.rule-box')
    ctx.optionId = parseInt  ctx.ruleBox.attr 'option_id'
    ctx.questionId = parseInt  ctx.ruleBox.attr 'question_id'
  
  createComponents: () ->
    @ui =
      editRuleButton: $ '.edit-rule'
  
$ ->
  window.Rules = new RulesClass()
