# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.RulesClass

  constructor: () ->
    @setupUiElements()
    EventNotifier.attach 'addRule addOption', () =>
      @setupUiElements()
    
  setupUiElements: () ->
    @createComponents()
    @attachEventListeners()
  
  attachEventListeners: () ->
  
    @ui.editRuleButton.unbind('click').on 'click', (event) =>
      ctx = {}
      @setEventContext event, ctx
      ctx.target.disable()
      params = 
       option_id: ctx.optionId
      RestClient.get "/forms/#{ctx.formId}/questions/#{ctx.questionId}/rules/new_by_question", params, (response) =>
        rule = $ response
        ctx.optionBox.append rule
        rule.find("input").focus()
        EventNotifier.notify 'addRule'
        
    @ui.removeButton.unbind('click').on 'click', (event) =>
      ctx = {}
      @setEventContext event, ctx
      ruleBox = ctx.target.parents '.rule-box'
      ruleId = parseInt ruleBox.attr 'rule_id'
      RestClient.delete "/forms/#{ctx.formId}/questions/#{ctx.questionId}/rules/#{ruleId}.json", {}, (response) =>
        ctx.optionBox.find('.rule-box').remove()
        ctx.optionBox.find('.edit-rule').enable()
      
    @ui.saveButton.unbind('click').on 'click', (event) =>
      ctx = {}
      @setEventContext event, ctx
      ruleBox = ctx.target.parents '.rule-box'
      nextQuestionNumber = parseInt ruleBox.find('.rule-next-question-number').val() || 0
      params =
        next_question_number: nextQuestionNumber
      ruleId = parseInt ruleBox.attr 'rule_id'
      RestClient.put "/forms/#{ctx.formId}/questions/#{ctx.questionId}/rules/#{ruleId}/save_next_question.json", params, (response) =>
        console.log response
      ctx.optionBox.find('.rule-box').remove()
      ctx.optionBox.find('.edit-rule').enable()
      
    
  setEventContext: (event, ctx) ->
    ctx.target = $ event.target
    ctx.formId = window.form['id']
    ctx.optionBox = ctx.target.parents('.option-box').first()
    ctx.optionId = parseInt ctx.optionBox.attr 'option_id'
    ctx.questionId = parseInt ctx.optionBox.attr 'question_id'
  
  createComponents: () ->
    @ui =
      editRuleButton: $ '.edit-rule'
      removeButton: $ '.remove-rule'
      saveButton: $ '.save-rule'
  
$ ->
  window.Rules = new RulesClass()
