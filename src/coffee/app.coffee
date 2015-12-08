React    = require('react')
ReactDOM = require('react-dom')

Application = React.createClass
  render: ->
    <div>
      <TodoApp />
    </div>

class @TodoApplication
  @drawComponent: (id) ->
    ReactDOM.render <Application />, document.getElementById(id)

