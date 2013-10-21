# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.QuestionsClass

  constructor: () ->
    console.log 'Initializing forms'
    @setupUiElements()
    EventNotifier.attach "addQuestion", () =>
      @setupUiElements()
    
  setupUiElements: () ->
    @createComponents()
    @attachEventListeners()
  
  attachEventListeners: () ->
  
    @ui.saveQuestionButton.unbind('click').on 'click', (e) =>
      target = $(e.target)
      target.disable()
      formId = window.form['id']
      questionId = parseInt $(e.target).attr 'question_id'
      box = target.parents '.question-from-type-box' 
      questionNumber = box.find('.question-number').first().val()
      questionText = box.find('.question-text').first().val()
      params = 
        question:
          number: questionNumber
          text: questionText
      @ui.loaderSpin.appendTo box
      RestClient.put "/forms/#{formId}/questions/#{questionId}.json", params, (response) ->
        if response.status is 'OK'
          target.enable()
        
    @ui.removeQuestionButton.unbind('click').on 'click', (e) =>
      target = $(e.target)
      target.disable()
      formId = window.form['id']
      questionId = parseInt $(e.target).attr 'question_id'
      box = target.parents '.question-from-type-box'
      @ui.loaderSpin.appendTo box
      RestClient.delete "/forms/#{formId}/questions/#{questionId}.json", null, (response) ->
        if response.status is 'OK'
          box.fadeOut 'slow'
          window.setTimeout () ->
            box.remove()
          , 500
          
    @ui.addOptionQuestionButton.unbind('click').on 'click', (e) =>
      target = $(e.target)
      target.disable()
      box = target.parents '.question-from-type-box'
      formId = window.form['id']
      questionId = parseInt $(e.target).attr 'question_id'
      @ui.loaderSpin.appendTo box
      RestClient.get "/forms/#{formId}/questions/#{questionId}/options/new_from_type", null, (response) ->
        option = $ response
        box.find('.options-container').append option
        option.find("input").focus()
        target.enable()
      
  
  createComponents: () ->
    @ui =
      addOptionQuestionButton: $ '.add-option'
      saveQuestionButton: $ '.save-question'
      removeQuestionButton: $ '.remove-question'
      loaderSpin : $ '#loader'
  
$ ->
  window.Questions = new QuestionsClass()
