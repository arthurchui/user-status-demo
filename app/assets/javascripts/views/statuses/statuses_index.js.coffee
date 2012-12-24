class UserStatus.Views.StatusesIndex extends Backbone.View

  template: JST['statuses/index']

  events:
    'submit #new_status': 'createOrUpdateStatus'

  initialize: ->
    @dispatcher = new WebSocketRails('localhost:3000/websocket')
    @channel = @dispatcher.subscribe('statuses')
    @channel.bind('sync', @syncStatus)
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

  syncStatus: (status) ->
    model = new UserStatus.Models.Status(status)
    $('#status-'+model.get('id')).remove()

    view = new UserStatus.Views.Status(model: model)
    $('#statuses').prepend(view.render().el)

    model.trigger('highlight')
