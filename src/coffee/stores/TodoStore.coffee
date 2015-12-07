merge = require('merge')
assign = require('object-assign')

CHANGE_EVENT = 'change'

_todos = {}

_create = (text) ->
  id = 0
  _todos[id] =
    id: id
    complete: false
    text: text

_update = (id, updates) ->
  _todo[id] = assign({}, _todos[id], updates)

TodoStore = new window.EventEmitter()

merge(TodoStore,
  emitChange: ->
    @emit(CHANGE_EVENT)

  addChangeListener: (callback) ->
    @on(CHANGE_EVENT, callback)

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

