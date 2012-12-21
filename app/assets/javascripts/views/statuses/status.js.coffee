class UserStatus.Views.Status extends Backbone.View

  template: JST['statuses/status']
  tagName: 'tr'

  render: ->
    $(@el).attr('id', 'status-' + @model.get('id')).addClass(if @model.get('active') then 'success' else 'error')
    $(@el).html(@template(status: @model))
    this
