class UserStatus.Views.StatusesIndex extends Backbone.View

  template: JST['statuses/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    console.log(@collection)
    $(@el).html(@template(statuses: @collection))
    this
