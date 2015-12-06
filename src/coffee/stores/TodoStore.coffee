CHANGE_EVENT = 'change'

_todos = {}

_create = (text) ->
  id = 0
  _todos[id] =
    id: id
    complete: false
    text: text

_update = (id, updates) ->
  _todo[id] = Object.assign({}, _todos[id], updates)

TodoStore = Object.assign({}, EventEmitter, ->
  areAllComplete: ->
    for id in _todos
      unless _todos[id].complete
        false
    true
  all: ->
    _todos
  emitChange: ->
    this.emit(CHANGE_EVENT)
  addChangeListener: (callback) ->
    this.on(CHANGE_EVENT, callback)
  removeChangeListener: (callback) ->
    this.removeListener(CHANGE_EVENT, callback)
)

AppDispatcher.register( (action)->
  switch (action.actionType)
    when TodoConstants.TODO_CREATE
      text = action.text.trim()
      unless text is ''
        _create(text)
        TodoStore.emitChange()
      break
    when TodoConstants.TODO_UPDATE_TEXT
      text = action.text.trim()
      unless text is ''
        _update(action.id, text: text)
        TodoStore.emitChange()
      break
    else
      # no op
)

