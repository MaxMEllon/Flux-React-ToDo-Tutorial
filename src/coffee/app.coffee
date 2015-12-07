React    = require('react')
ReactDOM = require('react-dom')

Application = React.createClass
  render: ->
    <div>
      <Sample />
    </div>

class @TodoApplication
  @drawComponent: (id) ->
    ReactDOM.render <Application />, document.getElementById(id)

