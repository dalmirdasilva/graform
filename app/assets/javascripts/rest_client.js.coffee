class window.RestClientClass
  
  options:
    host: "http://192.168.6.12:3000/"
    ajaxTimeout: 10000
  
  constructor: (@host) ->
    @options.host = @host
    @confireAjax()
    
  get: (resource, params, callback) ->
    @request("GET", resource, params, callback)
    
  put: (resource, params, callback) ->
    @request("PUT", resource, params, callback)
    
  post: (resource, params, callback) ->
    @request("POST", resource, params, callback)
  
  delete: (resource, params, callback) ->
    @request("DELETE", resource, params, callback)

  # private
  
  pathJoin: (one, another) ->
    "#{one.replace /[\/\s]*$/g, ""}/#{another.replace /^[\/\s]*/g, ""}"

  request: (method, resource, params, callback) ->
    url = "#{@resorceURL(resource)}"
    $.ajax
      url: url
      data: JSON.stringify params if params
      method: method
      success: (responde) =>
        callback(responde)
        
  resorceURL: (resource) ->
    @pathJoin @options.host, resource
  
  confireAjax: () ->
    $.ajaxSetup
      contentType: 'application/json'
      async: true
      timeout: @options.ajaxTimeout
      error: (xhr, ajaxOptions, thrownError) =>
        console.log "Error: #{xhr} | #{ajaxOptions} | #{thrownError}"
      beforeSend: (xhr, settings) =>
        console.log "beforeSend"
        $('#loader').show()
        xhr.setRequestHeader "X-CSRF-Token", csrf_token
      complete: (xhr, settings) =>
        $('#loader').hide()
        console.log "complete"

$ ->
  window.RestClient = new RestClientClass("http://localhost:3000/")
