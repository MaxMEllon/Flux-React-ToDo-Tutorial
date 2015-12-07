merge  = require('merge')
assign = require('object-assign')

CHANGE_EVENT = 'change'

_todos = {}

_create = (text) ->
  id = + new Date() + Math.floor(Math.random() * 999999).toString(36)
  _todos[id] =
    id: id
    complete: false
    text: text

_update = (id, updates) ->
  _todo[id] = assign({}, _todos[id], updates)

_updateAll = (updates) ->
  for todo in _todos
    _update(todo.id, updates)

_destroy = (id) ->
  delete _todos[id]

TodoStore = new window.EventEmitter()

merge(TodoStore,
  emitChange: ->
    @emit(CHANGE_EVENT)

  addChangeListener: (callback) ->
    @on(CHANGE_EVENT, callback)

  areAllComplete: ->
    for todo in _todos
      unless todo.complete is true
        return false
    return true

  getAll: ->
    _todos
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

