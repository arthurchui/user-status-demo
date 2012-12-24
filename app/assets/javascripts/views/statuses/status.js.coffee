class UserStatus.Views.Status extends Backbone.View

  template: JST['statuses/status']
  tagName: 'tr'

  initialize: ->
    @model.on('highlight', @highlight, this)

  highlight: ->
    $(@el).find('td').effect('highlight', {}, 3000)
    this

  render: ->
    $(@el).attr('id', 'status-' + @model.get('id')).addClass(if @model.get('active') then 'success' else 'error')
    $(@el).html(@template(status: @model))
    this
