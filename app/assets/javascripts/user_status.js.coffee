window.UserStatus =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new UserStatus.Routers.Statuses()
    Backbone.history.start(pushState: true)

$(document).ready ->
  UserStatus.init()
