class TodoActions
  create: (text) ->
    AppDispatcher.dispatch
      actionType: TodoConstants.TODO_CREATE
      text: text

  updateText: (text) ->
    AppDispatcher.dispatch
      actionType: TodoConstants.TODO_UPDATE_TEXT
      id: id
      text: text
