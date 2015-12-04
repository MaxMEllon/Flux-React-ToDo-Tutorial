class TodoActions
  create: (text) ->
    AppDispatcher.dispatch
      actionType: TodoConstants.TODO_CREATE
      text: text

  updateText: (text) ->
    AppDispatcher.dispatch
      actionType: TodoConstants.TODO_CREATE
      id: id
      text: text
