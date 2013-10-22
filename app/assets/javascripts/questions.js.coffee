# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.QuestionsClass

  constructor: () ->
    console.log 'Initializing forms'
    @setupUiElements()
    EventNotifier.attach "addQuestion loadPreview", () =>
      @setupUiElements()
    
  setupUiElements: () ->
    @createComponents()
    @attachEventListeners()
  
  attachEventListeners: () ->
  
    @ui.saveQuestionButton.unbind('click').on 'click', (event) =>
      ctx = {}
      @setEventContext event, ctx
      ctx.target.disable()
      questionNumber = ctx.questionBox.find('.question-number').first().val()
      questionText = ctx.questionBox.find('.question-text').first().val()
      params = 
        question:
          number: questionNumber
          text: questionText
      @ui.loaderSpin.appendTo ctx.questionBox
      ctx.target.enable()
      RestClient.put "/forms/#{ctx.formId}/questions/#{ctx.questionId}.json", params, (response) ->
        if response.success is 'OK'
          console.log "OK"
          
    @ui.removeQuestionButton.unbind('click').on 'click', (event) =>
      ctx = {}
      @setEventContext event, ctx
      ctx.target.disable()
      @ui.loaderSpin.appendTo ctx.questionBox
      RestClient.delete "/forms/#{ctx.formId}/questions/#{ctx.questionId}.json", null, (response) ->
        if response.success is 'OK'
          ctx.questionBox.fadeOut 'slow'
          window.setTimeout () ->
            ctx.questionBox.remove()
          , 500
          
    @ui.addOptionQuestionButton.unbind('click').on 'click', (event) =>
      ctx = {}
      @setEventContext event, ctx
      ctx.target.disable()
      @ui.loaderSpin.appendTo ctx.questionBox
      RestClient.get "/forms/#{ctx.formId}/questions/#{ctx.questionId}/options/new_from_type", null, (response) ->
        option = $ response
        ctx.questionBox.find('.options-container').append option
        option.find('input').focus()
        EventNotifier.notify 'addOption'
        ctx.target.enable()
        
    @ui.previewQuestionButton.unbind('click').on 'click', (event) =>
      ctx = {}
      @setEventContext event, ctx
      ctx.target.disable()
      @ui.loaderSpin.appendTo ctx.questionBox
      RestClient.get "/forms/#{ctx.formId}/questions/#{ctx.questionId}/show_preview", null, (response) ->
        preview = $ response
        ctx.questionBox.prepend preview
        EventNotifier.notify 'loadPreview'
          
    $('.hide-preview').unbind('click').on 'click', (event) =>
      ctx = {}
      @setEventContext event, ctx
      ctx.target.disable()
      questionPreviewBox = ctx.target.parents '.question-preview-box'
      questionPreviewBox.remove()
      ctx.questionBox.find('.preview-question').enable()
  
  setEventContext: (event, ctx) ->
    ctx.target = $ event.target
    ctx.formId = window.form['id']
    ctx.questionId = parseInt ctx.target.attr 'question_id'
    ctx.questionBox = ctx.target.parents '.question-box'
  
  createComponents: () ->
    @ui =
      addOptionQuestionButton: $ '.add-option'
      saveQuestionButton: $ '.save-question'
      removeQuestionButton: $ '.remove-question'
      previewQuestionButton: $ '.preview-question'
      hidePreviewButton: $ '.hide-preview'
      loaderSpin : $ '#loader'
  
$ ->
  window.Questions = new QuestionsClass()
