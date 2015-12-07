React    = require('react')
ReactDOM = require('react-dom')

Application = React.createClass
  render: ->
    <TodoApp />

class @TodoApplication
  @drawComponent: (id) ->
    ReactDOM.render <Application />, document.getElementById(id)

