class EventEmitter
  constructor: ->
    @_handlers = {}

  on: (type, handler) ->
    if typeof @_handlers[type] is 'undefined'
      @_handlers[type] = []
    @_handlers[type].push(handler)

  emit: (type, data) ->
    handlers = @_handlers[type] or []
    for handler in handlers
      handler.call(this, data)

window.EventEmitter = EventEmitter
