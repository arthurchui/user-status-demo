class UserStatus.Views.StatusesIndex extends Backbone.View

  template: JST['statuses/index']

  events:
    'submit #new_status': 'createOrUpdateStatus'

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendStatus)
    this

  appendStatus: (status) ->
    view = new UserStatus.Views.Status(model: status)
    $('#statuses').append(view.render().el)

  createOrUpdateStatus: (event) ->
    event.preventDefault()
    attributes = message: $('#status_message').val(), active: $('#status_active').is(':checked')
    @collection.create attributes
