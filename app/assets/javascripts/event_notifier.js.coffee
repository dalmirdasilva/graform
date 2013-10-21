
window.EventNotifier =

  callbacks: new Array()
  
  _init: (name) ->
    @callbacks[name] = new Array() unless @callbacks[name]

  notify: (name) ->
    @_init name
    i = 0
    while i < @callbacks[name].length
      callback = @callbacks[name][i]
      try
        callback arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6]
      i++

  attach: (name, callback) ->
    @_init name
    @callbacks[name].push callback  if @callbacks[name]

