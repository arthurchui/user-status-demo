class UserStatus.Routers.Statuses extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new UserStatus.Collections.Statuses()
    @collection.fetch()

  index: ->
    view = new UserStatus.Views.StatusesIndex(collection: @collection)
    $('#main-content').html(view.render().el)
