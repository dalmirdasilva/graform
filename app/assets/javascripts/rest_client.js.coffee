class window.RestClientClass
  
  options:
    host: "http://localhost:3000/"
    ajaxTimeout: 1000
  
  constructor: (@host) ->
    @options.host = @host
    @confireAjax()
    
  get: (resource, params, callback) ->
    @request("GET", resource, params, callback)
    
  post: (resource, params, callback) ->
    @request("POST", resource, params, callback)
  
  delete: (resource, params, callback) ->
    @request("DELETE", resource, params, callback)
    
  # private
  
  pathJoin: (one, another) ->
    "#{one.replace /[\/\s]*$/g, ""}/#{another.replace /^[\/\s]*/g, ""}"

  request: (method, resource, params, callback) ->
    url = "#{@resorceURL(resource)}.js"
    $.ajax
      url: url
      data: params
      method: method
      success: (responde) =>
        callback(responde)
        
  resorceURL: (resource) ->
    @pathJoin @options.host, resource
  
  confireAjax: () ->
    $.ajaxSetup
      contentType: 'text/html'
      async: true
      timeout: @options.ajaxTimeout
      error: (xhr, ajaxOptions, thrownError) =>
        console.log "Error: #{thrownError}"
      beforeSend: (xhr, settings) =>
        console.log "before send"
      complete: (xhr, settings) =>
        console.log "complete"

$ ->
  window.RestClient = new RestClientClass("http://localhost:3000/")
