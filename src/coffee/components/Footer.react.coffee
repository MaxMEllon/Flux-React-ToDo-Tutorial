ReactPropTypes = React.PropTypes

Footer = React.createClass
  propTypes:
    allTodos: ReactPropTypes.object.isRequired

  _onClearCompletedClick: ->
    TodoActions.destroyCompleted()

  render: ->
    allTodos = this.props.allTodos
    total = Object.keys(allTodos).length

    if total is 0
      return null

    completed = 0
    for todo in allTodos
      if todo.complete
        completed++

    itemLeft = total - completed
    itemsLeftPhrase = itemsLeft is 1 ? ' item ' : ' items '
    itemsLeftPhrase += 'left'

    if completed isnt 0
      clearCompletedButton =
        <button id='clear-completed'
                onClick={this._onClearCompletedClick}>
                Clear completed ({completed})
        </button>

    <footer id='footer'>
      <span id='todo-count'>
        <strong>
          {itemLeft}
        </strong>
        {itemsLeftPhrase}
      </span>
      {clearCompletedButton}
    </footer>
