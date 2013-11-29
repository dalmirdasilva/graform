# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.RepliesClass

  constructor: () ->
    @setupUiElements()
    
  setupUiElements: () ->
    @createComponents()
    @attachEventListeners()

  attachEventListeners: () ->
  
    @ui.replyNextQuestionButton.click (event) =>
      ctx = {}
        
      @setEventContext event, ctx
      params =
        question_id: ctx.questionId,
        reply_id: ctx.replyId
        option_id: ctx.optionId
      
      $(".flash_error").remove()
      if ctx.optionId == 0 or ((ctx.optionId instanceof Array) && ctx.optionId.length == 0
        $(".reply-question-box").prepend("<div class='flash_error'>Você precisa responder a questão atual.</div>")
        return
      
      if ctx.optionId instanceof Array
        $.each ctx.optionId, (_, id) ->
          params.option_id = id
          RestClient.post "/forms/#{ctx.formId}/replies/#{ctx.replyId}/answers.json", params, (response) =>
            console.log response
      else
        RestClient.post "/forms/#{ctx.formId}/replies/#{ctx.replyId}/answers.json", params, (response) =>
          console.log response
      
      RestClient.get "/forms/#{ctx.formId}/questions/#{ctx.questionId}/next_question", params, (response) =>
        if response is ''
          @ui.replyQuestionBox.html "Muito obrigado."
          EventNotifier.notify "lastQuestionReached"
          $(".reply-next-question").hide()
        else
          question = $ response
          @ui.replyQuestionBox.html question
          question.find("input").focus()
          EventNotifier.notify "nextQuestionLoaded"
    
  getOptionId: (event, ctx) ->
    questionBox = @ui.replyQuestionBox.find('.question-preview-box')
    optionId = 0
    questionType = parseInt questionBox.attr 'question_type'
    if questionType == 4 or questionType == 1
      if questionType == 1
        optionText = questionBox.find("input:text").val()
      if questionType == 4
        optionText = questionBox.find("textarea").val()
      RestClient.post "/forms/#{ctx.formId}/questions/#{ctx.questionId}/options.json", {text: optionText}, (response) =>
        option = response
        optionId = option["id"]
    else if questionType == 2
      selectedOption = questionBox.find("input:radio:checked")
      optionId = selectedOption.attr 'option_id'
    else
      selectedOption = questionBox.find("input:checkbox:checked")
      idList = []
      $.each selectedOption, (_, option) ->
        idList.push $(option).attr 'option_id'
      optionId = idList
    optionId
  
  setEventContext: (event, ctx) ->
    ctx.target = $ event.target
    ctx.formId = window.form['id']
    ctx.questionId = parseInt @ui.replyQuestionBox.find('.question-preview-box').attr 'question_id'
    ctx.replyId = parseInt ctx.target.parents().find('.reply-box').attr 'reply_id'
    ctx.optionId = @getOptionId(event, ctx)
    
  createComponents: () ->
    @ui =
      replyNextQuestionButton: $ '.reply-next-question'
      replyQuestionBox: $ '.reply-question-box'
  
$ ->
  window.Replies = new RepliesClass()
