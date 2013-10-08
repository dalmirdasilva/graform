RestClient =

  options:
    host: "http://localhost:3000/"
    ajaxTimeout: 1000
    
  flags:
   configured: false
    
  get: (resource, params, callback) ->
    $.ajax
      url: "#{@resorceURL(resource)}.js",
      data: params
      success: (responde) =>
        callback.aply(responde)
    
  post: (resource, params, callback) ->
  
  delete: (resource, params, callback) ->
    
  # private
  
  resorceURL: (resource) ->
    "#{@options.host}/#{resource}"
  
  configure: () ->
    unless @flags.configured
      @confireAjax()
      @flags.configured = true
  
  confireAjax: () ->
    $.ajaxSetup
      dataType: 'jsonp',
      contentType: 'application/json',
      async: true,
      timeout: @options.ajaxTimeout
      error: (xhr, ajaxOptions, thrownError) =>
        console.log "Error: #{xhr.statusText}"
      beforeSend: (xhr, settings) =>
        console.log "before send"
      complete: (xhr, settings) =>
        console.log "complete"
        
RestClient.configure()
