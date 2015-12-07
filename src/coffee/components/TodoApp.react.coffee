_getTodoState = ->
  allTodos: TodoStore.getAll()
  areAllComplete: TodoStore.areAllComplete()

TodoApp = React.createClass
  getInitalState: ->
    allTodos: TodoStore.getAll()
    areAllComplete: TodoStore.areAllComplete()

  componentDidMount: ->
    TodoStore.addChangeListener(this._onChange)

  _onChange: ->
    @setState getTodoState()

  render: ->
    <div>
      <Footer allTodos={@state.allTodos} />
    </div>
