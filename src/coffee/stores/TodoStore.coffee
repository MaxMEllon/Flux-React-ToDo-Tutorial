
_todos = {}

create: (text) ->
  id = 0
  _todos[id] =
    id: id
    complete: false
    text: text

update: (id, updates) ->
  _todo[id] = Object.assign({}, _todos[id], updates)

TodoStore = Object.assign({}, EventEmitter.prototype, ->
  areAllComplete: ->
    for id in _todos
      unless _todos[id].complete
        return false
    return true
)

AppDispatcher.register( (action)->
  switch (action.actionType)
    when TodoActions.TODO_CREATE
      text = action.text.trim()
      unless text is ''
        create(text)
        TodoStore.emitChange()
    when TodoActions.TODO_UPDATE_TEXT
      text = action.text.trim()
      unless text is ''
        update(action.id, text: text)
        TodoStore.emitChange()
    else
      # no op
)

