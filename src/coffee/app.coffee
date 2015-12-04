Application = React.createClass
  render: -> vk (d) ->
    d.div ->
      d.Sample

class @TodoApplication
  @drawComponent: (id) ->
    ReactDOM.render <Application />, document.getElementById(id)

