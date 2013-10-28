# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.OptionClass

  constructor: () ->
    @setupUiElements()
    EventNotifier.attach 'addOption', () =>
      @setupUiElements()
    
  setupUiElements: () ->
    @createComponents()
    @attachEventListeners()
  
  attachEventListeners: () ->
  
    @ui.saveOptionButton.unbind('click').on 'click', (e) =>
      target = $(e.target)
      target.disable()
      formId = window.form['id']
      questionId = parseInt $(e.target).attr 'question_id'
      optionId = parseInt $(e.target).attr 'option_id'
      box = target.parents '.option-box' 
      optionText = box.find('.option-text').first().val()
      params = 
        option:
          text: optionText
      @ui.loaderSpin.appendTo box
      target.enable()
      RestClient.put "/forms/#{formId}/questions/#{questionId}/options/#{optionId}.json", params, (response) ->
        if response.success is 'OK'
          console.log "OK"
          
    @ui.removeOptionButton.unbind('click').on 'click', (e) =>
      target = $(e.target)
      target.disable()
      formId = window.form['id']
      questionId = parseInt $(e.target).attr 'question_id'
      optionId = parseInt $(e.target).attr 'option_id'
      box = target.parents '.option-box' 
      @ui.loaderSpin.appendTo box
      RestClient.delete "/forms/#{formId}/questions/#{questionId}/options/#{optionId}.json", null, (response) ->
        if response.success is 'OK'
          box.fadeOut 'slow'
          window.setTimeout () ->
            box.remove()
          , 500
  
  createComponents: () ->
    @ui =
      saveOptionButton: $ '.save-option'
      removeOptionButton: $ '.remove-option'
      loaderSpin : $ '#loader'
  
$ ->
  window.Option = new OptionClass()
