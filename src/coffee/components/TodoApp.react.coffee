_getTodoState = ->
  allTodos: TodoStore.getAll()
  areAllComplete: TodoStore.areAllComplete()

TodoApp = React.createClass
  getInitialState: ->
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
